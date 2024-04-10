; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97780 () Bool)

(assert start!97780)

(declare-fun b_free!23481 () Bool)

(declare-fun b_next!23481 () Bool)

(assert (=> start!97780 (= b_free!23481 (not b_next!23481))))

(declare-fun tp!83146 () Bool)

(declare-fun b_and!37755 () Bool)

(assert (=> start!97780 (= tp!83146 b_and!37755)))

(declare-fun b!1118516 () Bool)

(declare-fun res!747055 () Bool)

(declare-fun e!637086 () Bool)

(assert (=> b!1118516 (=> (not res!747055) (not e!637086))))

(declare-datatypes ((array!72913 0))(
  ( (array!72914 (arr!35109 (Array (_ BitVec 32) (_ BitVec 64))) (size!35645 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72913)

(declare-datatypes ((List!24424 0))(
  ( (Nil!24421) (Cons!24420 (h!25629 (_ BitVec 64)) (t!34905 List!24424)) )
))
(declare-fun arrayNoDuplicates!0 (array!72913 (_ BitVec 32) List!24424) Bool)

(assert (=> b!1118516 (= res!747055 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24421))))

(declare-fun b!1118517 () Bool)

(declare-fun e!637089 () Bool)

(assert (=> b!1118517 (= e!637089 true)))

(declare-datatypes ((V!42475 0))(
  ( (V!42476 (val!14062 Int)) )
))
(declare-fun zeroValue!944 () V!42475)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13296 0))(
  ( (ValueCellFull!13296 (v!16695 V!42475)) (EmptyCell!13296) )
))
(declare-datatypes ((array!72915 0))(
  ( (array!72916 (arr!35110 (Array (_ BitVec 32) ValueCell!13296)) (size!35646 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72915)

(declare-fun minValue!944 () V!42475)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!17638 0))(
  ( (tuple2!17639 (_1!8830 (_ BitVec 64)) (_2!8830 V!42475)) )
))
(declare-datatypes ((List!24425 0))(
  ( (Nil!24422) (Cons!24421 (h!25630 tuple2!17638) (t!34906 List!24425)) )
))
(declare-datatypes ((ListLongMap!15607 0))(
  ( (ListLongMap!15608 (toList!7819 List!24425)) )
))
(declare-fun lt!497512 () ListLongMap!15607)

(declare-fun getCurrentListMapNoExtraKeys!4309 (array!72913 array!72915 (_ BitVec 32) (_ BitVec 32) V!42475 V!42475 (_ BitVec 32) Int) ListLongMap!15607)

(assert (=> b!1118517 (= lt!497512 (getCurrentListMapNoExtraKeys!4309 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1118518 () Bool)

(declare-fun e!637088 () Bool)

(assert (=> b!1118518 (= e!637088 (not e!637089))))

(declare-fun res!747058 () Bool)

(assert (=> b!1118518 (=> res!747058 e!637089)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1118518 (= res!747058 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72913 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1118518 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36710 0))(
  ( (Unit!36711) )
))
(declare-fun lt!497511 () Unit!36710)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72913 (_ BitVec 64) (_ BitVec 32)) Unit!36710)

(assert (=> b!1118518 (= lt!497511 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1118519 () Bool)

(declare-fun res!747061 () Bool)

(assert (=> b!1118519 (=> (not res!747061) (not e!637086))))

(assert (=> b!1118519 (= res!747061 (= (select (arr!35109 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!43834 () Bool)

(declare-fun mapRes!43834 () Bool)

(declare-fun tp!83147 () Bool)

(declare-fun e!637087 () Bool)

(assert (=> mapNonEmpty!43834 (= mapRes!43834 (and tp!83147 e!637087))))

(declare-fun mapRest!43834 () (Array (_ BitVec 32) ValueCell!13296))

(declare-fun mapKey!43834 () (_ BitVec 32))

(declare-fun mapValue!43834 () ValueCell!13296)

(assert (=> mapNonEmpty!43834 (= (arr!35110 _values!996) (store mapRest!43834 mapKey!43834 mapValue!43834))))

(declare-fun b!1118520 () Bool)

(declare-fun tp_is_empty!28011 () Bool)

(assert (=> b!1118520 (= e!637087 tp_is_empty!28011)))

(declare-fun b!1118521 () Bool)

(declare-fun res!747051 () Bool)

(assert (=> b!1118521 (=> (not res!747051) (not e!637086))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1118521 (= res!747051 (validMask!0 mask!1564))))

(declare-fun b!1118522 () Bool)

(declare-fun res!747054 () Bool)

(assert (=> b!1118522 (=> (not res!747054) (not e!637086))))

(assert (=> b!1118522 (= res!747054 (and (= (size!35646 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35645 _keys!1208) (size!35646 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1118523 () Bool)

(declare-fun res!747053 () Bool)

(assert (=> b!1118523 (=> (not res!747053) (not e!637088))))

(declare-fun lt!497513 () array!72913)

(assert (=> b!1118523 (= res!747053 (arrayNoDuplicates!0 lt!497513 #b00000000000000000000000000000000 Nil!24421))))

(declare-fun b!1118524 () Bool)

(declare-fun res!747060 () Bool)

(assert (=> b!1118524 (=> (not res!747060) (not e!637086))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72913 (_ BitVec 32)) Bool)

(assert (=> b!1118524 (= res!747060 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1118525 () Bool)

(declare-fun e!637090 () Bool)

(declare-fun e!637091 () Bool)

(assert (=> b!1118525 (= e!637090 (and e!637091 mapRes!43834))))

(declare-fun condMapEmpty!43834 () Bool)

(declare-fun mapDefault!43834 () ValueCell!13296)

(assert (=> b!1118525 (= condMapEmpty!43834 (= (arr!35110 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13296)) mapDefault!43834)))))

(declare-fun mapIsEmpty!43834 () Bool)

(assert (=> mapIsEmpty!43834 mapRes!43834))

(declare-fun b!1118526 () Bool)

(declare-fun res!747059 () Bool)

(assert (=> b!1118526 (=> (not res!747059) (not e!637086))))

(assert (=> b!1118526 (= res!747059 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35645 _keys!1208))))))

(declare-fun b!1118527 () Bool)

(assert (=> b!1118527 (= e!637086 e!637088)))

(declare-fun res!747057 () Bool)

(assert (=> b!1118527 (=> (not res!747057) (not e!637088))))

(assert (=> b!1118527 (= res!747057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497513 mask!1564))))

(assert (=> b!1118527 (= lt!497513 (array!72914 (store (arr!35109 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35645 _keys!1208)))))

(declare-fun res!747056 () Bool)

(assert (=> start!97780 (=> (not res!747056) (not e!637086))))

(assert (=> start!97780 (= res!747056 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35645 _keys!1208))))))

(assert (=> start!97780 e!637086))

(assert (=> start!97780 tp_is_empty!28011))

(declare-fun array_inv!26976 (array!72913) Bool)

(assert (=> start!97780 (array_inv!26976 _keys!1208)))

(assert (=> start!97780 true))

(assert (=> start!97780 tp!83146))

(declare-fun array_inv!26977 (array!72915) Bool)

(assert (=> start!97780 (and (array_inv!26977 _values!996) e!637090)))

(declare-fun b!1118528 () Bool)

(assert (=> b!1118528 (= e!637091 tp_is_empty!28011)))

(declare-fun b!1118529 () Bool)

(declare-fun res!747052 () Bool)

(assert (=> b!1118529 (=> (not res!747052) (not e!637086))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1118529 (= res!747052 (validKeyInArray!0 k0!934))))

(assert (= (and start!97780 res!747056) b!1118521))

(assert (= (and b!1118521 res!747051) b!1118522))

(assert (= (and b!1118522 res!747054) b!1118524))

(assert (= (and b!1118524 res!747060) b!1118516))

(assert (= (and b!1118516 res!747055) b!1118526))

(assert (= (and b!1118526 res!747059) b!1118529))

(assert (= (and b!1118529 res!747052) b!1118519))

(assert (= (and b!1118519 res!747061) b!1118527))

(assert (= (and b!1118527 res!747057) b!1118523))

(assert (= (and b!1118523 res!747053) b!1118518))

(assert (= (and b!1118518 (not res!747058)) b!1118517))

(assert (= (and b!1118525 condMapEmpty!43834) mapIsEmpty!43834))

(assert (= (and b!1118525 (not condMapEmpty!43834)) mapNonEmpty!43834))

(get-info :version)

(assert (= (and mapNonEmpty!43834 ((_ is ValueCellFull!13296) mapValue!43834)) b!1118520))

(assert (= (and b!1118525 ((_ is ValueCellFull!13296) mapDefault!43834)) b!1118528))

(assert (= start!97780 b!1118525))

(declare-fun m!1034031 () Bool)

(assert (=> b!1118521 m!1034031))

(declare-fun m!1034033 () Bool)

(assert (=> b!1118524 m!1034033))

(declare-fun m!1034035 () Bool)

(assert (=> b!1118518 m!1034035))

(declare-fun m!1034037 () Bool)

(assert (=> b!1118518 m!1034037))

(declare-fun m!1034039 () Bool)

(assert (=> b!1118517 m!1034039))

(declare-fun m!1034041 () Bool)

(assert (=> b!1118527 m!1034041))

(declare-fun m!1034043 () Bool)

(assert (=> b!1118527 m!1034043))

(declare-fun m!1034045 () Bool)

(assert (=> b!1118523 m!1034045))

(declare-fun m!1034047 () Bool)

(assert (=> b!1118529 m!1034047))

(declare-fun m!1034049 () Bool)

(assert (=> start!97780 m!1034049))

(declare-fun m!1034051 () Bool)

(assert (=> start!97780 m!1034051))

(declare-fun m!1034053 () Bool)

(assert (=> mapNonEmpty!43834 m!1034053))

(declare-fun m!1034055 () Bool)

(assert (=> b!1118516 m!1034055))

(declare-fun m!1034057 () Bool)

(assert (=> b!1118519 m!1034057))

(check-sat (not b!1118523) (not start!97780) (not b!1118516) (not b!1118524) b_and!37755 (not b!1118521) (not mapNonEmpty!43834) (not b_next!23481) (not b!1118529) tp_is_empty!28011 (not b!1118527) (not b!1118517) (not b!1118518))
(check-sat b_and!37755 (not b_next!23481))
