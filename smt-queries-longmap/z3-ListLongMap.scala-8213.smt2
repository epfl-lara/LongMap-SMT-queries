; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100380 () Bool)

(assert start!100380)

(declare-fun b!1195637 () Bool)

(declare-fun res!795173 () Bool)

(declare-fun e!679594 () Bool)

(assert (=> b!1195637 (=> (not res!795173) (not e!679594))))

(declare-datatypes ((array!77325 0))(
  ( (array!77326 (arr!37306 (Array (_ BitVec 32) (_ BitVec 64))) (size!37843 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77325)

(declare-datatypes ((List!26292 0))(
  ( (Nil!26289) (Cons!26288 (h!27506 (_ BitVec 64)) (t!38955 List!26292)) )
))
(declare-fun arrayNoDuplicates!0 (array!77325 (_ BitVec 32) List!26292) Bool)

(assert (=> b!1195637 (= res!795173 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26289))))

(declare-fun b!1195638 () Bool)

(declare-fun res!795171 () Bool)

(assert (=> b!1195638 (=> (not res!795171) (not e!679594))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77325 (_ BitVec 32)) Bool)

(assert (=> b!1195638 (= res!795171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1195639 () Bool)

(declare-fun e!679595 () Bool)

(assert (=> b!1195639 (= e!679595 (bvsge (size!37843 _keys!1208) #b01111111111111111111111111111111))))

(declare-fun b!1195640 () Bool)

(declare-fun res!795169 () Bool)

(assert (=> b!1195640 (=> (not res!795169) (not e!679595))))

(declare-fun lt!543244 () array!77325)

(assert (=> b!1195640 (= res!795169 (arrayNoDuplicates!0 lt!543244 #b00000000000000000000000000000000 Nil!26289))))

(declare-fun b!1195641 () Bool)

(declare-fun e!679590 () Bool)

(declare-fun tp_is_empty!30253 () Bool)

(assert (=> b!1195641 (= e!679590 tp_is_empty!30253)))

(declare-fun b!1195642 () Bool)

(declare-fun res!795166 () Bool)

(assert (=> b!1195642 (=> (not res!795166) (not e!679594))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1195642 (= res!795166 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!47207 () Bool)

(declare-fun mapRes!47207 () Bool)

(assert (=> mapIsEmpty!47207 mapRes!47207))

(declare-fun b!1195643 () Bool)

(declare-fun res!795172 () Bool)

(assert (=> b!1195643 (=> (not res!795172) (not e!679594))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45465 0))(
  ( (V!45466 (val!15183 Int)) )
))
(declare-datatypes ((ValueCell!14417 0))(
  ( (ValueCellFull!14417 (v!17817 V!45465)) (EmptyCell!14417) )
))
(declare-datatypes ((array!77327 0))(
  ( (array!77328 (arr!37307 (Array (_ BitVec 32) ValueCell!14417)) (size!37844 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77327)

(assert (=> b!1195643 (= res!795172 (and (= (size!37844 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37843 _keys!1208) (size!37844 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1195645 () Bool)

(assert (=> b!1195645 (= e!679594 e!679595)))

(declare-fun res!795170 () Bool)

(assert (=> b!1195645 (=> (not res!795170) (not e!679595))))

(assert (=> b!1195645 (= res!795170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543244 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1195645 (= lt!543244 (array!77326 (store (arr!37306 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37843 _keys!1208)))))

(declare-fun b!1195646 () Bool)

(declare-fun res!795164 () Bool)

(assert (=> b!1195646 (=> (not res!795164) (not e!679594))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1195646 (= res!795164 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!47207 () Bool)

(declare-fun tp!89817 () Bool)

(declare-fun e!679592 () Bool)

(assert (=> mapNonEmpty!47207 (= mapRes!47207 (and tp!89817 e!679592))))

(declare-fun mapValue!47207 () ValueCell!14417)

(declare-fun mapRest!47207 () (Array (_ BitVec 32) ValueCell!14417))

(declare-fun mapKey!47207 () (_ BitVec 32))

(assert (=> mapNonEmpty!47207 (= (arr!37307 _values!996) (store mapRest!47207 mapKey!47207 mapValue!47207))))

(declare-fun b!1195647 () Bool)

(assert (=> b!1195647 (= e!679592 tp_is_empty!30253)))

(declare-fun b!1195648 () Bool)

(declare-fun e!679591 () Bool)

(assert (=> b!1195648 (= e!679591 (and e!679590 mapRes!47207))))

(declare-fun condMapEmpty!47207 () Bool)

(declare-fun mapDefault!47207 () ValueCell!14417)

(assert (=> b!1195648 (= condMapEmpty!47207 (= (arr!37307 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14417)) mapDefault!47207)))))

(declare-fun b!1195649 () Bool)

(declare-fun res!795167 () Bool)

(assert (=> b!1195649 (=> (not res!795167) (not e!679594))))

(assert (=> b!1195649 (= res!795167 (= (select (arr!37306 _keys!1208) i!673) k0!934))))

(declare-fun res!795165 () Bool)

(assert (=> start!100380 (=> (not res!795165) (not e!679594))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100380 (= res!795165 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37843 _keys!1208))))))

(assert (=> start!100380 e!679594))

(declare-fun array_inv!28510 (array!77325) Bool)

(assert (=> start!100380 (array_inv!28510 _keys!1208)))

(assert (=> start!100380 true))

(declare-fun array_inv!28511 (array!77327) Bool)

(assert (=> start!100380 (and (array_inv!28511 _values!996) e!679591)))

(declare-fun b!1195644 () Bool)

(declare-fun res!795168 () Bool)

(assert (=> b!1195644 (=> (not res!795168) (not e!679594))))

(assert (=> b!1195644 (= res!795168 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37843 _keys!1208))))))

(assert (= (and start!100380 res!795165) b!1195642))

(assert (= (and b!1195642 res!795166) b!1195643))

(assert (= (and b!1195643 res!795172) b!1195638))

(assert (= (and b!1195638 res!795171) b!1195637))

(assert (= (and b!1195637 res!795173) b!1195644))

(assert (= (and b!1195644 res!795168) b!1195646))

(assert (= (and b!1195646 res!795164) b!1195649))

(assert (= (and b!1195649 res!795167) b!1195645))

(assert (= (and b!1195645 res!795170) b!1195640))

(assert (= (and b!1195640 res!795169) b!1195639))

(assert (= (and b!1195648 condMapEmpty!47207) mapIsEmpty!47207))

(assert (= (and b!1195648 (not condMapEmpty!47207)) mapNonEmpty!47207))

(get-info :version)

(assert (= (and mapNonEmpty!47207 ((_ is ValueCellFull!14417) mapValue!47207)) b!1195647))

(assert (= (and b!1195648 ((_ is ValueCellFull!14417) mapDefault!47207)) b!1195641))

(assert (= start!100380 b!1195648))

(declare-fun m!1103865 () Bool)

(assert (=> start!100380 m!1103865))

(declare-fun m!1103867 () Bool)

(assert (=> start!100380 m!1103867))

(declare-fun m!1103869 () Bool)

(assert (=> b!1195645 m!1103869))

(declare-fun m!1103871 () Bool)

(assert (=> b!1195645 m!1103871))

(declare-fun m!1103873 () Bool)

(assert (=> b!1195649 m!1103873))

(declare-fun m!1103875 () Bool)

(assert (=> b!1195640 m!1103875))

(declare-fun m!1103877 () Bool)

(assert (=> mapNonEmpty!47207 m!1103877))

(declare-fun m!1103879 () Bool)

(assert (=> b!1195638 m!1103879))

(declare-fun m!1103881 () Bool)

(assert (=> b!1195637 m!1103881))

(declare-fun m!1103883 () Bool)

(assert (=> b!1195642 m!1103883))

(declare-fun m!1103885 () Bool)

(assert (=> b!1195646 m!1103885))

(check-sat (not b!1195645) (not b!1195642) (not mapNonEmpty!47207) (not b!1195640) (not b!1195638) (not start!100380) tp_is_empty!30253 (not b!1195637) (not b!1195646))
(check-sat)
(get-model)

(declare-fun b!1195739 () Bool)

(declare-fun e!679641 () Bool)

(declare-fun e!679643 () Bool)

(assert (=> b!1195739 (= e!679641 e!679643)))

(declare-fun res!795242 () Bool)

(assert (=> b!1195739 (=> (not res!795242) (not e!679643))))

(declare-fun e!679640 () Bool)

(assert (=> b!1195739 (= res!795242 (not e!679640))))

(declare-fun res!795240 () Bool)

(assert (=> b!1195739 (=> (not res!795240) (not e!679640))))

(assert (=> b!1195739 (= res!795240 (validKeyInArray!0 (select (arr!37306 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1195740 () Bool)

(declare-fun e!679642 () Bool)

(declare-fun call!57203 () Bool)

(assert (=> b!1195740 (= e!679642 call!57203)))

(declare-fun b!1195741 () Bool)

(declare-fun contains!6893 (List!26292 (_ BitVec 64)) Bool)

(assert (=> b!1195741 (= e!679640 (contains!6893 Nil!26289 (select (arr!37306 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1195738 () Bool)

(assert (=> b!1195738 (= e!679642 call!57203)))

(declare-fun d!132699 () Bool)

(declare-fun res!795241 () Bool)

(assert (=> d!132699 (=> res!795241 e!679641)))

(assert (=> d!132699 (= res!795241 (bvsge #b00000000000000000000000000000000 (size!37843 _keys!1208)))))

(assert (=> d!132699 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26289) e!679641)))

(declare-fun bm!57200 () Bool)

(declare-fun c!117710 () Bool)

(assert (=> bm!57200 (= call!57203 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!117710 (Cons!26288 (select (arr!37306 _keys!1208) #b00000000000000000000000000000000) Nil!26289) Nil!26289)))))

(declare-fun b!1195742 () Bool)

(assert (=> b!1195742 (= e!679643 e!679642)))

(assert (=> b!1195742 (= c!117710 (validKeyInArray!0 (select (arr!37306 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!132699 (not res!795241)) b!1195739))

(assert (= (and b!1195739 res!795240) b!1195741))

(assert (= (and b!1195739 res!795242) b!1195742))

(assert (= (and b!1195742 c!117710) b!1195740))

(assert (= (and b!1195742 (not c!117710)) b!1195738))

(assert (= (or b!1195740 b!1195738) bm!57200))

(declare-fun m!1103931 () Bool)

(assert (=> b!1195739 m!1103931))

(assert (=> b!1195739 m!1103931))

(declare-fun m!1103933 () Bool)

(assert (=> b!1195739 m!1103933))

(assert (=> b!1195741 m!1103931))

(assert (=> b!1195741 m!1103931))

(declare-fun m!1103935 () Bool)

(assert (=> b!1195741 m!1103935))

(assert (=> bm!57200 m!1103931))

(declare-fun m!1103937 () Bool)

(assert (=> bm!57200 m!1103937))

(assert (=> b!1195742 m!1103931))

(assert (=> b!1195742 m!1103931))

(assert (=> b!1195742 m!1103933))

(assert (=> b!1195637 d!132699))

(declare-fun b!1195751 () Bool)

(declare-fun e!679651 () Bool)

(declare-fun e!679650 () Bool)

(assert (=> b!1195751 (= e!679651 e!679650)))

(declare-fun c!117713 () Bool)

(assert (=> b!1195751 (= c!117713 (validKeyInArray!0 (select (arr!37306 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1195752 () Bool)

(declare-fun call!57206 () Bool)

(assert (=> b!1195752 (= e!679650 call!57206)))

(declare-fun b!1195753 () Bool)

(declare-fun e!679652 () Bool)

(assert (=> b!1195753 (= e!679652 call!57206)))

(declare-fun b!1195754 () Bool)

(assert (=> b!1195754 (= e!679650 e!679652)))

(declare-fun lt!543258 () (_ BitVec 64))

(assert (=> b!1195754 (= lt!543258 (select (arr!37306 _keys!1208) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!39579 0))(
  ( (Unit!39580) )
))
(declare-fun lt!543259 () Unit!39579)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77325 (_ BitVec 64) (_ BitVec 32)) Unit!39579)

(assert (=> b!1195754 (= lt!543259 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!543258 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!77325 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1195754 (arrayContainsKey!0 _keys!1208 lt!543258 #b00000000000000000000000000000000)))

(declare-fun lt!543257 () Unit!39579)

(assert (=> b!1195754 (= lt!543257 lt!543259)))

(declare-fun res!795248 () Bool)

(declare-datatypes ((SeekEntryResult!9884 0))(
  ( (MissingZero!9884 (index!41907 (_ BitVec 32))) (Found!9884 (index!41908 (_ BitVec 32))) (Intermediate!9884 (undefined!10696 Bool) (index!41909 (_ BitVec 32)) (x!105624 (_ BitVec 32))) (Undefined!9884) (MissingVacant!9884 (index!41910 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!77325 (_ BitVec 32)) SeekEntryResult!9884)

(assert (=> b!1195754 (= res!795248 (= (seekEntryOrOpen!0 (select (arr!37306 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9884 #b00000000000000000000000000000000)))))

(assert (=> b!1195754 (=> (not res!795248) (not e!679652))))

(declare-fun d!132701 () Bool)

(declare-fun res!795247 () Bool)

(assert (=> d!132701 (=> res!795247 e!679651)))

(assert (=> d!132701 (= res!795247 (bvsge #b00000000000000000000000000000000 (size!37843 _keys!1208)))))

(assert (=> d!132701 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!679651)))

(declare-fun bm!57203 () Bool)

(assert (=> bm!57203 (= call!57206 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(assert (= (and d!132701 (not res!795247)) b!1195751))

(assert (= (and b!1195751 c!117713) b!1195754))

(assert (= (and b!1195751 (not c!117713)) b!1195752))

(assert (= (and b!1195754 res!795248) b!1195753))

(assert (= (or b!1195753 b!1195752) bm!57203))

(assert (=> b!1195751 m!1103931))

(assert (=> b!1195751 m!1103931))

(assert (=> b!1195751 m!1103933))

(assert (=> b!1195754 m!1103931))

(declare-fun m!1103939 () Bool)

(assert (=> b!1195754 m!1103939))

(declare-fun m!1103941 () Bool)

(assert (=> b!1195754 m!1103941))

(assert (=> b!1195754 m!1103931))

(declare-fun m!1103943 () Bool)

(assert (=> b!1195754 m!1103943))

(declare-fun m!1103945 () Bool)

(assert (=> bm!57203 m!1103945))

(assert (=> b!1195638 d!132701))

(declare-fun d!132703 () Bool)

(assert (=> d!132703 (= (array_inv!28510 _keys!1208) (bvsge (size!37843 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!100380 d!132703))

(declare-fun d!132705 () Bool)

(assert (=> d!132705 (= (array_inv!28511 _values!996) (bvsge (size!37844 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!100380 d!132705))

(declare-fun b!1195756 () Bool)

(declare-fun e!679654 () Bool)

(declare-fun e!679656 () Bool)

(assert (=> b!1195756 (= e!679654 e!679656)))

(declare-fun res!795251 () Bool)

(assert (=> b!1195756 (=> (not res!795251) (not e!679656))))

(declare-fun e!679653 () Bool)

(assert (=> b!1195756 (= res!795251 (not e!679653))))

(declare-fun res!795249 () Bool)

(assert (=> b!1195756 (=> (not res!795249) (not e!679653))))

(assert (=> b!1195756 (= res!795249 (validKeyInArray!0 (select (arr!37306 lt!543244) #b00000000000000000000000000000000)))))

(declare-fun b!1195757 () Bool)

(declare-fun e!679655 () Bool)

(declare-fun call!57207 () Bool)

(assert (=> b!1195757 (= e!679655 call!57207)))

(declare-fun b!1195758 () Bool)

(assert (=> b!1195758 (= e!679653 (contains!6893 Nil!26289 (select (arr!37306 lt!543244) #b00000000000000000000000000000000)))))

(declare-fun b!1195755 () Bool)

(assert (=> b!1195755 (= e!679655 call!57207)))

(declare-fun d!132707 () Bool)

(declare-fun res!795250 () Bool)

(assert (=> d!132707 (=> res!795250 e!679654)))

(assert (=> d!132707 (= res!795250 (bvsge #b00000000000000000000000000000000 (size!37843 lt!543244)))))

(assert (=> d!132707 (= (arrayNoDuplicates!0 lt!543244 #b00000000000000000000000000000000 Nil!26289) e!679654)))

(declare-fun bm!57204 () Bool)

(declare-fun c!117714 () Bool)

(assert (=> bm!57204 (= call!57207 (arrayNoDuplicates!0 lt!543244 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!117714 (Cons!26288 (select (arr!37306 lt!543244) #b00000000000000000000000000000000) Nil!26289) Nil!26289)))))

(declare-fun b!1195759 () Bool)

(assert (=> b!1195759 (= e!679656 e!679655)))

(assert (=> b!1195759 (= c!117714 (validKeyInArray!0 (select (arr!37306 lt!543244) #b00000000000000000000000000000000)))))

(assert (= (and d!132707 (not res!795250)) b!1195756))

(assert (= (and b!1195756 res!795249) b!1195758))

(assert (= (and b!1195756 res!795251) b!1195759))

(assert (= (and b!1195759 c!117714) b!1195757))

(assert (= (and b!1195759 (not c!117714)) b!1195755))

(assert (= (or b!1195757 b!1195755) bm!57204))

(declare-fun m!1103947 () Bool)

(assert (=> b!1195756 m!1103947))

(assert (=> b!1195756 m!1103947))

(declare-fun m!1103949 () Bool)

(assert (=> b!1195756 m!1103949))

(assert (=> b!1195758 m!1103947))

(assert (=> b!1195758 m!1103947))

(declare-fun m!1103951 () Bool)

(assert (=> b!1195758 m!1103951))

(assert (=> bm!57204 m!1103947))

(declare-fun m!1103953 () Bool)

(assert (=> bm!57204 m!1103953))

(assert (=> b!1195759 m!1103947))

(assert (=> b!1195759 m!1103947))

(assert (=> b!1195759 m!1103949))

(assert (=> b!1195640 d!132707))

(declare-fun b!1195760 () Bool)

(declare-fun e!679658 () Bool)

(declare-fun e!679657 () Bool)

(assert (=> b!1195760 (= e!679658 e!679657)))

(declare-fun c!117715 () Bool)

(assert (=> b!1195760 (= c!117715 (validKeyInArray!0 (select (arr!37306 lt!543244) #b00000000000000000000000000000000)))))

(declare-fun b!1195761 () Bool)

(declare-fun call!57208 () Bool)

(assert (=> b!1195761 (= e!679657 call!57208)))

(declare-fun b!1195762 () Bool)

(declare-fun e!679659 () Bool)

(assert (=> b!1195762 (= e!679659 call!57208)))

(declare-fun b!1195763 () Bool)

(assert (=> b!1195763 (= e!679657 e!679659)))

(declare-fun lt!543261 () (_ BitVec 64))

(assert (=> b!1195763 (= lt!543261 (select (arr!37306 lt!543244) #b00000000000000000000000000000000))))

(declare-fun lt!543262 () Unit!39579)

(assert (=> b!1195763 (= lt!543262 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!543244 lt!543261 #b00000000000000000000000000000000))))

(assert (=> b!1195763 (arrayContainsKey!0 lt!543244 lt!543261 #b00000000000000000000000000000000)))

(declare-fun lt!543260 () Unit!39579)

(assert (=> b!1195763 (= lt!543260 lt!543262)))

(declare-fun res!795253 () Bool)

(assert (=> b!1195763 (= res!795253 (= (seekEntryOrOpen!0 (select (arr!37306 lt!543244) #b00000000000000000000000000000000) lt!543244 mask!1564) (Found!9884 #b00000000000000000000000000000000)))))

(assert (=> b!1195763 (=> (not res!795253) (not e!679659))))

(declare-fun d!132709 () Bool)

(declare-fun res!795252 () Bool)

(assert (=> d!132709 (=> res!795252 e!679658)))

(assert (=> d!132709 (= res!795252 (bvsge #b00000000000000000000000000000000 (size!37843 lt!543244)))))

(assert (=> d!132709 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543244 mask!1564) e!679658)))

(declare-fun bm!57205 () Bool)

(assert (=> bm!57205 (= call!57208 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!543244 mask!1564))))

(assert (= (and d!132709 (not res!795252)) b!1195760))

(assert (= (and b!1195760 c!117715) b!1195763))

(assert (= (and b!1195760 (not c!117715)) b!1195761))

(assert (= (and b!1195763 res!795253) b!1195762))

(assert (= (or b!1195762 b!1195761) bm!57205))

(assert (=> b!1195760 m!1103947))

(assert (=> b!1195760 m!1103947))

(assert (=> b!1195760 m!1103949))

(assert (=> b!1195763 m!1103947))

(declare-fun m!1103955 () Bool)

(assert (=> b!1195763 m!1103955))

(declare-fun m!1103957 () Bool)

(assert (=> b!1195763 m!1103957))

(assert (=> b!1195763 m!1103947))

(declare-fun m!1103959 () Bool)

(assert (=> b!1195763 m!1103959))

(declare-fun m!1103961 () Bool)

(assert (=> bm!57205 m!1103961))

(assert (=> b!1195645 d!132709))

(declare-fun d!132711 () Bool)

(assert (=> d!132711 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1195642 d!132711))

(declare-fun d!132713 () Bool)

(assert (=> d!132713 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1195646 d!132713))

(declare-fun mapIsEmpty!47216 () Bool)

(declare-fun mapRes!47216 () Bool)

(assert (=> mapIsEmpty!47216 mapRes!47216))

(declare-fun condMapEmpty!47216 () Bool)

(declare-fun mapDefault!47216 () ValueCell!14417)

(assert (=> mapNonEmpty!47207 (= condMapEmpty!47216 (= mapRest!47207 ((as const (Array (_ BitVec 32) ValueCell!14417)) mapDefault!47216)))))

(declare-fun e!679665 () Bool)

(assert (=> mapNonEmpty!47207 (= tp!89817 (and e!679665 mapRes!47216))))

(declare-fun mapNonEmpty!47216 () Bool)

(declare-fun tp!89826 () Bool)

(declare-fun e!679664 () Bool)

(assert (=> mapNonEmpty!47216 (= mapRes!47216 (and tp!89826 e!679664))))

(declare-fun mapRest!47216 () (Array (_ BitVec 32) ValueCell!14417))

(declare-fun mapValue!47216 () ValueCell!14417)

(declare-fun mapKey!47216 () (_ BitVec 32))

(assert (=> mapNonEmpty!47216 (= mapRest!47207 (store mapRest!47216 mapKey!47216 mapValue!47216))))

(declare-fun b!1195770 () Bool)

(assert (=> b!1195770 (= e!679664 tp_is_empty!30253)))

(declare-fun b!1195771 () Bool)

(assert (=> b!1195771 (= e!679665 tp_is_empty!30253)))

(assert (= (and mapNonEmpty!47207 condMapEmpty!47216) mapIsEmpty!47216))

(assert (= (and mapNonEmpty!47207 (not condMapEmpty!47216)) mapNonEmpty!47216))

(assert (= (and mapNonEmpty!47216 ((_ is ValueCellFull!14417) mapValue!47216)) b!1195770))

(assert (= (and mapNonEmpty!47207 ((_ is ValueCellFull!14417) mapDefault!47216)) b!1195771))

(declare-fun m!1103963 () Bool)

(assert (=> mapNonEmpty!47216 m!1103963))

(check-sat (not b!1195739) (not b!1195741) (not b!1195759) (not b!1195742) (not bm!57204) (not bm!57205) (not b!1195754) (not b!1195751) (not b!1195760) tp_is_empty!30253 (not b!1195763) (not b!1195756) (not b!1195758) (not mapNonEmpty!47216) (not bm!57200) (not bm!57203))
(check-sat)
