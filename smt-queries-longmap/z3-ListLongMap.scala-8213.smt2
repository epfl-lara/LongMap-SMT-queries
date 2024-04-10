; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100146 () Bool)

(assert start!100146)

(declare-fun b!1194387 () Bool)

(declare-fun res!794691 () Bool)

(declare-fun e!678778 () Bool)

(assert (=> b!1194387 (=> (not res!794691) (not e!678778))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1194387 (= res!794691 (validMask!0 mask!1564))))

(declare-fun b!1194388 () Bool)

(declare-fun res!794690 () Bool)

(assert (=> b!1194388 (=> (not res!794690) (not e!678778))))

(declare-datatypes ((array!77289 0))(
  ( (array!77290 (arr!37294 (Array (_ BitVec 32) (_ BitVec 64))) (size!37830 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77289)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45467 0))(
  ( (V!45468 (val!15184 Int)) )
))
(declare-datatypes ((ValueCell!14418 0))(
  ( (ValueCellFull!14418 (v!17822 V!45467)) (EmptyCell!14418) )
))
(declare-datatypes ((array!77291 0))(
  ( (array!77292 (arr!37295 (Array (_ BitVec 32) ValueCell!14418)) (size!37831 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77291)

(assert (=> b!1194388 (= res!794690 (and (= (size!37831 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37830 _keys!1208) (size!37831 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1194389 () Bool)

(declare-fun e!678780 () Bool)

(assert (=> b!1194389 (= e!678778 e!678780)))

(declare-fun res!794692 () Bool)

(assert (=> b!1194389 (=> (not res!794692) (not e!678780))))

(declare-fun lt!542763 () array!77289)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77289 (_ BitVec 32)) Bool)

(assert (=> b!1194389 (= res!794692 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542763 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1194389 (= lt!542763 (array!77290 (store (arr!37294 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37830 _keys!1208)))))

(declare-fun b!1194390 () Bool)

(declare-fun e!678776 () Bool)

(declare-fun tp_is_empty!30255 () Bool)

(assert (=> b!1194390 (= e!678776 tp_is_empty!30255)))

(declare-fun b!1194391 () Bool)

(declare-fun res!794688 () Bool)

(assert (=> b!1194391 (=> (not res!794688) (not e!678780))))

(declare-datatypes ((List!26261 0))(
  ( (Nil!26258) (Cons!26257 (h!27466 (_ BitVec 64)) (t!38932 List!26261)) )
))
(declare-fun arrayNoDuplicates!0 (array!77289 (_ BitVec 32) List!26261) Bool)

(assert (=> b!1194391 (= res!794688 (arrayNoDuplicates!0 lt!542763 #b00000000000000000000000000000000 Nil!26258))))

(declare-fun b!1194392 () Bool)

(declare-fun e!678781 () Bool)

(assert (=> b!1194392 (= e!678781 tp_is_empty!30255)))

(declare-fun res!794687 () Bool)

(assert (=> start!100146 (=> (not res!794687) (not e!678778))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100146 (= res!794687 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37830 _keys!1208))))))

(assert (=> start!100146 e!678778))

(declare-fun array_inv!28430 (array!77289) Bool)

(assert (=> start!100146 (array_inv!28430 _keys!1208)))

(assert (=> start!100146 true))

(declare-fun e!678779 () Bool)

(declare-fun array_inv!28431 (array!77291) Bool)

(assert (=> start!100146 (and (array_inv!28431 _values!996) e!678779)))

(declare-fun b!1194393 () Bool)

(assert (=> b!1194393 (= e!678780 (bvsge (size!37830 _keys!1208) #b01111111111111111111111111111111))))

(declare-fun b!1194394 () Bool)

(declare-fun res!794686 () Bool)

(assert (=> b!1194394 (=> (not res!794686) (not e!678778))))

(assert (=> b!1194394 (= res!794686 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26258))))

(declare-fun b!1194395 () Bool)

(declare-fun res!794693 () Bool)

(assert (=> b!1194395 (=> (not res!794693) (not e!678778))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1194395 (= res!794693 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!47210 () Bool)

(declare-fun mapRes!47210 () Bool)

(assert (=> mapIsEmpty!47210 mapRes!47210))

(declare-fun b!1194396 () Bool)

(assert (=> b!1194396 (= e!678779 (and e!678776 mapRes!47210))))

(declare-fun condMapEmpty!47210 () Bool)

(declare-fun mapDefault!47210 () ValueCell!14418)

(assert (=> b!1194396 (= condMapEmpty!47210 (= (arr!37295 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14418)) mapDefault!47210)))))

(declare-fun b!1194397 () Bool)

(declare-fun res!794689 () Bool)

(assert (=> b!1194397 (=> (not res!794689) (not e!678778))))

(assert (=> b!1194397 (= res!794689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1194398 () Bool)

(declare-fun res!794694 () Bool)

(assert (=> b!1194398 (=> (not res!794694) (not e!678778))))

(assert (=> b!1194398 (= res!794694 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37830 _keys!1208))))))

(declare-fun b!1194399 () Bool)

(declare-fun res!794695 () Bool)

(assert (=> b!1194399 (=> (not res!794695) (not e!678778))))

(assert (=> b!1194399 (= res!794695 (= (select (arr!37294 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!47210 () Bool)

(declare-fun tp!89820 () Bool)

(assert (=> mapNonEmpty!47210 (= mapRes!47210 (and tp!89820 e!678781))))

(declare-fun mapKey!47210 () (_ BitVec 32))

(declare-fun mapValue!47210 () ValueCell!14418)

(declare-fun mapRest!47210 () (Array (_ BitVec 32) ValueCell!14418))

(assert (=> mapNonEmpty!47210 (= (arr!37295 _values!996) (store mapRest!47210 mapKey!47210 mapValue!47210))))

(assert (= (and start!100146 res!794687) b!1194387))

(assert (= (and b!1194387 res!794691) b!1194388))

(assert (= (and b!1194388 res!794690) b!1194397))

(assert (= (and b!1194397 res!794689) b!1194394))

(assert (= (and b!1194394 res!794686) b!1194398))

(assert (= (and b!1194398 res!794694) b!1194395))

(assert (= (and b!1194395 res!794693) b!1194399))

(assert (= (and b!1194399 res!794695) b!1194389))

(assert (= (and b!1194389 res!794692) b!1194391))

(assert (= (and b!1194391 res!794688) b!1194393))

(assert (= (and b!1194396 condMapEmpty!47210) mapIsEmpty!47210))

(assert (= (and b!1194396 (not condMapEmpty!47210)) mapNonEmpty!47210))

(get-info :version)

(assert (= (and mapNonEmpty!47210 ((_ is ValueCellFull!14418) mapValue!47210)) b!1194392))

(assert (= (and b!1194396 ((_ is ValueCellFull!14418) mapDefault!47210)) b!1194390))

(assert (= start!100146 b!1194396))

(declare-fun m!1102315 () Bool)

(assert (=> b!1194397 m!1102315))

(declare-fun m!1102317 () Bool)

(assert (=> b!1194391 m!1102317))

(declare-fun m!1102319 () Bool)

(assert (=> mapNonEmpty!47210 m!1102319))

(declare-fun m!1102321 () Bool)

(assert (=> b!1194399 m!1102321))

(declare-fun m!1102323 () Bool)

(assert (=> b!1194387 m!1102323))

(declare-fun m!1102325 () Bool)

(assert (=> b!1194394 m!1102325))

(declare-fun m!1102327 () Bool)

(assert (=> b!1194395 m!1102327))

(declare-fun m!1102329 () Bool)

(assert (=> start!100146 m!1102329))

(declare-fun m!1102331 () Bool)

(assert (=> start!100146 m!1102331))

(declare-fun m!1102333 () Bool)

(assert (=> b!1194389 m!1102333))

(declare-fun m!1102335 () Bool)

(assert (=> b!1194389 m!1102335))

(check-sat (not start!100146) (not mapNonEmpty!47210) (not b!1194397) (not b!1194394) (not b!1194391) (not b!1194395) (not b!1194387) (not b!1194389) tp_is_empty!30255)
(check-sat)
(get-model)

(declare-fun b!1194447 () Bool)

(declare-fun e!678807 () Bool)

(declare-fun call!57138 () Bool)

(assert (=> b!1194447 (= e!678807 call!57138)))

(declare-fun b!1194448 () Bool)

(declare-fun e!678808 () Bool)

(assert (=> b!1194448 (= e!678808 e!678807)))

(declare-fun c!117312 () Bool)

(assert (=> b!1194448 (= c!117312 (validKeyInArray!0 (select (arr!37294 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1194449 () Bool)

(declare-fun e!678806 () Bool)

(assert (=> b!1194449 (= e!678807 e!678806)))

(declare-fun lt!542773 () (_ BitVec 64))

(assert (=> b!1194449 (= lt!542773 (select (arr!37294 _keys!1208) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!39604 0))(
  ( (Unit!39605) )
))
(declare-fun lt!542775 () Unit!39604)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77289 (_ BitVec 64) (_ BitVec 32)) Unit!39604)

(assert (=> b!1194449 (= lt!542775 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!542773 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!77289 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1194449 (arrayContainsKey!0 _keys!1208 lt!542773 #b00000000000000000000000000000000)))

(declare-fun lt!542774 () Unit!39604)

(assert (=> b!1194449 (= lt!542774 lt!542775)))

(declare-fun res!794730 () Bool)

(declare-datatypes ((SeekEntryResult!9928 0))(
  ( (MissingZero!9928 (index!42083 (_ BitVec 32))) (Found!9928 (index!42084 (_ BitVec 32))) (Intermediate!9928 (undefined!10740 Bool) (index!42085 (_ BitVec 32)) (x!105646 (_ BitVec 32))) (Undefined!9928) (MissingVacant!9928 (index!42086 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!77289 (_ BitVec 32)) SeekEntryResult!9928)

(assert (=> b!1194449 (= res!794730 (= (seekEntryOrOpen!0 (select (arr!37294 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9928 #b00000000000000000000000000000000)))))

(assert (=> b!1194449 (=> (not res!794730) (not e!678806))))

(declare-fun bm!57135 () Bool)

(assert (=> bm!57135 (= call!57138 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1194450 () Bool)

(assert (=> b!1194450 (= e!678806 call!57138)))

(declare-fun d!132257 () Bool)

(declare-fun res!794731 () Bool)

(assert (=> d!132257 (=> res!794731 e!678808)))

(assert (=> d!132257 (= res!794731 (bvsge #b00000000000000000000000000000000 (size!37830 _keys!1208)))))

(assert (=> d!132257 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!678808)))

(assert (= (and d!132257 (not res!794731)) b!1194448))

(assert (= (and b!1194448 c!117312) b!1194449))

(assert (= (and b!1194448 (not c!117312)) b!1194447))

(assert (= (and b!1194449 res!794730) b!1194450))

(assert (= (or b!1194450 b!1194447) bm!57135))

(declare-fun m!1102359 () Bool)

(assert (=> b!1194448 m!1102359))

(assert (=> b!1194448 m!1102359))

(declare-fun m!1102361 () Bool)

(assert (=> b!1194448 m!1102361))

(assert (=> b!1194449 m!1102359))

(declare-fun m!1102363 () Bool)

(assert (=> b!1194449 m!1102363))

(declare-fun m!1102365 () Bool)

(assert (=> b!1194449 m!1102365))

(assert (=> b!1194449 m!1102359))

(declare-fun m!1102367 () Bool)

(assert (=> b!1194449 m!1102367))

(declare-fun m!1102369 () Bool)

(assert (=> bm!57135 m!1102369))

(assert (=> b!1194397 d!132257))

(declare-fun d!132259 () Bool)

(assert (=> d!132259 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1194387 d!132259))

(declare-fun b!1194461 () Bool)

(declare-fun e!678819 () Bool)

(declare-fun call!57141 () Bool)

(assert (=> b!1194461 (= e!678819 call!57141)))

(declare-fun b!1194462 () Bool)

(declare-fun e!678818 () Bool)

(declare-fun contains!6861 (List!26261 (_ BitVec 64)) Bool)

(assert (=> b!1194462 (= e!678818 (contains!6861 Nil!26258 (select (arr!37294 lt!542763) #b00000000000000000000000000000000)))))

(declare-fun b!1194463 () Bool)

(assert (=> b!1194463 (= e!678819 call!57141)))

(declare-fun b!1194464 () Bool)

(declare-fun e!678820 () Bool)

(declare-fun e!678817 () Bool)

(assert (=> b!1194464 (= e!678820 e!678817)))

(declare-fun res!794738 () Bool)

(assert (=> b!1194464 (=> (not res!794738) (not e!678817))))

(assert (=> b!1194464 (= res!794738 (not e!678818))))

(declare-fun res!794739 () Bool)

(assert (=> b!1194464 (=> (not res!794739) (not e!678818))))

(assert (=> b!1194464 (= res!794739 (validKeyInArray!0 (select (arr!37294 lt!542763) #b00000000000000000000000000000000)))))

(declare-fun b!1194465 () Bool)

(assert (=> b!1194465 (= e!678817 e!678819)))

(declare-fun c!117315 () Bool)

(assert (=> b!1194465 (= c!117315 (validKeyInArray!0 (select (arr!37294 lt!542763) #b00000000000000000000000000000000)))))

(declare-fun d!132261 () Bool)

(declare-fun res!794740 () Bool)

(assert (=> d!132261 (=> res!794740 e!678820)))

(assert (=> d!132261 (= res!794740 (bvsge #b00000000000000000000000000000000 (size!37830 lt!542763)))))

(assert (=> d!132261 (= (arrayNoDuplicates!0 lt!542763 #b00000000000000000000000000000000 Nil!26258) e!678820)))

(declare-fun bm!57138 () Bool)

(assert (=> bm!57138 (= call!57141 (arrayNoDuplicates!0 lt!542763 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!117315 (Cons!26257 (select (arr!37294 lt!542763) #b00000000000000000000000000000000) Nil!26258) Nil!26258)))))

(assert (= (and d!132261 (not res!794740)) b!1194464))

(assert (= (and b!1194464 res!794739) b!1194462))

(assert (= (and b!1194464 res!794738) b!1194465))

(assert (= (and b!1194465 c!117315) b!1194463))

(assert (= (and b!1194465 (not c!117315)) b!1194461))

(assert (= (or b!1194463 b!1194461) bm!57138))

(declare-fun m!1102371 () Bool)

(assert (=> b!1194462 m!1102371))

(assert (=> b!1194462 m!1102371))

(declare-fun m!1102373 () Bool)

(assert (=> b!1194462 m!1102373))

(assert (=> b!1194464 m!1102371))

(assert (=> b!1194464 m!1102371))

(declare-fun m!1102375 () Bool)

(assert (=> b!1194464 m!1102375))

(assert (=> b!1194465 m!1102371))

(assert (=> b!1194465 m!1102371))

(assert (=> b!1194465 m!1102375))

(assert (=> bm!57138 m!1102371))

(declare-fun m!1102377 () Bool)

(assert (=> bm!57138 m!1102377))

(assert (=> b!1194391 d!132261))

(declare-fun d!132263 () Bool)

(assert (=> d!132263 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1194395 d!132263))

(declare-fun b!1194466 () Bool)

(declare-fun e!678822 () Bool)

(declare-fun call!57142 () Bool)

(assert (=> b!1194466 (= e!678822 call!57142)))

(declare-fun b!1194467 () Bool)

(declare-fun e!678823 () Bool)

(assert (=> b!1194467 (= e!678823 e!678822)))

(declare-fun c!117316 () Bool)

(assert (=> b!1194467 (= c!117316 (validKeyInArray!0 (select (arr!37294 lt!542763) #b00000000000000000000000000000000)))))

(declare-fun b!1194468 () Bool)

(declare-fun e!678821 () Bool)

(assert (=> b!1194468 (= e!678822 e!678821)))

(declare-fun lt!542776 () (_ BitVec 64))

(assert (=> b!1194468 (= lt!542776 (select (arr!37294 lt!542763) #b00000000000000000000000000000000))))

(declare-fun lt!542778 () Unit!39604)

(assert (=> b!1194468 (= lt!542778 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!542763 lt!542776 #b00000000000000000000000000000000))))

(assert (=> b!1194468 (arrayContainsKey!0 lt!542763 lt!542776 #b00000000000000000000000000000000)))

(declare-fun lt!542777 () Unit!39604)

(assert (=> b!1194468 (= lt!542777 lt!542778)))

(declare-fun res!794741 () Bool)

(assert (=> b!1194468 (= res!794741 (= (seekEntryOrOpen!0 (select (arr!37294 lt!542763) #b00000000000000000000000000000000) lt!542763 mask!1564) (Found!9928 #b00000000000000000000000000000000)))))

(assert (=> b!1194468 (=> (not res!794741) (not e!678821))))

(declare-fun bm!57139 () Bool)

(assert (=> bm!57139 (= call!57142 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!542763 mask!1564))))

(declare-fun b!1194469 () Bool)

(assert (=> b!1194469 (= e!678821 call!57142)))

(declare-fun d!132265 () Bool)

(declare-fun res!794742 () Bool)

(assert (=> d!132265 (=> res!794742 e!678823)))

(assert (=> d!132265 (= res!794742 (bvsge #b00000000000000000000000000000000 (size!37830 lt!542763)))))

(assert (=> d!132265 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542763 mask!1564) e!678823)))

(assert (= (and d!132265 (not res!794742)) b!1194467))

(assert (= (and b!1194467 c!117316) b!1194468))

(assert (= (and b!1194467 (not c!117316)) b!1194466))

(assert (= (and b!1194468 res!794741) b!1194469))

(assert (= (or b!1194469 b!1194466) bm!57139))

(assert (=> b!1194467 m!1102371))

(assert (=> b!1194467 m!1102371))

(assert (=> b!1194467 m!1102375))

(assert (=> b!1194468 m!1102371))

(declare-fun m!1102379 () Bool)

(assert (=> b!1194468 m!1102379))

(declare-fun m!1102381 () Bool)

(assert (=> b!1194468 m!1102381))

(assert (=> b!1194468 m!1102371))

(declare-fun m!1102383 () Bool)

(assert (=> b!1194468 m!1102383))

(declare-fun m!1102385 () Bool)

(assert (=> bm!57139 m!1102385))

(assert (=> b!1194389 d!132265))

(declare-fun d!132267 () Bool)

(assert (=> d!132267 (= (array_inv!28430 _keys!1208) (bvsge (size!37830 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!100146 d!132267))

(declare-fun d!132269 () Bool)

(assert (=> d!132269 (= (array_inv!28431 _values!996) (bvsge (size!37831 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!100146 d!132269))

(declare-fun b!1194470 () Bool)

(declare-fun e!678826 () Bool)

(declare-fun call!57143 () Bool)

(assert (=> b!1194470 (= e!678826 call!57143)))

(declare-fun b!1194471 () Bool)

(declare-fun e!678825 () Bool)

(assert (=> b!1194471 (= e!678825 (contains!6861 Nil!26258 (select (arr!37294 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1194472 () Bool)

(assert (=> b!1194472 (= e!678826 call!57143)))

(declare-fun b!1194473 () Bool)

(declare-fun e!678827 () Bool)

(declare-fun e!678824 () Bool)

(assert (=> b!1194473 (= e!678827 e!678824)))

(declare-fun res!794743 () Bool)

(assert (=> b!1194473 (=> (not res!794743) (not e!678824))))

(assert (=> b!1194473 (= res!794743 (not e!678825))))

(declare-fun res!794744 () Bool)

(assert (=> b!1194473 (=> (not res!794744) (not e!678825))))

(assert (=> b!1194473 (= res!794744 (validKeyInArray!0 (select (arr!37294 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1194474 () Bool)

(assert (=> b!1194474 (= e!678824 e!678826)))

(declare-fun c!117317 () Bool)

(assert (=> b!1194474 (= c!117317 (validKeyInArray!0 (select (arr!37294 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!132271 () Bool)

(declare-fun res!794745 () Bool)

(assert (=> d!132271 (=> res!794745 e!678827)))

(assert (=> d!132271 (= res!794745 (bvsge #b00000000000000000000000000000000 (size!37830 _keys!1208)))))

(assert (=> d!132271 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26258) e!678827)))

(declare-fun bm!57140 () Bool)

(assert (=> bm!57140 (= call!57143 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!117317 (Cons!26257 (select (arr!37294 _keys!1208) #b00000000000000000000000000000000) Nil!26258) Nil!26258)))))

(assert (= (and d!132271 (not res!794745)) b!1194473))

(assert (= (and b!1194473 res!794744) b!1194471))

(assert (= (and b!1194473 res!794743) b!1194474))

(assert (= (and b!1194474 c!117317) b!1194472))

(assert (= (and b!1194474 (not c!117317)) b!1194470))

(assert (= (or b!1194472 b!1194470) bm!57140))

(assert (=> b!1194471 m!1102359))

(assert (=> b!1194471 m!1102359))

(declare-fun m!1102387 () Bool)

(assert (=> b!1194471 m!1102387))

(assert (=> b!1194473 m!1102359))

(assert (=> b!1194473 m!1102359))

(assert (=> b!1194473 m!1102361))

(assert (=> b!1194474 m!1102359))

(assert (=> b!1194474 m!1102359))

(assert (=> b!1194474 m!1102361))

(assert (=> bm!57140 m!1102359))

(declare-fun m!1102389 () Bool)

(assert (=> bm!57140 m!1102389))

(assert (=> b!1194394 d!132271))

(declare-fun condMapEmpty!47216 () Bool)

(declare-fun mapDefault!47216 () ValueCell!14418)

(assert (=> mapNonEmpty!47210 (= condMapEmpty!47216 (= mapRest!47210 ((as const (Array (_ BitVec 32) ValueCell!14418)) mapDefault!47216)))))

(declare-fun e!678832 () Bool)

(declare-fun mapRes!47216 () Bool)

(assert (=> mapNonEmpty!47210 (= tp!89820 (and e!678832 mapRes!47216))))

(declare-fun b!1194481 () Bool)

(declare-fun e!678833 () Bool)

(assert (=> b!1194481 (= e!678833 tp_is_empty!30255)))

(declare-fun b!1194482 () Bool)

(assert (=> b!1194482 (= e!678832 tp_is_empty!30255)))

(declare-fun mapNonEmpty!47216 () Bool)

(declare-fun tp!89826 () Bool)

(assert (=> mapNonEmpty!47216 (= mapRes!47216 (and tp!89826 e!678833))))

(declare-fun mapValue!47216 () ValueCell!14418)

(declare-fun mapKey!47216 () (_ BitVec 32))

(declare-fun mapRest!47216 () (Array (_ BitVec 32) ValueCell!14418))

(assert (=> mapNonEmpty!47216 (= mapRest!47210 (store mapRest!47216 mapKey!47216 mapValue!47216))))

(declare-fun mapIsEmpty!47216 () Bool)

(assert (=> mapIsEmpty!47216 mapRes!47216))

(assert (= (and mapNonEmpty!47210 condMapEmpty!47216) mapIsEmpty!47216))

(assert (= (and mapNonEmpty!47210 (not condMapEmpty!47216)) mapNonEmpty!47216))

(assert (= (and mapNonEmpty!47216 ((_ is ValueCellFull!14418) mapValue!47216)) b!1194481))

(assert (= (and mapNonEmpty!47210 ((_ is ValueCellFull!14418) mapDefault!47216)) b!1194482))

(declare-fun m!1102391 () Bool)

(assert (=> mapNonEmpty!47216 m!1102391))

(check-sat (not b!1194449) (not b!1194465) (not mapNonEmpty!47216) (not b!1194462) (not b!1194468) (not bm!57140) (not b!1194471) (not bm!57139) (not b!1194448) (not b!1194464) tp_is_empty!30255 (not b!1194474) (not bm!57138) (not b!1194467) (not bm!57135) (not b!1194473))
(check-sat)
