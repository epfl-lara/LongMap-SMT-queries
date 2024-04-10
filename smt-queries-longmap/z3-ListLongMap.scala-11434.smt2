; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133392 () Bool)

(assert start!133392)

(declare-fun res!1066421 () Bool)

(declare-fun e!868948 () Bool)

(assert (=> start!133392 (=> (not res!1066421) (not e!868948))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133392 (= res!1066421 (validMask!0 mask!947))))

(assert (=> start!133392 e!868948))

(assert (=> start!133392 true))

(declare-datatypes ((V!59523 0))(
  ( (V!59524 (val!19327 Int)) )
))
(declare-datatypes ((ValueCell!18213 0))(
  ( (ValueCellFull!18213 (v!22078 V!59523)) (EmptyCell!18213) )
))
(declare-datatypes ((array!103698 0))(
  ( (array!103699 (arr!50042 (Array (_ BitVec 32) ValueCell!18213)) (size!50592 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103698)

(declare-fun e!868949 () Bool)

(declare-fun array_inv!38899 (array!103698) Bool)

(assert (=> start!133392 (and (array_inv!38899 _values!487) e!868949)))

(declare-datatypes ((array!103700 0))(
  ( (array!103701 (arr!50043 (Array (_ BitVec 32) (_ BitVec 64))) (size!50593 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103700)

(declare-fun array_inv!38900 (array!103700) Bool)

(assert (=> start!133392 (array_inv!38900 _keys!637)))

(declare-fun b!1559486 () Bool)

(declare-fun res!1066420 () Bool)

(assert (=> b!1559486 (=> (not res!1066420) (not e!868948))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103700 (_ BitVec 32)) Bool)

(assert (=> b!1559486 (= res!1066420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1559487 () Bool)

(declare-fun e!868951 () Bool)

(declare-datatypes ((List!36347 0))(
  ( (Nil!36344) (Cons!36343 (h!37789 (_ BitVec 64)) (t!51080 List!36347)) )
))
(declare-fun contains!10220 (List!36347 (_ BitVec 64)) Bool)

(assert (=> b!1559487 (= e!868951 (contains!10220 Nil!36344 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1559488 () Bool)

(declare-fun res!1066419 () Bool)

(assert (=> b!1559488 (=> (not res!1066419) (not e!868948))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1559488 (= res!1066419 (and (= (size!50592 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50593 _keys!637) (size!50592 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1559489 () Bool)

(declare-fun res!1066423 () Bool)

(assert (=> b!1559489 (=> (not res!1066423) (not e!868948))))

(assert (=> b!1559489 (= res!1066423 (and (bvsle #b00000000000000000000000000000000 (size!50593 _keys!637)) (bvslt (size!50593 _keys!637) #b01111111111111111111111111111111)))))

(declare-fun b!1559490 () Bool)

(declare-fun e!868947 () Bool)

(declare-fun tp_is_empty!38487 () Bool)

(assert (=> b!1559490 (= e!868947 tp_is_empty!38487)))

(declare-fun b!1559491 () Bool)

(declare-fun mapRes!59103 () Bool)

(assert (=> b!1559491 (= e!868949 (and e!868947 mapRes!59103))))

(declare-fun condMapEmpty!59103 () Bool)

(declare-fun mapDefault!59103 () ValueCell!18213)

(assert (=> b!1559491 (= condMapEmpty!59103 (= (arr!50042 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18213)) mapDefault!59103)))))

(declare-fun b!1559492 () Bool)

(assert (=> b!1559492 (= e!868948 e!868951)))

(declare-fun res!1066418 () Bool)

(assert (=> b!1559492 (=> res!1066418 e!868951)))

(assert (=> b!1559492 (= res!1066418 (contains!10220 Nil!36344 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!59103 () Bool)

(assert (=> mapIsEmpty!59103 mapRes!59103))

(declare-fun b!1559493 () Bool)

(declare-fun e!868952 () Bool)

(assert (=> b!1559493 (= e!868952 tp_is_empty!38487)))

(declare-fun mapNonEmpty!59103 () Bool)

(declare-fun tp!112758 () Bool)

(assert (=> mapNonEmpty!59103 (= mapRes!59103 (and tp!112758 e!868952))))

(declare-fun mapKey!59103 () (_ BitVec 32))

(declare-fun mapValue!59103 () ValueCell!18213)

(declare-fun mapRest!59103 () (Array (_ BitVec 32) ValueCell!18213))

(assert (=> mapNonEmpty!59103 (= (arr!50042 _values!487) (store mapRest!59103 mapKey!59103 mapValue!59103))))

(declare-fun b!1559494 () Bool)

(declare-fun res!1066422 () Bool)

(assert (=> b!1559494 (=> (not res!1066422) (not e!868948))))

(declare-fun noDuplicate!2640 (List!36347) Bool)

(assert (=> b!1559494 (= res!1066422 (noDuplicate!2640 Nil!36344))))

(assert (= (and start!133392 res!1066421) b!1559488))

(assert (= (and b!1559488 res!1066419) b!1559486))

(assert (= (and b!1559486 res!1066420) b!1559489))

(assert (= (and b!1559489 res!1066423) b!1559494))

(assert (= (and b!1559494 res!1066422) b!1559492))

(assert (= (and b!1559492 (not res!1066418)) b!1559487))

(assert (= (and b!1559491 condMapEmpty!59103) mapIsEmpty!59103))

(assert (= (and b!1559491 (not condMapEmpty!59103)) mapNonEmpty!59103))

(get-info :version)

(assert (= (and mapNonEmpty!59103 ((_ is ValueCellFull!18213) mapValue!59103)) b!1559493))

(assert (= (and b!1559491 ((_ is ValueCellFull!18213) mapDefault!59103)) b!1559490))

(assert (= start!133392 b!1559491))

(declare-fun m!1435705 () Bool)

(assert (=> mapNonEmpty!59103 m!1435705))

(declare-fun m!1435707 () Bool)

(assert (=> b!1559486 m!1435707))

(declare-fun m!1435709 () Bool)

(assert (=> b!1559492 m!1435709))

(declare-fun m!1435711 () Bool)

(assert (=> b!1559494 m!1435711))

(declare-fun m!1435713 () Bool)

(assert (=> b!1559487 m!1435713))

(declare-fun m!1435715 () Bool)

(assert (=> start!133392 m!1435715))

(declare-fun m!1435717 () Bool)

(assert (=> start!133392 m!1435717))

(declare-fun m!1435719 () Bool)

(assert (=> start!133392 m!1435719))

(check-sat (not b!1559487) tp_is_empty!38487 (not b!1559486) (not b!1559494) (not b!1559492) (not mapNonEmpty!59103) (not start!133392))
(check-sat)
(get-model)

(declare-fun d!162935 () Bool)

(assert (=> d!162935 (= (validMask!0 mask!947) (and (or (= mask!947 #b00000000000000000000000000000111) (= mask!947 #b00000000000000000000000000001111) (= mask!947 #b00000000000000000000000000011111) (= mask!947 #b00000000000000000000000000111111) (= mask!947 #b00000000000000000000000001111111) (= mask!947 #b00000000000000000000000011111111) (= mask!947 #b00000000000000000000000111111111) (= mask!947 #b00000000000000000000001111111111) (= mask!947 #b00000000000000000000011111111111) (= mask!947 #b00000000000000000000111111111111) (= mask!947 #b00000000000000000001111111111111) (= mask!947 #b00000000000000000011111111111111) (= mask!947 #b00000000000000000111111111111111) (= mask!947 #b00000000000000001111111111111111) (= mask!947 #b00000000000000011111111111111111) (= mask!947 #b00000000000000111111111111111111) (= mask!947 #b00000000000001111111111111111111) (= mask!947 #b00000000000011111111111111111111) (= mask!947 #b00000000000111111111111111111111) (= mask!947 #b00000000001111111111111111111111) (= mask!947 #b00000000011111111111111111111111) (= mask!947 #b00000000111111111111111111111111) (= mask!947 #b00000001111111111111111111111111) (= mask!947 #b00000011111111111111111111111111) (= mask!947 #b00000111111111111111111111111111) (= mask!947 #b00001111111111111111111111111111) (= mask!947 #b00011111111111111111111111111111) (= mask!947 #b00111111111111111111111111111111)) (bvsle mask!947 #b00111111111111111111111111111111)))))

(assert (=> start!133392 d!162935))

(declare-fun d!162937 () Bool)

(assert (=> d!162937 (= (array_inv!38899 _values!487) (bvsge (size!50592 _values!487) #b00000000000000000000000000000000))))

(assert (=> start!133392 d!162937))

(declare-fun d!162939 () Bool)

(assert (=> d!162939 (= (array_inv!38900 _keys!637) (bvsge (size!50593 _keys!637) #b00000000000000000000000000000000))))

(assert (=> start!133392 d!162939))

(declare-fun d!162941 () Bool)

(declare-fun res!1066446 () Bool)

(declare-fun e!868975 () Bool)

(assert (=> d!162941 (=> res!1066446 e!868975)))

(assert (=> d!162941 (= res!1066446 ((_ is Nil!36344) Nil!36344))))

(assert (=> d!162941 (= (noDuplicate!2640 Nil!36344) e!868975)))

(declare-fun b!1559526 () Bool)

(declare-fun e!868976 () Bool)

(assert (=> b!1559526 (= e!868975 e!868976)))

(declare-fun res!1066447 () Bool)

(assert (=> b!1559526 (=> (not res!1066447) (not e!868976))))

(assert (=> b!1559526 (= res!1066447 (not (contains!10220 (t!51080 Nil!36344) (h!37789 Nil!36344))))))

(declare-fun b!1559527 () Bool)

(assert (=> b!1559527 (= e!868976 (noDuplicate!2640 (t!51080 Nil!36344)))))

(assert (= (and d!162941 (not res!1066446)) b!1559526))

(assert (= (and b!1559526 res!1066447) b!1559527))

(declare-fun m!1435737 () Bool)

(assert (=> b!1559526 m!1435737))

(declare-fun m!1435739 () Bool)

(assert (=> b!1559527 m!1435739))

(assert (=> b!1559494 d!162941))

(declare-fun b!1559536 () Bool)

(declare-fun e!868984 () Bool)

(declare-fun e!868983 () Bool)

(assert (=> b!1559536 (= e!868984 e!868983)))

(declare-fun lt!670886 () (_ BitVec 64))

(assert (=> b!1559536 (= lt!670886 (select (arr!50043 _keys!637) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51900 0))(
  ( (Unit!51901) )
))
(declare-fun lt!670884 () Unit!51900)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!103700 (_ BitVec 64) (_ BitVec 32)) Unit!51900)

(assert (=> b!1559536 (= lt!670884 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!670886 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!103700 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1559536 (arrayContainsKey!0 _keys!637 lt!670886 #b00000000000000000000000000000000)))

(declare-fun lt!670885 () Unit!51900)

(assert (=> b!1559536 (= lt!670885 lt!670884)))

(declare-fun res!1066452 () Bool)

(declare-datatypes ((SeekEntryResult!13520 0))(
  ( (MissingZero!13520 (index!56478 (_ BitVec 32))) (Found!13520 (index!56479 (_ BitVec 32))) (Intermediate!13520 (undefined!14332 Bool) (index!56480 (_ BitVec 32)) (x!139786 (_ BitVec 32))) (Undefined!13520) (MissingVacant!13520 (index!56481 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!103700 (_ BitVec 32)) SeekEntryResult!13520)

(assert (=> b!1559536 (= res!1066452 (= (seekEntryOrOpen!0 (select (arr!50043 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) (Found!13520 #b00000000000000000000000000000000)))))

(assert (=> b!1559536 (=> (not res!1066452) (not e!868983))))

(declare-fun b!1559537 () Bool)

(declare-fun call!71844 () Bool)

(assert (=> b!1559537 (= e!868984 call!71844)))

(declare-fun d!162943 () Bool)

(declare-fun res!1066453 () Bool)

(declare-fun e!868985 () Bool)

(assert (=> d!162943 (=> res!1066453 e!868985)))

(assert (=> d!162943 (= res!1066453 (bvsge #b00000000000000000000000000000000 (size!50593 _keys!637)))))

(assert (=> d!162943 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947) e!868985)))

(declare-fun bm!71841 () Bool)

(assert (=> bm!71841 (= call!71844 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!637 mask!947))))

(declare-fun b!1559538 () Bool)

(assert (=> b!1559538 (= e!868983 call!71844)))

(declare-fun b!1559539 () Bool)

(assert (=> b!1559539 (= e!868985 e!868984)))

(declare-fun c!144224 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1559539 (= c!144224 (validKeyInArray!0 (select (arr!50043 _keys!637) #b00000000000000000000000000000000)))))

(assert (= (and d!162943 (not res!1066453)) b!1559539))

(assert (= (and b!1559539 c!144224) b!1559536))

(assert (= (and b!1559539 (not c!144224)) b!1559537))

(assert (= (and b!1559536 res!1066452) b!1559538))

(assert (= (or b!1559538 b!1559537) bm!71841))

(declare-fun m!1435741 () Bool)

(assert (=> b!1559536 m!1435741))

(declare-fun m!1435743 () Bool)

(assert (=> b!1559536 m!1435743))

(declare-fun m!1435745 () Bool)

(assert (=> b!1559536 m!1435745))

(assert (=> b!1559536 m!1435741))

(declare-fun m!1435747 () Bool)

(assert (=> b!1559536 m!1435747))

(declare-fun m!1435749 () Bool)

(assert (=> bm!71841 m!1435749))

(assert (=> b!1559539 m!1435741))

(assert (=> b!1559539 m!1435741))

(declare-fun m!1435751 () Bool)

(assert (=> b!1559539 m!1435751))

(assert (=> b!1559486 d!162943))

(declare-fun d!162945 () Bool)

(declare-fun lt!670889 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!808 (List!36347) (InoxSet (_ BitVec 64)))

(assert (=> d!162945 (= lt!670889 (select (content!808 Nil!36344) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!868991 () Bool)

(assert (=> d!162945 (= lt!670889 e!868991)))

(declare-fun res!1066459 () Bool)

(assert (=> d!162945 (=> (not res!1066459) (not e!868991))))

(assert (=> d!162945 (= res!1066459 ((_ is Cons!36343) Nil!36344))))

(assert (=> d!162945 (= (contains!10220 Nil!36344 #b1000000000000000000000000000000000000000000000000000000000000000) lt!670889)))

(declare-fun b!1559544 () Bool)

(declare-fun e!868990 () Bool)

(assert (=> b!1559544 (= e!868991 e!868990)))

(declare-fun res!1066458 () Bool)

(assert (=> b!1559544 (=> res!1066458 e!868990)))

(assert (=> b!1559544 (= res!1066458 (= (h!37789 Nil!36344) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1559545 () Bool)

(assert (=> b!1559545 (= e!868990 (contains!10220 (t!51080 Nil!36344) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!162945 res!1066459) b!1559544))

(assert (= (and b!1559544 (not res!1066458)) b!1559545))

(declare-fun m!1435753 () Bool)

(assert (=> d!162945 m!1435753))

(declare-fun m!1435755 () Bool)

(assert (=> d!162945 m!1435755))

(declare-fun m!1435757 () Bool)

(assert (=> b!1559545 m!1435757))

(assert (=> b!1559487 d!162945))

(declare-fun d!162947 () Bool)

(declare-fun lt!670890 () Bool)

(assert (=> d!162947 (= lt!670890 (select (content!808 Nil!36344) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!868993 () Bool)

(assert (=> d!162947 (= lt!670890 e!868993)))

(declare-fun res!1066461 () Bool)

(assert (=> d!162947 (=> (not res!1066461) (not e!868993))))

(assert (=> d!162947 (= res!1066461 ((_ is Cons!36343) Nil!36344))))

(assert (=> d!162947 (= (contains!10220 Nil!36344 #b0000000000000000000000000000000000000000000000000000000000000000) lt!670890)))

(declare-fun b!1559546 () Bool)

(declare-fun e!868992 () Bool)

(assert (=> b!1559546 (= e!868993 e!868992)))

(declare-fun res!1066460 () Bool)

(assert (=> b!1559546 (=> res!1066460 e!868992)))

(assert (=> b!1559546 (= res!1066460 (= (h!37789 Nil!36344) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1559547 () Bool)

(assert (=> b!1559547 (= e!868992 (contains!10220 (t!51080 Nil!36344) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!162947 res!1066461) b!1559546))

(assert (= (and b!1559546 (not res!1066460)) b!1559547))

(assert (=> d!162947 m!1435753))

(declare-fun m!1435759 () Bool)

(assert (=> d!162947 m!1435759))

(declare-fun m!1435761 () Bool)

(assert (=> b!1559547 m!1435761))

(assert (=> b!1559492 d!162947))

(declare-fun mapIsEmpty!59109 () Bool)

(declare-fun mapRes!59109 () Bool)

(assert (=> mapIsEmpty!59109 mapRes!59109))

(declare-fun mapNonEmpty!59109 () Bool)

(declare-fun tp!112764 () Bool)

(declare-fun e!868998 () Bool)

(assert (=> mapNonEmpty!59109 (= mapRes!59109 (and tp!112764 e!868998))))

(declare-fun mapRest!59109 () (Array (_ BitVec 32) ValueCell!18213))

(declare-fun mapValue!59109 () ValueCell!18213)

(declare-fun mapKey!59109 () (_ BitVec 32))

(assert (=> mapNonEmpty!59109 (= mapRest!59103 (store mapRest!59109 mapKey!59109 mapValue!59109))))

(declare-fun b!1559555 () Bool)

(declare-fun e!868999 () Bool)

(assert (=> b!1559555 (= e!868999 tp_is_empty!38487)))

(declare-fun b!1559554 () Bool)

(assert (=> b!1559554 (= e!868998 tp_is_empty!38487)))

(declare-fun condMapEmpty!59109 () Bool)

(declare-fun mapDefault!59109 () ValueCell!18213)

(assert (=> mapNonEmpty!59103 (= condMapEmpty!59109 (= mapRest!59103 ((as const (Array (_ BitVec 32) ValueCell!18213)) mapDefault!59109)))))

(assert (=> mapNonEmpty!59103 (= tp!112758 (and e!868999 mapRes!59109))))

(assert (= (and mapNonEmpty!59103 condMapEmpty!59109) mapIsEmpty!59109))

(assert (= (and mapNonEmpty!59103 (not condMapEmpty!59109)) mapNonEmpty!59109))

(assert (= (and mapNonEmpty!59109 ((_ is ValueCellFull!18213) mapValue!59109)) b!1559554))

(assert (= (and mapNonEmpty!59103 ((_ is ValueCellFull!18213) mapDefault!59109)) b!1559555))

(declare-fun m!1435763 () Bool)

(assert (=> mapNonEmpty!59109 m!1435763))

(check-sat (not b!1559545) (not d!162945) tp_is_empty!38487 (not b!1559536) (not b!1559539) (not b!1559547) (not b!1559527) (not mapNonEmpty!59109) (not b!1559526) (not d!162947) (not bm!71841))
(check-sat)
