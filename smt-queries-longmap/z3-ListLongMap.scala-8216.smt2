; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100182 () Bool)

(assert start!100182)

(declare-fun b!1194678 () Bool)

(declare-fun res!794918 () Bool)

(declare-fun e!678919 () Bool)

(assert (=> b!1194678 (=> (not res!794918) (not e!678919))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1194678 (= res!794918 (validMask!0 mask!1564))))

(declare-fun b!1194679 () Bool)

(declare-fun res!794920 () Bool)

(assert (=> b!1194679 (=> (not res!794920) (not e!678919))))

(declare-datatypes ((array!77256 0))(
  ( (array!77257 (arr!37276 (Array (_ BitVec 32) (_ BitVec 64))) (size!37814 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77256)

(declare-datatypes ((List!26342 0))(
  ( (Nil!26339) (Cons!26338 (h!27547 (_ BitVec 64)) (t!39004 List!26342)) )
))
(declare-fun arrayNoDuplicates!0 (array!77256 (_ BitVec 32) List!26342) Bool)

(assert (=> b!1194679 (= res!794920 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26339))))

(declare-fun res!794924 () Bool)

(assert (=> start!100182 (=> (not res!794924) (not e!678919))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100182 (= res!794924 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37814 _keys!1208))))))

(assert (=> start!100182 e!678919))

(declare-fun array_inv!28536 (array!77256) Bool)

(assert (=> start!100182 (array_inv!28536 _keys!1208)))

(assert (=> start!100182 true))

