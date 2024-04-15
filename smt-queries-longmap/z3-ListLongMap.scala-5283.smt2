; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70848 () Bool)

(assert start!70848)

(declare-fun b_free!13105 () Bool)

(declare-fun b_next!13105 () Bool)

(assert (=> start!70848 (= b_free!13105 (not b_next!13105))))

(declare-fun tp!46063 () Bool)

(declare-fun b_and!21963 () Bool)

(assert (=> start!70848 (= tp!46063 b_and!21963)))

(declare-fun b!822869 () Bool)

(declare-fun e!457598 () Bool)

(declare-fun tp_is_empty!14815 () Bool)

(assert (=> b!822869 (= e!457598 tp_is_empty!14815)))

(declare-fun b!822870 () Bool)

(declare-fun res!561237 () Bool)

(declare-fun e!457596 () Bool)

(assert (=> b!822870 (=> (not res!561237) (not e!457596))))

(declare-datatypes ((array!45793 0))(
  ( (array!45794 (arr!21946 (Array (_ BitVec 32) (_ BitVec 64))) (size!22367 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45793)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45793 (_ BitVec 32)) Bool)

(assert (=> b!822870 (= res!561237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!822871 () Bool)

(declare-fun e!457594 () Bool)

(assert (=> b!822871 (= e!457594 true)))

(declare-datatypes ((V!24755 0))(
  ( (V!24756 (val!7455 Int)) )
))
(declare-datatypes ((tuple2!9858 0))(
  ( (tuple2!9859 (_1!4940 (_ BitVec 64)) (_2!4940 V!24755)) )
))
(declare-datatypes ((List!15666 0))(
  ( (Nil!15663) (Cons!15662 (h!16791 tuple2!9858) (t!21996 List!15666)) )
))
(declare-datatypes ((ListLongMap!8671 0))(
  ( (ListLongMap!8672 (toList!4351 List!15666)) )
))
(declare-fun lt!370642 () ListLongMap!8671)

(declare-fun lt!370647 () ListLongMap!8671)

(declare-fun lt!370645 () tuple2!9858)

(declare-fun +!1927 (ListLongMap!8671 tuple2!9858) ListLongMap!8671)

(assert (=> b!822871 (= lt!370642 (+!1927 lt!370647 lt!370645))))

(declare-fun lt!370641 () ListLongMap!8671)

(declare-fun zeroValueAfter!34 () V!24755)

(declare-fun minValue!754 () V!24755)

(declare-datatypes ((Unit!28124 0))(
  ( (Unit!28125) )
))
(declare-fun lt!370649 () Unit!28124)

(declare-fun addCommutativeForDiffKeys!458 (ListLongMap!8671 (_ BitVec 64) V!24755 (_ BitVec 64) V!24755) Unit!28124)

(assert (=> b!822871 (= lt!370649 (addCommutativeForDiffKeys!458 lt!370641 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!370646 () ListLongMap!8671)

(assert (=> b!822871 (= lt!370646 lt!370642)))

(declare-fun lt!370644 () tuple2!9858)

(assert (=> b!822871 (= lt!370642 (+!1927 (+!1927 lt!370641 lt!370645) lt!370644))))

(assert (=> b!822871 (= lt!370645 (tuple2!9859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!370643 () ListLongMap!8671)

(assert (=> b!822871 (= lt!370643 lt!370647)))

(assert (=> b!822871 (= lt!370647 (+!1927 lt!370641 lt!370644))))

(assert (=> b!822871 (= lt!370644 (tuple2!9859 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-datatypes ((ValueCell!6992 0))(
  ( (ValueCellFull!6992 (v!9881 V!24755)) (EmptyCell!6992) )
))
(declare-datatypes ((array!45795 0))(
  ( (array!45796 (arr!21947 (Array (_ BitVec 32) ValueCell!6992)) (size!22368 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45795)

(declare-fun defaultEntry!796 () Int)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun getCurrentListMap!2469 (array!45793 array!45795 (_ BitVec 32) (_ BitVec 32) V!24755 V!24755 (_ BitVec 32) Int) ListLongMap!8671)

(assert (=> b!822871 (= lt!370646 (getCurrentListMap!2469 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24755)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!822871 (= lt!370643 (getCurrentListMap!2469 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822873 () Bool)

(declare-fun e!457595 () Bool)

(declare-fun e!457593 () Bool)

(declare-fun mapRes!23836 () Bool)

(assert (=> b!822873 (= e!457595 (and e!457593 mapRes!23836))))

(declare-fun condMapEmpty!23836 () Bool)

(declare-fun mapDefault!23836 () ValueCell!6992)

(assert (=> b!822873 (= condMapEmpty!23836 (= (arr!21947 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6992)) mapDefault!23836)))))

(declare-fun b!822874 () Bool)

(declare-fun res!561233 () Bool)

(assert (=> b!822874 (=> (not res!561233) (not e!457596))))

(declare-datatypes ((List!15667 0))(
  ( (Nil!15664) (Cons!15663 (h!16792 (_ BitVec 64)) (t!21997 List!15667)) )
))
(declare-fun arrayNoDuplicates!0 (array!45793 (_ BitVec 32) List!15667) Bool)

(assert (=> b!822874 (= res!561233 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15664))))

(declare-fun mapIsEmpty!23836 () Bool)

(assert (=> mapIsEmpty!23836 mapRes!23836))

(declare-fun mapNonEmpty!23836 () Bool)

(declare-fun tp!46062 () Bool)

(assert (=> mapNonEmpty!23836 (= mapRes!23836 (and tp!46062 e!457598))))

(declare-fun mapKey!23836 () (_ BitVec 32))

(declare-fun mapRest!23836 () (Array (_ BitVec 32) ValueCell!6992))

(declare-fun mapValue!23836 () ValueCell!6992)

(assert (=> mapNonEmpty!23836 (= (arr!21947 _values!788) (store mapRest!23836 mapKey!23836 mapValue!23836))))

(declare-fun b!822872 () Bool)

(assert (=> b!822872 (= e!457596 (not e!457594))))

(declare-fun res!561235 () Bool)

(assert (=> b!822872 (=> res!561235 e!457594)))

(assert (=> b!822872 (= res!561235 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!370648 () ListLongMap!8671)

(assert (=> b!822872 (= lt!370641 lt!370648)))

(declare-fun lt!370640 () Unit!28124)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!489 (array!45793 array!45795 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24755 V!24755 V!24755 V!24755 (_ BitVec 32) Int) Unit!28124)

(assert (=> b!822872 (= lt!370640 (lemmaNoChangeToArrayThenSameMapNoExtras!489 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2396 (array!45793 array!45795 (_ BitVec 32) (_ BitVec 32) V!24755 V!24755 (_ BitVec 32) Int) ListLongMap!8671)

(assert (=> b!822872 (= lt!370648 (getCurrentListMapNoExtraKeys!2396 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822872 (= lt!370641 (getCurrentListMapNoExtraKeys!2396 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!561234 () Bool)

(assert (=> start!70848 (=> (not res!561234) (not e!457596))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70848 (= res!561234 (validMask!0 mask!1312))))

(assert (=> start!70848 e!457596))

(assert (=> start!70848 tp_is_empty!14815))

(declare-fun array_inv!17589 (array!45793) Bool)

(assert (=> start!70848 (array_inv!17589 _keys!976)))

(assert (=> start!70848 true))

(declare-fun array_inv!17590 (array!45795) Bool)

(assert (=> start!70848 (and (array_inv!17590 _values!788) e!457595)))

(assert (=> start!70848 tp!46063))

(declare-fun b!822875 () Bool)

(declare-fun res!561236 () Bool)

(assert (=> b!822875 (=> (not res!561236) (not e!457596))))

(assert (=> b!822875 (= res!561236 (and (= (size!22368 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22367 _keys!976) (size!22368 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!822876 () Bool)

(assert (=> b!822876 (= e!457593 tp_is_empty!14815)))

(assert (= (and start!70848 res!561234) b!822875))

(assert (= (and b!822875 res!561236) b!822870))

(assert (= (and b!822870 res!561237) b!822874))

(assert (= (and b!822874 res!561233) b!822872))

(assert (= (and b!822872 (not res!561235)) b!822871))

(assert (= (and b!822873 condMapEmpty!23836) mapIsEmpty!23836))

(assert (= (and b!822873 (not condMapEmpty!23836)) mapNonEmpty!23836))

(get-info :version)

(assert (= (and mapNonEmpty!23836 ((_ is ValueCellFull!6992) mapValue!23836)) b!822869))

(assert (= (and b!822873 ((_ is ValueCellFull!6992) mapDefault!23836)) b!822876))

(assert (= start!70848 b!822873))

(declare-fun m!764417 () Bool)

(assert (=> b!822874 m!764417))

(declare-fun m!764419 () Bool)

(assert (=> b!822872 m!764419))

(declare-fun m!764421 () Bool)

(assert (=> b!822872 m!764421))

(declare-fun m!764423 () Bool)

(assert (=> b!822872 m!764423))

(declare-fun m!764425 () Bool)

(assert (=> b!822871 m!764425))

(declare-fun m!764427 () Bool)

(assert (=> b!822871 m!764427))

(assert (=> b!822871 m!764427))

(declare-fun m!764429 () Bool)

(assert (=> b!822871 m!764429))

(declare-fun m!764431 () Bool)

(assert (=> b!822871 m!764431))

(declare-fun m!764433 () Bool)

(assert (=> b!822871 m!764433))

(declare-fun m!764435 () Bool)

(assert (=> b!822871 m!764435))

(declare-fun m!764437 () Bool)

(assert (=> b!822871 m!764437))

(declare-fun m!764439 () Bool)

(assert (=> start!70848 m!764439))

(declare-fun m!764441 () Bool)

(assert (=> start!70848 m!764441))

(declare-fun m!764443 () Bool)

(assert (=> start!70848 m!764443))

(declare-fun m!764445 () Bool)

(assert (=> mapNonEmpty!23836 m!764445))

(declare-fun m!764447 () Bool)

(assert (=> b!822870 m!764447))

(check-sat (not start!70848) (not b!822871) (not b!822872) tp_is_empty!14815 b_and!21963 (not b!822870) (not b!822874) (not mapNonEmpty!23836) (not b_next!13105))
(check-sat b_and!21963 (not b_next!13105))
