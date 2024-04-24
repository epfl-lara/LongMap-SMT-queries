; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70978 () Bool)

(assert start!70978)

(declare-fun b_free!13069 () Bool)

(declare-fun b_next!13069 () Bool)

(assert (=> start!70978 (= b_free!13069 (not b_next!13069))))

(declare-fun tp!45952 () Bool)

(declare-fun b_and!21951 () Bool)

(assert (=> start!70978 (= tp!45952 b_and!21951)))

(declare-fun b!823396 () Bool)

(declare-fun e!457885 () Bool)

(declare-fun e!457887 () Bool)

(declare-fun mapRes!23779 () Bool)

(assert (=> b!823396 (= e!457885 (and e!457887 mapRes!23779))))

(declare-fun condMapEmpty!23779 () Bool)

(declare-datatypes ((V!24707 0))(
  ( (V!24708 (val!7437 Int)) )
))
(declare-datatypes ((ValueCell!6974 0))(
  ( (ValueCellFull!6974 (v!9868 V!24707)) (EmptyCell!6974) )
))
(declare-datatypes ((array!45753 0))(
  ( (array!45754 (arr!21922 (Array (_ BitVec 32) ValueCell!6974)) (size!22342 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45753)

(declare-fun mapDefault!23779 () ValueCell!6974)

(assert (=> b!823396 (= condMapEmpty!23779 (= (arr!21922 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6974)) mapDefault!23779)))))

(declare-fun b!823397 () Bool)

(declare-fun res!561338 () Bool)

(declare-fun e!457888 () Bool)

(assert (=> b!823397 (=> (not res!561338) (not e!457888))))

(declare-datatypes ((array!45755 0))(
  ( (array!45756 (arr!21923 (Array (_ BitVec 32) (_ BitVec 64))) (size!22343 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45755)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45755 (_ BitVec 32)) Bool)

(assert (=> b!823397 (= res!561338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!823398 () Bool)

(declare-fun e!457889 () Bool)

(assert (=> b!823398 (= e!457888 (not e!457889))))

(declare-fun res!561340 () Bool)

(assert (=> b!823398 (=> res!561340 e!457889)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!823398 (= res!561340 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9746 0))(
  ( (tuple2!9747 (_1!4884 (_ BitVec 64)) (_2!4884 V!24707)) )
))
(declare-datatypes ((List!15531 0))(
  ( (Nil!15528) (Cons!15527 (h!16662 tuple2!9746) (t!21860 List!15531)) )
))
(declare-datatypes ((ListLongMap!8571 0))(
  ( (ListLongMap!8572 (toList!4301 List!15531)) )
))
(declare-fun lt!370542 () ListLongMap!8571)

(declare-fun lt!370549 () ListLongMap!8571)

(assert (=> b!823398 (= lt!370542 lt!370549)))

(declare-fun zeroValueAfter!34 () V!24707)

(declare-fun minValue!754 () V!24707)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28151 0))(
  ( (Unit!28152) )
))
(declare-fun lt!370551 () Unit!28151)

(declare-fun zeroValueBefore!34 () V!24707)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!474 (array!45755 array!45753 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24707 V!24707 V!24707 V!24707 (_ BitVec 32) Int) Unit!28151)

(assert (=> b!823398 (= lt!370551 (lemmaNoChangeToArrayThenSameMapNoExtras!474 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2386 (array!45755 array!45753 (_ BitVec 32) (_ BitVec 32) V!24707 V!24707 (_ BitVec 32) Int) ListLongMap!8571)

(assert (=> b!823398 (= lt!370549 (getCurrentListMapNoExtraKeys!2386 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823398 (= lt!370542 (getCurrentListMapNoExtraKeys!2386 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23779 () Bool)

(assert (=> mapIsEmpty!23779 mapRes!23779))

(declare-fun b!823399 () Bool)

(declare-fun res!561337 () Bool)

(assert (=> b!823399 (=> (not res!561337) (not e!457888))))

(assert (=> b!823399 (= res!561337 (and (= (size!22342 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22343 _keys!976) (size!22342 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!561339 () Bool)

(assert (=> start!70978 (=> (not res!561339) (not e!457888))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70978 (= res!561339 (validMask!0 mask!1312))))

(assert (=> start!70978 e!457888))

(declare-fun tp_is_empty!14779 () Bool)

(assert (=> start!70978 tp_is_empty!14779))

(declare-fun array_inv!17537 (array!45755) Bool)

(assert (=> start!70978 (array_inv!17537 _keys!976)))

(assert (=> start!70978 true))

(declare-fun array_inv!17538 (array!45753) Bool)

(assert (=> start!70978 (and (array_inv!17538 _values!788) e!457885)))

(assert (=> start!70978 tp!45952))

(declare-fun b!823400 () Bool)

(declare-fun e!457886 () Bool)

(assert (=> b!823400 (= e!457886 tp_is_empty!14779)))

(declare-fun b!823401 () Bool)

(assert (=> b!823401 (= e!457889 true)))

(declare-fun lt!370545 () ListLongMap!8571)

(declare-fun lt!370544 () ListLongMap!8571)

(declare-fun lt!370546 () tuple2!9746)

(declare-fun +!1890 (ListLongMap!8571 tuple2!9746) ListLongMap!8571)

(assert (=> b!823401 (= lt!370545 (+!1890 lt!370544 lt!370546))))

(declare-fun lt!370547 () Unit!28151)

(declare-fun addCommutativeForDiffKeys!448 (ListLongMap!8571 (_ BitVec 64) V!24707 (_ BitVec 64) V!24707) Unit!28151)

(assert (=> b!823401 (= lt!370547 (addCommutativeForDiffKeys!448 lt!370542 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!370543 () ListLongMap!8571)

(assert (=> b!823401 (= lt!370543 lt!370545)))

(declare-fun lt!370550 () tuple2!9746)

(assert (=> b!823401 (= lt!370545 (+!1890 (+!1890 lt!370542 lt!370546) lt!370550))))

(assert (=> b!823401 (= lt!370546 (tuple2!9747 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!370548 () ListLongMap!8571)

(assert (=> b!823401 (= lt!370548 lt!370544)))

(assert (=> b!823401 (= lt!370544 (+!1890 lt!370542 lt!370550))))

(assert (=> b!823401 (= lt!370550 (tuple2!9747 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun getCurrentListMap!2454 (array!45755 array!45753 (_ BitVec 32) (_ BitVec 32) V!24707 V!24707 (_ BitVec 32) Int) ListLongMap!8571)

(assert (=> b!823401 (= lt!370543 (getCurrentListMap!2454 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823401 (= lt!370548 (getCurrentListMap!2454 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823402 () Bool)

(assert (=> b!823402 (= e!457887 tp_is_empty!14779)))

(declare-fun b!823403 () Bool)

(declare-fun res!561336 () Bool)

(assert (=> b!823403 (=> (not res!561336) (not e!457888))))

(declare-datatypes ((List!15532 0))(
  ( (Nil!15529) (Cons!15528 (h!16663 (_ BitVec 64)) (t!21861 List!15532)) )
))
(declare-fun arrayNoDuplicates!0 (array!45755 (_ BitVec 32) List!15532) Bool)

(assert (=> b!823403 (= res!561336 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15529))))

(declare-fun mapNonEmpty!23779 () Bool)

(declare-fun tp!45951 () Bool)

(assert (=> mapNonEmpty!23779 (= mapRes!23779 (and tp!45951 e!457886))))

(declare-fun mapValue!23779 () ValueCell!6974)

(declare-fun mapKey!23779 () (_ BitVec 32))

(declare-fun mapRest!23779 () (Array (_ BitVec 32) ValueCell!6974))

(assert (=> mapNonEmpty!23779 (= (arr!21922 _values!788) (store mapRest!23779 mapKey!23779 mapValue!23779))))

(assert (= (and start!70978 res!561339) b!823399))

(assert (= (and b!823399 res!561337) b!823397))

(assert (= (and b!823397 res!561338) b!823403))

(assert (= (and b!823403 res!561336) b!823398))

(assert (= (and b!823398 (not res!561340)) b!823401))

(assert (= (and b!823396 condMapEmpty!23779) mapIsEmpty!23779))

(assert (= (and b!823396 (not condMapEmpty!23779)) mapNonEmpty!23779))

(get-info :version)

(assert (= (and mapNonEmpty!23779 ((_ is ValueCellFull!6974) mapValue!23779)) b!823400))

(assert (= (and b!823396 ((_ is ValueCellFull!6974) mapDefault!23779)) b!823402))

(assert (= start!70978 b!823396))

(declare-fun m!765659 () Bool)

(assert (=> mapNonEmpty!23779 m!765659))

(declare-fun m!765661 () Bool)

(assert (=> b!823403 m!765661))

(declare-fun m!765663 () Bool)

(assert (=> start!70978 m!765663))

(declare-fun m!765665 () Bool)

(assert (=> start!70978 m!765665))

(declare-fun m!765667 () Bool)

(assert (=> start!70978 m!765667))

(declare-fun m!765669 () Bool)

(assert (=> b!823398 m!765669))

(declare-fun m!765671 () Bool)

(assert (=> b!823398 m!765671))

(declare-fun m!765673 () Bool)

(assert (=> b!823398 m!765673))

(declare-fun m!765675 () Bool)

(assert (=> b!823401 m!765675))

(declare-fun m!765677 () Bool)

(assert (=> b!823401 m!765677))

(declare-fun m!765679 () Bool)

(assert (=> b!823401 m!765679))

(declare-fun m!765681 () Bool)

(assert (=> b!823401 m!765681))

(declare-fun m!765683 () Bool)

(assert (=> b!823401 m!765683))

(assert (=> b!823401 m!765677))

(declare-fun m!765685 () Bool)

(assert (=> b!823401 m!765685))

(declare-fun m!765687 () Bool)

(assert (=> b!823401 m!765687))

(declare-fun m!765689 () Bool)

(assert (=> b!823397 m!765689))

(check-sat (not b!823398) (not b_next!13069) (not b!823401) (not b!823403) (not mapNonEmpty!23779) (not start!70978) tp_is_empty!14779 b_and!21951 (not b!823397))
(check-sat b_and!21951 (not b_next!13069))
