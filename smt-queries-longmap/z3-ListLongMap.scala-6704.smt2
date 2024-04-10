; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84198 () Bool)

(assert start!84198)

(declare-fun b_free!19899 () Bool)

(declare-fun b_next!19899 () Bool)

(assert (=> start!84198 (= b_free!19899 (not b_next!19899))))

(declare-fun tp!69300 () Bool)

(declare-fun b_and!31875 () Bool)

(assert (=> start!84198 (= tp!69300 b_and!31875)))

(declare-fun b!984772 () Bool)

(declare-fun res!658966 () Bool)

(declare-fun e!555138 () Bool)

(assert (=> b!984772 (=> (not res!658966) (not e!555138))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!984772 (= res!658966 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!984773 () Bool)

(declare-fun res!658964 () Bool)

(assert (=> b!984773 (=> (not res!658964) (not e!555138))))

(declare-datatypes ((array!61981 0))(
  ( (array!61982 (arr!29848 (Array (_ BitVec 32) (_ BitVec 64))) (size!30327 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61981)

(declare-datatypes ((List!20667 0))(
  ( (Nil!20664) (Cons!20663 (h!21825 (_ BitVec 64)) (t!29510 List!20667)) )
))
(declare-fun arrayNoDuplicates!0 (array!61981 (_ BitVec 32) List!20667) Bool)

(assert (=> b!984773 (= res!658964 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20664))))

(declare-fun b!984774 () Bool)

(declare-fun res!658960 () Bool)

(assert (=> b!984774 (=> (not res!658960) (not e!555138))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61981 (_ BitVec 32)) Bool)

(assert (=> b!984774 (= res!658960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!984775 () Bool)

(declare-fun e!555137 () Bool)

(declare-fun tp_is_empty!23001 () Bool)

(assert (=> b!984775 (= e!555137 tp_is_empty!23001)))

(declare-fun b!984776 () Bool)

(declare-fun e!555134 () Bool)

(declare-fun e!555135 () Bool)

(declare-fun mapRes!36530 () Bool)

(assert (=> b!984776 (= e!555134 (and e!555135 mapRes!36530))))

(declare-fun condMapEmpty!36530 () Bool)

(declare-datatypes ((V!35651 0))(
  ( (V!35652 (val!11551 Int)) )
))
(declare-datatypes ((ValueCell!11019 0))(
  ( (ValueCellFull!11019 (v!14113 V!35651)) (EmptyCell!11019) )
))
(declare-datatypes ((array!61983 0))(
  ( (array!61984 (arr!29849 (Array (_ BitVec 32) ValueCell!11019)) (size!30328 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61983)

(declare-fun mapDefault!36530 () ValueCell!11019)

(assert (=> b!984776 (= condMapEmpty!36530 (= (arr!29849 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11019)) mapDefault!36530)))))

(declare-fun b!984777 () Bool)

(declare-fun res!658963 () Bool)

(assert (=> b!984777 (=> (not res!658963) (not e!555138))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!984777 (= res!658963 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30327 _keys!1544))))))

(declare-fun b!984778 () Bool)

(declare-fun res!658967 () Bool)

(assert (=> b!984778 (=> (not res!658967) (not e!555138))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!984778 (= res!658967 (validKeyInArray!0 (select (arr!29848 _keys!1544) from!1932)))))

(declare-fun b!984779 () Bool)

(declare-fun e!555136 () Bool)

(assert (=> b!984779 (= e!555136 (not (bvsle from!1932 (size!30327 _keys!1544))))))

(declare-datatypes ((tuple2!14774 0))(
  ( (tuple2!14775 (_1!7398 (_ BitVec 64)) (_2!7398 V!35651)) )
))
(declare-datatypes ((List!20668 0))(
  ( (Nil!20665) (Cons!20664 (h!21826 tuple2!14774) (t!29511 List!20668)) )
))
(declare-datatypes ((ListLongMap!13471 0))(
  ( (ListLongMap!13472 (toList!6751 List!20668)) )
))
(declare-fun lt!436960 () ListLongMap!13471)

(declare-fun lt!436961 () tuple2!14774)

(declare-fun lt!436958 () tuple2!14774)

(declare-fun +!3042 (ListLongMap!13471 tuple2!14774) ListLongMap!13471)

(assert (=> b!984779 (= (+!3042 (+!3042 lt!436960 lt!436961) lt!436958) (+!3042 (+!3042 lt!436960 lt!436958) lt!436961))))

(declare-fun lt!436957 () V!35651)

(assert (=> b!984779 (= lt!436958 (tuple2!14775 (select (arr!29848 _keys!1544) from!1932) lt!436957))))

(declare-fun minValue!1220 () V!35651)

(assert (=> b!984779 (= lt!436961 (tuple2!14775 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32723 0))(
  ( (Unit!32724) )
))
(declare-fun lt!436959 () Unit!32723)

(declare-fun addCommutativeForDiffKeys!670 (ListLongMap!13471 (_ BitVec 64) V!35651 (_ BitVec 64) V!35651) Unit!32723)

(assert (=> b!984779 (= lt!436959 (addCommutativeForDiffKeys!670 lt!436960 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29848 _keys!1544) from!1932) lt!436957))))

(declare-fun b!984780 () Bool)

(assert (=> b!984780 (= e!555138 e!555136)))

(declare-fun res!658962 () Bool)

(assert (=> b!984780 (=> (not res!658962) (not e!555136))))

(assert (=> b!984780 (= res!658962 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29848 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15485 (ValueCell!11019 V!35651) V!35651)

(declare-fun dynLambda!1824 (Int (_ BitVec 64)) V!35651)

(assert (=> b!984780 (= lt!436957 (get!15485 (select (arr!29849 _values!1278) from!1932) (dynLambda!1824 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35651)

(declare-fun getCurrentListMapNoExtraKeys!3444 (array!61981 array!61983 (_ BitVec 32) (_ BitVec 32) V!35651 V!35651 (_ BitVec 32) Int) ListLongMap!13471)

(assert (=> b!984780 (= lt!436960 (getCurrentListMapNoExtraKeys!3444 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun res!658965 () Bool)

(assert (=> start!84198 (=> (not res!658965) (not e!555138))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84198 (= res!658965 (validMask!0 mask!1948))))

(assert (=> start!84198 e!555138))

(assert (=> start!84198 true))

(assert (=> start!84198 tp_is_empty!23001))

(declare-fun array_inv!23075 (array!61983) Bool)

(assert (=> start!84198 (and (array_inv!23075 _values!1278) e!555134)))

(assert (=> start!84198 tp!69300))

(declare-fun array_inv!23076 (array!61981) Bool)

(assert (=> start!84198 (array_inv!23076 _keys!1544)))

(declare-fun mapNonEmpty!36530 () Bool)

(declare-fun tp!69301 () Bool)

(assert (=> mapNonEmpty!36530 (= mapRes!36530 (and tp!69301 e!555137))))

(declare-fun mapRest!36530 () (Array (_ BitVec 32) ValueCell!11019))

(declare-fun mapValue!36530 () ValueCell!11019)

(declare-fun mapKey!36530 () (_ BitVec 32))

(assert (=> mapNonEmpty!36530 (= (arr!29849 _values!1278) (store mapRest!36530 mapKey!36530 mapValue!36530))))

(declare-fun b!984781 () Bool)

(declare-fun res!658961 () Bool)

(assert (=> b!984781 (=> (not res!658961) (not e!555138))))

(assert (=> b!984781 (= res!658961 (and (= (size!30328 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30327 _keys!1544) (size!30328 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!984782 () Bool)

(assert (=> b!984782 (= e!555135 tp_is_empty!23001)))

(declare-fun mapIsEmpty!36530 () Bool)

(assert (=> mapIsEmpty!36530 mapRes!36530))

(assert (= (and start!84198 res!658965) b!984781))

(assert (= (and b!984781 res!658961) b!984774))

(assert (= (and b!984774 res!658960) b!984773))

(assert (= (and b!984773 res!658964) b!984777))

(assert (= (and b!984777 res!658963) b!984778))

(assert (= (and b!984778 res!658967) b!984772))

(assert (= (and b!984772 res!658966) b!984780))

(assert (= (and b!984780 res!658962) b!984779))

(assert (= (and b!984776 condMapEmpty!36530) mapIsEmpty!36530))

(assert (= (and b!984776 (not condMapEmpty!36530)) mapNonEmpty!36530))

(get-info :version)

(assert (= (and mapNonEmpty!36530 ((_ is ValueCellFull!11019) mapValue!36530)) b!984775))

(assert (= (and b!984776 ((_ is ValueCellFull!11019) mapDefault!36530)) b!984782))

(assert (= start!84198 b!984776))

(declare-fun b_lambda!14931 () Bool)

(assert (=> (not b_lambda!14931) (not b!984780)))

(declare-fun t!29509 () Bool)

(declare-fun tb!6693 () Bool)

(assert (=> (and start!84198 (= defaultEntry!1281 defaultEntry!1281) t!29509) tb!6693))

(declare-fun result!13375 () Bool)

(assert (=> tb!6693 (= result!13375 tp_is_empty!23001)))

(assert (=> b!984780 t!29509))

(declare-fun b_and!31877 () Bool)

(assert (= b_and!31875 (and (=> t!29509 result!13375) b_and!31877)))

(declare-fun m!911849 () Bool)

(assert (=> b!984779 m!911849))

(declare-fun m!911851 () Bool)

(assert (=> b!984779 m!911851))

(assert (=> b!984779 m!911849))

(declare-fun m!911853 () Bool)

(assert (=> b!984779 m!911853))

(declare-fun m!911855 () Bool)

(assert (=> b!984779 m!911855))

(declare-fun m!911857 () Bool)

(assert (=> b!984779 m!911857))

(declare-fun m!911859 () Bool)

(assert (=> b!984779 m!911859))

(assert (=> b!984779 m!911857))

(assert (=> b!984779 m!911853))

(declare-fun m!911861 () Bool)

(assert (=> b!984773 m!911861))

(assert (=> b!984780 m!911857))

(declare-fun m!911863 () Bool)

(assert (=> b!984780 m!911863))

(declare-fun m!911865 () Bool)

(assert (=> b!984780 m!911865))

(declare-fun m!911867 () Bool)

(assert (=> b!984780 m!911867))

(assert (=> b!984780 m!911863))

(assert (=> b!984780 m!911867))

(declare-fun m!911869 () Bool)

(assert (=> b!984780 m!911869))

(declare-fun m!911871 () Bool)

(assert (=> mapNonEmpty!36530 m!911871))

(declare-fun m!911873 () Bool)

(assert (=> b!984774 m!911873))

(assert (=> b!984778 m!911857))

(assert (=> b!984778 m!911857))

(declare-fun m!911875 () Bool)

(assert (=> b!984778 m!911875))

(declare-fun m!911877 () Bool)

(assert (=> start!84198 m!911877))

(declare-fun m!911879 () Bool)

(assert (=> start!84198 m!911879))

(declare-fun m!911881 () Bool)

(assert (=> start!84198 m!911881))

(check-sat (not b!984780) (not b!984778) (not mapNonEmpty!36530) (not b!984774) (not b_lambda!14931) (not start!84198) (not b!984773) b_and!31877 (not b_next!19899) tp_is_empty!23001 (not b!984779))
(check-sat b_and!31877 (not b_next!19899))
