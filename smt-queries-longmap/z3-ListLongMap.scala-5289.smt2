; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70926 () Bool)

(assert start!70926)

(declare-fun b_free!13143 () Bool)

(declare-fun b_next!13143 () Bool)

(assert (=> start!70926 (= b_free!13143 (not b_next!13143))))

(declare-fun tp!46179 () Bool)

(declare-fun b_and!22039 () Bool)

(assert (=> start!70926 (= tp!46179 b_and!22039)))

(declare-fun b!823738 () Bool)

(declare-fun e!458184 () Bool)

(declare-fun tp_is_empty!14853 () Bool)

(assert (=> b!823738 (= e!458184 tp_is_empty!14853)))

(declare-fun res!561689 () Bool)

(declare-fun e!458188 () Bool)

(assert (=> start!70926 (=> (not res!561689) (not e!458188))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70926 (= res!561689 (validMask!0 mask!1312))))

(assert (=> start!70926 e!458188))

(assert (=> start!70926 tp_is_empty!14853))

(declare-datatypes ((array!45896 0))(
  ( (array!45897 (arr!21996 (Array (_ BitVec 32) (_ BitVec 64))) (size!22417 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45896)

(declare-fun array_inv!17555 (array!45896) Bool)

(assert (=> start!70926 (array_inv!17555 _keys!976)))

(assert (=> start!70926 true))

(declare-datatypes ((V!24805 0))(
  ( (V!24806 (val!7474 Int)) )
))
(declare-datatypes ((ValueCell!7011 0))(
  ( (ValueCellFull!7011 (v!9907 V!24805)) (EmptyCell!7011) )
))
(declare-datatypes ((array!45898 0))(
  ( (array!45899 (arr!21997 (Array (_ BitVec 32) ValueCell!7011)) (size!22418 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45898)

(declare-fun e!458187 () Bool)

(declare-fun array_inv!17556 (array!45898) Bool)

(assert (=> start!70926 (and (array_inv!17556 _values!788) e!458187)))

(assert (=> start!70926 tp!46179))

(declare-fun b!823739 () Bool)

(assert (=> b!823739 (= e!458188 (not true))))

(declare-datatypes ((tuple2!9884 0))(
  ( (tuple2!9885 (_1!4953 (_ BitVec 64)) (_2!4953 V!24805)) )
))
(declare-datatypes ((List!15695 0))(
  ( (Nil!15692) (Cons!15691 (h!16820 tuple2!9884) (t!22036 List!15695)) )
))
(declare-datatypes ((ListLongMap!8707 0))(
  ( (ListLongMap!8708 (toList!4369 List!15695)) )
))
(declare-fun lt!371512 () ListLongMap!8707)

(declare-fun lt!371510 () ListLongMap!8707)

(assert (=> b!823739 (= lt!371512 lt!371510)))

(declare-fun zeroValueBefore!34 () V!24805)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24805)

(declare-fun minValue!754 () V!24805)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28206 0))(
  ( (Unit!28207) )
))
(declare-fun lt!371511 () Unit!28206)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!494 (array!45896 array!45898 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24805 V!24805 V!24805 V!24805 (_ BitVec 32) Int) Unit!28206)

(assert (=> b!823739 (= lt!371511 (lemmaNoChangeToArrayThenSameMapNoExtras!494 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2384 (array!45896 array!45898 (_ BitVec 32) (_ BitVec 32) V!24805 V!24805 (_ BitVec 32) Int) ListLongMap!8707)

(assert (=> b!823739 (= lt!371510 (getCurrentListMapNoExtraKeys!2384 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823739 (= lt!371512 (getCurrentListMapNoExtraKeys!2384 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823740 () Bool)

(declare-fun res!561692 () Bool)

(assert (=> b!823740 (=> (not res!561692) (not e!458188))))

(declare-datatypes ((List!15696 0))(
  ( (Nil!15693) (Cons!15692 (h!16821 (_ BitVec 64)) (t!22037 List!15696)) )
))
(declare-fun arrayNoDuplicates!0 (array!45896 (_ BitVec 32) List!15696) Bool)

(assert (=> b!823740 (= res!561692 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15693))))

(declare-fun b!823741 () Bool)

(declare-fun res!561690 () Bool)

(assert (=> b!823741 (=> (not res!561690) (not e!458188))))

(assert (=> b!823741 (= res!561690 (and (= (size!22418 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22417 _keys!976) (size!22418 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!23896 () Bool)

(declare-fun mapRes!23896 () Bool)

(assert (=> mapIsEmpty!23896 mapRes!23896))

(declare-fun b!823742 () Bool)

(declare-fun e!458186 () Bool)

(assert (=> b!823742 (= e!458186 tp_is_empty!14853)))

(declare-fun b!823743 () Bool)

(assert (=> b!823743 (= e!458187 (and e!458184 mapRes!23896))))

(declare-fun condMapEmpty!23896 () Bool)

(declare-fun mapDefault!23896 () ValueCell!7011)

(assert (=> b!823743 (= condMapEmpty!23896 (= (arr!21997 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7011)) mapDefault!23896)))))

(declare-fun b!823744 () Bool)

(declare-fun res!561691 () Bool)

(assert (=> b!823744 (=> (not res!561691) (not e!458188))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45896 (_ BitVec 32)) Bool)

(assert (=> b!823744 (= res!561691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!23896 () Bool)

(declare-fun tp!46180 () Bool)

(assert (=> mapNonEmpty!23896 (= mapRes!23896 (and tp!46180 e!458186))))

(declare-fun mapRest!23896 () (Array (_ BitVec 32) ValueCell!7011))

(declare-fun mapKey!23896 () (_ BitVec 32))

(declare-fun mapValue!23896 () ValueCell!7011)

(assert (=> mapNonEmpty!23896 (= (arr!21997 _values!788) (store mapRest!23896 mapKey!23896 mapValue!23896))))

(assert (= (and start!70926 res!561689) b!823741))

(assert (= (and b!823741 res!561690) b!823744))

(assert (= (and b!823744 res!561691) b!823740))

(assert (= (and b!823740 res!561692) b!823739))

(assert (= (and b!823743 condMapEmpty!23896) mapIsEmpty!23896))

(assert (= (and b!823743 (not condMapEmpty!23896)) mapNonEmpty!23896))

(get-info :version)

(assert (= (and mapNonEmpty!23896 ((_ is ValueCellFull!7011) mapValue!23896)) b!823742))

(assert (= (and b!823743 ((_ is ValueCellFull!7011) mapDefault!23896)) b!823738))

(assert (= start!70926 b!823743))

(declare-fun m!765937 () Bool)

(assert (=> b!823739 m!765937))

(declare-fun m!765939 () Bool)

(assert (=> b!823739 m!765939))

(declare-fun m!765941 () Bool)

(assert (=> b!823739 m!765941))

(declare-fun m!765943 () Bool)

(assert (=> b!823744 m!765943))

(declare-fun m!765945 () Bool)

(assert (=> mapNonEmpty!23896 m!765945))

(declare-fun m!765947 () Bool)

(assert (=> b!823740 m!765947))

(declare-fun m!765949 () Bool)

(assert (=> start!70926 m!765949))

(declare-fun m!765951 () Bool)

(assert (=> start!70926 m!765951))

(declare-fun m!765953 () Bool)

(assert (=> start!70926 m!765953))

(check-sat (not b_next!13143) (not mapNonEmpty!23896) (not b!823739) tp_is_empty!14853 b_and!22039 (not b!823744) (not b!823740) (not start!70926))
(check-sat b_and!22039 (not b_next!13143))
