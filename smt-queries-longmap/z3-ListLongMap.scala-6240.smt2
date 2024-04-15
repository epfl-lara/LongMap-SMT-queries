; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79846 () Bool)

(assert start!79846)

(declare-fun b_free!17761 () Bool)

(declare-fun b_next!17761 () Bool)

(assert (=> start!79846 (= b_free!17761 (not b_next!17761))))

(declare-fun tp!61748 () Bool)

(declare-fun b_and!29135 () Bool)

(assert (=> start!79846 (= tp!61748 b_and!29135)))

(declare-fun mapNonEmpty!32183 () Bool)

(declare-fun mapRes!32183 () Bool)

(declare-fun tp!61747 () Bool)

(declare-fun e!527302 () Bool)

(assert (=> mapNonEmpty!32183 (= mapRes!32183 (and tp!61747 e!527302))))

(declare-fun mapKey!32183 () (_ BitVec 32))

(declare-datatypes ((V!31991 0))(
  ( (V!31992 (val!10185 Int)) )
))
(declare-datatypes ((ValueCell!9653 0))(
  ( (ValueCellFull!9653 (v!12715 V!31991)) (EmptyCell!9653) )
))
(declare-fun mapRest!32183 () (Array (_ BitVec 32) ValueCell!9653))

(declare-datatypes ((array!56449 0))(
  ( (array!56450 (arr!27163 (Array (_ BitVec 32) ValueCell!9653)) (size!27624 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56449)

(declare-fun mapValue!32183 () ValueCell!9653)

(assert (=> mapNonEmpty!32183 (= (arr!27163 _values!1231) (store mapRest!32183 mapKey!32183 mapValue!32183))))

(declare-fun b!938850 () Bool)

(declare-datatypes ((Unit!31622 0))(
  ( (Unit!31623) )
))
(declare-fun e!527307 () Unit!31622)

(declare-fun Unit!31624 () Unit!31622)

(assert (=> b!938850 (= e!527307 Unit!31624)))

(declare-fun b!938851 () Bool)

(declare-fun e!527304 () Bool)

(declare-fun e!527299 () Bool)

(assert (=> b!938851 (= e!527304 e!527299)))

(declare-fun res!631590 () Bool)

(assert (=> b!938851 (=> (not res!631590) (not e!527299))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!56451 0))(
  ( (array!56452 (arr!27164 (Array (_ BitVec 32) (_ BitVec 64))) (size!27625 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56451)

(assert (=> b!938851 (= res!631590 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27625 _keys!1487)))))

(declare-fun lt!424052 () Unit!31622)

(assert (=> b!938851 (= lt!424052 e!527307)))

(declare-fun c!97892 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!938851 (= c!97892 (validKeyInArray!0 k0!1099))))

(declare-fun b!938852 () Bool)

(declare-fun tp_is_empty!20269 () Bool)

(assert (=> b!938852 (= e!527302 tp_is_empty!20269)))

(declare-fun b!938853 () Bool)

(declare-fun e!527300 () Bool)

(declare-fun e!527309 () Bool)

(assert (=> b!938853 (= e!527300 (and e!527309 mapRes!32183))))

(declare-fun condMapEmpty!32183 () Bool)

(declare-fun mapDefault!32183 () ValueCell!9653)

(assert (=> b!938853 (= condMapEmpty!32183 (= (arr!27163 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9653)) mapDefault!32183)))))

(declare-fun b!938854 () Bool)

(declare-fun e!527305 () Bool)

(declare-fun e!527306 () Bool)

(assert (=> b!938854 (= e!527305 e!527306)))

(declare-fun res!631593 () Bool)

(assert (=> b!938854 (=> (not res!631593) (not e!527306))))

(declare-datatypes ((tuple2!13440 0))(
  ( (tuple2!13441 (_1!6731 (_ BitVec 64)) (_2!6731 V!31991)) )
))
(declare-datatypes ((List!19182 0))(
  ( (Nil!19179) (Cons!19178 (h!20324 tuple2!13440) (t!27478 List!19182)) )
))
(declare-datatypes ((ListLongMap!12127 0))(
  ( (ListLongMap!12128 (toList!6079 List!19182)) )
))
(declare-fun lt!424051 () ListLongMap!12127)

(declare-fun contains!5084 (ListLongMap!12127 (_ BitVec 64)) Bool)

(assert (=> b!938854 (= res!631593 (contains!5084 lt!424051 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31991)

(declare-fun minValue!1173 () V!31991)

(declare-fun getCurrentListMap!3242 (array!56451 array!56449 (_ BitVec 32) (_ BitVec 32) V!31991 V!31991 (_ BitVec 32) Int) ListLongMap!12127)

(assert (=> b!938854 (= lt!424051 (getCurrentListMap!3242 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!938855 () Bool)

(declare-fun res!631588 () Bool)

(assert (=> b!938855 (=> (not res!631588) (not e!527305))))

(assert (=> b!938855 (= res!631588 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27625 _keys!1487))))))

(declare-fun b!938856 () Bool)

(declare-fun res!631592 () Bool)

(assert (=> b!938856 (=> (not res!631592) (not e!527305))))

(assert (=> b!938856 (= res!631592 (and (= (size!27624 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27625 _keys!1487) (size!27624 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun res!631594 () Bool)

(assert (=> start!79846 (=> (not res!631594) (not e!527305))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79846 (= res!631594 (validMask!0 mask!1881))))

(assert (=> start!79846 e!527305))

(assert (=> start!79846 true))

(assert (=> start!79846 tp_is_empty!20269))

(declare-fun array_inv!21192 (array!56449) Bool)

(assert (=> start!79846 (and (array_inv!21192 _values!1231) e!527300)))

(assert (=> start!79846 tp!61748))

(declare-fun array_inv!21193 (array!56451) Bool)

(assert (=> start!79846 (array_inv!21193 _keys!1487)))

(declare-fun b!938857 () Bool)

(declare-fun e!527303 () Unit!31622)

(declare-fun Unit!31625 () Unit!31622)

(assert (=> b!938857 (= e!527303 Unit!31625)))

(declare-fun mapIsEmpty!32183 () Bool)

(assert (=> mapIsEmpty!32183 mapRes!32183))

(declare-fun b!938858 () Bool)

(assert (=> b!938858 (= e!527306 e!527304)))

(declare-fun res!631595 () Bool)

(assert (=> b!938858 (=> (not res!631595) (not e!527304))))

(declare-fun v!791 () V!31991)

(declare-fun lt!424055 () V!31991)

(assert (=> b!938858 (= res!631595 (and (= lt!424055 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-fun apply!853 (ListLongMap!12127 (_ BitVec 64)) V!31991)

(assert (=> b!938858 (= lt!424055 (apply!853 lt!424051 k0!1099))))

(declare-fun b!938859 () Bool)

(declare-fun lt!424047 () ListLongMap!12127)

(assert (=> b!938859 (= (apply!853 lt!424047 k0!1099) lt!424055)))

(declare-fun lt!424046 () Unit!31622)

(declare-fun lt!424050 () V!31991)

(declare-fun lt!424042 () (_ BitVec 64))

(declare-fun addApplyDifferent!435 (ListLongMap!12127 (_ BitVec 64) V!31991 (_ BitVec 64)) Unit!31622)

(assert (=> b!938859 (= lt!424046 (addApplyDifferent!435 lt!424051 lt!424042 lt!424050 k0!1099))))

(assert (=> b!938859 (not (= lt!424042 k0!1099))))

(declare-fun lt!424043 () Unit!31622)

(declare-datatypes ((List!19183 0))(
  ( (Nil!19180) (Cons!19179 (h!20325 (_ BitVec 64)) (t!27479 List!19183)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56451 (_ BitVec 64) (_ BitVec 32) List!19183) Unit!31622)

(assert (=> b!938859 (= lt!424043 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19180))))

(declare-fun e!527301 () Bool)

(assert (=> b!938859 e!527301))

(declare-fun c!97890 () Bool)

(assert (=> b!938859 (= c!97890 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!424044 () Unit!31622)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!313 (array!56451 array!56449 (_ BitVec 32) (_ BitVec 32) V!31991 V!31991 (_ BitVec 64) (_ BitVec 32) Int) Unit!31622)

(assert (=> b!938859 (= lt!424044 (lemmaListMapContainsThenArrayContainsFrom!313 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!56451 (_ BitVec 32) List!19183) Bool)

(assert (=> b!938859 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19180)))

(declare-fun lt!424053 () Unit!31622)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56451 (_ BitVec 32) (_ BitVec 32)) Unit!31622)

(assert (=> b!938859 (= lt!424053 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!938859 (contains!5084 lt!424047 k0!1099)))

(declare-fun lt!424045 () tuple2!13440)

(declare-fun +!2866 (ListLongMap!12127 tuple2!13440) ListLongMap!12127)

(assert (=> b!938859 (= lt!424047 (+!2866 lt!424051 lt!424045))))

(declare-fun lt!424048 () Unit!31622)

(declare-fun addStillContains!555 (ListLongMap!12127 (_ BitVec 64) V!31991 (_ BitVec 64)) Unit!31622)

(assert (=> b!938859 (= lt!424048 (addStillContains!555 lt!424051 lt!424042 lt!424050 k0!1099))))

(assert (=> b!938859 (= (getCurrentListMap!3242 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2866 (getCurrentListMap!3242 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!424045))))

(assert (=> b!938859 (= lt!424045 (tuple2!13441 lt!424042 lt!424050))))

(declare-fun get!14336 (ValueCell!9653 V!31991) V!31991)

(declare-fun dynLambda!1622 (Int (_ BitVec 64)) V!31991)

(assert (=> b!938859 (= lt!424050 (get!14336 (select (arr!27163 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1622 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!424054 () Unit!31622)

(declare-fun lemmaListMapRecursiveValidKeyArray!230 (array!56451 array!56449 (_ BitVec 32) (_ BitVec 32) V!31991 V!31991 (_ BitVec 32) Int) Unit!31622)

(assert (=> b!938859 (= lt!424054 (lemmaListMapRecursiveValidKeyArray!230 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!938859 (= e!527303 lt!424046)))

(declare-fun b!938860 () Bool)

(assert (=> b!938860 (= e!527307 e!527303)))

(assert (=> b!938860 (= lt!424042 (select (arr!27164 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97891 () Bool)

(assert (=> b!938860 (= c!97891 (validKeyInArray!0 lt!424042))))

(declare-fun b!938861 () Bool)

(declare-fun e!527308 () Bool)

(assert (=> b!938861 (= e!527299 e!527308)))

(declare-fun res!631586 () Bool)

(assert (=> b!938861 (=> (not res!631586) (not e!527308))))

(declare-fun lt!424049 () ListLongMap!12127)

(assert (=> b!938861 (= res!631586 (contains!5084 lt!424049 k0!1099))))

(assert (=> b!938861 (= lt!424049 (getCurrentListMap!3242 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!938862 () Bool)

(declare-fun res!631591 () Bool)

(assert (=> b!938862 (=> (not res!631591) (not e!527305))))

(assert (=> b!938862 (= res!631591 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19180))))

(declare-fun b!938863 () Bool)

(declare-fun res!631587 () Bool)

(assert (=> b!938863 (=> (not res!631587) (not e!527308))))

(assert (=> b!938863 (= res!631587 (= (apply!853 lt!424049 k0!1099) v!791))))

(declare-fun b!938864 () Bool)

(declare-fun res!631589 () Bool)

(assert (=> b!938864 (=> (not res!631589) (not e!527305))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56451 (_ BitVec 32)) Bool)

(assert (=> b!938864 (= res!631589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!938865 () Bool)

(assert (=> b!938865 (= e!527301 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!938866 () Bool)

(assert (=> b!938866 (= e!527308 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) from!1844))))

(declare-fun b!938867 () Bool)

(declare-fun arrayContainsKey!0 (array!56451 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!938867 (= e!527301 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!938868 () Bool)

(assert (=> b!938868 (= e!527309 tp_is_empty!20269)))

(assert (= (and start!79846 res!631594) b!938856))

(assert (= (and b!938856 res!631592) b!938864))

(assert (= (and b!938864 res!631589) b!938862))

(assert (= (and b!938862 res!631591) b!938855))

(assert (= (and b!938855 res!631588) b!938854))

(assert (= (and b!938854 res!631593) b!938858))

(assert (= (and b!938858 res!631595) b!938851))

(assert (= (and b!938851 c!97892) b!938860))

(assert (= (and b!938851 (not c!97892)) b!938850))

(assert (= (and b!938860 c!97891) b!938859))

(assert (= (and b!938860 (not c!97891)) b!938857))

(assert (= (and b!938859 c!97890) b!938867))

(assert (= (and b!938859 (not c!97890)) b!938865))

(assert (= (and b!938851 res!631590) b!938861))

(assert (= (and b!938861 res!631586) b!938863))

(assert (= (and b!938863 res!631587) b!938866))

(assert (= (and b!938853 condMapEmpty!32183) mapIsEmpty!32183))

(assert (= (and b!938853 (not condMapEmpty!32183)) mapNonEmpty!32183))

(get-info :version)

(assert (= (and mapNonEmpty!32183 ((_ is ValueCellFull!9653) mapValue!32183)) b!938852))

(assert (= (and b!938853 ((_ is ValueCellFull!9653) mapDefault!32183)) b!938868))

(assert (= start!79846 b!938853))

(declare-fun b_lambda!14249 () Bool)

(assert (=> (not b_lambda!14249) (not b!938859)))

(declare-fun t!27477 () Bool)

(declare-fun tb!6147 () Bool)

(assert (=> (and start!79846 (= defaultEntry!1235 defaultEntry!1235) t!27477) tb!6147))

(declare-fun result!12139 () Bool)

(assert (=> tb!6147 (= result!12139 tp_is_empty!20269)))

(assert (=> b!938859 t!27477))

(declare-fun b_and!29137 () Bool)

(assert (= b_and!29135 (and (=> t!27477 result!12139) b_and!29137)))

(declare-fun m!874149 () Bool)

(assert (=> b!938864 m!874149))

(declare-fun m!874151 () Bool)

(assert (=> b!938862 m!874151))

(declare-fun m!874153 () Bool)

(assert (=> b!938861 m!874153))

(declare-fun m!874155 () Bool)

(assert (=> b!938861 m!874155))

(declare-fun m!874157 () Bool)

(assert (=> b!938859 m!874157))

(declare-fun m!874159 () Bool)

(assert (=> b!938859 m!874159))

(declare-fun m!874161 () Bool)

(assert (=> b!938859 m!874161))

(declare-fun m!874163 () Bool)

(assert (=> b!938859 m!874163))

(declare-fun m!874165 () Bool)

(assert (=> b!938859 m!874165))

(declare-fun m!874167 () Bool)

(assert (=> b!938859 m!874167))

(assert (=> b!938859 m!874165))

(assert (=> b!938859 m!874167))

(declare-fun m!874169 () Bool)

(assert (=> b!938859 m!874169))

(assert (=> b!938859 m!874155))

(declare-fun m!874171 () Bool)

(assert (=> b!938859 m!874171))

(declare-fun m!874173 () Bool)

(assert (=> b!938859 m!874173))

(declare-fun m!874175 () Bool)

(assert (=> b!938859 m!874175))

(declare-fun m!874177 () Bool)

(assert (=> b!938859 m!874177))

(declare-fun m!874179 () Bool)

(assert (=> b!938859 m!874179))

(assert (=> b!938859 m!874157))

(declare-fun m!874181 () Bool)

(assert (=> b!938859 m!874181))

(declare-fun m!874183 () Bool)

(assert (=> b!938859 m!874183))

(declare-fun m!874185 () Bool)

(assert (=> b!938859 m!874185))

(declare-fun m!874187 () Bool)

(assert (=> start!79846 m!874187))

(declare-fun m!874189 () Bool)

(assert (=> start!79846 m!874189))

(declare-fun m!874191 () Bool)

(assert (=> start!79846 m!874191))

(declare-fun m!874193 () Bool)

(assert (=> b!938854 m!874193))

(declare-fun m!874195 () Bool)

(assert (=> b!938854 m!874195))

(declare-fun m!874197 () Bool)

(assert (=> mapNonEmpty!32183 m!874197))

(declare-fun m!874199 () Bool)

(assert (=> b!938858 m!874199))

(declare-fun m!874201 () Bool)

(assert (=> b!938851 m!874201))

(declare-fun m!874203 () Bool)

(assert (=> b!938863 m!874203))

(declare-fun m!874205 () Bool)

(assert (=> b!938867 m!874205))

(declare-fun m!874207 () Bool)

(assert (=> b!938860 m!874207))

(declare-fun m!874209 () Bool)

(assert (=> b!938860 m!874209))

(check-sat (not b!938861) (not start!79846) tp_is_empty!20269 (not b!938859) (not b!938858) (not b!938854) (not b_next!17761) (not b_lambda!14249) (not b!938851) (not mapNonEmpty!32183) (not b!938864) b_and!29137 (not b!938862) (not b!938863) (not b!938867) (not b!938860))
(check-sat b_and!29137 (not b_next!17761))
