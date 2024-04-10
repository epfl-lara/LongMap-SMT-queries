; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35866 () Bool)

(assert start!35866)

(declare-fun b!360612 () Bool)

(declare-fun e!220769 () Bool)

(declare-fun tp_is_empty!8319 () Bool)

(assert (=> b!360612 (= e!220769 tp_is_empty!8319)))

(declare-fun b!360613 () Bool)

(declare-fun res!200580 () Bool)

(declare-fun e!220771 () Bool)

(assert (=> b!360613 (=> (not res!200580) (not e!220771))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!20189 0))(
  ( (array!20190 (arr!9588 (Array (_ BitVec 32) (_ BitVec 64))) (size!9940 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20189)

(declare-datatypes ((V!12069 0))(
  ( (V!12070 (val!4204 Int)) )
))
(declare-datatypes ((ValueCell!3816 0))(
  ( (ValueCellFull!3816 (v!6398 V!12069)) (EmptyCell!3816) )
))
(declare-datatypes ((array!20191 0))(
  ( (array!20192 (arr!9589 (Array (_ BitVec 32) ValueCell!3816)) (size!9941 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20191)

(assert (=> b!360613 (= res!200580 (and (= (size!9941 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9940 _keys!1456) (size!9941 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!360614 () Bool)

(declare-fun res!200581 () Bool)

(assert (=> b!360614 (=> (not res!200581) (not e!220771))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!20189 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!360614 (= res!200581 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!360615 () Bool)

(assert (=> b!360615 (= e!220771 (not (and (bvsge (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1805) (size!9940 _keys!1456)))))))

(assert (=> b!360615 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!12069)

(declare-datatypes ((Unit!11094 0))(
  ( (Unit!11095) )
))
(declare-fun lt!166466 () Unit!11094)

(declare-fun zeroValue!1150 () V!12069)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!62 (array!20189 array!20191 (_ BitVec 32) (_ BitVec 32) V!12069 V!12069 (_ BitVec 64) (_ BitVec 32)) Unit!11094)

(assert (=> b!360615 (= lt!166466 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!62 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!360616 () Bool)

(declare-fun e!220772 () Bool)

(assert (=> b!360616 (= e!220772 tp_is_empty!8319)))

(declare-fun b!360617 () Bool)

(declare-fun res!200584 () Bool)

(assert (=> b!360617 (=> (not res!200584) (not e!220771))))

(assert (=> b!360617 (= res!200584 (not (= (select (arr!9588 _keys!1456) from!1805) k0!1077)))))

(declare-fun res!200587 () Bool)

(assert (=> start!35866 (=> (not res!200587) (not e!220771))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35866 (= res!200587 (validMask!0 mask!1842))))

(assert (=> start!35866 e!220771))

(assert (=> start!35866 tp_is_empty!8319))

(assert (=> start!35866 true))

(declare-fun array_inv!7054 (array!20189) Bool)

(assert (=> start!35866 (array_inv!7054 _keys!1456)))

(declare-fun e!220768 () Bool)

(declare-fun array_inv!7055 (array!20191) Bool)

(assert (=> start!35866 (and (array_inv!7055 _values!1208) e!220768)))

(declare-fun b!360618 () Bool)

(declare-fun res!200583 () Bool)

(assert (=> b!360618 (=> (not res!200583) (not e!220771))))

(declare-datatypes ((List!5492 0))(
  ( (Nil!5489) (Cons!5488 (h!6344 (_ BitVec 64)) (t!10642 List!5492)) )
))
(declare-fun arrayNoDuplicates!0 (array!20189 (_ BitVec 32) List!5492) Bool)

(assert (=> b!360618 (= res!200583 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5489))))

(declare-fun b!360619 () Bool)

(declare-fun res!200582 () Bool)

(assert (=> b!360619 (=> (not res!200582) (not e!220771))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!360619 (= res!200582 (validKeyInArray!0 k0!1077))))

(declare-fun b!360620 () Bool)

(declare-fun res!200586 () Bool)

(assert (=> b!360620 (=> (not res!200586) (not e!220771))))

(assert (=> b!360620 (= res!200586 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9940 _keys!1456))))))

(declare-fun b!360621 () Bool)

(declare-fun mapRes!13986 () Bool)

(assert (=> b!360621 (= e!220768 (and e!220769 mapRes!13986))))

(declare-fun condMapEmpty!13986 () Bool)

(declare-fun mapDefault!13986 () ValueCell!3816)

(assert (=> b!360621 (= condMapEmpty!13986 (= (arr!9589 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3816)) mapDefault!13986)))))

(declare-fun mapNonEmpty!13986 () Bool)

(declare-fun tp!28053 () Bool)

(assert (=> mapNonEmpty!13986 (= mapRes!13986 (and tp!28053 e!220772))))

(declare-fun mapRest!13986 () (Array (_ BitVec 32) ValueCell!3816))

(declare-fun mapValue!13986 () ValueCell!3816)

(declare-fun mapKey!13986 () (_ BitVec 32))

(assert (=> mapNonEmpty!13986 (= (arr!9589 _values!1208) (store mapRest!13986 mapKey!13986 mapValue!13986))))

(declare-fun mapIsEmpty!13986 () Bool)

(assert (=> mapIsEmpty!13986 mapRes!13986))

(declare-fun b!360622 () Bool)

(declare-fun res!200585 () Bool)

(assert (=> b!360622 (=> (not res!200585) (not e!220771))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20189 (_ BitVec 32)) Bool)

(assert (=> b!360622 (= res!200585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(assert (= (and start!35866 res!200587) b!360613))

(assert (= (and b!360613 res!200580) b!360622))

(assert (= (and b!360622 res!200585) b!360618))

(assert (= (and b!360618 res!200583) b!360619))

(assert (= (and b!360619 res!200582) b!360620))

(assert (= (and b!360620 res!200586) b!360614))

(assert (= (and b!360614 res!200581) b!360617))

(assert (= (and b!360617 res!200584) b!360615))

(assert (= (and b!360621 condMapEmpty!13986) mapIsEmpty!13986))

(assert (= (and b!360621 (not condMapEmpty!13986)) mapNonEmpty!13986))

(get-info :version)

(assert (= (and mapNonEmpty!13986 ((_ is ValueCellFull!3816) mapValue!13986)) b!360616))

(assert (= (and b!360621 ((_ is ValueCellFull!3816) mapDefault!13986)) b!360612))

(assert (= start!35866 b!360621))

(declare-fun m!357719 () Bool)

(assert (=> b!360615 m!357719))

(declare-fun m!357721 () Bool)

(assert (=> b!360615 m!357721))

(declare-fun m!357723 () Bool)

(assert (=> start!35866 m!357723))

(declare-fun m!357725 () Bool)

(assert (=> start!35866 m!357725))

(declare-fun m!357727 () Bool)

(assert (=> start!35866 m!357727))

(declare-fun m!357729 () Bool)

(assert (=> mapNonEmpty!13986 m!357729))

(declare-fun m!357731 () Bool)

(assert (=> b!360622 m!357731))

(declare-fun m!357733 () Bool)

(assert (=> b!360614 m!357733))

(declare-fun m!357735 () Bool)

(assert (=> b!360617 m!357735))

(declare-fun m!357737 () Bool)

(assert (=> b!360618 m!357737))

(declare-fun m!357739 () Bool)

(assert (=> b!360619 m!357739))

(check-sat (not b!360619) (not mapNonEmpty!13986) (not start!35866) (not b!360622) tp_is_empty!8319 (not b!360618) (not b!360614) (not b!360615))
(check-sat)
(get-model)

(declare-fun d!71853 () Bool)

(assert (=> d!71853 (= (validMask!0 mask!1842) (and (or (= mask!1842 #b00000000000000000000000000000111) (= mask!1842 #b00000000000000000000000000001111) (= mask!1842 #b00000000000000000000000000011111) (= mask!1842 #b00000000000000000000000000111111) (= mask!1842 #b00000000000000000000000001111111) (= mask!1842 #b00000000000000000000000011111111) (= mask!1842 #b00000000000000000000000111111111) (= mask!1842 #b00000000000000000000001111111111) (= mask!1842 #b00000000000000000000011111111111) (= mask!1842 #b00000000000000000000111111111111) (= mask!1842 #b00000000000000000001111111111111) (= mask!1842 #b00000000000000000011111111111111) (= mask!1842 #b00000000000000000111111111111111) (= mask!1842 #b00000000000000001111111111111111) (= mask!1842 #b00000000000000011111111111111111) (= mask!1842 #b00000000000000111111111111111111) (= mask!1842 #b00000000000001111111111111111111) (= mask!1842 #b00000000000011111111111111111111) (= mask!1842 #b00000000000111111111111111111111) (= mask!1842 #b00000000001111111111111111111111) (= mask!1842 #b00000000011111111111111111111111) (= mask!1842 #b00000000111111111111111111111111) (= mask!1842 #b00000001111111111111111111111111) (= mask!1842 #b00000011111111111111111111111111) (= mask!1842 #b00000111111111111111111111111111) (= mask!1842 #b00001111111111111111111111111111) (= mask!1842 #b00011111111111111111111111111111) (= mask!1842 #b00111111111111111111111111111111)) (bvsle mask!1842 #b00111111111111111111111111111111)))))

(assert (=> start!35866 d!71853))

(declare-fun d!71855 () Bool)

(assert (=> d!71855 (= (array_inv!7054 _keys!1456) (bvsge (size!9940 _keys!1456) #b00000000000000000000000000000000))))

(assert (=> start!35866 d!71855))

(declare-fun d!71857 () Bool)

(assert (=> d!71857 (= (array_inv!7055 _values!1208) (bvsge (size!9941 _values!1208) #b00000000000000000000000000000000))))

(assert (=> start!35866 d!71857))

(declare-fun b!360664 () Bool)

(declare-fun e!220794 () Bool)

(declare-fun e!220795 () Bool)

(assert (=> b!360664 (= e!220794 e!220795)))

(declare-fun lt!166477 () (_ BitVec 64))

(assert (=> b!360664 (= lt!166477 (select (arr!9588 _keys!1456) #b00000000000000000000000000000000))))

(declare-fun lt!166478 () Unit!11094)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20189 (_ BitVec 64) (_ BitVec 32)) Unit!11094)

(assert (=> b!360664 (= lt!166478 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1456 lt!166477 #b00000000000000000000000000000000))))

(assert (=> b!360664 (arrayContainsKey!0 _keys!1456 lt!166477 #b00000000000000000000000000000000)))

(declare-fun lt!166476 () Unit!11094)

(assert (=> b!360664 (= lt!166476 lt!166478)))

(declare-fun res!200617 () Bool)

(declare-datatypes ((SeekEntryResult!3491 0))(
  ( (MissingZero!3491 (index!16143 (_ BitVec 32))) (Found!3491 (index!16144 (_ BitVec 32))) (Intermediate!3491 (undefined!4303 Bool) (index!16145 (_ BitVec 32)) (x!35925 (_ BitVec 32))) (Undefined!3491) (MissingVacant!3491 (index!16146 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20189 (_ BitVec 32)) SeekEntryResult!3491)

(assert (=> b!360664 (= res!200617 (= (seekEntryOrOpen!0 (select (arr!9588 _keys!1456) #b00000000000000000000000000000000) _keys!1456 mask!1842) (Found!3491 #b00000000000000000000000000000000)))))

(assert (=> b!360664 (=> (not res!200617) (not e!220795))))

(declare-fun d!71859 () Bool)

(declare-fun res!200616 () Bool)

(declare-fun e!220796 () Bool)

(assert (=> d!71859 (=> res!200616 e!220796)))

(assert (=> d!71859 (= res!200616 (bvsge #b00000000000000000000000000000000 (size!9940 _keys!1456)))))

(assert (=> d!71859 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842) e!220796)))

(declare-fun b!360665 () Bool)

(assert (=> b!360665 (= e!220796 e!220794)))

(declare-fun c!53712 () Bool)

(assert (=> b!360665 (= c!53712 (validKeyInArray!0 (select (arr!9588 _keys!1456) #b00000000000000000000000000000000)))))

(declare-fun b!360666 () Bool)

(declare-fun call!27163 () Bool)

(assert (=> b!360666 (= e!220795 call!27163)))

(declare-fun b!360667 () Bool)

(assert (=> b!360667 (= e!220794 call!27163)))

(declare-fun bm!27160 () Bool)

(assert (=> bm!27160 (= call!27163 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1456 mask!1842))))

(assert (= (and d!71859 (not res!200616)) b!360665))

(assert (= (and b!360665 c!53712) b!360664))

(assert (= (and b!360665 (not c!53712)) b!360667))

(assert (= (and b!360664 res!200617) b!360666))

(assert (= (or b!360666 b!360667) bm!27160))

(declare-fun m!357763 () Bool)

(assert (=> b!360664 m!357763))

(declare-fun m!357765 () Bool)

(assert (=> b!360664 m!357765))

(declare-fun m!357767 () Bool)

(assert (=> b!360664 m!357767))

(assert (=> b!360664 m!357763))

(declare-fun m!357769 () Bool)

(assert (=> b!360664 m!357769))

(assert (=> b!360665 m!357763))

(assert (=> b!360665 m!357763))

(declare-fun m!357771 () Bool)

(assert (=> b!360665 m!357771))

(declare-fun m!357773 () Bool)

(assert (=> bm!27160 m!357773))

(assert (=> b!360622 d!71859))

(declare-fun d!71861 () Bool)

(assert (=> d!71861 (= (validKeyInArray!0 k0!1077) (and (not (= k0!1077 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1077 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!360619 d!71861))

(declare-fun b!360678 () Bool)

(declare-fun e!220806 () Bool)

(declare-fun call!27166 () Bool)

(assert (=> b!360678 (= e!220806 call!27166)))

(declare-fun b!360679 () Bool)

(declare-fun e!220808 () Bool)

(declare-fun contains!2419 (List!5492 (_ BitVec 64)) Bool)

(assert (=> b!360679 (= e!220808 (contains!2419 Nil!5489 (select (arr!9588 _keys!1456) #b00000000000000000000000000000000)))))

(declare-fun b!360680 () Bool)

(declare-fun e!220805 () Bool)

(declare-fun e!220807 () Bool)

(assert (=> b!360680 (= e!220805 e!220807)))

(declare-fun res!200625 () Bool)

(assert (=> b!360680 (=> (not res!200625) (not e!220807))))

(assert (=> b!360680 (= res!200625 (not e!220808))))

(declare-fun res!200626 () Bool)

(assert (=> b!360680 (=> (not res!200626) (not e!220808))))

(assert (=> b!360680 (= res!200626 (validKeyInArray!0 (select (arr!9588 _keys!1456) #b00000000000000000000000000000000)))))

(declare-fun bm!27163 () Bool)

(declare-fun c!53715 () Bool)

(assert (=> bm!27163 (= call!27166 (arrayNoDuplicates!0 _keys!1456 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53715 (Cons!5488 (select (arr!9588 _keys!1456) #b00000000000000000000000000000000) Nil!5489) Nil!5489)))))

(declare-fun b!360681 () Bool)

(assert (=> b!360681 (= e!220806 call!27166)))

(declare-fun d!71863 () Bool)

(declare-fun res!200624 () Bool)

(assert (=> d!71863 (=> res!200624 e!220805)))

(assert (=> d!71863 (= res!200624 (bvsge #b00000000000000000000000000000000 (size!9940 _keys!1456)))))

(assert (=> d!71863 (= (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5489) e!220805)))

(declare-fun b!360682 () Bool)

(assert (=> b!360682 (= e!220807 e!220806)))

(assert (=> b!360682 (= c!53715 (validKeyInArray!0 (select (arr!9588 _keys!1456) #b00000000000000000000000000000000)))))

(assert (= (and d!71863 (not res!200624)) b!360680))

(assert (= (and b!360680 res!200626) b!360679))

(assert (= (and b!360680 res!200625) b!360682))

(assert (= (and b!360682 c!53715) b!360678))

(assert (= (and b!360682 (not c!53715)) b!360681))

(assert (= (or b!360678 b!360681) bm!27163))

(assert (=> b!360679 m!357763))

(assert (=> b!360679 m!357763))

(declare-fun m!357775 () Bool)

(assert (=> b!360679 m!357775))

(assert (=> b!360680 m!357763))

(assert (=> b!360680 m!357763))

(assert (=> b!360680 m!357771))

(assert (=> bm!27163 m!357763))

(declare-fun m!357777 () Bool)

(assert (=> bm!27163 m!357777))

(assert (=> b!360682 m!357763))

(assert (=> b!360682 m!357763))

(assert (=> b!360682 m!357771))

(assert (=> b!360618 d!71863))

(declare-fun d!71865 () Bool)

(declare-fun res!200631 () Bool)

(declare-fun e!220813 () Bool)

(assert (=> d!71865 (=> res!200631 e!220813)))

(assert (=> d!71865 (= res!200631 (= (select (arr!9588 _keys!1456) (bvadd #b00000000000000000000000000000001 from!1805)) k0!1077))))

(assert (=> d!71865 (= (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805)) e!220813)))

(declare-fun b!360687 () Bool)

(declare-fun e!220814 () Bool)

(assert (=> b!360687 (= e!220813 e!220814)))

(declare-fun res!200632 () Bool)

(assert (=> b!360687 (=> (not res!200632) (not e!220814))))

(assert (=> b!360687 (= res!200632 (bvslt (bvadd #b00000000000000000000000000000001 from!1805 #b00000000000000000000000000000001) (size!9940 _keys!1456)))))

(declare-fun b!360688 () Bool)

(assert (=> b!360688 (= e!220814 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805 #b00000000000000000000000000000001)))))

(assert (= (and d!71865 (not res!200631)) b!360687))

(assert (= (and b!360687 res!200632) b!360688))

(declare-fun m!357779 () Bool)

(assert (=> d!71865 m!357779))

(declare-fun m!357781 () Bool)

(assert (=> b!360688 m!357781))

(assert (=> b!360615 d!71865))

(declare-fun d!71867 () Bool)

(assert (=> d!71867 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd from!1805 #b00000000000000000000000000000001))))

(declare-fun lt!166481 () Unit!11094)

(declare-fun choose!1310 (array!20189 array!20191 (_ BitVec 32) (_ BitVec 32) V!12069 V!12069 (_ BitVec 64) (_ BitVec 32)) Unit!11094)

(assert (=> d!71867 (= lt!166481 (choose!1310 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(assert (=> d!71867 (validMask!0 mask!1842)))

(assert (=> d!71867 (= (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!62 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805) lt!166481)))

(declare-fun bs!12291 () Bool)

(assert (= bs!12291 d!71867))

(declare-fun m!357783 () Bool)

(assert (=> bs!12291 m!357783))

(declare-fun m!357785 () Bool)

(assert (=> bs!12291 m!357785))

(assert (=> bs!12291 m!357723))

(assert (=> b!360615 d!71867))

(declare-fun d!71869 () Bool)

(declare-fun res!200633 () Bool)

(declare-fun e!220815 () Bool)

(assert (=> d!71869 (=> res!200633 e!220815)))

(assert (=> d!71869 (= res!200633 (= (select (arr!9588 _keys!1456) from!1805) k0!1077))))

(assert (=> d!71869 (= (arrayContainsKey!0 _keys!1456 k0!1077 from!1805) e!220815)))

(declare-fun b!360689 () Bool)

(declare-fun e!220816 () Bool)

(assert (=> b!360689 (= e!220815 e!220816)))

(declare-fun res!200634 () Bool)

(assert (=> b!360689 (=> (not res!200634) (not e!220816))))

(assert (=> b!360689 (= res!200634 (bvslt (bvadd from!1805 #b00000000000000000000000000000001) (size!9940 _keys!1456)))))

(declare-fun b!360690 () Bool)

(assert (=> b!360690 (= e!220816 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd from!1805 #b00000000000000000000000000000001)))))

(assert (= (and d!71869 (not res!200633)) b!360689))

(assert (= (and b!360689 res!200634) b!360690))

(assert (=> d!71869 m!357735))

(assert (=> b!360690 m!357783))

(assert (=> b!360614 d!71869))

(declare-fun mapIsEmpty!13992 () Bool)

(declare-fun mapRes!13992 () Bool)

(assert (=> mapIsEmpty!13992 mapRes!13992))

(declare-fun b!360697 () Bool)

(declare-fun e!220822 () Bool)

(assert (=> b!360697 (= e!220822 tp_is_empty!8319)))

(declare-fun b!360698 () Bool)

(declare-fun e!220821 () Bool)

(assert (=> b!360698 (= e!220821 tp_is_empty!8319)))

(declare-fun condMapEmpty!13992 () Bool)

(declare-fun mapDefault!13992 () ValueCell!3816)

(assert (=> mapNonEmpty!13986 (= condMapEmpty!13992 (= mapRest!13986 ((as const (Array (_ BitVec 32) ValueCell!3816)) mapDefault!13992)))))

(assert (=> mapNonEmpty!13986 (= tp!28053 (and e!220821 mapRes!13992))))

(declare-fun mapNonEmpty!13992 () Bool)

(declare-fun tp!28059 () Bool)

(assert (=> mapNonEmpty!13992 (= mapRes!13992 (and tp!28059 e!220822))))

(declare-fun mapKey!13992 () (_ BitVec 32))

(declare-fun mapRest!13992 () (Array (_ BitVec 32) ValueCell!3816))

(declare-fun mapValue!13992 () ValueCell!3816)

(assert (=> mapNonEmpty!13992 (= mapRest!13986 (store mapRest!13992 mapKey!13992 mapValue!13992))))

(assert (= (and mapNonEmpty!13986 condMapEmpty!13992) mapIsEmpty!13992))

(assert (= (and mapNonEmpty!13986 (not condMapEmpty!13992)) mapNonEmpty!13992))

(assert (= (and mapNonEmpty!13992 ((_ is ValueCellFull!3816) mapValue!13992)) b!360697))

(assert (= (and mapNonEmpty!13986 ((_ is ValueCellFull!3816) mapDefault!13992)) b!360698))

(declare-fun m!357787 () Bool)

(assert (=> mapNonEmpty!13992 m!357787))

(check-sat (not bm!27163) (not mapNonEmpty!13992) (not b!360690) (not b!360679) (not b!360664) (not b!360665) (not d!71867) (not bm!27160) (not b!360682) tp_is_empty!8319 (not b!360688) (not b!360680))
(check-sat)
