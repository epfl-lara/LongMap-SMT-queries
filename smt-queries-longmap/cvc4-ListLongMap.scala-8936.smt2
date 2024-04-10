; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108346 () Bool)

(assert start!108346)

(declare-fun b!1278785 () Bool)

(declare-fun res!849524 () Bool)

(declare-fun e!730561 () Bool)

(assert (=> b!1278785 (=> (not res!849524) (not e!730561))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!49813 0))(
  ( (V!49814 (val!16841 Int)) )
))
(declare-datatypes ((ValueCell!15868 0))(
  ( (ValueCellFull!15868 (v!19441 V!49813)) (EmptyCell!15868) )
))
(declare-datatypes ((array!84158 0))(
  ( (array!84159 (arr!40583 (Array (_ BitVec 32) ValueCell!15868)) (size!41133 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84158)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84160 0))(
  ( (array!84161 (arr!40584 (Array (_ BitVec 32) (_ BitVec 64))) (size!41134 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84160)

(assert (=> b!1278785 (= res!849524 (and (= (size!41133 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41134 _keys!1741) (size!41133 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1278786 () Bool)

(declare-fun e!730565 () Bool)

(declare-fun tp_is_empty!33533 () Bool)

(assert (=> b!1278786 (= e!730565 tp_is_empty!33533)))

(declare-fun b!1278787 () Bool)

(declare-fun e!730563 () Bool)

(assert (=> b!1278787 (= e!730563 tp_is_empty!33533)))

(declare-fun mapIsEmpty!51851 () Bool)

(declare-fun mapRes!51851 () Bool)

(assert (=> mapIsEmpty!51851 mapRes!51851))

(declare-fun b!1278789 () Bool)

(assert (=> b!1278789 (= e!730561 false)))

(declare-fun lt!575930 () Bool)

(declare-datatypes ((List!28751 0))(
  ( (Nil!28748) (Cons!28747 (h!29956 (_ BitVec 64)) (t!42291 List!28751)) )
))
(declare-fun arrayNoDuplicates!0 (array!84160 (_ BitVec 32) List!28751) Bool)

(assert (=> b!1278789 (= lt!575930 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28748))))

(declare-fun b!1278790 () Bool)

(declare-fun res!849522 () Bool)

(assert (=> b!1278790 (=> (not res!849522) (not e!730561))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84160 (_ BitVec 32)) Bool)

(assert (=> b!1278790 (= res!849522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!51851 () Bool)

(declare-fun tp!98825 () Bool)

(assert (=> mapNonEmpty!51851 (= mapRes!51851 (and tp!98825 e!730565))))

(declare-fun mapValue!51851 () ValueCell!15868)

(declare-fun mapKey!51851 () (_ BitVec 32))

(declare-fun mapRest!51851 () (Array (_ BitVec 32) ValueCell!15868))

(assert (=> mapNonEmpty!51851 (= (arr!40583 _values!1445) (store mapRest!51851 mapKey!51851 mapValue!51851))))

(declare-fun b!1278788 () Bool)

(declare-fun e!730564 () Bool)

(assert (=> b!1278788 (= e!730564 (and e!730563 mapRes!51851))))

(declare-fun condMapEmpty!51851 () Bool)

(declare-fun mapDefault!51851 () ValueCell!15868)

