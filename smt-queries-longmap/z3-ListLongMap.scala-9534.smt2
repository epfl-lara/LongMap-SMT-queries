; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113066 () Bool)

(assert start!113066)

(declare-fun b_free!31117 () Bool)

(declare-fun b_next!31117 () Bool)

(assert (=> start!113066 (= b_free!31117 (not b_next!31117))))

(declare-fun tp!109157 () Bool)

(declare-fun b_and!50129 () Bool)

(assert (=> start!113066 (= tp!109157 b_and!50129)))

(declare-fun mapNonEmpty!57382 () Bool)

(declare-fun mapRes!57382 () Bool)

(declare-fun tp!109156 () Bool)

(declare-fun e!763321 () Bool)

(assert (=> mapNonEmpty!57382 (= mapRes!57382 (and tp!109156 e!763321))))

(declare-datatypes ((V!54593 0))(
  ( (V!54594 (val!18633 Int)) )
))
(declare-datatypes ((ValueCell!17660 0))(
  ( (ValueCellFull!17660 (v!21280 V!54593)) (EmptyCell!17660) )
))
(declare-fun mapRest!57382 () (Array (_ BitVec 32) ValueCell!17660))

(declare-fun mapKey!57382 () (_ BitVec 32))

(declare-fun mapValue!57382 () ValueCell!17660)

