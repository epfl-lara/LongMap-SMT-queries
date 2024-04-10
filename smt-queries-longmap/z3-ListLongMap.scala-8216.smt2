; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100190 () Bool)

(assert start!100190)

(declare-fun b!1194841 () Bool)

(declare-fun e!679016 () Bool)

(declare-fun tp_is_empty!30273 () Bool)

(assert (=> b!1194841 (= e!679016 tp_is_empty!30273)))

(declare-fun b!1194842 () Bool)

(declare-fun res!795014 () Bool)

(declare-fun e!679015 () Bool)

(assert (=> b!1194842 (=> (not res!795014) (not e!679015))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1194842 (= res!795014 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!47243 () Bool)

(declare-fun mapRes!47243 () Bool)

(declare-fun tp!89853 () Bool)

(declare-fun e!679014 () Bool)

(assert (=> mapNonEmpty!47243 (= mapRes!47243 (and tp!89853 e!679014))))

(declare-datatypes ((V!45491 0))(
  ( (V!45492 (val!15193 Int)) )
))
(declare-datatypes ((ValueCell!14427 0))(
  ( (ValueCellFull!14427 (v!17831 V!45491)) (EmptyCell!14427) )
))
(declare-fun mapValue!47243 () ValueCell!14427)

(declare-fun mapRest!47243 () (Array (_ BitVec 32) ValueCell!14427))

(declare-fun mapKey!47243 () (_ BitVec 32))

(declare-datatypes ((array!77327 0))(
  ( (array!77328 (arr!37311 (Array (_ BitVec 32) ValueCell!14427)) (size!37847 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77327)

(assert (=> mapNonEmpty!47243 (= (arr!37311 _values!996) (store mapRest!47243 mapKey!47243 mapValue!47243))))

(declare-fun b!1194843 () Bool)

(declare-fun e!679017 () Bool)

(assert (=> b!1194843 (= e!679015 e!679017)))

(declare-fun res!795019 () Bool)

(assert (=> b!1194843 (=> (not res!795019) (not e!679017))))

(declare-datatypes ((array!77329 0))(
  ( (array!77330 (arr!37312 (Array (_ BitVec 32) (_ BitVec 64))) (size!37848 (_ BitVec 32))) )
))
(declare-fun lt!542828 () array!77329)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77329 (_ BitVec 32)) Bool)

(assert (=> b!1194843 (= res!795019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542828 mask!1564))))

(declare-fun _keys!1208 () array!77329)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1194843 (= lt!542828 (array!77330 (store (arr!37312 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37848 _keys!1208)))))

(declare-fun b!1194845 () Bool)

(assert (=> b!1194845 (= e!679014 tp_is_empty!30273)))

(declare-fun b!1194846 () Bool)

(declare-fun res!795012 () Bool)

(assert (=> b!1194846 (=> (not res!795012) (not e!679015))))

(declare-datatypes ((List!26268 0))(
  ( (Nil!26265) (Cons!26264 (h!27473 (_ BitVec 64)) (t!38939 List!26268)) )
))
(declare-fun arrayNoDuplicates!0 (array!77329 (_ BitVec 32) List!26268) Bool)

(assert (=> b!1194846 (= res!795012 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26265))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1194847 () Bool)

(assert (=> b!1194847 (= e!679017 (not (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!37848 _keys!1208)) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000))))))

(declare-fun arrayContainsKey!0 (array!77329 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1194847 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39610 0))(
  ( (Unit!39611) )
))
(declare-fun lt!542829 () Unit!39610)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77329 (_ BitVec 64) (_ BitVec 32)) Unit!39610)

(assert (=> b!1194847 (= lt!542829 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!47243 () Bool)

(assert (=> mapIsEmpty!47243 mapRes!47243))

(declare-fun b!1194848 () Bool)

(declare-fun res!795018 () Bool)

(assert (=> b!1194848 (=> (not res!795018) (not e!679015))))

(assert (=> b!1194848 (= res!795018 (= (select (arr!37312 _keys!1208) i!673) k0!934))))

(declare-fun b!1194849 () Bool)

(declare-fun res!795020 () Bool)

(assert (=> b!1194849 (=> (not res!795020) (not e!679015))))

(assert (=> b!1194849 (= res!795020 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37848 _keys!1208))))))

(declare-fun res!795013 () Bool)

(assert (=> start!100190 (=> (not res!795013) (not e!679015))))

(assert (=> start!100190 (= res!795013 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37848 _keys!1208))))))

