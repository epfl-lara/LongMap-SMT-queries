; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134458 () Bool)

(assert start!134458)

(declare-fun b!1569141 () Bool)

(declare-fun res!1071645 () Bool)

(declare-fun e!874804 () Bool)

(assert (=> b!1569141 (=> (not res!1071645) (not e!874804))))

(declare-datatypes ((array!104740 0))(
  ( (array!104741 (arr!50549 (Array (_ BitVec 32) (_ BitVec 64))) (size!51100 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104740)

(declare-datatypes ((List!36667 0))(
  ( (Nil!36664) (Cons!36663 (h!38128 (_ BitVec 64)) (t!51563 List!36667)) )
))
(declare-fun arrayNoDuplicates!0 (array!104740 (_ BitVec 32) List!36667) Bool)

(assert (=> b!1569141 (= res!1071645 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36664))))

(declare-fun b!1569142 () Bool)

(declare-fun res!1071642 () Bool)

(assert (=> b!1569142 (=> (not res!1071642) (not e!874804))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!60161 0))(
  ( (V!60162 (val!19566 Int)) )
))
(declare-datatypes ((ValueCell!18452 0))(
  ( (ValueCellFull!18452 (v!22317 V!60161)) (EmptyCell!18452) )
))
(declare-datatypes ((array!104742 0))(
  ( (array!104743 (arr!50550 (Array (_ BitVec 32) ValueCell!18452)) (size!51101 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104742)

(assert (=> b!1569142 (= res!1071642 (and (= (size!51101 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51100 _keys!637) (size!51101 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!59844 () Bool)

(declare-fun mapRes!59844 () Bool)

(declare-fun tp!113877 () Bool)

(declare-fun e!874803 () Bool)

(assert (=> mapNonEmpty!59844 (= mapRes!59844 (and tp!113877 e!874803))))

(declare-fun mapKey!59844 () (_ BitVec 32))

(declare-fun mapValue!59844 () ValueCell!18452)

(declare-fun mapRest!59844 () (Array (_ BitVec 32) ValueCell!18452))

(assert (=> mapNonEmpty!59844 (= (arr!50550 _values!487) (store mapRest!59844 mapKey!59844 mapValue!59844))))

(declare-fun b!1569143 () Bool)

(declare-fun res!1071643 () Bool)

(assert (=> b!1569143 (=> (not res!1071643) (not e!874804))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104740 (_ BitVec 32)) Bool)

(assert (=> b!1569143 (= res!1071643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun res!1071640 () Bool)

(assert (=> start!134458 (=> (not res!1071640) (not e!874804))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134458 (= res!1071640 (validMask!0 mask!947))))

(assert (=> start!134458 e!874804))

(assert (=> start!134458 true))

(declare-fun array_inv!39515 (array!104740) Bool)

(assert (=> start!134458 (array_inv!39515 _keys!637)))

(declare-fun e!874806 () Bool)

(declare-fun array_inv!39516 (array!104742) Bool)

(assert (=> start!134458 (and (array_inv!39516 _values!487) e!874806)))

(declare-fun b!1569144 () Bool)

(declare-fun e!874805 () Bool)

(assert (=> b!1569144 (= e!874806 (and e!874805 mapRes!59844))))

(declare-fun condMapEmpty!59844 () Bool)

(declare-fun mapDefault!59844 () ValueCell!18452)

(assert (=> b!1569144 (= condMapEmpty!59844 (= (arr!50550 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18452)) mapDefault!59844)))))

(declare-fun mapIsEmpty!59844 () Bool)

(assert (=> mapIsEmpty!59844 mapRes!59844))

(declare-fun b!1569145 () Bool)

(declare-fun res!1071644 () Bool)

(assert (=> b!1569145 (=> (not res!1071644) (not e!874804))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1569145 (= res!1071644 (not (validKeyInArray!0 (select (arr!50549 _keys!637) from!782))))))

(declare-fun b!1569146 () Bool)

(assert (=> b!1569146 (= e!874804 (bvsge (bvsub (size!51100 _keys!637) from!782) (bvsub (bvadd #b00000000000000000000000000000001 (size!51100 _keys!637)) from!782)))))

(declare-fun b!1569147 () Bool)

(declare-fun tp_is_empty!38965 () Bool)

(assert (=> b!1569147 (= e!874803 tp_is_empty!38965)))

(declare-fun b!1569148 () Bool)

(assert (=> b!1569148 (= e!874805 tp_is_empty!38965)))

(declare-fun b!1569149 () Bool)

(declare-fun res!1071641 () Bool)

(assert (=> b!1569149 (=> (not res!1071641) (not e!874804))))

(assert (=> b!1569149 (= res!1071641 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51100 _keys!637)) (bvslt from!782 (size!51100 _keys!637))))))

(assert (= (and start!134458 res!1071640) b!1569142))

(assert (= (and b!1569142 res!1071642) b!1569143))

(assert (= (and b!1569143 res!1071643) b!1569141))

(assert (= (and b!1569141 res!1071645) b!1569149))

(assert (= (and b!1569149 res!1071641) b!1569145))

(assert (= (and b!1569145 res!1071644) b!1569146))

(assert (= (and b!1569144 condMapEmpty!59844) mapIsEmpty!59844))

(assert (= (and b!1569144 (not condMapEmpty!59844)) mapNonEmpty!59844))

(get-info :version)

(assert (= (and mapNonEmpty!59844 ((_ is ValueCellFull!18452) mapValue!59844)) b!1569147))

(assert (= (and b!1569144 ((_ is ValueCellFull!18452) mapDefault!59844)) b!1569148))

(assert (= start!134458 b!1569144))

(declare-fun m!1444039 () Bool)

(assert (=> b!1569145 m!1444039))

(assert (=> b!1569145 m!1444039))

(declare-fun m!1444041 () Bool)

(assert (=> b!1569145 m!1444041))

(declare-fun m!1444043 () Bool)

(assert (=> mapNonEmpty!59844 m!1444043))

(declare-fun m!1444045 () Bool)

(assert (=> b!1569141 m!1444045))

(declare-fun m!1444047 () Bool)

(assert (=> start!134458 m!1444047))

(declare-fun m!1444049 () Bool)

(assert (=> start!134458 m!1444049))

(declare-fun m!1444051 () Bool)

(assert (=> start!134458 m!1444051))

(declare-fun m!1444053 () Bool)

(assert (=> b!1569143 m!1444053))

(check-sat (not start!134458) (not b!1569145) (not b!1569143) tp_is_empty!38965 (not b!1569141) (not mapNonEmpty!59844))
(check-sat)
(get-model)

(declare-fun d!164227 () Bool)

(assert (=> d!164227 (= (validMask!0 mask!947) (and (or (= mask!947 #b00000000000000000000000000000111) (= mask!947 #b00000000000000000000000000001111) (= mask!947 #b00000000000000000000000000011111) (= mask!947 #b00000000000000000000000000111111) (= mask!947 #b00000000000000000000000001111111) (= mask!947 #b00000000000000000000000011111111) (= mask!947 #b00000000000000000000000111111111) (= mask!947 #b00000000000000000000001111111111) (= mask!947 #b00000000000000000000011111111111) (= mask!947 #b00000000000000000000111111111111) (= mask!947 #b00000000000000000001111111111111) (= mask!947 #b00000000000000000011111111111111) (= mask!947 #b00000000000000000111111111111111) (= mask!947 #b00000000000000001111111111111111) (= mask!947 #b00000000000000011111111111111111) (= mask!947 #b00000000000000111111111111111111) (= mask!947 #b00000000000001111111111111111111) (= mask!947 #b00000000000011111111111111111111) (= mask!947 #b00000000000111111111111111111111) (= mask!947 #b00000000001111111111111111111111) (= mask!947 #b00000000011111111111111111111111) (= mask!947 #b00000000111111111111111111111111) (= mask!947 #b00000001111111111111111111111111) (= mask!947 #b00000011111111111111111111111111) (= mask!947 #b00000111111111111111111111111111) (= mask!947 #b00001111111111111111111111111111) (= mask!947 #b00011111111111111111111111111111) (= mask!947 #b00111111111111111111111111111111)) (bvsle mask!947 #b00111111111111111111111111111111)))))

(assert (=> start!134458 d!164227))

(declare-fun d!164229 () Bool)

(assert (=> d!164229 (= (array_inv!39515 _keys!637) (bvsge (size!51100 _keys!637) #b00000000000000000000000000000000))))

(assert (=> start!134458 d!164229))

(declare-fun d!164231 () Bool)

(assert (=> d!164231 (= (array_inv!39516 _values!487) (bvsge (size!51101 _values!487) #b00000000000000000000000000000000))))

(assert (=> start!134458 d!164231))

(declare-fun bm!72065 () Bool)

(declare-fun call!72068 () Bool)

(declare-fun c!145260 () Bool)

(assert (=> bm!72065 (= call!72068 (arrayNoDuplicates!0 _keys!637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!145260 (Cons!36663 (select (arr!50549 _keys!637) #b00000000000000000000000000000000) Nil!36664) Nil!36664)))))

(declare-fun b!1569214 () Bool)

(declare-fun e!874848 () Bool)

(declare-fun contains!10394 (List!36667 (_ BitVec 64)) Bool)

(assert (=> b!1569214 (= e!874848 (contains!10394 Nil!36664 (select (arr!50549 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1569215 () Bool)

(declare-fun e!874846 () Bool)

(assert (=> b!1569215 (= e!874846 call!72068)))

(declare-fun b!1569216 () Bool)

(declare-fun e!874849 () Bool)

(assert (=> b!1569216 (= e!874849 e!874846)))

(assert (=> b!1569216 (= c!145260 (validKeyInArray!0 (select (arr!50549 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun d!164233 () Bool)

(declare-fun res!1071689 () Bool)

(declare-fun e!874847 () Bool)

(assert (=> d!164233 (=> res!1071689 e!874847)))

(assert (=> d!164233 (= res!1071689 (bvsge #b00000000000000000000000000000000 (size!51100 _keys!637)))))

(assert (=> d!164233 (= (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36664) e!874847)))

(declare-fun b!1569217 () Bool)

(assert (=> b!1569217 (= e!874846 call!72068)))

(declare-fun b!1569218 () Bool)

(assert (=> b!1569218 (= e!874847 e!874849)))

(declare-fun res!1071690 () Bool)

(assert (=> b!1569218 (=> (not res!1071690) (not e!874849))))

(assert (=> b!1569218 (= res!1071690 (not e!874848))))

(declare-fun res!1071688 () Bool)

(assert (=> b!1569218 (=> (not res!1071688) (not e!874848))))

(assert (=> b!1569218 (= res!1071688 (validKeyInArray!0 (select (arr!50549 _keys!637) #b00000000000000000000000000000000)))))

(assert (= (and d!164233 (not res!1071689)) b!1569218))

(assert (= (and b!1569218 res!1071688) b!1569214))

(assert (= (and b!1569218 res!1071690) b!1569216))

(assert (= (and b!1569216 c!145260) b!1569215))

(assert (= (and b!1569216 (not c!145260)) b!1569217))

(assert (= (or b!1569215 b!1569217) bm!72065))

(declare-fun m!1444087 () Bool)

(assert (=> bm!72065 m!1444087))

(declare-fun m!1444089 () Bool)

(assert (=> bm!72065 m!1444089))

(assert (=> b!1569214 m!1444087))

(assert (=> b!1569214 m!1444087))

(declare-fun m!1444091 () Bool)

(assert (=> b!1569214 m!1444091))

(assert (=> b!1569216 m!1444087))

(assert (=> b!1569216 m!1444087))

(declare-fun m!1444093 () Bool)

(assert (=> b!1569216 m!1444093))

(assert (=> b!1569218 m!1444087))

(assert (=> b!1569218 m!1444087))

(assert (=> b!1569218 m!1444093))

(assert (=> b!1569141 d!164233))

(declare-fun d!164235 () Bool)

(assert (=> d!164235 (= (validKeyInArray!0 (select (arr!50549 _keys!637) from!782)) (and (not (= (select (arr!50549 _keys!637) from!782) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50549 _keys!637) from!782) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1569145 d!164235))

(declare-fun b!1569227 () Bool)

(declare-fun e!874857 () Bool)

(declare-fun e!874858 () Bool)

(assert (=> b!1569227 (= e!874857 e!874858)))

(declare-fun c!145263 () Bool)

(assert (=> b!1569227 (= c!145263 (validKeyInArray!0 (select (arr!50549 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun bm!72068 () Bool)

(declare-fun call!72071 () Bool)

(assert (=> bm!72068 (= call!72071 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!637 mask!947))))

(declare-fun b!1569229 () Bool)

(assert (=> b!1569229 (= e!874858 call!72071)))

(declare-fun b!1569230 () Bool)

(declare-fun e!874856 () Bool)

(assert (=> b!1569230 (= e!874856 call!72071)))

(declare-fun b!1569228 () Bool)

(assert (=> b!1569228 (= e!874858 e!874856)))

(declare-fun lt!673710 () (_ BitVec 64))

(assert (=> b!1569228 (= lt!673710 (select (arr!50549 _keys!637) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51962 0))(
  ( (Unit!51963) )
))
(declare-fun lt!673711 () Unit!51962)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!104740 (_ BitVec 64) (_ BitVec 32)) Unit!51962)

(assert (=> b!1569228 (= lt!673711 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!673710 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!104740 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1569228 (arrayContainsKey!0 _keys!637 lt!673710 #b00000000000000000000000000000000)))

(declare-fun lt!673709 () Unit!51962)

(assert (=> b!1569228 (= lt!673709 lt!673711)))

(declare-fun res!1071696 () Bool)

(declare-datatypes ((SeekEntryResult!13475 0))(
  ( (MissingZero!13475 (index!56298 (_ BitVec 32))) (Found!13475 (index!56299 (_ BitVec 32))) (Intermediate!13475 (undefined!14287 Bool) (index!56300 (_ BitVec 32)) (x!140768 (_ BitVec 32))) (Undefined!13475) (MissingVacant!13475 (index!56301 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104740 (_ BitVec 32)) SeekEntryResult!13475)

(assert (=> b!1569228 (= res!1071696 (= (seekEntryOrOpen!0 (select (arr!50549 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) (Found!13475 #b00000000000000000000000000000000)))))

(assert (=> b!1569228 (=> (not res!1071696) (not e!874856))))

(declare-fun d!164237 () Bool)

(declare-fun res!1071695 () Bool)

(assert (=> d!164237 (=> res!1071695 e!874857)))

(assert (=> d!164237 (= res!1071695 (bvsge #b00000000000000000000000000000000 (size!51100 _keys!637)))))

(assert (=> d!164237 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947) e!874857)))

(assert (= (and d!164237 (not res!1071695)) b!1569227))

(assert (= (and b!1569227 c!145263) b!1569228))

(assert (= (and b!1569227 (not c!145263)) b!1569229))

(assert (= (and b!1569228 res!1071696) b!1569230))

(assert (= (or b!1569230 b!1569229) bm!72068))

(assert (=> b!1569227 m!1444087))

(assert (=> b!1569227 m!1444087))

(assert (=> b!1569227 m!1444093))

(declare-fun m!1444095 () Bool)

(assert (=> bm!72068 m!1444095))

(assert (=> b!1569228 m!1444087))

(declare-fun m!1444097 () Bool)

(assert (=> b!1569228 m!1444097))

(declare-fun m!1444099 () Bool)

(assert (=> b!1569228 m!1444099))

(assert (=> b!1569228 m!1444087))

(declare-fun m!1444101 () Bool)

(assert (=> b!1569228 m!1444101))

(assert (=> b!1569143 d!164237))

(declare-fun b!1569237 () Bool)

(declare-fun e!874863 () Bool)

(assert (=> b!1569237 (= e!874863 tp_is_empty!38965)))

(declare-fun b!1569238 () Bool)

(declare-fun e!874864 () Bool)

(assert (=> b!1569238 (= e!874864 tp_is_empty!38965)))

(declare-fun mapNonEmpty!59853 () Bool)

(declare-fun mapRes!59853 () Bool)

(declare-fun tp!113886 () Bool)

(assert (=> mapNonEmpty!59853 (= mapRes!59853 (and tp!113886 e!874863))))

(declare-fun mapKey!59853 () (_ BitVec 32))

(declare-fun mapRest!59853 () (Array (_ BitVec 32) ValueCell!18452))

(declare-fun mapValue!59853 () ValueCell!18452)

(assert (=> mapNonEmpty!59853 (= mapRest!59844 (store mapRest!59853 mapKey!59853 mapValue!59853))))

(declare-fun mapIsEmpty!59853 () Bool)

(assert (=> mapIsEmpty!59853 mapRes!59853))

(declare-fun condMapEmpty!59853 () Bool)

(declare-fun mapDefault!59853 () ValueCell!18452)

(assert (=> mapNonEmpty!59844 (= condMapEmpty!59853 (= mapRest!59844 ((as const (Array (_ BitVec 32) ValueCell!18452)) mapDefault!59853)))))

(assert (=> mapNonEmpty!59844 (= tp!113877 (and e!874864 mapRes!59853))))

(assert (= (and mapNonEmpty!59844 condMapEmpty!59853) mapIsEmpty!59853))

(assert (= (and mapNonEmpty!59844 (not condMapEmpty!59853)) mapNonEmpty!59853))

(assert (= (and mapNonEmpty!59853 ((_ is ValueCellFull!18452) mapValue!59853)) b!1569237))

(assert (= (and mapNonEmpty!59844 ((_ is ValueCellFull!18452) mapDefault!59853)) b!1569238))

(declare-fun m!1444103 () Bool)

(assert (=> mapNonEmpty!59853 m!1444103))

(check-sat (not b!1569214) (not bm!72068) (not b!1569216) (not b!1569227) (not mapNonEmpty!59853) (not b!1569228) tp_is_empty!38965 (not bm!72065) (not b!1569218))
(check-sat)
