; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70756 () Bool)

(assert start!70756)

(declare-fun b_free!13033 () Bool)

(declare-fun b_next!13033 () Bool)

(assert (=> start!70756 (= b_free!13033 (not b_next!13033))))

(declare-fun tp!45843 () Bool)

(declare-fun b_and!21879 () Bool)

(assert (=> start!70756 (= tp!45843 b_and!21879)))

(declare-fun b!821824 () Bool)

(declare-fun res!560614 () Bool)

(declare-fun e!456835 () Bool)

(assert (=> b!821824 (=> (not res!560614) (not e!456835))))

(declare-datatypes ((array!45649 0))(
  ( (array!45650 (arr!21875 (Array (_ BitVec 32) (_ BitVec 64))) (size!22296 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45649)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45649 (_ BitVec 32)) Bool)

(assert (=> b!821824 (= res!560614 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!560616 () Bool)

(assert (=> start!70756 (=> (not res!560616) (not e!456835))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70756 (= res!560616 (validMask!0 mask!1312))))

(assert (=> start!70756 e!456835))

(declare-fun tp_is_empty!14743 () Bool)

(assert (=> start!70756 tp_is_empty!14743))

(declare-fun array_inv!17541 (array!45649) Bool)

(assert (=> start!70756 (array_inv!17541 _keys!976)))

(assert (=> start!70756 true))

(declare-datatypes ((V!24659 0))(
  ( (V!24660 (val!7419 Int)) )
))
(declare-datatypes ((ValueCell!6956 0))(
  ( (ValueCellFull!6956 (v!9844 V!24659)) (EmptyCell!6956) )
))
(declare-datatypes ((array!45651 0))(
  ( (array!45652 (arr!21876 (Array (_ BitVec 32) ValueCell!6956)) (size!22297 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45651)

(declare-fun e!456837 () Bool)

(declare-fun array_inv!17542 (array!45651) Bool)

(assert (=> start!70756 (and (array_inv!17542 _values!788) e!456837)))

(assert (=> start!70756 tp!45843))

(declare-fun b!821825 () Bool)

(declare-fun e!456832 () Bool)

(assert (=> b!821825 (= e!456835 (not e!456832))))

(declare-fun res!560618 () Bool)

(assert (=> b!821825 (=> res!560618 e!456832)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!821825 (= res!560618 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9798 0))(
  ( (tuple2!9799 (_1!4910 (_ BitVec 64)) (_2!4910 V!24659)) )
))
(declare-datatypes ((List!15610 0))(
  ( (Nil!15607) (Cons!15606 (h!16735 tuple2!9798) (t!21938 List!15610)) )
))
(declare-datatypes ((ListLongMap!8611 0))(
  ( (ListLongMap!8612 (toList!4321 List!15610)) )
))
(declare-fun lt!369414 () ListLongMap!8611)

(declare-fun lt!369412 () ListLongMap!8611)

(assert (=> b!821825 (= lt!369414 lt!369412)))

(declare-fun zeroValueBefore!34 () V!24659)

(declare-fun zeroValueAfter!34 () V!24659)

(declare-fun minValue!754 () V!24659)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28062 0))(
  ( (Unit!28063) )
))
(declare-fun lt!369408 () Unit!28062)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!461 (array!45649 array!45651 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24659 V!24659 V!24659 V!24659 (_ BitVec 32) Int) Unit!28062)

(assert (=> b!821825 (= lt!369408 (lemmaNoChangeToArrayThenSameMapNoExtras!461 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2368 (array!45649 array!45651 (_ BitVec 32) (_ BitVec 32) V!24659 V!24659 (_ BitVec 32) Int) ListLongMap!8611)

(assert (=> b!821825 (= lt!369412 (getCurrentListMapNoExtraKeys!2368 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821825 (= lt!369414 (getCurrentListMapNoExtraKeys!2368 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821826 () Bool)

(assert (=> b!821826 (= e!456832 true)))

(declare-fun lt!369411 () ListLongMap!8611)

(declare-fun lt!369405 () ListLongMap!8611)

(declare-fun lt!369413 () tuple2!9798)

(declare-fun +!1905 (ListLongMap!8611 tuple2!9798) ListLongMap!8611)

(assert (=> b!821826 (= lt!369411 (+!1905 lt!369405 lt!369413))))

(declare-fun lt!369406 () Unit!28062)

(declare-fun addCommutativeForDiffKeys!436 (ListLongMap!8611 (_ BitVec 64) V!24659 (_ BitVec 64) V!24659) Unit!28062)

(assert (=> b!821826 (= lt!369406 (addCommutativeForDiffKeys!436 lt!369414 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!369407 () ListLongMap!8611)

(assert (=> b!821826 (= lt!369407 lt!369411)))

(declare-fun lt!369409 () tuple2!9798)

(assert (=> b!821826 (= lt!369411 (+!1905 (+!1905 lt!369414 lt!369413) lt!369409))))

(assert (=> b!821826 (= lt!369413 (tuple2!9799 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!369410 () ListLongMap!8611)

(assert (=> b!821826 (= lt!369410 lt!369405)))

(assert (=> b!821826 (= lt!369405 (+!1905 lt!369414 lt!369409))))

(assert (=> b!821826 (= lt!369409 (tuple2!9799 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun getCurrentListMap!2447 (array!45649 array!45651 (_ BitVec 32) (_ BitVec 32) V!24659 V!24659 (_ BitVec 32) Int) ListLongMap!8611)

(assert (=> b!821826 (= lt!369407 (getCurrentListMap!2447 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821826 (= lt!369410 (getCurrentListMap!2447 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23725 () Bool)

(declare-fun mapRes!23725 () Bool)

(assert (=> mapIsEmpty!23725 mapRes!23725))

(declare-fun b!821827 () Bool)

(declare-fun e!456833 () Bool)

(assert (=> b!821827 (= e!456833 tp_is_empty!14743)))

(declare-fun b!821828 () Bool)

(declare-fun res!560615 () Bool)

(assert (=> b!821828 (=> (not res!560615) (not e!456835))))

(declare-datatypes ((List!15611 0))(
  ( (Nil!15608) (Cons!15607 (h!16736 (_ BitVec 64)) (t!21939 List!15611)) )
))
(declare-fun arrayNoDuplicates!0 (array!45649 (_ BitVec 32) List!15611) Bool)

(assert (=> b!821828 (= res!560615 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15608))))

(declare-fun b!821829 () Bool)

(declare-fun e!456834 () Bool)

(assert (=> b!821829 (= e!456834 tp_is_empty!14743)))

(declare-fun b!821830 () Bool)

(assert (=> b!821830 (= e!456837 (and e!456833 mapRes!23725))))

(declare-fun condMapEmpty!23725 () Bool)

(declare-fun mapDefault!23725 () ValueCell!6956)

(assert (=> b!821830 (= condMapEmpty!23725 (= (arr!21876 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6956)) mapDefault!23725)))))

(declare-fun mapNonEmpty!23725 () Bool)

(declare-fun tp!45844 () Bool)

(assert (=> mapNonEmpty!23725 (= mapRes!23725 (and tp!45844 e!456834))))

(declare-fun mapValue!23725 () ValueCell!6956)

(declare-fun mapRest!23725 () (Array (_ BitVec 32) ValueCell!6956))

(declare-fun mapKey!23725 () (_ BitVec 32))

(assert (=> mapNonEmpty!23725 (= (arr!21876 _values!788) (store mapRest!23725 mapKey!23725 mapValue!23725))))

(declare-fun b!821831 () Bool)

(declare-fun res!560617 () Bool)

(assert (=> b!821831 (=> (not res!560617) (not e!456835))))

(assert (=> b!821831 (= res!560617 (and (= (size!22297 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22296 _keys!976) (size!22297 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!70756 res!560616) b!821831))

(assert (= (and b!821831 res!560617) b!821824))

(assert (= (and b!821824 res!560614) b!821828))

(assert (= (and b!821828 res!560615) b!821825))

(assert (= (and b!821825 (not res!560618)) b!821826))

(assert (= (and b!821830 condMapEmpty!23725) mapIsEmpty!23725))

(assert (= (and b!821830 (not condMapEmpty!23725)) mapNonEmpty!23725))

(get-info :version)

(assert (= (and mapNonEmpty!23725 ((_ is ValueCellFull!6956) mapValue!23725)) b!821829))

(assert (= (and b!821830 ((_ is ValueCellFull!6956) mapDefault!23725)) b!821827))

(assert (= start!70756 b!821830))

(declare-fun m!763049 () Bool)

(assert (=> start!70756 m!763049))

(declare-fun m!763051 () Bool)

(assert (=> start!70756 m!763051))

(declare-fun m!763053 () Bool)

(assert (=> start!70756 m!763053))

(declare-fun m!763055 () Bool)

(assert (=> b!821826 m!763055))

(declare-fun m!763057 () Bool)

(assert (=> b!821826 m!763057))

(declare-fun m!763059 () Bool)

(assert (=> b!821826 m!763059))

(assert (=> b!821826 m!763057))

(declare-fun m!763061 () Bool)

(assert (=> b!821826 m!763061))

(declare-fun m!763063 () Bool)

(assert (=> b!821826 m!763063))

(declare-fun m!763065 () Bool)

(assert (=> b!821826 m!763065))

(declare-fun m!763067 () Bool)

(assert (=> b!821826 m!763067))

(declare-fun m!763069 () Bool)

(assert (=> b!821828 m!763069))

(declare-fun m!763071 () Bool)

(assert (=> mapNonEmpty!23725 m!763071))

(declare-fun m!763073 () Bool)

(assert (=> b!821825 m!763073))

(declare-fun m!763075 () Bool)

(assert (=> b!821825 m!763075))

(declare-fun m!763077 () Bool)

(assert (=> b!821825 m!763077))

(declare-fun m!763079 () Bool)

(assert (=> b!821824 m!763079))

(check-sat (not mapNonEmpty!23725) (not b!821826) (not b_next!13033) b_and!21879 (not b!821825) (not b!821828) (not start!70756) (not b!821824) tp_is_empty!14743)
(check-sat b_and!21879 (not b_next!13033))
