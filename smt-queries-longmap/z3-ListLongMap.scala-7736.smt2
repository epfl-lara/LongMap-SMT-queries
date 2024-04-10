; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97146 () Bool)

(assert start!97146)

(declare-fun b!1105123 () Bool)

(declare-fun res!737363 () Bool)

(declare-fun e!630750 () Bool)

(assert (=> b!1105123 (=> (not res!737363) (not e!630750))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!71707 0))(
  ( (array!71708 (arr!34507 (Array (_ BitVec 32) (_ BitVec 64))) (size!35043 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71707)

(assert (=> b!1105123 (= res!737363 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35043 _keys!1208))))))

(declare-fun b!1105124 () Bool)

(declare-fun res!737368 () Bool)

(assert (=> b!1105124 (=> (not res!737368) (not e!630750))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!41651 0))(
  ( (V!41652 (val!13753 Int)) )
))
(declare-datatypes ((ValueCell!12987 0))(
  ( (ValueCellFull!12987 (v!16386 V!41651)) (EmptyCell!12987) )
))
(declare-datatypes ((array!71709 0))(
  ( (array!71710 (arr!34508 (Array (_ BitVec 32) ValueCell!12987)) (size!35044 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71709)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1105124 (= res!737368 (and (= (size!35044 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35043 _keys!1208) (size!35044 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1105125 () Bool)

(declare-fun res!737365 () Bool)

(assert (=> b!1105125 (=> (not res!737365) (not e!630750))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1105125 (= res!737365 (= (select (arr!34507 _keys!1208) i!673) k0!934))))

(declare-fun b!1105126 () Bool)

(declare-fun e!630755 () Bool)

(declare-fun tp_is_empty!27393 () Bool)

(assert (=> b!1105126 (= e!630755 tp_is_empty!27393)))

(declare-fun b!1105128 () Bool)

(declare-fun res!737366 () Bool)

(assert (=> b!1105128 (=> (not res!737366) (not e!630750))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71707 (_ BitVec 32)) Bool)

(assert (=> b!1105128 (= res!737366 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1105129 () Bool)

(declare-fun res!737372 () Bool)

(assert (=> b!1105129 (=> (not res!737372) (not e!630750))))

(declare-datatypes ((List!24070 0))(
  ( (Nil!24067) (Cons!24066 (h!25275 (_ BitVec 64)) (t!34335 List!24070)) )
))
(declare-fun arrayNoDuplicates!0 (array!71707 (_ BitVec 32) List!24070) Bool)

(assert (=> b!1105129 (= res!737372 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24067))))

(declare-fun b!1105130 () Bool)

(declare-fun e!630752 () Bool)

(assert (=> b!1105130 (= e!630752 (not (or (bvsge #b00000000000000000000000000000000 (size!35043 _keys!1208)) (bvslt (size!35043 _keys!1208) #b01111111111111111111111111111111))))))

(declare-fun arrayContainsKey!0 (array!71707 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1105130 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36264 0))(
  ( (Unit!36265) )
))
(declare-fun lt!495251 () Unit!36264)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71707 (_ BitVec 64) (_ BitVec 32)) Unit!36264)

(assert (=> b!1105130 (= lt!495251 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1105131 () Bool)

(declare-fun res!737364 () Bool)

(assert (=> b!1105131 (=> (not res!737364) (not e!630752))))

(declare-fun lt!495250 () array!71707)

(assert (=> b!1105131 (= res!737364 (arrayNoDuplicates!0 lt!495250 #b00000000000000000000000000000000 Nil!24067))))

(declare-fun b!1105132 () Bool)

(assert (=> b!1105132 (= e!630750 e!630752)))

(declare-fun res!737367 () Bool)

(assert (=> b!1105132 (=> (not res!737367) (not e!630752))))

(assert (=> b!1105132 (= res!737367 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495250 mask!1564))))

(assert (=> b!1105132 (= lt!495250 (array!71708 (store (arr!34507 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35043 _keys!1208)))))

(declare-fun b!1105133 () Bool)

(declare-fun e!630753 () Bool)

(assert (=> b!1105133 (= e!630753 tp_is_empty!27393)))

(declare-fun mapNonEmpty!42904 () Bool)

(declare-fun mapRes!42904 () Bool)

(declare-fun tp!81824 () Bool)

(assert (=> mapNonEmpty!42904 (= mapRes!42904 (and tp!81824 e!630755))))

(declare-fun mapKey!42904 () (_ BitVec 32))

(declare-fun mapValue!42904 () ValueCell!12987)

(declare-fun mapRest!42904 () (Array (_ BitVec 32) ValueCell!12987))

(assert (=> mapNonEmpty!42904 (= (arr!34508 _values!996) (store mapRest!42904 mapKey!42904 mapValue!42904))))

(declare-fun b!1105134 () Bool)

(declare-fun res!737369 () Bool)

(assert (=> b!1105134 (=> (not res!737369) (not e!630750))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1105134 (= res!737369 (validMask!0 mask!1564))))

(declare-fun b!1105135 () Bool)

(declare-fun e!630751 () Bool)

(assert (=> b!1105135 (= e!630751 (and e!630753 mapRes!42904))))

(declare-fun condMapEmpty!42904 () Bool)

(declare-fun mapDefault!42904 () ValueCell!12987)

(assert (=> b!1105135 (= condMapEmpty!42904 (= (arr!34508 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12987)) mapDefault!42904)))))

(declare-fun mapIsEmpty!42904 () Bool)

(assert (=> mapIsEmpty!42904 mapRes!42904))

(declare-fun b!1105127 () Bool)

(declare-fun res!737371 () Bool)

(assert (=> b!1105127 (=> (not res!737371) (not e!630750))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1105127 (= res!737371 (validKeyInArray!0 k0!934))))

(declare-fun res!737370 () Bool)

(assert (=> start!97146 (=> (not res!737370) (not e!630750))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97146 (= res!737370 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35043 _keys!1208))))))

(assert (=> start!97146 e!630750))

(declare-fun array_inv!26564 (array!71707) Bool)

(assert (=> start!97146 (array_inv!26564 _keys!1208)))

(assert (=> start!97146 true))

(declare-fun array_inv!26565 (array!71709) Bool)

(assert (=> start!97146 (and (array_inv!26565 _values!996) e!630751)))

(assert (= (and start!97146 res!737370) b!1105134))

(assert (= (and b!1105134 res!737369) b!1105124))

(assert (= (and b!1105124 res!737368) b!1105128))

(assert (= (and b!1105128 res!737366) b!1105129))

(assert (= (and b!1105129 res!737372) b!1105123))

(assert (= (and b!1105123 res!737363) b!1105127))

(assert (= (and b!1105127 res!737371) b!1105125))

(assert (= (and b!1105125 res!737365) b!1105132))

(assert (= (and b!1105132 res!737367) b!1105131))

(assert (= (and b!1105131 res!737364) b!1105130))

(assert (= (and b!1105135 condMapEmpty!42904) mapIsEmpty!42904))

(assert (= (and b!1105135 (not condMapEmpty!42904)) mapNonEmpty!42904))

(get-info :version)

(assert (= (and mapNonEmpty!42904 ((_ is ValueCellFull!12987) mapValue!42904)) b!1105126))

(assert (= (and b!1105135 ((_ is ValueCellFull!12987) mapDefault!42904)) b!1105133))

(assert (= start!97146 b!1105135))

(declare-fun m!1024619 () Bool)

(assert (=> b!1105132 m!1024619))

(declare-fun m!1024621 () Bool)

(assert (=> b!1105132 m!1024621))

(declare-fun m!1024623 () Bool)

(assert (=> b!1105134 m!1024623))

(declare-fun m!1024625 () Bool)

(assert (=> mapNonEmpty!42904 m!1024625))

(declare-fun m!1024627 () Bool)

(assert (=> b!1105127 m!1024627))

(declare-fun m!1024629 () Bool)

(assert (=> b!1105125 m!1024629))

(declare-fun m!1024631 () Bool)

(assert (=> b!1105128 m!1024631))

(declare-fun m!1024633 () Bool)

(assert (=> b!1105129 m!1024633))

(declare-fun m!1024635 () Bool)

(assert (=> b!1105130 m!1024635))

(declare-fun m!1024637 () Bool)

(assert (=> b!1105130 m!1024637))

(declare-fun m!1024639 () Bool)

(assert (=> start!97146 m!1024639))

(declare-fun m!1024641 () Bool)

(assert (=> start!97146 m!1024641))

(declare-fun m!1024643 () Bool)

(assert (=> b!1105131 m!1024643))

(check-sat (not b!1105130) tp_is_empty!27393 (not b!1105134) (not b!1105129) (not b!1105128) (not mapNonEmpty!42904) (not b!1105131) (not b!1105127) (not b!1105132) (not start!97146))
(check-sat)
(get-model)

(declare-fun d!130919 () Bool)

(declare-fun res!737411 () Bool)

(declare-fun e!630782 () Bool)

(assert (=> d!130919 (=> res!737411 e!630782)))

(assert (=> d!130919 (= res!737411 (bvsge #b00000000000000000000000000000000 (size!35043 _keys!1208)))))

(assert (=> d!130919 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24067) e!630782)))

(declare-fun b!1105185 () Bool)

(declare-fun e!630785 () Bool)

(declare-fun contains!6419 (List!24070 (_ BitVec 64)) Bool)

(assert (=> b!1105185 (= e!630785 (contains!6419 Nil!24067 (select (arr!34507 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1105186 () Bool)

(declare-fun e!630784 () Bool)

(declare-fun call!46349 () Bool)

(assert (=> b!1105186 (= e!630784 call!46349)))

(declare-fun b!1105187 () Bool)

(declare-fun e!630783 () Bool)

(assert (=> b!1105187 (= e!630783 e!630784)))

(declare-fun c!109003 () Bool)

(assert (=> b!1105187 (= c!109003 (validKeyInArray!0 (select (arr!34507 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!46346 () Bool)

(assert (=> bm!46346 (= call!46349 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!109003 (Cons!24066 (select (arr!34507 _keys!1208) #b00000000000000000000000000000000) Nil!24067) Nil!24067)))))

(declare-fun b!1105188 () Bool)

(assert (=> b!1105188 (= e!630782 e!630783)))

(declare-fun res!737409 () Bool)

(assert (=> b!1105188 (=> (not res!737409) (not e!630783))))

(assert (=> b!1105188 (= res!737409 (not e!630785))))

(declare-fun res!737410 () Bool)

(assert (=> b!1105188 (=> (not res!737410) (not e!630785))))

(assert (=> b!1105188 (= res!737410 (validKeyInArray!0 (select (arr!34507 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1105189 () Bool)

(assert (=> b!1105189 (= e!630784 call!46349)))

(assert (= (and d!130919 (not res!737411)) b!1105188))

(assert (= (and b!1105188 res!737410) b!1105185))

(assert (= (and b!1105188 res!737409) b!1105187))

(assert (= (and b!1105187 c!109003) b!1105189))

(assert (= (and b!1105187 (not c!109003)) b!1105186))

(assert (= (or b!1105189 b!1105186) bm!46346))

(declare-fun m!1024671 () Bool)

(assert (=> b!1105185 m!1024671))

(assert (=> b!1105185 m!1024671))

(declare-fun m!1024673 () Bool)

(assert (=> b!1105185 m!1024673))

(assert (=> b!1105187 m!1024671))

(assert (=> b!1105187 m!1024671))

(declare-fun m!1024675 () Bool)

(assert (=> b!1105187 m!1024675))

(assert (=> bm!46346 m!1024671))

(declare-fun m!1024677 () Bool)

(assert (=> bm!46346 m!1024677))

(assert (=> b!1105188 m!1024671))

(assert (=> b!1105188 m!1024671))

(assert (=> b!1105188 m!1024675))

(assert (=> b!1105129 d!130919))

(declare-fun d!130921 () Bool)

(assert (=> d!130921 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1105134 d!130921))

(declare-fun d!130923 () Bool)

(declare-fun res!737416 () Bool)

(declare-fun e!630790 () Bool)

(assert (=> d!130923 (=> res!737416 e!630790)))

(assert (=> d!130923 (= res!737416 (= (select (arr!34507 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!130923 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!630790)))

(declare-fun b!1105194 () Bool)

(declare-fun e!630791 () Bool)

(assert (=> b!1105194 (= e!630790 e!630791)))

(declare-fun res!737417 () Bool)

(assert (=> b!1105194 (=> (not res!737417) (not e!630791))))

(assert (=> b!1105194 (= res!737417 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!35043 _keys!1208)))))

(declare-fun b!1105195 () Bool)

(assert (=> b!1105195 (= e!630791 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!130923 (not res!737416)) b!1105194))

(assert (= (and b!1105194 res!737417) b!1105195))

(assert (=> d!130923 m!1024671))

(declare-fun m!1024679 () Bool)

(assert (=> b!1105195 m!1024679))

(assert (=> b!1105130 d!130923))

(declare-fun d!130925 () Bool)

(assert (=> d!130925 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!495260 () Unit!36264)

(declare-fun choose!13 (array!71707 (_ BitVec 64) (_ BitVec 32)) Unit!36264)

(assert (=> d!130925 (= lt!495260 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!130925 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!130925 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!495260)))

(declare-fun bs!32419 () Bool)

(assert (= bs!32419 d!130925))

(assert (=> bs!32419 m!1024635))

(declare-fun m!1024681 () Bool)

(assert (=> bs!32419 m!1024681))

(assert (=> b!1105130 d!130925))

(declare-fun b!1105204 () Bool)

(declare-fun e!630799 () Bool)

(declare-fun e!630800 () Bool)

(assert (=> b!1105204 (= e!630799 e!630800)))

(declare-fun c!109006 () Bool)

(assert (=> b!1105204 (= c!109006 (validKeyInArray!0 (select (arr!34507 lt!495250) #b00000000000000000000000000000000)))))

(declare-fun d!130927 () Bool)

(declare-fun res!737423 () Bool)

(assert (=> d!130927 (=> res!737423 e!630799)))

(assert (=> d!130927 (= res!737423 (bvsge #b00000000000000000000000000000000 (size!35043 lt!495250)))))

(assert (=> d!130927 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495250 mask!1564) e!630799)))

(declare-fun b!1105205 () Bool)

(declare-fun e!630798 () Bool)

(declare-fun call!46352 () Bool)

(assert (=> b!1105205 (= e!630798 call!46352)))

(declare-fun b!1105206 () Bool)

(assert (=> b!1105206 (= e!630800 call!46352)))

(declare-fun bm!46349 () Bool)

(assert (=> bm!46349 (= call!46352 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!495250 mask!1564))))

(declare-fun b!1105207 () Bool)

(assert (=> b!1105207 (= e!630800 e!630798)))

(declare-fun lt!495268 () (_ BitVec 64))

(assert (=> b!1105207 (= lt!495268 (select (arr!34507 lt!495250) #b00000000000000000000000000000000))))

(declare-fun lt!495267 () Unit!36264)

(assert (=> b!1105207 (= lt!495267 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!495250 lt!495268 #b00000000000000000000000000000000))))

(assert (=> b!1105207 (arrayContainsKey!0 lt!495250 lt!495268 #b00000000000000000000000000000000)))

(declare-fun lt!495269 () Unit!36264)

(assert (=> b!1105207 (= lt!495269 lt!495267)))

(declare-fun res!737422 () Bool)

(declare-datatypes ((SeekEntryResult!9924 0))(
  ( (MissingZero!9924 (index!42067 (_ BitVec 32))) (Found!9924 (index!42068 (_ BitVec 32))) (Intermediate!9924 (undefined!10736 Bool) (index!42069 (_ BitVec 32)) (x!99381 (_ BitVec 32))) (Undefined!9924) (MissingVacant!9924 (index!42070 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71707 (_ BitVec 32)) SeekEntryResult!9924)

(assert (=> b!1105207 (= res!737422 (= (seekEntryOrOpen!0 (select (arr!34507 lt!495250) #b00000000000000000000000000000000) lt!495250 mask!1564) (Found!9924 #b00000000000000000000000000000000)))))

(assert (=> b!1105207 (=> (not res!737422) (not e!630798))))

(assert (= (and d!130927 (not res!737423)) b!1105204))

(assert (= (and b!1105204 c!109006) b!1105207))

(assert (= (and b!1105204 (not c!109006)) b!1105206))

(assert (= (and b!1105207 res!737422) b!1105205))

(assert (= (or b!1105205 b!1105206) bm!46349))

(declare-fun m!1024683 () Bool)

(assert (=> b!1105204 m!1024683))

(assert (=> b!1105204 m!1024683))

(declare-fun m!1024685 () Bool)

(assert (=> b!1105204 m!1024685))

(declare-fun m!1024687 () Bool)

(assert (=> bm!46349 m!1024687))

(assert (=> b!1105207 m!1024683))

(declare-fun m!1024689 () Bool)

(assert (=> b!1105207 m!1024689))

(declare-fun m!1024691 () Bool)

(assert (=> b!1105207 m!1024691))

(assert (=> b!1105207 m!1024683))

(declare-fun m!1024693 () Bool)

(assert (=> b!1105207 m!1024693))

(assert (=> b!1105132 d!130927))

(declare-fun d!130929 () Bool)

(declare-fun res!737426 () Bool)

(declare-fun e!630801 () Bool)

(assert (=> d!130929 (=> res!737426 e!630801)))

(assert (=> d!130929 (= res!737426 (bvsge #b00000000000000000000000000000000 (size!35043 lt!495250)))))

(assert (=> d!130929 (= (arrayNoDuplicates!0 lt!495250 #b00000000000000000000000000000000 Nil!24067) e!630801)))

(declare-fun b!1105208 () Bool)

(declare-fun e!630804 () Bool)

(assert (=> b!1105208 (= e!630804 (contains!6419 Nil!24067 (select (arr!34507 lt!495250) #b00000000000000000000000000000000)))))

(declare-fun b!1105209 () Bool)

(declare-fun e!630803 () Bool)

(declare-fun call!46353 () Bool)

(assert (=> b!1105209 (= e!630803 call!46353)))

(declare-fun b!1105210 () Bool)

(declare-fun e!630802 () Bool)

(assert (=> b!1105210 (= e!630802 e!630803)))

(declare-fun c!109007 () Bool)

(assert (=> b!1105210 (= c!109007 (validKeyInArray!0 (select (arr!34507 lt!495250) #b00000000000000000000000000000000)))))

(declare-fun bm!46350 () Bool)

(assert (=> bm!46350 (= call!46353 (arrayNoDuplicates!0 lt!495250 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!109007 (Cons!24066 (select (arr!34507 lt!495250) #b00000000000000000000000000000000) Nil!24067) Nil!24067)))))

(declare-fun b!1105211 () Bool)

(assert (=> b!1105211 (= e!630801 e!630802)))

(declare-fun res!737424 () Bool)

(assert (=> b!1105211 (=> (not res!737424) (not e!630802))))

(assert (=> b!1105211 (= res!737424 (not e!630804))))

(declare-fun res!737425 () Bool)

(assert (=> b!1105211 (=> (not res!737425) (not e!630804))))

(assert (=> b!1105211 (= res!737425 (validKeyInArray!0 (select (arr!34507 lt!495250) #b00000000000000000000000000000000)))))

(declare-fun b!1105212 () Bool)

(assert (=> b!1105212 (= e!630803 call!46353)))

(assert (= (and d!130929 (not res!737426)) b!1105211))

(assert (= (and b!1105211 res!737425) b!1105208))

(assert (= (and b!1105211 res!737424) b!1105210))

(assert (= (and b!1105210 c!109007) b!1105212))

(assert (= (and b!1105210 (not c!109007)) b!1105209))

(assert (= (or b!1105212 b!1105209) bm!46350))

(assert (=> b!1105208 m!1024683))

(assert (=> b!1105208 m!1024683))

(declare-fun m!1024695 () Bool)

(assert (=> b!1105208 m!1024695))

(assert (=> b!1105210 m!1024683))

(assert (=> b!1105210 m!1024683))

(assert (=> b!1105210 m!1024685))

(assert (=> bm!46350 m!1024683))

(declare-fun m!1024697 () Bool)

(assert (=> bm!46350 m!1024697))

(assert (=> b!1105211 m!1024683))

(assert (=> b!1105211 m!1024683))

(assert (=> b!1105211 m!1024685))

(assert (=> b!1105131 d!130929))

(declare-fun b!1105213 () Bool)

(declare-fun e!630806 () Bool)

(declare-fun e!630807 () Bool)

(assert (=> b!1105213 (= e!630806 e!630807)))

(declare-fun c!109008 () Bool)

(assert (=> b!1105213 (= c!109008 (validKeyInArray!0 (select (arr!34507 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!130931 () Bool)

(declare-fun res!737428 () Bool)

(assert (=> d!130931 (=> res!737428 e!630806)))

(assert (=> d!130931 (= res!737428 (bvsge #b00000000000000000000000000000000 (size!35043 _keys!1208)))))

(assert (=> d!130931 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!630806)))

(declare-fun b!1105214 () Bool)

(declare-fun e!630805 () Bool)

(declare-fun call!46354 () Bool)

(assert (=> b!1105214 (= e!630805 call!46354)))

(declare-fun b!1105215 () Bool)

(assert (=> b!1105215 (= e!630807 call!46354)))

(declare-fun bm!46351 () Bool)

(assert (=> bm!46351 (= call!46354 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1105216 () Bool)

(assert (=> b!1105216 (= e!630807 e!630805)))

(declare-fun lt!495271 () (_ BitVec 64))

(assert (=> b!1105216 (= lt!495271 (select (arr!34507 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!495270 () Unit!36264)

(assert (=> b!1105216 (= lt!495270 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!495271 #b00000000000000000000000000000000))))

(assert (=> b!1105216 (arrayContainsKey!0 _keys!1208 lt!495271 #b00000000000000000000000000000000)))

(declare-fun lt!495272 () Unit!36264)

(assert (=> b!1105216 (= lt!495272 lt!495270)))

(declare-fun res!737427 () Bool)

(assert (=> b!1105216 (= res!737427 (= (seekEntryOrOpen!0 (select (arr!34507 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9924 #b00000000000000000000000000000000)))))

(assert (=> b!1105216 (=> (not res!737427) (not e!630805))))

(assert (= (and d!130931 (not res!737428)) b!1105213))

(assert (= (and b!1105213 c!109008) b!1105216))

(assert (= (and b!1105213 (not c!109008)) b!1105215))

(assert (= (and b!1105216 res!737427) b!1105214))

(assert (= (or b!1105214 b!1105215) bm!46351))

(assert (=> b!1105213 m!1024671))

(assert (=> b!1105213 m!1024671))

(assert (=> b!1105213 m!1024675))

(declare-fun m!1024699 () Bool)

(assert (=> bm!46351 m!1024699))

(assert (=> b!1105216 m!1024671))

(declare-fun m!1024701 () Bool)

(assert (=> b!1105216 m!1024701))

(declare-fun m!1024703 () Bool)

(assert (=> b!1105216 m!1024703))

(assert (=> b!1105216 m!1024671))

(declare-fun m!1024705 () Bool)

(assert (=> b!1105216 m!1024705))

(assert (=> b!1105128 d!130931))

(declare-fun d!130933 () Bool)

(assert (=> d!130933 (= (array_inv!26564 _keys!1208) (bvsge (size!35043 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!97146 d!130933))

(declare-fun d!130935 () Bool)

(assert (=> d!130935 (= (array_inv!26565 _values!996) (bvsge (size!35044 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!97146 d!130935))

(declare-fun d!130937 () Bool)

(assert (=> d!130937 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1105127 d!130937))

(declare-fun mapIsEmpty!42910 () Bool)

(declare-fun mapRes!42910 () Bool)

(assert (=> mapIsEmpty!42910 mapRes!42910))

(declare-fun condMapEmpty!42910 () Bool)

(declare-fun mapDefault!42910 () ValueCell!12987)

(assert (=> mapNonEmpty!42904 (= condMapEmpty!42910 (= mapRest!42904 ((as const (Array (_ BitVec 32) ValueCell!12987)) mapDefault!42910)))))

(declare-fun e!630813 () Bool)

(assert (=> mapNonEmpty!42904 (= tp!81824 (and e!630813 mapRes!42910))))

(declare-fun b!1105224 () Bool)

(assert (=> b!1105224 (= e!630813 tp_is_empty!27393)))

(declare-fun b!1105223 () Bool)

(declare-fun e!630812 () Bool)

(assert (=> b!1105223 (= e!630812 tp_is_empty!27393)))

(declare-fun mapNonEmpty!42910 () Bool)

(declare-fun tp!81830 () Bool)

(assert (=> mapNonEmpty!42910 (= mapRes!42910 (and tp!81830 e!630812))))

(declare-fun mapValue!42910 () ValueCell!12987)

(declare-fun mapRest!42910 () (Array (_ BitVec 32) ValueCell!12987))

(declare-fun mapKey!42910 () (_ BitVec 32))

(assert (=> mapNonEmpty!42910 (= mapRest!42904 (store mapRest!42910 mapKey!42910 mapValue!42910))))

(assert (= (and mapNonEmpty!42904 condMapEmpty!42910) mapIsEmpty!42910))

(assert (= (and mapNonEmpty!42904 (not condMapEmpty!42910)) mapNonEmpty!42910))

(assert (= (and mapNonEmpty!42910 ((_ is ValueCellFull!12987) mapValue!42910)) b!1105223))

(assert (= (and mapNonEmpty!42904 ((_ is ValueCellFull!12987) mapDefault!42910)) b!1105224))

(declare-fun m!1024707 () Bool)

(assert (=> mapNonEmpty!42910 m!1024707))

(check-sat (not b!1105211) (not bm!46350) (not b!1105207) tp_is_empty!27393 (not b!1105185) (not b!1105187) (not bm!46351) (not b!1105216) (not bm!46346) (not b!1105188) (not bm!46349) (not b!1105204) (not d!130925) (not b!1105210) (not b!1105195) (not b!1105208) (not mapNonEmpty!42910) (not b!1105213))
(check-sat)
