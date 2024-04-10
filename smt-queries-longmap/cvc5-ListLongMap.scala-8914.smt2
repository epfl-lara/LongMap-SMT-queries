; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108134 () Bool)

(assert start!108134)

(declare-fun b_free!27847 () Bool)

(declare-fun b_next!27847 () Bool)

(assert (=> start!108134 (= b_free!27847 (not b_next!27847))))

(declare-fun tp!98495 () Bool)

(declare-fun b_and!45903 () Bool)

(assert (=> start!108134 (= tp!98495 b_and!45903)))

(declare-fun b!1277044 () Bool)

(declare-fun res!848626 () Bool)

(declare-fun e!729282 () Bool)

(assert (=> b!1277044 (=> (not res!848626) (not e!729282))))

(declare-datatypes ((array!83886 0))(
  ( (array!83887 (arr!40454 (Array (_ BitVec 32) (_ BitVec 64))) (size!41004 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83886)

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83886 (_ BitVec 32)) Bool)

(assert (=> b!1277044 (= res!848626 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1277045 () Bool)

(declare-fun res!848624 () Bool)

(assert (=> b!1277045 (=> (not res!848624) (not e!729282))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun defaultEntry!1195 () Int)

(declare-datatypes ((V!49633 0))(
  ( (V!49634 (val!16773 Int)) )
))
(declare-fun minValue!1129 () V!49633)

(declare-fun k!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49633)

(declare-datatypes ((ValueCell!15800 0))(
  ( (ValueCellFull!15800 (v!19370 V!49633)) (EmptyCell!15800) )
))
(declare-datatypes ((array!83888 0))(
  ( (array!83889 (arr!40455 (Array (_ BitVec 32) ValueCell!15800)) (size!41005 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83888)

(declare-datatypes ((tuple2!21514 0))(
  ( (tuple2!21515 (_1!10768 (_ BitVec 64)) (_2!10768 V!49633)) )
))
(declare-datatypes ((List!28690 0))(
  ( (Nil!28687) (Cons!28686 (h!29895 tuple2!21514) (t!42226 List!28690)) )
))
(declare-datatypes ((ListLongMap!19171 0))(
  ( (ListLongMap!19172 (toList!9601 List!28690)) )
))
(declare-fun contains!7710 (ListLongMap!19171 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4685 (array!83886 array!83888 (_ BitVec 32) (_ BitVec 32) V!49633 V!49633 (_ BitVec 32) Int) ListLongMap!19171)

(assert (=> b!1277045 (= res!848624 (contains!7710 (getCurrentListMap!4685 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k!1053))))

(declare-fun b!1277046 () Bool)

(declare-fun res!848628 () Bool)

(assert (=> b!1277046 (=> (not res!848628) (not e!729282))))

(assert (=> b!1277046 (= res!848628 (and (= (size!41005 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!41004 _keys!1427) (size!41005 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1277047 () Bool)

(declare-fun e!729278 () Bool)

(declare-fun tp_is_empty!33397 () Bool)

(assert (=> b!1277047 (= e!729278 tp_is_empty!33397)))

(declare-fun res!848627 () Bool)

(assert (=> start!108134 (=> (not res!848627) (not e!729282))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108134 (= res!848627 (validMask!0 mask!1805))))

(assert (=> start!108134 e!729282))

(assert (=> start!108134 true))

(assert (=> start!108134 tp!98495))

(assert (=> start!108134 tp_is_empty!33397))

(declare-fun e!729277 () Bool)

(declare-fun array_inv!30737 (array!83888) Bool)

(assert (=> start!108134 (and (array_inv!30737 _values!1187) e!729277)))

(declare-fun array_inv!30738 (array!83886) Bool)

(assert (=> start!108134 (array_inv!30738 _keys!1427)))

(declare-fun b!1277048 () Bool)

(declare-fun e!729281 () Bool)

(assert (=> b!1277048 (= e!729281 tp_is_empty!33397)))

(declare-fun b!1277049 () Bool)

(declare-fun res!848625 () Bool)

(assert (=> b!1277049 (=> (not res!848625) (not e!729282))))

(declare-datatypes ((List!28691 0))(
  ( (Nil!28688) (Cons!28687 (h!29896 (_ BitVec 64)) (t!42227 List!28691)) )
))
(declare-fun arrayNoDuplicates!0 (array!83886 (_ BitVec 32) List!28691) Bool)

(assert (=> b!1277049 (= res!848625 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28688))))

(declare-fun b!1277050 () Bool)

(declare-fun e!729280 () Bool)

(assert (=> b!1277050 (= e!729280 (ite (= k!1053 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1108 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1108 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!51626 () Bool)

(declare-fun mapRes!51626 () Bool)

(assert (=> mapIsEmpty!51626 mapRes!51626))

(declare-fun b!1277051 () Bool)

(declare-fun lt!575566 () Bool)

(assert (=> b!1277051 (= e!729282 (not (or lt!575566 (bvslt (size!41004 _keys!1427) #b01111111111111111111111111111111))))))

(assert (=> b!1277051 e!729280))

(declare-fun c!123954 () Bool)

(assert (=> b!1277051 (= c!123954 (not lt!575566))))

(assert (=> b!1277051 (= lt!575566 (or (= k!1053 #b0000000000000000000000000000000000000000000000000000000000000000) (= k!1053 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!42367 0))(
  ( (Unit!42368) )
))
(declare-fun lt!575565 () Unit!42367)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!626 (array!83886 array!83888 (_ BitVec 32) (_ BitVec 32) V!49633 V!49633 (_ BitVec 64) (_ BitVec 32) Int) Unit!42367)

(assert (=> b!1277051 (= lt!575565 (lemmaListMapContainsThenArrayContainsFrom!626 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 k!1053 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun b!1277052 () Bool)

(declare-fun res!848623 () Bool)

(assert (=> b!1277052 (=> (not res!848623) (not e!729282))))

(assert (=> b!1277052 (= res!848623 (bvslt #b00000000000000000000000000000000 (size!41004 _keys!1427)))))

(declare-fun mapNonEmpty!51626 () Bool)

(declare-fun tp!98494 () Bool)

(assert (=> mapNonEmpty!51626 (= mapRes!51626 (and tp!98494 e!729278))))

(declare-fun mapValue!51626 () ValueCell!15800)

(declare-fun mapKey!51626 () (_ BitVec 32))

(declare-fun mapRest!51626 () (Array (_ BitVec 32) ValueCell!15800))

(assert (=> mapNonEmpty!51626 (= (arr!40455 _values!1187) (store mapRest!51626 mapKey!51626 mapValue!51626))))

(declare-fun b!1277053 () Bool)

(declare-fun arrayContainsKey!0 (array!83886 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1277053 (= e!729280 (arrayContainsKey!0 _keys!1427 k!1053 #b00000000000000000000000000000000))))

(declare-fun b!1277054 () Bool)

(assert (=> b!1277054 (= e!729277 (and e!729281 mapRes!51626))))

(declare-fun condMapEmpty!51626 () Bool)

(declare-fun mapDefault!51626 () ValueCell!15800)

