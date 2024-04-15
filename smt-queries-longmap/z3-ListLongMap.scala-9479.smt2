; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112482 () Bool)

(assert start!112482)

(declare-fun b_free!30877 () Bool)

(declare-fun b_next!30877 () Bool)

(assert (=> start!112482 (= b_free!30877 (not b_next!30877))))

(declare-fun tp!108269 () Bool)

(declare-fun b_and!49737 () Bool)

(assert (=> start!112482 (= tp!108269 b_and!49737)))

(declare-fun b!1333880 () Bool)

(declare-fun res!885255 () Bool)

(declare-fun e!759784 () Bool)

(assert (=> b!1333880 (=> (not res!885255) (not e!759784))))

(declare-datatypes ((array!90387 0))(
  ( (array!90388 (arr!43660 (Array (_ BitVec 32) (_ BitVec 64))) (size!44212 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90387)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90387 (_ BitVec 32)) Bool)

(assert (=> b!1333880 (= res!885255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1333881 () Bool)

(declare-fun res!885247 () Bool)

(assert (=> b!1333881 (=> (not res!885247) (not e!759784))))

(declare-datatypes ((V!54153 0))(
  ( (V!54154 (val!18468 Int)) )
))
(declare-datatypes ((ValueCell!17495 0))(
  ( (ValueCellFull!17495 (v!21104 V!54153)) (EmptyCell!17495) )
))
(declare-datatypes ((array!90389 0))(
  ( (array!90390 (arr!43661 (Array (_ BitVec 32) ValueCell!17495)) (size!44213 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90389)

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54153)

(declare-fun zeroValue!1262 () V!54153)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23872 0))(
  ( (tuple2!23873 (_1!11947 (_ BitVec 64)) (_2!11947 V!54153)) )
))
(declare-datatypes ((List!31011 0))(
  ( (Nil!31008) (Cons!31007 (h!32216 tuple2!23872) (t!45239 List!31011)) )
))
(declare-datatypes ((ListLongMap!21529 0))(
  ( (ListLongMap!21530 (toList!10780 List!31011)) )
))
(declare-fun contains!8872 (ListLongMap!21529 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5635 (array!90387 array!90389 (_ BitVec 32) (_ BitVec 32) V!54153 V!54153 (_ BitVec 32) Int) ListLongMap!21529)

(assert (=> b!1333881 (= res!885247 (contains!8872 (getCurrentListMap!5635 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1333882 () Bool)

(declare-fun res!885256 () Bool)

(declare-fun e!759786 () Bool)

(assert (=> b!1333882 (=> (not res!885256) (not e!759786))))

(assert (=> b!1333882 (= res!885256 (not (= k0!1153 (select (arr!43660 _keys!1590) from!1980))))))

(declare-fun b!1333883 () Bool)

(declare-fun res!885248 () Bool)

(assert (=> b!1333883 (=> (not res!885248) (not e!759784))))

(assert (=> b!1333883 (= res!885248 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!56854 () Bool)

(declare-fun mapRes!56854 () Bool)

(assert (=> mapIsEmpty!56854 mapRes!56854))

(declare-fun b!1333884 () Bool)

(assert (=> b!1333884 (= e!759786 (not true))))

(declare-fun lt!592051 () ListLongMap!21529)

(assert (=> b!1333884 (contains!8872 lt!592051 k0!1153)))

(declare-fun lt!592050 () V!54153)

(declare-datatypes ((Unit!43684 0))(
  ( (Unit!43685) )
))
(declare-fun lt!592049 () Unit!43684)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!292 ((_ BitVec 64) (_ BitVec 64) V!54153 ListLongMap!21529) Unit!43684)

(assert (=> b!1333884 (= lt!592049 (lemmaInListMapAfterAddingDiffThenInBefore!292 k0!1153 (select (arr!43660 _keys!1590) from!1980) lt!592050 lt!592051))))

(declare-fun mapNonEmpty!56854 () Bool)

(declare-fun tp!108268 () Bool)

(declare-fun e!759787 () Bool)

(assert (=> mapNonEmpty!56854 (= mapRes!56854 (and tp!108268 e!759787))))

(declare-fun mapKey!56854 () (_ BitVec 32))

(declare-fun mapValue!56854 () ValueCell!17495)

(declare-fun mapRest!56854 () (Array (_ BitVec 32) ValueCell!17495))

(assert (=> mapNonEmpty!56854 (= (arr!43661 _values!1320) (store mapRest!56854 mapKey!56854 mapValue!56854))))

(declare-fun b!1333885 () Bool)

(declare-fun res!885246 () Bool)

(assert (=> b!1333885 (=> (not res!885246) (not e!759784))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1333885 (= res!885246 (validKeyInArray!0 (select (arr!43660 _keys!1590) from!1980)))))

(declare-fun b!1333886 () Bool)

(declare-fun tp_is_empty!36787 () Bool)

(assert (=> b!1333886 (= e!759787 tp_is_empty!36787)))

(declare-fun b!1333888 () Bool)

(declare-fun res!885254 () Bool)

(assert (=> b!1333888 (=> (not res!885254) (not e!759784))))

(assert (=> b!1333888 (= res!885254 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44212 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1333889 () Bool)

(declare-fun res!885250 () Bool)

(assert (=> b!1333889 (=> (not res!885250) (not e!759784))))

(declare-datatypes ((List!31012 0))(
  ( (Nil!31009) (Cons!31008 (h!32217 (_ BitVec 64)) (t!45240 List!31012)) )
))
(declare-fun arrayNoDuplicates!0 (array!90387 (_ BitVec 32) List!31012) Bool)

(assert (=> b!1333889 (= res!885250 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31009))))

(declare-fun b!1333890 () Bool)

(assert (=> b!1333890 (= e!759784 e!759786)))

(declare-fun res!885253 () Bool)

(assert (=> b!1333890 (=> (not res!885253) (not e!759786))))

(declare-fun +!4742 (ListLongMap!21529 tuple2!23872) ListLongMap!21529)

(assert (=> b!1333890 (= res!885253 (contains!8872 (+!4742 lt!592051 (tuple2!23873 (select (arr!43660 _keys!1590) from!1980) lt!592050)) k0!1153))))

(declare-fun getCurrentListMapNoExtraKeys!6380 (array!90387 array!90389 (_ BitVec 32) (_ BitVec 32) V!54153 V!54153 (_ BitVec 32) Int) ListLongMap!21529)

(assert (=> b!1333890 (= lt!592051 (getCurrentListMapNoExtraKeys!6380 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun get!22031 (ValueCell!17495 V!54153) V!54153)

(declare-fun dynLambda!3672 (Int (_ BitVec 64)) V!54153)

(assert (=> b!1333890 (= lt!592050 (get!22031 (select (arr!43661 _values!1320) from!1980) (dynLambda!3672 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1333891 () Bool)

(declare-fun e!759783 () Bool)

(assert (=> b!1333891 (= e!759783 tp_is_empty!36787)))

(declare-fun b!1333892 () Bool)

(declare-fun res!885249 () Bool)

(assert (=> b!1333892 (=> (not res!885249) (not e!759784))))

(assert (=> b!1333892 (= res!885249 (and (= (size!44213 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44212 _keys!1590) (size!44213 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1333893 () Bool)

(declare-fun res!885252 () Bool)

(assert (=> b!1333893 (=> (not res!885252) (not e!759784))))

(assert (=> b!1333893 (= res!885252 (not (= (select (arr!43660 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1333887 () Bool)

(declare-fun e!759785 () Bool)

(assert (=> b!1333887 (= e!759785 (and e!759783 mapRes!56854))))

(declare-fun condMapEmpty!56854 () Bool)

(declare-fun mapDefault!56854 () ValueCell!17495)

(assert (=> b!1333887 (= condMapEmpty!56854 (= (arr!43661 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17495)) mapDefault!56854)))))

(declare-fun res!885251 () Bool)

(assert (=> start!112482 (=> (not res!885251) (not e!759784))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112482 (= res!885251 (validMask!0 mask!1998))))

(assert (=> start!112482 e!759784))

(declare-fun array_inv!33125 (array!90389) Bool)

(assert (=> start!112482 (and (array_inv!33125 _values!1320) e!759785)))

(assert (=> start!112482 true))

(declare-fun array_inv!33126 (array!90387) Bool)

(assert (=> start!112482 (array_inv!33126 _keys!1590)))

(assert (=> start!112482 tp!108269))

(assert (=> start!112482 tp_is_empty!36787))

(assert (= (and start!112482 res!885251) b!1333892))

(assert (= (and b!1333892 res!885249) b!1333880))

(assert (= (and b!1333880 res!885255) b!1333889))

(assert (= (and b!1333889 res!885250) b!1333888))

(assert (= (and b!1333888 res!885254) b!1333881))

(assert (= (and b!1333881 res!885247) b!1333893))

(assert (= (and b!1333893 res!885252) b!1333885))

(assert (= (and b!1333885 res!885246) b!1333883))

(assert (= (and b!1333883 res!885248) b!1333890))

(assert (= (and b!1333890 res!885253) b!1333882))

(assert (= (and b!1333882 res!885256) b!1333884))

(assert (= (and b!1333887 condMapEmpty!56854) mapIsEmpty!56854))

(assert (= (and b!1333887 (not condMapEmpty!56854)) mapNonEmpty!56854))

(get-info :version)

(assert (= (and mapNonEmpty!56854 ((_ is ValueCellFull!17495) mapValue!56854)) b!1333886))

(assert (= (and b!1333887 ((_ is ValueCellFull!17495) mapDefault!56854)) b!1333891))

(assert (= start!112482 b!1333887))

(declare-fun b_lambda!24073 () Bool)

(assert (=> (not b_lambda!24073) (not b!1333890)))

(declare-fun t!45238 () Bool)

(declare-fun tb!12031 () Bool)

(assert (=> (and start!112482 (= defaultEntry!1323 defaultEntry!1323) t!45238) tb!12031))

(declare-fun result!25141 () Bool)

(assert (=> tb!12031 (= result!25141 tp_is_empty!36787)))

(assert (=> b!1333890 t!45238))

(declare-fun b_and!49739 () Bool)

(assert (= b_and!49737 (and (=> t!45238 result!25141) b_and!49739)))

(declare-fun m!1221891 () Bool)

(assert (=> b!1333881 m!1221891))

(assert (=> b!1333881 m!1221891))

(declare-fun m!1221893 () Bool)

(assert (=> b!1333881 m!1221893))

(declare-fun m!1221895 () Bool)

(assert (=> b!1333882 m!1221895))

(declare-fun m!1221897 () Bool)

(assert (=> mapNonEmpty!56854 m!1221897))

(declare-fun m!1221899 () Bool)

(assert (=> b!1333880 m!1221899))

(declare-fun m!1221901 () Bool)

(assert (=> b!1333890 m!1221901))

(declare-fun m!1221903 () Bool)

(assert (=> b!1333890 m!1221903))

(assert (=> b!1333890 m!1221901))

(declare-fun m!1221905 () Bool)

(assert (=> b!1333890 m!1221905))

(declare-fun m!1221907 () Bool)

(assert (=> b!1333890 m!1221907))

(declare-fun m!1221909 () Bool)

(assert (=> b!1333890 m!1221909))

(assert (=> b!1333890 m!1221903))

(assert (=> b!1333890 m!1221907))

(declare-fun m!1221911 () Bool)

(assert (=> b!1333890 m!1221911))

(assert (=> b!1333890 m!1221895))

(declare-fun m!1221913 () Bool)

(assert (=> b!1333889 m!1221913))

(declare-fun m!1221915 () Bool)

(assert (=> start!112482 m!1221915))

(declare-fun m!1221917 () Bool)

(assert (=> start!112482 m!1221917))

(declare-fun m!1221919 () Bool)

(assert (=> start!112482 m!1221919))

(declare-fun m!1221921 () Bool)

(assert (=> b!1333884 m!1221921))

(assert (=> b!1333884 m!1221895))

(assert (=> b!1333884 m!1221895))

(declare-fun m!1221923 () Bool)

(assert (=> b!1333884 m!1221923))

(assert (=> b!1333885 m!1221895))

(assert (=> b!1333885 m!1221895))

(declare-fun m!1221925 () Bool)

(assert (=> b!1333885 m!1221925))

(assert (=> b!1333893 m!1221895))

(check-sat (not b!1333889) tp_is_empty!36787 (not b!1333885) (not b!1333890) (not b_lambda!24073) (not b_next!30877) (not b!1333880) (not start!112482) (not mapNonEmpty!56854) (not b!1333881) b_and!49739 (not b!1333884))
(check-sat b_and!49739 (not b_next!30877))
