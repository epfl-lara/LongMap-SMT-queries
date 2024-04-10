; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108366 () Bool)

(assert start!108366)

(declare-fun mapIsEmpty!51881 () Bool)

(declare-fun mapRes!51881 () Bool)

(assert (=> mapIsEmpty!51881 mapRes!51881))

(declare-fun b!1278967 () Bool)

(declare-fun res!849617 () Bool)

(declare-fun e!730712 () Bool)

(assert (=> b!1278967 (=> (not res!849617) (not e!730712))))

(declare-datatypes ((array!84194 0))(
  ( (array!84195 (arr!40601 (Array (_ BitVec 32) (_ BitVec 64))) (size!41151 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84194)

(declare-datatypes ((List!28757 0))(
  ( (Nil!28754) (Cons!28753 (h!29962 (_ BitVec 64)) (t!42297 List!28757)) )
))
(declare-fun arrayNoDuplicates!0 (array!84194 (_ BitVec 32) List!28757) Bool)

(assert (=> b!1278967 (= res!849617 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28754))))

(declare-fun b!1278968 () Bool)

(declare-fun e!730714 () Bool)

(declare-fun tp_is_empty!33553 () Bool)

(assert (=> b!1278968 (= e!730714 tp_is_empty!33553)))

(declare-fun res!849614 () Bool)

(assert (=> start!108366 (=> (not res!849614) (not e!730712))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108366 (= res!849614 (validMask!0 mask!2175))))

(assert (=> start!108366 e!730712))

(assert (=> start!108366 true))

(declare-datatypes ((V!49841 0))(
  ( (V!49842 (val!16851 Int)) )
))
(declare-datatypes ((ValueCell!15878 0))(
  ( (ValueCellFull!15878 (v!19451 V!49841)) (EmptyCell!15878) )
))
(declare-datatypes ((array!84196 0))(
  ( (array!84197 (arr!40602 (Array (_ BitVec 32) ValueCell!15878)) (size!41152 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84196)

(declare-fun e!730713 () Bool)

(declare-fun array_inv!30829 (array!84196) Bool)

(assert (=> start!108366 (and (array_inv!30829 _values!1445) e!730713)))

(declare-fun array_inv!30830 (array!84194) Bool)

(assert (=> start!108366 (array_inv!30830 _keys!1741)))

(declare-fun b!1278969 () Bool)

(declare-fun res!849615 () Bool)

(assert (=> b!1278969 (=> (not res!849615) (not e!730712))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1278969 (= res!849615 (and (= (size!41152 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41151 _keys!1741) (size!41152 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!51881 () Bool)

(declare-fun tp!98855 () Bool)

(declare-fun e!730711 () Bool)

(assert (=> mapNonEmpty!51881 (= mapRes!51881 (and tp!98855 e!730711))))

(declare-fun mapKey!51881 () (_ BitVec 32))

(declare-fun mapRest!51881 () (Array (_ BitVec 32) ValueCell!15878))

(declare-fun mapValue!51881 () ValueCell!15878)

(assert (=> mapNonEmpty!51881 (= (arr!40602 _values!1445) (store mapRest!51881 mapKey!51881 mapValue!51881))))

(declare-fun b!1278970 () Bool)

(declare-fun res!849616 () Bool)

(assert (=> b!1278970 (=> (not res!849616) (not e!730712))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84194 (_ BitVec 32)) Bool)

(assert (=> b!1278970 (= res!849616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1278971 () Bool)

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1278971 (= e!730712 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41151 _keys!1741)) (bvsgt from!2144 (size!41151 _keys!1741))))))

(declare-fun b!1278972 () Bool)

(assert (=> b!1278972 (= e!730713 (and e!730714 mapRes!51881))))

(declare-fun condMapEmpty!51881 () Bool)

(declare-fun mapDefault!51881 () ValueCell!15878)

