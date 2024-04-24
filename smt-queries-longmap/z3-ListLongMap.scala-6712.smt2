; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84412 () Bool)

(assert start!84412)

(declare-fun b_free!19945 () Bool)

(declare-fun b_next!19945 () Bool)

(assert (=> start!84412 (= b_free!19945 (not b_next!19945))))

(declare-fun tp!69440 () Bool)

(declare-fun b_and!31977 () Bool)

(assert (=> start!84412 (= tp!69440 b_and!31977)))

(declare-fun b!986480 () Bool)

(declare-fun res!659861 () Bool)

(declare-fun e!556134 () Bool)

(assert (=> b!986480 (=> (not res!659861) (not e!556134))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!62108 0))(
  ( (array!62109 (arr!29907 (Array (_ BitVec 32) (_ BitVec 64))) (size!30387 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62108)

(assert (=> b!986480 (= res!659861 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30387 _keys!1544))))))

(declare-fun b!986482 () Bool)

(declare-fun e!556131 () Bool)

(declare-fun tp_is_empty!23047 () Bool)

(assert (=> b!986482 (= e!556131 tp_is_empty!23047)))

(declare-fun mapIsEmpty!36599 () Bool)

(declare-fun mapRes!36599 () Bool)

(assert (=> mapIsEmpty!36599 mapRes!36599))

(declare-fun b!986483 () Bool)

(declare-fun e!556132 () Bool)

(assert (=> b!986483 (= e!556134 e!556132)))

(declare-fun res!659857 () Bool)

(assert (=> b!986483 (=> (not res!659857) (not e!556132))))

(assert (=> b!986483 (= res!659857 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29907 _keys!1544) from!1932))))))

