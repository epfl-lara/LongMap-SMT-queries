; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100164 () Bool)

(assert start!100164)

(declare-fun b!1194553 () Bool)

(declare-fun res!794808 () Bool)

(declare-fun e!678867 () Bool)

(assert (=> b!1194553 (=> (not res!794808) (not e!678867))))

(declare-datatypes ((array!77301 0))(
  ( (array!77302 (arr!37299 (Array (_ BitVec 32) (_ BitVec 64))) (size!37835 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77301)

(assert (=> b!1194553 (= res!794808 (bvslt (size!37835 _keys!1208) #b01111111111111111111111111111111))))

(declare-fun b!1194554 () Bool)

(declare-fun res!794811 () Bool)

(assert (=> b!1194554 (=> (not res!794811) (not e!678867))))

(declare-fun lt!542784 () array!77301)

(declare-datatypes ((List!26263 0))(
  ( (Nil!26260) (Cons!26259 (h!27468 (_ BitVec 64)) (t!38934 List!26263)) )
))
(declare-fun arrayNoDuplicates!0 (array!77301 (_ BitVec 32) List!26263) Bool)

(assert (=> b!1194554 (= res!794811 (arrayNoDuplicates!0 lt!542784 #b00000000000000000000000000000000 Nil!26260))))

(declare-fun b!1194555 () Bool)

(declare-fun res!794806 () Bool)

(declare-fun e!678868 () Bool)

(assert (=> b!1194555 (=> (not res!794806) (not e!678868))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45475 0))(
  ( (V!45476 (val!15187 Int)) )
))
(declare-datatypes ((ValueCell!14421 0))(
  ( (ValueCellFull!14421 (v!17825 V!45475)) (EmptyCell!14421) )
))
(declare-datatypes ((array!77303 0))(
  ( (array!77304 (arr!37300 (Array (_ BitVec 32) ValueCell!14421)) (size!37836 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77303)

(assert (=> b!1194555 (= res!794806 (and (= (size!37836 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37835 _keys!1208) (size!37836 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1194556 () Bool)

(declare-fun e!678864 () Bool)

(declare-fun e!678869 () Bool)

(declare-fun mapRes!47222 () Bool)

(assert (=> b!1194556 (= e!678864 (and e!678869 mapRes!47222))))

(declare-fun condMapEmpty!47222 () Bool)

(declare-fun mapDefault!47222 () ValueCell!14421)

(assert (=> b!1194556 (= condMapEmpty!47222 (= (arr!37300 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14421)) mapDefault!47222)))))

(declare-fun mapIsEmpty!47222 () Bool)

(assert (=> mapIsEmpty!47222 mapRes!47222))

(declare-fun mapNonEmpty!47222 () Bool)

(declare-fun tp!89832 () Bool)

(declare-fun e!678866 () Bool)

(assert (=> mapNonEmpty!47222 (= mapRes!47222 (and tp!89832 e!678866))))

(declare-fun mapKey!47222 () (_ BitVec 32))

(declare-fun mapValue!47222 () ValueCell!14421)

(declare-fun mapRest!47222 () (Array (_ BitVec 32) ValueCell!14421))

(assert (=> mapNonEmpty!47222 (= (arr!37300 _values!996) (store mapRest!47222 mapKey!47222 mapValue!47222))))

(declare-fun b!1194557 () Bool)

(assert (=> b!1194557 (= e!678868 e!678867)))

(declare-fun res!794803 () Bool)

(assert (=> b!1194557 (=> (not res!794803) (not e!678867))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77301 (_ BitVec 32)) Bool)

(assert (=> b!1194557 (= res!794803 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542784 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1194557 (= lt!542784 (array!77302 (store (arr!37299 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37835 _keys!1208)))))

(declare-fun b!1194558 () Bool)

(declare-fun res!794810 () Bool)

(assert (=> b!1194558 (=> (not res!794810) (not e!678868))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1194558 (= res!794810 (validMask!0 mask!1564))))

(declare-fun b!1194559 () Bool)

(declare-fun res!794809 () Bool)

(assert (=> b!1194559 (=> (not res!794809) (not e!678868))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1194559 (= res!794809 (= (select (arr!37299 _keys!1208) i!673) k0!934))))

(declare-fun res!794804 () Bool)

(assert (=> start!100164 (=> (not res!794804) (not e!678868))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100164 (= res!794804 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37835 _keys!1208))))))

(assert (=> start!100164 e!678868))

(declare-fun array_inv!28434 (array!77301) Bool)

(assert (=> start!100164 (array_inv!28434 _keys!1208)))

(assert (=> start!100164 true))

(declare-fun array_inv!28435 (array!77303) Bool)

(assert (=> start!100164 (and (array_inv!28435 _values!996) e!678864)))

(declare-fun b!1194560 () Bool)

(declare-fun res!794802 () Bool)

(assert (=> b!1194560 (=> (not res!794802) (not e!678868))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1194560 (= res!794802 (validKeyInArray!0 k0!934))))

(declare-fun b!1194561 () Bool)

(declare-fun tp_is_empty!30261 () Bool)

(assert (=> b!1194561 (= e!678869 tp_is_empty!30261)))

(declare-fun b!1194562 () Bool)

(declare-fun res!794807 () Bool)

(assert (=> b!1194562 (=> (not res!794807) (not e!678868))))

(assert (=> b!1194562 (= res!794807 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1194563 () Bool)

(assert (=> b!1194563 (= e!678866 tp_is_empty!30261)))

(declare-fun b!1194564 () Bool)

(declare-fun res!794801 () Bool)

(assert (=> b!1194564 (=> (not res!794801) (not e!678868))))

(assert (=> b!1194564 (= res!794801 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37835 _keys!1208))))))

(declare-fun b!1194565 () Bool)

(declare-fun arrayContainsKey!0 (array!77301 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1194565 (= e!678867 (not (arrayContainsKey!0 _keys!1208 k0!934 i!673)))))

(declare-fun b!1194566 () Bool)

(declare-fun res!794805 () Bool)

(assert (=> b!1194566 (=> (not res!794805) (not e!678868))))

(assert (=> b!1194566 (= res!794805 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26260))))

(assert (= (and start!100164 res!794804) b!1194558))

(assert (= (and b!1194558 res!794810) b!1194555))

(assert (= (and b!1194555 res!794806) b!1194562))

(assert (= (and b!1194562 res!794807) b!1194566))

(assert (= (and b!1194566 res!794805) b!1194564))

(assert (= (and b!1194564 res!794801) b!1194560))

(assert (= (and b!1194560 res!794802) b!1194559))

(assert (= (and b!1194559 res!794809) b!1194557))

(assert (= (and b!1194557 res!794803) b!1194554))

(assert (= (and b!1194554 res!794811) b!1194553))

(assert (= (and b!1194553 res!794808) b!1194565))

(assert (= (and b!1194556 condMapEmpty!47222) mapIsEmpty!47222))

(assert (= (and b!1194556 (not condMapEmpty!47222)) mapNonEmpty!47222))

(get-info :version)

(assert (= (and mapNonEmpty!47222 ((_ is ValueCellFull!14421) mapValue!47222)) b!1194563))

(assert (= (and b!1194556 ((_ is ValueCellFull!14421) mapDefault!47222)) b!1194561))

(assert (= start!100164 b!1194556))

(declare-fun m!1102417 () Bool)

(assert (=> b!1194558 m!1102417))

(declare-fun m!1102419 () Bool)

(assert (=> b!1194557 m!1102419))

(declare-fun m!1102421 () Bool)

(assert (=> b!1194557 m!1102421))

(declare-fun m!1102423 () Bool)

(assert (=> b!1194565 m!1102423))

(declare-fun m!1102425 () Bool)

(assert (=> b!1194560 m!1102425))

(declare-fun m!1102427 () Bool)

(assert (=> b!1194554 m!1102427))

(declare-fun m!1102429 () Bool)

(assert (=> b!1194559 m!1102429))

(declare-fun m!1102431 () Bool)

(assert (=> b!1194562 m!1102431))

(declare-fun m!1102433 () Bool)

(assert (=> b!1194566 m!1102433))

(declare-fun m!1102435 () Bool)

(assert (=> start!100164 m!1102435))

(declare-fun m!1102437 () Bool)

(assert (=> start!100164 m!1102437))

(declare-fun m!1102439 () Bool)

(assert (=> mapNonEmpty!47222 m!1102439))

(check-sat (not b!1194566) (not b!1194560) (not start!100164) (not b!1194557) (not b!1194565) (not b!1194554) tp_is_empty!30261 (not b!1194562) (not mapNonEmpty!47222) (not b!1194558))
(check-sat)
(get-model)

(declare-fun d!132275 () Bool)

(assert (=> d!132275 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1194560 d!132275))

(declare-fun d!132277 () Bool)

(declare-fun res!794849 () Bool)

(declare-fun e!678892 () Bool)

(assert (=> d!132277 (=> res!794849 e!678892)))

(assert (=> d!132277 (= res!794849 (= (select (arr!37299 _keys!1208) i!673) k0!934))))

(assert (=> d!132277 (= (arrayContainsKey!0 _keys!1208 k0!934 i!673) e!678892)))

(declare-fun b!1194613 () Bool)

(declare-fun e!678893 () Bool)

(assert (=> b!1194613 (= e!678892 e!678893)))

(declare-fun res!794850 () Bool)

(assert (=> b!1194613 (=> (not res!794850) (not e!678893))))

(assert (=> b!1194613 (= res!794850 (bvslt (bvadd i!673 #b00000000000000000000000000000001) (size!37835 _keys!1208)))))

(declare-fun b!1194614 () Bool)

(assert (=> b!1194614 (= e!678893 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd i!673 #b00000000000000000000000000000001)))))

(assert (= (and d!132277 (not res!794849)) b!1194613))

(assert (= (and b!1194613 res!794850) b!1194614))

(assert (=> d!132277 m!1102429))

(declare-fun m!1102465 () Bool)

(assert (=> b!1194614 m!1102465))

(assert (=> b!1194565 d!132277))

(declare-fun d!132279 () Bool)

(assert (=> d!132279 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1194558 d!132279))

(declare-fun d!132281 () Bool)

(assert (=> d!132281 (= (array_inv!28434 _keys!1208) (bvsge (size!37835 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!100164 d!132281))

(declare-fun d!132283 () Bool)

(assert (=> d!132283 (= (array_inv!28435 _values!996) (bvsge (size!37836 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!100164 d!132283))

(declare-fun b!1194625 () Bool)

(declare-fun e!678904 () Bool)

(declare-fun call!57146 () Bool)

(assert (=> b!1194625 (= e!678904 call!57146)))

(declare-fun b!1194626 () Bool)

(declare-fun e!678902 () Bool)

(assert (=> b!1194626 (= e!678902 e!678904)))

(declare-fun c!117320 () Bool)

(assert (=> b!1194626 (= c!117320 (validKeyInArray!0 (select (arr!37299 lt!542784) #b00000000000000000000000000000000)))))

(declare-fun b!1194627 () Bool)

(declare-fun e!678903 () Bool)

(assert (=> b!1194627 (= e!678903 e!678902)))

(declare-fun res!794858 () Bool)

(assert (=> b!1194627 (=> (not res!794858) (not e!678902))))

(declare-fun e!678905 () Bool)

(assert (=> b!1194627 (= res!794858 (not e!678905))))

(declare-fun res!794857 () Bool)

(assert (=> b!1194627 (=> (not res!794857) (not e!678905))))

(assert (=> b!1194627 (= res!794857 (validKeyInArray!0 (select (arr!37299 lt!542784) #b00000000000000000000000000000000)))))

(declare-fun b!1194628 () Bool)

(assert (=> b!1194628 (= e!678904 call!57146)))

(declare-fun bm!57143 () Bool)

(assert (=> bm!57143 (= call!57146 (arrayNoDuplicates!0 lt!542784 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!117320 (Cons!26259 (select (arr!37299 lt!542784) #b00000000000000000000000000000000) Nil!26260) Nil!26260)))))

(declare-fun b!1194629 () Bool)

(declare-fun contains!6862 (List!26263 (_ BitVec 64)) Bool)

(assert (=> b!1194629 (= e!678905 (contains!6862 Nil!26260 (select (arr!37299 lt!542784) #b00000000000000000000000000000000)))))

(declare-fun d!132285 () Bool)

(declare-fun res!794859 () Bool)

(assert (=> d!132285 (=> res!794859 e!678903)))

(assert (=> d!132285 (= res!794859 (bvsge #b00000000000000000000000000000000 (size!37835 lt!542784)))))

(assert (=> d!132285 (= (arrayNoDuplicates!0 lt!542784 #b00000000000000000000000000000000 Nil!26260) e!678903)))

(assert (= (and d!132285 (not res!794859)) b!1194627))

(assert (= (and b!1194627 res!794857) b!1194629))

(assert (= (and b!1194627 res!794858) b!1194626))

(assert (= (and b!1194626 c!117320) b!1194625))

(assert (= (and b!1194626 (not c!117320)) b!1194628))

(assert (= (or b!1194625 b!1194628) bm!57143))

(declare-fun m!1102467 () Bool)

(assert (=> b!1194626 m!1102467))

(assert (=> b!1194626 m!1102467))

(declare-fun m!1102469 () Bool)

(assert (=> b!1194626 m!1102469))

(assert (=> b!1194627 m!1102467))

(assert (=> b!1194627 m!1102467))

(assert (=> b!1194627 m!1102469))

(assert (=> bm!57143 m!1102467))

(declare-fun m!1102471 () Bool)

(assert (=> bm!57143 m!1102471))

(assert (=> b!1194629 m!1102467))

(assert (=> b!1194629 m!1102467))

(declare-fun m!1102473 () Bool)

(assert (=> b!1194629 m!1102473))

(assert (=> b!1194554 d!132285))

(declare-fun b!1194638 () Bool)

(declare-fun e!678913 () Bool)

(declare-fun e!678912 () Bool)

(assert (=> b!1194638 (= e!678913 e!678912)))

(declare-fun c!117323 () Bool)

(assert (=> b!1194638 (= c!117323 (validKeyInArray!0 (select (arr!37299 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!57146 () Bool)

(declare-fun call!57149 () Bool)

(assert (=> bm!57146 (= call!57149 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun d!132287 () Bool)

(declare-fun res!794865 () Bool)

(assert (=> d!132287 (=> res!794865 e!678913)))

(assert (=> d!132287 (= res!794865 (bvsge #b00000000000000000000000000000000 (size!37835 _keys!1208)))))

(assert (=> d!132287 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!678913)))

(declare-fun b!1194639 () Bool)

(declare-fun e!678914 () Bool)

(assert (=> b!1194639 (= e!678912 e!678914)))

(declare-fun lt!542794 () (_ BitVec 64))

(assert (=> b!1194639 (= lt!542794 (select (arr!37299 _keys!1208) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!39606 0))(
  ( (Unit!39607) )
))
(declare-fun lt!542795 () Unit!39606)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77301 (_ BitVec 64) (_ BitVec 32)) Unit!39606)

(assert (=> b!1194639 (= lt!542795 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!542794 #b00000000000000000000000000000000))))

(assert (=> b!1194639 (arrayContainsKey!0 _keys!1208 lt!542794 #b00000000000000000000000000000000)))

(declare-fun lt!542796 () Unit!39606)

(assert (=> b!1194639 (= lt!542796 lt!542795)))

(declare-fun res!794864 () Bool)

(declare-datatypes ((SeekEntryResult!9929 0))(
  ( (MissingZero!9929 (index!42087 (_ BitVec 32))) (Found!9929 (index!42088 (_ BitVec 32))) (Intermediate!9929 (undefined!10741 Bool) (index!42089 (_ BitVec 32)) (x!105657 (_ BitVec 32))) (Undefined!9929) (MissingVacant!9929 (index!42090 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!77301 (_ BitVec 32)) SeekEntryResult!9929)

(assert (=> b!1194639 (= res!794864 (= (seekEntryOrOpen!0 (select (arr!37299 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9929 #b00000000000000000000000000000000)))))

(assert (=> b!1194639 (=> (not res!794864) (not e!678914))))

(declare-fun b!1194640 () Bool)

(assert (=> b!1194640 (= e!678914 call!57149)))

(declare-fun b!1194641 () Bool)

(assert (=> b!1194641 (= e!678912 call!57149)))

(assert (= (and d!132287 (not res!794865)) b!1194638))

(assert (= (and b!1194638 c!117323) b!1194639))

(assert (= (and b!1194638 (not c!117323)) b!1194641))

(assert (= (and b!1194639 res!794864) b!1194640))

(assert (= (or b!1194640 b!1194641) bm!57146))

(declare-fun m!1102475 () Bool)

(assert (=> b!1194638 m!1102475))

(assert (=> b!1194638 m!1102475))

(declare-fun m!1102477 () Bool)

(assert (=> b!1194638 m!1102477))

(declare-fun m!1102479 () Bool)

(assert (=> bm!57146 m!1102479))

(assert (=> b!1194639 m!1102475))

(declare-fun m!1102481 () Bool)

(assert (=> b!1194639 m!1102481))

(declare-fun m!1102483 () Bool)

(assert (=> b!1194639 m!1102483))

(assert (=> b!1194639 m!1102475))

(declare-fun m!1102485 () Bool)

(assert (=> b!1194639 m!1102485))

(assert (=> b!1194562 d!132287))

(declare-fun b!1194642 () Bool)

(declare-fun e!678916 () Bool)

(declare-fun e!678915 () Bool)

(assert (=> b!1194642 (= e!678916 e!678915)))

(declare-fun c!117324 () Bool)

(assert (=> b!1194642 (= c!117324 (validKeyInArray!0 (select (arr!37299 lt!542784) #b00000000000000000000000000000000)))))

(declare-fun bm!57147 () Bool)

(declare-fun call!57150 () Bool)

(assert (=> bm!57147 (= call!57150 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!542784 mask!1564))))

(declare-fun d!132289 () Bool)

(declare-fun res!794867 () Bool)

(assert (=> d!132289 (=> res!794867 e!678916)))

(assert (=> d!132289 (= res!794867 (bvsge #b00000000000000000000000000000000 (size!37835 lt!542784)))))

(assert (=> d!132289 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542784 mask!1564) e!678916)))

(declare-fun b!1194643 () Bool)

(declare-fun e!678917 () Bool)

(assert (=> b!1194643 (= e!678915 e!678917)))

(declare-fun lt!542797 () (_ BitVec 64))

(assert (=> b!1194643 (= lt!542797 (select (arr!37299 lt!542784) #b00000000000000000000000000000000))))

(declare-fun lt!542798 () Unit!39606)

(assert (=> b!1194643 (= lt!542798 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!542784 lt!542797 #b00000000000000000000000000000000))))

(assert (=> b!1194643 (arrayContainsKey!0 lt!542784 lt!542797 #b00000000000000000000000000000000)))

(declare-fun lt!542799 () Unit!39606)

(assert (=> b!1194643 (= lt!542799 lt!542798)))

(declare-fun res!794866 () Bool)

(assert (=> b!1194643 (= res!794866 (= (seekEntryOrOpen!0 (select (arr!37299 lt!542784) #b00000000000000000000000000000000) lt!542784 mask!1564) (Found!9929 #b00000000000000000000000000000000)))))

(assert (=> b!1194643 (=> (not res!794866) (not e!678917))))

(declare-fun b!1194644 () Bool)

(assert (=> b!1194644 (= e!678917 call!57150)))

(declare-fun b!1194645 () Bool)

(assert (=> b!1194645 (= e!678915 call!57150)))

(assert (= (and d!132289 (not res!794867)) b!1194642))

(assert (= (and b!1194642 c!117324) b!1194643))

(assert (= (and b!1194642 (not c!117324)) b!1194645))

(assert (= (and b!1194643 res!794866) b!1194644))

(assert (= (or b!1194644 b!1194645) bm!57147))

(assert (=> b!1194642 m!1102467))

(assert (=> b!1194642 m!1102467))

(assert (=> b!1194642 m!1102469))

(declare-fun m!1102487 () Bool)

(assert (=> bm!57147 m!1102487))

(assert (=> b!1194643 m!1102467))

(declare-fun m!1102489 () Bool)

(assert (=> b!1194643 m!1102489))

(declare-fun m!1102491 () Bool)

(assert (=> b!1194643 m!1102491))

(assert (=> b!1194643 m!1102467))

(declare-fun m!1102493 () Bool)

(assert (=> b!1194643 m!1102493))

(assert (=> b!1194557 d!132289))

(declare-fun b!1194646 () Bool)

(declare-fun e!678920 () Bool)

(declare-fun call!57151 () Bool)

(assert (=> b!1194646 (= e!678920 call!57151)))

(declare-fun b!1194647 () Bool)

(declare-fun e!678918 () Bool)

(assert (=> b!1194647 (= e!678918 e!678920)))

(declare-fun c!117325 () Bool)

(assert (=> b!1194647 (= c!117325 (validKeyInArray!0 (select (arr!37299 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1194648 () Bool)

(declare-fun e!678919 () Bool)

(assert (=> b!1194648 (= e!678919 e!678918)))

(declare-fun res!794869 () Bool)

(assert (=> b!1194648 (=> (not res!794869) (not e!678918))))

(declare-fun e!678921 () Bool)

(assert (=> b!1194648 (= res!794869 (not e!678921))))

(declare-fun res!794868 () Bool)

(assert (=> b!1194648 (=> (not res!794868) (not e!678921))))

(assert (=> b!1194648 (= res!794868 (validKeyInArray!0 (select (arr!37299 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1194649 () Bool)

(assert (=> b!1194649 (= e!678920 call!57151)))

(declare-fun bm!57148 () Bool)

(assert (=> bm!57148 (= call!57151 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!117325 (Cons!26259 (select (arr!37299 _keys!1208) #b00000000000000000000000000000000) Nil!26260) Nil!26260)))))

(declare-fun b!1194650 () Bool)

(assert (=> b!1194650 (= e!678921 (contains!6862 Nil!26260 (select (arr!37299 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!132291 () Bool)

(declare-fun res!794870 () Bool)

(assert (=> d!132291 (=> res!794870 e!678919)))

(assert (=> d!132291 (= res!794870 (bvsge #b00000000000000000000000000000000 (size!37835 _keys!1208)))))

(assert (=> d!132291 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26260) e!678919)))

(assert (= (and d!132291 (not res!794870)) b!1194648))

(assert (= (and b!1194648 res!794868) b!1194650))

(assert (= (and b!1194648 res!794869) b!1194647))

(assert (= (and b!1194647 c!117325) b!1194646))

(assert (= (and b!1194647 (not c!117325)) b!1194649))

(assert (= (or b!1194646 b!1194649) bm!57148))

(assert (=> b!1194647 m!1102475))

(assert (=> b!1194647 m!1102475))

(assert (=> b!1194647 m!1102477))

(assert (=> b!1194648 m!1102475))

(assert (=> b!1194648 m!1102475))

(assert (=> b!1194648 m!1102477))

(assert (=> bm!57148 m!1102475))

(declare-fun m!1102495 () Bool)

(assert (=> bm!57148 m!1102495))

(assert (=> b!1194650 m!1102475))

(assert (=> b!1194650 m!1102475))

(declare-fun m!1102497 () Bool)

(assert (=> b!1194650 m!1102497))

(assert (=> b!1194566 d!132291))

(declare-fun b!1194657 () Bool)

(declare-fun e!678927 () Bool)

(assert (=> b!1194657 (= e!678927 tp_is_empty!30261)))

(declare-fun mapNonEmpty!47228 () Bool)

(declare-fun mapRes!47228 () Bool)

(declare-fun tp!89838 () Bool)

(assert (=> mapNonEmpty!47228 (= mapRes!47228 (and tp!89838 e!678927))))

(declare-fun mapValue!47228 () ValueCell!14421)

(declare-fun mapKey!47228 () (_ BitVec 32))

(declare-fun mapRest!47228 () (Array (_ BitVec 32) ValueCell!14421))

(assert (=> mapNonEmpty!47228 (= mapRest!47222 (store mapRest!47228 mapKey!47228 mapValue!47228))))

(declare-fun b!1194658 () Bool)

(declare-fun e!678926 () Bool)

(assert (=> b!1194658 (= e!678926 tp_is_empty!30261)))

(declare-fun condMapEmpty!47228 () Bool)

(declare-fun mapDefault!47228 () ValueCell!14421)

(assert (=> mapNonEmpty!47222 (= condMapEmpty!47228 (= mapRest!47222 ((as const (Array (_ BitVec 32) ValueCell!14421)) mapDefault!47228)))))

(assert (=> mapNonEmpty!47222 (= tp!89832 (and e!678926 mapRes!47228))))

(declare-fun mapIsEmpty!47228 () Bool)

(assert (=> mapIsEmpty!47228 mapRes!47228))

(assert (= (and mapNonEmpty!47222 condMapEmpty!47228) mapIsEmpty!47228))

(assert (= (and mapNonEmpty!47222 (not condMapEmpty!47228)) mapNonEmpty!47228))

(assert (= (and mapNonEmpty!47228 ((_ is ValueCellFull!14421) mapValue!47228)) b!1194657))

(assert (= (and mapNonEmpty!47222 ((_ is ValueCellFull!14421) mapDefault!47228)) b!1194658))

(declare-fun m!1102499 () Bool)

(assert (=> mapNonEmpty!47228 m!1102499))

(check-sat (not b!1194643) (not b!1194629) (not b!1194638) (not bm!57146) (not mapNonEmpty!47228) (not b!1194627) (not bm!57147) tp_is_empty!30261 (not b!1194626) (not b!1194647) (not b!1194639) (not b!1194614) (not b!1194648) (not bm!57148) (not b!1194642) (not bm!57143) (not b!1194650))
(check-sat)
