; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112878 () Bool)

(assert start!112878)

(declare-fun b_free!30991 () Bool)

(declare-fun b_next!30991 () Bool)

(assert (=> start!112878 (= b_free!30991 (not b_next!30991))))

(declare-fun tp!108613 () Bool)

(declare-fun b_and!49921 () Bool)

(assert (=> start!112878 (= tp!108613 b_and!49921)))

(declare-fun b!1337438 () Bool)

(declare-fun e!761799 () Bool)

(declare-fun tp_is_empty!36901 () Bool)

(assert (=> b!1337438 (= e!761799 tp_is_empty!36901)))

(declare-fun res!887217 () Bool)

(declare-fun e!761803 () Bool)

(assert (=> start!112878 (=> (not res!887217) (not e!761803))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112878 (= res!887217 (validMask!0 mask!1998))))

(assert (=> start!112878 e!761803))

(declare-datatypes ((V!54305 0))(
  ( (V!54306 (val!18525 Int)) )
))
(declare-datatypes ((ValueCell!17552 0))(
  ( (ValueCellFull!17552 (v!21160 V!54305)) (EmptyCell!17552) )
))
(declare-datatypes ((array!90775 0))(
  ( (array!90776 (arr!43848 (Array (_ BitVec 32) ValueCell!17552)) (size!44399 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90775)

(declare-fun e!761801 () Bool)

(declare-fun array_inv!33335 (array!90775) Bool)

(assert (=> start!112878 (and (array_inv!33335 _values!1320) e!761801)))

(assert (=> start!112878 true))

(declare-datatypes ((array!90777 0))(
  ( (array!90778 (arr!43849 (Array (_ BitVec 32) (_ BitVec 64))) (size!44400 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90777)

(declare-fun array_inv!33336 (array!90777) Bool)

(assert (=> start!112878 (array_inv!33336 _keys!1590)))

(assert (=> start!112878 tp!108613))

(assert (=> start!112878 tp_is_empty!36901))

(declare-fun b!1337439 () Bool)

(declare-fun res!887213 () Bool)

(assert (=> b!1337439 (=> (not res!887213) (not e!761803))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1337439 (= res!887213 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44400 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1337440 () Bool)

(declare-fun res!887215 () Bool)

(assert (=> b!1337440 (=> (not res!887215) (not e!761803))))

(assert (=> b!1337440 (= res!887215 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1337441 () Bool)

(declare-fun res!887211 () Bool)

(assert (=> b!1337441 (=> (not res!887211) (not e!761803))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1337441 (= res!887211 (validKeyInArray!0 (select (arr!43849 _keys!1590) from!1980)))))

(declare-fun mapIsEmpty!57029 () Bool)

(declare-fun mapRes!57029 () Bool)

(assert (=> mapIsEmpty!57029 mapRes!57029))

(declare-fun b!1337442 () Bool)

(assert (=> b!1337442 (= e!761803 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54305)

(declare-fun zeroValue!1262 () V!54305)

(declare-fun lt!593209 () Bool)

(declare-datatypes ((tuple2!23926 0))(
  ( (tuple2!23927 (_1!11974 (_ BitVec 64)) (_2!11974 V!54305)) )
))
(declare-datatypes ((List!31073 0))(
  ( (Nil!31070) (Cons!31069 (h!32287 tuple2!23926) (t!45337 List!31073)) )
))
(declare-datatypes ((ListLongMap!21591 0))(
  ( (ListLongMap!21592 (toList!10811 List!31073)) )
))
(declare-fun contains!8988 (ListLongMap!21591 (_ BitVec 64)) Bool)

(declare-fun +!4764 (ListLongMap!21591 tuple2!23926) ListLongMap!21591)

(declare-fun getCurrentListMapNoExtraKeys!6413 (array!90777 array!90775 (_ BitVec 32) (_ BitVec 32) V!54305 V!54305 (_ BitVec 32) Int) ListLongMap!21591)

(declare-fun get!22130 (ValueCell!17552 V!54305) V!54305)

(declare-fun dynLambda!3718 (Int (_ BitVec 64)) V!54305)

(assert (=> b!1337442 (= lt!593209 (contains!8988 (+!4764 (+!4764 (getCurrentListMapNoExtraKeys!6413 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23927 (select (arr!43849 _keys!1590) from!1980) (get!22130 (select (arr!43848 _values!1320) from!1980) (dynLambda!3718 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23927 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153))))

(declare-fun b!1337443 () Bool)

(declare-fun res!887212 () Bool)

(assert (=> b!1337443 (=> (not res!887212) (not e!761803))))

(declare-fun getCurrentListMap!5769 (array!90777 array!90775 (_ BitVec 32) (_ BitVec 32) V!54305 V!54305 (_ BitVec 32) Int) ListLongMap!21591)

(assert (=> b!1337443 (= res!887212 (contains!8988 (getCurrentListMap!5769 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun mapNonEmpty!57029 () Bool)

(declare-fun tp!108614 () Bool)

(assert (=> mapNonEmpty!57029 (= mapRes!57029 (and tp!108614 e!761799))))

(declare-fun mapKey!57029 () (_ BitVec 32))

(declare-fun mapValue!57029 () ValueCell!17552)

(declare-fun mapRest!57029 () (Array (_ BitVec 32) ValueCell!17552))

(assert (=> mapNonEmpty!57029 (= (arr!43848 _values!1320) (store mapRest!57029 mapKey!57029 mapValue!57029))))

(declare-fun b!1337444 () Bool)

(declare-fun e!761800 () Bool)

(assert (=> b!1337444 (= e!761801 (and e!761800 mapRes!57029))))

(declare-fun condMapEmpty!57029 () Bool)

(declare-fun mapDefault!57029 () ValueCell!17552)

(assert (=> b!1337444 (= condMapEmpty!57029 (= (arr!43848 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17552)) mapDefault!57029)))))

(declare-fun b!1337445 () Bool)

(declare-fun res!887216 () Bool)

(assert (=> b!1337445 (=> (not res!887216) (not e!761803))))

(assert (=> b!1337445 (= res!887216 (and (= (size!44399 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44400 _keys!1590) (size!44399 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1337446 () Bool)

(assert (=> b!1337446 (= e!761800 tp_is_empty!36901)))

(declare-fun b!1337447 () Bool)

(declare-fun res!887218 () Bool)

(assert (=> b!1337447 (=> (not res!887218) (not e!761803))))

(declare-datatypes ((List!31074 0))(
  ( (Nil!31071) (Cons!31070 (h!32288 (_ BitVec 64)) (t!45338 List!31074)) )
))
(declare-fun arrayNoDuplicates!0 (array!90777 (_ BitVec 32) List!31074) Bool)

(assert (=> b!1337447 (= res!887218 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31071))))

(declare-fun b!1337448 () Bool)

(declare-fun res!887214 () Bool)

(assert (=> b!1337448 (=> (not res!887214) (not e!761803))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90777 (_ BitVec 32)) Bool)

(assert (=> b!1337448 (= res!887214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1337449 () Bool)

(declare-fun res!887210 () Bool)

(assert (=> b!1337449 (=> (not res!887210) (not e!761803))))

(assert (=> b!1337449 (= res!887210 (not (= (select (arr!43849 _keys!1590) from!1980) k0!1153)))))

(assert (= (and start!112878 res!887217) b!1337445))

(assert (= (and b!1337445 res!887216) b!1337448))

(assert (= (and b!1337448 res!887214) b!1337447))

(assert (= (and b!1337447 res!887218) b!1337439))

(assert (= (and b!1337439 res!887213) b!1337443))

(assert (= (and b!1337443 res!887212) b!1337449))

(assert (= (and b!1337449 res!887210) b!1337441))

(assert (= (and b!1337441 res!887211) b!1337440))

(assert (= (and b!1337440 res!887215) b!1337442))

(assert (= (and b!1337444 condMapEmpty!57029) mapIsEmpty!57029))

(assert (= (and b!1337444 (not condMapEmpty!57029)) mapNonEmpty!57029))

(get-info :version)

(assert (= (and mapNonEmpty!57029 ((_ is ValueCellFull!17552) mapValue!57029)) b!1337438))

(assert (= (and b!1337444 ((_ is ValueCellFull!17552) mapDefault!57029)) b!1337446))

(assert (= start!112878 b!1337444))

(declare-fun b_lambda!24143 () Bool)

(assert (=> (not b_lambda!24143) (not b!1337442)))

(declare-fun t!45336 () Bool)

(declare-fun tb!12067 () Bool)

(assert (=> (and start!112878 (= defaultEntry!1323 defaultEntry!1323) t!45336) tb!12067))

(declare-fun result!25215 () Bool)

(assert (=> tb!12067 (= result!25215 tp_is_empty!36901)))

(assert (=> b!1337442 t!45336))

(declare-fun b_and!49923 () Bool)

(assert (= b_and!49921 (and (=> t!45336 result!25215) b_and!49923)))

(declare-fun m!1225857 () Bool)

(assert (=> b!1337449 m!1225857))

(declare-fun m!1225859 () Bool)

(assert (=> mapNonEmpty!57029 m!1225859))

(declare-fun m!1225861 () Bool)

(assert (=> start!112878 m!1225861))

(declare-fun m!1225863 () Bool)

(assert (=> start!112878 m!1225863))

(declare-fun m!1225865 () Bool)

(assert (=> start!112878 m!1225865))

(declare-fun m!1225867 () Bool)

(assert (=> b!1337448 m!1225867))

(declare-fun m!1225869 () Bool)

(assert (=> b!1337447 m!1225869))

(declare-fun m!1225871 () Bool)

(assert (=> b!1337443 m!1225871))

(assert (=> b!1337443 m!1225871))

(declare-fun m!1225873 () Bool)

(assert (=> b!1337443 m!1225873))

(declare-fun m!1225875 () Bool)

(assert (=> b!1337442 m!1225875))

(declare-fun m!1225877 () Bool)

(assert (=> b!1337442 m!1225877))

(declare-fun m!1225879 () Bool)

(assert (=> b!1337442 m!1225879))

(declare-fun m!1225881 () Bool)

(assert (=> b!1337442 m!1225881))

(declare-fun m!1225883 () Bool)

(assert (=> b!1337442 m!1225883))

(assert (=> b!1337442 m!1225877))

(declare-fun m!1225885 () Bool)

(assert (=> b!1337442 m!1225885))

(assert (=> b!1337442 m!1225875))

(assert (=> b!1337442 m!1225879))

(assert (=> b!1337442 m!1225857))

(assert (=> b!1337442 m!1225881))

(assert (=> b!1337442 m!1225885))

(declare-fun m!1225887 () Bool)

(assert (=> b!1337442 m!1225887))

(assert (=> b!1337441 m!1225857))

(assert (=> b!1337441 m!1225857))

(declare-fun m!1225889 () Bool)

(assert (=> b!1337441 m!1225889))

(check-sat (not b!1337447) (not b!1337441) (not b_lambda!24143) tp_is_empty!36901 (not b!1337442) (not b!1337443) (not mapNonEmpty!57029) (not b_next!30991) b_and!49923 (not start!112878) (not b!1337448))
(check-sat b_and!49923 (not b_next!30991))
