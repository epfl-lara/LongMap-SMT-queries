; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133706 () Bool)

(assert start!133706)

(declare-fun res!1069149 () Bool)

(declare-fun e!871525 () Bool)

(assert (=> start!133706 (=> (not res!1069149) (not e!871525))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133706 (= res!1069149 (validMask!0 mask!947))))

(assert (=> start!133706 e!871525))

(assert (=> start!133706 true))

(declare-datatypes ((array!104294 0))(
  ( (array!104295 (arr!50340 (Array (_ BitVec 32) (_ BitVec 64))) (size!50892 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104294)

(declare-fun array_inv!39319 (array!104294) Bool)

(assert (=> start!133706 (array_inv!39319 _keys!637)))

(declare-datatypes ((V!59993 0))(
  ( (V!59994 (val!19503 Int)) )
))
(declare-datatypes ((ValueCell!18389 0))(
  ( (ValueCellFull!18389 (v!22251 V!59993)) (EmptyCell!18389) )
))
(declare-datatypes ((array!104296 0))(
  ( (array!104297 (arr!50341 (Array (_ BitVec 32) ValueCell!18389)) (size!50893 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104296)

(declare-fun e!871523 () Bool)

(declare-fun array_inv!39320 (array!104296) Bool)

(assert (=> start!133706 (and (array_inv!39320 _values!487) e!871523)))

(declare-fun b!1563745 () Bool)

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1563745 (= e!871525 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50892 _keys!637)) (bvslt (bvsub (bvadd #b00000000000000000000000000000001 (size!50892 _keys!637)) from!782) #b00000000000000000000000000000000)))))

(declare-fun b!1563746 () Bool)

(declare-fun res!1069152 () Bool)

(assert (=> b!1563746 (=> (not res!1069152) (not e!871525))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104294 (_ BitVec 32)) Bool)

(assert (=> b!1563746 (= res!1069152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1563747 () Bool)

(declare-fun e!871521 () Bool)

(declare-fun tp_is_empty!38839 () Bool)

(assert (=> b!1563747 (= e!871521 tp_is_empty!38839)))

(declare-fun b!1563748 () Bool)

(declare-fun res!1069151 () Bool)

(assert (=> b!1563748 (=> (not res!1069151) (not e!871525))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1563748 (= res!1069151 (and (= (size!50893 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50892 _keys!637) (size!50893 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1563749 () Bool)

(declare-fun e!871522 () Bool)

(assert (=> b!1563749 (= e!871522 tp_is_empty!38839)))

(declare-fun b!1563750 () Bool)

(declare-fun res!1069150 () Bool)

(assert (=> b!1563750 (=> (not res!1069150) (not e!871525))))

(declare-datatypes ((List!36599 0))(
  ( (Nil!36596) (Cons!36595 (h!38042 (_ BitVec 64)) (t!51438 List!36599)) )
))
(declare-fun arrayNoDuplicates!0 (array!104294 (_ BitVec 32) List!36599) Bool)

(assert (=> b!1563750 (= res!1069150 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36596))))

(declare-fun mapNonEmpty!59634 () Bool)

(declare-fun mapRes!59634 () Bool)

(declare-fun tp!113560 () Bool)

(assert (=> mapNonEmpty!59634 (= mapRes!59634 (and tp!113560 e!871521))))

(declare-fun mapRest!59634 () (Array (_ BitVec 32) ValueCell!18389))

(declare-fun mapValue!59634 () ValueCell!18389)

(declare-fun mapKey!59634 () (_ BitVec 32))

(assert (=> mapNonEmpty!59634 (= (arr!50341 _values!487) (store mapRest!59634 mapKey!59634 mapValue!59634))))

(declare-fun b!1563751 () Bool)

(assert (=> b!1563751 (= e!871523 (and e!871522 mapRes!59634))))

(declare-fun condMapEmpty!59634 () Bool)

(declare-fun mapDefault!59634 () ValueCell!18389)

(assert (=> b!1563751 (= condMapEmpty!59634 (= (arr!50341 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18389)) mapDefault!59634)))))

(declare-fun mapIsEmpty!59634 () Bool)

(assert (=> mapIsEmpty!59634 mapRes!59634))

(assert (= (and start!133706 res!1069149) b!1563748))

(assert (= (and b!1563748 res!1069151) b!1563746))

(assert (= (and b!1563746 res!1069152) b!1563750))

(assert (= (and b!1563750 res!1069150) b!1563745))

(assert (= (and b!1563751 condMapEmpty!59634) mapIsEmpty!59634))

(assert (= (and b!1563751 (not condMapEmpty!59634)) mapNonEmpty!59634))

(get-info :version)

(assert (= (and mapNonEmpty!59634 ((_ is ValueCellFull!18389) mapValue!59634)) b!1563747))

(assert (= (and b!1563751 ((_ is ValueCellFull!18389) mapDefault!59634)) b!1563749))

(assert (= start!133706 b!1563751))

(declare-fun m!1438521 () Bool)

(assert (=> start!133706 m!1438521))

(declare-fun m!1438523 () Bool)

(assert (=> start!133706 m!1438523))

(declare-fun m!1438525 () Bool)

(assert (=> start!133706 m!1438525))

(declare-fun m!1438527 () Bool)

(assert (=> b!1563746 m!1438527))

(declare-fun m!1438529 () Bool)

(assert (=> b!1563750 m!1438529))

(declare-fun m!1438531 () Bool)

(assert (=> mapNonEmpty!59634 m!1438531))

(check-sat (not b!1563746) (not start!133706) (not mapNonEmpty!59634) (not b!1563750) tp_is_empty!38839)
(check-sat)
(get-model)

(declare-fun d!162813 () Bool)

(assert (=> d!162813 (= (validMask!0 mask!947) (and (or (= mask!947 #b00000000000000000000000000000111) (= mask!947 #b00000000000000000000000000001111) (= mask!947 #b00000000000000000000000000011111) (= mask!947 #b00000000000000000000000000111111) (= mask!947 #b00000000000000000000000001111111) (= mask!947 #b00000000000000000000000011111111) (= mask!947 #b00000000000000000000000111111111) (= mask!947 #b00000000000000000000001111111111) (= mask!947 #b00000000000000000000011111111111) (= mask!947 #b00000000000000000000111111111111) (= mask!947 #b00000000000000000001111111111111) (= mask!947 #b00000000000000000011111111111111) (= mask!947 #b00000000000000000111111111111111) (= mask!947 #b00000000000000001111111111111111) (= mask!947 #b00000000000000011111111111111111) (= mask!947 #b00000000000000111111111111111111) (= mask!947 #b00000000000001111111111111111111) (= mask!947 #b00000000000011111111111111111111) (= mask!947 #b00000000000111111111111111111111) (= mask!947 #b00000000001111111111111111111111) (= mask!947 #b00000000011111111111111111111111) (= mask!947 #b00000000111111111111111111111111) (= mask!947 #b00000001111111111111111111111111) (= mask!947 #b00000011111111111111111111111111) (= mask!947 #b00000111111111111111111111111111) (= mask!947 #b00001111111111111111111111111111) (= mask!947 #b00011111111111111111111111111111) (= mask!947 #b00111111111111111111111111111111)) (bvsle mask!947 #b00111111111111111111111111111111)))))

(assert (=> start!133706 d!162813))

(declare-fun d!162815 () Bool)

(assert (=> d!162815 (= (array_inv!39319 _keys!637) (bvsge (size!50892 _keys!637) #b00000000000000000000000000000000))))

(assert (=> start!133706 d!162815))

(declare-fun d!162817 () Bool)

(assert (=> d!162817 (= (array_inv!39320 _values!487) (bvsge (size!50893 _values!487) #b00000000000000000000000000000000))))

(assert (=> start!133706 d!162817))

(declare-fun b!1563805 () Bool)

(declare-fun e!871565 () Bool)

(declare-fun e!871564 () Bool)

(assert (=> b!1563805 (= e!871565 e!871564)))

(declare-fun res!1069183 () Bool)

(assert (=> b!1563805 (=> (not res!1069183) (not e!871564))))

(declare-fun e!871567 () Bool)

(assert (=> b!1563805 (= res!1069183 (not e!871567))))

(declare-fun res!1069185 () Bool)

(assert (=> b!1563805 (=> (not res!1069185) (not e!871567))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1563805 (= res!1069185 (validKeyInArray!0 (select (arr!50340 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1563806 () Bool)

(declare-fun e!871566 () Bool)

(assert (=> b!1563806 (= e!871564 e!871566)))

(declare-fun c!144138 () Bool)

(assert (=> b!1563806 (= c!144138 (validKeyInArray!0 (select (arr!50340 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1563807 () Bool)

(declare-fun call!71812 () Bool)

(assert (=> b!1563807 (= e!871566 call!71812)))

(declare-fun b!1563808 () Bool)

(declare-fun contains!10265 (List!36599 (_ BitVec 64)) Bool)

(assert (=> b!1563808 (= e!871567 (contains!10265 Nil!36596 (select (arr!50340 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun bm!71809 () Bool)

(assert (=> bm!71809 (= call!71812 (arrayNoDuplicates!0 _keys!637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!144138 (Cons!36595 (select (arr!50340 _keys!637) #b00000000000000000000000000000000) Nil!36596) Nil!36596)))))

(declare-fun d!162819 () Bool)

(declare-fun res!1069184 () Bool)

(assert (=> d!162819 (=> res!1069184 e!871565)))

(assert (=> d!162819 (= res!1069184 (bvsge #b00000000000000000000000000000000 (size!50892 _keys!637)))))

(assert (=> d!162819 (= (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36596) e!871565)))

(declare-fun b!1563804 () Bool)

(assert (=> b!1563804 (= e!871566 call!71812)))

(assert (= (and d!162819 (not res!1069184)) b!1563805))

(assert (= (and b!1563805 res!1069185) b!1563808))

(assert (= (and b!1563805 res!1069183) b!1563806))

(assert (= (and b!1563806 c!144138) b!1563804))

(assert (= (and b!1563806 (not c!144138)) b!1563807))

(assert (= (or b!1563804 b!1563807) bm!71809))

(declare-fun m!1438557 () Bool)

(assert (=> b!1563805 m!1438557))

(assert (=> b!1563805 m!1438557))

(declare-fun m!1438559 () Bool)

(assert (=> b!1563805 m!1438559))

(assert (=> b!1563806 m!1438557))

(assert (=> b!1563806 m!1438557))

(assert (=> b!1563806 m!1438559))

(assert (=> b!1563808 m!1438557))

(assert (=> b!1563808 m!1438557))

(declare-fun m!1438561 () Bool)

(assert (=> b!1563808 m!1438561))

(assert (=> bm!71809 m!1438557))

(declare-fun m!1438563 () Bool)

(assert (=> bm!71809 m!1438563))

(assert (=> b!1563750 d!162819))

(declare-fun b!1563817 () Bool)

(declare-fun e!871574 () Bool)

(declare-fun e!871576 () Bool)

(assert (=> b!1563817 (= e!871574 e!871576)))

(declare-fun c!144141 () Bool)

(assert (=> b!1563817 (= c!144141 (validKeyInArray!0 (select (arr!50340 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1563818 () Bool)

(declare-fun e!871575 () Bool)

(declare-fun call!71815 () Bool)

(assert (=> b!1563818 (= e!871575 call!71815)))

(declare-fun b!1563819 () Bool)

(assert (=> b!1563819 (= e!871576 call!71815)))

(declare-fun b!1563820 () Bool)

(assert (=> b!1563820 (= e!871576 e!871575)))

(declare-fun lt!671718 () (_ BitVec 64))

(assert (=> b!1563820 (= lt!671718 (select (arr!50340 _keys!637) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51798 0))(
  ( (Unit!51799) )
))
(declare-fun lt!671720 () Unit!51798)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!104294 (_ BitVec 64) (_ BitVec 32)) Unit!51798)

(assert (=> b!1563820 (= lt!671720 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!671718 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!104294 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1563820 (arrayContainsKey!0 _keys!637 lt!671718 #b00000000000000000000000000000000)))

(declare-fun lt!671719 () Unit!51798)

(assert (=> b!1563820 (= lt!671719 lt!671720)))

(declare-fun res!1069190 () Bool)

(declare-datatypes ((SeekEntryResult!13521 0))(
  ( (MissingZero!13521 (index!56482 (_ BitVec 32))) (Found!13521 (index!56483 (_ BitVec 32))) (Intermediate!13521 (undefined!14333 Bool) (index!56484 (_ BitVec 32)) (x!140430 (_ BitVec 32))) (Undefined!13521) (MissingVacant!13521 (index!56485 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104294 (_ BitVec 32)) SeekEntryResult!13521)

(assert (=> b!1563820 (= res!1069190 (= (seekEntryOrOpen!0 (select (arr!50340 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) (Found!13521 #b00000000000000000000000000000000)))))

(assert (=> b!1563820 (=> (not res!1069190) (not e!871575))))

(declare-fun bm!71812 () Bool)

(assert (=> bm!71812 (= call!71815 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!637 mask!947))))

(declare-fun d!162821 () Bool)

(declare-fun res!1069191 () Bool)

(assert (=> d!162821 (=> res!1069191 e!871574)))

(assert (=> d!162821 (= res!1069191 (bvsge #b00000000000000000000000000000000 (size!50892 _keys!637)))))

(assert (=> d!162821 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947) e!871574)))

(assert (= (and d!162821 (not res!1069191)) b!1563817))

(assert (= (and b!1563817 c!144141) b!1563820))

(assert (= (and b!1563817 (not c!144141)) b!1563819))

(assert (= (and b!1563820 res!1069190) b!1563818))

(assert (= (or b!1563818 b!1563819) bm!71812))

(assert (=> b!1563817 m!1438557))

(assert (=> b!1563817 m!1438557))

(assert (=> b!1563817 m!1438559))

(assert (=> b!1563820 m!1438557))

(declare-fun m!1438565 () Bool)

(assert (=> b!1563820 m!1438565))

(declare-fun m!1438567 () Bool)

(assert (=> b!1563820 m!1438567))

(assert (=> b!1563820 m!1438557))

(declare-fun m!1438569 () Bool)

(assert (=> b!1563820 m!1438569))

(declare-fun m!1438571 () Bool)

(assert (=> bm!71812 m!1438571))

(assert (=> b!1563746 d!162821))

(declare-fun condMapEmpty!59643 () Bool)

(declare-fun mapDefault!59643 () ValueCell!18389)

(assert (=> mapNonEmpty!59634 (= condMapEmpty!59643 (= mapRest!59634 ((as const (Array (_ BitVec 32) ValueCell!18389)) mapDefault!59643)))))

(declare-fun e!871581 () Bool)

(declare-fun mapRes!59643 () Bool)

(assert (=> mapNonEmpty!59634 (= tp!113560 (and e!871581 mapRes!59643))))

(declare-fun b!1563828 () Bool)

(assert (=> b!1563828 (= e!871581 tp_is_empty!38839)))

(declare-fun b!1563827 () Bool)

(declare-fun e!871582 () Bool)

(assert (=> b!1563827 (= e!871582 tp_is_empty!38839)))

(declare-fun mapIsEmpty!59643 () Bool)

(assert (=> mapIsEmpty!59643 mapRes!59643))

(declare-fun mapNonEmpty!59643 () Bool)

(declare-fun tp!113569 () Bool)

(assert (=> mapNonEmpty!59643 (= mapRes!59643 (and tp!113569 e!871582))))

(declare-fun mapValue!59643 () ValueCell!18389)

(declare-fun mapRest!59643 () (Array (_ BitVec 32) ValueCell!18389))

(declare-fun mapKey!59643 () (_ BitVec 32))

(assert (=> mapNonEmpty!59643 (= mapRest!59634 (store mapRest!59643 mapKey!59643 mapValue!59643))))

(assert (= (and mapNonEmpty!59634 condMapEmpty!59643) mapIsEmpty!59643))

(assert (= (and mapNonEmpty!59634 (not condMapEmpty!59643)) mapNonEmpty!59643))

(assert (= (and mapNonEmpty!59643 ((_ is ValueCellFull!18389) mapValue!59643)) b!1563827))

(assert (= (and mapNonEmpty!59634 ((_ is ValueCellFull!18389) mapDefault!59643)) b!1563828))

(declare-fun m!1438573 () Bool)

(assert (=> mapNonEmpty!59643 m!1438573))

(check-sat (not bm!71809) (not b!1563820) (not b!1563805) (not b!1563817) (not bm!71812) (not b!1563808) (not mapNonEmpty!59643) (not b!1563806) tp_is_empty!38839)
(check-sat)
