; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81782 () Bool)

(assert start!81782)

(declare-fun b!953749 () Bool)

(declare-fun e!537310 () Bool)

(declare-datatypes ((List!19382 0))(
  ( (Nil!19379) (Cons!19378 (h!20540 (_ BitVec 64)) (t!27734 List!19382)) )
))
(declare-fun contains!5221 (List!19382 (_ BitVec 64)) Bool)

(assert (=> b!953749 (= e!537310 (contains!5221 Nil!19379 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!953750 () Bool)

(declare-fun e!537305 () Bool)

(declare-fun e!537308 () Bool)

(declare-fun mapRes!33235 () Bool)

(assert (=> b!953750 (= e!537305 (and e!537308 mapRes!33235))))

(declare-fun condMapEmpty!33235 () Bool)

(declare-datatypes ((V!32785 0))(
  ( (V!32786 (val!10476 Int)) )
))
(declare-datatypes ((ValueCell!9944 0))(
  ( (ValueCellFull!9944 (v!13029 V!32785)) (EmptyCell!9944) )
))
(declare-datatypes ((array!57774 0))(
  ( (array!57775 (arr!27768 (Array (_ BitVec 32) ValueCell!9944)) (size!28249 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57774)

(declare-fun mapDefault!33235 () ValueCell!9944)

(assert (=> b!953750 (= condMapEmpty!33235 (= (arr!27768 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9944)) mapDefault!33235)))))

(declare-fun b!953751 () Bool)

(declare-fun e!537306 () Bool)

(declare-fun tp_is_empty!20851 () Bool)

(assert (=> b!953751 (= e!537306 tp_is_empty!20851)))

(declare-fun b!953752 () Bool)

(assert (=> b!953752 (= e!537308 tp_is_empty!20851)))

(declare-fun mapNonEmpty!33235 () Bool)

(declare-fun tp!63625 () Bool)

(assert (=> mapNonEmpty!33235 (= mapRes!33235 (and tp!63625 e!537306))))

(declare-fun mapRest!33235 () (Array (_ BitVec 32) ValueCell!9944))

(declare-fun mapValue!33235 () ValueCell!9944)

(declare-fun mapKey!33235 () (_ BitVec 32))

(assert (=> mapNonEmpty!33235 (= (arr!27768 _values!1197) (store mapRest!33235 mapKey!33235 mapValue!33235))))

(declare-fun mapIsEmpty!33235 () Bool)

(assert (=> mapIsEmpty!33235 mapRes!33235))

(declare-fun b!953753 () Bool)

(declare-fun res!638728 () Bool)

(declare-fun e!537307 () Bool)

(assert (=> b!953753 (=> (not res!638728) (not e!537307))))

(declare-datatypes ((array!57776 0))(
  ( (array!57777 (arr!27769 (Array (_ BitVec 32) (_ BitVec 64))) (size!28250 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57776)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57776 (_ BitVec 32)) Bool)

(assert (=> b!953753 (= res!638728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!953755 () Bool)

(declare-fun res!638730 () Bool)

(assert (=> b!953755 (=> (not res!638730) (not e!537307))))

(declare-fun noDuplicate!1369 (List!19382) Bool)

(assert (=> b!953755 (= res!638730 (noDuplicate!1369 Nil!19379))))

(declare-fun b!953756 () Bool)

(declare-fun res!638731 () Bool)

(assert (=> b!953756 (=> (not res!638731) (not e!537307))))

(assert (=> b!953756 (= res!638731 (and (bvsle #b00000000000000000000000000000000 (size!28250 _keys!1441)) (bvslt (size!28250 _keys!1441) #b01111111111111111111111111111111)))))

(declare-fun b!953757 () Bool)

(assert (=> b!953757 (= e!537307 e!537310)))

(declare-fun res!638727 () Bool)

(assert (=> b!953757 (=> res!638727 e!537310)))

(assert (=> b!953757 (= res!638727 (contains!5221 Nil!19379 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!638729 () Bool)

(assert (=> start!81782 (=> (not res!638729) (not e!537307))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81782 (= res!638729 (validMask!0 mask!1823))))

(assert (=> start!81782 e!537307))

(assert (=> start!81782 true))

(declare-fun array_inv!21617 (array!57774) Bool)

(assert (=> start!81782 (and (array_inv!21617 _values!1197) e!537305)))

(declare-fun array_inv!21618 (array!57776) Bool)

(assert (=> start!81782 (array_inv!21618 _keys!1441)))

(declare-fun b!953754 () Bool)

(declare-fun res!638732 () Bool)

(assert (=> b!953754 (=> (not res!638732) (not e!537307))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!953754 (= res!638732 (and (= (size!28249 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28250 _keys!1441) (size!28249 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(assert (= (and start!81782 res!638729) b!953754))

(assert (= (and b!953754 res!638732) b!953753))

(assert (= (and b!953753 res!638728) b!953756))

(assert (= (and b!953756 res!638731) b!953755))

(assert (= (and b!953755 res!638730) b!953757))

(assert (= (and b!953757 (not res!638727)) b!953749))

(assert (= (and b!953750 condMapEmpty!33235) mapIsEmpty!33235))

(assert (= (and b!953750 (not condMapEmpty!33235)) mapNonEmpty!33235))

(get-info :version)

(assert (= (and mapNonEmpty!33235 ((_ is ValueCellFull!9944) mapValue!33235)) b!953751))

(assert (= (and b!953750 ((_ is ValueCellFull!9944) mapDefault!33235)) b!953752))

(assert (= start!81782 b!953750))

(declare-fun m!885089 () Bool)

(assert (=> b!953749 m!885089))

(declare-fun m!885091 () Bool)

(assert (=> mapNonEmpty!33235 m!885091))

(declare-fun m!885093 () Bool)

(assert (=> b!953757 m!885093))

(declare-fun m!885095 () Bool)

(assert (=> start!81782 m!885095))

(declare-fun m!885097 () Bool)

(assert (=> start!81782 m!885097))

(declare-fun m!885099 () Bool)

(assert (=> start!81782 m!885099))

(declare-fun m!885101 () Bool)

(assert (=> b!953755 m!885101))

(declare-fun m!885103 () Bool)

(assert (=> b!953753 m!885103))

(check-sat (not mapNonEmpty!33235) (not b!953757) (not b!953755) (not b!953749) (not b!953753) tp_is_empty!20851 (not start!81782))
(check-sat)
(get-model)

(declare-fun d!115559 () Bool)

(assert (=> d!115559 (= (validMask!0 mask!1823) (and (or (= mask!1823 #b00000000000000000000000000000111) (= mask!1823 #b00000000000000000000000000001111) (= mask!1823 #b00000000000000000000000000011111) (= mask!1823 #b00000000000000000000000000111111) (= mask!1823 #b00000000000000000000000001111111) (= mask!1823 #b00000000000000000000000011111111) (= mask!1823 #b00000000000000000000000111111111) (= mask!1823 #b00000000000000000000001111111111) (= mask!1823 #b00000000000000000000011111111111) (= mask!1823 #b00000000000000000000111111111111) (= mask!1823 #b00000000000000000001111111111111) (= mask!1823 #b00000000000000000011111111111111) (= mask!1823 #b00000000000000000111111111111111) (= mask!1823 #b00000000000000001111111111111111) (= mask!1823 #b00000000000000011111111111111111) (= mask!1823 #b00000000000000111111111111111111) (= mask!1823 #b00000000000001111111111111111111) (= mask!1823 #b00000000000011111111111111111111) (= mask!1823 #b00000000000111111111111111111111) (= mask!1823 #b00000000001111111111111111111111) (= mask!1823 #b00000000011111111111111111111111) (= mask!1823 #b00000000111111111111111111111111) (= mask!1823 #b00000001111111111111111111111111) (= mask!1823 #b00000011111111111111111111111111) (= mask!1823 #b00000111111111111111111111111111) (= mask!1823 #b00001111111111111111111111111111) (= mask!1823 #b00011111111111111111111111111111) (= mask!1823 #b00111111111111111111111111111111)) (bvsle mask!1823 #b00111111111111111111111111111111)))))

(assert (=> start!81782 d!115559))

(declare-fun d!115561 () Bool)

(assert (=> d!115561 (= (array_inv!21617 _values!1197) (bvsge (size!28249 _values!1197) #b00000000000000000000000000000000))))

(assert (=> start!81782 d!115561))

(declare-fun d!115563 () Bool)

(assert (=> d!115563 (= (array_inv!21618 _keys!1441) (bvsge (size!28250 _keys!1441) #b00000000000000000000000000000000))))

(assert (=> start!81782 d!115563))

(declare-fun d!115565 () Bool)

(declare-fun res!638773 () Bool)

(declare-fun e!537351 () Bool)

(assert (=> d!115565 (=> res!638773 e!537351)))

(assert (=> d!115565 (= res!638773 ((_ is Nil!19379) Nil!19379))))

(assert (=> d!115565 (= (noDuplicate!1369 Nil!19379) e!537351)))

(declare-fun b!953816 () Bool)

(declare-fun e!537352 () Bool)

(assert (=> b!953816 (= e!537351 e!537352)))

(declare-fun res!638774 () Bool)

(assert (=> b!953816 (=> (not res!638774) (not e!537352))))

(assert (=> b!953816 (= res!638774 (not (contains!5221 (t!27734 Nil!19379) (h!20540 Nil!19379))))))

(declare-fun b!953817 () Bool)

(assert (=> b!953817 (= e!537352 (noDuplicate!1369 (t!27734 Nil!19379)))))

(assert (= (and d!115565 (not res!638773)) b!953816))

(assert (= (and b!953816 res!638774) b!953817))

(declare-fun m!885137 () Bool)

(assert (=> b!953816 m!885137))

(declare-fun m!885139 () Bool)

(assert (=> b!953817 m!885139))

(assert (=> b!953755 d!115565))

(declare-fun b!953826 () Bool)

(declare-fun e!537361 () Bool)

(declare-fun e!537360 () Bool)

(assert (=> b!953826 (= e!537361 e!537360)))

(declare-fun lt!429619 () (_ BitVec 64))

(assert (=> b!953826 (= lt!429619 (select (arr!27769 _keys!1441) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!31962 0))(
  ( (Unit!31963) )
))
(declare-fun lt!429618 () Unit!31962)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57776 (_ BitVec 64) (_ BitVec 32)) Unit!31962)

(assert (=> b!953826 (= lt!429618 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1441 lt!429619 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57776 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!953826 (arrayContainsKey!0 _keys!1441 lt!429619 #b00000000000000000000000000000000)))

(declare-fun lt!429620 () Unit!31962)

(assert (=> b!953826 (= lt!429620 lt!429618)))

(declare-fun res!638780 () Bool)

(declare-datatypes ((SeekEntryResult!9182 0))(
  ( (MissingZero!9182 (index!39099 (_ BitVec 32))) (Found!9182 (index!39100 (_ BitVec 32))) (Intermediate!9182 (undefined!9994 Bool) (index!39101 (_ BitVec 32)) (x!82139 (_ BitVec 32))) (Undefined!9182) (MissingVacant!9182 (index!39102 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57776 (_ BitVec 32)) SeekEntryResult!9182)

(assert (=> b!953826 (= res!638780 (= (seekEntryOrOpen!0 (select (arr!27769 _keys!1441) #b00000000000000000000000000000000) _keys!1441 mask!1823) (Found!9182 #b00000000000000000000000000000000)))))

(assert (=> b!953826 (=> (not res!638780) (not e!537360))))

(declare-fun b!953827 () Bool)

(declare-fun e!537359 () Bool)

(assert (=> b!953827 (= e!537359 e!537361)))

(declare-fun c!99801 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!953827 (= c!99801 (validKeyInArray!0 (select (arr!27769 _keys!1441) #b00000000000000000000000000000000)))))

(declare-fun d!115567 () Bool)

(declare-fun res!638779 () Bool)

(assert (=> d!115567 (=> res!638779 e!537359)))

(assert (=> d!115567 (= res!638779 (bvsge #b00000000000000000000000000000000 (size!28250 _keys!1441)))))

(assert (=> d!115567 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823) e!537359)))

(declare-fun bm!41649 () Bool)

(declare-fun call!41652 () Bool)

(assert (=> bm!41649 (= call!41652 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1441 mask!1823))))

(declare-fun b!953828 () Bool)

(assert (=> b!953828 (= e!537361 call!41652)))

(declare-fun b!953829 () Bool)

(assert (=> b!953829 (= e!537360 call!41652)))

(assert (= (and d!115567 (not res!638779)) b!953827))

(assert (= (and b!953827 c!99801) b!953826))

(assert (= (and b!953827 (not c!99801)) b!953828))

(assert (= (and b!953826 res!638780) b!953829))

(assert (= (or b!953829 b!953828) bm!41649))

(declare-fun m!885141 () Bool)

(assert (=> b!953826 m!885141))

(declare-fun m!885143 () Bool)

(assert (=> b!953826 m!885143))

(declare-fun m!885145 () Bool)

(assert (=> b!953826 m!885145))

(assert (=> b!953826 m!885141))

(declare-fun m!885147 () Bool)

(assert (=> b!953826 m!885147))

(assert (=> b!953827 m!885141))

(assert (=> b!953827 m!885141))

(declare-fun m!885149 () Bool)

(assert (=> b!953827 m!885149))

(declare-fun m!885151 () Bool)

(assert (=> bm!41649 m!885151))

(assert (=> b!953753 d!115567))

(declare-fun d!115569 () Bool)

(declare-fun lt!429623 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!410 (List!19382) (InoxSet (_ BitVec 64)))

(assert (=> d!115569 (= lt!429623 (select (content!410 Nil!19379) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!537366 () Bool)

(assert (=> d!115569 (= lt!429623 e!537366)))

(declare-fun res!638786 () Bool)

(assert (=> d!115569 (=> (not res!638786) (not e!537366))))

(assert (=> d!115569 (= res!638786 ((_ is Cons!19378) Nil!19379))))

(assert (=> d!115569 (= (contains!5221 Nil!19379 #b1000000000000000000000000000000000000000000000000000000000000000) lt!429623)))

(declare-fun b!953834 () Bool)

(declare-fun e!537367 () Bool)

(assert (=> b!953834 (= e!537366 e!537367)))

(declare-fun res!638785 () Bool)

(assert (=> b!953834 (=> res!638785 e!537367)))

(assert (=> b!953834 (= res!638785 (= (h!20540 Nil!19379) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!953835 () Bool)

(assert (=> b!953835 (= e!537367 (contains!5221 (t!27734 Nil!19379) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!115569 res!638786) b!953834))

(assert (= (and b!953834 (not res!638785)) b!953835))

(declare-fun m!885153 () Bool)

(assert (=> d!115569 m!885153))

(declare-fun m!885155 () Bool)

(assert (=> d!115569 m!885155))

(declare-fun m!885157 () Bool)

(assert (=> b!953835 m!885157))

(assert (=> b!953749 d!115569))

(declare-fun d!115571 () Bool)

(declare-fun lt!429624 () Bool)

(assert (=> d!115571 (= lt!429624 (select (content!410 Nil!19379) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!537368 () Bool)

(assert (=> d!115571 (= lt!429624 e!537368)))

(declare-fun res!638788 () Bool)

(assert (=> d!115571 (=> (not res!638788) (not e!537368))))

(assert (=> d!115571 (= res!638788 ((_ is Cons!19378) Nil!19379))))

(assert (=> d!115571 (= (contains!5221 Nil!19379 #b0000000000000000000000000000000000000000000000000000000000000000) lt!429624)))

(declare-fun b!953836 () Bool)

(declare-fun e!537369 () Bool)

(assert (=> b!953836 (= e!537368 e!537369)))

(declare-fun res!638787 () Bool)

(assert (=> b!953836 (=> res!638787 e!537369)))

(assert (=> b!953836 (= res!638787 (= (h!20540 Nil!19379) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!953837 () Bool)

(assert (=> b!953837 (= e!537369 (contains!5221 (t!27734 Nil!19379) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!115571 res!638788) b!953836))

(assert (= (and b!953836 (not res!638787)) b!953837))

(assert (=> d!115571 m!885153))

(declare-fun m!885159 () Bool)

(assert (=> d!115571 m!885159))

(declare-fun m!885161 () Bool)

(assert (=> b!953837 m!885161))

(assert (=> b!953757 d!115571))

(declare-fun condMapEmpty!33244 () Bool)

(declare-fun mapDefault!33244 () ValueCell!9944)

(assert (=> mapNonEmpty!33235 (= condMapEmpty!33244 (= mapRest!33235 ((as const (Array (_ BitVec 32) ValueCell!9944)) mapDefault!33244)))))

(declare-fun e!537375 () Bool)

(declare-fun mapRes!33244 () Bool)

(assert (=> mapNonEmpty!33235 (= tp!63625 (and e!537375 mapRes!33244))))

(declare-fun mapIsEmpty!33244 () Bool)

(assert (=> mapIsEmpty!33244 mapRes!33244))

(declare-fun b!953844 () Bool)

(declare-fun e!537374 () Bool)

(assert (=> b!953844 (= e!537374 tp_is_empty!20851)))

(declare-fun b!953845 () Bool)

(assert (=> b!953845 (= e!537375 tp_is_empty!20851)))

(declare-fun mapNonEmpty!33244 () Bool)

(declare-fun tp!63634 () Bool)

(assert (=> mapNonEmpty!33244 (= mapRes!33244 (and tp!63634 e!537374))))

(declare-fun mapRest!33244 () (Array (_ BitVec 32) ValueCell!9944))

(declare-fun mapKey!33244 () (_ BitVec 32))

(declare-fun mapValue!33244 () ValueCell!9944)

(assert (=> mapNonEmpty!33244 (= mapRest!33235 (store mapRest!33244 mapKey!33244 mapValue!33244))))

(assert (= (and mapNonEmpty!33235 condMapEmpty!33244) mapIsEmpty!33244))

(assert (= (and mapNonEmpty!33235 (not condMapEmpty!33244)) mapNonEmpty!33244))

(assert (= (and mapNonEmpty!33244 ((_ is ValueCellFull!9944) mapValue!33244)) b!953844))

(assert (= (and mapNonEmpty!33235 ((_ is ValueCellFull!9944) mapDefault!33244)) b!953845))

(declare-fun m!885163 () Bool)

(assert (=> mapNonEmpty!33244 m!885163))

(check-sat (not bm!41649) (not b!953817) (not d!115571) (not b!953837) tp_is_empty!20851 (not b!953826) (not b!953827) (not mapNonEmpty!33244) (not b!953835) (not b!953816) (not d!115569))
(check-sat)
