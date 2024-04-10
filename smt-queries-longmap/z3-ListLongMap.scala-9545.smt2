; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113134 () Bool)

(assert start!113134)

(declare-fun b_free!31185 () Bool)

(declare-fun b_next!31185 () Bool)

(assert (=> start!113134 (= b_free!31185 (not b_next!31185))))

(declare-fun tp!109360 () Bool)

(declare-fun b_and!50277 () Bool)

(assert (=> start!113134 (= tp!109360 b_and!50277)))

(declare-fun mapIsEmpty!57484 () Bool)

(declare-fun mapRes!57484 () Bool)

(assert (=> mapIsEmpty!57484 mapRes!57484))

(declare-fun b!1341409 () Bool)

(declare-fun e!763864 () Bool)

(declare-fun tp_is_empty!37185 () Bool)

(assert (=> b!1341409 (= e!763864 tp_is_empty!37185)))

(declare-fun b!1341410 () Bool)

(declare-fun res!889898 () Bool)

(declare-fun e!763866 () Bool)

(assert (=> b!1341410 (=> (not res!889898) (not e!763866))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1341410 (= res!889898 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1341411 () Bool)

(declare-fun res!889902 () Bool)

(assert (=> b!1341411 (=> (not res!889902) (not e!763866))))

(declare-datatypes ((array!91222 0))(
  ( (array!91223 (arr!44067 (Array (_ BitVec 32) (_ BitVec 64))) (size!44617 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91222)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91222 (_ BitVec 32)) Bool)

(assert (=> b!1341411 (= res!889902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapNonEmpty!57484 () Bool)

(declare-fun tp!109359 () Bool)

(declare-fun e!763868 () Bool)

(assert (=> mapNonEmpty!57484 (= mapRes!57484 (and tp!109359 e!763868))))

(declare-fun mapKey!57484 () (_ BitVec 32))

(declare-datatypes ((V!54683 0))(
  ( (V!54684 (val!18667 Int)) )
))
(declare-datatypes ((ValueCell!17694 0))(
  ( (ValueCellFull!17694 (v!21315 V!54683)) (EmptyCell!17694) )
))
(declare-fun mapValue!57484 () ValueCell!17694)

(declare-datatypes ((array!91224 0))(
  ( (array!91225 (arr!44068 (Array (_ BitVec 32) ValueCell!17694)) (size!44618 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91224)

(declare-fun mapRest!57484 () (Array (_ BitVec 32) ValueCell!17694))

(assert (=> mapNonEmpty!57484 (= (arr!44068 _values!1303) (store mapRest!57484 mapKey!57484 mapValue!57484))))

(declare-fun b!1341412 () Bool)

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1341412 (= e!763866 (not (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!24036 0))(
  ( (tuple2!24037 (_1!12029 (_ BitVec 64)) (_2!12029 V!54683)) )
))
(declare-datatypes ((List!31194 0))(
  ( (Nil!31191) (Cons!31190 (h!32399 tuple2!24036) (t!45590 List!31194)) )
))
(declare-datatypes ((ListLongMap!21693 0))(
  ( (ListLongMap!21694 (toList!10862 List!31194)) )
))
(declare-fun lt!594140 () ListLongMap!21693)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun contains!9038 (ListLongMap!21693 (_ BitVec 64)) Bool)

(assert (=> b!1341412 (contains!9038 lt!594140 k0!1142)))

(declare-datatypes ((Unit!44027 0))(
  ( (Unit!44028) )
))
(declare-fun lt!594141 () Unit!44027)

(declare-fun zeroValue!1245 () V!54683)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!344 ((_ BitVec 64) (_ BitVec 64) V!54683 ListLongMap!21693) Unit!44027)

(assert (=> b!1341412 (= lt!594141 (lemmaInListMapAfterAddingDiffThenInBefore!344 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594140))))

(declare-fun minValue!1245 () V!54683)

(declare-fun defaultEntry!1306 () Int)

(declare-fun +!4775 (ListLongMap!21693 tuple2!24036) ListLongMap!21693)

(declare-fun getCurrentListMapNoExtraKeys!6417 (array!91222 array!91224 (_ BitVec 32) (_ BitVec 32) V!54683 V!54683 (_ BitVec 32) Int) ListLongMap!21693)

(declare-fun get!22242 (ValueCell!17694 V!54683) V!54683)

(declare-fun dynLambda!3714 (Int (_ BitVec 64)) V!54683)

(assert (=> b!1341412 (= lt!594140 (+!4775 (getCurrentListMapNoExtraKeys!6417 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24037 (select (arr!44067 _keys!1571) from!1960) (get!22242 (select (arr!44068 _values!1303) from!1960) (dynLambda!3714 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1341413 () Bool)

(declare-fun res!889897 () Bool)

(assert (=> b!1341413 (=> (not res!889897) (not e!763866))))

(assert (=> b!1341413 (= res!889897 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44617 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1341414 () Bool)

(declare-fun res!889894 () Bool)

(assert (=> b!1341414 (=> (not res!889894) (not e!763866))))

(declare-datatypes ((List!31195 0))(
  ( (Nil!31192) (Cons!31191 (h!32400 (_ BitVec 64)) (t!45591 List!31195)) )
))
(declare-fun arrayNoDuplicates!0 (array!91222 (_ BitVec 32) List!31195) Bool)

(assert (=> b!1341414 (= res!889894 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31192))))

(declare-fun b!1341415 () Bool)

(declare-fun res!889899 () Bool)

(assert (=> b!1341415 (=> (not res!889899) (not e!763866))))

(assert (=> b!1341415 (= res!889899 (not (= (select (arr!44067 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1341416 () Bool)

(declare-fun res!889900 () Bool)

(assert (=> b!1341416 (=> (not res!889900) (not e!763866))))

(assert (=> b!1341416 (= res!889900 (and (= (size!44618 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44617 _keys!1571) (size!44618 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun res!889901 () Bool)

(assert (=> start!113134 (=> (not res!889901) (not e!763866))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113134 (= res!889901 (validMask!0 mask!1977))))

(assert (=> start!113134 e!763866))

(assert (=> start!113134 tp_is_empty!37185))

(assert (=> start!113134 true))

(declare-fun array_inv!33219 (array!91222) Bool)

(assert (=> start!113134 (array_inv!33219 _keys!1571)))

(declare-fun e!763867 () Bool)

(declare-fun array_inv!33220 (array!91224) Bool)

(assert (=> start!113134 (and (array_inv!33220 _values!1303) e!763867)))

(assert (=> start!113134 tp!109360))

(declare-fun b!1341417 () Bool)

(assert (=> b!1341417 (= e!763868 tp_is_empty!37185)))

(declare-fun b!1341418 () Bool)

(assert (=> b!1341418 (= e!763867 (and e!763864 mapRes!57484))))

(declare-fun condMapEmpty!57484 () Bool)

(declare-fun mapDefault!57484 () ValueCell!17694)

(assert (=> b!1341418 (= condMapEmpty!57484 (= (arr!44068 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17694)) mapDefault!57484)))))

(declare-fun b!1341419 () Bool)

(declare-fun res!889896 () Bool)

(assert (=> b!1341419 (=> (not res!889896) (not e!763866))))

(declare-fun getCurrentListMap!5827 (array!91222 array!91224 (_ BitVec 32) (_ BitVec 32) V!54683 V!54683 (_ BitVec 32) Int) ListLongMap!21693)

(assert (=> b!1341419 (= res!889896 (contains!9038 (getCurrentListMap!5827 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1341420 () Bool)

(declare-fun res!889895 () Bool)

(assert (=> b!1341420 (=> (not res!889895) (not e!763866))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1341420 (= res!889895 (validKeyInArray!0 (select (arr!44067 _keys!1571) from!1960)))))

(assert (= (and start!113134 res!889901) b!1341416))

(assert (= (and b!1341416 res!889900) b!1341411))

(assert (= (and b!1341411 res!889902) b!1341414))

(assert (= (and b!1341414 res!889894) b!1341413))

(assert (= (and b!1341413 res!889897) b!1341419))

(assert (= (and b!1341419 res!889896) b!1341415))

(assert (= (and b!1341415 res!889899) b!1341420))

(assert (= (and b!1341420 res!889895) b!1341410))

(assert (= (and b!1341410 res!889898) b!1341412))

(assert (= (and b!1341418 condMapEmpty!57484) mapIsEmpty!57484))

(assert (= (and b!1341418 (not condMapEmpty!57484)) mapNonEmpty!57484))

(get-info :version)

(assert (= (and mapNonEmpty!57484 ((_ is ValueCellFull!17694) mapValue!57484)) b!1341417))

(assert (= (and b!1341418 ((_ is ValueCellFull!17694) mapDefault!57484)) b!1341409))

(assert (= start!113134 b!1341418))

(declare-fun b_lambda!24361 () Bool)

(assert (=> (not b_lambda!24361) (not b!1341412)))

(declare-fun t!45589 () Bool)

(declare-fun tb!12199 () Bool)

(assert (=> (and start!113134 (= defaultEntry!1306 defaultEntry!1306) t!45589) tb!12199))

(declare-fun result!25489 () Bool)

(assert (=> tb!12199 (= result!25489 tp_is_empty!37185)))

(assert (=> b!1341412 t!45589))

(declare-fun b_and!50279 () Bool)

(assert (= b_and!50277 (and (=> t!45589 result!25489) b_and!50279)))

(declare-fun m!1229063 () Bool)

(assert (=> b!1341411 m!1229063))

(declare-fun m!1229065 () Bool)

(assert (=> mapNonEmpty!57484 m!1229065))

(declare-fun m!1229067 () Bool)

(assert (=> b!1341419 m!1229067))

(assert (=> b!1341419 m!1229067))

(declare-fun m!1229069 () Bool)

(assert (=> b!1341419 m!1229069))

(declare-fun m!1229071 () Bool)

(assert (=> start!113134 m!1229071))

(declare-fun m!1229073 () Bool)

(assert (=> start!113134 m!1229073))

(declare-fun m!1229075 () Bool)

(assert (=> start!113134 m!1229075))

(declare-fun m!1229077 () Bool)

(assert (=> b!1341420 m!1229077))

(assert (=> b!1341420 m!1229077))

(declare-fun m!1229079 () Bool)

(assert (=> b!1341420 m!1229079))

(declare-fun m!1229081 () Bool)

(assert (=> b!1341412 m!1229081))

(declare-fun m!1229083 () Bool)

(assert (=> b!1341412 m!1229083))

(declare-fun m!1229085 () Bool)

(assert (=> b!1341412 m!1229085))

(declare-fun m!1229087 () Bool)

(assert (=> b!1341412 m!1229087))

(assert (=> b!1341412 m!1229081))

(declare-fun m!1229089 () Bool)

(assert (=> b!1341412 m!1229089))

(assert (=> b!1341412 m!1229083))

(declare-fun m!1229091 () Bool)

(assert (=> b!1341412 m!1229091))

(assert (=> b!1341412 m!1229085))

(declare-fun m!1229093 () Bool)

(assert (=> b!1341412 m!1229093))

(assert (=> b!1341412 m!1229077))

(declare-fun m!1229095 () Bool)

(assert (=> b!1341414 m!1229095))

(assert (=> b!1341415 m!1229077))

(check-sat (not b!1341414) tp_is_empty!37185 (not start!113134) (not mapNonEmpty!57484) (not b!1341419) (not b_next!31185) (not b_lambda!24361) b_and!50279 (not b!1341420) (not b!1341411) (not b!1341412))
(check-sat b_and!50279 (not b_next!31185))
