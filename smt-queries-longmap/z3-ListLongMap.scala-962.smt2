; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20870 () Bool)

(assert start!20870)

(declare-fun b_free!5523 () Bool)

(declare-fun b_next!5523 () Bool)

(assert (=> start!20870 (= b_free!5523 (not b_next!5523))))

(declare-fun tp!19610 () Bool)

(declare-fun b_and!12269 () Bool)

(assert (=> start!20870 (= tp!19610 b_and!12269)))

(declare-fun mapNonEmpty!9146 () Bool)

(declare-fun mapRes!9146 () Bool)

(declare-fun tp!19609 () Bool)

(declare-fun e!136485 () Bool)

(assert (=> mapNonEmpty!9146 (= mapRes!9146 (and tp!19609 e!136485))))

(declare-datatypes ((V!6827 0))(
  ( (V!6828 (val!2737 Int)) )
))
(declare-datatypes ((ValueCell!2349 0))(
  ( (ValueCellFull!2349 (v!4707 V!6827)) (EmptyCell!2349) )
))
(declare-fun mapRest!9146 () (Array (_ BitVec 32) ValueCell!2349))

(declare-fun mapValue!9146 () ValueCell!2349)

(declare-datatypes ((array!9967 0))(
  ( (array!9968 (arr!4734 (Array (_ BitVec 32) ValueCell!2349)) (size!5059 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9967)

(declare-fun mapKey!9146 () (_ BitVec 32))

(assert (=> mapNonEmpty!9146 (= (arr!4734 _values!649) (store mapRest!9146 mapKey!9146 mapValue!9146))))

(declare-fun mapIsEmpty!9146 () Bool)

(assert (=> mapIsEmpty!9146 mapRes!9146))

(declare-fun b!209515 () Bool)

(declare-fun res!102156 () Bool)

(declare-fun e!136489 () Bool)

(assert (=> b!209515 (=> (not res!102156) (not e!136489))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9969 0))(
  ( (array!9970 (arr!4735 (Array (_ BitVec 32) (_ BitVec 64))) (size!5060 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9969)

(assert (=> b!209515 (= res!102156 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5060 _keys!825))))))

(declare-fun b!209516 () Bool)

(declare-fun e!136487 () Bool)

(declare-fun tp_is_empty!5385 () Bool)

(assert (=> b!209516 (= e!136487 tp_is_empty!5385)))

(declare-fun b!209517 () Bool)

(declare-fun res!102150 () Bool)

(assert (=> b!209517 (=> (not res!102150) (not e!136489))))

(declare-datatypes ((List!3032 0))(
  ( (Nil!3029) (Cons!3028 (h!3670 (_ BitVec 64)) (t!7963 List!3032)) )
))
(declare-fun arrayNoDuplicates!0 (array!9969 (_ BitVec 32) List!3032) Bool)

(assert (=> b!209517 (= res!102150 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3029))))

(declare-fun b!209518 () Bool)

(declare-fun res!102153 () Bool)

(assert (=> b!209518 (=> (not res!102153) (not e!136489))))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!209518 (= res!102153 (= (select (arr!4735 _keys!825) i!601) k0!843))))

(declare-fun b!209519 () Bool)

(declare-fun e!136486 () Bool)

(assert (=> b!209519 (= e!136486 (and e!136487 mapRes!9146))))

(declare-fun condMapEmpty!9146 () Bool)

(declare-fun mapDefault!9146 () ValueCell!2349)

(assert (=> b!209519 (= condMapEmpty!9146 (= (arr!4734 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2349)) mapDefault!9146)))))

(declare-fun b!209521 () Bool)

(assert (=> b!209521 (= e!136485 tp_is_empty!5385)))

(declare-fun b!209522 () Bool)

(declare-fun res!102151 () Bool)

(assert (=> b!209522 (=> (not res!102151) (not e!136489))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!209522 (= res!102151 (validKeyInArray!0 k0!843))))

(declare-fun b!209523 () Bool)

(declare-fun e!136490 () Bool)

(assert (=> b!209523 (= e!136489 (not e!136490))))

(declare-fun res!102157 () Bool)

