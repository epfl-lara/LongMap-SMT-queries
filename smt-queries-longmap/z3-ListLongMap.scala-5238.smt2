; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70488 () Bool)

(assert start!70488)

(declare-fun b_free!12835 () Bool)

(declare-fun b_next!12835 () Bool)

(assert (=> start!70488 (= b_free!12835 (not b_next!12835))))

(declare-fun tp!45238 () Bool)

(declare-fun b_and!21639 () Bool)

(assert (=> start!70488 (= tp!45238 b_and!21639)))

(declare-fun b!818784 () Bool)

(declare-fun e!454613 () Bool)

(assert (=> b!818784 (= e!454613 true)))

(declare-datatypes ((V!24395 0))(
  ( (V!24396 (val!7320 Int)) )
))
(declare-datatypes ((tuple2!9648 0))(
  ( (tuple2!9649 (_1!4835 (_ BitVec 64)) (_2!4835 V!24395)) )
))
(declare-datatypes ((List!15469 0))(
  ( (Nil!15466) (Cons!15465 (h!16594 tuple2!9648) (t!21789 List!15469)) )
))
(declare-datatypes ((ListLongMap!8461 0))(
  ( (ListLongMap!8462 (toList!4246 List!15469)) )
))
(declare-fun lt!367075 () ListLongMap!8461)

(declare-fun lt!367071 () ListLongMap!8461)

(declare-fun lt!367070 () tuple2!9648)

(declare-fun lt!367077 () tuple2!9648)

(declare-fun +!1868 (ListLongMap!8461 tuple2!9648) ListLongMap!8461)

(assert (=> b!818784 (= lt!367075 (+!1868 (+!1868 lt!367071 lt!367077) lt!367070))))

(declare-fun lt!367074 () ListLongMap!8461)

(declare-fun lt!367072 () ListLongMap!8461)

(assert (=> b!818784 (= (+!1868 lt!367074 lt!367070) (+!1868 lt!367072 lt!367070))))

(declare-fun zeroValueBefore!34 () V!24395)

(declare-datatypes ((Unit!27917 0))(
  ( (Unit!27918) )
))
(declare-fun lt!367078 () Unit!27917)

(declare-fun zeroValueAfter!34 () V!24395)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!183 (ListLongMap!8461 (_ BitVec 64) V!24395 V!24395) Unit!27917)

