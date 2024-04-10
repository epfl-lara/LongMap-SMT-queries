; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108132 () Bool)

(assert start!108132)

(declare-fun b_free!27845 () Bool)

(declare-fun b_next!27845 () Bool)

(assert (=> start!108132 (= b_free!27845 (not b_next!27845))))

(declare-fun tp!98488 () Bool)

(declare-fun b_and!45901 () Bool)

(assert (=> start!108132 (= tp!98488 b_and!45901)))

(declare-fun b!1277012 () Bool)

(declare-fun e!729260 () Bool)

(declare-fun tp_is_empty!33395 () Bool)

(assert (=> b!1277012 (= e!729260 tp_is_empty!33395)))

(declare-fun b!1277013 () Bool)

(declare-fun e!729262 () Bool)

(assert (=> b!1277013 (= e!729262 (not true))))

(declare-fun e!729263 () Bool)

(assert (=> b!1277013 e!729263))

(declare-fun c!123951 () Bool)

(declare-fun k!1053 () (_ BitVec 64))

(assert (=> b!1277013 (= c!123951 (and (not (= k!1053 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1053 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun defaultEntry!1195 () Int)

(declare-datatypes ((V!49629 0))(
  ( (V!49630 (val!16772 Int)) )
))
(declare-fun minValue!1129 () V!49629)

(declare-datatypes ((Unit!42365 0))(
  ( (Unit!42366) )
))
(declare-fun lt!575560 () Unit!42365)

(declare-datatypes ((ValueCell!15799 0))(
  ( (ValueCellFull!15799 (v!19369 V!49629)) (EmptyCell!15799) )
))
(declare-datatypes ((array!83882 0))(
  ( (array!83883 (arr!40452 (Array (_ BitVec 32) ValueCell!15799)) (size!41002 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83882)

(declare-fun zeroValue!1129 () V!49629)

(declare-datatypes ((array!83884 0))(
  ( (array!83885 (arr!40453 (Array (_ BitVec 32) (_ BitVec 64))) (size!41003 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83884)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!625 (array!83884 array!83882 (_ BitVec 32) (_ BitVec 32) V!49629 V!49629 (_ BitVec 64) (_ BitVec 32) Int) Unit!42365)

(assert (=> b!1277013 (= lt!575560 (lemmaListMapContainsThenArrayContainsFrom!625 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 k!1053 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun mapIsEmpty!51623 () Bool)

(declare-fun mapRes!51623 () Bool)

(assert (=> mapIsEmpty!51623 mapRes!51623))

(declare-fun b!1277014 () Bool)

(declare-fun res!848607 () Bool)

(assert (=> b!1277014 (=> (not res!848607) (not e!729262))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83884 (_ BitVec 32)) Bool)

(assert (=> b!1277014 (= res!848607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun mapNonEmpty!51623 () Bool)

(declare-fun tp!98489 () Bool)

(declare-fun e!729259 () Bool)

(assert (=> mapNonEmpty!51623 (= mapRes!51623 (and tp!98489 e!729259))))

(declare-fun mapKey!51623 () (_ BitVec 32))

(declare-fun mapValue!51623 () ValueCell!15799)

(declare-fun mapRest!51623 () (Array (_ BitVec 32) ValueCell!15799))

(assert (=> mapNonEmpty!51623 (= (arr!40452 _values!1187) (store mapRest!51623 mapKey!51623 mapValue!51623))))

(declare-fun b!1277015 () Bool)

(declare-fun res!848610 () Bool)

(assert (=> b!1277015 (=> (not res!848610) (not e!729262))))

(declare-datatypes ((tuple2!21512 0))(
  ( (tuple2!21513 (_1!10767 (_ BitVec 64)) (_2!10767 V!49629)) )
))
(declare-datatypes ((List!28689 0))(
  ( (Nil!28686) (Cons!28685 (h!29894 tuple2!21512) (t!42225 List!28689)) )
))
(declare-datatypes ((ListLongMap!19169 0))(
  ( (ListLongMap!19170 (toList!9600 List!28689)) )
))
(declare-fun contains!7709 (ListLongMap!19169 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4684 (array!83884 array!83882 (_ BitVec 32) (_ BitVec 32) V!49629 V!49629 (_ BitVec 32) Int) ListLongMap!19169)

(assert (=> b!1277015 (= res!848610 (contains!7709 (getCurrentListMap!4684 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k!1053))))

(declare-fun b!1277016 () Bool)

(assert (=> b!1277016 (= e!729263 (ite (= k!1053 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1108 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1108 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1277017 () Bool)

(declare-fun e!729261 () Bool)

(assert (=> b!1277017 (= e!729261 (and e!729260 mapRes!51623))))

(declare-fun condMapEmpty!51623 () Bool)

(declare-fun mapDefault!51623 () ValueCell!15799)

