; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111902 () Bool)

(assert start!111902)

(declare-fun b_free!30501 () Bool)

(declare-fun b_next!30501 () Bool)

(assert (=> start!111902 (= b_free!30501 (not b_next!30501))))

(declare-fun tp!106983 () Bool)

(declare-fun b_and!49097 () Bool)

(assert (=> start!111902 (= tp!106983 b_and!49097)))

(declare-fun b!1326048 () Bool)

(declare-fun e!755856 () Bool)

(declare-fun tp_is_empty!36321 () Bool)

(assert (=> b!1326048 (= e!755856 tp_is_empty!36321)))

(declare-fun b!1326049 () Bool)

(declare-fun res!880096 () Bool)

(declare-fun e!755857 () Bool)

(assert (=> b!1326049 (=> (not res!880096) (not e!755857))))

(declare-datatypes ((array!89548 0))(
  ( (array!89549 (arr!43247 (Array (_ BitVec 32) (_ BitVec 64))) (size!43797 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89548)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53531 0))(
  ( (V!53532 (val!18235 Int)) )
))
(declare-datatypes ((ValueCell!17262 0))(
  ( (ValueCellFull!17262 (v!20868 V!53531)) (EmptyCell!17262) )
))
(declare-datatypes ((array!89550 0))(
  ( (array!89551 (arr!43248 (Array (_ BitVec 32) ValueCell!17262)) (size!43798 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89550)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1326049 (= res!880096 (and (= (size!43798 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43797 _keys!1609) (size!43798 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1326050 () Bool)

(declare-fun res!880092 () Bool)

(assert (=> b!1326050 (=> (not res!880092) (not e!755857))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89548 (_ BitVec 32)) Bool)

(assert (=> b!1326050 (= res!880092 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1326051 () Bool)

(declare-fun e!755854 () Bool)

(assert (=> b!1326051 (= e!755854 tp_is_empty!36321)))

(declare-fun b!1326052 () Bool)

(declare-fun res!880094 () Bool)

(assert (=> b!1326052 (=> (not res!880094) (not e!755857))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53531)

(declare-fun minValue!1279 () V!53531)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23524 0))(
  ( (tuple2!23525 (_1!11773 (_ BitVec 64)) (_2!11773 V!53531)) )
))
(declare-datatypes ((List!30662 0))(
  ( (Nil!30659) (Cons!30658 (h!31867 tuple2!23524) (t!44634 List!30662)) )
))
(declare-datatypes ((ListLongMap!21181 0))(
  ( (ListLongMap!21182 (toList!10606 List!30662)) )
))
(declare-fun contains!8763 (ListLongMap!21181 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5598 (array!89548 array!89550 (_ BitVec 32) (_ BitVec 32) V!53531 V!53531 (_ BitVec 32) Int) ListLongMap!21181)

(assert (=> b!1326052 (= res!880094 (contains!8763 (getCurrentListMap!5598 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1326053 () Bool)

(assert (=> b!1326053 (= e!755857 (not (bvslt from!2000 (size!43798 _values!1337))))))

(declare-fun lt!589916 () ListLongMap!21181)

(assert (=> b!1326053 (contains!8763 lt!589916 k0!1164)))

(declare-datatypes ((Unit!43686 0))(
  ( (Unit!43687) )
))
(declare-fun lt!589917 () Unit!43686)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!221 ((_ BitVec 64) (_ BitVec 64) V!53531 ListLongMap!21181) Unit!43686)

(assert (=> b!1326053 (= lt!589917 (lemmaInListMapAfterAddingDiffThenInBefore!221 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!589916))))

(declare-fun lt!589914 () ListLongMap!21181)

(assert (=> b!1326053 (contains!8763 lt!589914 k0!1164)))

(declare-fun lt!589915 () Unit!43686)

(assert (=> b!1326053 (= lt!589915 (lemmaInListMapAfterAddingDiffThenInBefore!221 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589914))))

(declare-fun +!4629 (ListLongMap!21181 tuple2!23524) ListLongMap!21181)

(assert (=> b!1326053 (= lt!589914 (+!4629 lt!589916 (tuple2!23525 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun getCurrentListMapNoExtraKeys!6267 (array!89548 array!89550 (_ BitVec 32) (_ BitVec 32) V!53531 V!53531 (_ BitVec 32) Int) ListLongMap!21181)

(declare-fun get!21790 (ValueCell!17262 V!53531) V!53531)

(declare-fun dynLambda!3568 (Int (_ BitVec 64)) V!53531)

(assert (=> b!1326053 (= lt!589916 (+!4629 (getCurrentListMapNoExtraKeys!6267 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23525 (select (arr!43247 _keys!1609) from!2000) (get!21790 (select (arr!43248 _values!1337) from!2000) (dynLambda!3568 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1326054 () Bool)

(declare-fun res!880095 () Bool)

(assert (=> b!1326054 (=> (not res!880095) (not e!755857))))

(assert (=> b!1326054 (= res!880095 (not (= (select (arr!43247 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1326055 () Bool)

(declare-fun e!755853 () Bool)

(declare-fun mapRes!56133 () Bool)

(assert (=> b!1326055 (= e!755853 (and e!755856 mapRes!56133))))

(declare-fun condMapEmpty!56133 () Bool)

(declare-fun mapDefault!56133 () ValueCell!17262)

(assert (=> b!1326055 (= condMapEmpty!56133 (= (arr!43248 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17262)) mapDefault!56133)))))

(declare-fun b!1326056 () Bool)

(declare-fun res!880089 () Bool)

(assert (=> b!1326056 (=> (not res!880089) (not e!755857))))

(assert (=> b!1326056 (= res!880089 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43797 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1326057 () Bool)

(declare-fun res!880091 () Bool)

(assert (=> b!1326057 (=> (not res!880091) (not e!755857))))

(declare-datatypes ((List!30663 0))(
  ( (Nil!30660) (Cons!30659 (h!31868 (_ BitVec 64)) (t!44635 List!30663)) )
))
(declare-fun arrayNoDuplicates!0 (array!89548 (_ BitVec 32) List!30663) Bool)

(assert (=> b!1326057 (= res!880091 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30660))))

(declare-fun b!1326058 () Bool)

(declare-fun res!880093 () Bool)

(assert (=> b!1326058 (=> (not res!880093) (not e!755857))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1326058 (= res!880093 (validKeyInArray!0 (select (arr!43247 _keys!1609) from!2000)))))

(declare-fun mapIsEmpty!56133 () Bool)

(assert (=> mapIsEmpty!56133 mapRes!56133))

(declare-fun res!880090 () Bool)

(assert (=> start!111902 (=> (not res!880090) (not e!755857))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111902 (= res!880090 (validMask!0 mask!2019))))

(assert (=> start!111902 e!755857))

(declare-fun array_inv!32645 (array!89548) Bool)

(assert (=> start!111902 (array_inv!32645 _keys!1609)))

(assert (=> start!111902 true))

(assert (=> start!111902 tp_is_empty!36321))

(declare-fun array_inv!32646 (array!89550) Bool)

(assert (=> start!111902 (and (array_inv!32646 _values!1337) e!755853)))

(assert (=> start!111902 tp!106983))

(declare-fun mapNonEmpty!56133 () Bool)

(declare-fun tp!106982 () Bool)

(assert (=> mapNonEmpty!56133 (= mapRes!56133 (and tp!106982 e!755854))))

(declare-fun mapKey!56133 () (_ BitVec 32))

(declare-fun mapRest!56133 () (Array (_ BitVec 32) ValueCell!17262))

(declare-fun mapValue!56133 () ValueCell!17262)

(assert (=> mapNonEmpty!56133 (= (arr!43248 _values!1337) (store mapRest!56133 mapKey!56133 mapValue!56133))))

(assert (= (and start!111902 res!880090) b!1326049))

(assert (= (and b!1326049 res!880096) b!1326050))

(assert (= (and b!1326050 res!880092) b!1326057))

(assert (= (and b!1326057 res!880091) b!1326056))

(assert (= (and b!1326056 res!880089) b!1326052))

(assert (= (and b!1326052 res!880094) b!1326054))

(assert (= (and b!1326054 res!880095) b!1326058))

(assert (= (and b!1326058 res!880093) b!1326053))

(assert (= (and b!1326055 condMapEmpty!56133) mapIsEmpty!56133))

(assert (= (and b!1326055 (not condMapEmpty!56133)) mapNonEmpty!56133))

(get-info :version)

(assert (= (and mapNonEmpty!56133 ((_ is ValueCellFull!17262) mapValue!56133)) b!1326051))

(assert (= (and b!1326055 ((_ is ValueCellFull!17262) mapDefault!56133)) b!1326048))

(assert (= start!111902 b!1326055))

(declare-fun b_lambda!23779 () Bool)

(assert (=> (not b_lambda!23779) (not b!1326053)))

(declare-fun t!44633 () Bool)

(declare-fun tb!11775 () Bool)

(assert (=> (and start!111902 (= defaultEntry!1340 defaultEntry!1340) t!44633) tb!11775))

(declare-fun result!24607 () Bool)

(assert (=> tb!11775 (= result!24607 tp_is_empty!36321)))

(assert (=> b!1326053 t!44633))

(declare-fun b_and!49099 () Bool)

(assert (= b_and!49097 (and (=> t!44633 result!24607) b_and!49099)))

(declare-fun m!1214969 () Bool)

(assert (=> b!1326050 m!1214969))

(declare-fun m!1214971 () Bool)

(assert (=> start!111902 m!1214971))

(declare-fun m!1214973 () Bool)

(assert (=> start!111902 m!1214973))

(declare-fun m!1214975 () Bool)

(assert (=> start!111902 m!1214975))

(declare-fun m!1214977 () Bool)

(assert (=> b!1326054 m!1214977))

(declare-fun m!1214979 () Bool)

(assert (=> mapNonEmpty!56133 m!1214979))

(assert (=> b!1326058 m!1214977))

(assert (=> b!1326058 m!1214977))

(declare-fun m!1214981 () Bool)

(assert (=> b!1326058 m!1214981))

(declare-fun m!1214983 () Bool)

(assert (=> b!1326057 m!1214983))

(declare-fun m!1214985 () Bool)

(assert (=> b!1326053 m!1214985))

(declare-fun m!1214987 () Bool)

(assert (=> b!1326053 m!1214987))

(declare-fun m!1214989 () Bool)

(assert (=> b!1326053 m!1214989))

(assert (=> b!1326053 m!1214987))

(declare-fun m!1214991 () Bool)

(assert (=> b!1326053 m!1214991))

(declare-fun m!1214993 () Bool)

(assert (=> b!1326053 m!1214993))

(declare-fun m!1214995 () Bool)

(assert (=> b!1326053 m!1214995))

(declare-fun m!1214997 () Bool)

(assert (=> b!1326053 m!1214997))

(assert (=> b!1326053 m!1214995))

(assert (=> b!1326053 m!1214989))

(declare-fun m!1214999 () Bool)

(assert (=> b!1326053 m!1214999))

(declare-fun m!1215001 () Bool)

(assert (=> b!1326053 m!1215001))

(assert (=> b!1326053 m!1214977))

(declare-fun m!1215003 () Bool)

(assert (=> b!1326053 m!1215003))

(declare-fun m!1215005 () Bool)

(assert (=> b!1326052 m!1215005))

(assert (=> b!1326052 m!1215005))

(declare-fun m!1215007 () Bool)

(assert (=> b!1326052 m!1215007))

(check-sat (not b!1326053) (not b!1326050) (not b!1326058) (not b_lambda!23779) (not b!1326052) (not b!1326057) (not b_next!30501) tp_is_empty!36321 (not mapNonEmpty!56133) b_and!49099 (not start!111902))
(check-sat b_and!49099 (not b_next!30501))