(assert (=> b!818784 (= lt!367078 (addSameAsAddTwiceSameKeyDiffValues!183 lt!367074 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!818784 (= lt!367070 (tuple2!9649 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!454616 () Bool)

(assert (=> b!818784 e!454616))

(declare-fun res!558818 () Bool)

(assert (=> b!818784 (=> (not res!558818) (not e!454616))))

(declare-fun lt!367079 () ListLongMap!8461)

(assert (=> b!818784 (= res!558818 (= lt!367079 lt!367072))))

(assert (=> b!818784 (= lt!367072 (+!1868 lt!367074 lt!367077))))

(assert (=> b!818784 (= lt!367077 (tuple2!9649 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-datatypes ((array!45263 0))(
  ( (array!45264 (arr!21686 (Array (_ BitVec 32) (_ BitVec 64))) (size!22107 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45263)

(declare-fun minValue!754 () V!24395)

(declare-datatypes ((ValueCell!6857 0))(
  ( (ValueCellFull!6857 (v!9743 V!24395)) (EmptyCell!6857) )
))
(declare-datatypes ((array!45265 0))(
  ( (array!45266 (arr!21687 (Array (_ BitVec 32) ValueCell!6857)) (size!22108 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45265)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lt!367073 () ListLongMap!8461)

(declare-fun getCurrentListMap!2396 (array!45263 array!45265 (_ BitVec 32) (_ BitVec 32) V!24395 V!24395 (_ BitVec 32) Int) ListLongMap!8461)

(assert (=> b!818784 (= lt!367073 (getCurrentListMap!2396 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!818784 (= lt!367079 (getCurrentListMap!2396 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818785 () Bool)

(declare-fun res!558813 () Bool)

(declare-fun e!454614 () Bool)

(assert (=> b!818785 (=> (not res!558813) (not e!454614))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45263 (_ BitVec 32)) Bool)

(assert (=> b!818785 (= res!558813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!818786 () Bool)

(assert (=> b!818786 (= e!454616 (= lt!367073 (+!1868 lt!367071 (tuple2!9649 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!818787 () Bool)

(declare-fun e!454615 () Bool)

(declare-fun tp_is_empty!14545 () Bool)

(assert (=> b!818787 (= e!454615 tp_is_empty!14545)))

(declare-fun b!818788 () Bool)

(declare-fun res!558816 () Bool)

(assert (=> b!818788 (=> (not res!558816) (not e!454614))))

(declare-datatypes ((List!15470 0))(
  ( (Nil!15467) (Cons!15466 (h!16595 (_ BitVec 64)) (t!21790 List!15470)) )
))
(declare-fun arrayNoDuplicates!0 (array!45263 (_ BitVec 32) List!15470) Bool)

(assert (=> b!818788 (= res!558816 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15467))))

(declare-fun b!818789 () Bool)

(declare-fun res!558815 () Bool)

(assert (=> b!818789 (=> (not res!558815) (not e!454614))))

(assert (=> b!818789 (= res!558815 (and (= (size!22108 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22107 _keys!976) (size!22108 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!818790 () Bool)

(declare-fun e!454611 () Bool)

(assert (=> b!818790 (= e!454611 tp_is_empty!14545)))

(declare-fun mapIsEmpty!23416 () Bool)

(declare-fun mapRes!23416 () Bool)

(assert (=> mapIsEmpty!23416 mapRes!23416))

(declare-fun b!818791 () Bool)

(declare-fun e!454612 () Bool)

(assert (=> b!818791 (= e!454612 (and e!454615 mapRes!23416))))

(declare-fun condMapEmpty!23416 () Bool)

(declare-fun mapDefault!23416 () ValueCell!6857)

(assert (=> b!818791 (= condMapEmpty!23416 (= (arr!21687 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6857)) mapDefault!23416)))))

(declare-fun b!818792 () Bool)

(assert (=> b!818792 (= e!454614 (not e!454613))))

(declare-fun res!558814 () Bool)

(assert (=> b!818792 (=> res!558814 e!454613)))

(assert (=> b!818792 (= res!558814 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!818792 (= lt!367074 lt!367071)))

(declare-fun lt!367076 () Unit!27917)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!396 (array!45263 array!45265 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24395 V!24395 V!24395 V!24395 (_ BitVec 32) Int) Unit!27917)

(assert (=> b!818792 (= lt!367076 (lemmaNoChangeToArrayThenSameMapNoExtras!396 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2303 (array!45263 array!45265 (_ BitVec 32) (_ BitVec 32) V!24395 V!24395 (_ BitVec 32) Int) ListLongMap!8461)

(assert (=> b!818792 (= lt!367071 (getCurrentListMapNoExtraKeys!2303 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818792 (= lt!367074 (getCurrentListMapNoExtraKeys!2303 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!558817 () Bool)

(assert (=> start!70488 (=> (not res!558817) (not e!454614))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70488 (= res!558817 (validMask!0 mask!1312))))

(assert (=> start!70488 e!454614))

(assert (=> start!70488 tp_is_empty!14545))

(declare-fun array_inv!17403 (array!45263) Bool)

(assert (=> start!70488 (array_inv!17403 _keys!976)))

(assert (=> start!70488 true))

(declare-fun array_inv!17404 (array!45265) Bool)

(assert (=> start!70488 (and (array_inv!17404 _values!788) e!454612)))

(assert (=> start!70488 tp!45238))

(declare-fun mapNonEmpty!23416 () Bool)

(declare-fun tp!45237 () Bool)

(assert (=> mapNonEmpty!23416 (= mapRes!23416 (and tp!45237 e!454611))))

(declare-fun mapValue!23416 () ValueCell!6857)

(declare-fun mapKey!23416 () (_ BitVec 32))

(declare-fun mapRest!23416 () (Array (_ BitVec 32) ValueCell!6857))

(assert (=> mapNonEmpty!23416 (= (arr!21687 _values!788) (store mapRest!23416 mapKey!23416 mapValue!23416))))

(assert (= (and start!70488 res!558817) b!818789))

(assert (= (and b!818789 res!558815) b!818785))

(assert (= (and b!818785 res!558813) b!818788))

(assert (= (and b!818788 res!558816) b!818792))

(assert (= (and b!818792 (not res!558814)) b!818784))

(assert (= (and b!818784 res!558818) b!818786))

(assert (= (and b!818791 condMapEmpty!23416) mapIsEmpty!23416))

(assert (= (and b!818791 (not condMapEmpty!23416)) mapNonEmpty!23416))

(get-info :version)

(assert (= (and mapNonEmpty!23416 ((_ is ValueCellFull!6857) mapValue!23416)) b!818790))

(assert (= (and b!818791 ((_ is ValueCellFull!6857) mapDefault!23416)) b!818787))

(assert (= start!70488 b!818791))

(declare-fun m!759785 () Bool)

(assert (=> b!818792 m!759785))

(declare-fun m!759787 () Bool)

(assert (=> b!818792 m!759787))

(declare-fun m!759789 () Bool)

(assert (=> b!818792 m!759789))

(declare-fun m!759791 () Bool)

(assert (=> start!70488 m!759791))

(declare-fun m!759793 () Bool)

(assert (=> start!70488 m!759793))

(declare-fun m!759795 () Bool)

(assert (=> start!70488 m!759795))

(declare-fun m!759797 () Bool)

(assert (=> b!818788 m!759797))

(declare-fun m!759799 () Bool)

(assert (=> mapNonEmpty!23416 m!759799))

(declare-fun m!759801 () Bool)

(assert (=> b!818786 m!759801))

(declare-fun m!759803 () Bool)

(assert (=> b!818785 m!759803))

(declare-fun m!759805 () Bool)

(assert (=> b!818784 m!759805))

(declare-fun m!759807 () Bool)

(assert (=> b!818784 m!759807))

(declare-fun m!759809 () Bool)

(assert (=> b!818784 m!759809))

(declare-fun m!759811 () Bool)

(assert (=> b!818784 m!759811))

(declare-fun m!759813 () Bool)

(assert (=> b!818784 m!759813))

(declare-fun m!759815 () Bool)

(assert (=> b!818784 m!759815))

(assert (=> b!818784 m!759807))

(declare-fun m!759817 () Bool)

(assert (=> b!818784 m!759817))

(declare-fun m!759819 () Bool)

(assert (=> b!818784 m!759819))

(check-sat (not b!818786) (not b!818792) (not b!818785) (not b!818784) (not start!70488) (not mapNonEmpty!23416) b_and!21639 tp_is_empty!14545 (not b_next!12835) (not b!818788))
(check-sat b_and!21639 (not b_next!12835))
