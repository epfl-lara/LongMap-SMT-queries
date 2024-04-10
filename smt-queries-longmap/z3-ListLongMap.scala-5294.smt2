; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70956 () Bool)

(assert start!70956)

(declare-fun b_free!13173 () Bool)

(declare-fun b_next!13173 () Bool)

(assert (=> start!70956 (= b_free!13173 (not b_next!13173))))

(declare-fun tp!46269 () Bool)

(declare-fun b_and!22069 () Bool)

(assert (=> start!70956 (= tp!46269 b_and!22069)))

(declare-fun b!824053 () Bool)

(declare-fun res!561870 () Bool)

(declare-fun e!458411 () Bool)

(assert (=> b!824053 (=> (not res!561870) (not e!458411))))

(declare-datatypes ((array!45954 0))(
  ( (array!45955 (arr!22025 (Array (_ BitVec 32) (_ BitVec 64))) (size!22446 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45954)

(declare-datatypes ((List!15719 0))(
  ( (Nil!15716) (Cons!15715 (h!16844 (_ BitVec 64)) (t!22060 List!15719)) )
))
(declare-fun arrayNoDuplicates!0 (array!45954 (_ BitVec 32) List!15719) Bool)

(assert (=> b!824053 (= res!561870 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15716))))

(declare-fun b!824054 () Bool)

(declare-fun e!458409 () Bool)

(declare-fun e!458410 () Bool)

(declare-fun mapRes!23941 () Bool)

(assert (=> b!824054 (= e!458409 (and e!458410 mapRes!23941))))

(declare-fun condMapEmpty!23941 () Bool)

(declare-datatypes ((V!24845 0))(
  ( (V!24846 (val!7489 Int)) )
))
(declare-datatypes ((ValueCell!7026 0))(
  ( (ValueCellFull!7026 (v!9922 V!24845)) (EmptyCell!7026) )
))
(declare-datatypes ((array!45956 0))(
  ( (array!45957 (arr!22026 (Array (_ BitVec 32) ValueCell!7026)) (size!22447 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45956)

(declare-fun mapDefault!23941 () ValueCell!7026)

(assert (=> b!824054 (= condMapEmpty!23941 (= (arr!22026 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7026)) mapDefault!23941)))))

(declare-fun res!561869 () Bool)

(assert (=> start!70956 (=> (not res!561869) (not e!458411))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70956 (= res!561869 (validMask!0 mask!1312))))

(assert (=> start!70956 e!458411))

(declare-fun tp_is_empty!14883 () Bool)

(assert (=> start!70956 tp_is_empty!14883))

(declare-fun array_inv!17575 (array!45954) Bool)

(assert (=> start!70956 (array_inv!17575 _keys!976)))

(assert (=> start!70956 true))

(declare-fun array_inv!17576 (array!45956) Bool)

(assert (=> start!70956 (and (array_inv!17576 _values!788) e!458409)))

(assert (=> start!70956 tp!46269))

(declare-fun b!824055 () Bool)

(assert (=> b!824055 (= e!458410 tp_is_empty!14883)))

(declare-fun b!824056 () Bool)

(declare-fun e!458413 () Bool)

(assert (=> b!824056 (= e!458413 tp_is_empty!14883)))

(declare-fun mapIsEmpty!23941 () Bool)

(assert (=> mapIsEmpty!23941 mapRes!23941))

(declare-fun b!824057 () Bool)

(declare-fun res!561871 () Bool)

(assert (=> b!824057 (=> (not res!561871) (not e!458411))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!824057 (= res!561871 (and (= (size!22447 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22446 _keys!976) (size!22447 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!824058 () Bool)

(assert (=> b!824058 (= e!458411 (not true))))

(declare-datatypes ((tuple2!9908 0))(
  ( (tuple2!9909 (_1!4965 (_ BitVec 64)) (_2!4965 V!24845)) )
))
(declare-datatypes ((List!15720 0))(
  ( (Nil!15717) (Cons!15716 (h!16845 tuple2!9908) (t!22061 List!15720)) )
))
(declare-datatypes ((ListLongMap!8731 0))(
  ( (ListLongMap!8732 (toList!4381 List!15720)) )
))
(declare-fun lt!371645 () ListLongMap!8731)

(declare-fun lt!371646 () ListLongMap!8731)

(assert (=> b!824058 (= lt!371645 lt!371646)))

(declare-datatypes ((Unit!28230 0))(
  ( (Unit!28231) )
))
(declare-fun lt!371647 () Unit!28230)

(declare-fun zeroValueBefore!34 () V!24845)

(declare-fun zeroValueAfter!34 () V!24845)

(declare-fun minValue!754 () V!24845)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!506 (array!45954 array!45956 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24845 V!24845 V!24845 V!24845 (_ BitVec 32) Int) Unit!28230)

(assert (=> b!824058 (= lt!371647 (lemmaNoChangeToArrayThenSameMapNoExtras!506 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2396 (array!45954 array!45956 (_ BitVec 32) (_ BitVec 32) V!24845 V!24845 (_ BitVec 32) Int) ListLongMap!8731)

(assert (=> b!824058 (= lt!371646 (getCurrentListMapNoExtraKeys!2396 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824058 (= lt!371645 (getCurrentListMapNoExtraKeys!2396 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23941 () Bool)

(declare-fun tp!46270 () Bool)

(assert (=> mapNonEmpty!23941 (= mapRes!23941 (and tp!46270 e!458413))))

(declare-fun mapRest!23941 () (Array (_ BitVec 32) ValueCell!7026))

(declare-fun mapValue!23941 () ValueCell!7026)

(declare-fun mapKey!23941 () (_ BitVec 32))

(assert (=> mapNonEmpty!23941 (= (arr!22026 _values!788) (store mapRest!23941 mapKey!23941 mapValue!23941))))

(declare-fun b!824059 () Bool)

(declare-fun res!561872 () Bool)

(assert (=> b!824059 (=> (not res!561872) (not e!458411))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45954 (_ BitVec 32)) Bool)

(assert (=> b!824059 (= res!561872 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!70956 res!561869) b!824057))

(assert (= (and b!824057 res!561871) b!824059))

(assert (= (and b!824059 res!561872) b!824053))

(assert (= (and b!824053 res!561870) b!824058))

(assert (= (and b!824054 condMapEmpty!23941) mapIsEmpty!23941))

(assert (= (and b!824054 (not condMapEmpty!23941)) mapNonEmpty!23941))

(get-info :version)

(assert (= (and mapNonEmpty!23941 ((_ is ValueCellFull!7026) mapValue!23941)) b!824056))

(assert (= (and b!824054 ((_ is ValueCellFull!7026) mapDefault!23941)) b!824055))

(assert (= start!70956 b!824054))

(declare-fun m!766207 () Bool)

(assert (=> b!824059 m!766207))

(declare-fun m!766209 () Bool)

(assert (=> b!824058 m!766209))

(declare-fun m!766211 () Bool)

(assert (=> b!824058 m!766211))

(declare-fun m!766213 () Bool)

(assert (=> b!824058 m!766213))

(declare-fun m!766215 () Bool)

(assert (=> mapNonEmpty!23941 m!766215))

(declare-fun m!766217 () Bool)

(assert (=> b!824053 m!766217))

(declare-fun m!766219 () Bool)

(assert (=> start!70956 m!766219))

(declare-fun m!766221 () Bool)

(assert (=> start!70956 m!766221))

(declare-fun m!766223 () Bool)

(assert (=> start!70956 m!766223))

(check-sat (not b_next!13173) (not mapNonEmpty!23941) b_and!22069 (not b!824058) (not start!70956) (not b!824059) (not b!824053) tp_is_empty!14883)
(check-sat b_and!22069 (not b_next!13173))
