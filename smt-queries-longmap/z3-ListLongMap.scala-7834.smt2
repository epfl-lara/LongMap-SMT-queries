; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97984 () Bool)

(assert start!97984)

(declare-fun b_free!23449 () Bool)

(declare-fun b_next!23449 () Bool)

(assert (=> start!97984 (= b_free!23449 (not b_next!23449))))

(declare-fun tp!83050 () Bool)

(declare-fun b_and!37733 () Bool)

(assert (=> start!97984 (= tp!83050 b_and!37733)))

(declare-fun b!1119171 () Bool)

(declare-fun e!637608 () Bool)

(declare-fun tp_is_empty!27979 () Bool)

(assert (=> b!1119171 (= e!637608 tp_is_empty!27979)))

(declare-fun mapNonEmpty!43786 () Bool)

(declare-fun mapRes!43786 () Bool)

(declare-fun tp!83051 () Bool)

(declare-fun e!637611 () Bool)

(assert (=> mapNonEmpty!43786 (= mapRes!43786 (and tp!83051 e!637611))))

(declare-datatypes ((V!42433 0))(
  ( (V!42434 (val!14046 Int)) )
))
(declare-datatypes ((ValueCell!13280 0))(
  ( (ValueCellFull!13280 (v!16675 V!42433)) (EmptyCell!13280) )
))
(declare-fun mapValue!43786 () ValueCell!13280)

(declare-fun mapKey!43786 () (_ BitVec 32))

(declare-datatypes ((array!72895 0))(
  ( (array!72896 (arr!35094 (Array (_ BitVec 32) ValueCell!13280)) (size!35631 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72895)

(declare-fun mapRest!43786 () (Array (_ BitVec 32) ValueCell!13280))

(assert (=> mapNonEmpty!43786 (= (arr!35094 _values!996) (store mapRest!43786 mapKey!43786 mapValue!43786))))

(declare-fun b!1119172 () Bool)

(declare-fun res!747049 () Bool)

(declare-fun e!637610 () Bool)

(assert (=> b!1119172 (=> (not res!747049) (not e!637610))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1119172 (= res!747049 (validMask!0 mask!1564))))

(declare-fun b!1119173 () Bool)

(declare-fun e!637607 () Bool)

(assert (=> b!1119173 (= e!637610 e!637607)))

(declare-fun res!747055 () Bool)

(assert (=> b!1119173 (=> (not res!747055) (not e!637607))))

(declare-datatypes ((array!72897 0))(
  ( (array!72898 (arr!35095 (Array (_ BitVec 32) (_ BitVec 64))) (size!35632 (_ BitVec 32))) )
))
(declare-fun lt!497883 () array!72897)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72897 (_ BitVec 32)) Bool)

(assert (=> b!1119173 (= res!747055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497883 mask!1564))))

(declare-fun _keys!1208 () array!72897)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1119173 (= lt!497883 (array!72898 (store (arr!35095 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35632 _keys!1208)))))

(declare-fun b!1119174 () Bool)

(declare-fun res!747047 () Bool)

(assert (=> b!1119174 (=> (not res!747047) (not e!637610))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1119174 (= res!747047 (= (select (arr!35095 _keys!1208) i!673) k0!934))))

(declare-fun b!1119175 () Bool)

(declare-fun res!747052 () Bool)

(assert (=> b!1119175 (=> (not res!747052) (not e!637610))))

(declare-datatypes ((List!24422 0))(
  ( (Nil!24419) (Cons!24418 (h!25636 (_ BitVec 64)) (t!34895 List!24422)) )
))
(declare-fun arrayNoDuplicates!0 (array!72897 (_ BitVec 32) List!24422) Bool)

(assert (=> b!1119175 (= res!747052 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24419))))

(declare-fun b!1119176 () Bool)

(declare-fun res!747045 () Bool)

(assert (=> b!1119176 (=> (not res!747045) (not e!637607))))

