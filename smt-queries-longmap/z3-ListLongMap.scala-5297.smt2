; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70988 () Bool)

(assert start!70988)

(declare-fun b_free!13191 () Bool)

(declare-fun b_next!13191 () Bool)

(assert (=> start!70988 (= b_free!13191 (not b_next!13191))))

(declare-fun tp!46327 () Bool)

(declare-fun b_and!22095 () Bool)

(assert (=> start!70988 (= tp!46327 b_and!22095)))

(declare-fun b!824332 () Bool)

(declare-fun e!458608 () Bool)

(assert (=> b!824332 (= e!458608 true)))

(declare-datatypes ((V!24869 0))(
  ( (V!24870 (val!7498 Int)) )
))
(declare-fun zeroValueBefore!34 () V!24869)

(declare-datatypes ((array!45990 0))(
  ( (array!45991 (arr!22042 (Array (_ BitVec 32) (_ BitVec 64))) (size!22463 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45990)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!24869)

(declare-datatypes ((ValueCell!7035 0))(
  ( (ValueCellFull!7035 (v!9931 V!24869)) (EmptyCell!7035) )
))
(declare-datatypes ((array!45992 0))(
  ( (array!45993 (arr!22043 (Array (_ BitVec 32) ValueCell!7035)) (size!22464 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45992)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-datatypes ((tuple2!9920 0))(
  ( (tuple2!9921 (_1!4971 (_ BitVec 64)) (_2!4971 V!24869)) )
))
(declare-datatypes ((List!15732 0))(
  ( (Nil!15729) (Cons!15728 (h!16857 tuple2!9920) (t!22075 List!15732)) )
))
(declare-datatypes ((ListLongMap!8743 0))(
  ( (ListLongMap!8744 (toList!4387 List!15732)) )
))
(declare-fun lt!371773 () ListLongMap!8743)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2528 (array!45990 array!45992 (_ BitVec 32) (_ BitVec 32) V!24869 V!24869 (_ BitVec 32) Int) ListLongMap!8743)

(assert (=> b!824332 (= lt!371773 (getCurrentListMap!2528 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824333 () Bool)

(declare-fun res!562016 () Bool)

(declare-fun e!458609 () Bool)

(assert (=> b!824333 (=> (not res!562016) (not e!458609))))

(declare-datatypes ((List!15733 0))(
  ( (Nil!15730) (Cons!15729 (h!16858 (_ BitVec 64)) (t!22076 List!15733)) )
))
(declare-fun arrayNoDuplicates!0 (array!45990 (_ BitVec 32) List!15733) Bool)

(assert (=> b!824333 (= res!562016 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15730))))

(declare-fun b!824334 () Bool)

(declare-fun e!458606 () Bool)

(declare-fun e!458604 () Bool)

(declare-fun mapRes!23971 () Bool)

(assert (=> b!824334 (= e!458606 (and e!458604 mapRes!23971))))

(declare-fun condMapEmpty!23971 () Bool)

(declare-fun mapDefault!23971 () ValueCell!7035)

(assert (=> b!824334 (= condMapEmpty!23971 (= (arr!22043 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7035)) mapDefault!23971)))))

(declare-fun b!824335 () Bool)

(declare-fun res!562015 () Bool)

(assert (=> b!824335 (=> (not res!562015) (not e!458609))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45990 (_ BitVec 32)) Bool)

(assert (=> b!824335 (= res!562015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!562013 () Bool)

(assert (=> start!70988 (=> (not res!562013) (not e!458609))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70988 (= res!562013 (validMask!0 mask!1312))))

(assert (=> start!70988 e!458609))

(declare-fun tp_is_empty!14901 () Bool)

(assert (=> start!70988 tp_is_empty!14901))

(declare-fun array_inv!17587 (array!45990) Bool)

(assert (=> start!70988 (array_inv!17587 _keys!976)))

(assert (=> start!70988 true))

(declare-fun array_inv!17588 (array!45992) Bool)

(assert (=> start!70988 (and (array_inv!17588 _values!788) e!458606)))

(assert (=> start!70988 tp!46327))

(declare-fun mapIsEmpty!23971 () Bool)

(assert (=> mapIsEmpty!23971 mapRes!23971))

(declare-fun b!824336 () Bool)

(declare-fun e!458605 () Bool)

(assert (=> b!824336 (= e!458605 tp_is_empty!14901)))

(declare-fun b!824337 () Bool)

(declare-fun res!562014 () Bool)

(assert (=> b!824337 (=> (not res!562014) (not e!458609))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!824337 (= res!562014 (and (= (size!22464 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22463 _keys!976) (size!22464 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!824338 () Bool)

(assert (=> b!824338 (= e!458609 (not e!458608))))

(declare-fun res!562017 () Bool)

(assert (=> b!824338 (=> res!562017 e!458608)))

(assert (=> b!824338 (= res!562017 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!371771 () ListLongMap!8743)

(declare-fun lt!371774 () ListLongMap!8743)

(assert (=> b!824338 (= lt!371771 lt!371774)))

(declare-fun zeroValueAfter!34 () V!24869)

(declare-datatypes ((Unit!28242 0))(
  ( (Unit!28243) )
))
(declare-fun lt!371772 () Unit!28242)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!512 (array!45990 array!45992 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24869 V!24869 V!24869 V!24869 (_ BitVec 32) Int) Unit!28242)

(assert (=> b!824338 (= lt!371772 (lemmaNoChangeToArrayThenSameMapNoExtras!512 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2402 (array!45990 array!45992 (_ BitVec 32) (_ BitVec 32) V!24869 V!24869 (_ BitVec 32) Int) ListLongMap!8743)

(assert (=> b!824338 (= lt!371774 (getCurrentListMapNoExtraKeys!2402 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824338 (= lt!371771 (getCurrentListMapNoExtraKeys!2402 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824339 () Bool)

(assert (=> b!824339 (= e!458604 tp_is_empty!14901)))

(declare-fun mapNonEmpty!23971 () Bool)

(declare-fun tp!46326 () Bool)

(assert (=> mapNonEmpty!23971 (= mapRes!23971 (and tp!46326 e!458605))))

(declare-fun mapRest!23971 () (Array (_ BitVec 32) ValueCell!7035))

(declare-fun mapValue!23971 () ValueCell!7035)

(declare-fun mapKey!23971 () (_ BitVec 32))

(assert (=> mapNonEmpty!23971 (= (arr!22043 _values!788) (store mapRest!23971 mapKey!23971 mapValue!23971))))

(assert (= (and start!70988 res!562013) b!824337))

(assert (= (and b!824337 res!562014) b!824335))

(assert (= (and b!824335 res!562015) b!824333))

(assert (= (and b!824333 res!562016) b!824338))

(assert (= (and b!824338 (not res!562017)) b!824332))

(assert (= (and b!824334 condMapEmpty!23971) mapIsEmpty!23971))

(assert (= (and b!824334 (not condMapEmpty!23971)) mapNonEmpty!23971))

(get-info :version)

(assert (= (and mapNonEmpty!23971 ((_ is ValueCellFull!7035) mapValue!23971)) b!824336))

(assert (= (and b!824334 ((_ is ValueCellFull!7035) mapDefault!23971)) b!824339))

(assert (= start!70988 b!824334))

(declare-fun m!766437 () Bool)

(assert (=> start!70988 m!766437))

(declare-fun m!766439 () Bool)

(assert (=> start!70988 m!766439))

(declare-fun m!766441 () Bool)

(assert (=> start!70988 m!766441))

(declare-fun m!766443 () Bool)

(assert (=> mapNonEmpty!23971 m!766443))

(declare-fun m!766445 () Bool)

(assert (=> b!824338 m!766445))

(declare-fun m!766447 () Bool)

(assert (=> b!824338 m!766447))

(declare-fun m!766449 () Bool)

(assert (=> b!824338 m!766449))

(declare-fun m!766451 () Bool)

(assert (=> b!824332 m!766451))

(declare-fun m!766453 () Bool)

(assert (=> b!824333 m!766453))

(declare-fun m!766455 () Bool)

(assert (=> b!824335 m!766455))

(check-sat (not b!824338) (not b_next!13191) (not b!824332) tp_is_empty!14901 (not b!824333) (not b!824335) (not mapNonEmpty!23971) (not start!70988) b_and!22095)
(check-sat b_and!22095 (not b_next!13191))