(declare-datatypes ((V!45489 0))(
  ( (V!45490 (val!15192 Int)) )
))
(declare-datatypes ((ValueCell!14426 0))(
  ( (ValueCellFull!14426 (v!17829 V!45489)) (EmptyCell!14426) )
))
(declare-datatypes ((array!77258 0))(
  ( (array!77259 (arr!37277 (Array (_ BitVec 32) ValueCell!14426)) (size!37815 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77258)

(declare-fun e!678916 () Bool)

(declare-fun array_inv!28537 (array!77258) Bool)

(assert (=> start!100182 (and (array_inv!28537 _values!996) e!678916)))

(declare-fun mapIsEmpty!47240 () Bool)

(declare-fun mapRes!47240 () Bool)

(assert (=> mapIsEmpty!47240 mapRes!47240))

(declare-fun b!1194680 () Bool)

(declare-fun res!794922 () Bool)

(assert (=> b!1194680 (=> (not res!794922) (not e!678919))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1194680 (= res!794922 (validKeyInArray!0 k0!934))))

(declare-fun b!1194681 () Bool)

(declare-fun res!794917 () Bool)

(assert (=> b!1194681 (=> (not res!794917) (not e!678919))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1194681 (= res!794917 (= (select (arr!37276 _keys!1208) i!673) k0!934))))

(declare-fun b!1194682 () Bool)

(declare-fun res!794916 () Bool)

(assert (=> b!1194682 (=> (not res!794916) (not e!678919))))

(assert (=> b!1194682 (= res!794916 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37814 _keys!1208))))))

(declare-fun b!1194683 () Bool)

(declare-fun res!794915 () Bool)

(assert (=> b!1194683 (=> (not res!794915) (not e!678919))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1194683 (= res!794915 (and (= (size!37815 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37814 _keys!1208) (size!37815 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1194684 () Bool)

(declare-fun e!678918 () Bool)

(declare-fun tp_is_empty!30271 () Bool)

(assert (=> b!1194684 (= e!678918 tp_is_empty!30271)))

(declare-fun b!1194685 () Bool)

(declare-fun res!794921 () Bool)

(declare-fun e!678921 () Bool)

(assert (=> b!1194685 (=> (not res!794921) (not e!678921))))

(declare-fun lt!542630 () array!77256)

(assert (=> b!1194685 (= res!794921 (arrayNoDuplicates!0 lt!542630 #b00000000000000000000000000000000 Nil!26339))))

(declare-fun b!1194686 () Bool)

(assert (=> b!1194686 (= e!678921 (not (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!37814 _keys!1208)) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000))))))

(declare-fun arrayContainsKey!0 (array!77256 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1194686 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39483 0))(
  ( (Unit!39484) )
))
(declare-fun lt!542631 () Unit!39483)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77256 (_ BitVec 64) (_ BitVec 32)) Unit!39483)

(assert (=> b!1194686 (= lt!542631 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1194687 () Bool)

(declare-fun res!794923 () Bool)

(assert (=> b!1194687 (=> (not res!794923) (not e!678919))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77256 (_ BitVec 32)) Bool)

(assert (=> b!1194687 (= res!794923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!47240 () Bool)

(declare-fun tp!89850 () Bool)

(declare-fun e!678917 () Bool)

(assert (=> mapNonEmpty!47240 (= mapRes!47240 (and tp!89850 e!678917))))

(declare-fun mapValue!47240 () ValueCell!14426)

(declare-fun mapKey!47240 () (_ BitVec 32))

(declare-fun mapRest!47240 () (Array (_ BitVec 32) ValueCell!14426))

(assert (=> mapNonEmpty!47240 (= (arr!37277 _values!996) (store mapRest!47240 mapKey!47240 mapValue!47240))))

(declare-fun b!1194688 () Bool)

(assert (=> b!1194688 (= e!678916 (and e!678918 mapRes!47240))))

(declare-fun condMapEmpty!47240 () Bool)

(declare-fun mapDefault!47240 () ValueCell!14426)

(assert (=> b!1194688 (= condMapEmpty!47240 (= (arr!37277 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14426)) mapDefault!47240)))))

(declare-fun b!1194689 () Bool)

(assert (=> b!1194689 (= e!678919 e!678921)))

(declare-fun res!794919 () Bool)

(assert (=> b!1194689 (=> (not res!794919) (not e!678921))))

(assert (=> b!1194689 (= res!794919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542630 mask!1564))))

(assert (=> b!1194689 (= lt!542630 (array!77257 (store (arr!37276 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37814 _keys!1208)))))

(declare-fun b!1194690 () Bool)

(assert (=> b!1194690 (= e!678917 tp_is_empty!30271)))

(assert (= (and start!100182 res!794924) b!1194678))

(assert (= (and b!1194678 res!794918) b!1194683))

(assert (= (and b!1194683 res!794915) b!1194687))

(assert (= (and b!1194687 res!794923) b!1194679))

(assert (= (and b!1194679 res!794920) b!1194682))

(assert (= (and b!1194682 res!794916) b!1194680))

(assert (= (and b!1194680 res!794922) b!1194681))

(assert (= (and b!1194681 res!794917) b!1194689))

(assert (= (and b!1194689 res!794919) b!1194685))

(assert (= (and b!1194685 res!794921) b!1194686))

(assert (= (and b!1194688 condMapEmpty!47240) mapIsEmpty!47240))

(assert (= (and b!1194688 (not condMapEmpty!47240)) mapNonEmpty!47240))

(get-info :version)

(assert (= (and mapNonEmpty!47240 ((_ is ValueCellFull!14426) mapValue!47240)) b!1194690))

(assert (= (and b!1194688 ((_ is ValueCellFull!14426) mapDefault!47240)) b!1194684))

(assert (= start!100182 b!1194688))

(declare-fun m!1101969 () Bool)

(assert (=> b!1194686 m!1101969))

(declare-fun m!1101971 () Bool)

(assert (=> b!1194686 m!1101971))

(declare-fun m!1101973 () Bool)

(assert (=> b!1194681 m!1101973))

(declare-fun m!1101975 () Bool)

(assert (=> start!100182 m!1101975))

(declare-fun m!1101977 () Bool)

(assert (=> start!100182 m!1101977))

(declare-fun m!1101979 () Bool)

(assert (=> b!1194685 m!1101979))

(declare-fun m!1101981 () Bool)

(assert (=> b!1194679 m!1101981))

(declare-fun m!1101983 () Bool)

(assert (=> b!1194687 m!1101983))

(declare-fun m!1101985 () Bool)

(assert (=> mapNonEmpty!47240 m!1101985))

(declare-fun m!1101987 () Bool)

(assert (=> b!1194678 m!1101987))

(declare-fun m!1101989 () Bool)

(assert (=> b!1194680 m!1101989))

(declare-fun m!1101991 () Bool)

(assert (=> b!1194689 m!1101991))

(declare-fun m!1101993 () Bool)

(assert (=> b!1194689 m!1101993))

(check-sat (not b!1194686) (not mapNonEmpty!47240) (not b!1194680) (not b!1194678) (not start!100182) (not b!1194685) tp_is_empty!30271 (not b!1194687) (not b!1194679) (not b!1194689))
(check-sat)
(get-model)

(declare-fun bm!57128 () Bool)

(declare-fun call!57131 () Bool)

(assert (=> bm!57128 (= call!57131 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!542630 mask!1564))))

(declare-fun b!1194777 () Bool)

(declare-fun e!678966 () Bool)

(assert (=> b!1194777 (= e!678966 call!57131)))

(declare-fun b!1194778 () Bool)

(declare-fun e!678964 () Bool)

(assert (=> b!1194778 (= e!678964 call!57131)))

(declare-fun b!1194779 () Bool)

(declare-fun e!678965 () Bool)

(assert (=> b!1194779 (= e!678965 e!678964)))

(declare-fun c!117302 () Bool)

(assert (=> b!1194779 (= c!117302 (validKeyInArray!0 (select (arr!37276 lt!542630) #b00000000000000000000000000000000)))))

(declare-fun d!132145 () Bool)

(declare-fun res!794989 () Bool)

(assert (=> d!132145 (=> res!794989 e!678965)))

(assert (=> d!132145 (= res!794989 (bvsge #b00000000000000000000000000000000 (size!37814 lt!542630)))))

(assert (=> d!132145 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542630 mask!1564) e!678965)))

(declare-fun b!1194780 () Bool)

(assert (=> b!1194780 (= e!678964 e!678966)))

(declare-fun lt!542652 () (_ BitVec 64))

(assert (=> b!1194780 (= lt!542652 (select (arr!37276 lt!542630) #b00000000000000000000000000000000))))

(declare-fun lt!542651 () Unit!39483)

(assert (=> b!1194780 (= lt!542651 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!542630 lt!542652 #b00000000000000000000000000000000))))

(assert (=> b!1194780 (arrayContainsKey!0 lt!542630 lt!542652 #b00000000000000000000000000000000)))

(declare-fun lt!542650 () Unit!39483)

(assert (=> b!1194780 (= lt!542650 lt!542651)))

(declare-fun res!794990 () Bool)

(declare-datatypes ((SeekEntryResult!9929 0))(
  ( (MissingZero!9929 (index!42087 (_ BitVec 32))) (Found!9929 (index!42088 (_ BitVec 32))) (Intermediate!9929 (undefined!10741 Bool) (index!42089 (_ BitVec 32)) (x!105672 (_ BitVec 32))) (Undefined!9929) (MissingVacant!9929 (index!42090 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!77256 (_ BitVec 32)) SeekEntryResult!9929)

(assert (=> b!1194780 (= res!794990 (= (seekEntryOrOpen!0 (select (arr!37276 lt!542630) #b00000000000000000000000000000000) lt!542630 mask!1564) (Found!9929 #b00000000000000000000000000000000)))))

(assert (=> b!1194780 (=> (not res!794990) (not e!678966))))

(assert (= (and d!132145 (not res!794989)) b!1194779))

(assert (= (and b!1194779 c!117302) b!1194780))

(assert (= (and b!1194779 (not c!117302)) b!1194778))

(assert (= (and b!1194780 res!794990) b!1194777))

(assert (= (or b!1194777 b!1194778) bm!57128))

(declare-fun m!1102047 () Bool)

(assert (=> bm!57128 m!1102047))

(declare-fun m!1102049 () Bool)

(assert (=> b!1194779 m!1102049))

(assert (=> b!1194779 m!1102049))

(declare-fun m!1102051 () Bool)

(assert (=> b!1194779 m!1102051))

(assert (=> b!1194780 m!1102049))

(declare-fun m!1102053 () Bool)

(assert (=> b!1194780 m!1102053))

(declare-fun m!1102055 () Bool)

(assert (=> b!1194780 m!1102055))

(assert (=> b!1194780 m!1102049))

(declare-fun m!1102057 () Bool)

(assert (=> b!1194780 m!1102057))

(assert (=> b!1194689 d!132145))

(declare-fun d!132147 () Bool)

(declare-fun res!794997 () Bool)

(declare-fun e!678977 () Bool)

(assert (=> d!132147 (=> res!794997 e!678977)))

(assert (=> d!132147 (= res!794997 (bvsge #b00000000000000000000000000000000 (size!37814 _keys!1208)))))

(assert (=> d!132147 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26339) e!678977)))

(declare-fun b!1194791 () Bool)

(declare-fun e!678975 () Bool)

(declare-fun call!57134 () Bool)

(assert (=> b!1194791 (= e!678975 call!57134)))

(declare-fun b!1194792 () Bool)

(declare-fun e!678978 () Bool)

(declare-fun contains!6843 (List!26342 (_ BitVec 64)) Bool)

(assert (=> b!1194792 (= e!678978 (contains!6843 Nil!26339 (select (arr!37276 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1194793 () Bool)

(declare-fun e!678976 () Bool)

(assert (=> b!1194793 (= e!678977 e!678976)))

(declare-fun res!794999 () Bool)

(assert (=> b!1194793 (=> (not res!794999) (not e!678976))))

(assert (=> b!1194793 (= res!794999 (not e!678978))))

(declare-fun res!794998 () Bool)

(assert (=> b!1194793 (=> (not res!794998) (not e!678978))))

(assert (=> b!1194793 (= res!794998 (validKeyInArray!0 (select (arr!37276 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1194794 () Bool)

(assert (=> b!1194794 (= e!678976 e!678975)))

(declare-fun c!117305 () Bool)

(assert (=> b!1194794 (= c!117305 (validKeyInArray!0 (select (arr!37276 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1194795 () Bool)

(assert (=> b!1194795 (= e!678975 call!57134)))

(declare-fun bm!57131 () Bool)

(assert (=> bm!57131 (= call!57134 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!117305 (Cons!26338 (select (arr!37276 _keys!1208) #b00000000000000000000000000000000) Nil!26339) Nil!26339)))))

(assert (= (and d!132147 (not res!794997)) b!1194793))

(assert (= (and b!1194793 res!794998) b!1194792))

(assert (= (and b!1194793 res!794999) b!1194794))

(assert (= (and b!1194794 c!117305) b!1194791))

(assert (= (and b!1194794 (not c!117305)) b!1194795))

(assert (= (or b!1194791 b!1194795) bm!57131))

(declare-fun m!1102059 () Bool)

(assert (=> b!1194792 m!1102059))

(assert (=> b!1194792 m!1102059))

(declare-fun m!1102061 () Bool)

(assert (=> b!1194792 m!1102061))

(assert (=> b!1194793 m!1102059))

(assert (=> b!1194793 m!1102059))

(declare-fun m!1102063 () Bool)

(assert (=> b!1194793 m!1102063))

(assert (=> b!1194794 m!1102059))

(assert (=> b!1194794 m!1102059))

(assert (=> b!1194794 m!1102063))

(assert (=> bm!57131 m!1102059))

(declare-fun m!1102065 () Bool)

(assert (=> bm!57131 m!1102065))

(assert (=> b!1194679 d!132147))

(declare-fun d!132149 () Bool)

(assert (=> d!132149 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1194678 d!132149))

(declare-fun bm!57132 () Bool)

(declare-fun call!57135 () Bool)

(assert (=> bm!57132 (= call!57135 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1194796 () Bool)

(declare-fun e!678981 () Bool)

(assert (=> b!1194796 (= e!678981 call!57135)))

(declare-fun b!1194797 () Bool)

(declare-fun e!678979 () Bool)

(assert (=> b!1194797 (= e!678979 call!57135)))

(declare-fun b!1194798 () Bool)

(declare-fun e!678980 () Bool)

(assert (=> b!1194798 (= e!678980 e!678979)))

(declare-fun c!117306 () Bool)

(assert (=> b!1194798 (= c!117306 (validKeyInArray!0 (select (arr!37276 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!132151 () Bool)

(declare-fun res!795000 () Bool)

(assert (=> d!132151 (=> res!795000 e!678980)))

(assert (=> d!132151 (= res!795000 (bvsge #b00000000000000000000000000000000 (size!37814 _keys!1208)))))

(assert (=> d!132151 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!678980)))

(declare-fun b!1194799 () Bool)

(assert (=> b!1194799 (= e!678979 e!678981)))

(declare-fun lt!542655 () (_ BitVec 64))

(assert (=> b!1194799 (= lt!542655 (select (arr!37276 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!542654 () Unit!39483)

(assert (=> b!1194799 (= lt!542654 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!542655 #b00000000000000000000000000000000))))

(assert (=> b!1194799 (arrayContainsKey!0 _keys!1208 lt!542655 #b00000000000000000000000000000000)))

(declare-fun lt!542653 () Unit!39483)

(assert (=> b!1194799 (= lt!542653 lt!542654)))

(declare-fun res!795001 () Bool)

(assert (=> b!1194799 (= res!795001 (= (seekEntryOrOpen!0 (select (arr!37276 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9929 #b00000000000000000000000000000000)))))

(assert (=> b!1194799 (=> (not res!795001) (not e!678981))))

(assert (= (and d!132151 (not res!795000)) b!1194798))

(assert (= (and b!1194798 c!117306) b!1194799))

(assert (= (and b!1194798 (not c!117306)) b!1194797))

(assert (= (and b!1194799 res!795001) b!1194796))

(assert (= (or b!1194796 b!1194797) bm!57132))

(declare-fun m!1102067 () Bool)

(assert (=> bm!57132 m!1102067))

(assert (=> b!1194798 m!1102059))

(assert (=> b!1194798 m!1102059))

(assert (=> b!1194798 m!1102063))

(assert (=> b!1194799 m!1102059))

(declare-fun m!1102069 () Bool)

(assert (=> b!1194799 m!1102069))

(declare-fun m!1102071 () Bool)

(assert (=> b!1194799 m!1102071))

(assert (=> b!1194799 m!1102059))

(declare-fun m!1102073 () Bool)

(assert (=> b!1194799 m!1102073))

(assert (=> b!1194687 d!132151))

(declare-fun d!132153 () Bool)

(assert (=> d!132153 (= (array_inv!28536 _keys!1208) (bvsge (size!37814 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!100182 d!132153))

(declare-fun d!132155 () Bool)

(assert (=> d!132155 (= (array_inv!28537 _values!996) (bvsge (size!37815 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!100182 d!132155))

(declare-fun d!132157 () Bool)

(declare-fun res!795006 () Bool)

(declare-fun e!678986 () Bool)

(assert (=> d!132157 (=> res!795006 e!678986)))

(assert (=> d!132157 (= res!795006 (= (select (arr!37276 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!132157 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!678986)))

(declare-fun b!1194804 () Bool)

(declare-fun e!678987 () Bool)

(assert (=> b!1194804 (= e!678986 e!678987)))

(declare-fun res!795007 () Bool)

(assert (=> b!1194804 (=> (not res!795007) (not e!678987))))

(assert (=> b!1194804 (= res!795007 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!37814 _keys!1208)))))

(declare-fun b!1194805 () Bool)

(assert (=> b!1194805 (= e!678987 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!132157 (not res!795006)) b!1194804))

(assert (= (and b!1194804 res!795007) b!1194805))

(assert (=> d!132157 m!1102059))

(declare-fun m!1102075 () Bool)

(assert (=> b!1194805 m!1102075))

(assert (=> b!1194686 d!132157))

(declare-fun d!132159 () Bool)

(assert (=> d!132159 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!542658 () Unit!39483)

(declare-fun choose!13 (array!77256 (_ BitVec 64) (_ BitVec 32)) Unit!39483)

(assert (=> d!132159 (= lt!542658 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!132159 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!132159 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!542658)))

(declare-fun bs!33860 () Bool)

(assert (= bs!33860 d!132159))

(assert (=> bs!33860 m!1101969))

(declare-fun m!1102077 () Bool)

(assert (=> bs!33860 m!1102077))

(assert (=> b!1194686 d!132159))

(declare-fun d!132161 () Bool)

(declare-fun res!795008 () Bool)

(declare-fun e!678990 () Bool)

(assert (=> d!132161 (=> res!795008 e!678990)))

(assert (=> d!132161 (= res!795008 (bvsge #b00000000000000000000000000000000 (size!37814 lt!542630)))))

(assert (=> d!132161 (= (arrayNoDuplicates!0 lt!542630 #b00000000000000000000000000000000 Nil!26339) e!678990)))

(declare-fun b!1194806 () Bool)

(declare-fun e!678988 () Bool)

(declare-fun call!57136 () Bool)

(assert (=> b!1194806 (= e!678988 call!57136)))

(declare-fun b!1194807 () Bool)

(declare-fun e!678991 () Bool)

(assert (=> b!1194807 (= e!678991 (contains!6843 Nil!26339 (select (arr!37276 lt!542630) #b00000000000000000000000000000000)))))

(declare-fun b!1194808 () Bool)

(declare-fun e!678989 () Bool)

(assert (=> b!1194808 (= e!678990 e!678989)))

(declare-fun res!795010 () Bool)

(assert (=> b!1194808 (=> (not res!795010) (not e!678989))))

(assert (=> b!1194808 (= res!795010 (not e!678991))))

(declare-fun res!795009 () Bool)

(assert (=> b!1194808 (=> (not res!795009) (not e!678991))))

(assert (=> b!1194808 (= res!795009 (validKeyInArray!0 (select (arr!37276 lt!542630) #b00000000000000000000000000000000)))))

(declare-fun b!1194809 () Bool)

(assert (=> b!1194809 (= e!678989 e!678988)))

(declare-fun c!117307 () Bool)

(assert (=> b!1194809 (= c!117307 (validKeyInArray!0 (select (arr!37276 lt!542630) #b00000000000000000000000000000000)))))

(declare-fun b!1194810 () Bool)

(assert (=> b!1194810 (= e!678988 call!57136)))

(declare-fun bm!57133 () Bool)

(assert (=> bm!57133 (= call!57136 (arrayNoDuplicates!0 lt!542630 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!117307 (Cons!26338 (select (arr!37276 lt!542630) #b00000000000000000000000000000000) Nil!26339) Nil!26339)))))

(assert (= (and d!132161 (not res!795008)) b!1194808))

(assert (= (and b!1194808 res!795009) b!1194807))

(assert (= (and b!1194808 res!795010) b!1194809))

(assert (= (and b!1194809 c!117307) b!1194806))

(assert (= (and b!1194809 (not c!117307)) b!1194810))

(assert (= (or b!1194806 b!1194810) bm!57133))

(assert (=> b!1194807 m!1102049))

(assert (=> b!1194807 m!1102049))

(declare-fun m!1102079 () Bool)

(assert (=> b!1194807 m!1102079))

(assert (=> b!1194808 m!1102049))

(assert (=> b!1194808 m!1102049))

(assert (=> b!1194808 m!1102051))

(assert (=> b!1194809 m!1102049))

(assert (=> b!1194809 m!1102049))

(assert (=> b!1194809 m!1102051))

(assert (=> bm!57133 m!1102049))

(declare-fun m!1102081 () Bool)

(assert (=> bm!57133 m!1102081))

(assert (=> b!1194685 d!132161))

(declare-fun d!132163 () Bool)

(assert (=> d!132163 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1194680 d!132163))

(declare-fun condMapEmpty!47249 () Bool)

(declare-fun mapDefault!47249 () ValueCell!14426)

(assert (=> mapNonEmpty!47240 (= condMapEmpty!47249 (= mapRest!47240 ((as const (Array (_ BitVec 32) ValueCell!14426)) mapDefault!47249)))))

(declare-fun e!678996 () Bool)

(declare-fun mapRes!47249 () Bool)

(assert (=> mapNonEmpty!47240 (= tp!89850 (and e!678996 mapRes!47249))))

(declare-fun mapNonEmpty!47249 () Bool)

(declare-fun tp!89859 () Bool)

(declare-fun e!678997 () Bool)

(assert (=> mapNonEmpty!47249 (= mapRes!47249 (and tp!89859 e!678997))))

(declare-fun mapValue!47249 () ValueCell!14426)

(declare-fun mapRest!47249 () (Array (_ BitVec 32) ValueCell!14426))

(declare-fun mapKey!47249 () (_ BitVec 32))

(assert (=> mapNonEmpty!47249 (= mapRest!47240 (store mapRest!47249 mapKey!47249 mapValue!47249))))

(declare-fun b!1194817 () Bool)

(assert (=> b!1194817 (= e!678997 tp_is_empty!30271)))

(declare-fun b!1194818 () Bool)

(assert (=> b!1194818 (= e!678996 tp_is_empty!30271)))

(declare-fun mapIsEmpty!47249 () Bool)

(assert (=> mapIsEmpty!47249 mapRes!47249))

(assert (= (and mapNonEmpty!47240 condMapEmpty!47249) mapIsEmpty!47249))

(assert (= (and mapNonEmpty!47240 (not condMapEmpty!47249)) mapNonEmpty!47249))

(assert (= (and mapNonEmpty!47249 ((_ is ValueCellFull!14426) mapValue!47249)) b!1194817))

(assert (= (and mapNonEmpty!47240 ((_ is ValueCellFull!14426) mapDefault!47249)) b!1194818))

(declare-fun m!1102083 () Bool)

(assert (=> mapNonEmpty!47249 m!1102083))

(check-sat (not bm!57133) (not b!1194799) (not b!1194792) (not b!1194779) (not b!1194808) (not bm!57128) (not mapNonEmpty!47249) (not b!1194798) tp_is_empty!30271 (not b!1194793) (not bm!57132) (not b!1194807) (not b!1194809) (not b!1194794) (not d!132159) (not b!1194780) (not b!1194805) (not bm!57131))
(check-sat)