(declare-datatypes ((V!35713 0))(
  ( (V!35714 (val!11574 Int)) )
))
(declare-datatypes ((ValueCell!11042 0))(
  ( (ValueCellFull!11042 (v!14133 V!35713)) (EmptyCell!11042) )
))
(declare-datatypes ((array!62110 0))(
  ( (array!62111 (arr!29908 (Array (_ BitVec 32) ValueCell!11042)) (size!30388 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62110)

(declare-fun defaultEntry!1281 () Int)

(declare-fun lt!437667 () V!35713)

(declare-fun get!15552 (ValueCell!11042 V!35713) V!35713)

(declare-fun dynLambda!1871 (Int (_ BitVec 64)) V!35713)

(assert (=> b!986483 (= lt!437667 (get!15552 (select (arr!29908 _values!1278) from!1932) (dynLambda!1871 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35713)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35713)

(declare-datatypes ((tuple2!14832 0))(
  ( (tuple2!14833 (_1!7427 (_ BitVec 64)) (_2!7427 V!35713)) )
))
(declare-datatypes ((List!20709 0))(
  ( (Nil!20706) (Cons!20705 (h!21873 tuple2!14832) (t!29590 List!20709)) )
))
(declare-datatypes ((ListLongMap!13531 0))(
  ( (ListLongMap!13532 (toList!6781 List!20709)) )
))
(declare-fun lt!437665 () ListLongMap!13531)

(declare-fun getCurrentListMapNoExtraKeys!3514 (array!62108 array!62110 (_ BitVec 32) (_ BitVec 32) V!35713 V!35713 (_ BitVec 32) Int) ListLongMap!13531)

(assert (=> b!986483 (= lt!437665 (getCurrentListMapNoExtraKeys!3514 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!986484 () Bool)

(declare-fun res!659862 () Bool)

(assert (=> b!986484 (=> (not res!659862) (not e!556134))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!986484 (= res!659862 (validKeyInArray!0 (select (arr!29907 _keys!1544) from!1932)))))

(declare-fun b!986485 () Bool)

(declare-fun res!659858 () Bool)

(assert (=> b!986485 (=> (not res!659858) (not e!556134))))

(assert (=> b!986485 (= res!659858 (and (= (size!30388 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30387 _keys!1544) (size!30388 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!986486 () Bool)

(assert (=> b!986486 (= e!556132 (not true))))

(declare-fun lt!437664 () tuple2!14832)

(declare-fun lt!437666 () tuple2!14832)

(declare-fun +!3080 (ListLongMap!13531 tuple2!14832) ListLongMap!13531)

(assert (=> b!986486 (= (+!3080 (+!3080 lt!437665 lt!437664) lt!437666) (+!3080 (+!3080 lt!437665 lt!437666) lt!437664))))

(assert (=> b!986486 (= lt!437666 (tuple2!14833 (select (arr!29907 _keys!1544) from!1932) lt!437667))))

(assert (=> b!986486 (= lt!437664 (tuple2!14833 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32740 0))(
  ( (Unit!32741) )
))
(declare-fun lt!437663 () Unit!32740)

(declare-fun addCommutativeForDiffKeys!687 (ListLongMap!13531 (_ BitVec 64) V!35713 (_ BitVec 64) V!35713) Unit!32740)

(assert (=> b!986486 (= lt!437663 (addCommutativeForDiffKeys!687 lt!437665 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29907 _keys!1544) from!1932) lt!437667))))

(declare-fun b!986487 () Bool)

(declare-fun res!659859 () Bool)

(assert (=> b!986487 (=> (not res!659859) (not e!556134))))

(assert (=> b!986487 (= res!659859 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!986488 () Bool)

(declare-fun e!556133 () Bool)

(declare-fun e!556130 () Bool)

(assert (=> b!986488 (= e!556133 (and e!556130 mapRes!36599))))

(declare-fun condMapEmpty!36599 () Bool)

(declare-fun mapDefault!36599 () ValueCell!11042)

(assert (=> b!986488 (= condMapEmpty!36599 (= (arr!29908 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11042)) mapDefault!36599)))))

(declare-fun b!986489 () Bool)

(declare-fun res!659856 () Bool)

(assert (=> b!986489 (=> (not res!659856) (not e!556134))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62108 (_ BitVec 32)) Bool)

(assert (=> b!986489 (= res!659856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!986481 () Bool)

(assert (=> b!986481 (= e!556130 tp_is_empty!23047)))

(declare-fun res!659863 () Bool)

(assert (=> start!84412 (=> (not res!659863) (not e!556134))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84412 (= res!659863 (validMask!0 mask!1948))))

(assert (=> start!84412 e!556134))

(assert (=> start!84412 true))

(assert (=> start!84412 tp_is_empty!23047))

(declare-fun array_inv!23133 (array!62110) Bool)

(assert (=> start!84412 (and (array_inv!23133 _values!1278) e!556133)))

(assert (=> start!84412 tp!69440))

(declare-fun array_inv!23134 (array!62108) Bool)

(assert (=> start!84412 (array_inv!23134 _keys!1544)))

(declare-fun mapNonEmpty!36599 () Bool)

(declare-fun tp!69439 () Bool)

(assert (=> mapNonEmpty!36599 (= mapRes!36599 (and tp!69439 e!556131))))

(declare-fun mapValue!36599 () ValueCell!11042)

(declare-fun mapRest!36599 () (Array (_ BitVec 32) ValueCell!11042))

(declare-fun mapKey!36599 () (_ BitVec 32))

(assert (=> mapNonEmpty!36599 (= (arr!29908 _values!1278) (store mapRest!36599 mapKey!36599 mapValue!36599))))

(declare-fun b!986490 () Bool)

(declare-fun res!659860 () Bool)

(assert (=> b!986490 (=> (not res!659860) (not e!556134))))

(declare-datatypes ((List!20710 0))(
  ( (Nil!20707) (Cons!20706 (h!21874 (_ BitVec 64)) (t!29591 List!20710)) )
))
(declare-fun arrayNoDuplicates!0 (array!62108 (_ BitVec 32) List!20710) Bool)

(assert (=> b!986490 (= res!659860 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20707))))

(assert (= (and start!84412 res!659863) b!986485))

(assert (= (and b!986485 res!659858) b!986489))

(assert (= (and b!986489 res!659856) b!986490))

(assert (= (and b!986490 res!659860) b!986480))

(assert (= (and b!986480 res!659861) b!986484))

(assert (= (and b!986484 res!659862) b!986487))

(assert (= (and b!986487 res!659859) b!986483))

(assert (= (and b!986483 res!659857) b!986486))

(assert (= (and b!986488 condMapEmpty!36599) mapIsEmpty!36599))

(assert (= (and b!986488 (not condMapEmpty!36599)) mapNonEmpty!36599))

(get-info :version)

(assert (= (and mapNonEmpty!36599 ((_ is ValueCellFull!11042) mapValue!36599)) b!986482))

(assert (= (and b!986488 ((_ is ValueCellFull!11042) mapDefault!36599)) b!986481))

(assert (= start!84412 b!986488))

(declare-fun b_lambda!14991 () Bool)

(assert (=> (not b_lambda!14991) (not b!986483)))

(declare-fun t!29589 () Bool)

(declare-fun tb!6731 () Bool)

(assert (=> (and start!84412 (= defaultEntry!1281 defaultEntry!1281) t!29589) tb!6731))

(declare-fun result!13459 () Bool)

(assert (=> tb!6731 (= result!13459 tp_is_empty!23047)))

(assert (=> b!986483 t!29589))

(declare-fun b_and!31979 () Bool)

(assert (= b_and!31977 (and (=> t!29589 result!13459) b_and!31979)))

(declare-fun m!913925 () Bool)

(assert (=> b!986483 m!913925))

(declare-fun m!913927 () Bool)

(assert (=> b!986483 m!913927))

(declare-fun m!913929 () Bool)

(assert (=> b!986483 m!913929))

(declare-fun m!913931 () Bool)

(assert (=> b!986483 m!913931))

(assert (=> b!986483 m!913927))

(assert (=> b!986483 m!913931))

(declare-fun m!913933 () Bool)

(assert (=> b!986483 m!913933))

(declare-fun m!913935 () Bool)

(assert (=> b!986490 m!913935))

(assert (=> b!986484 m!913925))

(assert (=> b!986484 m!913925))

(declare-fun m!913937 () Bool)

(assert (=> b!986484 m!913937))

(declare-fun m!913939 () Bool)

(assert (=> start!84412 m!913939))

(declare-fun m!913941 () Bool)

(assert (=> start!84412 m!913941))

(declare-fun m!913943 () Bool)

(assert (=> start!84412 m!913943))

(declare-fun m!913945 () Bool)

(assert (=> b!986489 m!913945))

(assert (=> b!986486 m!913925))

(assert (=> b!986486 m!913925))

(declare-fun m!913947 () Bool)

(assert (=> b!986486 m!913947))

(declare-fun m!913949 () Bool)

(assert (=> b!986486 m!913949))

(declare-fun m!913951 () Bool)

(assert (=> b!986486 m!913951))

(assert (=> b!986486 m!913949))

(declare-fun m!913953 () Bool)

(assert (=> b!986486 m!913953))

(assert (=> b!986486 m!913951))

(declare-fun m!913955 () Bool)

(assert (=> b!986486 m!913955))

(declare-fun m!913957 () Bool)

(assert (=> mapNonEmpty!36599 m!913957))

(check-sat (not b!986484) (not mapNonEmpty!36599) (not b_next!19945) (not start!84412) (not b!986486) b_and!31979 (not b_lambda!14991) tp_is_empty!23047 (not b!986490) (not b!986483) (not b!986489))
(check-sat b_and!31979 (not b_next!19945))
