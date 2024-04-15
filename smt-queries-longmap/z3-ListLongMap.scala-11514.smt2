; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133996 () Bool)

(assert start!133996)

(declare-fun b!1566392 () Bool)

(declare-fun e!873100 () Bool)

(declare-datatypes ((array!104548 0))(
  ( (array!104549 (arr!50461 (Array (_ BitVec 32) (_ BitVec 64))) (size!51013 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104548)

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1566392 (= e!873100 (bvsge (bvsub (size!51013 _keys!637) from!782) (bvsub (bvadd #b00000000000000000000000000000001 (size!51013 _keys!637)) from!782)))))

(declare-fun b!1566393 () Bool)

(declare-fun res!1070652 () Bool)

(assert (=> b!1566393 (=> (not res!1070652) (not e!873100))))

(assert (=> b!1566393 (= res!1070652 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51013 _keys!637)) (bvslt from!782 (size!51013 _keys!637))))))

(declare-fun b!1566394 () Bool)

(declare-fun e!873098 () Bool)

(declare-fun e!873097 () Bool)

(declare-fun mapRes!59844 () Bool)

(assert (=> b!1566394 (= e!873098 (and e!873097 mapRes!59844))))

(declare-fun condMapEmpty!59844 () Bool)

(declare-datatypes ((V!60161 0))(
  ( (V!60162 (val!19566 Int)) )
))
(declare-datatypes ((ValueCell!18452 0))(
  ( (ValueCellFull!18452 (v!22321 V!60161)) (EmptyCell!18452) )
))
(declare-datatypes ((array!104550 0))(
  ( (array!104551 (arr!50462 (Array (_ BitVec 32) ValueCell!18452)) (size!51014 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104550)

(declare-fun mapDefault!59844 () ValueCell!18452)

(assert (=> b!1566394 (= condMapEmpty!59844 (= (arr!50462 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18452)) mapDefault!59844)))))

(declare-fun b!1566395 () Bool)

(declare-fun res!1070651 () Bool)

(assert (=> b!1566395 (=> (not res!1070651) (not e!873100))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104548 (_ BitVec 32)) Bool)

(assert (=> b!1566395 (= res!1070651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1566396 () Bool)

(declare-fun res!1070653 () Bool)

(assert (=> b!1566396 (=> (not res!1070653) (not e!873100))))

(declare-datatypes ((List!36683 0))(
  ( (Nil!36680) (Cons!36679 (h!38127 (_ BitVec 64)) (t!51579 List!36683)) )
))
(declare-fun arrayNoDuplicates!0 (array!104548 (_ BitVec 32) List!36683) Bool)

(assert (=> b!1566396 (= res!1070653 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36680))))

(declare-fun b!1566397 () Bool)

(declare-fun res!1070655 () Bool)

(assert (=> b!1566397 (=> (not res!1070655) (not e!873100))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1566397 (= res!1070655 (and (= (size!51014 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51013 _keys!637) (size!51014 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun res!1070656 () Bool)

(assert (=> start!133996 (=> (not res!1070656) (not e!873100))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133996 (= res!1070656 (validMask!0 mask!947))))

(assert (=> start!133996 e!873100))

(assert (=> start!133996 true))

(declare-fun array_inv!39413 (array!104548) Bool)

(assert (=> start!133996 (array_inv!39413 _keys!637)))

(declare-fun array_inv!39414 (array!104550) Bool)

(assert (=> start!133996 (and (array_inv!39414 _values!487) e!873098)))

(declare-fun b!1566398 () Bool)

(declare-fun res!1070654 () Bool)

(assert (=> b!1566398 (=> (not res!1070654) (not e!873100))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1566398 (= res!1070654 (not (validKeyInArray!0 (select (arr!50461 _keys!637) from!782))))))

(declare-fun b!1566399 () Bool)

(declare-fun tp_is_empty!38965 () Bool)

(assert (=> b!1566399 (= e!873097 tp_is_empty!38965)))

(declare-fun mapNonEmpty!59844 () Bool)

(declare-fun tp!113878 () Bool)

(declare-fun e!873099 () Bool)

(assert (=> mapNonEmpty!59844 (= mapRes!59844 (and tp!113878 e!873099))))

(declare-fun mapRest!59844 () (Array (_ BitVec 32) ValueCell!18452))

(declare-fun mapKey!59844 () (_ BitVec 32))

(declare-fun mapValue!59844 () ValueCell!18452)

(assert (=> mapNonEmpty!59844 (= (arr!50462 _values!487) (store mapRest!59844 mapKey!59844 mapValue!59844))))

(declare-fun mapIsEmpty!59844 () Bool)

(assert (=> mapIsEmpty!59844 mapRes!59844))

(declare-fun b!1566400 () Bool)

(assert (=> b!1566400 (= e!873099 tp_is_empty!38965)))

(assert (= (and start!133996 res!1070656) b!1566397))

(assert (= (and b!1566397 res!1070655) b!1566395))

(assert (= (and b!1566395 res!1070651) b!1566396))

(assert (= (and b!1566396 res!1070653) b!1566393))

(assert (= (and b!1566393 res!1070652) b!1566398))

(assert (= (and b!1566398 res!1070654) b!1566392))

(assert (= (and b!1566394 condMapEmpty!59844) mapIsEmpty!59844))

(assert (= (and b!1566394 (not condMapEmpty!59844)) mapNonEmpty!59844))

(get-info :version)

(assert (= (and mapNonEmpty!59844 ((_ is ValueCellFull!18452) mapValue!59844)) b!1566400))

(assert (= (and b!1566394 ((_ is ValueCellFull!18452) mapDefault!59844)) b!1566399))

(assert (= start!133996 b!1566394))

(declare-fun m!1440889 () Bool)

(assert (=> b!1566398 m!1440889))

(assert (=> b!1566398 m!1440889))

(declare-fun m!1440891 () Bool)

(assert (=> b!1566398 m!1440891))

(declare-fun m!1440893 () Bool)

(assert (=> b!1566395 m!1440893))

(declare-fun m!1440895 () Bool)

(assert (=> b!1566396 m!1440895))

(declare-fun m!1440897 () Bool)

(assert (=> start!133996 m!1440897))

(declare-fun m!1440899 () Bool)

(assert (=> start!133996 m!1440899))

(declare-fun m!1440901 () Bool)

(assert (=> start!133996 m!1440901))

(declare-fun m!1440903 () Bool)

(assert (=> mapNonEmpty!59844 m!1440903))

(check-sat tp_is_empty!38965 (not start!133996) (not b!1566396) (not b!1566398) (not mapNonEmpty!59844) (not b!1566395))
(check-sat)
(get-model)

(declare-fun d!163273 () Bool)

(assert (=> d!163273 (= (validKeyInArray!0 (select (arr!50461 _keys!637) from!782)) (and (not (= (select (arr!50461 _keys!637) from!782) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50461 _keys!637) from!782) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1566398 d!163273))

(declare-fun d!163275 () Bool)

(assert (=> d!163275 (= (validMask!0 mask!947) (and (or (= mask!947 #b00000000000000000000000000000111) (= mask!947 #b00000000000000000000000000001111) (= mask!947 #b00000000000000000000000000011111) (= mask!947 #b00000000000000000000000000111111) (= mask!947 #b00000000000000000000000001111111) (= mask!947 #b00000000000000000000000011111111) (= mask!947 #b00000000000000000000000111111111) (= mask!947 #b00000000000000000000001111111111) (= mask!947 #b00000000000000000000011111111111) (= mask!947 #b00000000000000000000111111111111) (= mask!947 #b00000000000000000001111111111111) (= mask!947 #b00000000000000000011111111111111) (= mask!947 #b00000000000000000111111111111111) (= mask!947 #b00000000000000001111111111111111) (= mask!947 #b00000000000000011111111111111111) (= mask!947 #b00000000000000111111111111111111) (= mask!947 #b00000000000001111111111111111111) (= mask!947 #b00000000000011111111111111111111) (= mask!947 #b00000000000111111111111111111111) (= mask!947 #b00000000001111111111111111111111) (= mask!947 #b00000000011111111111111111111111) (= mask!947 #b00000000111111111111111111111111) (= mask!947 #b00000001111111111111111111111111) (= mask!947 #b00000011111111111111111111111111) (= mask!947 #b00000111111111111111111111111111) (= mask!947 #b00001111111111111111111111111111) (= mask!947 #b00011111111111111111111111111111) (= mask!947 #b00111111111111111111111111111111)) (bvsle mask!947 #b00111111111111111111111111111111)))))

(assert (=> start!133996 d!163275))

(declare-fun d!163277 () Bool)

(assert (=> d!163277 (= (array_inv!39413 _keys!637) (bvsge (size!51013 _keys!637) #b00000000000000000000000000000000))))

(assert (=> start!133996 d!163277))

(declare-fun d!163279 () Bool)

(assert (=> d!163279 (= (array_inv!39414 _values!487) (bvsge (size!51014 _values!487) #b00000000000000000000000000000000))))

(assert (=> start!133996 d!163279))

(declare-fun b!1566463 () Bool)

(declare-fun e!873139 () Bool)

(declare-fun call!71883 () Bool)

(assert (=> b!1566463 (= e!873139 call!71883)))

(declare-fun b!1566464 () Bool)

(declare-fun e!873138 () Bool)

(declare-fun e!873137 () Bool)

(assert (=> b!1566464 (= e!873138 e!873137)))

(declare-fun c!144371 () Bool)

(assert (=> b!1566464 (= c!144371 (validKeyInArray!0 (select (arr!50461 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun d!163281 () Bool)

(declare-fun res!1070697 () Bool)

(assert (=> d!163281 (=> res!1070697 e!873138)))

(assert (=> d!163281 (= res!1070697 (bvsge #b00000000000000000000000000000000 (size!51013 _keys!637)))))

(assert (=> d!163281 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947) e!873138)))

(declare-fun bm!71880 () Bool)

(assert (=> bm!71880 (= call!71883 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!637 mask!947))))

(declare-fun b!1566465 () Bool)

(assert (=> b!1566465 (= e!873137 e!873139)))

(declare-fun lt!672517 () (_ BitVec 64))

(assert (=> b!1566465 (= lt!672517 (select (arr!50461 _keys!637) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51865 0))(
  ( (Unit!51866) )
))
(declare-fun lt!672516 () Unit!51865)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!104548 (_ BitVec 64) (_ BitVec 32)) Unit!51865)

(assert (=> b!1566465 (= lt!672516 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!672517 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!104548 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1566465 (arrayContainsKey!0 _keys!637 lt!672517 #b00000000000000000000000000000000)))

(declare-fun lt!672515 () Unit!51865)

(assert (=> b!1566465 (= lt!672515 lt!672516)))

(declare-fun res!1070698 () Bool)

(declare-datatypes ((SeekEntryResult!13527 0))(
  ( (MissingZero!13527 (index!56506 (_ BitVec 32))) (Found!13527 (index!56507 (_ BitVec 32))) (Intermediate!13527 (undefined!14339 Bool) (index!56508 (_ BitVec 32)) (x!140766 (_ BitVec 32))) (Undefined!13527) (MissingVacant!13527 (index!56509 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104548 (_ BitVec 32)) SeekEntryResult!13527)

(assert (=> b!1566465 (= res!1070698 (= (seekEntryOrOpen!0 (select (arr!50461 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) (Found!13527 #b00000000000000000000000000000000)))))

(assert (=> b!1566465 (=> (not res!1070698) (not e!873139))))

(declare-fun b!1566466 () Bool)

(assert (=> b!1566466 (= e!873137 call!71883)))

(assert (= (and d!163281 (not res!1070697)) b!1566464))

(assert (= (and b!1566464 c!144371) b!1566465))

(assert (= (and b!1566464 (not c!144371)) b!1566466))

(assert (= (and b!1566465 res!1070698) b!1566463))

(assert (= (or b!1566463 b!1566466) bm!71880))

(declare-fun m!1440937 () Bool)

(assert (=> b!1566464 m!1440937))

(assert (=> b!1566464 m!1440937))

(declare-fun m!1440939 () Bool)

(assert (=> b!1566464 m!1440939))

(declare-fun m!1440941 () Bool)

(assert (=> bm!71880 m!1440941))

(assert (=> b!1566465 m!1440937))

(declare-fun m!1440943 () Bool)

(assert (=> b!1566465 m!1440943))

(declare-fun m!1440945 () Bool)

(assert (=> b!1566465 m!1440945))

(assert (=> b!1566465 m!1440937))

(declare-fun m!1440947 () Bool)

(assert (=> b!1566465 m!1440947))

(assert (=> b!1566395 d!163281))

(declare-fun b!1566477 () Bool)

(declare-fun e!873150 () Bool)

(declare-fun contains!10309 (List!36683 (_ BitVec 64)) Bool)

(assert (=> b!1566477 (= e!873150 (contains!10309 Nil!36680 (select (arr!50461 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1566478 () Bool)

(declare-fun e!873148 () Bool)

(declare-fun e!873149 () Bool)

(assert (=> b!1566478 (= e!873148 e!873149)))

(declare-fun res!1070707 () Bool)

(assert (=> b!1566478 (=> (not res!1070707) (not e!873149))))

(assert (=> b!1566478 (= res!1070707 (not e!873150))))

(declare-fun res!1070706 () Bool)

(assert (=> b!1566478 (=> (not res!1070706) (not e!873150))))

(assert (=> b!1566478 (= res!1070706 (validKeyInArray!0 (select (arr!50461 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1566479 () Bool)

(declare-fun e!873151 () Bool)

(declare-fun call!71886 () Bool)

(assert (=> b!1566479 (= e!873151 call!71886)))

(declare-fun b!1566480 () Bool)

(assert (=> b!1566480 (= e!873149 e!873151)))

(declare-fun c!144374 () Bool)

(assert (=> b!1566480 (= c!144374 (validKeyInArray!0 (select (arr!50461 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun bm!71883 () Bool)

(assert (=> bm!71883 (= call!71886 (arrayNoDuplicates!0 _keys!637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!144374 (Cons!36679 (select (arr!50461 _keys!637) #b00000000000000000000000000000000) Nil!36680) Nil!36680)))))

(declare-fun b!1566481 () Bool)

(assert (=> b!1566481 (= e!873151 call!71886)))

(declare-fun d!163283 () Bool)

(declare-fun res!1070705 () Bool)

(assert (=> d!163283 (=> res!1070705 e!873148)))

(assert (=> d!163283 (= res!1070705 (bvsge #b00000000000000000000000000000000 (size!51013 _keys!637)))))

(assert (=> d!163283 (= (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36680) e!873148)))

(assert (= (and d!163283 (not res!1070705)) b!1566478))

(assert (= (and b!1566478 res!1070706) b!1566477))

(assert (= (and b!1566478 res!1070707) b!1566480))

(assert (= (and b!1566480 c!144374) b!1566481))

(assert (= (and b!1566480 (not c!144374)) b!1566479))

(assert (= (or b!1566481 b!1566479) bm!71883))

(assert (=> b!1566477 m!1440937))

(assert (=> b!1566477 m!1440937))

(declare-fun m!1440949 () Bool)

(assert (=> b!1566477 m!1440949))

(assert (=> b!1566478 m!1440937))

(assert (=> b!1566478 m!1440937))

(assert (=> b!1566478 m!1440939))

(assert (=> b!1566480 m!1440937))

(assert (=> b!1566480 m!1440937))

(assert (=> b!1566480 m!1440939))

(assert (=> bm!71883 m!1440937))

(declare-fun m!1440951 () Bool)

(assert (=> bm!71883 m!1440951))

(assert (=> b!1566396 d!163283))

(declare-fun mapIsEmpty!59853 () Bool)

(declare-fun mapRes!59853 () Bool)

(assert (=> mapIsEmpty!59853 mapRes!59853))

(declare-fun mapNonEmpty!59853 () Bool)

(declare-fun tp!113887 () Bool)

(declare-fun e!873157 () Bool)

(assert (=> mapNonEmpty!59853 (= mapRes!59853 (and tp!113887 e!873157))))

(declare-fun mapValue!59853 () ValueCell!18452)

(declare-fun mapKey!59853 () (_ BitVec 32))

(declare-fun mapRest!59853 () (Array (_ BitVec 32) ValueCell!18452))

(assert (=> mapNonEmpty!59853 (= mapRest!59844 (store mapRest!59853 mapKey!59853 mapValue!59853))))

(declare-fun b!1566489 () Bool)

(declare-fun e!873156 () Bool)

(assert (=> b!1566489 (= e!873156 tp_is_empty!38965)))

(declare-fun condMapEmpty!59853 () Bool)

(declare-fun mapDefault!59853 () ValueCell!18452)

(assert (=> mapNonEmpty!59844 (= condMapEmpty!59853 (= mapRest!59844 ((as const (Array (_ BitVec 32) ValueCell!18452)) mapDefault!59853)))))

(assert (=> mapNonEmpty!59844 (= tp!113878 (and e!873156 mapRes!59853))))

(declare-fun b!1566488 () Bool)

(assert (=> b!1566488 (= e!873157 tp_is_empty!38965)))

(assert (= (and mapNonEmpty!59844 condMapEmpty!59853) mapIsEmpty!59853))

(assert (= (and mapNonEmpty!59844 (not condMapEmpty!59853)) mapNonEmpty!59853))

(assert (= (and mapNonEmpty!59853 ((_ is ValueCellFull!18452) mapValue!59853)) b!1566488))

(assert (= (and mapNonEmpty!59844 ((_ is ValueCellFull!18452) mapDefault!59853)) b!1566489))

(declare-fun m!1440953 () Bool)

(assert (=> mapNonEmpty!59853 m!1440953))

(check-sat tp_is_empty!38965 (not b!1566477) (not bm!71880) (not b!1566464) (not b!1566478) (not b!1566480) (not mapNonEmpty!59853) (not bm!71883) (not b!1566465))
(check-sat)