(assert (=> b!209523 (=> res!102157 e!136490)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!209523 (= res!102157 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6827)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6827)

(declare-datatypes ((tuple2!4136 0))(
  ( (tuple2!4137 (_1!2079 (_ BitVec 64)) (_2!2079 V!6827)) )
))
(declare-datatypes ((List!3033 0))(
  ( (Nil!3030) (Cons!3029 (h!3671 tuple2!4136) (t!7964 List!3033)) )
))
(declare-datatypes ((ListLongMap!3049 0))(
  ( (ListLongMap!3050 (toList!1540 List!3033)) )
))
(declare-fun lt!107066 () ListLongMap!3049)

(declare-fun getCurrentListMap!1078 (array!9969 array!9967 (_ BitVec 32) (_ BitVec 32) V!6827 V!6827 (_ BitVec 32) Int) ListLongMap!3049)

(assert (=> b!209523 (= lt!107066 (getCurrentListMap!1078 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107065 () ListLongMap!3049)

(declare-fun lt!107063 () array!9967)

(assert (=> b!209523 (= lt!107065 (getCurrentListMap!1078 _keys!825 lt!107063 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107067 () ListLongMap!3049)

(declare-fun lt!107064 () ListLongMap!3049)

(assert (=> b!209523 (and (= lt!107067 lt!107064) (= lt!107064 lt!107067))))

(declare-fun v!520 () V!6827)

(declare-fun lt!107062 () ListLongMap!3049)

(declare-fun +!543 (ListLongMap!3049 tuple2!4136) ListLongMap!3049)

(assert (=> b!209523 (= lt!107064 (+!543 lt!107062 (tuple2!4137 k0!843 v!520)))))

(declare-datatypes ((Unit!6372 0))(
  ( (Unit!6373) )
))
(declare-fun lt!107061 () Unit!6372)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!195 (array!9969 array!9967 (_ BitVec 32) (_ BitVec 32) V!6827 V!6827 (_ BitVec 32) (_ BitVec 64) V!6827 (_ BitVec 32) Int) Unit!6372)

(assert (=> b!209523 (= lt!107061 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!195 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!480 (array!9969 array!9967 (_ BitVec 32) (_ BitVec 32) V!6827 V!6827 (_ BitVec 32) Int) ListLongMap!3049)

(assert (=> b!209523 (= lt!107067 (getCurrentListMapNoExtraKeys!480 _keys!825 lt!107063 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!209523 (= lt!107063 (array!9968 (store (arr!4734 _values!649) i!601 (ValueCellFull!2349 v!520)) (size!5059 _values!649)))))

(assert (=> b!209523 (= lt!107062 (getCurrentListMapNoExtraKeys!480 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!209524 () Bool)

(declare-fun res!102154 () Bool)

(assert (=> b!209524 (=> (not res!102154) (not e!136489))))

(assert (=> b!209524 (= res!102154 (and (= (size!5059 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5060 _keys!825) (size!5059 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!209525 () Bool)

(declare-fun res!102152 () Bool)

(assert (=> b!209525 (=> (not res!102152) (not e!136489))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9969 (_ BitVec 32)) Bool)

(assert (=> b!209525 (= res!102152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun res!102155 () Bool)

(assert (=> start!20870 (=> (not res!102155) (not e!136489))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20870 (= res!102155 (validMask!0 mask!1149))))

(assert (=> start!20870 e!136489))

(declare-fun array_inv!3137 (array!9967) Bool)

(assert (=> start!20870 (and (array_inv!3137 _values!649) e!136486)))

(assert (=> start!20870 true))

(assert (=> start!20870 tp_is_empty!5385))

(declare-fun array_inv!3138 (array!9969) Bool)

(assert (=> start!20870 (array_inv!3138 _keys!825)))

(assert (=> start!20870 tp!19610))

(declare-fun b!209520 () Bool)

(assert (=> b!209520 (= e!136490 (= lt!107065 (+!543 (+!543 lt!107067 (tuple2!4137 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615)) (tuple2!4137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(assert (= (and start!20870 res!102155) b!209524))

(assert (= (and b!209524 res!102154) b!209525))

(assert (= (and b!209525 res!102152) b!209517))

(assert (= (and b!209517 res!102150) b!209515))

(assert (= (and b!209515 res!102156) b!209522))

(assert (= (and b!209522 res!102151) b!209518))

(assert (= (and b!209518 res!102153) b!209523))

(assert (= (and b!209523 (not res!102157)) b!209520))

(assert (= (and b!209519 condMapEmpty!9146) mapIsEmpty!9146))

(assert (= (and b!209519 (not condMapEmpty!9146)) mapNonEmpty!9146))

(get-info :version)

(assert (= (and mapNonEmpty!9146 ((_ is ValueCellFull!2349) mapValue!9146)) b!209521))

(assert (= (and b!209519 ((_ is ValueCellFull!2349) mapDefault!9146)) b!209516))

(assert (= start!20870 b!209519))

(declare-fun m!236891 () Bool)

(assert (=> b!209520 m!236891))

(assert (=> b!209520 m!236891))

(declare-fun m!236893 () Bool)

(assert (=> b!209520 m!236893))

(declare-fun m!236895 () Bool)

(assert (=> b!209517 m!236895))

(declare-fun m!236897 () Bool)

(assert (=> b!209522 m!236897))

(declare-fun m!236899 () Bool)

(assert (=> start!20870 m!236899))

(declare-fun m!236901 () Bool)

(assert (=> start!20870 m!236901))

(declare-fun m!236903 () Bool)

(assert (=> start!20870 m!236903))

(declare-fun m!236905 () Bool)

(assert (=> mapNonEmpty!9146 m!236905))

(declare-fun m!236907 () Bool)

(assert (=> b!209518 m!236907))

(declare-fun m!236909 () Bool)

(assert (=> b!209523 m!236909))

(declare-fun m!236911 () Bool)

(assert (=> b!209523 m!236911))

(declare-fun m!236913 () Bool)

(assert (=> b!209523 m!236913))

(declare-fun m!236915 () Bool)

(assert (=> b!209523 m!236915))

(declare-fun m!236917 () Bool)

(assert (=> b!209523 m!236917))

(declare-fun m!236919 () Bool)

(assert (=> b!209523 m!236919))

(declare-fun m!236921 () Bool)

(assert (=> b!209523 m!236921))

(declare-fun m!236923 () Bool)

(assert (=> b!209525 m!236923))

(check-sat (not b!209523) (not b_next!5523) tp_is_empty!5385 (not start!20870) b_and!12269 (not b!209517) (not mapNonEmpty!9146) (not b!209522) (not b!209520) (not b!209525))
(check-sat b_and!12269 (not b_next!5523))
(get-model)

(declare-fun d!57861 () Bool)

(declare-fun e!136511 () Bool)

(assert (=> d!57861 e!136511))

(declare-fun res!102186 () Bool)

(assert (=> d!57861 (=> (not res!102186) (not e!136511))))

(declare-fun lt!107100 () ListLongMap!3049)

(declare-fun contains!1389 (ListLongMap!3049 (_ BitVec 64)) Bool)

(assert (=> d!57861 (= res!102186 (contains!1389 lt!107100 (_1!2079 (tuple2!4137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun lt!107097 () List!3033)

(assert (=> d!57861 (= lt!107100 (ListLongMap!3050 lt!107097))))

(declare-fun lt!107099 () Unit!6372)

(declare-fun lt!107098 () Unit!6372)

(assert (=> d!57861 (= lt!107099 lt!107098)))

(declare-datatypes ((Option!253 0))(
  ( (Some!252 (v!4712 V!6827)) (None!251) )
))
(declare-fun getValueByKey!247 (List!3033 (_ BitVec 64)) Option!253)

(assert (=> d!57861 (= (getValueByKey!247 lt!107097 (_1!2079 (tuple2!4137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))) (Some!252 (_2!2079 (tuple2!4137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun lemmaContainsTupThenGetReturnValue!134 (List!3033 (_ BitVec 64) V!6827) Unit!6372)

(assert (=> d!57861 (= lt!107098 (lemmaContainsTupThenGetReturnValue!134 lt!107097 (_1!2079 (tuple2!4137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)) (_2!2079 (tuple2!4137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun insertStrictlySorted!137 (List!3033 (_ BitVec 64) V!6827) List!3033)

(assert (=> d!57861 (= lt!107097 (insertStrictlySorted!137 (toList!1540 (+!543 lt!107067 (tuple2!4137 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))) (_1!2079 (tuple2!4137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)) (_2!2079 (tuple2!4137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(assert (=> d!57861 (= (+!543 (+!543 lt!107067 (tuple2!4137 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615)) (tuple2!4137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)) lt!107100)))

(declare-fun b!209563 () Bool)

(declare-fun res!102187 () Bool)

(assert (=> b!209563 (=> (not res!102187) (not e!136511))))

(assert (=> b!209563 (= res!102187 (= (getValueByKey!247 (toList!1540 lt!107100) (_1!2079 (tuple2!4137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))) (Some!252 (_2!2079 (tuple2!4137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))))

(declare-fun b!209564 () Bool)

(declare-fun contains!1390 (List!3033 tuple2!4136) Bool)

(assert (=> b!209564 (= e!136511 (contains!1390 (toList!1540 lt!107100) (tuple2!4137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(assert (= (and d!57861 res!102186) b!209563))

(assert (= (and b!209563 res!102187) b!209564))

(declare-fun m!236959 () Bool)

(assert (=> d!57861 m!236959))

(declare-fun m!236961 () Bool)

(assert (=> d!57861 m!236961))

(declare-fun m!236963 () Bool)

(assert (=> d!57861 m!236963))

(declare-fun m!236965 () Bool)

(assert (=> d!57861 m!236965))

(declare-fun m!236967 () Bool)

(assert (=> b!209563 m!236967))

(declare-fun m!236969 () Bool)

(assert (=> b!209564 m!236969))

(assert (=> b!209520 d!57861))

(declare-fun d!57863 () Bool)

(declare-fun e!136512 () Bool)

(assert (=> d!57863 e!136512))

(declare-fun res!102188 () Bool)

(assert (=> d!57863 (=> (not res!102188) (not e!136512))))

(declare-fun lt!107104 () ListLongMap!3049)

(assert (=> d!57863 (= res!102188 (contains!1389 lt!107104 (_1!2079 (tuple2!4137 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))))

(declare-fun lt!107101 () List!3033)

(assert (=> d!57863 (= lt!107104 (ListLongMap!3050 lt!107101))))

(declare-fun lt!107103 () Unit!6372)

(declare-fun lt!107102 () Unit!6372)

(assert (=> d!57863 (= lt!107103 lt!107102)))

(assert (=> d!57863 (= (getValueByKey!247 lt!107101 (_1!2079 (tuple2!4137 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))) (Some!252 (_2!2079 (tuple2!4137 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))))

(assert (=> d!57863 (= lt!107102 (lemmaContainsTupThenGetReturnValue!134 lt!107101 (_1!2079 (tuple2!4137 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615)) (_2!2079 (tuple2!4137 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))))

(assert (=> d!57863 (= lt!107101 (insertStrictlySorted!137 (toList!1540 lt!107067) (_1!2079 (tuple2!4137 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615)) (_2!2079 (tuple2!4137 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))))

(assert (=> d!57863 (= (+!543 lt!107067 (tuple2!4137 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615)) lt!107104)))

(declare-fun b!209565 () Bool)

(declare-fun res!102189 () Bool)

(assert (=> b!209565 (=> (not res!102189) (not e!136512))))

(assert (=> b!209565 (= res!102189 (= (getValueByKey!247 (toList!1540 lt!107104) (_1!2079 (tuple2!4137 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))) (Some!252 (_2!2079 (tuple2!4137 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615)))))))

(declare-fun b!209566 () Bool)

(assert (=> b!209566 (= e!136512 (contains!1390 (toList!1540 lt!107104) (tuple2!4137 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615)))))

(assert (= (and d!57863 res!102188) b!209565))

(assert (= (and b!209565 res!102189) b!209566))

(declare-fun m!236971 () Bool)

(assert (=> d!57863 m!236971))

(declare-fun m!236973 () Bool)

(assert (=> d!57863 m!236973))

(declare-fun m!236975 () Bool)

(assert (=> d!57863 m!236975))

(declare-fun m!236977 () Bool)

(assert (=> d!57863 m!236977))

(declare-fun m!236979 () Bool)

(assert (=> b!209565 m!236979))

(declare-fun m!236981 () Bool)

(assert (=> b!209566 m!236981))

(assert (=> b!209520 d!57863))

(declare-fun b!209576 () Bool)

(declare-fun e!136520 () Bool)

(declare-fun call!19779 () Bool)

(assert (=> b!209576 (= e!136520 call!19779)))

(declare-fun bm!19776 () Bool)

(assert (=> bm!19776 (= call!19779 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(declare-fun b!209577 () Bool)

(declare-fun e!136519 () Bool)

(assert (=> b!209577 (= e!136519 call!19779)))

(declare-fun b!209578 () Bool)

(assert (=> b!209578 (= e!136519 e!136520)))

(declare-fun lt!107112 () (_ BitVec 64))

(assert (=> b!209578 (= lt!107112 (select (arr!4735 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107113 () Unit!6372)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!9969 (_ BitVec 64) (_ BitVec 32)) Unit!6372)

(assert (=> b!209578 (= lt!107113 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!107112 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!9969 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!209578 (arrayContainsKey!0 _keys!825 lt!107112 #b00000000000000000000000000000000)))

(declare-fun lt!107111 () Unit!6372)

(assert (=> b!209578 (= lt!107111 lt!107113)))

(declare-fun res!102195 () Bool)

(declare-datatypes ((SeekEntryResult!704 0))(
  ( (MissingZero!704 (index!4986 (_ BitVec 32))) (Found!704 (index!4987 (_ BitVec 32))) (Intermediate!704 (undefined!1516 Bool) (index!4988 (_ BitVec 32)) (x!21974 (_ BitVec 32))) (Undefined!704) (MissingVacant!704 (index!4989 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!9969 (_ BitVec 32)) SeekEntryResult!704)

(assert (=> b!209578 (= res!102195 (= (seekEntryOrOpen!0 (select (arr!4735 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!704 #b00000000000000000000000000000000)))))

(assert (=> b!209578 (=> (not res!102195) (not e!136520))))

(declare-fun b!209575 () Bool)

(declare-fun e!136521 () Bool)

(assert (=> b!209575 (= e!136521 e!136519)))

(declare-fun c!35438 () Bool)

(assert (=> b!209575 (= c!35438 (validKeyInArray!0 (select (arr!4735 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun d!57865 () Bool)

(declare-fun res!102194 () Bool)

(assert (=> d!57865 (=> res!102194 e!136521)))

(assert (=> d!57865 (= res!102194 (bvsge #b00000000000000000000000000000000 (size!5060 _keys!825)))))

(assert (=> d!57865 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!136521)))

(assert (= (and d!57865 (not res!102194)) b!209575))

(assert (= (and b!209575 c!35438) b!209578))

(assert (= (and b!209575 (not c!35438)) b!209577))

(assert (= (and b!209578 res!102195) b!209576))

(assert (= (or b!209576 b!209577) bm!19776))

(declare-fun m!236983 () Bool)

(assert (=> bm!19776 m!236983))

(declare-fun m!236985 () Bool)

(assert (=> b!209578 m!236985))

(declare-fun m!236987 () Bool)

(assert (=> b!209578 m!236987))

(declare-fun m!236989 () Bool)

(assert (=> b!209578 m!236989))

(assert (=> b!209578 m!236985))

(declare-fun m!236991 () Bool)

(assert (=> b!209578 m!236991))

(assert (=> b!209575 m!236985))

(assert (=> b!209575 m!236985))

(declare-fun m!236993 () Bool)

(assert (=> b!209575 m!236993))

(assert (=> b!209525 d!57865))

(declare-fun d!57867 () Bool)

(assert (=> d!57867 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!20870 d!57867))

(declare-fun d!57869 () Bool)

(assert (=> d!57869 (= (array_inv!3137 _values!649) (bvsge (size!5059 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!20870 d!57869))

(declare-fun d!57871 () Bool)

(assert (=> d!57871 (= (array_inv!3138 _keys!825) (bvsge (size!5060 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!20870 d!57871))

(declare-fun b!209603 () Bool)

(declare-fun lt!107132 () Unit!6372)

(declare-fun lt!107129 () Unit!6372)

(assert (=> b!209603 (= lt!107132 lt!107129)))

(declare-fun lt!107131 () V!6827)

(declare-fun lt!107134 () ListLongMap!3049)

(declare-fun lt!107133 () (_ BitVec 64))

(declare-fun lt!107128 () (_ BitVec 64))

(assert (=> b!209603 (not (contains!1389 (+!543 lt!107134 (tuple2!4137 lt!107133 lt!107131)) lt!107128))))

(declare-fun addStillNotContains!98 (ListLongMap!3049 (_ BitVec 64) V!6827 (_ BitVec 64)) Unit!6372)

(assert (=> b!209603 (= lt!107129 (addStillNotContains!98 lt!107134 lt!107133 lt!107131 lt!107128))))

(assert (=> b!209603 (= lt!107128 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!2539 (ValueCell!2349 V!6827) V!6827)

(declare-fun dynLambda!532 (Int (_ BitVec 64)) V!6827)

(assert (=> b!209603 (= lt!107131 (get!2539 (select (arr!4734 lt!107063) #b00000000000000000000000000000000) (dynLambda!532 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209603 (= lt!107133 (select (arr!4735 _keys!825) #b00000000000000000000000000000000))))

(declare-fun call!19782 () ListLongMap!3049)

(assert (=> b!209603 (= lt!107134 call!19782)))

(declare-fun e!136541 () ListLongMap!3049)

(assert (=> b!209603 (= e!136541 (+!543 call!19782 (tuple2!4137 (select (arr!4735 _keys!825) #b00000000000000000000000000000000) (get!2539 (select (arr!4734 lt!107063) #b00000000000000000000000000000000) (dynLambda!532 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!209604 () Bool)

(assert (=> b!209604 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5060 _keys!825)))))

(assert (=> b!209604 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5059 lt!107063)))))

(declare-fun lt!107130 () ListLongMap!3049)

(declare-fun e!136540 () Bool)

(declare-fun apply!189 (ListLongMap!3049 (_ BitVec 64)) V!6827)

(assert (=> b!209604 (= e!136540 (= (apply!189 lt!107130 (select (arr!4735 _keys!825) #b00000000000000000000000000000000)) (get!2539 (select (arr!4734 lt!107063) #b00000000000000000000000000000000) (dynLambda!532 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!209605 () Bool)

(declare-fun e!136538 () ListLongMap!3049)

(assert (=> b!209605 (= e!136538 (ListLongMap!3050 Nil!3030))))

(declare-fun b!209606 () Bool)

(declare-fun e!136539 () Bool)

(assert (=> b!209606 (= e!136539 (validKeyInArray!0 (select (arr!4735 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!209606 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!209607 () Bool)

(declare-fun res!102205 () Bool)

(declare-fun e!136542 () Bool)

(assert (=> b!209607 (=> (not res!102205) (not e!136542))))

(assert (=> b!209607 (= res!102205 (not (contains!1389 lt!107130 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!209609 () Bool)

(assert (=> b!209609 (= e!136541 call!19782)))

(declare-fun b!209610 () Bool)

(declare-fun e!136537 () Bool)

(assert (=> b!209610 (= e!136537 (= lt!107130 (getCurrentListMapNoExtraKeys!480 _keys!825 lt!107063 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!209611 () Bool)

(declare-fun e!136536 () Bool)

(assert (=> b!209611 (= e!136536 e!136537)))

(declare-fun c!35448 () Bool)

(assert (=> b!209611 (= c!35448 (bvslt #b00000000000000000000000000000000 (size!5060 _keys!825)))))

(declare-fun d!57873 () Bool)

(assert (=> d!57873 e!136542))

(declare-fun res!102206 () Bool)

(assert (=> d!57873 (=> (not res!102206) (not e!136542))))

(assert (=> d!57873 (= res!102206 (not (contains!1389 lt!107130 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57873 (= lt!107130 e!136538)))

(declare-fun c!35449 () Bool)

(assert (=> d!57873 (= c!35449 (bvsge #b00000000000000000000000000000000 (size!5060 _keys!825)))))

(assert (=> d!57873 (validMask!0 mask!1149)))

(assert (=> d!57873 (= (getCurrentListMapNoExtraKeys!480 _keys!825 lt!107063 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!107130)))

(declare-fun b!209608 () Bool)

(assert (=> b!209608 (= e!136536 e!136540)))

(assert (=> b!209608 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5060 _keys!825)))))

(declare-fun res!102204 () Bool)

(assert (=> b!209608 (= res!102204 (contains!1389 lt!107130 (select (arr!4735 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!209608 (=> (not res!102204) (not e!136540))))

(declare-fun b!209612 () Bool)

(assert (=> b!209612 (= e!136542 e!136536)))

(declare-fun c!35450 () Bool)

(assert (=> b!209612 (= c!35450 e!136539)))

(declare-fun res!102207 () Bool)

(assert (=> b!209612 (=> (not res!102207) (not e!136539))))

(assert (=> b!209612 (= res!102207 (bvslt #b00000000000000000000000000000000 (size!5060 _keys!825)))))

(declare-fun b!209613 () Bool)

(declare-fun isEmpty!490 (ListLongMap!3049) Bool)

(assert (=> b!209613 (= e!136537 (isEmpty!490 lt!107130))))

(declare-fun b!209614 () Bool)

(assert (=> b!209614 (= e!136538 e!136541)))

(declare-fun c!35447 () Bool)

(assert (=> b!209614 (= c!35447 (validKeyInArray!0 (select (arr!4735 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!19779 () Bool)

(assert (=> bm!19779 (= call!19782 (getCurrentListMapNoExtraKeys!480 _keys!825 lt!107063 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(assert (= (and d!57873 c!35449) b!209605))

(assert (= (and d!57873 (not c!35449)) b!209614))

(assert (= (and b!209614 c!35447) b!209603))

(assert (= (and b!209614 (not c!35447)) b!209609))

(assert (= (or b!209603 b!209609) bm!19779))

(assert (= (and d!57873 res!102206) b!209607))

(assert (= (and b!209607 res!102205) b!209612))

(assert (= (and b!209612 res!102207) b!209606))

(assert (= (and b!209612 c!35450) b!209608))

(assert (= (and b!209612 (not c!35450)) b!209611))

(assert (= (and b!209608 res!102204) b!209604))

(assert (= (and b!209611 c!35448) b!209610))

(assert (= (and b!209611 (not c!35448)) b!209613))

(declare-fun b_lambda!7539 () Bool)

(assert (=> (not b_lambda!7539) (not b!209603)))

(declare-fun t!7968 () Bool)

(declare-fun tb!2891 () Bool)

(assert (=> (and start!20870 (= defaultEntry!657 defaultEntry!657) t!7968) tb!2891))

(declare-fun result!4961 () Bool)

(assert (=> tb!2891 (= result!4961 tp_is_empty!5385)))

(assert (=> b!209603 t!7968))

(declare-fun b_and!12273 () Bool)

(assert (= b_and!12269 (and (=> t!7968 result!4961) b_and!12273)))

(declare-fun b_lambda!7541 () Bool)

(assert (=> (not b_lambda!7541) (not b!209604)))

(assert (=> b!209604 t!7968))

(declare-fun b_and!12275 () Bool)

(assert (= b_and!12273 (and (=> t!7968 result!4961) b_and!12275)))

(declare-fun m!236995 () Bool)

(assert (=> b!209610 m!236995))

(assert (=> b!209606 m!236985))

(assert (=> b!209606 m!236985))

(assert (=> b!209606 m!236993))

(assert (=> b!209614 m!236985))

(assert (=> b!209614 m!236985))

(assert (=> b!209614 m!236993))

(declare-fun m!236997 () Bool)

(assert (=> b!209603 m!236997))

(declare-fun m!236999 () Bool)

(assert (=> b!209603 m!236999))

(declare-fun m!237001 () Bool)

(assert (=> b!209603 m!237001))

(declare-fun m!237003 () Bool)

(assert (=> b!209603 m!237003))

(assert (=> b!209603 m!236985))

(assert (=> b!209603 m!236999))

(declare-fun m!237005 () Bool)

(assert (=> b!209603 m!237005))

(assert (=> b!209603 m!237005))

(declare-fun m!237007 () Bool)

(assert (=> b!209603 m!237007))

(assert (=> b!209603 m!236997))

(declare-fun m!237009 () Bool)

(assert (=> b!209603 m!237009))

(declare-fun m!237011 () Bool)

(assert (=> b!209607 m!237011))

(assert (=> b!209604 m!236997))

(assert (=> b!209604 m!236985))

(declare-fun m!237013 () Bool)

(assert (=> b!209604 m!237013))

(assert (=> b!209604 m!236997))

(assert (=> b!209604 m!236999))

(assert (=> b!209604 m!237001))

(assert (=> b!209604 m!236985))

(assert (=> b!209604 m!236999))

(assert (=> bm!19779 m!236995))

(declare-fun m!237015 () Bool)

(assert (=> b!209613 m!237015))

(declare-fun m!237017 () Bool)

(assert (=> d!57873 m!237017))

(assert (=> d!57873 m!236899))

(assert (=> b!209608 m!236985))

(assert (=> b!209608 m!236985))

(declare-fun m!237019 () Bool)

(assert (=> b!209608 m!237019))

(assert (=> b!209523 d!57873))

(declare-fun d!57875 () Bool)

(declare-fun e!136577 () Bool)

(assert (=> d!57875 e!136577))

(declare-fun res!102228 () Bool)

(assert (=> d!57875 (=> (not res!102228) (not e!136577))))

(assert (=> d!57875 (= res!102228 (or (bvsge #b00000000000000000000000000000000 (size!5060 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5060 _keys!825)))))))

(declare-fun lt!107179 () ListLongMap!3049)

(declare-fun lt!107191 () ListLongMap!3049)

(assert (=> d!57875 (= lt!107179 lt!107191)))

(declare-fun lt!107197 () Unit!6372)

(declare-fun e!136579 () Unit!6372)

(assert (=> d!57875 (= lt!107197 e!136579)))

(declare-fun c!35467 () Bool)

(declare-fun e!136570 () Bool)

(assert (=> d!57875 (= c!35467 e!136570)))

(declare-fun res!102233 () Bool)

(assert (=> d!57875 (=> (not res!102233) (not e!136570))))

(assert (=> d!57875 (= res!102233 (bvslt #b00000000000000000000000000000000 (size!5060 _keys!825)))))

(declare-fun e!136573 () ListLongMap!3049)

(assert (=> d!57875 (= lt!107191 e!136573)))

(declare-fun c!35463 () Bool)

(assert (=> d!57875 (= c!35463 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!57875 (validMask!0 mask!1149)))

(assert (=> d!57875 (= (getCurrentListMap!1078 _keys!825 lt!107063 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!107179)))

(declare-fun bm!19794 () Bool)

(declare-fun call!19803 () Bool)

(assert (=> bm!19794 (= call!19803 (contains!1389 lt!107179 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!209659 () Bool)

(declare-fun e!136575 () Bool)

(declare-fun e!136580 () Bool)

(assert (=> b!209659 (= e!136575 e!136580)))

(declare-fun res!102230 () Bool)

(declare-fun call!19802 () Bool)

(assert (=> b!209659 (= res!102230 call!19802)))

(assert (=> b!209659 (=> (not res!102230) (not e!136580))))

(declare-fun b!209660 () Bool)

(assert (=> b!209660 (= e!136575 (not call!19802))))

(declare-fun b!209661 () Bool)

(declare-fun res!102227 () Bool)

(assert (=> b!209661 (=> (not res!102227) (not e!136577))))

(assert (=> b!209661 (= res!102227 e!136575)))

(declare-fun c!35466 () Bool)

(assert (=> b!209661 (= c!35466 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!209662 () Bool)

(declare-fun e!136574 () ListLongMap!3049)

(declare-fun call!19798 () ListLongMap!3049)

(assert (=> b!209662 (= e!136574 call!19798)))

(declare-fun b!209663 () Bool)

(assert (=> b!209663 (= e!136580 (= (apply!189 lt!107179 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun b!209664 () Bool)

(declare-fun e!136572 () ListLongMap!3049)

(assert (=> b!209664 (= e!136572 call!19798)))

(declare-fun b!209665 () Bool)

(declare-fun call!19801 () ListLongMap!3049)

(assert (=> b!209665 (= e!136574 call!19801)))

(declare-fun b!209666 () Bool)

(declare-fun call!19797 () ListLongMap!3049)

(assert (=> b!209666 (= e!136573 (+!543 call!19797 (tuple2!4137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun b!209667 () Bool)

(declare-fun e!136578 () Bool)

(assert (=> b!209667 (= e!136578 (not call!19803))))

(declare-fun b!209668 () Bool)

(assert (=> b!209668 (= e!136577 e!136578)))

(declare-fun c!35468 () Bool)

(assert (=> b!209668 (= c!35468 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!209669 () Bool)

(declare-fun e!136569 () Bool)

(assert (=> b!209669 (= e!136578 e!136569)))

(declare-fun res!102234 () Bool)

(assert (=> b!209669 (= res!102234 call!19803)))

(assert (=> b!209669 (=> (not res!102234) (not e!136569))))

(declare-fun b!209670 () Bool)

(declare-fun lt!107185 () Unit!6372)

(assert (=> b!209670 (= e!136579 lt!107185)))

(declare-fun lt!107190 () ListLongMap!3049)

(assert (=> b!209670 (= lt!107190 (getCurrentListMapNoExtraKeys!480 _keys!825 lt!107063 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107193 () (_ BitVec 64))

(assert (=> b!209670 (= lt!107193 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107189 () (_ BitVec 64))

(assert (=> b!209670 (= lt!107189 (select (arr!4735 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107182 () Unit!6372)

(declare-fun addStillContains!165 (ListLongMap!3049 (_ BitVec 64) V!6827 (_ BitVec 64)) Unit!6372)

(assert (=> b!209670 (= lt!107182 (addStillContains!165 lt!107190 lt!107193 zeroValue!615 lt!107189))))

(assert (=> b!209670 (contains!1389 (+!543 lt!107190 (tuple2!4137 lt!107193 zeroValue!615)) lt!107189)))

(declare-fun lt!107194 () Unit!6372)

(assert (=> b!209670 (= lt!107194 lt!107182)))

(declare-fun lt!107199 () ListLongMap!3049)

(assert (=> b!209670 (= lt!107199 (getCurrentListMapNoExtraKeys!480 _keys!825 lt!107063 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107188 () (_ BitVec 64))

(assert (=> b!209670 (= lt!107188 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107184 () (_ BitVec 64))

(assert (=> b!209670 (= lt!107184 (select (arr!4735 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107198 () Unit!6372)

(declare-fun addApplyDifferent!165 (ListLongMap!3049 (_ BitVec 64) V!6827 (_ BitVec 64)) Unit!6372)

(assert (=> b!209670 (= lt!107198 (addApplyDifferent!165 lt!107199 lt!107188 minValue!615 lt!107184))))

(assert (=> b!209670 (= (apply!189 (+!543 lt!107199 (tuple2!4137 lt!107188 minValue!615)) lt!107184) (apply!189 lt!107199 lt!107184))))

(declare-fun lt!107186 () Unit!6372)

(assert (=> b!209670 (= lt!107186 lt!107198)))

(declare-fun lt!107180 () ListLongMap!3049)

(assert (=> b!209670 (= lt!107180 (getCurrentListMapNoExtraKeys!480 _keys!825 lt!107063 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107183 () (_ BitVec 64))

(assert (=> b!209670 (= lt!107183 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107200 () (_ BitVec 64))

(assert (=> b!209670 (= lt!107200 (select (arr!4735 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107187 () Unit!6372)

(assert (=> b!209670 (= lt!107187 (addApplyDifferent!165 lt!107180 lt!107183 zeroValue!615 lt!107200))))

(assert (=> b!209670 (= (apply!189 (+!543 lt!107180 (tuple2!4137 lt!107183 zeroValue!615)) lt!107200) (apply!189 lt!107180 lt!107200))))

(declare-fun lt!107192 () Unit!6372)

(assert (=> b!209670 (= lt!107192 lt!107187)))

(declare-fun lt!107181 () ListLongMap!3049)

(assert (=> b!209670 (= lt!107181 (getCurrentListMapNoExtraKeys!480 _keys!825 lt!107063 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107195 () (_ BitVec 64))

(assert (=> b!209670 (= lt!107195 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107196 () (_ BitVec 64))

(assert (=> b!209670 (= lt!107196 (select (arr!4735 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!209670 (= lt!107185 (addApplyDifferent!165 lt!107181 lt!107195 minValue!615 lt!107196))))

(assert (=> b!209670 (= (apply!189 (+!543 lt!107181 (tuple2!4137 lt!107195 minValue!615)) lt!107196) (apply!189 lt!107181 lt!107196))))

(declare-fun b!209671 () Bool)

(assert (=> b!209671 (= e!136569 (= (apply!189 lt!107179 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun b!209672 () Bool)

(declare-fun res!102231 () Bool)

(assert (=> b!209672 (=> (not res!102231) (not e!136577))))

(declare-fun e!136571 () Bool)

(assert (=> b!209672 (= res!102231 e!136571)))

(declare-fun res!102226 () Bool)

(assert (=> b!209672 (=> res!102226 e!136571)))

(declare-fun e!136581 () Bool)

(assert (=> b!209672 (= res!102226 (not e!136581))))

(declare-fun res!102232 () Bool)

(assert (=> b!209672 (=> (not res!102232) (not e!136581))))

(assert (=> b!209672 (= res!102232 (bvslt #b00000000000000000000000000000000 (size!5060 _keys!825)))))

(declare-fun bm!19795 () Bool)

(declare-fun call!19800 () ListLongMap!3049)

(assert (=> bm!19795 (= call!19801 call!19800)))

(declare-fun b!209673 () Bool)

(declare-fun Unit!6376 () Unit!6372)

(assert (=> b!209673 (= e!136579 Unit!6376)))

(declare-fun bm!19796 () Bool)

(assert (=> bm!19796 (= call!19798 call!19797)))

(declare-fun bm!19797 () Bool)

(declare-fun call!19799 () ListLongMap!3049)

(assert (=> bm!19797 (= call!19800 call!19799)))

(declare-fun b!209674 () Bool)

(assert (=> b!209674 (= e!136573 e!136572)))

(declare-fun c!35464 () Bool)

(assert (=> b!209674 (= c!35464 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!209675 () Bool)

(assert (=> b!209675 (= e!136570 (validKeyInArray!0 (select (arr!4735 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun e!136576 () Bool)

(declare-fun b!209676 () Bool)

(assert (=> b!209676 (= e!136576 (= (apply!189 lt!107179 (select (arr!4735 _keys!825) #b00000000000000000000000000000000)) (get!2539 (select (arr!4734 lt!107063) #b00000000000000000000000000000000) (dynLambda!532 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!209676 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5059 lt!107063)))))

(assert (=> b!209676 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5060 _keys!825)))))

(declare-fun bm!19798 () Bool)

(assert (=> bm!19798 (= call!19802 (contains!1389 lt!107179 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!19799 () Bool)

(assert (=> bm!19799 (= call!19797 (+!543 (ite c!35463 call!19799 (ite c!35464 call!19800 call!19801)) (ite (or c!35463 c!35464) (tuple2!4137 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun bm!19800 () Bool)

(assert (=> bm!19800 (= call!19799 (getCurrentListMapNoExtraKeys!480 _keys!825 lt!107063 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!209677 () Bool)

(declare-fun c!35465 () Bool)

(assert (=> b!209677 (= c!35465 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!209677 (= e!136572 e!136574)))

(declare-fun b!209678 () Bool)

(assert (=> b!209678 (= e!136571 e!136576)))

(declare-fun res!102229 () Bool)

(assert (=> b!209678 (=> (not res!102229) (not e!136576))))

(assert (=> b!209678 (= res!102229 (contains!1389 lt!107179 (select (arr!4735 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!209678 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5060 _keys!825)))))

(declare-fun b!209679 () Bool)

(assert (=> b!209679 (= e!136581 (validKeyInArray!0 (select (arr!4735 _keys!825) #b00000000000000000000000000000000)))))

(assert (= (and d!57875 c!35463) b!209666))

(assert (= (and d!57875 (not c!35463)) b!209674))

(assert (= (and b!209674 c!35464) b!209664))

(assert (= (and b!209674 (not c!35464)) b!209677))

(assert (= (and b!209677 c!35465) b!209662))

(assert (= (and b!209677 (not c!35465)) b!209665))

(assert (= (or b!209662 b!209665) bm!19795))

(assert (= (or b!209664 bm!19795) bm!19797))

(assert (= (or b!209664 b!209662) bm!19796))

(assert (= (or b!209666 bm!19797) bm!19800))

(assert (= (or b!209666 bm!19796) bm!19799))

(assert (= (and d!57875 res!102233) b!209675))

(assert (= (and d!57875 c!35467) b!209670))

(assert (= (and d!57875 (not c!35467)) b!209673))

(assert (= (and d!57875 res!102228) b!209672))

(assert (= (and b!209672 res!102232) b!209679))

(assert (= (and b!209672 (not res!102226)) b!209678))

(assert (= (and b!209678 res!102229) b!209676))

(assert (= (and b!209672 res!102231) b!209661))

(assert (= (and b!209661 c!35466) b!209659))

(assert (= (and b!209661 (not c!35466)) b!209660))

(assert (= (and b!209659 res!102230) b!209663))

(assert (= (or b!209659 b!209660) bm!19798))

(assert (= (and b!209661 res!102227) b!209668))

(assert (= (and b!209668 c!35468) b!209669))

(assert (= (and b!209668 (not c!35468)) b!209667))

(assert (= (and b!209669 res!102234) b!209671))

(assert (= (or b!209669 b!209667) bm!19794))

(declare-fun b_lambda!7543 () Bool)

(assert (=> (not b_lambda!7543) (not b!209676)))

(assert (=> b!209676 t!7968))

(declare-fun b_and!12277 () Bool)

(assert (= b_and!12275 (and (=> t!7968 result!4961) b_and!12277)))

(declare-fun m!237021 () Bool)

(assert (=> bm!19794 m!237021))

(assert (=> b!209679 m!236985))

(assert (=> b!209679 m!236985))

(assert (=> b!209679 m!236993))

(declare-fun m!237023 () Bool)

(assert (=> b!209666 m!237023))

(declare-fun m!237025 () Bool)

(assert (=> bm!19799 m!237025))

(assert (=> d!57875 m!236899))

(assert (=> bm!19800 m!236909))

(declare-fun m!237027 () Bool)

(assert (=> b!209663 m!237027))

(assert (=> b!209675 m!236985))

(assert (=> b!209675 m!236985))

(assert (=> b!209675 m!236993))

(declare-fun m!237029 () Bool)

(assert (=> b!209670 m!237029))

(assert (=> b!209670 m!236985))

(declare-fun m!237031 () Bool)

(assert (=> b!209670 m!237031))

(declare-fun m!237033 () Bool)

(assert (=> b!209670 m!237033))

(assert (=> b!209670 m!237031))

(declare-fun m!237035 () Bool)

(assert (=> b!209670 m!237035))

(declare-fun m!237037 () Bool)

(assert (=> b!209670 m!237037))

(declare-fun m!237039 () Bool)

(assert (=> b!209670 m!237039))

(declare-fun m!237041 () Bool)

(assert (=> b!209670 m!237041))

(declare-fun m!237043 () Bool)

(assert (=> b!209670 m!237043))

(assert (=> b!209670 m!236909))

(declare-fun m!237045 () Bool)

(assert (=> b!209670 m!237045))

(declare-fun m!237047 () Bool)

(assert (=> b!209670 m!237047))

(assert (=> b!209670 m!237045))

(declare-fun m!237049 () Bool)

(assert (=> b!209670 m!237049))

(declare-fun m!237051 () Bool)

(assert (=> b!209670 m!237051))

(declare-fun m!237053 () Bool)

(assert (=> b!209670 m!237053))

(assert (=> b!209670 m!237041))

(assert (=> b!209670 m!237051))

(declare-fun m!237055 () Bool)

(assert (=> b!209670 m!237055))

(declare-fun m!237057 () Bool)

(assert (=> b!209670 m!237057))

(declare-fun m!237059 () Bool)

(assert (=> bm!19798 m!237059))

(assert (=> b!209678 m!236985))

(assert (=> b!209678 m!236985))

(declare-fun m!237061 () Bool)

(assert (=> b!209678 m!237061))

(assert (=> b!209676 m!236985))

(assert (=> b!209676 m!236999))

(assert (=> b!209676 m!236997))

(assert (=> b!209676 m!236997))

(assert (=> b!209676 m!236999))

(assert (=> b!209676 m!237001))

(assert (=> b!209676 m!236985))

(declare-fun m!237063 () Bool)

(assert (=> b!209676 m!237063))

(declare-fun m!237065 () Bool)

(assert (=> b!209671 m!237065))

(assert (=> b!209523 d!57875))

(declare-fun b!209680 () Bool)

(declare-fun lt!107205 () Unit!6372)

(declare-fun lt!107202 () Unit!6372)

(assert (=> b!209680 (= lt!107205 lt!107202)))

(declare-fun lt!107207 () ListLongMap!3049)

(declare-fun lt!107201 () (_ BitVec 64))

(declare-fun lt!107204 () V!6827)

(declare-fun lt!107206 () (_ BitVec 64))

(assert (=> b!209680 (not (contains!1389 (+!543 lt!107207 (tuple2!4137 lt!107206 lt!107204)) lt!107201))))

(assert (=> b!209680 (= lt!107202 (addStillNotContains!98 lt!107207 lt!107206 lt!107204 lt!107201))))

(assert (=> b!209680 (= lt!107201 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!209680 (= lt!107204 (get!2539 (select (arr!4734 _values!649) #b00000000000000000000000000000000) (dynLambda!532 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209680 (= lt!107206 (select (arr!4735 _keys!825) #b00000000000000000000000000000000))))

(declare-fun call!19804 () ListLongMap!3049)

(assert (=> b!209680 (= lt!107207 call!19804)))

(declare-fun e!136587 () ListLongMap!3049)

(assert (=> b!209680 (= e!136587 (+!543 call!19804 (tuple2!4137 (select (arr!4735 _keys!825) #b00000000000000000000000000000000) (get!2539 (select (arr!4734 _values!649) #b00000000000000000000000000000000) (dynLambda!532 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!209681 () Bool)

(assert (=> b!209681 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5060 _keys!825)))))

(assert (=> b!209681 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5059 _values!649)))))

(declare-fun lt!107203 () ListLongMap!3049)

(declare-fun e!136586 () Bool)

(assert (=> b!209681 (= e!136586 (= (apply!189 lt!107203 (select (arr!4735 _keys!825) #b00000000000000000000000000000000)) (get!2539 (select (arr!4734 _values!649) #b00000000000000000000000000000000) (dynLambda!532 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!209682 () Bool)

(declare-fun e!136584 () ListLongMap!3049)

(assert (=> b!209682 (= e!136584 (ListLongMap!3050 Nil!3030))))

(declare-fun b!209683 () Bool)

(declare-fun e!136585 () Bool)

(assert (=> b!209683 (= e!136585 (validKeyInArray!0 (select (arr!4735 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!209683 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!209684 () Bool)

(declare-fun res!102236 () Bool)

(declare-fun e!136588 () Bool)

(assert (=> b!209684 (=> (not res!102236) (not e!136588))))

(assert (=> b!209684 (= res!102236 (not (contains!1389 lt!107203 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!209686 () Bool)

(assert (=> b!209686 (= e!136587 call!19804)))

(declare-fun b!209687 () Bool)

(declare-fun e!136583 () Bool)

(assert (=> b!209687 (= e!136583 (= lt!107203 (getCurrentListMapNoExtraKeys!480 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!209688 () Bool)

(declare-fun e!136582 () Bool)

(assert (=> b!209688 (= e!136582 e!136583)))

(declare-fun c!35470 () Bool)

(assert (=> b!209688 (= c!35470 (bvslt #b00000000000000000000000000000000 (size!5060 _keys!825)))))

(declare-fun d!57877 () Bool)

(assert (=> d!57877 e!136588))

(declare-fun res!102237 () Bool)

(assert (=> d!57877 (=> (not res!102237) (not e!136588))))

(assert (=> d!57877 (= res!102237 (not (contains!1389 lt!107203 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57877 (= lt!107203 e!136584)))

(declare-fun c!35471 () Bool)

(assert (=> d!57877 (= c!35471 (bvsge #b00000000000000000000000000000000 (size!5060 _keys!825)))))

(assert (=> d!57877 (validMask!0 mask!1149)))

(assert (=> d!57877 (= (getCurrentListMapNoExtraKeys!480 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!107203)))

(declare-fun b!209685 () Bool)

(assert (=> b!209685 (= e!136582 e!136586)))

(assert (=> b!209685 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5060 _keys!825)))))

(declare-fun res!102235 () Bool)

(assert (=> b!209685 (= res!102235 (contains!1389 lt!107203 (select (arr!4735 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!209685 (=> (not res!102235) (not e!136586))))

(declare-fun b!209689 () Bool)

(assert (=> b!209689 (= e!136588 e!136582)))

(declare-fun c!35472 () Bool)

(assert (=> b!209689 (= c!35472 e!136585)))

(declare-fun res!102238 () Bool)

(assert (=> b!209689 (=> (not res!102238) (not e!136585))))

(assert (=> b!209689 (= res!102238 (bvslt #b00000000000000000000000000000000 (size!5060 _keys!825)))))

(declare-fun b!209690 () Bool)

(assert (=> b!209690 (= e!136583 (isEmpty!490 lt!107203))))

(declare-fun b!209691 () Bool)

(assert (=> b!209691 (= e!136584 e!136587)))

(declare-fun c!35469 () Bool)

(assert (=> b!209691 (= c!35469 (validKeyInArray!0 (select (arr!4735 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!19801 () Bool)

(assert (=> bm!19801 (= call!19804 (getCurrentListMapNoExtraKeys!480 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(assert (= (and d!57877 c!35471) b!209682))

(assert (= (and d!57877 (not c!35471)) b!209691))

(assert (= (and b!209691 c!35469) b!209680))

(assert (= (and b!209691 (not c!35469)) b!209686))

(assert (= (or b!209680 b!209686) bm!19801))

(assert (= (and d!57877 res!102237) b!209684))

(assert (= (and b!209684 res!102236) b!209689))

(assert (= (and b!209689 res!102238) b!209683))

(assert (= (and b!209689 c!35472) b!209685))

(assert (= (and b!209689 (not c!35472)) b!209688))

(assert (= (and b!209685 res!102235) b!209681))

(assert (= (and b!209688 c!35470) b!209687))

(assert (= (and b!209688 (not c!35470)) b!209690))

(declare-fun b_lambda!7545 () Bool)

(assert (=> (not b_lambda!7545) (not b!209680)))

(assert (=> b!209680 t!7968))

(declare-fun b_and!12279 () Bool)

(assert (= b_and!12277 (and (=> t!7968 result!4961) b_and!12279)))

(declare-fun b_lambda!7547 () Bool)

(assert (=> (not b_lambda!7547) (not b!209681)))

(assert (=> b!209681 t!7968))

(declare-fun b_and!12281 () Bool)

(assert (= b_and!12279 (and (=> t!7968 result!4961) b_and!12281)))

(declare-fun m!237067 () Bool)

(assert (=> b!209687 m!237067))

(assert (=> b!209683 m!236985))

(assert (=> b!209683 m!236985))

(assert (=> b!209683 m!236993))

(assert (=> b!209691 m!236985))

(assert (=> b!209691 m!236985))

(assert (=> b!209691 m!236993))

(declare-fun m!237069 () Bool)

(assert (=> b!209680 m!237069))

(assert (=> b!209680 m!236999))

(declare-fun m!237071 () Bool)

(assert (=> b!209680 m!237071))

(declare-fun m!237073 () Bool)

(assert (=> b!209680 m!237073))

(assert (=> b!209680 m!236985))

(assert (=> b!209680 m!236999))

(declare-fun m!237075 () Bool)

(assert (=> b!209680 m!237075))

(assert (=> b!209680 m!237075))

(declare-fun m!237077 () Bool)

(assert (=> b!209680 m!237077))

(assert (=> b!209680 m!237069))

(declare-fun m!237079 () Bool)

(assert (=> b!209680 m!237079))

(declare-fun m!237081 () Bool)

(assert (=> b!209684 m!237081))

(assert (=> b!209681 m!237069))

(assert (=> b!209681 m!236985))

(declare-fun m!237083 () Bool)

(assert (=> b!209681 m!237083))

(assert (=> b!209681 m!237069))

(assert (=> b!209681 m!236999))

(assert (=> b!209681 m!237071))

(assert (=> b!209681 m!236985))

(assert (=> b!209681 m!236999))

(assert (=> bm!19801 m!237067))

(declare-fun m!237085 () Bool)

(assert (=> b!209690 m!237085))

(declare-fun m!237087 () Bool)

(assert (=> d!57877 m!237087))

(assert (=> d!57877 m!236899))

(assert (=> b!209685 m!236985))

(assert (=> b!209685 m!236985))

(declare-fun m!237089 () Bool)

(assert (=> b!209685 m!237089))

(assert (=> b!209523 d!57877))

(declare-fun d!57879 () Bool)

(declare-fun e!136589 () Bool)

(assert (=> d!57879 e!136589))

(declare-fun res!102239 () Bool)

(assert (=> d!57879 (=> (not res!102239) (not e!136589))))

(declare-fun lt!107211 () ListLongMap!3049)

(assert (=> d!57879 (= res!102239 (contains!1389 lt!107211 (_1!2079 (tuple2!4137 k0!843 v!520))))))

(declare-fun lt!107208 () List!3033)

(assert (=> d!57879 (= lt!107211 (ListLongMap!3050 lt!107208))))

(declare-fun lt!107210 () Unit!6372)

(declare-fun lt!107209 () Unit!6372)

(assert (=> d!57879 (= lt!107210 lt!107209)))

(assert (=> d!57879 (= (getValueByKey!247 lt!107208 (_1!2079 (tuple2!4137 k0!843 v!520))) (Some!252 (_2!2079 (tuple2!4137 k0!843 v!520))))))

(assert (=> d!57879 (= lt!107209 (lemmaContainsTupThenGetReturnValue!134 lt!107208 (_1!2079 (tuple2!4137 k0!843 v!520)) (_2!2079 (tuple2!4137 k0!843 v!520))))))

(assert (=> d!57879 (= lt!107208 (insertStrictlySorted!137 (toList!1540 lt!107062) (_1!2079 (tuple2!4137 k0!843 v!520)) (_2!2079 (tuple2!4137 k0!843 v!520))))))

(assert (=> d!57879 (= (+!543 lt!107062 (tuple2!4137 k0!843 v!520)) lt!107211)))

(declare-fun b!209692 () Bool)

(declare-fun res!102240 () Bool)

(assert (=> b!209692 (=> (not res!102240) (not e!136589))))

(assert (=> b!209692 (= res!102240 (= (getValueByKey!247 (toList!1540 lt!107211) (_1!2079 (tuple2!4137 k0!843 v!520))) (Some!252 (_2!2079 (tuple2!4137 k0!843 v!520)))))))

(declare-fun b!209693 () Bool)

(assert (=> b!209693 (= e!136589 (contains!1390 (toList!1540 lt!107211) (tuple2!4137 k0!843 v!520)))))

(assert (= (and d!57879 res!102239) b!209692))

(assert (= (and b!209692 res!102240) b!209693))

(declare-fun m!237091 () Bool)

(assert (=> d!57879 m!237091))

(declare-fun m!237093 () Bool)

(assert (=> d!57879 m!237093))

(declare-fun m!237095 () Bool)

(assert (=> d!57879 m!237095))

(declare-fun m!237097 () Bool)

(assert (=> d!57879 m!237097))

(declare-fun m!237099 () Bool)

(assert (=> b!209692 m!237099))

(declare-fun m!237101 () Bool)

(assert (=> b!209693 m!237101))

(assert (=> b!209523 d!57879))

(declare-fun call!19809 () ListLongMap!3049)

(declare-fun bm!19806 () Bool)

(assert (=> bm!19806 (= call!19809 (getCurrentListMapNoExtraKeys!480 _keys!825 (array!9968 (store (arr!4734 _values!649) i!601 (ValueCellFull!2349 v!520)) (size!5059 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!209700 () Bool)

(declare-fun call!19810 () ListLongMap!3049)

(declare-fun e!136595 () Bool)

(assert (=> b!209700 (= e!136595 (= call!19809 (+!543 call!19810 (tuple2!4137 k0!843 v!520))))))

(declare-fun d!57881 () Bool)

(declare-fun e!136594 () Bool)

(assert (=> d!57881 e!136594))

(declare-fun res!102243 () Bool)

(assert (=> d!57881 (=> (not res!102243) (not e!136594))))

(assert (=> d!57881 (= res!102243 (and (or (not (bvsle #b00000000000000000000000000000000 i!601)) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5059 _values!649)))) (or (bvsle #b00000000000000000000000000000000 i!601) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5059 _values!649))))))))

(declare-fun lt!107214 () Unit!6372)

(declare-fun choose!1072 (array!9969 array!9967 (_ BitVec 32) (_ BitVec 32) V!6827 V!6827 (_ BitVec 32) (_ BitVec 64) V!6827 (_ BitVec 32) Int) Unit!6372)

(assert (=> d!57881 (= lt!107214 (choose!1072 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> d!57881 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!5060 _keys!825)))))

(assert (=> d!57881 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!195 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657) lt!107214)))

(declare-fun b!209701 () Bool)

(assert (=> b!209701 (= e!136594 e!136595)))

(declare-fun c!35475 () Bool)

(assert (=> b!209701 (= c!35475 (bvsle #b00000000000000000000000000000000 i!601))))

(declare-fun b!209702 () Bool)

(assert (=> b!209702 (= e!136595 (= call!19809 call!19810))))

(declare-fun bm!19807 () Bool)

(assert (=> bm!19807 (= call!19810 (getCurrentListMapNoExtraKeys!480 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and d!57881 res!102243) b!209701))

(assert (= (and b!209701 c!35475) b!209700))

(assert (= (and b!209701 (not c!35475)) b!209702))

(assert (= (or b!209700 b!209702) bm!19806))

(assert (= (or b!209700 b!209702) bm!19807))

(assert (=> bm!19806 m!236911))

(declare-fun m!237103 () Bool)

(assert (=> bm!19806 m!237103))

(declare-fun m!237105 () Bool)

(assert (=> b!209700 m!237105))

(declare-fun m!237107 () Bool)

(assert (=> d!57881 m!237107))

(assert (=> bm!19807 m!236917))

(assert (=> b!209523 d!57881))

(declare-fun d!57883 () Bool)

(declare-fun e!136604 () Bool)

(assert (=> d!57883 e!136604))

(declare-fun res!102246 () Bool)

(assert (=> d!57883 (=> (not res!102246) (not e!136604))))

(assert (=> d!57883 (= res!102246 (or (bvsge #b00000000000000000000000000000000 (size!5060 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5060 _keys!825)))))))

(declare-fun lt!107215 () ListLongMap!3049)

(declare-fun lt!107227 () ListLongMap!3049)

(assert (=> d!57883 (= lt!107215 lt!107227)))

(declare-fun lt!107233 () Unit!6372)

(declare-fun e!136606 () Unit!6372)

(assert (=> d!57883 (= lt!107233 e!136606)))

(declare-fun c!35480 () Bool)

(declare-fun e!136597 () Bool)

(assert (=> d!57883 (= c!35480 e!136597)))

(declare-fun res!102251 () Bool)

(assert (=> d!57883 (=> (not res!102251) (not e!136597))))

(assert (=> d!57883 (= res!102251 (bvslt #b00000000000000000000000000000000 (size!5060 _keys!825)))))

(declare-fun e!136600 () ListLongMap!3049)

(assert (=> d!57883 (= lt!107227 e!136600)))

(declare-fun c!35476 () Bool)

(assert (=> d!57883 (= c!35476 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!57883 (validMask!0 mask!1149)))

(assert (=> d!57883 (= (getCurrentListMap!1078 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!107215)))

(declare-fun bm!19808 () Bool)

(declare-fun call!19817 () Bool)

(assert (=> bm!19808 (= call!19817 (contains!1389 lt!107215 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!209703 () Bool)

(declare-fun e!136602 () Bool)

(declare-fun e!136607 () Bool)

(assert (=> b!209703 (= e!136602 e!136607)))

(declare-fun res!102248 () Bool)

(declare-fun call!19816 () Bool)

(assert (=> b!209703 (= res!102248 call!19816)))

(assert (=> b!209703 (=> (not res!102248) (not e!136607))))

(declare-fun b!209704 () Bool)

(assert (=> b!209704 (= e!136602 (not call!19816))))

(declare-fun b!209705 () Bool)

(declare-fun res!102245 () Bool)

(assert (=> b!209705 (=> (not res!102245) (not e!136604))))

(assert (=> b!209705 (= res!102245 e!136602)))

(declare-fun c!35479 () Bool)

(assert (=> b!209705 (= c!35479 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!209706 () Bool)

(declare-fun e!136601 () ListLongMap!3049)

(declare-fun call!19812 () ListLongMap!3049)

(assert (=> b!209706 (= e!136601 call!19812)))

(declare-fun b!209707 () Bool)

(assert (=> b!209707 (= e!136607 (= (apply!189 lt!107215 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun b!209708 () Bool)

(declare-fun e!136599 () ListLongMap!3049)

(assert (=> b!209708 (= e!136599 call!19812)))

(declare-fun b!209709 () Bool)

(declare-fun call!19815 () ListLongMap!3049)

(assert (=> b!209709 (= e!136601 call!19815)))

(declare-fun b!209710 () Bool)

(declare-fun call!19811 () ListLongMap!3049)

(assert (=> b!209710 (= e!136600 (+!543 call!19811 (tuple2!4137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun b!209711 () Bool)

(declare-fun e!136605 () Bool)

(assert (=> b!209711 (= e!136605 (not call!19817))))

(declare-fun b!209712 () Bool)

(assert (=> b!209712 (= e!136604 e!136605)))

(declare-fun c!35481 () Bool)

(assert (=> b!209712 (= c!35481 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!209713 () Bool)

(declare-fun e!136596 () Bool)

(assert (=> b!209713 (= e!136605 e!136596)))

(declare-fun res!102252 () Bool)

(assert (=> b!209713 (= res!102252 call!19817)))

(assert (=> b!209713 (=> (not res!102252) (not e!136596))))

(declare-fun b!209714 () Bool)

(declare-fun lt!107221 () Unit!6372)

(assert (=> b!209714 (= e!136606 lt!107221)))

(declare-fun lt!107226 () ListLongMap!3049)

(assert (=> b!209714 (= lt!107226 (getCurrentListMapNoExtraKeys!480 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107229 () (_ BitVec 64))

(assert (=> b!209714 (= lt!107229 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107225 () (_ BitVec 64))

(assert (=> b!209714 (= lt!107225 (select (arr!4735 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107218 () Unit!6372)

(assert (=> b!209714 (= lt!107218 (addStillContains!165 lt!107226 lt!107229 zeroValue!615 lt!107225))))

(assert (=> b!209714 (contains!1389 (+!543 lt!107226 (tuple2!4137 lt!107229 zeroValue!615)) lt!107225)))

(declare-fun lt!107230 () Unit!6372)

(assert (=> b!209714 (= lt!107230 lt!107218)))

(declare-fun lt!107235 () ListLongMap!3049)

(assert (=> b!209714 (= lt!107235 (getCurrentListMapNoExtraKeys!480 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107224 () (_ BitVec 64))

(assert (=> b!209714 (= lt!107224 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107220 () (_ BitVec 64))

(assert (=> b!209714 (= lt!107220 (select (arr!4735 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107234 () Unit!6372)

(assert (=> b!209714 (= lt!107234 (addApplyDifferent!165 lt!107235 lt!107224 minValue!615 lt!107220))))

(assert (=> b!209714 (= (apply!189 (+!543 lt!107235 (tuple2!4137 lt!107224 minValue!615)) lt!107220) (apply!189 lt!107235 lt!107220))))

(declare-fun lt!107222 () Unit!6372)

(assert (=> b!209714 (= lt!107222 lt!107234)))

(declare-fun lt!107216 () ListLongMap!3049)

(assert (=> b!209714 (= lt!107216 (getCurrentListMapNoExtraKeys!480 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107219 () (_ BitVec 64))

(assert (=> b!209714 (= lt!107219 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107236 () (_ BitVec 64))

(assert (=> b!209714 (= lt!107236 (select (arr!4735 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107223 () Unit!6372)

(assert (=> b!209714 (= lt!107223 (addApplyDifferent!165 lt!107216 lt!107219 zeroValue!615 lt!107236))))

(assert (=> b!209714 (= (apply!189 (+!543 lt!107216 (tuple2!4137 lt!107219 zeroValue!615)) lt!107236) (apply!189 lt!107216 lt!107236))))

(declare-fun lt!107228 () Unit!6372)

(assert (=> b!209714 (= lt!107228 lt!107223)))

(declare-fun lt!107217 () ListLongMap!3049)

(assert (=> b!209714 (= lt!107217 (getCurrentListMapNoExtraKeys!480 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107231 () (_ BitVec 64))

(assert (=> b!209714 (= lt!107231 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107232 () (_ BitVec 64))

(assert (=> b!209714 (= lt!107232 (select (arr!4735 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!209714 (= lt!107221 (addApplyDifferent!165 lt!107217 lt!107231 minValue!615 lt!107232))))

(assert (=> b!209714 (= (apply!189 (+!543 lt!107217 (tuple2!4137 lt!107231 minValue!615)) lt!107232) (apply!189 lt!107217 lt!107232))))

(declare-fun b!209715 () Bool)

(assert (=> b!209715 (= e!136596 (= (apply!189 lt!107215 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun b!209716 () Bool)

(declare-fun res!102249 () Bool)

(assert (=> b!209716 (=> (not res!102249) (not e!136604))))

(declare-fun e!136598 () Bool)

(assert (=> b!209716 (= res!102249 e!136598)))

(declare-fun res!102244 () Bool)

(assert (=> b!209716 (=> res!102244 e!136598)))

(declare-fun e!136608 () Bool)

(assert (=> b!209716 (= res!102244 (not e!136608))))

(declare-fun res!102250 () Bool)

(assert (=> b!209716 (=> (not res!102250) (not e!136608))))

(assert (=> b!209716 (= res!102250 (bvslt #b00000000000000000000000000000000 (size!5060 _keys!825)))))

(declare-fun bm!19809 () Bool)

(declare-fun call!19814 () ListLongMap!3049)

(assert (=> bm!19809 (= call!19815 call!19814)))

(declare-fun b!209717 () Bool)

(declare-fun Unit!6377 () Unit!6372)

(assert (=> b!209717 (= e!136606 Unit!6377)))

(declare-fun bm!19810 () Bool)

(assert (=> bm!19810 (= call!19812 call!19811)))

(declare-fun bm!19811 () Bool)

(declare-fun call!19813 () ListLongMap!3049)

(assert (=> bm!19811 (= call!19814 call!19813)))

(declare-fun b!209718 () Bool)

(assert (=> b!209718 (= e!136600 e!136599)))

(declare-fun c!35477 () Bool)

(assert (=> b!209718 (= c!35477 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!209719 () Bool)

(assert (=> b!209719 (= e!136597 (validKeyInArray!0 (select (arr!4735 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun e!136603 () Bool)

(declare-fun b!209720 () Bool)

(assert (=> b!209720 (= e!136603 (= (apply!189 lt!107215 (select (arr!4735 _keys!825) #b00000000000000000000000000000000)) (get!2539 (select (arr!4734 _values!649) #b00000000000000000000000000000000) (dynLambda!532 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!209720 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5059 _values!649)))))

(assert (=> b!209720 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5060 _keys!825)))))

(declare-fun bm!19812 () Bool)

(assert (=> bm!19812 (= call!19816 (contains!1389 lt!107215 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!19813 () Bool)

(assert (=> bm!19813 (= call!19811 (+!543 (ite c!35476 call!19813 (ite c!35477 call!19814 call!19815)) (ite (or c!35476 c!35477) (tuple2!4137 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun bm!19814 () Bool)

(assert (=> bm!19814 (= call!19813 (getCurrentListMapNoExtraKeys!480 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!209721 () Bool)

(declare-fun c!35478 () Bool)

(assert (=> b!209721 (= c!35478 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!209721 (= e!136599 e!136601)))

(declare-fun b!209722 () Bool)

(assert (=> b!209722 (= e!136598 e!136603)))

(declare-fun res!102247 () Bool)

(assert (=> b!209722 (=> (not res!102247) (not e!136603))))

(assert (=> b!209722 (= res!102247 (contains!1389 lt!107215 (select (arr!4735 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!209722 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5060 _keys!825)))))

(declare-fun b!209723 () Bool)

(assert (=> b!209723 (= e!136608 (validKeyInArray!0 (select (arr!4735 _keys!825) #b00000000000000000000000000000000)))))

(assert (= (and d!57883 c!35476) b!209710))

(assert (= (and d!57883 (not c!35476)) b!209718))

(assert (= (and b!209718 c!35477) b!209708))

(assert (= (and b!209718 (not c!35477)) b!209721))

(assert (= (and b!209721 c!35478) b!209706))

(assert (= (and b!209721 (not c!35478)) b!209709))

(assert (= (or b!209706 b!209709) bm!19809))

(assert (= (or b!209708 bm!19809) bm!19811))

(assert (= (or b!209708 b!209706) bm!19810))

(assert (= (or b!209710 bm!19811) bm!19814))

(assert (= (or b!209710 bm!19810) bm!19813))

(assert (= (and d!57883 res!102251) b!209719))

(assert (= (and d!57883 c!35480) b!209714))

(assert (= (and d!57883 (not c!35480)) b!209717))

(assert (= (and d!57883 res!102246) b!209716))

(assert (= (and b!209716 res!102250) b!209723))

(assert (= (and b!209716 (not res!102244)) b!209722))

(assert (= (and b!209722 res!102247) b!209720))

(assert (= (and b!209716 res!102249) b!209705))

(assert (= (and b!209705 c!35479) b!209703))

(assert (= (and b!209705 (not c!35479)) b!209704))

(assert (= (and b!209703 res!102248) b!209707))

(assert (= (or b!209703 b!209704) bm!19812))

(assert (= (and b!209705 res!102245) b!209712))

(assert (= (and b!209712 c!35481) b!209713))

(assert (= (and b!209712 (not c!35481)) b!209711))

(assert (= (and b!209713 res!102252) b!209715))

(assert (= (or b!209713 b!209711) bm!19808))

(declare-fun b_lambda!7549 () Bool)

(assert (=> (not b_lambda!7549) (not b!209720)))

(assert (=> b!209720 t!7968))

(declare-fun b_and!12283 () Bool)

(assert (= b_and!12281 (and (=> t!7968 result!4961) b_and!12283)))

(declare-fun m!237109 () Bool)

(assert (=> bm!19808 m!237109))

(assert (=> b!209723 m!236985))

(assert (=> b!209723 m!236985))

(assert (=> b!209723 m!236993))

(declare-fun m!237111 () Bool)

(assert (=> b!209710 m!237111))

(declare-fun m!237113 () Bool)

(assert (=> bm!19813 m!237113))

(assert (=> d!57883 m!236899))

(assert (=> bm!19814 m!236917))

(declare-fun m!237115 () Bool)

(assert (=> b!209707 m!237115))

(assert (=> b!209719 m!236985))

(assert (=> b!209719 m!236985))

(assert (=> b!209719 m!236993))

(declare-fun m!237117 () Bool)

(assert (=> b!209714 m!237117))

(assert (=> b!209714 m!236985))

(declare-fun m!237119 () Bool)

(assert (=> b!209714 m!237119))

(declare-fun m!237121 () Bool)

(assert (=> b!209714 m!237121))

(assert (=> b!209714 m!237119))

(declare-fun m!237123 () Bool)

(assert (=> b!209714 m!237123))

(declare-fun m!237125 () Bool)

(assert (=> b!209714 m!237125))

(declare-fun m!237127 () Bool)

(assert (=> b!209714 m!237127))

(declare-fun m!237129 () Bool)

(assert (=> b!209714 m!237129))

(declare-fun m!237131 () Bool)

(assert (=> b!209714 m!237131))

(assert (=> b!209714 m!236917))

(declare-fun m!237133 () Bool)

(assert (=> b!209714 m!237133))

(declare-fun m!237135 () Bool)

(assert (=> b!209714 m!237135))

(assert (=> b!209714 m!237133))

(declare-fun m!237137 () Bool)

(assert (=> b!209714 m!237137))

(declare-fun m!237139 () Bool)

(assert (=> b!209714 m!237139))

(declare-fun m!237141 () Bool)

(assert (=> b!209714 m!237141))

(assert (=> b!209714 m!237129))

(assert (=> b!209714 m!237139))

(declare-fun m!237143 () Bool)

(assert (=> b!209714 m!237143))

(declare-fun m!237145 () Bool)

(assert (=> b!209714 m!237145))

(declare-fun m!237147 () Bool)

(assert (=> bm!19812 m!237147))

(assert (=> b!209722 m!236985))

(assert (=> b!209722 m!236985))

(declare-fun m!237149 () Bool)

(assert (=> b!209722 m!237149))

(assert (=> b!209720 m!236985))

(assert (=> b!209720 m!236999))

(assert (=> b!209720 m!237069))

(assert (=> b!209720 m!237069))

(assert (=> b!209720 m!236999))

(assert (=> b!209720 m!237071))

(assert (=> b!209720 m!236985))

(declare-fun m!237151 () Bool)

(assert (=> b!209720 m!237151))

(declare-fun m!237153 () Bool)

(assert (=> b!209715 m!237153))

(assert (=> b!209523 d!57883))

(declare-fun b!209734 () Bool)

(declare-fun e!136617 () Bool)

(declare-fun call!19820 () Bool)

(assert (=> b!209734 (= e!136617 call!19820)))

(declare-fun bm!19817 () Bool)

(declare-fun c!35484 () Bool)

(assert (=> bm!19817 (= call!19820 (arrayNoDuplicates!0 _keys!825 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!35484 (Cons!3028 (select (arr!4735 _keys!825) #b00000000000000000000000000000000) Nil!3029) Nil!3029)))))

(declare-fun b!209735 () Bool)

(declare-fun e!136618 () Bool)

(declare-fun e!136620 () Bool)

(assert (=> b!209735 (= e!136618 e!136620)))

(declare-fun res!102259 () Bool)

(assert (=> b!209735 (=> (not res!102259) (not e!136620))))

(declare-fun e!136619 () Bool)

(assert (=> b!209735 (= res!102259 (not e!136619))))

(declare-fun res!102260 () Bool)

(assert (=> b!209735 (=> (not res!102260) (not e!136619))))

(assert (=> b!209735 (= res!102260 (validKeyInArray!0 (select (arr!4735 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!209736 () Bool)

(assert (=> b!209736 (= e!136617 call!19820)))

(declare-fun d!57885 () Bool)

(declare-fun res!102261 () Bool)

(assert (=> d!57885 (=> res!102261 e!136618)))

(assert (=> d!57885 (= res!102261 (bvsge #b00000000000000000000000000000000 (size!5060 _keys!825)))))

(assert (=> d!57885 (= (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3029) e!136618)))

(declare-fun b!209737 () Bool)

(assert (=> b!209737 (= e!136620 e!136617)))

(assert (=> b!209737 (= c!35484 (validKeyInArray!0 (select (arr!4735 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!209738 () Bool)

(declare-fun contains!1391 (List!3032 (_ BitVec 64)) Bool)

(assert (=> b!209738 (= e!136619 (contains!1391 Nil!3029 (select (arr!4735 _keys!825) #b00000000000000000000000000000000)))))

(assert (= (and d!57885 (not res!102261)) b!209735))

(assert (= (and b!209735 res!102260) b!209738))

(assert (= (and b!209735 res!102259) b!209737))

(assert (= (and b!209737 c!35484) b!209736))

(assert (= (and b!209737 (not c!35484)) b!209734))

(assert (= (or b!209736 b!209734) bm!19817))

(assert (=> bm!19817 m!236985))

(declare-fun m!237155 () Bool)

(assert (=> bm!19817 m!237155))

(assert (=> b!209735 m!236985))

(assert (=> b!209735 m!236985))

(assert (=> b!209735 m!236993))

(assert (=> b!209737 m!236985))

(assert (=> b!209737 m!236985))

(assert (=> b!209737 m!236993))

(assert (=> b!209738 m!236985))

(assert (=> b!209738 m!236985))

(declare-fun m!237157 () Bool)

(assert (=> b!209738 m!237157))

(assert (=> b!209517 d!57885))

(declare-fun d!57887 () Bool)

(assert (=> d!57887 (= (validKeyInArray!0 k0!843) (and (not (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!209522 d!57887))

(declare-fun mapIsEmpty!9152 () Bool)

(declare-fun mapRes!9152 () Bool)

(assert (=> mapIsEmpty!9152 mapRes!9152))

(declare-fun b!209745 () Bool)

(declare-fun e!136625 () Bool)

(assert (=> b!209745 (= e!136625 tp_is_empty!5385)))

(declare-fun mapNonEmpty!9152 () Bool)

(declare-fun tp!19619 () Bool)

(assert (=> mapNonEmpty!9152 (= mapRes!9152 (and tp!19619 e!136625))))

(declare-fun mapValue!9152 () ValueCell!2349)

(declare-fun mapRest!9152 () (Array (_ BitVec 32) ValueCell!2349))

(declare-fun mapKey!9152 () (_ BitVec 32))

(assert (=> mapNonEmpty!9152 (= mapRest!9146 (store mapRest!9152 mapKey!9152 mapValue!9152))))

(declare-fun b!209746 () Bool)

(declare-fun e!136626 () Bool)

(assert (=> b!209746 (= e!136626 tp_is_empty!5385)))

(declare-fun condMapEmpty!9152 () Bool)

(declare-fun mapDefault!9152 () ValueCell!2349)

(assert (=> mapNonEmpty!9146 (= condMapEmpty!9152 (= mapRest!9146 ((as const (Array (_ BitVec 32) ValueCell!2349)) mapDefault!9152)))))

(assert (=> mapNonEmpty!9146 (= tp!19609 (and e!136626 mapRes!9152))))

(assert (= (and mapNonEmpty!9146 condMapEmpty!9152) mapIsEmpty!9152))

(assert (= (and mapNonEmpty!9146 (not condMapEmpty!9152)) mapNonEmpty!9152))

(assert (= (and mapNonEmpty!9152 ((_ is ValueCellFull!2349) mapValue!9152)) b!209745))

(assert (= (and mapNonEmpty!9146 ((_ is ValueCellFull!2349) mapDefault!9152)) b!209746))

(declare-fun m!237159 () Bool)

(assert (=> mapNonEmpty!9152 m!237159))

(declare-fun b_lambda!7551 () Bool)

(assert (= b_lambda!7541 (or (and start!20870 b_free!5523) b_lambda!7551)))

(declare-fun b_lambda!7553 () Bool)

(assert (= b_lambda!7543 (or (and start!20870 b_free!5523) b_lambda!7553)))

(declare-fun b_lambda!7555 () Bool)

(assert (= b_lambda!7547 (or (and start!20870 b_free!5523) b_lambda!7555)))

(declare-fun b_lambda!7557 () Bool)

(assert (= b_lambda!7549 (or (and start!20870 b_free!5523) b_lambda!7557)))

(declare-fun b_lambda!7559 () Bool)

(assert (= b_lambda!7539 (or (and start!20870 b_free!5523) b_lambda!7559)))

(declare-fun b_lambda!7561 () Bool)

(assert (= b_lambda!7545 (or (and start!20870 b_free!5523) b_lambda!7561)))

(check-sat (not bm!19812) (not b!209722) (not b!209614) (not b!209565) (not b!209676) (not b!209720) (not bm!19813) (not mapNonEmpty!9152) (not b!209663) (not b!209685) (not b!209607) (not b!209608) (not b!209603) (not b!209566) (not b!209578) (not b_lambda!7551) (not b!209564) (not bm!19817) (not bm!19800) (not b!209610) (not b!209692) (not b!209707) (not bm!19776) (not b!209693) (not b_lambda!7555) (not d!57881) (not b_next!5523) (not bm!19808) (not b!209715) (not b!209613) (not b!209675) (not b!209563) (not b!209738) (not b!209723) (not b!209671) (not bm!19794) (not bm!19801) (not bm!19798) (not b!209670) (not b_lambda!7559) (not b!209666) (not b!209700) (not bm!19814) (not bm!19807) b_and!12283 (not b!209690) (not b!209691) (not bm!19799) (not d!57873) tp_is_empty!5385 (not b!209737) (not b!209575) (not b_lambda!7557) (not b!209687) (not b!209719) (not d!57879) (not d!57883) (not b!209680) (not b!209606) (not b!209710) (not b!209678) (not b!209684) (not d!57861) (not b_lambda!7553) (not bm!19779) (not b!209679) (not b!209735) (not d!57877) (not bm!19806) (not b_lambda!7561) (not b!209683) (not d!57863) (not b!209681) (not b!209604) (not d!57875) (not b!209714))
(check-sat b_and!12283 (not b_next!5523))