(assert (=> b!1119176 (= res!747045 (arrayNoDuplicates!0 lt!497883 #b00000000000000000000000000000000 Nil!24419))))

(declare-fun b!1119177 () Bool)

(declare-fun res!747048 () Bool)

(assert (=> b!1119177 (=> (not res!747048) (not e!637610))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1119177 (= res!747048 (and (= (size!35631 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35632 _keys!1208) (size!35631 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!43786 () Bool)

(assert (=> mapIsEmpty!43786 mapRes!43786))

(declare-fun b!1119178 () Bool)

(declare-fun e!637609 () Bool)

(assert (=> b!1119178 (= e!637609 (and e!637608 mapRes!43786))))

(declare-fun condMapEmpty!43786 () Bool)

(declare-fun mapDefault!43786 () ValueCell!13280)

(assert (=> b!1119178 (= condMapEmpty!43786 (= (arr!35094 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13280)) mapDefault!43786)))))

(declare-fun b!1119179 () Bool)

(declare-fun res!747046 () Bool)

(assert (=> b!1119179 (=> (not res!747046) (not e!637610))))

(assert (=> b!1119179 (= res!747046 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35632 _keys!1208))))))

(declare-fun b!1119180 () Bool)

(declare-fun res!747051 () Bool)

(assert (=> b!1119180 (=> (not res!747051) (not e!637610))))

(assert (=> b!1119180 (= res!747051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1119181 () Bool)

(declare-fun e!637605 () Bool)

(assert (=> b!1119181 (= e!637607 (not e!637605))))

(declare-fun res!747050 () Bool)

(assert (=> b!1119181 (=> res!747050 e!637605)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1119181 (= res!747050 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!72897 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1119181 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36673 0))(
  ( (Unit!36674) )
))
(declare-fun lt!497882 () Unit!36673)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72897 (_ BitVec 64) (_ BitVec 32)) Unit!36673)

(assert (=> b!1119181 (= lt!497882 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1119182 () Bool)

(declare-fun res!747053 () Bool)

(assert (=> b!1119182 (=> (not res!747053) (not e!637610))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1119182 (= res!747053 (validKeyInArray!0 k0!934))))

(declare-fun res!747054 () Bool)

(assert (=> start!97984 (=> (not res!747054) (not e!637610))))

(assert (=> start!97984 (= res!747054 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35632 _keys!1208))))))

(assert (=> start!97984 e!637610))

(assert (=> start!97984 tp_is_empty!27979))

(declare-fun array_inv!27032 (array!72897) Bool)

(assert (=> start!97984 (array_inv!27032 _keys!1208)))

(assert (=> start!97984 true))

(assert (=> start!97984 tp!83050))

(declare-fun array_inv!27033 (array!72895) Bool)

(assert (=> start!97984 (and (array_inv!27033 _values!996) e!637609)))

(declare-fun b!1119183 () Bool)

(assert (=> b!1119183 (= e!637611 tp_is_empty!27979)))

(declare-fun b!1119184 () Bool)

(assert (=> b!1119184 (= e!637605 true)))

(declare-fun zeroValue!944 () V!42433)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17632 0))(
  ( (tuple2!17633 (_1!8827 (_ BitVec 64)) (_2!8827 V!42433)) )
))
(declare-datatypes ((List!24423 0))(
  ( (Nil!24420) (Cons!24419 (h!25637 tuple2!17632) (t!34896 List!24423)) )
))
(declare-datatypes ((ListLongMap!15609 0))(
  ( (ListLongMap!15610 (toList!7820 List!24423)) )
))
(declare-fun lt!497884 () ListLongMap!15609)

(declare-fun minValue!944 () V!42433)

(declare-fun getCurrentListMapNoExtraKeys!4350 (array!72897 array!72895 (_ BitVec 32) (_ BitVec 32) V!42433 V!42433 (_ BitVec 32) Int) ListLongMap!15609)

(assert (=> b!1119184 (= lt!497884 (getCurrentListMapNoExtraKeys!4350 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!97984 res!747054) b!1119172))

(assert (= (and b!1119172 res!747049) b!1119177))

(assert (= (and b!1119177 res!747048) b!1119180))

(assert (= (and b!1119180 res!747051) b!1119175))

(assert (= (and b!1119175 res!747052) b!1119179))

(assert (= (and b!1119179 res!747046) b!1119182))

(assert (= (and b!1119182 res!747053) b!1119174))

(assert (= (and b!1119174 res!747047) b!1119173))

(assert (= (and b!1119173 res!747055) b!1119176))

(assert (= (and b!1119176 res!747045) b!1119181))

(assert (= (and b!1119181 (not res!747050)) b!1119184))

(assert (= (and b!1119178 condMapEmpty!43786) mapIsEmpty!43786))

(assert (= (and b!1119178 (not condMapEmpty!43786)) mapNonEmpty!43786))

(get-info :version)

(assert (= (and mapNonEmpty!43786 ((_ is ValueCellFull!13280) mapValue!43786)) b!1119183))

(assert (= (and b!1119178 ((_ is ValueCellFull!13280) mapDefault!43786)) b!1119171))

(assert (= start!97984 b!1119178))

(declare-fun m!1035255 () Bool)

(assert (=> b!1119180 m!1035255))

(declare-fun m!1035257 () Bool)

(assert (=> b!1119182 m!1035257))

(declare-fun m!1035259 () Bool)

(assert (=> b!1119174 m!1035259))

(declare-fun m!1035261 () Bool)

(assert (=> b!1119176 m!1035261))

(declare-fun m!1035263 () Bool)

(assert (=> b!1119175 m!1035263))

(declare-fun m!1035265 () Bool)

(assert (=> b!1119181 m!1035265))

(declare-fun m!1035267 () Bool)

(assert (=> b!1119181 m!1035267))

(declare-fun m!1035269 () Bool)

(assert (=> mapNonEmpty!43786 m!1035269))

(declare-fun m!1035271 () Bool)

(assert (=> b!1119184 m!1035271))

(declare-fun m!1035273 () Bool)

(assert (=> start!97984 m!1035273))

(declare-fun m!1035275 () Bool)

(assert (=> start!97984 m!1035275))

(declare-fun m!1035277 () Bool)

(assert (=> b!1119173 m!1035277))

(declare-fun m!1035279 () Bool)

(assert (=> b!1119173 m!1035279))

(declare-fun m!1035281 () Bool)

(assert (=> b!1119172 m!1035281))

(check-sat (not b!1119180) (not b!1119181) (not b!1119184) (not mapNonEmpty!43786) (not start!97984) (not b!1119175) tp_is_empty!27979 (not b!1119176) b_and!37733 (not b!1119182) (not b!1119173) (not b_next!23449) (not b!1119172))
(check-sat b_and!37733 (not b_next!23449))
