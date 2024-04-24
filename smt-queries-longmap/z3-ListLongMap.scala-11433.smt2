; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133786 () Bool)

(assert start!133786)

(declare-fun b!1561802 () Bool)

(declare-fun e!870371 () Bool)

(declare-fun tp_is_empty!38479 () Bool)

(assert (=> b!1561802 (= e!870371 tp_is_empty!38479)))

(declare-fun mapNonEmpty!59088 () Bool)

(declare-fun mapRes!59088 () Bool)

(declare-fun tp!112743 () Bool)

(declare-fun e!870374 () Bool)

(assert (=> mapNonEmpty!59088 (= mapRes!59088 (and tp!112743 e!870374))))

(declare-fun mapKey!59088 () (_ BitVec 32))

(declare-datatypes ((V!59513 0))(
  ( (V!59514 (val!19323 Int)) )
))
(declare-datatypes ((ValueCell!18209 0))(
  ( (ValueCellFull!18209 (v!22066 V!59513)) (EmptyCell!18209) )
))
(declare-fun mapRest!59088 () (Array (_ BitVec 32) ValueCell!18209))

(declare-fun mapValue!59088 () ValueCell!18209)

(declare-datatypes ((array!103812 0))(
  ( (array!103813 (arr!50093 (Array (_ BitVec 32) ValueCell!18209)) (size!50644 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103812)

(assert (=> mapNonEmpty!59088 (= (arr!50093 _values!487) (store mapRest!59088 mapKey!59088 mapValue!59088))))

(declare-fun b!1561803 () Bool)

(declare-fun e!870372 () Bool)

(declare-datatypes ((List!36374 0))(
  ( (Nil!36371) (Cons!36370 (h!37834 (_ BitVec 64)) (t!51099 List!36374)) )
))
(declare-fun noDuplicate!2658 (List!36374) Bool)

(assert (=> b!1561803 (= e!870372 (not (noDuplicate!2658 Nil!36371)))))

(declare-fun b!1561804 () Bool)

(assert (=> b!1561804 (= e!870374 tp_is_empty!38479)))

(declare-fun mapIsEmpty!59088 () Bool)

(assert (=> mapIsEmpty!59088 mapRes!59088))

(declare-fun b!1561805 () Bool)

(declare-fun res!1067211 () Bool)

(assert (=> b!1561805 (=> (not res!1067211) (not e!870372))))

(declare-datatypes ((array!103814 0))(
  ( (array!103815 (arr!50094 (Array (_ BitVec 32) (_ BitVec 64))) (size!50645 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103814)

(assert (=> b!1561805 (= res!1067211 (and (bvsle #b00000000000000000000000000000000 (size!50645 _keys!637)) (bvslt (size!50645 _keys!637) #b01111111111111111111111111111111)))))

(declare-fun res!1067209 () Bool)

(assert (=> start!133786 (=> (not res!1067209) (not e!870372))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133786 (= res!1067209 (validMask!0 mask!947))))

(assert (=> start!133786 e!870372))

(assert (=> start!133786 true))

(declare-fun e!870370 () Bool)

(declare-fun array_inv!39201 (array!103812) Bool)

(assert (=> start!133786 (and (array_inv!39201 _values!487) e!870370)))

(declare-fun array_inv!39202 (array!103814) Bool)

(assert (=> start!133786 (array_inv!39202 _keys!637)))

(declare-fun b!1561806 () Bool)

(assert (=> b!1561806 (= e!870370 (and e!870371 mapRes!59088))))

(declare-fun condMapEmpty!59088 () Bool)

(declare-fun mapDefault!59088 () ValueCell!18209)

(assert (=> b!1561806 (= condMapEmpty!59088 (= (arr!50093 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18209)) mapDefault!59088)))))

(declare-fun b!1561807 () Bool)

(declare-fun res!1067210 () Bool)

(assert (=> b!1561807 (=> (not res!1067210) (not e!870372))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103814 (_ BitVec 32)) Bool)

(assert (=> b!1561807 (= res!1067210 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1561808 () Bool)

(declare-fun res!1067208 () Bool)

(assert (=> b!1561808 (=> (not res!1067208) (not e!870372))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1561808 (= res!1067208 (and (= (size!50644 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50645 _keys!637) (size!50644 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(assert (= (and start!133786 res!1067209) b!1561808))

(assert (= (and b!1561808 res!1067208) b!1561807))

(assert (= (and b!1561807 res!1067210) b!1561805))

(assert (= (and b!1561805 res!1067211) b!1561803))

(assert (= (and b!1561806 condMapEmpty!59088) mapIsEmpty!59088))

(assert (= (and b!1561806 (not condMapEmpty!59088)) mapNonEmpty!59088))

(get-info :version)

(assert (= (and mapNonEmpty!59088 ((_ is ValueCellFull!18209) mapValue!59088)) b!1561804))

(assert (= (and b!1561806 ((_ is ValueCellFull!18209) mapDefault!59088)) b!1561802))

(assert (= start!133786 b!1561806))

(declare-fun m!1437893 () Bool)

(assert (=> mapNonEmpty!59088 m!1437893))

(declare-fun m!1437895 () Bool)

(assert (=> b!1561803 m!1437895))

(declare-fun m!1437897 () Bool)

(assert (=> start!133786 m!1437897))

(declare-fun m!1437899 () Bool)

(assert (=> start!133786 m!1437899))

(declare-fun m!1437901 () Bool)

(assert (=> start!133786 m!1437901))

(declare-fun m!1437903 () Bool)

(assert (=> b!1561807 m!1437903))

(check-sat (not b!1561807) (not start!133786) tp_is_empty!38479 (not mapNonEmpty!59088) (not b!1561803))
(check-sat)
(get-model)

(declare-fun b!1561859 () Bool)

(declare-fun e!870412 () Bool)

(declare-fun e!870413 () Bool)

(assert (=> b!1561859 (= e!870412 e!870413)))

(declare-fun lt!671783 () (_ BitVec 64))

(assert (=> b!1561859 (= lt!671783 (select (arr!50094 _keys!637) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51809 0))(
  ( (Unit!51810) )
))
(declare-fun lt!671784 () Unit!51809)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!103814 (_ BitVec 64) (_ BitVec 32)) Unit!51809)

(assert (=> b!1561859 (= lt!671784 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!671783 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!103814 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1561859 (arrayContainsKey!0 _keys!637 lt!671783 #b00000000000000000000000000000000)))

(declare-fun lt!671785 () Unit!51809)

(assert (=> b!1561859 (= lt!671785 lt!671784)))

(declare-fun res!1067241 () Bool)

(declare-datatypes ((SeekEntryResult!13467 0))(
  ( (MissingZero!13467 (index!56266 (_ BitVec 32))) (Found!13467 (index!56267 (_ BitVec 32))) (Intermediate!13467 (undefined!14279 Bool) (index!56268 (_ BitVec 32)) (x!139772 (_ BitVec 32))) (Undefined!13467) (MissingVacant!13467 (index!56269 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!103814 (_ BitVec 32)) SeekEntryResult!13467)

(assert (=> b!1561859 (= res!1067241 (= (seekEntryOrOpen!0 (select (arr!50094 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) (Found!13467 #b00000000000000000000000000000000)))))

(assert (=> b!1561859 (=> (not res!1067241) (not e!870413))))

(declare-fun b!1561860 () Bool)

(declare-fun call!71991 () Bool)

(assert (=> b!1561860 (= e!870413 call!71991)))

(declare-fun b!1561861 () Bool)

(assert (=> b!1561861 (= e!870412 call!71991)))

(declare-fun b!1561862 () Bool)

(declare-fun e!870411 () Bool)

(assert (=> b!1561862 (= e!870411 e!870412)))

(declare-fun c!145021 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1561862 (= c!145021 (validKeyInArray!0 (select (arr!50094 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun d!163623 () Bool)

(declare-fun res!1067240 () Bool)

(assert (=> d!163623 (=> res!1067240 e!870411)))

(assert (=> d!163623 (= res!1067240 (bvsge #b00000000000000000000000000000000 (size!50645 _keys!637)))))

(assert (=> d!163623 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947) e!870411)))

(declare-fun bm!71988 () Bool)

(assert (=> bm!71988 (= call!71991 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!637 mask!947))))

(assert (= (and d!163623 (not res!1067240)) b!1561862))

(assert (= (and b!1561862 c!145021) b!1561859))

(assert (= (and b!1561862 (not c!145021)) b!1561861))

(assert (= (and b!1561859 res!1067241) b!1561860))

(assert (= (or b!1561860 b!1561861) bm!71988))

(declare-fun m!1437929 () Bool)

(assert (=> b!1561859 m!1437929))

(declare-fun m!1437931 () Bool)

(assert (=> b!1561859 m!1437931))

(declare-fun m!1437933 () Bool)

(assert (=> b!1561859 m!1437933))

(assert (=> b!1561859 m!1437929))

(declare-fun m!1437935 () Bool)

(assert (=> b!1561859 m!1437935))

(assert (=> b!1561862 m!1437929))

(assert (=> b!1561862 m!1437929))

(declare-fun m!1437937 () Bool)

(assert (=> b!1561862 m!1437937))

(declare-fun m!1437939 () Bool)

(assert (=> bm!71988 m!1437939))

(assert (=> b!1561807 d!163623))

(declare-fun d!163625 () Bool)

(declare-fun res!1067246 () Bool)

(declare-fun e!870418 () Bool)

(assert (=> d!163625 (=> res!1067246 e!870418)))

(assert (=> d!163625 (= res!1067246 ((_ is Nil!36371) Nil!36371))))

(assert (=> d!163625 (= (noDuplicate!2658 Nil!36371) e!870418)))

(declare-fun b!1561867 () Bool)

(declare-fun e!870419 () Bool)

(assert (=> b!1561867 (= e!870418 e!870419)))

(declare-fun res!1067247 () Bool)

(assert (=> b!1561867 (=> (not res!1067247) (not e!870419))))

(declare-fun contains!10261 (List!36374 (_ BitVec 64)) Bool)

(assert (=> b!1561867 (= res!1067247 (not (contains!10261 (t!51099 Nil!36371) (h!37834 Nil!36371))))))

(declare-fun b!1561868 () Bool)

(assert (=> b!1561868 (= e!870419 (noDuplicate!2658 (t!51099 Nil!36371)))))

(assert (= (and d!163625 (not res!1067246)) b!1561867))

(assert (= (and b!1561867 res!1067247) b!1561868))

(declare-fun m!1437941 () Bool)

(assert (=> b!1561867 m!1437941))

(declare-fun m!1437943 () Bool)

(assert (=> b!1561868 m!1437943))

(assert (=> b!1561803 d!163625))

(declare-fun d!163627 () Bool)

(assert (=> d!163627 (= (validMask!0 mask!947) (and (or (= mask!947 #b00000000000000000000000000000111) (= mask!947 #b00000000000000000000000000001111) (= mask!947 #b00000000000000000000000000011111) (= mask!947 #b00000000000000000000000000111111) (= mask!947 #b00000000000000000000000001111111) (= mask!947 #b00000000000000000000000011111111) (= mask!947 #b00000000000000000000000111111111) (= mask!947 #b00000000000000000000001111111111) (= mask!947 #b00000000000000000000011111111111) (= mask!947 #b00000000000000000000111111111111) (= mask!947 #b00000000000000000001111111111111) (= mask!947 #b00000000000000000011111111111111) (= mask!947 #b00000000000000000111111111111111) (= mask!947 #b00000000000000001111111111111111) (= mask!947 #b00000000000000011111111111111111) (= mask!947 #b00000000000000111111111111111111) (= mask!947 #b00000000000001111111111111111111) (= mask!947 #b00000000000011111111111111111111) (= mask!947 #b00000000000111111111111111111111) (= mask!947 #b00000000001111111111111111111111) (= mask!947 #b00000000011111111111111111111111) (= mask!947 #b00000000111111111111111111111111) (= mask!947 #b00000001111111111111111111111111) (= mask!947 #b00000011111111111111111111111111) (= mask!947 #b00000111111111111111111111111111) (= mask!947 #b00001111111111111111111111111111) (= mask!947 #b00011111111111111111111111111111) (= mask!947 #b00111111111111111111111111111111)) (bvsle mask!947 #b00111111111111111111111111111111)))))

(assert (=> start!133786 d!163627))

(declare-fun d!163629 () Bool)

(assert (=> d!163629 (= (array_inv!39201 _values!487) (bvsge (size!50644 _values!487) #b00000000000000000000000000000000))))

(assert (=> start!133786 d!163629))

(declare-fun d!163631 () Bool)

(assert (=> d!163631 (= (array_inv!39202 _keys!637) (bvsge (size!50645 _keys!637) #b00000000000000000000000000000000))))

(assert (=> start!133786 d!163631))

(declare-fun b!1561876 () Bool)

(declare-fun e!870425 () Bool)

(assert (=> b!1561876 (= e!870425 tp_is_empty!38479)))

(declare-fun condMapEmpty!59097 () Bool)

(declare-fun mapDefault!59097 () ValueCell!18209)

(assert (=> mapNonEmpty!59088 (= condMapEmpty!59097 (= mapRest!59088 ((as const (Array (_ BitVec 32) ValueCell!18209)) mapDefault!59097)))))

(declare-fun mapRes!59097 () Bool)

(assert (=> mapNonEmpty!59088 (= tp!112743 (and e!870425 mapRes!59097))))

(declare-fun mapIsEmpty!59097 () Bool)

(assert (=> mapIsEmpty!59097 mapRes!59097))

(declare-fun mapNonEmpty!59097 () Bool)

(declare-fun tp!112752 () Bool)

(declare-fun e!870424 () Bool)

(assert (=> mapNonEmpty!59097 (= mapRes!59097 (and tp!112752 e!870424))))

(declare-fun mapKey!59097 () (_ BitVec 32))

(declare-fun mapValue!59097 () ValueCell!18209)

(declare-fun mapRest!59097 () (Array (_ BitVec 32) ValueCell!18209))

(assert (=> mapNonEmpty!59097 (= mapRest!59088 (store mapRest!59097 mapKey!59097 mapValue!59097))))

(declare-fun b!1561875 () Bool)

(assert (=> b!1561875 (= e!870424 tp_is_empty!38479)))

(assert (= (and mapNonEmpty!59088 condMapEmpty!59097) mapIsEmpty!59097))

(assert (= (and mapNonEmpty!59088 (not condMapEmpty!59097)) mapNonEmpty!59097))

(assert (= (and mapNonEmpty!59097 ((_ is ValueCellFull!18209) mapValue!59097)) b!1561875))

(assert (= (and mapNonEmpty!59088 ((_ is ValueCellFull!18209) mapDefault!59097)) b!1561876))

(declare-fun m!1437945 () Bool)

(assert (=> mapNonEmpty!59097 m!1437945))

(check-sat (not bm!71988) (not b!1561862) (not b!1561868) (not b!1561867) (not mapNonEmpty!59097) tp_is_empty!38479 (not b!1561859))
(check-sat)