(assert (=> start!100190 e!679015))

(declare-fun array_inv!28440 (array!77329) Bool)

(assert (=> start!100190 (array_inv!28440 _keys!1208)))

(assert (=> start!100190 true))

(declare-fun e!679012 () Bool)

(declare-fun array_inv!28441 (array!77327) Bool)

(assert (=> start!100190 (and (array_inv!28441 _values!996) e!679012)))

(declare-fun b!1194844 () Bool)

(declare-fun res!795011 () Bool)

(assert (=> b!1194844 (=> (not res!795011) (not e!679015))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1194844 (= res!795011 (validMask!0 mask!1564))))

(declare-fun b!1194850 () Bool)

(declare-fun res!795016 () Bool)

(assert (=> b!1194850 (=> (not res!795016) (not e!679015))))

(assert (=> b!1194850 (= res!795016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1194851 () Bool)

(declare-fun res!795015 () Bool)

(assert (=> b!1194851 (=> (not res!795015) (not e!679017))))

(assert (=> b!1194851 (= res!795015 (arrayNoDuplicates!0 lt!542828 #b00000000000000000000000000000000 Nil!26265))))

(declare-fun b!1194852 () Bool)

(assert (=> b!1194852 (= e!679012 (and e!679016 mapRes!47243))))

(declare-fun condMapEmpty!47243 () Bool)

(declare-fun mapDefault!47243 () ValueCell!14427)

(assert (=> b!1194852 (= condMapEmpty!47243 (= (arr!37311 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14427)) mapDefault!47243)))))

(declare-fun b!1194853 () Bool)

(declare-fun res!795017 () Bool)

(assert (=> b!1194853 (=> (not res!795017) (not e!679015))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1194853 (= res!795017 (and (= (size!37847 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37848 _keys!1208) (size!37847 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!100190 res!795013) b!1194844))

(assert (= (and b!1194844 res!795011) b!1194853))

(assert (= (and b!1194853 res!795017) b!1194850))

(assert (= (and b!1194850 res!795016) b!1194846))

(assert (= (and b!1194846 res!795012) b!1194849))

(assert (= (and b!1194849 res!795020) b!1194842))

(assert (= (and b!1194842 res!795014) b!1194848))

(assert (= (and b!1194848 res!795018) b!1194843))

(assert (= (and b!1194843 res!795019) b!1194851))

(assert (= (and b!1194851 res!795015) b!1194847))

(assert (= (and b!1194852 condMapEmpty!47243) mapIsEmpty!47243))

(assert (= (and b!1194852 (not condMapEmpty!47243)) mapNonEmpty!47243))

(get-info :version)

(assert (= (and mapNonEmpty!47243 ((_ is ValueCellFull!14427) mapValue!47243)) b!1194845))

(assert (= (and b!1194852 ((_ is ValueCellFull!14427) mapDefault!47243)) b!1194841))

(assert (= start!100190 b!1194852))

(declare-fun m!1102605 () Bool)

(assert (=> b!1194850 m!1102605))

(declare-fun m!1102607 () Bool)

(assert (=> b!1194844 m!1102607))

(declare-fun m!1102609 () Bool)

(assert (=> b!1194843 m!1102609))

(declare-fun m!1102611 () Bool)

(assert (=> b!1194843 m!1102611))

(declare-fun m!1102613 () Bool)

(assert (=> mapNonEmpty!47243 m!1102613))

(declare-fun m!1102615 () Bool)

(assert (=> b!1194847 m!1102615))

(declare-fun m!1102617 () Bool)

(assert (=> b!1194847 m!1102617))

(declare-fun m!1102619 () Bool)

(assert (=> start!100190 m!1102619))

(declare-fun m!1102621 () Bool)

(assert (=> start!100190 m!1102621))

(declare-fun m!1102623 () Bool)

(assert (=> b!1194846 m!1102623))

(declare-fun m!1102625 () Bool)

(assert (=> b!1194842 m!1102625))

(declare-fun m!1102627 () Bool)

(assert (=> b!1194851 m!1102627))

(declare-fun m!1102629 () Bool)

(assert (=> b!1194848 m!1102629))

(check-sat (not b!1194851) (not b!1194847) (not b!1194842) (not b!1194846) (not mapNonEmpty!47243) tp_is_empty!30273 (not b!1194844) (not b!1194843) (not b!1194850) (not start!100190))
(check-sat)
(get-model)

(declare-fun b!1194903 () Bool)

(declare-fun e!679046 () Bool)

(declare-fun contains!6863 (List!26268 (_ BitVec 64)) Bool)

(assert (=> b!1194903 (= e!679046 (contains!6863 Nil!26265 (select (arr!37312 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!57151 () Bool)

(declare-fun call!57154 () Bool)

(declare-fun c!117328 () Bool)

(assert (=> bm!57151 (= call!57154 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!117328 (Cons!26264 (select (arr!37312 _keys!1208) #b00000000000000000000000000000000) Nil!26265) Nil!26265)))))

(declare-fun b!1194904 () Bool)

(declare-fun e!679045 () Bool)

(assert (=> b!1194904 (= e!679045 call!57154)))

(declare-fun b!1194905 () Bool)

(assert (=> b!1194905 (= e!679045 call!57154)))

(declare-fun d!132297 () Bool)

(declare-fun res!795057 () Bool)

(declare-fun e!679047 () Bool)

(assert (=> d!132297 (=> res!795057 e!679047)))

(assert (=> d!132297 (= res!795057 (bvsge #b00000000000000000000000000000000 (size!37848 _keys!1208)))))

(assert (=> d!132297 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26265) e!679047)))

(declare-fun b!1194906 () Bool)

(declare-fun e!679044 () Bool)

(assert (=> b!1194906 (= e!679047 e!679044)))

(declare-fun res!795059 () Bool)

(assert (=> b!1194906 (=> (not res!795059) (not e!679044))))

(assert (=> b!1194906 (= res!795059 (not e!679046))))

(declare-fun res!795058 () Bool)

(assert (=> b!1194906 (=> (not res!795058) (not e!679046))))

(assert (=> b!1194906 (= res!795058 (validKeyInArray!0 (select (arr!37312 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1194907 () Bool)

(assert (=> b!1194907 (= e!679044 e!679045)))

(assert (=> b!1194907 (= c!117328 (validKeyInArray!0 (select (arr!37312 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!132297 (not res!795057)) b!1194906))

(assert (= (and b!1194906 res!795058) b!1194903))

(assert (= (and b!1194906 res!795059) b!1194907))

(assert (= (and b!1194907 c!117328) b!1194905))

(assert (= (and b!1194907 (not c!117328)) b!1194904))

(assert (= (or b!1194905 b!1194904) bm!57151))

(declare-fun m!1102657 () Bool)

(assert (=> b!1194903 m!1102657))

(assert (=> b!1194903 m!1102657))

(declare-fun m!1102659 () Bool)

(assert (=> b!1194903 m!1102659))

(assert (=> bm!57151 m!1102657))

(declare-fun m!1102661 () Bool)

(assert (=> bm!57151 m!1102661))

(assert (=> b!1194906 m!1102657))

(assert (=> b!1194906 m!1102657))

(declare-fun m!1102663 () Bool)

(assert (=> b!1194906 m!1102663))

(assert (=> b!1194907 m!1102657))

(assert (=> b!1194907 m!1102657))

(assert (=> b!1194907 m!1102663))

(assert (=> b!1194846 d!132297))

(declare-fun bm!57154 () Bool)

(declare-fun call!57157 () Bool)

(assert (=> bm!57154 (= call!57157 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1194916 () Bool)

(declare-fun e!679055 () Bool)

(assert (=> b!1194916 (= e!679055 call!57157)))

(declare-fun b!1194917 () Bool)

(declare-fun e!679056 () Bool)

(assert (=> b!1194917 (= e!679056 call!57157)))

(declare-fun b!1194918 () Bool)

(declare-fun e!679054 () Bool)

(assert (=> b!1194918 (= e!679054 e!679055)))

(declare-fun c!117331 () Bool)

(assert (=> b!1194918 (= c!117331 (validKeyInArray!0 (select (arr!37312 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!132299 () Bool)

(declare-fun res!795064 () Bool)

(assert (=> d!132299 (=> res!795064 e!679054)))

(assert (=> d!132299 (= res!795064 (bvsge #b00000000000000000000000000000000 (size!37848 _keys!1208)))))

(assert (=> d!132299 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!679054)))

(declare-fun b!1194919 () Bool)

(assert (=> b!1194919 (= e!679055 e!679056)))

(declare-fun lt!542843 () (_ BitVec 64))

(assert (=> b!1194919 (= lt!542843 (select (arr!37312 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!542844 () Unit!39610)

(assert (=> b!1194919 (= lt!542844 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!542843 #b00000000000000000000000000000000))))

(assert (=> b!1194919 (arrayContainsKey!0 _keys!1208 lt!542843 #b00000000000000000000000000000000)))

(declare-fun lt!542842 () Unit!39610)

(assert (=> b!1194919 (= lt!542842 lt!542844)))

(declare-fun res!795065 () Bool)

(declare-datatypes ((SeekEntryResult!9930 0))(
  ( (MissingZero!9930 (index!42091 (_ BitVec 32))) (Found!9930 (index!42092 (_ BitVec 32))) (Intermediate!9930 (undefined!10742 Bool) (index!42093 (_ BitVec 32)) (x!105676 (_ BitVec 32))) (Undefined!9930) (MissingVacant!9930 (index!42094 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!77329 (_ BitVec 32)) SeekEntryResult!9930)

(assert (=> b!1194919 (= res!795065 (= (seekEntryOrOpen!0 (select (arr!37312 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9930 #b00000000000000000000000000000000)))))

(assert (=> b!1194919 (=> (not res!795065) (not e!679056))))

(assert (= (and d!132299 (not res!795064)) b!1194918))

(assert (= (and b!1194918 c!117331) b!1194919))

(assert (= (and b!1194918 (not c!117331)) b!1194916))

(assert (= (and b!1194919 res!795065) b!1194917))

(assert (= (or b!1194917 b!1194916) bm!57154))

(declare-fun m!1102665 () Bool)

(assert (=> bm!57154 m!1102665))

(assert (=> b!1194918 m!1102657))

(assert (=> b!1194918 m!1102657))

(assert (=> b!1194918 m!1102663))

(assert (=> b!1194919 m!1102657))

(declare-fun m!1102667 () Bool)

(assert (=> b!1194919 m!1102667))

(declare-fun m!1102669 () Bool)

(assert (=> b!1194919 m!1102669))

(assert (=> b!1194919 m!1102657))

(declare-fun m!1102671 () Bool)

(assert (=> b!1194919 m!1102671))

(assert (=> b!1194850 d!132299))

(declare-fun d!132301 () Bool)

(assert (=> d!132301 (= (array_inv!28440 _keys!1208) (bvsge (size!37848 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!100190 d!132301))

(declare-fun d!132303 () Bool)

(assert (=> d!132303 (= (array_inv!28441 _values!996) (bvsge (size!37847 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!100190 d!132303))

(declare-fun d!132305 () Bool)

(assert (=> d!132305 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1194844 d!132305))

(declare-fun bm!57155 () Bool)

(declare-fun call!57158 () Bool)

(assert (=> bm!57155 (= call!57158 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!542828 mask!1564))))

(declare-fun b!1194920 () Bool)

(declare-fun e!679058 () Bool)

(assert (=> b!1194920 (= e!679058 call!57158)))

(declare-fun b!1194921 () Bool)

(declare-fun e!679059 () Bool)

(assert (=> b!1194921 (= e!679059 call!57158)))

(declare-fun b!1194922 () Bool)

(declare-fun e!679057 () Bool)

(assert (=> b!1194922 (= e!679057 e!679058)))

(declare-fun c!117332 () Bool)

(assert (=> b!1194922 (= c!117332 (validKeyInArray!0 (select (arr!37312 lt!542828) #b00000000000000000000000000000000)))))

(declare-fun d!132307 () Bool)

(declare-fun res!795066 () Bool)

(assert (=> d!132307 (=> res!795066 e!679057)))

(assert (=> d!132307 (= res!795066 (bvsge #b00000000000000000000000000000000 (size!37848 lt!542828)))))

(assert (=> d!132307 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542828 mask!1564) e!679057)))

(declare-fun b!1194923 () Bool)

(assert (=> b!1194923 (= e!679058 e!679059)))

(declare-fun lt!542846 () (_ BitVec 64))

(assert (=> b!1194923 (= lt!542846 (select (arr!37312 lt!542828) #b00000000000000000000000000000000))))

(declare-fun lt!542847 () Unit!39610)

(assert (=> b!1194923 (= lt!542847 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!542828 lt!542846 #b00000000000000000000000000000000))))

(assert (=> b!1194923 (arrayContainsKey!0 lt!542828 lt!542846 #b00000000000000000000000000000000)))

(declare-fun lt!542845 () Unit!39610)

(assert (=> b!1194923 (= lt!542845 lt!542847)))

(declare-fun res!795067 () Bool)

(assert (=> b!1194923 (= res!795067 (= (seekEntryOrOpen!0 (select (arr!37312 lt!542828) #b00000000000000000000000000000000) lt!542828 mask!1564) (Found!9930 #b00000000000000000000000000000000)))))

(assert (=> b!1194923 (=> (not res!795067) (not e!679059))))

(assert (= (and d!132307 (not res!795066)) b!1194922))

(assert (= (and b!1194922 c!117332) b!1194923))

(assert (= (and b!1194922 (not c!117332)) b!1194920))

(assert (= (and b!1194923 res!795067) b!1194921))

(assert (= (or b!1194921 b!1194920) bm!57155))

(declare-fun m!1102673 () Bool)

(assert (=> bm!57155 m!1102673))

(declare-fun m!1102675 () Bool)

(assert (=> b!1194922 m!1102675))

(assert (=> b!1194922 m!1102675))

(declare-fun m!1102677 () Bool)

(assert (=> b!1194922 m!1102677))

(assert (=> b!1194923 m!1102675))

(declare-fun m!1102679 () Bool)

(assert (=> b!1194923 m!1102679))

(declare-fun m!1102681 () Bool)

(assert (=> b!1194923 m!1102681))

(assert (=> b!1194923 m!1102675))

(declare-fun m!1102683 () Bool)

(assert (=> b!1194923 m!1102683))

(assert (=> b!1194843 d!132307))

(declare-fun b!1194924 () Bool)

(declare-fun e!679062 () Bool)

(assert (=> b!1194924 (= e!679062 (contains!6863 Nil!26265 (select (arr!37312 lt!542828) #b00000000000000000000000000000000)))))

(declare-fun bm!57156 () Bool)

(declare-fun call!57159 () Bool)

(declare-fun c!117333 () Bool)

(assert (=> bm!57156 (= call!57159 (arrayNoDuplicates!0 lt!542828 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!117333 (Cons!26264 (select (arr!37312 lt!542828) #b00000000000000000000000000000000) Nil!26265) Nil!26265)))))

(declare-fun b!1194925 () Bool)

(declare-fun e!679061 () Bool)

(assert (=> b!1194925 (= e!679061 call!57159)))

(declare-fun b!1194926 () Bool)

(assert (=> b!1194926 (= e!679061 call!57159)))

(declare-fun d!132309 () Bool)

(declare-fun res!795068 () Bool)

(declare-fun e!679063 () Bool)

(assert (=> d!132309 (=> res!795068 e!679063)))

(assert (=> d!132309 (= res!795068 (bvsge #b00000000000000000000000000000000 (size!37848 lt!542828)))))

(assert (=> d!132309 (= (arrayNoDuplicates!0 lt!542828 #b00000000000000000000000000000000 Nil!26265) e!679063)))

(declare-fun b!1194927 () Bool)

(declare-fun e!679060 () Bool)

(assert (=> b!1194927 (= e!679063 e!679060)))

(declare-fun res!795070 () Bool)

(assert (=> b!1194927 (=> (not res!795070) (not e!679060))))

(assert (=> b!1194927 (= res!795070 (not e!679062))))

(declare-fun res!795069 () Bool)

(assert (=> b!1194927 (=> (not res!795069) (not e!679062))))

(assert (=> b!1194927 (= res!795069 (validKeyInArray!0 (select (arr!37312 lt!542828) #b00000000000000000000000000000000)))))

(declare-fun b!1194928 () Bool)

(assert (=> b!1194928 (= e!679060 e!679061)))

(assert (=> b!1194928 (= c!117333 (validKeyInArray!0 (select (arr!37312 lt!542828) #b00000000000000000000000000000000)))))

(assert (= (and d!132309 (not res!795068)) b!1194927))

(assert (= (and b!1194927 res!795069) b!1194924))

(assert (= (and b!1194927 res!795070) b!1194928))

(assert (= (and b!1194928 c!117333) b!1194926))

(assert (= (and b!1194928 (not c!117333)) b!1194925))

(assert (= (or b!1194926 b!1194925) bm!57156))

(assert (=> b!1194924 m!1102675))

(assert (=> b!1194924 m!1102675))

(declare-fun m!1102685 () Bool)

(assert (=> b!1194924 m!1102685))

(assert (=> bm!57156 m!1102675))

(declare-fun m!1102687 () Bool)

(assert (=> bm!57156 m!1102687))

(assert (=> b!1194927 m!1102675))

(assert (=> b!1194927 m!1102675))

(assert (=> b!1194927 m!1102677))

(assert (=> b!1194928 m!1102675))

(assert (=> b!1194928 m!1102675))

(assert (=> b!1194928 m!1102677))

(assert (=> b!1194851 d!132309))

(declare-fun d!132311 () Bool)

(assert (=> d!132311 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1194842 d!132311))

(declare-fun d!132313 () Bool)

(declare-fun res!795075 () Bool)

(declare-fun e!679068 () Bool)

(assert (=> d!132313 (=> res!795075 e!679068)))

(assert (=> d!132313 (= res!795075 (= (select (arr!37312 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!132313 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!679068)))

(declare-fun b!1194933 () Bool)

(declare-fun e!679069 () Bool)

(assert (=> b!1194933 (= e!679068 e!679069)))

(declare-fun res!795076 () Bool)

(assert (=> b!1194933 (=> (not res!795076) (not e!679069))))

(assert (=> b!1194933 (= res!795076 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!37848 _keys!1208)))))

(declare-fun b!1194934 () Bool)

(assert (=> b!1194934 (= e!679069 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!132313 (not res!795075)) b!1194933))

(assert (= (and b!1194933 res!795076) b!1194934))

(assert (=> d!132313 m!1102657))

(declare-fun m!1102689 () Bool)

(assert (=> b!1194934 m!1102689))

(assert (=> b!1194847 d!132313))

(declare-fun d!132315 () Bool)

(assert (=> d!132315 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!542850 () Unit!39610)

(declare-fun choose!13 (array!77329 (_ BitVec 64) (_ BitVec 32)) Unit!39610)

(assert (=> d!132315 (= lt!542850 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!132315 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!132315 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!542850)))

(declare-fun bs!33889 () Bool)

(assert (= bs!33889 d!132315))

(assert (=> bs!33889 m!1102615))

(declare-fun m!1102691 () Bool)

(assert (=> bs!33889 m!1102691))

(assert (=> b!1194847 d!132315))

(declare-fun condMapEmpty!47249 () Bool)

(declare-fun mapDefault!47249 () ValueCell!14427)

(assert (=> mapNonEmpty!47243 (= condMapEmpty!47249 (= mapRest!47243 ((as const (Array (_ BitVec 32) ValueCell!14427)) mapDefault!47249)))))

(declare-fun e!679075 () Bool)

(declare-fun mapRes!47249 () Bool)

(assert (=> mapNonEmpty!47243 (= tp!89853 (and e!679075 mapRes!47249))))

(declare-fun mapIsEmpty!47249 () Bool)

(assert (=> mapIsEmpty!47249 mapRes!47249))

(declare-fun b!1194941 () Bool)

(declare-fun e!679074 () Bool)

(assert (=> b!1194941 (= e!679074 tp_is_empty!30273)))

(declare-fun b!1194942 () Bool)

(assert (=> b!1194942 (= e!679075 tp_is_empty!30273)))

(declare-fun mapNonEmpty!47249 () Bool)

(declare-fun tp!89859 () Bool)

(assert (=> mapNonEmpty!47249 (= mapRes!47249 (and tp!89859 e!679074))))

(declare-fun mapValue!47249 () ValueCell!14427)

(declare-fun mapRest!47249 () (Array (_ BitVec 32) ValueCell!14427))

(declare-fun mapKey!47249 () (_ BitVec 32))

(assert (=> mapNonEmpty!47249 (= mapRest!47243 (store mapRest!47249 mapKey!47249 mapValue!47249))))

(assert (= (and mapNonEmpty!47243 condMapEmpty!47249) mapIsEmpty!47249))

(assert (= (and mapNonEmpty!47243 (not condMapEmpty!47249)) mapNonEmpty!47249))

(assert (= (and mapNonEmpty!47249 ((_ is ValueCellFull!14427) mapValue!47249)) b!1194941))

(assert (= (and mapNonEmpty!47243 ((_ is ValueCellFull!14427) mapDefault!47249)) b!1194942))

(declare-fun m!1102693 () Bool)

(assert (=> mapNonEmpty!47249 m!1102693))

(check-sat (not b!1194907) (not b!1194919) (not b!1194906) (not b!1194923) (not bm!57155) (not b!1194934) (not d!132315) tp_is_empty!30273 (not b!1194927) (not mapNonEmpty!47249) (not b!1194924) (not b!1194918) (not b!1194922) (not b!1194928) (not b!1194903) (not bm!57156) (not bm!57154) (not bm!57151))
(check-sat)
