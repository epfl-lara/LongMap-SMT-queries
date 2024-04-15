; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!952 () Bool)

(assert start!952)

(declare-fun b_free!325 () Bool)

(declare-fun b_next!325 () Bool)

(assert (=> start!952 (= b_free!325 (not b_next!325))))

(declare-fun tp!1207 () Bool)

(declare-fun b_and!473 () Bool)

(assert (=> start!952 (= tp!1207 b_and!473)))

(declare-fun b!8113 () Bool)

(declare-fun e!4601 () Bool)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!8113 (= e!4601 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!7798 () Bool)

(declare-fun e!4598 () Bool)

(assert (=> start!952 (=> (not res!7798) (not e!4598))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!952 (= res!7798 (validMask!0 mask!2250))))

(assert (=> start!952 e!4598))

(assert (=> start!952 tp!1207))

(assert (=> start!952 true))

(declare-datatypes ((V!715 0))(
  ( (V!716 (val!207 Int)) )
))
(declare-datatypes ((ValueCell!185 0))(
  ( (ValueCellFull!185 (v!1299 V!715)) (EmptyCell!185) )
))
(declare-datatypes ((array!721 0))(
  ( (array!722 (arr!348 (Array (_ BitVec 32) ValueCell!185)) (size!410 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!721)

(declare-fun e!4595 () Bool)

(declare-fun array_inv!257 (array!721) Bool)

(assert (=> start!952 (and (array_inv!257 _values!1492) e!4595)))

(declare-fun tp_is_empty!403 () Bool)

(assert (=> start!952 tp_is_empty!403))

(declare-datatypes ((array!723 0))(
  ( (array!724 (arr!349 (Array (_ BitVec 32) (_ BitVec 64))) (size!411 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!723)

(declare-fun array_inv!258 (array!723) Bool)

(assert (=> start!952 (array_inv!258 _keys!1806)))

(declare-fun b!8114 () Bool)

(declare-fun res!7794 () Bool)

(assert (=> b!8114 (=> (not res!7794) (not e!4598))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!8114 (= res!7794 (validKeyInArray!0 k0!1278))))

(declare-fun b!8115 () Bool)

(declare-fun res!7792 () Bool)

(assert (=> b!8115 (=> (not res!7792) (not e!4598))))

(declare-datatypes ((List!242 0))(
  ( (Nil!239) (Cons!238 (h!804 (_ BitVec 64)) (t!2379 List!242)) )
))
(declare-fun arrayNoDuplicates!0 (array!723 (_ BitVec 32) List!242) Bool)

(assert (=> b!8115 (= res!7792 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!239))))

(declare-fun b!8116 () Bool)

(declare-fun res!7793 () Bool)

(assert (=> b!8116 (=> (not res!7793) (not e!4598))))

(assert (=> b!8116 (= res!7793 (and (= (size!410 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!411 _keys!1806) (size!410 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!8117 () Bool)

(declare-fun res!7797 () Bool)

(assert (=> b!8117 (=> (not res!7797) (not e!4598))))

(declare-fun zeroValue!1434 () V!715)

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!715)

(declare-datatypes ((tuple2!230 0))(
  ( (tuple2!231 (_1!115 (_ BitVec 64)) (_2!115 V!715)) )
))
(declare-datatypes ((List!243 0))(
  ( (Nil!240) (Cons!239 (h!805 tuple2!230) (t!2380 List!243)) )
))
(declare-datatypes ((ListLongMap!235 0))(
  ( (ListLongMap!236 (toList!133 List!243)) )
))
(declare-fun contains!108 (ListLongMap!235 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!92 (array!723 array!721 (_ BitVec 32) (_ BitVec 32) V!715 V!715 (_ BitVec 32) Int) ListLongMap!235)

(assert (=> b!8117 (= res!7797 (contains!108 (getCurrentListMap!92 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!8118 () Bool)

(declare-fun e!4596 () Bool)

(declare-fun mapRes!578 () Bool)

(assert (=> b!8118 (= e!4595 (and e!4596 mapRes!578))))

(declare-fun condMapEmpty!578 () Bool)

(declare-fun mapDefault!578 () ValueCell!185)

(assert (=> b!8118 (= condMapEmpty!578 (= (arr!348 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!185)) mapDefault!578)))))

(declare-fun mapIsEmpty!578 () Bool)

(assert (=> mapIsEmpty!578 mapRes!578))

(declare-fun b!8119 () Bool)

(declare-fun arrayContainsKey!0 (array!723 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!8119 (= e!4601 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!8120 () Bool)

(assert (=> b!8120 (= e!4596 tp_is_empty!403)))

(declare-fun b!8121 () Bool)

(declare-fun e!4600 () Bool)

(assert (=> b!8121 (= e!4600 tp_is_empty!403)))

(declare-fun b!8122 () Bool)

(declare-fun e!4597 () Bool)

(assert (=> b!8122 (= e!4597 (= (size!411 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250)))))

(declare-fun lt!1637 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!723 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!8122 (= lt!1637 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!8123 () Bool)

(declare-fun res!7795 () Bool)

(assert (=> b!8123 (=> (not res!7795) (not e!4598))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!723 (_ BitVec 32)) Bool)

(assert (=> b!8123 (= res!7795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!8124 () Bool)

(assert (=> b!8124 (= e!4598 (not e!4597))))

(declare-fun res!7796 () Bool)

(assert (=> b!8124 (=> res!7796 e!4597)))

(assert (=> b!8124 (= res!7796 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(assert (=> b!8124 e!4601))

(declare-fun c!569 () Bool)

(assert (=> b!8124 (= c!569 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!155 0))(
  ( (Unit!156) )
))
(declare-fun lt!1638 () Unit!155)

(declare-fun lemmaKeyInListMapIsInArray!59 (array!723 array!721 (_ BitVec 32) (_ BitVec 32) V!715 V!715 (_ BitVec 64) Int) Unit!155)

(assert (=> b!8124 (= lt!1638 (lemmaKeyInListMapIsInArray!59 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun mapNonEmpty!578 () Bool)

(declare-fun tp!1208 () Bool)

(assert (=> mapNonEmpty!578 (= mapRes!578 (and tp!1208 e!4600))))

(declare-fun mapRest!578 () (Array (_ BitVec 32) ValueCell!185))

(declare-fun mapKey!578 () (_ BitVec 32))

(declare-fun mapValue!578 () ValueCell!185)

(assert (=> mapNonEmpty!578 (= (arr!348 _values!1492) (store mapRest!578 mapKey!578 mapValue!578))))

(assert (= (and start!952 res!7798) b!8116))

(assert (= (and b!8116 res!7793) b!8123))

(assert (= (and b!8123 res!7795) b!8115))

(assert (= (and b!8115 res!7792) b!8117))

(assert (= (and b!8117 res!7797) b!8114))

(assert (= (and b!8114 res!7794) b!8124))

(assert (= (and b!8124 c!569) b!8119))

(assert (= (and b!8124 (not c!569)) b!8113))

(assert (= (and b!8124 (not res!7796)) b!8122))

(assert (= (and b!8118 condMapEmpty!578) mapIsEmpty!578))

(assert (= (and b!8118 (not condMapEmpty!578)) mapNonEmpty!578))

(get-info :version)

(assert (= (and mapNonEmpty!578 ((_ is ValueCellFull!185) mapValue!578)) b!8121))

(assert (= (and b!8118 ((_ is ValueCellFull!185) mapDefault!578)) b!8120))

(assert (= start!952 b!8118))

(declare-fun m!4973 () Bool)

(assert (=> b!8122 m!4973))

(declare-fun m!4975 () Bool)

(assert (=> b!8123 m!4975))

(declare-fun m!4977 () Bool)

(assert (=> start!952 m!4977))

(declare-fun m!4979 () Bool)

(assert (=> start!952 m!4979))

(declare-fun m!4981 () Bool)

(assert (=> start!952 m!4981))

(declare-fun m!4983 () Bool)

(assert (=> b!8114 m!4983))

(declare-fun m!4985 () Bool)

(assert (=> b!8124 m!4985))

(declare-fun m!4987 () Bool)

(assert (=> b!8124 m!4987))

(declare-fun m!4989 () Bool)

(assert (=> b!8117 m!4989))

(assert (=> b!8117 m!4989))

(declare-fun m!4991 () Bool)

(assert (=> b!8117 m!4991))

(assert (=> b!8119 m!4985))

(declare-fun m!4993 () Bool)

(assert (=> mapNonEmpty!578 m!4993))

(declare-fun m!4995 () Bool)

(assert (=> b!8115 m!4995))

(check-sat (not b!8117) (not b!8119) tp_is_empty!403 (not b!8123) (not b!8122) b_and!473 (not start!952) (not b!8115) (not b!8124) (not b_next!325) (not mapNonEmpty!578) (not b!8114))
(check-sat b_and!473 (not b_next!325))
