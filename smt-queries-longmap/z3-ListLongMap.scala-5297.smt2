; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70966 () Bool)

(assert start!70966)

(declare-fun b_free!13189 () Bool)

(declare-fun b_next!13189 () Bool)

(assert (=> start!70966 (= b_free!13189 (not b_next!13189))))

(declare-fun tp!46320 () Bool)

(declare-fun b_and!22067 () Bool)

(assert (=> start!70966 (= tp!46320 b_and!22067)))

(declare-fun b!824062 () Bool)

(declare-fun res!561893 () Bool)

(declare-fun e!458436 () Bool)

(assert (=> b!824062 (=> (not res!561893) (not e!458436))))

(declare-datatypes ((array!45957 0))(
  ( (array!45958 (arr!22026 (Array (_ BitVec 32) (_ BitVec 64))) (size!22447 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45957)

(declare-datatypes ((List!15722 0))(
  ( (Nil!15719) (Cons!15718 (h!16847 (_ BitVec 64)) (t!22056 List!15722)) )
))
(declare-fun arrayNoDuplicates!0 (array!45957 (_ BitVec 32) List!15722) Bool)

(assert (=> b!824062 (= res!561893 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15719))))

(declare-fun b!824063 () Bool)

(declare-fun e!458438 () Bool)

(assert (=> b!824063 (= e!458438 true)))

(declare-datatypes ((V!24867 0))(
  ( (V!24868 (val!7497 Int)) )
))
(declare-fun zeroValueBefore!34 () V!24867)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!24867)

(declare-datatypes ((ValueCell!7034 0))(
  ( (ValueCellFull!7034 (v!9924 V!24867)) (EmptyCell!7034) )
))
(declare-datatypes ((array!45959 0))(
  ( (array!45960 (arr!22027 (Array (_ BitVec 32) ValueCell!7034)) (size!22448 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45959)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9922 0))(
  ( (tuple2!9923 (_1!4972 (_ BitVec 64)) (_2!4972 V!24867)) )
))
(declare-datatypes ((List!15723 0))(
  ( (Nil!15720) (Cons!15719 (h!16848 tuple2!9922) (t!22057 List!15723)) )
))
(declare-datatypes ((ListLongMap!8735 0))(
  ( (ListLongMap!8736 (toList!4383 List!15723)) )
))
(declare-fun lt!371518 () ListLongMap!8735)

(declare-fun getCurrentListMap!2479 (array!45957 array!45959 (_ BitVec 32) (_ BitVec 32) V!24867 V!24867 (_ BitVec 32) Int) ListLongMap!8735)

(assert (=> b!824063 (= lt!371518 (getCurrentListMap!2479 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!561896 () Bool)

(assert (=> start!70966 (=> (not res!561896) (not e!458436))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70966 (= res!561896 (validMask!0 mask!1312))))

(assert (=> start!70966 e!458436))

(declare-fun tp_is_empty!14899 () Bool)

(assert (=> start!70966 tp_is_empty!14899))

(declare-fun array_inv!17641 (array!45957) Bool)

(assert (=> start!70966 (array_inv!17641 _keys!976)))

(assert (=> start!70966 true))

(declare-fun e!458437 () Bool)

(declare-fun array_inv!17642 (array!45959) Bool)

(assert (=> start!70966 (and (array_inv!17642 _values!788) e!458437)))

(assert (=> start!70966 tp!46320))

(declare-fun b!824064 () Bool)

(declare-fun e!458439 () Bool)

(assert (=> b!824064 (= e!458439 tp_is_empty!14899)))

(declare-fun b!824065 () Bool)

(declare-fun e!458440 () Bool)

(assert (=> b!824065 (= e!458440 tp_is_empty!14899)))

(declare-fun b!824066 () Bool)

(declare-fun mapRes!23968 () Bool)

(assert (=> b!824066 (= e!458437 (and e!458440 mapRes!23968))))

(declare-fun condMapEmpty!23968 () Bool)

(declare-fun mapDefault!23968 () ValueCell!7034)

(assert (=> b!824066 (= condMapEmpty!23968 (= (arr!22027 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7034)) mapDefault!23968)))))

(declare-fun b!824067 () Bool)

(declare-fun res!561894 () Bool)

(assert (=> b!824067 (=> (not res!561894) (not e!458436))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!824067 (= res!561894 (and (= (size!22448 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22447 _keys!976) (size!22448 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!824068 () Bool)

(declare-fun res!561895 () Bool)

(assert (=> b!824068 (=> (not res!561895) (not e!458436))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45957 (_ BitVec 32)) Bool)

(assert (=> b!824068 (= res!561895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!824069 () Bool)

(assert (=> b!824069 (= e!458436 (not e!458438))))

(declare-fun res!561892 () Bool)

(assert (=> b!824069 (=> res!561892 e!458438)))

(assert (=> b!824069 (= res!561892 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!371516 () ListLongMap!8735)

(declare-fun lt!371517 () ListLongMap!8735)

(assert (=> b!824069 (= lt!371516 lt!371517)))

(declare-fun zeroValueAfter!34 () V!24867)

(declare-datatypes ((Unit!28190 0))(
  ( (Unit!28191) )
))
(declare-fun lt!371519 () Unit!28190)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!520 (array!45957 array!45959 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24867 V!24867 V!24867 V!24867 (_ BitVec 32) Int) Unit!28190)

(assert (=> b!824069 (= lt!371519 (lemmaNoChangeToArrayThenSameMapNoExtras!520 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2427 (array!45957 array!45959 (_ BitVec 32) (_ BitVec 32) V!24867 V!24867 (_ BitVec 32) Int) ListLongMap!8735)

(assert (=> b!824069 (= lt!371517 (getCurrentListMapNoExtraKeys!2427 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824069 (= lt!371516 (getCurrentListMapNoExtraKeys!2427 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23968 () Bool)

(assert (=> mapIsEmpty!23968 mapRes!23968))

(declare-fun mapNonEmpty!23968 () Bool)

(declare-fun tp!46321 () Bool)

(assert (=> mapNonEmpty!23968 (= mapRes!23968 (and tp!46321 e!458439))))

(declare-fun mapValue!23968 () ValueCell!7034)

(declare-fun mapKey!23968 () (_ BitVec 32))

(declare-fun mapRest!23968 () (Array (_ BitVec 32) ValueCell!7034))

(assert (=> mapNonEmpty!23968 (= (arr!22027 _values!788) (store mapRest!23968 mapKey!23968 mapValue!23968))))

(assert (= (and start!70966 res!561896) b!824067))

(assert (= (and b!824067 res!561894) b!824068))

(assert (= (and b!824068 res!561895) b!824062))

(assert (= (and b!824062 res!561893) b!824069))

(assert (= (and b!824069 (not res!561892)) b!824063))

(assert (= (and b!824066 condMapEmpty!23968) mapIsEmpty!23968))

(assert (= (and b!824066 (not condMapEmpty!23968)) mapNonEmpty!23968))

(get-info :version)

(assert (= (and mapNonEmpty!23968 ((_ is ValueCellFull!7034) mapValue!23968)) b!824064))

(assert (= (and b!824066 ((_ is ValueCellFull!7034) mapDefault!23968)) b!824065))

(assert (= start!70966 b!824066))

(declare-fun m!765665 () Bool)

(assert (=> mapNonEmpty!23968 m!765665))

(declare-fun m!765667 () Bool)

(assert (=> start!70966 m!765667))

(declare-fun m!765669 () Bool)

(assert (=> start!70966 m!765669))

(declare-fun m!765671 () Bool)

(assert (=> start!70966 m!765671))

(declare-fun m!765673 () Bool)

(assert (=> b!824063 m!765673))

(declare-fun m!765675 () Bool)

(assert (=> b!824069 m!765675))

(declare-fun m!765677 () Bool)

(assert (=> b!824069 m!765677))

(declare-fun m!765679 () Bool)

(assert (=> b!824069 m!765679))

(declare-fun m!765681 () Bool)

(assert (=> b!824062 m!765681))

(declare-fun m!765683 () Bool)

(assert (=> b!824068 m!765683))

(check-sat (not b!824068) (not b!824062) (not b!824063) b_and!22067 tp_is_empty!14899 (not start!70966) (not mapNonEmpty!23968) (not b_next!13189) (not b!824069))
(check-sat b_and!22067 (not b_next!13189))
