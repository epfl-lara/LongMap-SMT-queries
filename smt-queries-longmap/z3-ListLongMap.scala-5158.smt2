; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70078 () Bool)

(assert start!70078)

(declare-fun b!813669 () Bool)

(declare-fun res!555693 () Bool)

(declare-fun e!450849 () Bool)

(assert (=> b!813669 (=> (not res!555693) (not e!450849))))

(declare-datatypes ((array!44349 0))(
  ( (array!44350 (arr!21232 (Array (_ BitVec 32) (_ BitVec 64))) (size!21652 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44349)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!23755 0))(
  ( (V!23756 (val!7080 Int)) )
))
(declare-datatypes ((ValueCell!6617 0))(
  ( (ValueCellFull!6617 (v!9507 V!23755)) (EmptyCell!6617) )
))
(declare-datatypes ((array!44351 0))(
  ( (array!44352 (arr!21233 (Array (_ BitVec 32) ValueCell!6617)) (size!21653 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44351)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!813669 (= res!555693 (and (= (size!21653 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21652 _keys!976) (size!21653 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!813670 () Bool)

(declare-fun res!555694 () Bool)

(assert (=> b!813670 (=> (not res!555694) (not e!450849))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44349 (_ BitVec 32)) Bool)

(assert (=> b!813670 (= res!555694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!813671 () Bool)

(declare-fun e!450851 () Bool)

(declare-fun tp_is_empty!14065 () Bool)

(assert (=> b!813671 (= e!450851 tp_is_empty!14065)))

(declare-fun b!813672 () Bool)

(declare-fun e!450847 () Bool)

(declare-fun mapRes!22672 () Bool)

(assert (=> b!813672 (= e!450847 (and e!450851 mapRes!22672))))

(declare-fun condMapEmpty!22672 () Bool)

(declare-fun mapDefault!22672 () ValueCell!6617)

(assert (=> b!813672 (= condMapEmpty!22672 (= (arr!21233 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6617)) mapDefault!22672)))))

(declare-fun mapIsEmpty!22672 () Bool)

(assert (=> mapIsEmpty!22672 mapRes!22672))

(declare-fun b!813673 () Bool)

(declare-fun e!450850 () Bool)

(assert (=> b!813673 (= e!450850 tp_is_empty!14065)))

(declare-fun mapNonEmpty!22672 () Bool)

(declare-fun tp!43780 () Bool)

(assert (=> mapNonEmpty!22672 (= mapRes!22672 (and tp!43780 e!450850))))

(declare-fun mapKey!22672 () (_ BitVec 32))

(declare-fun mapValue!22672 () ValueCell!6617)

(declare-fun mapRest!22672 () (Array (_ BitVec 32) ValueCell!6617))

(assert (=> mapNonEmpty!22672 (= (arr!21233 _values!788) (store mapRest!22672 mapKey!22672 mapValue!22672))))

(declare-fun b!813674 () Bool)

(declare-fun res!555692 () Bool)

(assert (=> b!813674 (=> (not res!555692) (not e!450849))))

(declare-datatypes ((List!15009 0))(
  ( (Nil!15006) (Cons!15005 (h!16140 (_ BitVec 64)) (t!21316 List!15009)) )
))
(declare-fun arrayNoDuplicates!0 (array!44349 (_ BitVec 32) List!15009) Bool)

(assert (=> b!813674 (= res!555692 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15006))))

(declare-fun res!555691 () Bool)

(assert (=> start!70078 (=> (not res!555691) (not e!450849))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70078 (= res!555691 (validMask!0 mask!1312))))

(assert (=> start!70078 e!450849))

(declare-fun array_inv!17063 (array!44349) Bool)

(assert (=> start!70078 (array_inv!17063 _keys!976)))

(assert (=> start!70078 true))

(declare-fun array_inv!17064 (array!44351) Bool)

(assert (=> start!70078 (and (array_inv!17064 _values!788) e!450847)))

(declare-fun b!813668 () Bool)

(assert (=> b!813668 (= e!450849 (bvsgt #b00000000000000000000000000000000 (size!21652 _keys!976)))))

(assert (= (and start!70078 res!555691) b!813669))

(assert (= (and b!813669 res!555693) b!813670))

(assert (= (and b!813670 res!555694) b!813674))

(assert (= (and b!813674 res!555692) b!813668))

(assert (= (and b!813672 condMapEmpty!22672) mapIsEmpty!22672))

(assert (= (and b!813672 (not condMapEmpty!22672)) mapNonEmpty!22672))

(get-info :version)

(assert (= (and mapNonEmpty!22672 ((_ is ValueCellFull!6617) mapValue!22672)) b!813673))

(assert (= (and b!813672 ((_ is ValueCellFull!6617) mapDefault!22672)) b!813671))

(assert (= start!70078 b!813672))

(declare-fun m!756331 () Bool)

(assert (=> b!813670 m!756331))

(declare-fun m!756333 () Bool)

(assert (=> mapNonEmpty!22672 m!756333))

(declare-fun m!756335 () Bool)

(assert (=> b!813674 m!756335))

(declare-fun m!756337 () Bool)

(assert (=> start!70078 m!756337))

(declare-fun m!756339 () Bool)

(assert (=> start!70078 m!756339))

(declare-fun m!756341 () Bool)

(assert (=> start!70078 m!756341))

(check-sat (not start!70078) (not b!813674) (not mapNonEmpty!22672) tp_is_empty!14065 (not b!813670))
(check-sat)
(get-model)

(declare-fun d!104675 () Bool)

(declare-fun res!555723 () Bool)

(declare-fun e!450888 () Bool)

(assert (=> d!104675 (=> res!555723 e!450888)))

(assert (=> d!104675 (= res!555723 (bvsge #b00000000000000000000000000000000 (size!21652 _keys!976)))))

(assert (=> d!104675 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!450888)))

(declare-fun b!813725 () Bool)

(declare-fun e!450889 () Bool)

(declare-fun call!35532 () Bool)

(assert (=> b!813725 (= e!450889 call!35532)))

(declare-fun b!813726 () Bool)

(declare-fun e!450890 () Bool)

(assert (=> b!813726 (= e!450890 e!450889)))

(declare-fun lt!364554 () (_ BitVec 64))

(assert (=> b!813726 (= lt!364554 (select (arr!21232 _keys!976) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27695 0))(
  ( (Unit!27696) )
))
(declare-fun lt!364553 () Unit!27695)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!44349 (_ BitVec 64) (_ BitVec 32)) Unit!27695)

(assert (=> b!813726 (= lt!364553 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!364554 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!44349 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!813726 (arrayContainsKey!0 _keys!976 lt!364554 #b00000000000000000000000000000000)))

(declare-fun lt!364552 () Unit!27695)

(assert (=> b!813726 (= lt!364552 lt!364553)))

(declare-fun res!555724 () Bool)

(declare-datatypes ((SeekEntryResult!8669 0))(
  ( (MissingZero!8669 (index!37047 (_ BitVec 32))) (Found!8669 (index!37048 (_ BitVec 32))) (Intermediate!8669 (undefined!9481 Bool) (index!37049 (_ BitVec 32)) (x!68242 (_ BitVec 32))) (Undefined!8669) (MissingVacant!8669 (index!37050 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44349 (_ BitVec 32)) SeekEntryResult!8669)

(assert (=> b!813726 (= res!555724 (= (seekEntryOrOpen!0 (select (arr!21232 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8669 #b00000000000000000000000000000000)))))

(assert (=> b!813726 (=> (not res!555724) (not e!450889))))

(declare-fun b!813727 () Bool)

(assert (=> b!813727 (= e!450890 call!35532)))

(declare-fun b!813728 () Bool)

(assert (=> b!813728 (= e!450888 e!450890)))

(declare-fun c!89180 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!813728 (= c!89180 (validKeyInArray!0 (select (arr!21232 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35529 () Bool)

(assert (=> bm!35529 (= call!35532 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(assert (= (and d!104675 (not res!555723)) b!813728))

(assert (= (and b!813728 c!89180) b!813726))

(assert (= (and b!813728 (not c!89180)) b!813727))

(assert (= (and b!813726 res!555724) b!813725))

(assert (= (or b!813725 b!813727) bm!35529))

(declare-fun m!756367 () Bool)

(assert (=> b!813726 m!756367))

(declare-fun m!756369 () Bool)

(assert (=> b!813726 m!756369))

(declare-fun m!756371 () Bool)

(assert (=> b!813726 m!756371))

(assert (=> b!813726 m!756367))

(declare-fun m!756373 () Bool)

(assert (=> b!813726 m!756373))

(assert (=> b!813728 m!756367))

(assert (=> b!813728 m!756367))

(declare-fun m!756375 () Bool)

(assert (=> b!813728 m!756375))

(declare-fun m!756377 () Bool)

(assert (=> bm!35529 m!756377))

(assert (=> b!813670 d!104675))

(declare-fun b!813739 () Bool)

(declare-fun e!450902 () Bool)

(declare-fun call!35535 () Bool)

(assert (=> b!813739 (= e!450902 call!35535)))

(declare-fun bm!35532 () Bool)

(declare-fun c!89183 () Bool)

(assert (=> bm!35532 (= call!35535 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89183 (Cons!15005 (select (arr!21232 _keys!976) #b00000000000000000000000000000000) Nil!15006) Nil!15006)))))

(declare-fun d!104677 () Bool)

(declare-fun res!555732 () Bool)

(declare-fun e!450901 () Bool)

(assert (=> d!104677 (=> res!555732 e!450901)))

(assert (=> d!104677 (= res!555732 (bvsge #b00000000000000000000000000000000 (size!21652 _keys!976)))))

(assert (=> d!104677 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15006) e!450901)))

(declare-fun b!813740 () Bool)

(assert (=> b!813740 (= e!450902 call!35535)))

(declare-fun b!813741 () Bool)

(declare-fun e!450899 () Bool)

(declare-fun contains!4120 (List!15009 (_ BitVec 64)) Bool)

(assert (=> b!813741 (= e!450899 (contains!4120 Nil!15006 (select (arr!21232 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!813742 () Bool)

(declare-fun e!450900 () Bool)

(assert (=> b!813742 (= e!450900 e!450902)))

(assert (=> b!813742 (= c!89183 (validKeyInArray!0 (select (arr!21232 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!813743 () Bool)

(assert (=> b!813743 (= e!450901 e!450900)))

(declare-fun res!555733 () Bool)

(assert (=> b!813743 (=> (not res!555733) (not e!450900))))

(assert (=> b!813743 (= res!555733 (not e!450899))))

(declare-fun res!555731 () Bool)

(assert (=> b!813743 (=> (not res!555731) (not e!450899))))

(assert (=> b!813743 (= res!555731 (validKeyInArray!0 (select (arr!21232 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!104677 (not res!555732)) b!813743))

(assert (= (and b!813743 res!555731) b!813741))

(assert (= (and b!813743 res!555733) b!813742))

(assert (= (and b!813742 c!89183) b!813740))

(assert (= (and b!813742 (not c!89183)) b!813739))

(assert (= (or b!813740 b!813739) bm!35532))

(assert (=> bm!35532 m!756367))

(declare-fun m!756379 () Bool)

(assert (=> bm!35532 m!756379))

(assert (=> b!813741 m!756367))

(assert (=> b!813741 m!756367))

(declare-fun m!756381 () Bool)

(assert (=> b!813741 m!756381))

(assert (=> b!813742 m!756367))

(assert (=> b!813742 m!756367))

(assert (=> b!813742 m!756375))

(assert (=> b!813743 m!756367))

(assert (=> b!813743 m!756367))

(assert (=> b!813743 m!756375))

(assert (=> b!813674 d!104677))

(declare-fun d!104679 () Bool)

(assert (=> d!104679 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!70078 d!104679))

(declare-fun d!104681 () Bool)

(assert (=> d!104681 (= (array_inv!17063 _keys!976) (bvsge (size!21652 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!70078 d!104681))

(declare-fun d!104683 () Bool)

(assert (=> d!104683 (= (array_inv!17064 _values!788) (bvsge (size!21653 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!70078 d!104683))

(declare-fun b!813751 () Bool)

(declare-fun e!450907 () Bool)

(assert (=> b!813751 (= e!450907 tp_is_empty!14065)))

(declare-fun condMapEmpty!22681 () Bool)

(declare-fun mapDefault!22681 () ValueCell!6617)

(assert (=> mapNonEmpty!22672 (= condMapEmpty!22681 (= mapRest!22672 ((as const (Array (_ BitVec 32) ValueCell!6617)) mapDefault!22681)))))

(declare-fun mapRes!22681 () Bool)

(assert (=> mapNonEmpty!22672 (= tp!43780 (and e!450907 mapRes!22681))))

(declare-fun mapNonEmpty!22681 () Bool)

(declare-fun tp!43789 () Bool)

(declare-fun e!450908 () Bool)

(assert (=> mapNonEmpty!22681 (= mapRes!22681 (and tp!43789 e!450908))))

(declare-fun mapValue!22681 () ValueCell!6617)

(declare-fun mapKey!22681 () (_ BitVec 32))

(declare-fun mapRest!22681 () (Array (_ BitVec 32) ValueCell!6617))

(assert (=> mapNonEmpty!22681 (= mapRest!22672 (store mapRest!22681 mapKey!22681 mapValue!22681))))

(declare-fun mapIsEmpty!22681 () Bool)

(assert (=> mapIsEmpty!22681 mapRes!22681))

(declare-fun b!813750 () Bool)

(assert (=> b!813750 (= e!450908 tp_is_empty!14065)))

(assert (= (and mapNonEmpty!22672 condMapEmpty!22681) mapIsEmpty!22681))

(assert (= (and mapNonEmpty!22672 (not condMapEmpty!22681)) mapNonEmpty!22681))

(assert (= (and mapNonEmpty!22681 ((_ is ValueCellFull!6617) mapValue!22681)) b!813750))

(assert (= (and mapNonEmpty!22672 ((_ is ValueCellFull!6617) mapDefault!22681)) b!813751))

(declare-fun m!756383 () Bool)

(assert (=> mapNonEmpty!22681 m!756383))

(check-sat (not b!813728) (not b!813726) (not bm!35529) (not b!813743) (not mapNonEmpty!22681) (not b!813741) (not bm!35532) tp_is_empty!14065 (not b!813742))
(check-sat)
