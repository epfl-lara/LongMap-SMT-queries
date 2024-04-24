; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100398 () Bool)

(assert start!100398)

(declare-fun b!1195800 () Bool)

(declare-fun res!795278 () Bool)

(declare-fun e!679683 () Bool)

(assert (=> b!1195800 (=> (not res!795278) (not e!679683))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1195800 (= res!795278 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!47219 () Bool)

(declare-fun mapRes!47219 () Bool)

(declare-fun tp!89829 () Bool)

(declare-fun e!679680 () Bool)

(assert (=> mapNonEmpty!47219 (= mapRes!47219 (and tp!89829 e!679680))))

(declare-fun mapKey!47219 () (_ BitVec 32))

(declare-datatypes ((V!45473 0))(
  ( (V!45474 (val!15186 Int)) )
))
(declare-datatypes ((ValueCell!14420 0))(
  ( (ValueCellFull!14420 (v!17820 V!45473)) (EmptyCell!14420) )
))
(declare-fun mapRest!47219 () (Array (_ BitVec 32) ValueCell!14420))

(declare-datatypes ((array!77337 0))(
  ( (array!77338 (arr!37311 (Array (_ BitVec 32) ValueCell!14420)) (size!37848 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77337)

(declare-fun mapValue!47219 () ValueCell!14420)

(assert (=> mapNonEmpty!47219 (= (arr!37311 _values!996) (store mapRest!47219 mapKey!47219 mapValue!47219))))

(declare-fun b!1195801 () Bool)

(declare-fun res!795282 () Bool)

(assert (=> b!1195801 (=> (not res!795282) (not e!679683))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!77339 0))(
  ( (array!77340 (arr!37312 (Array (_ BitVec 32) (_ BitVec 64))) (size!37849 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77339)

(assert (=> b!1195801 (= res!795282 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37849 _keys!1208))))))

(declare-fun b!1195802 () Bool)

(declare-fun res!795286 () Bool)

(assert (=> b!1195802 (=> (not res!795286) (not e!679683))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77339 (_ BitVec 32)) Bool)

(assert (=> b!1195802 (= res!795286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun e!679679 () Bool)

(declare-fun b!1195803 () Bool)

(declare-fun arrayContainsKey!0 (array!77339 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1195803 (= e!679679 (not (arrayContainsKey!0 _keys!1208 k0!934 i!673)))))

(declare-fun b!1195804 () Bool)

(declare-fun res!795279 () Bool)

(assert (=> b!1195804 (=> (not res!795279) (not e!679683))))

(declare-datatypes ((List!26294 0))(
  ( (Nil!26291) (Cons!26290 (h!27508 (_ BitVec 64)) (t!38957 List!26294)) )
))
(declare-fun arrayNoDuplicates!0 (array!77339 (_ BitVec 32) List!26294) Bool)

(assert (=> b!1195804 (= res!795279 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26291))))

(declare-fun res!795280 () Bool)

(assert (=> start!100398 (=> (not res!795280) (not e!679683))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100398 (= res!795280 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37849 _keys!1208))))))

(assert (=> start!100398 e!679683))

(declare-fun array_inv!28514 (array!77339) Bool)

(assert (=> start!100398 (array_inv!28514 _keys!1208)))

(assert (=> start!100398 true))

(declare-fun e!679681 () Bool)

(declare-fun array_inv!28515 (array!77337) Bool)

(assert (=> start!100398 (and (array_inv!28515 _values!996) e!679681)))

(declare-fun b!1195805 () Bool)

(declare-fun res!795284 () Bool)

(assert (=> b!1195805 (=> (not res!795284) (not e!679683))))

(assert (=> b!1195805 (= res!795284 (= (select (arr!37312 _keys!1208) i!673) k0!934))))

(declare-fun b!1195806 () Bool)

(declare-fun res!795283 () Bool)

(assert (=> b!1195806 (=> (not res!795283) (not e!679683))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1195806 (= res!795283 (and (= (size!37848 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37849 _keys!1208) (size!37848 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1195807 () Bool)

(declare-fun e!679678 () Bool)

(declare-fun tp_is_empty!30259 () Bool)

(assert (=> b!1195807 (= e!679678 tp_is_empty!30259)))

(declare-fun b!1195808 () Bool)

(assert (=> b!1195808 (= e!679680 tp_is_empty!30259)))

(declare-fun b!1195809 () Bool)

(declare-fun res!795276 () Bool)

(assert (=> b!1195809 (=> (not res!795276) (not e!679679))))

(declare-fun lt!543265 () array!77339)

(assert (=> b!1195809 (= res!795276 (arrayNoDuplicates!0 lt!543265 #b00000000000000000000000000000000 Nil!26291))))

(declare-fun b!1195810 () Bool)

(declare-fun res!795285 () Bool)

(assert (=> b!1195810 (=> (not res!795285) (not e!679679))))

(assert (=> b!1195810 (= res!795285 (bvslt (size!37849 _keys!1208) #b01111111111111111111111111111111))))

(declare-fun b!1195811 () Bool)

(assert (=> b!1195811 (= e!679683 e!679679)))

(declare-fun res!795281 () Bool)

(assert (=> b!1195811 (=> (not res!795281) (not e!679679))))

(assert (=> b!1195811 (= res!795281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543265 mask!1564))))

(assert (=> b!1195811 (= lt!543265 (array!77340 (store (arr!37312 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37849 _keys!1208)))))

(declare-fun b!1195812 () Bool)

(declare-fun res!795277 () Bool)

(assert (=> b!1195812 (=> (not res!795277) (not e!679683))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1195812 (= res!795277 (validMask!0 mask!1564))))

(declare-fun b!1195813 () Bool)

(assert (=> b!1195813 (= e!679681 (and e!679678 mapRes!47219))))

(declare-fun condMapEmpty!47219 () Bool)

(declare-fun mapDefault!47219 () ValueCell!14420)

(assert (=> b!1195813 (= condMapEmpty!47219 (= (arr!37311 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14420)) mapDefault!47219)))))

(declare-fun mapIsEmpty!47219 () Bool)

(assert (=> mapIsEmpty!47219 mapRes!47219))

(assert (= (and start!100398 res!795280) b!1195812))

(assert (= (and b!1195812 res!795277) b!1195806))

(assert (= (and b!1195806 res!795283) b!1195802))

(assert (= (and b!1195802 res!795286) b!1195804))

(assert (= (and b!1195804 res!795279) b!1195801))

(assert (= (and b!1195801 res!795282) b!1195800))

(assert (= (and b!1195800 res!795278) b!1195805))

(assert (= (and b!1195805 res!795284) b!1195811))

(assert (= (and b!1195811 res!795281) b!1195809))

(assert (= (and b!1195809 res!795276) b!1195810))

(assert (= (and b!1195810 res!795285) b!1195803))

(assert (= (and b!1195813 condMapEmpty!47219) mapIsEmpty!47219))

(assert (= (and b!1195813 (not condMapEmpty!47219)) mapNonEmpty!47219))

(get-info :version)

(assert (= (and mapNonEmpty!47219 ((_ is ValueCellFull!14420) mapValue!47219)) b!1195808))

(assert (= (and b!1195813 ((_ is ValueCellFull!14420) mapDefault!47219)) b!1195807))

(assert (= start!100398 b!1195813))

(declare-fun m!1103965 () Bool)

(assert (=> mapNonEmpty!47219 m!1103965))

(declare-fun m!1103967 () Bool)

(assert (=> b!1195802 m!1103967))

(declare-fun m!1103969 () Bool)

(assert (=> start!100398 m!1103969))

(declare-fun m!1103971 () Bool)

(assert (=> start!100398 m!1103971))

(declare-fun m!1103973 () Bool)

(assert (=> b!1195812 m!1103973))

(declare-fun m!1103975 () Bool)

(assert (=> b!1195804 m!1103975))

(declare-fun m!1103977 () Bool)

(assert (=> b!1195809 m!1103977))

(declare-fun m!1103979 () Bool)

(assert (=> b!1195800 m!1103979))

(declare-fun m!1103981 () Bool)

(assert (=> b!1195803 m!1103981))

(declare-fun m!1103983 () Bool)

(assert (=> b!1195811 m!1103983))

(declare-fun m!1103985 () Bool)

(assert (=> b!1195811 m!1103985))

(declare-fun m!1103987 () Bool)

(assert (=> b!1195805 m!1103987))

(check-sat (not b!1195803) (not mapNonEmpty!47219) (not b!1195802) (not b!1195804) (not b!1195800) (not b!1195811) (not start!100398) tp_is_empty!30259 (not b!1195812) (not b!1195809))
(check-sat)
(get-model)

(declare-fun d!132717 () Bool)

(assert (=> d!132717 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1195800 d!132717))

(declare-fun b!1195906 () Bool)

(declare-fun e!679728 () Bool)

(declare-fun e!679727 () Bool)

(assert (=> b!1195906 (= e!679728 e!679727)))

(declare-fun lt!543279 () (_ BitVec 64))

(assert (=> b!1195906 (= lt!543279 (select (arr!37312 lt!543265) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!39581 0))(
  ( (Unit!39582) )
))
(declare-fun lt!543278 () Unit!39581)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77339 (_ BitVec 64) (_ BitVec 32)) Unit!39581)

(assert (=> b!1195906 (= lt!543278 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!543265 lt!543279 #b00000000000000000000000000000000))))

(assert (=> b!1195906 (arrayContainsKey!0 lt!543265 lt!543279 #b00000000000000000000000000000000)))

(declare-fun lt!543280 () Unit!39581)

(assert (=> b!1195906 (= lt!543280 lt!543278)))

(declare-fun res!795357 () Bool)

(declare-datatypes ((SeekEntryResult!9885 0))(
  ( (MissingZero!9885 (index!41911 (_ BitVec 32))) (Found!9885 (index!41912 (_ BitVec 32))) (Intermediate!9885 (undefined!10697 Bool) (index!41913 (_ BitVec 32)) (x!105635 (_ BitVec 32))) (Undefined!9885) (MissingVacant!9885 (index!41914 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!77339 (_ BitVec 32)) SeekEntryResult!9885)

(assert (=> b!1195906 (= res!795357 (= (seekEntryOrOpen!0 (select (arr!37312 lt!543265) #b00000000000000000000000000000000) lt!543265 mask!1564) (Found!9885 #b00000000000000000000000000000000)))))

(assert (=> b!1195906 (=> (not res!795357) (not e!679727))))

(declare-fun b!1195907 () Bool)

(declare-fun e!679726 () Bool)

(assert (=> b!1195907 (= e!679726 e!679728)))

(declare-fun c!117718 () Bool)

(assert (=> b!1195907 (= c!117718 (validKeyInArray!0 (select (arr!37312 lt!543265) #b00000000000000000000000000000000)))))

(declare-fun bm!57208 () Bool)

(declare-fun call!57211 () Bool)

(assert (=> bm!57208 (= call!57211 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!543265 mask!1564))))

(declare-fun b!1195908 () Bool)

(assert (=> b!1195908 (= e!679728 call!57211)))

(declare-fun b!1195909 () Bool)

(assert (=> b!1195909 (= e!679727 call!57211)))

(declare-fun d!132719 () Bool)

(declare-fun res!795358 () Bool)

(assert (=> d!132719 (=> res!795358 e!679726)))

(assert (=> d!132719 (= res!795358 (bvsge #b00000000000000000000000000000000 (size!37849 lt!543265)))))

(assert (=> d!132719 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543265 mask!1564) e!679726)))

(assert (= (and d!132719 (not res!795358)) b!1195907))

(assert (= (and b!1195907 c!117718) b!1195906))

(assert (= (and b!1195907 (not c!117718)) b!1195908))

(assert (= (and b!1195906 res!795357) b!1195909))

(assert (= (or b!1195909 b!1195908) bm!57208))

(declare-fun m!1104037 () Bool)

(assert (=> b!1195906 m!1104037))

(declare-fun m!1104039 () Bool)

(assert (=> b!1195906 m!1104039))

(declare-fun m!1104041 () Bool)

(assert (=> b!1195906 m!1104041))

(assert (=> b!1195906 m!1104037))

(declare-fun m!1104043 () Bool)

(assert (=> b!1195906 m!1104043))

(assert (=> b!1195907 m!1104037))

(assert (=> b!1195907 m!1104037))

(declare-fun m!1104045 () Bool)

(assert (=> b!1195907 m!1104045))

(declare-fun m!1104047 () Bool)

(assert (=> bm!57208 m!1104047))

(assert (=> b!1195811 d!132719))

(declare-fun d!132721 () Bool)

(assert (=> d!132721 (= (array_inv!28514 _keys!1208) (bvsge (size!37849 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!100398 d!132721))

(declare-fun d!132723 () Bool)

(assert (=> d!132723 (= (array_inv!28515 _values!996) (bvsge (size!37848 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!100398 d!132723))

(declare-fun d!132725 () Bool)

(assert (=> d!132725 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1195812 d!132725))

(declare-fun b!1195910 () Bool)

(declare-fun e!679731 () Bool)

(declare-fun e!679730 () Bool)

(assert (=> b!1195910 (= e!679731 e!679730)))

(declare-fun lt!543282 () (_ BitVec 64))

(assert (=> b!1195910 (= lt!543282 (select (arr!37312 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!543281 () Unit!39581)

(assert (=> b!1195910 (= lt!543281 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!543282 #b00000000000000000000000000000000))))

(assert (=> b!1195910 (arrayContainsKey!0 _keys!1208 lt!543282 #b00000000000000000000000000000000)))

(declare-fun lt!543283 () Unit!39581)

(assert (=> b!1195910 (= lt!543283 lt!543281)))

(declare-fun res!795359 () Bool)

(assert (=> b!1195910 (= res!795359 (= (seekEntryOrOpen!0 (select (arr!37312 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9885 #b00000000000000000000000000000000)))))

(assert (=> b!1195910 (=> (not res!795359) (not e!679730))))

(declare-fun b!1195911 () Bool)

(declare-fun e!679729 () Bool)

(assert (=> b!1195911 (= e!679729 e!679731)))

(declare-fun c!117719 () Bool)

(assert (=> b!1195911 (= c!117719 (validKeyInArray!0 (select (arr!37312 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!57209 () Bool)

(declare-fun call!57212 () Bool)

(assert (=> bm!57209 (= call!57212 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1195912 () Bool)

(assert (=> b!1195912 (= e!679731 call!57212)))

(declare-fun b!1195913 () Bool)

(assert (=> b!1195913 (= e!679730 call!57212)))

(declare-fun d!132727 () Bool)

(declare-fun res!795360 () Bool)

(assert (=> d!132727 (=> res!795360 e!679729)))

(assert (=> d!132727 (= res!795360 (bvsge #b00000000000000000000000000000000 (size!37849 _keys!1208)))))

(assert (=> d!132727 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!679729)))

(assert (= (and d!132727 (not res!795360)) b!1195911))

(assert (= (and b!1195911 c!117719) b!1195910))

(assert (= (and b!1195911 (not c!117719)) b!1195912))

(assert (= (and b!1195910 res!795359) b!1195913))

(assert (= (or b!1195913 b!1195912) bm!57209))

(declare-fun m!1104049 () Bool)

(assert (=> b!1195910 m!1104049))

(declare-fun m!1104051 () Bool)

(assert (=> b!1195910 m!1104051))

(declare-fun m!1104053 () Bool)

(assert (=> b!1195910 m!1104053))

(assert (=> b!1195910 m!1104049))

(declare-fun m!1104055 () Bool)

(assert (=> b!1195910 m!1104055))

(assert (=> b!1195911 m!1104049))

(assert (=> b!1195911 m!1104049))

(declare-fun m!1104057 () Bool)

(assert (=> b!1195911 m!1104057))

(declare-fun m!1104059 () Bool)

(assert (=> bm!57209 m!1104059))

(assert (=> b!1195802 d!132727))

(declare-fun d!132729 () Bool)

(declare-fun res!795365 () Bool)

(declare-fun e!679736 () Bool)

(assert (=> d!132729 (=> res!795365 e!679736)))

(assert (=> d!132729 (= res!795365 (= (select (arr!37312 _keys!1208) i!673) k0!934))))

(assert (=> d!132729 (= (arrayContainsKey!0 _keys!1208 k0!934 i!673) e!679736)))

(declare-fun b!1195918 () Bool)

(declare-fun e!679737 () Bool)

(assert (=> b!1195918 (= e!679736 e!679737)))

(declare-fun res!795366 () Bool)

(assert (=> b!1195918 (=> (not res!795366) (not e!679737))))

(assert (=> b!1195918 (= res!795366 (bvslt (bvadd i!673 #b00000000000000000000000000000001) (size!37849 _keys!1208)))))

(declare-fun b!1195919 () Bool)

(assert (=> b!1195919 (= e!679737 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd i!673 #b00000000000000000000000000000001)))))

(assert (= (and d!132729 (not res!795365)) b!1195918))

(assert (= (and b!1195918 res!795366) b!1195919))

(assert (=> d!132729 m!1103987))

(declare-fun m!1104061 () Bool)

(assert (=> b!1195919 m!1104061))

(assert (=> b!1195803 d!132729))

(declare-fun b!1195930 () Bool)

(declare-fun e!679748 () Bool)

(declare-fun e!679749 () Bool)

(assert (=> b!1195930 (= e!679748 e!679749)))

(declare-fun res!795375 () Bool)

(assert (=> b!1195930 (=> (not res!795375) (not e!679749))))

(declare-fun e!679747 () Bool)

(assert (=> b!1195930 (= res!795375 (not e!679747))))

(declare-fun res!795373 () Bool)

(assert (=> b!1195930 (=> (not res!795373) (not e!679747))))

(assert (=> b!1195930 (= res!795373 (validKeyInArray!0 (select (arr!37312 lt!543265) #b00000000000000000000000000000000)))))

(declare-fun b!1195931 () Bool)

(declare-fun e!679746 () Bool)

(assert (=> b!1195931 (= e!679749 e!679746)))

(declare-fun c!117722 () Bool)

(assert (=> b!1195931 (= c!117722 (validKeyInArray!0 (select (arr!37312 lt!543265) #b00000000000000000000000000000000)))))

(declare-fun d!132731 () Bool)

(declare-fun res!795374 () Bool)

(assert (=> d!132731 (=> res!795374 e!679748)))

(assert (=> d!132731 (= res!795374 (bvsge #b00000000000000000000000000000000 (size!37849 lt!543265)))))

(assert (=> d!132731 (= (arrayNoDuplicates!0 lt!543265 #b00000000000000000000000000000000 Nil!26291) e!679748)))

(declare-fun b!1195932 () Bool)

(declare-fun call!57215 () Bool)

(assert (=> b!1195932 (= e!679746 call!57215)))

(declare-fun b!1195933 () Bool)

(declare-fun contains!6894 (List!26294 (_ BitVec 64)) Bool)

(assert (=> b!1195933 (= e!679747 (contains!6894 Nil!26291 (select (arr!37312 lt!543265) #b00000000000000000000000000000000)))))

(declare-fun bm!57212 () Bool)

(assert (=> bm!57212 (= call!57215 (arrayNoDuplicates!0 lt!543265 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!117722 (Cons!26290 (select (arr!37312 lt!543265) #b00000000000000000000000000000000) Nil!26291) Nil!26291)))))

(declare-fun b!1195934 () Bool)

(assert (=> b!1195934 (= e!679746 call!57215)))

(assert (= (and d!132731 (not res!795374)) b!1195930))

(assert (= (and b!1195930 res!795373) b!1195933))

(assert (= (and b!1195930 res!795375) b!1195931))

(assert (= (and b!1195931 c!117722) b!1195934))

(assert (= (and b!1195931 (not c!117722)) b!1195932))

(assert (= (or b!1195934 b!1195932) bm!57212))

(assert (=> b!1195930 m!1104037))

(assert (=> b!1195930 m!1104037))

(assert (=> b!1195930 m!1104045))

(assert (=> b!1195931 m!1104037))

(assert (=> b!1195931 m!1104037))

(assert (=> b!1195931 m!1104045))

(assert (=> b!1195933 m!1104037))

(assert (=> b!1195933 m!1104037))

(declare-fun m!1104063 () Bool)

(assert (=> b!1195933 m!1104063))

(assert (=> bm!57212 m!1104037))

(declare-fun m!1104065 () Bool)

(assert (=> bm!57212 m!1104065))

(assert (=> b!1195809 d!132731))

(declare-fun b!1195935 () Bool)

(declare-fun e!679752 () Bool)

(declare-fun e!679753 () Bool)

(assert (=> b!1195935 (= e!679752 e!679753)))

(declare-fun res!795378 () Bool)

(assert (=> b!1195935 (=> (not res!795378) (not e!679753))))

(declare-fun e!679751 () Bool)

(assert (=> b!1195935 (= res!795378 (not e!679751))))

(declare-fun res!795376 () Bool)

(assert (=> b!1195935 (=> (not res!795376) (not e!679751))))

(assert (=> b!1195935 (= res!795376 (validKeyInArray!0 (select (arr!37312 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1195936 () Bool)

(declare-fun e!679750 () Bool)

(assert (=> b!1195936 (= e!679753 e!679750)))

(declare-fun c!117723 () Bool)

(assert (=> b!1195936 (= c!117723 (validKeyInArray!0 (select (arr!37312 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!132733 () Bool)

(declare-fun res!795377 () Bool)

(assert (=> d!132733 (=> res!795377 e!679752)))

(assert (=> d!132733 (= res!795377 (bvsge #b00000000000000000000000000000000 (size!37849 _keys!1208)))))

(assert (=> d!132733 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26291) e!679752)))

(declare-fun b!1195937 () Bool)

(declare-fun call!57216 () Bool)

(assert (=> b!1195937 (= e!679750 call!57216)))

(declare-fun b!1195938 () Bool)

(assert (=> b!1195938 (= e!679751 (contains!6894 Nil!26291 (select (arr!37312 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!57213 () Bool)

(assert (=> bm!57213 (= call!57216 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!117723 (Cons!26290 (select (arr!37312 _keys!1208) #b00000000000000000000000000000000) Nil!26291) Nil!26291)))))

(declare-fun b!1195939 () Bool)

(assert (=> b!1195939 (= e!679750 call!57216)))

(assert (= (and d!132733 (not res!795377)) b!1195935))

(assert (= (and b!1195935 res!795376) b!1195938))

(assert (= (and b!1195935 res!795378) b!1195936))

(assert (= (and b!1195936 c!117723) b!1195939))

(assert (= (and b!1195936 (not c!117723)) b!1195937))

(assert (= (or b!1195939 b!1195937) bm!57213))

(assert (=> b!1195935 m!1104049))

(assert (=> b!1195935 m!1104049))

(assert (=> b!1195935 m!1104057))

(assert (=> b!1195936 m!1104049))

(assert (=> b!1195936 m!1104049))

(assert (=> b!1195936 m!1104057))

(assert (=> b!1195938 m!1104049))

(assert (=> b!1195938 m!1104049))

(declare-fun m!1104067 () Bool)

(assert (=> b!1195938 m!1104067))

(assert (=> bm!57213 m!1104049))

(declare-fun m!1104069 () Bool)

(assert (=> bm!57213 m!1104069))

(assert (=> b!1195804 d!132733))

(declare-fun mapNonEmpty!47228 () Bool)

(declare-fun mapRes!47228 () Bool)

(declare-fun tp!89838 () Bool)

(declare-fun e!679758 () Bool)

(assert (=> mapNonEmpty!47228 (= mapRes!47228 (and tp!89838 e!679758))))

(declare-fun mapRest!47228 () (Array (_ BitVec 32) ValueCell!14420))

(declare-fun mapKey!47228 () (_ BitVec 32))

(declare-fun mapValue!47228 () ValueCell!14420)

(assert (=> mapNonEmpty!47228 (= mapRest!47219 (store mapRest!47228 mapKey!47228 mapValue!47228))))

(declare-fun b!1195946 () Bool)

(assert (=> b!1195946 (= e!679758 tp_is_empty!30259)))

(declare-fun b!1195947 () Bool)

(declare-fun e!679759 () Bool)

(assert (=> b!1195947 (= e!679759 tp_is_empty!30259)))

(declare-fun mapIsEmpty!47228 () Bool)

(assert (=> mapIsEmpty!47228 mapRes!47228))

(declare-fun condMapEmpty!47228 () Bool)

(declare-fun mapDefault!47228 () ValueCell!14420)

(assert (=> mapNonEmpty!47219 (= condMapEmpty!47228 (= mapRest!47219 ((as const (Array (_ BitVec 32) ValueCell!14420)) mapDefault!47228)))))

(assert (=> mapNonEmpty!47219 (= tp!89829 (and e!679759 mapRes!47228))))

(assert (= (and mapNonEmpty!47219 condMapEmpty!47228) mapIsEmpty!47228))

(assert (= (and mapNonEmpty!47219 (not condMapEmpty!47228)) mapNonEmpty!47228))

(assert (= (and mapNonEmpty!47228 ((_ is ValueCellFull!14420) mapValue!47228)) b!1195946))

(assert (= (and mapNonEmpty!47219 ((_ is ValueCellFull!14420) mapDefault!47228)) b!1195947))

(declare-fun m!1104071 () Bool)

(assert (=> mapNonEmpty!47228 m!1104071))

(check-sat (not b!1195910) (not bm!57213) (not b!1195907) (not b!1195936) (not b!1195911) (not b!1195906) (not bm!57208) (not bm!57209) (not b!1195938) tp_is_empty!30259 (not b!1195933) (not b!1195935) (not mapNonEmpty!47228) (not bm!57212) (not b!1195931) (not b!1195919) (not b!1195930))
(check-sat)
