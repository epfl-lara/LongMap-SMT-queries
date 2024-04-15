; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100156 () Bool)

(assert start!100156)

(declare-fun b!1194387 () Bool)

(declare-fun res!794702 () Bool)

(declare-fun e!678772 () Bool)

(assert (=> b!1194387 (=> (not res!794702) (not e!678772))))

(declare-datatypes ((array!77230 0))(
  ( (array!77231 (arr!37264 (Array (_ BitVec 32) (_ BitVec 64))) (size!37802 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77230)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1194387 (= res!794702 (= (select (arr!37264 _keys!1208) i!673) k0!934))))

(declare-fun b!1194388 () Bool)

(declare-fun e!678769 () Bool)

(declare-fun tp_is_empty!30259 () Bool)

(assert (=> b!1194388 (= e!678769 tp_is_empty!30259)))

(declare-fun res!794703 () Bool)

(assert (=> start!100156 (=> (not res!794703) (not e!678772))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100156 (= res!794703 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37802 _keys!1208))))))

(assert (=> start!100156 e!678772))

(declare-fun array_inv!28528 (array!77230) Bool)

(assert (=> start!100156 (array_inv!28528 _keys!1208)))

(assert (=> start!100156 true))

(declare-datatypes ((V!45473 0))(
  ( (V!45474 (val!15186 Int)) )
))
(declare-datatypes ((ValueCell!14420 0))(
  ( (ValueCellFull!14420 (v!17823 V!45473)) (EmptyCell!14420) )
))
(declare-datatypes ((array!77232 0))(
  ( (array!77233 (arr!37265 (Array (_ BitVec 32) ValueCell!14420)) (size!37803 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77232)

(declare-fun e!678771 () Bool)

(declare-fun array_inv!28529 (array!77232) Bool)

(assert (=> start!100156 (and (array_inv!28529 _values!996) e!678771)))

(declare-fun b!1194389 () Bool)

(declare-fun e!678768 () Bool)

(assert (=> b!1194389 (= e!678772 e!678768)))

(declare-fun res!794705 () Bool)

(assert (=> b!1194389 (=> (not res!794705) (not e!678768))))

(declare-fun lt!542589 () array!77230)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77230 (_ BitVec 32)) Bool)

(assert (=> b!1194389 (= res!794705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542589 mask!1564))))

(assert (=> b!1194389 (= lt!542589 (array!77231 (store (arr!37264 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37802 _keys!1208)))))

(declare-fun b!1194390 () Bool)

(declare-fun res!794704 () Bool)

(assert (=> b!1194390 (=> (not res!794704) (not e!678768))))

(declare-datatypes ((List!26337 0))(
  ( (Nil!26334) (Cons!26333 (h!27542 (_ BitVec 64)) (t!38999 List!26337)) )
))
(declare-fun arrayNoDuplicates!0 (array!77230 (_ BitVec 32) List!26337) Bool)

(assert (=> b!1194390 (= res!794704 (arrayNoDuplicates!0 lt!542589 #b00000000000000000000000000000000 Nil!26334))))

(declare-fun b!1194391 () Bool)

(declare-fun res!794708 () Bool)

(assert (=> b!1194391 (=> (not res!794708) (not e!678768))))

(assert (=> b!1194391 (= res!794708 (bvslt (size!37802 _keys!1208) #b01111111111111111111111111111111))))

(declare-fun b!1194392 () Bool)

(declare-fun res!794712 () Bool)

(assert (=> b!1194392 (=> (not res!794712) (not e!678772))))

(assert (=> b!1194392 (= res!794712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1194393 () Bool)

(declare-fun res!794709 () Bool)

(assert (=> b!1194393 (=> (not res!794709) (not e!678772))))

(assert (=> b!1194393 (= res!794709 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26334))))

(declare-fun b!1194394 () Bool)

(declare-fun res!794706 () Bool)

(assert (=> b!1194394 (=> (not res!794706) (not e!678772))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1194394 (= res!794706 (validMask!0 mask!1564))))

(declare-fun b!1194395 () Bool)

(declare-fun res!794711 () Bool)

(assert (=> b!1194395 (=> (not res!794711) (not e!678772))))

(assert (=> b!1194395 (= res!794711 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37802 _keys!1208))))))

(declare-fun b!1194396 () Bool)

(declare-fun arrayContainsKey!0 (array!77230 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1194396 (= e!678768 (not (arrayContainsKey!0 _keys!1208 k0!934 i!673)))))

(declare-fun b!1194397 () Bool)

(declare-fun e!678773 () Bool)

(declare-fun mapRes!47219 () Bool)

(assert (=> b!1194397 (= e!678771 (and e!678773 mapRes!47219))))

(declare-fun condMapEmpty!47219 () Bool)

(declare-fun mapDefault!47219 () ValueCell!14420)

(assert (=> b!1194397 (= condMapEmpty!47219 (= (arr!37265 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14420)) mapDefault!47219)))))

(declare-fun b!1194398 () Bool)

(declare-fun res!794710 () Bool)

(assert (=> b!1194398 (=> (not res!794710) (not e!678772))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1194398 (= res!794710 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!47219 () Bool)

(assert (=> mapIsEmpty!47219 mapRes!47219))

(declare-fun mapNonEmpty!47219 () Bool)

(declare-fun tp!89829 () Bool)

(assert (=> mapNonEmpty!47219 (= mapRes!47219 (and tp!89829 e!678769))))

(declare-fun mapKey!47219 () (_ BitVec 32))

(declare-fun mapValue!47219 () ValueCell!14420)

(declare-fun mapRest!47219 () (Array (_ BitVec 32) ValueCell!14420))

(assert (=> mapNonEmpty!47219 (= (arr!37265 _values!996) (store mapRest!47219 mapKey!47219 mapValue!47219))))

(declare-fun b!1194399 () Bool)

(declare-fun res!794707 () Bool)

(assert (=> b!1194399 (=> (not res!794707) (not e!678772))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1194399 (= res!794707 (and (= (size!37803 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37802 _keys!1208) (size!37803 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1194400 () Bool)

(assert (=> b!1194400 (= e!678773 tp_is_empty!30259)))

(assert (= (and start!100156 res!794703) b!1194394))

(assert (= (and b!1194394 res!794706) b!1194399))

(assert (= (and b!1194399 res!794707) b!1194392))

(assert (= (and b!1194392 res!794712) b!1194393))

(assert (= (and b!1194393 res!794709) b!1194395))

(assert (= (and b!1194395 res!794711) b!1194398))

(assert (= (and b!1194398 res!794710) b!1194387))

(assert (= (and b!1194387 res!794702) b!1194389))

(assert (= (and b!1194389 res!794705) b!1194390))

(assert (= (and b!1194390 res!794704) b!1194391))

(assert (= (and b!1194391 res!794708) b!1194396))

(assert (= (and b!1194397 condMapEmpty!47219) mapIsEmpty!47219))

(assert (= (and b!1194397 (not condMapEmpty!47219)) mapNonEmpty!47219))

(get-info :version)

(assert (= (and mapNonEmpty!47219 ((_ is ValueCellFull!14420) mapValue!47219)) b!1194388))

(assert (= (and b!1194397 ((_ is ValueCellFull!14420) mapDefault!47219)) b!1194400))

(assert (= start!100156 b!1194397))

(declare-fun m!1101783 () Bool)

(assert (=> b!1194398 m!1101783))

(declare-fun m!1101785 () Bool)

(assert (=> b!1194387 m!1101785))

(declare-fun m!1101787 () Bool)

(assert (=> b!1194394 m!1101787))

(declare-fun m!1101789 () Bool)

(assert (=> b!1194389 m!1101789))

(declare-fun m!1101791 () Bool)

(assert (=> b!1194389 m!1101791))

(declare-fun m!1101793 () Bool)

(assert (=> b!1194392 m!1101793))

(declare-fun m!1101795 () Bool)

(assert (=> b!1194393 m!1101795))

(declare-fun m!1101797 () Bool)

(assert (=> b!1194396 m!1101797))

(declare-fun m!1101799 () Bool)

(assert (=> b!1194390 m!1101799))

(declare-fun m!1101801 () Bool)

(assert (=> start!100156 m!1101801))

(declare-fun m!1101803 () Bool)

(assert (=> start!100156 m!1101803))

(declare-fun m!1101805 () Bool)

(assert (=> mapNonEmpty!47219 m!1101805))

(check-sat (not b!1194393) (not start!100156) (not b!1194394) (not b!1194398) (not b!1194392) (not b!1194396) (not b!1194390) (not mapNonEmpty!47219) tp_is_empty!30259 (not b!1194389))
(check-sat)
(get-model)

(declare-fun bm!57120 () Bool)

(declare-fun call!57123 () Bool)

(assert (=> bm!57120 (= call!57123 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1194493 () Bool)

(declare-fun e!678818 () Bool)

(assert (=> b!1194493 (= e!678818 call!57123)))

(declare-fun d!132123 () Bool)

(declare-fun res!794784 () Bool)

(declare-fun e!678817 () Bool)

(assert (=> d!132123 (=> res!794784 e!678817)))

(assert (=> d!132123 (= res!794784 (bvsge #b00000000000000000000000000000000 (size!37802 _keys!1208)))))

(assert (=> d!132123 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!678817)))

(declare-fun b!1194494 () Bool)

(declare-fun e!678816 () Bool)

(assert (=> b!1194494 (= e!678816 call!57123)))

(declare-fun b!1194495 () Bool)

(assert (=> b!1194495 (= e!678818 e!678816)))

(declare-fun lt!542602 () (_ BitVec 64))

(assert (=> b!1194495 (= lt!542602 (select (arr!37264 _keys!1208) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!39477 0))(
  ( (Unit!39478) )
))
(declare-fun lt!542603 () Unit!39477)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77230 (_ BitVec 64) (_ BitVec 32)) Unit!39477)

(assert (=> b!1194495 (= lt!542603 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!542602 #b00000000000000000000000000000000))))

(assert (=> b!1194495 (arrayContainsKey!0 _keys!1208 lt!542602 #b00000000000000000000000000000000)))

(declare-fun lt!542604 () Unit!39477)

(assert (=> b!1194495 (= lt!542604 lt!542603)))

(declare-fun res!794783 () Bool)

(declare-datatypes ((SeekEntryResult!9928 0))(
  ( (MissingZero!9928 (index!42083 (_ BitVec 32))) (Found!9928 (index!42084 (_ BitVec 32))) (Intermediate!9928 (undefined!10740 Bool) (index!42085 (_ BitVec 32)) (x!105653 (_ BitVec 32))) (Undefined!9928) (MissingVacant!9928 (index!42086 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!77230 (_ BitVec 32)) SeekEntryResult!9928)

(assert (=> b!1194495 (= res!794783 (= (seekEntryOrOpen!0 (select (arr!37264 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9928 #b00000000000000000000000000000000)))))

(assert (=> b!1194495 (=> (not res!794783) (not e!678816))))

(declare-fun b!1194496 () Bool)

(assert (=> b!1194496 (= e!678817 e!678818)))

(declare-fun c!117294 () Bool)

(assert (=> b!1194496 (= c!117294 (validKeyInArray!0 (select (arr!37264 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!132123 (not res!794784)) b!1194496))

(assert (= (and b!1194496 c!117294) b!1194495))

(assert (= (and b!1194496 (not c!117294)) b!1194493))

(assert (= (and b!1194495 res!794783) b!1194494))

(assert (= (or b!1194494 b!1194493) bm!57120))

(declare-fun m!1101855 () Bool)

(assert (=> bm!57120 m!1101855))

(declare-fun m!1101857 () Bool)

(assert (=> b!1194495 m!1101857))

(declare-fun m!1101859 () Bool)

(assert (=> b!1194495 m!1101859))

(declare-fun m!1101861 () Bool)

(assert (=> b!1194495 m!1101861))

(assert (=> b!1194495 m!1101857))

(declare-fun m!1101863 () Bool)

(assert (=> b!1194495 m!1101863))

(assert (=> b!1194496 m!1101857))

(assert (=> b!1194496 m!1101857))

(declare-fun m!1101865 () Bool)

(assert (=> b!1194496 m!1101865))

(assert (=> b!1194392 d!132123))

(declare-fun d!132125 () Bool)

(declare-fun res!794789 () Bool)

(declare-fun e!678823 () Bool)

(assert (=> d!132125 (=> res!794789 e!678823)))

(assert (=> d!132125 (= res!794789 (= (select (arr!37264 _keys!1208) i!673) k0!934))))

(assert (=> d!132125 (= (arrayContainsKey!0 _keys!1208 k0!934 i!673) e!678823)))

(declare-fun b!1194501 () Bool)

(declare-fun e!678824 () Bool)

(assert (=> b!1194501 (= e!678823 e!678824)))

(declare-fun res!794790 () Bool)

(assert (=> b!1194501 (=> (not res!794790) (not e!678824))))

(assert (=> b!1194501 (= res!794790 (bvslt (bvadd i!673 #b00000000000000000000000000000001) (size!37802 _keys!1208)))))

(declare-fun b!1194502 () Bool)

(assert (=> b!1194502 (= e!678824 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd i!673 #b00000000000000000000000000000001)))))

(assert (= (and d!132125 (not res!794789)) b!1194501))

(assert (= (and b!1194501 res!794790) b!1194502))

(assert (=> d!132125 m!1101785))

(declare-fun m!1101867 () Bool)

(assert (=> b!1194502 m!1101867))

(assert (=> b!1194396 d!132125))

(declare-fun b!1194513 () Bool)

(declare-fun e!678836 () Bool)

(declare-fun call!57126 () Bool)

(assert (=> b!1194513 (= e!678836 call!57126)))

(declare-fun bm!57123 () Bool)

(declare-fun c!117297 () Bool)

(assert (=> bm!57123 (= call!57126 (arrayNoDuplicates!0 lt!542589 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!117297 (Cons!26333 (select (arr!37264 lt!542589) #b00000000000000000000000000000000) Nil!26334) Nil!26334)))))

(declare-fun b!1194515 () Bool)

(declare-fun e!678833 () Bool)

(declare-fun e!678834 () Bool)

(assert (=> b!1194515 (= e!678833 e!678834)))

(declare-fun res!794799 () Bool)

(assert (=> b!1194515 (=> (not res!794799) (not e!678834))))

(declare-fun e!678835 () Bool)

(assert (=> b!1194515 (= res!794799 (not e!678835))))

(declare-fun res!794797 () Bool)

(assert (=> b!1194515 (=> (not res!794797) (not e!678835))))

(assert (=> b!1194515 (= res!794797 (validKeyInArray!0 (select (arr!37264 lt!542589) #b00000000000000000000000000000000)))))

(declare-fun b!1194516 () Bool)

(assert (=> b!1194516 (= e!678836 call!57126)))

(declare-fun b!1194517 () Bool)

(declare-fun contains!6842 (List!26337 (_ BitVec 64)) Bool)

(assert (=> b!1194517 (= e!678835 (contains!6842 Nil!26334 (select (arr!37264 lt!542589) #b00000000000000000000000000000000)))))

(declare-fun b!1194514 () Bool)

(assert (=> b!1194514 (= e!678834 e!678836)))

(assert (=> b!1194514 (= c!117297 (validKeyInArray!0 (select (arr!37264 lt!542589) #b00000000000000000000000000000000)))))

(declare-fun d!132127 () Bool)

(declare-fun res!794798 () Bool)

(assert (=> d!132127 (=> res!794798 e!678833)))

(assert (=> d!132127 (= res!794798 (bvsge #b00000000000000000000000000000000 (size!37802 lt!542589)))))

(assert (=> d!132127 (= (arrayNoDuplicates!0 lt!542589 #b00000000000000000000000000000000 Nil!26334) e!678833)))

(assert (= (and d!132127 (not res!794798)) b!1194515))

(assert (= (and b!1194515 res!794797) b!1194517))

(assert (= (and b!1194515 res!794799) b!1194514))

(assert (= (and b!1194514 c!117297) b!1194513))

(assert (= (and b!1194514 (not c!117297)) b!1194516))

(assert (= (or b!1194513 b!1194516) bm!57123))

(declare-fun m!1101869 () Bool)

(assert (=> bm!57123 m!1101869))

(declare-fun m!1101871 () Bool)

(assert (=> bm!57123 m!1101871))

(assert (=> b!1194515 m!1101869))

(assert (=> b!1194515 m!1101869))

(declare-fun m!1101873 () Bool)

(assert (=> b!1194515 m!1101873))

(assert (=> b!1194517 m!1101869))

(assert (=> b!1194517 m!1101869))

(declare-fun m!1101875 () Bool)

(assert (=> b!1194517 m!1101875))

(assert (=> b!1194514 m!1101869))

(assert (=> b!1194514 m!1101869))

(assert (=> b!1194514 m!1101873))

(assert (=> b!1194390 d!132127))

(declare-fun d!132129 () Bool)

(assert (=> d!132129 (= (array_inv!28528 _keys!1208) (bvsge (size!37802 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!100156 d!132129))

(declare-fun d!132131 () Bool)

(assert (=> d!132131 (= (array_inv!28529 _values!996) (bvsge (size!37803 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!100156 d!132131))

(declare-fun bm!57124 () Bool)

(declare-fun call!57127 () Bool)

(assert (=> bm!57124 (= call!57127 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!542589 mask!1564))))

(declare-fun b!1194518 () Bool)

(declare-fun e!678839 () Bool)

(assert (=> b!1194518 (= e!678839 call!57127)))

(declare-fun d!132133 () Bool)

(declare-fun res!794801 () Bool)

(declare-fun e!678838 () Bool)

(assert (=> d!132133 (=> res!794801 e!678838)))

(assert (=> d!132133 (= res!794801 (bvsge #b00000000000000000000000000000000 (size!37802 lt!542589)))))

(assert (=> d!132133 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542589 mask!1564) e!678838)))

(declare-fun b!1194519 () Bool)

(declare-fun e!678837 () Bool)

(assert (=> b!1194519 (= e!678837 call!57127)))

(declare-fun b!1194520 () Bool)

(assert (=> b!1194520 (= e!678839 e!678837)))

(declare-fun lt!542605 () (_ BitVec 64))

(assert (=> b!1194520 (= lt!542605 (select (arr!37264 lt!542589) #b00000000000000000000000000000000))))

(declare-fun lt!542606 () Unit!39477)

(assert (=> b!1194520 (= lt!542606 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!542589 lt!542605 #b00000000000000000000000000000000))))

(assert (=> b!1194520 (arrayContainsKey!0 lt!542589 lt!542605 #b00000000000000000000000000000000)))

(declare-fun lt!542607 () Unit!39477)

(assert (=> b!1194520 (= lt!542607 lt!542606)))

(declare-fun res!794800 () Bool)

(assert (=> b!1194520 (= res!794800 (= (seekEntryOrOpen!0 (select (arr!37264 lt!542589) #b00000000000000000000000000000000) lt!542589 mask!1564) (Found!9928 #b00000000000000000000000000000000)))))

(assert (=> b!1194520 (=> (not res!794800) (not e!678837))))

(declare-fun b!1194521 () Bool)

(assert (=> b!1194521 (= e!678838 e!678839)))

(declare-fun c!117298 () Bool)

(assert (=> b!1194521 (= c!117298 (validKeyInArray!0 (select (arr!37264 lt!542589) #b00000000000000000000000000000000)))))

(assert (= (and d!132133 (not res!794801)) b!1194521))

(assert (= (and b!1194521 c!117298) b!1194520))

(assert (= (and b!1194521 (not c!117298)) b!1194518))

(assert (= (and b!1194520 res!794800) b!1194519))

(assert (= (or b!1194519 b!1194518) bm!57124))

(declare-fun m!1101877 () Bool)

(assert (=> bm!57124 m!1101877))

(assert (=> b!1194520 m!1101869))

(declare-fun m!1101879 () Bool)

(assert (=> b!1194520 m!1101879))

(declare-fun m!1101881 () Bool)

(assert (=> b!1194520 m!1101881))

(assert (=> b!1194520 m!1101869))

(declare-fun m!1101883 () Bool)

(assert (=> b!1194520 m!1101883))

(assert (=> b!1194521 m!1101869))

(assert (=> b!1194521 m!1101869))

(assert (=> b!1194521 m!1101873))

(assert (=> b!1194389 d!132133))

(declare-fun d!132135 () Bool)

(assert (=> d!132135 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1194394 d!132135))

(declare-fun b!1194522 () Bool)

(declare-fun e!678843 () Bool)

(declare-fun call!57128 () Bool)

(assert (=> b!1194522 (= e!678843 call!57128)))

(declare-fun bm!57125 () Bool)

(declare-fun c!117299 () Bool)

(assert (=> bm!57125 (= call!57128 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!117299 (Cons!26333 (select (arr!37264 _keys!1208) #b00000000000000000000000000000000) Nil!26334) Nil!26334)))))

(declare-fun b!1194524 () Bool)

(declare-fun e!678840 () Bool)

(declare-fun e!678841 () Bool)

(assert (=> b!1194524 (= e!678840 e!678841)))

(declare-fun res!794804 () Bool)

(assert (=> b!1194524 (=> (not res!794804) (not e!678841))))

(declare-fun e!678842 () Bool)

(assert (=> b!1194524 (= res!794804 (not e!678842))))

(declare-fun res!794802 () Bool)

(assert (=> b!1194524 (=> (not res!794802) (not e!678842))))

(assert (=> b!1194524 (= res!794802 (validKeyInArray!0 (select (arr!37264 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1194525 () Bool)

(assert (=> b!1194525 (= e!678843 call!57128)))

(declare-fun b!1194526 () Bool)

(assert (=> b!1194526 (= e!678842 (contains!6842 Nil!26334 (select (arr!37264 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1194523 () Bool)

(assert (=> b!1194523 (= e!678841 e!678843)))

(assert (=> b!1194523 (= c!117299 (validKeyInArray!0 (select (arr!37264 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!132137 () Bool)

(declare-fun res!794803 () Bool)

(assert (=> d!132137 (=> res!794803 e!678840)))

(assert (=> d!132137 (= res!794803 (bvsge #b00000000000000000000000000000000 (size!37802 _keys!1208)))))

(assert (=> d!132137 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26334) e!678840)))

(assert (= (and d!132137 (not res!794803)) b!1194524))

(assert (= (and b!1194524 res!794802) b!1194526))

(assert (= (and b!1194524 res!794804) b!1194523))

(assert (= (and b!1194523 c!117299) b!1194522))

(assert (= (and b!1194523 (not c!117299)) b!1194525))

(assert (= (or b!1194522 b!1194525) bm!57125))

(assert (=> bm!57125 m!1101857))

(declare-fun m!1101885 () Bool)

(assert (=> bm!57125 m!1101885))

(assert (=> b!1194524 m!1101857))

(assert (=> b!1194524 m!1101857))

(assert (=> b!1194524 m!1101865))

(assert (=> b!1194526 m!1101857))

(assert (=> b!1194526 m!1101857))

(declare-fun m!1101887 () Bool)

(assert (=> b!1194526 m!1101887))

(assert (=> b!1194523 m!1101857))

(assert (=> b!1194523 m!1101857))

(assert (=> b!1194523 m!1101865))

(assert (=> b!1194393 d!132137))

(declare-fun d!132139 () Bool)

(assert (=> d!132139 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1194398 d!132139))

(declare-fun mapNonEmpty!47228 () Bool)

(declare-fun mapRes!47228 () Bool)

(declare-fun tp!89838 () Bool)

(declare-fun e!678848 () Bool)

(assert (=> mapNonEmpty!47228 (= mapRes!47228 (and tp!89838 e!678848))))

(declare-fun mapRest!47228 () (Array (_ BitVec 32) ValueCell!14420))

(declare-fun mapKey!47228 () (_ BitVec 32))

(declare-fun mapValue!47228 () ValueCell!14420)

(assert (=> mapNonEmpty!47228 (= mapRest!47219 (store mapRest!47228 mapKey!47228 mapValue!47228))))

(declare-fun b!1194534 () Bool)

(declare-fun e!678849 () Bool)

(assert (=> b!1194534 (= e!678849 tp_is_empty!30259)))

(declare-fun mapIsEmpty!47228 () Bool)

(assert (=> mapIsEmpty!47228 mapRes!47228))

(declare-fun b!1194533 () Bool)

(assert (=> b!1194533 (= e!678848 tp_is_empty!30259)))

(declare-fun condMapEmpty!47228 () Bool)

(declare-fun mapDefault!47228 () ValueCell!14420)

(assert (=> mapNonEmpty!47219 (= condMapEmpty!47228 (= mapRest!47219 ((as const (Array (_ BitVec 32) ValueCell!14420)) mapDefault!47228)))))

(assert (=> mapNonEmpty!47219 (= tp!89829 (and e!678849 mapRes!47228))))

(assert (= (and mapNonEmpty!47219 condMapEmpty!47228) mapIsEmpty!47228))

(assert (= (and mapNonEmpty!47219 (not condMapEmpty!47228)) mapNonEmpty!47228))

(assert (= (and mapNonEmpty!47228 ((_ is ValueCellFull!14420) mapValue!47228)) b!1194533))

(assert (= (and mapNonEmpty!47219 ((_ is ValueCellFull!14420) mapDefault!47228)) b!1194534))

(declare-fun m!1101889 () Bool)

(assert (=> mapNonEmpty!47228 m!1101889))

(check-sat (not bm!57124) (not b!1194495) (not b!1194526) (not b!1194523) (not bm!57123) (not bm!57125) (not b!1194524) (not mapNonEmpty!47228) (not b!1194502) (not b!1194514) (not b!1194515) (not b!1194517) (not bm!57120) tp_is_empty!30259 (not b!1194496) (not b!1194521) (not b!1194520))
(check-sat)
