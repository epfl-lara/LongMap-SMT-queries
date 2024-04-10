; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71000 () Bool)

(assert start!71000)

(declare-fun b_free!13203 () Bool)

(declare-fun b_next!13203 () Bool)

(assert (=> start!71000 (= b_free!13203 (not b_next!13203))))

(declare-fun tp!46363 () Bool)

(declare-fun b_and!22107 () Bool)

(assert (=> start!71000 (= tp!46363 b_and!22107)))

(declare-fun res!562107 () Bool)

(declare-fun e!458716 () Bool)

(assert (=> start!71000 (=> (not res!562107) (not e!458716))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71000 (= res!562107 (validMask!0 mask!1312))))

(assert (=> start!71000 e!458716))

(declare-fun tp_is_empty!14913 () Bool)

(assert (=> start!71000 tp_is_empty!14913))

(declare-datatypes ((array!46014 0))(
  ( (array!46015 (arr!22054 (Array (_ BitVec 32) (_ BitVec 64))) (size!22475 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46014)

(declare-fun array_inv!17597 (array!46014) Bool)

(assert (=> start!71000 (array_inv!17597 _keys!976)))

(assert (=> start!71000 true))

(declare-datatypes ((V!24885 0))(
  ( (V!24886 (val!7504 Int)) )
))
(declare-datatypes ((ValueCell!7041 0))(
  ( (ValueCellFull!7041 (v!9937 V!24885)) (EmptyCell!7041) )
))
(declare-datatypes ((array!46016 0))(
  ( (array!46017 (arr!22055 (Array (_ BitVec 32) ValueCell!7041)) (size!22476 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46016)

(declare-fun e!458715 () Bool)

(declare-fun array_inv!17598 (array!46016) Bool)

(assert (=> start!71000 (and (array_inv!17598 _values!788) e!458715)))

(assert (=> start!71000 tp!46363))

(declare-fun mapNonEmpty!23989 () Bool)

(declare-fun mapRes!23989 () Bool)

(declare-fun tp!46362 () Bool)

(declare-fun e!458717 () Bool)

(assert (=> mapNonEmpty!23989 (= mapRes!23989 (and tp!46362 e!458717))))

(declare-fun mapRest!23989 () (Array (_ BitVec 32) ValueCell!7041))

(declare-fun mapValue!23989 () ValueCell!7041)

(declare-fun mapKey!23989 () (_ BitVec 32))

(assert (=> mapNonEmpty!23989 (= (arr!22055 _values!788) (store mapRest!23989 mapKey!23989 mapValue!23989))))

(declare-fun b!824476 () Bool)

(declare-fun e!458712 () Bool)

(assert (=> b!824476 (= e!458712 tp_is_empty!14913)))

(declare-fun b!824477 () Bool)

(declare-fun e!458713 () Bool)

(assert (=> b!824477 (= e!458716 (not e!458713))))

(declare-fun res!562104 () Bool)

(assert (=> b!824477 (=> res!562104 e!458713)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!824477 (= res!562104 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!9930 0))(
  ( (tuple2!9931 (_1!4976 (_ BitVec 64)) (_2!4976 V!24885)) )
))
(declare-datatypes ((List!15742 0))(
  ( (Nil!15739) (Cons!15738 (h!16867 tuple2!9930) (t!22085 List!15742)) )
))
(declare-datatypes ((ListLongMap!8753 0))(
  ( (ListLongMap!8754 (toList!4392 List!15742)) )
))
(declare-fun lt!371844 () ListLongMap!8753)

(declare-fun lt!371843 () ListLongMap!8753)

(assert (=> b!824477 (= lt!371844 lt!371843)))

(declare-fun zeroValueBefore!34 () V!24885)

(declare-fun zeroValueAfter!34 () V!24885)

(declare-fun minValue!754 () V!24885)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28252 0))(
  ( (Unit!28253) )
))
(declare-fun lt!371845 () Unit!28252)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!517 (array!46014 array!46016 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24885 V!24885 V!24885 V!24885 (_ BitVec 32) Int) Unit!28252)

(assert (=> b!824477 (= lt!371845 (lemmaNoChangeToArrayThenSameMapNoExtras!517 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2407 (array!46014 array!46016 (_ BitVec 32) (_ BitVec 32) V!24885 V!24885 (_ BitVec 32) Int) ListLongMap!8753)

(assert (=> b!824477 (= lt!371843 (getCurrentListMapNoExtraKeys!2407 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824477 (= lt!371844 (getCurrentListMapNoExtraKeys!2407 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824478 () Bool)

(assert (=> b!824478 (= e!458717 tp_is_empty!14913)))

(declare-fun mapIsEmpty!23989 () Bool)

(assert (=> mapIsEmpty!23989 mapRes!23989))

(declare-fun b!824479 () Bool)

(assert (=> b!824479 (= e!458715 (and e!458712 mapRes!23989))))

(declare-fun condMapEmpty!23989 () Bool)

(declare-fun mapDefault!23989 () ValueCell!7041)

(assert (=> b!824479 (= condMapEmpty!23989 (= (arr!22055 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7041)) mapDefault!23989)))))

(declare-fun b!824480 () Bool)

(assert (=> b!824480 (= e!458713 true)))

(declare-fun lt!371846 () ListLongMap!8753)

(declare-fun getCurrentListMap!2533 (array!46014 array!46016 (_ BitVec 32) (_ BitVec 32) V!24885 V!24885 (_ BitVec 32) Int) ListLongMap!8753)

(assert (=> b!824480 (= lt!371846 (getCurrentListMap!2533 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824481 () Bool)

(declare-fun res!562105 () Bool)

(assert (=> b!824481 (=> (not res!562105) (not e!458716))))

(declare-datatypes ((List!15743 0))(
  ( (Nil!15740) (Cons!15739 (h!16868 (_ BitVec 64)) (t!22086 List!15743)) )
))
(declare-fun arrayNoDuplicates!0 (array!46014 (_ BitVec 32) List!15743) Bool)

(assert (=> b!824481 (= res!562105 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15740))))

(declare-fun b!824482 () Bool)

(declare-fun res!562103 () Bool)

(assert (=> b!824482 (=> (not res!562103) (not e!458716))))

(assert (=> b!824482 (= res!562103 (and (= (size!22476 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22475 _keys!976) (size!22476 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!824483 () Bool)

(declare-fun res!562106 () Bool)

(assert (=> b!824483 (=> (not res!562106) (not e!458716))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46014 (_ BitVec 32)) Bool)

(assert (=> b!824483 (= res!562106 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!71000 res!562107) b!824482))

(assert (= (and b!824482 res!562103) b!824483))

(assert (= (and b!824483 res!562106) b!824481))

(assert (= (and b!824481 res!562105) b!824477))

(assert (= (and b!824477 (not res!562104)) b!824480))

(assert (= (and b!824479 condMapEmpty!23989) mapIsEmpty!23989))

(assert (= (and b!824479 (not condMapEmpty!23989)) mapNonEmpty!23989))

(get-info :version)

(assert (= (and mapNonEmpty!23989 ((_ is ValueCellFull!7041) mapValue!23989)) b!824478))

(assert (= (and b!824479 ((_ is ValueCellFull!7041) mapDefault!23989)) b!824476))

(assert (= start!71000 b!824479))

(declare-fun m!766557 () Bool)

(assert (=> b!824481 m!766557))

(declare-fun m!766559 () Bool)

(assert (=> b!824480 m!766559))

(declare-fun m!766561 () Bool)

(assert (=> b!824483 m!766561))

(declare-fun m!766563 () Bool)

(assert (=> b!824477 m!766563))

(declare-fun m!766565 () Bool)

(assert (=> b!824477 m!766565))

(declare-fun m!766567 () Bool)

(assert (=> b!824477 m!766567))

(declare-fun m!766569 () Bool)

(assert (=> mapNonEmpty!23989 m!766569))

(declare-fun m!766571 () Bool)

(assert (=> start!71000 m!766571))

(declare-fun m!766573 () Bool)

(assert (=> start!71000 m!766573))

(declare-fun m!766575 () Bool)

(assert (=> start!71000 m!766575))

(check-sat (not start!71000) (not b_next!13203) (not mapNonEmpty!23989) b_and!22107 tp_is_empty!14913 (not b!824477) (not b!824481) (not b!824480) (not b!824483))
(check-sat b_and!22107 (not b_next!13203))
