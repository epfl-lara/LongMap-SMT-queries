; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79230 () Bool)

(assert start!79230)

(declare-fun b_free!17275 () Bool)

(declare-fun b_next!17275 () Bool)

(assert (=> start!79230 (= b_free!17275 (not b_next!17275))))

(declare-fun tp!60266 () Bool)

(declare-fun b_and!28297 () Bool)

(assert (=> start!79230 (= tp!60266 b_and!28297)))

(declare-fun b!927844 () Bool)

(declare-fun e!520933 () Bool)

(declare-fun tp_is_empty!19783 () Bool)

(assert (=> b!927844 (= e!520933 tp_is_empty!19783)))

(declare-fun b!927845 () Bool)

(declare-datatypes ((Unit!31335 0))(
  ( (Unit!31336) )
))
(declare-fun e!520927 () Unit!31335)

(declare-fun Unit!31337 () Unit!31335)

(assert (=> b!927845 (= e!520927 Unit!31337)))

(declare-fun b!927846 () Bool)

(declare-fun res!624773 () Bool)

(declare-fun e!520932 () Bool)

(assert (=> b!927846 (=> (not res!624773) (not e!520932))))

(declare-datatypes ((array!55581 0))(
  ( (array!55582 (arr!26731 (Array (_ BitVec 32) (_ BitVec 64))) (size!27191 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55581)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31343 0))(
  ( (V!31344 (val!9942 Int)) )
))
(declare-datatypes ((ValueCell!9410 0))(
  ( (ValueCellFull!9410 (v!12457 V!31343)) (EmptyCell!9410) )
))
(declare-datatypes ((array!55583 0))(
  ( (array!55584 (arr!26732 (Array (_ BitVec 32) ValueCell!9410)) (size!27192 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55583)

(assert (=> b!927846 (= res!624773 (and (= (size!27192 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27191 _keys!1487) (size!27192 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!927847 () Bool)

(declare-fun res!624770 () Bool)

(assert (=> b!927847 (=> (not res!624770) (not e!520932))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55581 (_ BitVec 32)) Bool)

(assert (=> b!927847 (= res!624770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun b!927848 () Bool)

(declare-fun e!520936 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!55581 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!927848 (= e!520936 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!927849 () Bool)

(declare-fun e!520935 () Bool)

(assert (=> b!927849 (= e!520935 tp_is_empty!19783)))

(declare-fun b!927850 () Bool)

(declare-fun e!520930 () Bool)

(declare-fun mapRes!31431 () Bool)

(assert (=> b!927850 (= e!520930 (and e!520935 mapRes!31431))))

(declare-fun condMapEmpty!31431 () Bool)

(declare-fun mapDefault!31431 () ValueCell!9410)

(assert (=> b!927850 (= condMapEmpty!31431 (= (arr!26732 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9410)) mapDefault!31431)))))

(declare-fun v!791 () V!31343)

(declare-datatypes ((tuple2!12962 0))(
  ( (tuple2!12963 (_1!6492 (_ BitVec 64)) (_2!6492 V!31343)) )
))
(declare-datatypes ((List!18771 0))(
  ( (Nil!18768) (Cons!18767 (h!19919 tuple2!12962) (t!26768 List!18771)) )
))
(declare-datatypes ((ListLongMap!11661 0))(
  ( (ListLongMap!11662 (toList!5846 List!18771)) )
))
(declare-fun lt!417987 () ListLongMap!11661)

(declare-fun e!520938 () Bool)

(declare-fun b!927851 () Bool)

(declare-fun apply!697 (ListLongMap!11661 (_ BitVec 64)) V!31343)

(assert (=> b!927851 (= e!520938 (= (apply!697 lt!417987 k0!1099) v!791))))

(declare-fun b!927852 () Bool)

(assert (=> b!927852 (= e!520936 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!624771 () Bool)

(assert (=> start!79230 (=> (not res!624771) (not e!520932))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79230 (= res!624771 (validMask!0 mask!1881))))

(assert (=> start!79230 e!520932))

(assert (=> start!79230 true))

(assert (=> start!79230 tp_is_empty!19783))

(declare-fun array_inv!20916 (array!55583) Bool)

(assert (=> start!79230 (and (array_inv!20916 _values!1231) e!520930)))

(assert (=> start!79230 tp!60266))

(declare-fun array_inv!20917 (array!55581) Bool)

(assert (=> start!79230 (array_inv!20917 _keys!1487)))

(declare-fun b!927853 () Bool)

(declare-fun lt!417993 () ListLongMap!11661)

(declare-fun lt!417988 () V!31343)

(assert (=> b!927853 (= (apply!697 lt!417993 k0!1099) lt!417988)))

(declare-fun lt!417997 () Unit!31335)

(declare-fun lt!418001 () V!31343)

(declare-fun lt!417998 () (_ BitVec 64))

(declare-fun lt!417991 () ListLongMap!11661)

(declare-fun addApplyDifferent!394 (ListLongMap!11661 (_ BitVec 64) V!31343 (_ BitVec 64)) Unit!31335)

(assert (=> b!927853 (= lt!417997 (addApplyDifferent!394 lt!417991 lt!417998 lt!418001 k0!1099))))

(assert (=> b!927853 (not (= lt!417998 k0!1099))))

(declare-fun lt!417989 () Unit!31335)

(declare-datatypes ((List!18772 0))(
  ( (Nil!18769) (Cons!18768 (h!19920 (_ BitVec 64)) (t!26769 List!18772)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55581 (_ BitVec 64) (_ BitVec 32) List!18772) Unit!31335)

(assert (=> b!927853 (= lt!417989 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18769))))

(assert (=> b!927853 e!520936))

(declare-fun c!97078 () Bool)

(assert (=> b!927853 (= c!97078 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!417999 () Unit!31335)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31343)

(declare-fun minValue!1173 () V!31343)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!249 (array!55581 array!55583 (_ BitVec 32) (_ BitVec 32) V!31343 V!31343 (_ BitVec 64) (_ BitVec 32) Int) Unit!31335)

(assert (=> b!927853 (= lt!417999 (lemmaListMapContainsThenArrayContainsFrom!249 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55581 (_ BitVec 32) List!18772) Bool)

(assert (=> b!927853 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18769)))

(declare-fun lt!417986 () Unit!31335)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55581 (_ BitVec 32) (_ BitVec 32)) Unit!31335)

(assert (=> b!927853 (= lt!417986 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!4918 (ListLongMap!11661 (_ BitVec 64)) Bool)

(assert (=> b!927853 (contains!4918 lt!417993 k0!1099)))

(declare-fun lt!417996 () tuple2!12962)

(declare-fun +!2758 (ListLongMap!11661 tuple2!12962) ListLongMap!11661)

(assert (=> b!927853 (= lt!417993 (+!2758 lt!417991 lt!417996))))

(declare-fun lt!417992 () Unit!31335)

(declare-fun addStillContains!467 (ListLongMap!11661 (_ BitVec 64) V!31343 (_ BitVec 64)) Unit!31335)

(assert (=> b!927853 (= lt!417992 (addStillContains!467 lt!417991 lt!417998 lt!418001 k0!1099))))

(declare-fun getCurrentListMap!3096 (array!55581 array!55583 (_ BitVec 32) (_ BitVec 32) V!31343 V!31343 (_ BitVec 32) Int) ListLongMap!11661)

(assert (=> b!927853 (= (getCurrentListMap!3096 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2758 (getCurrentListMap!3096 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!417996))))

(assert (=> b!927853 (= lt!417996 (tuple2!12963 lt!417998 lt!418001))))

(declare-fun get!14085 (ValueCell!9410 V!31343) V!31343)

(declare-fun dynLambda!1555 (Int (_ BitVec 64)) V!31343)

(assert (=> b!927853 (= lt!418001 (get!14085 (select (arr!26732 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1555 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!418000 () Unit!31335)

(declare-fun lemmaListMapRecursiveValidKeyArray!138 (array!55581 array!55583 (_ BitVec 32) (_ BitVec 32) V!31343 V!31343 (_ BitVec 32) Int) Unit!31335)

(assert (=> b!927853 (= lt!418000 (lemmaListMapRecursiveValidKeyArray!138 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!927853 (= e!520927 lt!417997)))

(declare-fun b!927854 () Bool)

(declare-fun e!520939 () Unit!31335)

(assert (=> b!927854 (= e!520939 e!520927)))

(assert (=> b!927854 (= lt!417998 (select (arr!26731 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97079 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!927854 (= c!97079 (validKeyInArray!0 lt!417998))))

(declare-fun b!927855 () Bool)

(declare-fun res!624779 () Bool)

(assert (=> b!927855 (=> (not res!624779) (not e!520932))))

(assert (=> b!927855 (= res!624779 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18769))))

(declare-fun b!927856 () Bool)

(declare-fun res!624772 () Bool)

(assert (=> b!927856 (=> (not res!624772) (not e!520932))))

(assert (=> b!927856 (= res!624772 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27191 _keys!1487))))))

(declare-fun mapIsEmpty!31431 () Bool)

(assert (=> mapIsEmpty!31431 mapRes!31431))

(declare-fun mapNonEmpty!31431 () Bool)

(declare-fun tp!60267 () Bool)

(assert (=> mapNonEmpty!31431 (= mapRes!31431 (and tp!60267 e!520933))))

(declare-fun mapKey!31431 () (_ BitVec 32))

(declare-fun mapRest!31431 () (Array (_ BitVec 32) ValueCell!9410))

(declare-fun mapValue!31431 () ValueCell!9410)

(assert (=> mapNonEmpty!31431 (= (arr!26732 _values!1231) (store mapRest!31431 mapKey!31431 mapValue!31431))))

(declare-fun b!927857 () Bool)

(declare-fun e!520934 () Bool)

(assert (=> b!927857 (= e!520934 (not true))))

(assert (=> b!927857 e!520938))

(declare-fun res!624780 () Bool)

(assert (=> b!927857 (=> (not res!624780) (not e!520938))))

(assert (=> b!927857 (= res!624780 (contains!4918 lt!417987 k0!1099))))

(assert (=> b!927857 (= lt!417987 (getCurrentListMap!3096 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!417995 () Unit!31335)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!87 (array!55581 array!55583 (_ BitVec 32) (_ BitVec 32) V!31343 V!31343 (_ BitVec 64) V!31343 (_ BitVec 32) Int) Unit!31335)

(assert (=> b!927857 (= lt!417995 (lemmaListMapApplyFromThenApplyFromZero!87 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!927858 () Bool)

(declare-fun res!624776 () Bool)

(assert (=> b!927858 (=> (not res!624776) (not e!520934))))

(declare-fun lt!417994 () ListLongMap!11661)

(assert (=> b!927858 (= res!624776 (= (apply!697 lt!417994 k0!1099) v!791))))

(declare-fun b!927859 () Bool)

(declare-fun e!520929 () Bool)

(assert (=> b!927859 (= e!520929 e!520934)))

(declare-fun res!624775 () Bool)

(assert (=> b!927859 (=> (not res!624775) (not e!520934))))

(assert (=> b!927859 (= res!624775 (contains!4918 lt!417994 k0!1099))))

(assert (=> b!927859 (= lt!417994 (getCurrentListMap!3096 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!927860 () Bool)

(declare-fun e!520937 () Bool)

(assert (=> b!927860 (= e!520932 e!520937)))

(declare-fun res!624774 () Bool)

(assert (=> b!927860 (=> (not res!624774) (not e!520937))))

(assert (=> b!927860 (= res!624774 (contains!4918 lt!417991 k0!1099))))

(assert (=> b!927860 (= lt!417991 (getCurrentListMap!3096 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!927861 () Bool)

(declare-fun e!520928 () Bool)

(assert (=> b!927861 (= e!520937 e!520928)))

(declare-fun res!624778 () Bool)

(assert (=> b!927861 (=> (not res!624778) (not e!520928))))

(assert (=> b!927861 (= res!624778 (and (= lt!417988 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!927861 (= lt!417988 (apply!697 lt!417991 k0!1099))))

(declare-fun b!927862 () Bool)

(assert (=> b!927862 (= e!520928 e!520929)))

(declare-fun res!624777 () Bool)

(assert (=> b!927862 (=> (not res!624777) (not e!520929))))

(assert (=> b!927862 (= res!624777 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27191 _keys!1487)))))

(declare-fun lt!417990 () Unit!31335)

(assert (=> b!927862 (= lt!417990 e!520939)))

(declare-fun c!97080 () Bool)

(assert (=> b!927862 (= c!97080 (validKeyInArray!0 k0!1099))))

(declare-fun b!927863 () Bool)

(declare-fun Unit!31338 () Unit!31335)

(assert (=> b!927863 (= e!520939 Unit!31338)))

(assert (= (and start!79230 res!624771) b!927846))

(assert (= (and b!927846 res!624773) b!927847))

(assert (= (and b!927847 res!624770) b!927855))

(assert (= (and b!927855 res!624779) b!927856))

(assert (= (and b!927856 res!624772) b!927860))

(assert (= (and b!927860 res!624774) b!927861))

(assert (= (and b!927861 res!624778) b!927862))

(assert (= (and b!927862 c!97080) b!927854))

(assert (= (and b!927862 (not c!97080)) b!927863))

(assert (= (and b!927854 c!97079) b!927853))

(assert (= (and b!927854 (not c!97079)) b!927845))

(assert (= (and b!927853 c!97078) b!927848))

(assert (= (and b!927853 (not c!97078)) b!927852))

(assert (= (and b!927862 res!624777) b!927859))

(assert (= (and b!927859 res!624775) b!927858))

(assert (= (and b!927858 res!624776) b!927857))

(assert (= (and b!927857 res!624780) b!927851))

(assert (= (and b!927850 condMapEmpty!31431) mapIsEmpty!31431))

(assert (= (and b!927850 (not condMapEmpty!31431)) mapNonEmpty!31431))

(get-info :version)

(assert (= (and mapNonEmpty!31431 ((_ is ValueCellFull!9410) mapValue!31431)) b!927844))

(assert (= (and b!927850 ((_ is ValueCellFull!9410) mapDefault!31431)) b!927849))

(assert (= start!79230 b!927850))

(declare-fun b_lambda!13791 () Bool)

(assert (=> (not b_lambda!13791) (not b!927853)))

(declare-fun t!26767 () Bool)

(declare-fun tb!5847 () Bool)

(assert (=> (and start!79230 (= defaultEntry!1235 defaultEntry!1235) t!26767) tb!5847))

(declare-fun result!11525 () Bool)

(assert (=> tb!5847 (= result!11525 tp_is_empty!19783)))

(assert (=> b!927853 t!26767))

(declare-fun b_and!28299 () Bool)

(assert (= b_and!28297 (and (=> t!26767 result!11525) b_and!28299)))

(declare-fun m!862849 () Bool)

(assert (=> b!927858 m!862849))

(declare-fun m!862851 () Bool)

(assert (=> b!927848 m!862851))

(declare-fun m!862853 () Bool)

(assert (=> b!927857 m!862853))

(declare-fun m!862855 () Bool)

(assert (=> b!927857 m!862855))

(declare-fun m!862857 () Bool)

(assert (=> b!927857 m!862857))

(declare-fun m!862859 () Bool)

(assert (=> b!927860 m!862859))

(declare-fun m!862861 () Bool)

(assert (=> b!927860 m!862861))

(declare-fun m!862863 () Bool)

(assert (=> start!79230 m!862863))

(declare-fun m!862865 () Bool)

(assert (=> start!79230 m!862865))

(declare-fun m!862867 () Bool)

(assert (=> start!79230 m!862867))

(declare-fun m!862869 () Bool)

(assert (=> b!927861 m!862869))

(declare-fun m!862871 () Bool)

(assert (=> b!927851 m!862871))

(declare-fun m!862873 () Bool)

(assert (=> b!927859 m!862873))

(declare-fun m!862875 () Bool)

(assert (=> b!927859 m!862875))

(declare-fun m!862877 () Bool)

(assert (=> b!927854 m!862877))

(declare-fun m!862879 () Bool)

(assert (=> b!927854 m!862879))

(declare-fun m!862881 () Bool)

(assert (=> mapNonEmpty!31431 m!862881))

(declare-fun m!862883 () Bool)

(assert (=> b!927847 m!862883))

(declare-fun m!862885 () Bool)

(assert (=> b!927853 m!862885))

(declare-fun m!862887 () Bool)

(assert (=> b!927853 m!862887))

(declare-fun m!862889 () Bool)

(assert (=> b!927853 m!862889))

(declare-fun m!862891 () Bool)

(assert (=> b!927853 m!862891))

(declare-fun m!862893 () Bool)

(assert (=> b!927853 m!862893))

(declare-fun m!862895 () Bool)

(assert (=> b!927853 m!862895))

(declare-fun m!862897 () Bool)

(assert (=> b!927853 m!862897))

(assert (=> b!927853 m!862895))

(assert (=> b!927853 m!862897))

(declare-fun m!862899 () Bool)

(assert (=> b!927853 m!862899))

(assert (=> b!927853 m!862875))

(declare-fun m!862901 () Bool)

(assert (=> b!927853 m!862901))

(declare-fun m!862903 () Bool)

(assert (=> b!927853 m!862903))

(declare-fun m!862905 () Bool)

(assert (=> b!927853 m!862905))

(declare-fun m!862907 () Bool)

(assert (=> b!927853 m!862907))

(declare-fun m!862909 () Bool)

(assert (=> b!927853 m!862909))

(declare-fun m!862911 () Bool)

(assert (=> b!927853 m!862911))

(assert (=> b!927853 m!862885))

(declare-fun m!862913 () Bool)

(assert (=> b!927853 m!862913))

(declare-fun m!862915 () Bool)

(assert (=> b!927855 m!862915))

(declare-fun m!862917 () Bool)

(assert (=> b!927862 m!862917))

(check-sat (not start!79230) (not b!927847) (not b!927860) b_and!28299 (not b!927854) (not b!927851) tp_is_empty!19783 (not b!927857) (not b!927858) (not mapNonEmpty!31431) (not b_lambda!13791) (not b!927861) (not b!927853) (not b!927848) (not b!927859) (not b!927862) (not b_next!17275) (not b!927855))
(check-sat b_and!28299 (not b_next!17275))