(declare-datatypes ((array!91031 0))(
  ( (array!91032 (arr!43972 (Array (_ BitVec 32) ValueCell!17660)) (size!44524 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91031)

(assert (=> mapNonEmpty!57382 (= (arr!43972 _values!1303) (store mapRest!57382 mapKey!57382 mapValue!57382))))

(declare-fun res!888959 () Bool)

(declare-fun e!763322 () Bool)

(assert (=> start!113066 (=> (not res!888959) (not e!763322))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113066 (= res!888959 (validMask!0 mask!1977))))

(assert (=> start!113066 e!763322))

(declare-fun tp_is_empty!37117 () Bool)

(assert (=> start!113066 tp_is_empty!37117))

(assert (=> start!113066 true))

(declare-datatypes ((array!91033 0))(
  ( (array!91034 (arr!43973 (Array (_ BitVec 32) (_ BitVec 64))) (size!44525 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91033)

(declare-fun array_inv!33347 (array!91033) Bool)

(assert (=> start!113066 (array_inv!33347 _keys!1571)))

(declare-fun e!763324 () Bool)

(declare-fun array_inv!33348 (array!91031) Bool)

(assert (=> start!113066 (and (array_inv!33348 _values!1303) e!763324)))

(assert (=> start!113066 tp!109157))

(declare-fun b!1340060 () Bool)

(declare-fun res!888960 () Bool)

(assert (=> b!1340060 (=> (not res!888960) (not e!763322))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1340060 (= res!888960 (not (= (select (arr!43973 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1340061 () Bool)

(declare-fun res!888955 () Bool)

(assert (=> b!1340061 (=> (not res!888955) (not e!763322))))

(declare-fun minValue!1245 () V!54593)

(declare-fun zeroValue!1245 () V!54593)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24040 0))(
  ( (tuple2!24041 (_1!12031 (_ BitVec 64)) (_2!12031 V!54593)) )
))
(declare-datatypes ((List!31191 0))(
  ( (Nil!31188) (Cons!31187 (h!32396 tuple2!24040) (t!45515 List!31191)) )
))
(declare-datatypes ((ListLongMap!21697 0))(
  ( (ListLongMap!21698 (toList!10864 List!31191)) )
))
(declare-fun contains!8969 (ListLongMap!21697 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5717 (array!91033 array!91031 (_ BitVec 32) (_ BitVec 32) V!54593 V!54593 (_ BitVec 32) Int) ListLongMap!21697)

(assert (=> b!1340061 (= res!888955 (contains!8969 (getCurrentListMap!5717 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1340062 () Bool)

(declare-fun res!888958 () Bool)

(assert (=> b!1340062 (=> (not res!888958) (not e!763322))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1340062 (= res!888958 (validKeyInArray!0 (select (arr!43973 _keys!1571) from!1960)))))

(declare-fun b!1340063 () Bool)

(declare-fun res!888956 () Bool)

(assert (=> b!1340063 (=> (not res!888956) (not e!763322))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91033 (_ BitVec 32)) Bool)

(assert (=> b!1340063 (= res!888956 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1340064 () Bool)

(declare-fun res!888954 () Bool)

(assert (=> b!1340064 (=> (not res!888954) (not e!763322))))

(declare-datatypes ((List!31192 0))(
  ( (Nil!31189) (Cons!31188 (h!32397 (_ BitVec 64)) (t!45516 List!31192)) )
))
(declare-fun arrayNoDuplicates!0 (array!91033 (_ BitVec 32) List!31192) Bool)

(assert (=> b!1340064 (= res!888954 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31189))))

(declare-fun b!1340065 () Bool)

(declare-fun e!763325 () Bool)

(assert (=> b!1340065 (= e!763325 tp_is_empty!37117)))

(declare-fun b!1340066 () Bool)

(assert (=> b!1340066 (= e!763324 (and e!763325 mapRes!57382))))

(declare-fun condMapEmpty!57382 () Bool)

(declare-fun mapDefault!57382 () ValueCell!17660)

(assert (=> b!1340066 (= condMapEmpty!57382 (= (arr!43972 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17660)) mapDefault!57382)))))

(declare-fun b!1340067 () Bool)

(declare-fun res!888957 () Bool)

(assert (=> b!1340067 (=> (not res!888957) (not e!763322))))

(assert (=> b!1340067 (= res!888957 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44525 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1340068 () Bool)

(assert (=> b!1340068 (= e!763322 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!57382 () Bool)

(assert (=> mapIsEmpty!57382 mapRes!57382))

(declare-fun b!1340069 () Bool)

(assert (=> b!1340069 (= e!763321 tp_is_empty!37117)))

(declare-fun b!1340070 () Bool)

(declare-fun res!888961 () Bool)

(assert (=> b!1340070 (=> (not res!888961) (not e!763322))))

(assert (=> b!1340070 (= res!888961 (and (= (size!44524 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44525 _keys!1571) (size!44524 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(assert (= (and start!113066 res!888959) b!1340070))

(assert (= (and b!1340070 res!888961) b!1340063))

(assert (= (and b!1340063 res!888956) b!1340064))

(assert (= (and b!1340064 res!888954) b!1340067))

(assert (= (and b!1340067 res!888957) b!1340061))

(assert (= (and b!1340061 res!888955) b!1340060))

(assert (= (and b!1340060 res!888960) b!1340062))

(assert (= (and b!1340062 res!888958) b!1340068))

(assert (= (and b!1340066 condMapEmpty!57382) mapIsEmpty!57382))

(assert (= (and b!1340066 (not condMapEmpty!57382)) mapNonEmpty!57382))

(get-info :version)

(assert (= (and mapNonEmpty!57382 ((_ is ValueCellFull!17660) mapValue!57382)) b!1340069))

(assert (= (and b!1340066 ((_ is ValueCellFull!17660) mapDefault!57382)) b!1340065))

(assert (= start!113066 b!1340066))

(declare-fun m!1227433 () Bool)

(assert (=> b!1340062 m!1227433))

(assert (=> b!1340062 m!1227433))

(declare-fun m!1227435 () Bool)

(assert (=> b!1340062 m!1227435))

(declare-fun m!1227437 () Bool)

(assert (=> mapNonEmpty!57382 m!1227437))

(declare-fun m!1227439 () Bool)

(assert (=> b!1340064 m!1227439))

(declare-fun m!1227441 () Bool)

(assert (=> start!113066 m!1227441))

(declare-fun m!1227443 () Bool)

(assert (=> start!113066 m!1227443))

(declare-fun m!1227445 () Bool)

(assert (=> start!113066 m!1227445))

(declare-fun m!1227447 () Bool)

(assert (=> b!1340061 m!1227447))

(assert (=> b!1340061 m!1227447))

(declare-fun m!1227449 () Bool)

(assert (=> b!1340061 m!1227449))

(assert (=> b!1340060 m!1227433))

(declare-fun m!1227451 () Bool)

(assert (=> b!1340063 m!1227451))

(check-sat b_and!50129 (not b!1340064) tp_is_empty!37117 (not b!1340063) (not b_next!31117) (not start!113066) (not b!1340062) (not mapNonEmpty!57382) (not b!1340061))
(check-sat b_and!50129 (not b_next!31117))
