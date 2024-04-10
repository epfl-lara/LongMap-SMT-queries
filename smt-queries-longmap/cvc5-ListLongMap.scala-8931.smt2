; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108300 () Bool)

(assert start!108300)

(declare-fun b!1278424 () Bool)

(declare-fun e!730272 () Bool)

(declare-datatypes ((List!28739 0))(
  ( (Nil!28736) (Cons!28735 (h!29944 (_ BitVec 64)) (t!42279 List!28739)) )
))
(declare-fun contains!7736 (List!28739 (_ BitVec 64)) Bool)

(assert (=> b!1278424 (= e!730272 (contains!7736 Nil!28736 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1278425 () Bool)

(declare-fun res!849332 () Bool)

(declare-fun e!730274 () Bool)

(assert (=> b!1278425 (=> (not res!849332) (not e!730274))))

(declare-datatypes ((array!84092 0))(
  ( (array!84093 (arr!40551 (Array (_ BitVec 32) (_ BitVec 64))) (size!41101 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84092)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84092 (_ BitVec 32)) Bool)

(assert (=> b!1278425 (= res!849332 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!51797 () Bool)

(declare-fun mapRes!51797 () Bool)

(assert (=> mapIsEmpty!51797 mapRes!51797))

(declare-fun b!1278426 () Bool)

(declare-fun res!849330 () Bool)

(assert (=> b!1278426 (=> (not res!849330) (not e!730274))))

(declare-datatypes ((V!49769 0))(
  ( (V!49770 (val!16824 Int)) )
))
(declare-datatypes ((ValueCell!15851 0))(
  ( (ValueCellFull!15851 (v!19423 V!49769)) (EmptyCell!15851) )
))
(declare-datatypes ((array!84094 0))(
  ( (array!84095 (arr!40552 (Array (_ BitVec 32) ValueCell!15851)) (size!41102 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84094)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1278426 (= res!849330 (and (= (size!41102 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41101 _keys!1741) (size!41102 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1278427 () Bool)

(declare-fun e!730275 () Bool)

(declare-fun tp_is_empty!33499 () Bool)

(assert (=> b!1278427 (= e!730275 tp_is_empty!33499)))

(declare-fun b!1278428 () Bool)

(declare-fun e!730273 () Bool)

(assert (=> b!1278428 (= e!730273 (and e!730275 mapRes!51797))))

(declare-fun condMapEmpty!51797 () Bool)

(declare-fun mapDefault!51797 () ValueCell!15851)

