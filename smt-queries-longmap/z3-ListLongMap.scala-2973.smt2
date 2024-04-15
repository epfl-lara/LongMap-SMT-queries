; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42100 () Bool)

(assert start!42100)

(declare-fun b_free!11647 () Bool)

(declare-fun b_next!11647 () Bool)

(assert (=> start!42100 (= b_free!11647 (not b_next!11647))))

(declare-fun tp!40963 () Bool)

(declare-fun b_and!20043 () Bool)

(assert (=> start!42100 (= tp!40963 b_and!20043)))

(declare-fun res!280819 () Bool)

(declare-fun e!275232 () Bool)

(assert (=> start!42100 (=> (not res!280819) (not e!275232))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42100 (= res!280819 (validMask!0 mask!1365))))

(assert (=> start!42100 e!275232))

(declare-fun tp_is_empty!13075 () Bool)

(assert (=> start!42100 tp_is_empty!13075))

(assert (=> start!42100 tp!40963))

(assert (=> start!42100 true))

(declare-datatypes ((array!29905 0))(
  ( (array!29906 (arr!14376 (Array (_ BitVec 32) (_ BitVec 64))) (size!14729 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29905)

(declare-fun array_inv!10456 (array!29905) Bool)

(assert (=> start!42100 (array_inv!10456 _keys!1025)))

(declare-datatypes ((V!18539 0))(
  ( (V!18540 (val!6582 Int)) )
))
(declare-datatypes ((ValueCell!6194 0))(
  ( (ValueCellFull!6194 (v!8867 V!18539)) (EmptyCell!6194) )
))
(declare-datatypes ((array!29907 0))(
  ( (array!29908 (arr!14377 (Array (_ BitVec 32) ValueCell!6194)) (size!14730 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29907)

(declare-fun e!275233 () Bool)

(declare-fun array_inv!10457 (array!29907) Bool)

(assert (=> start!42100 (and (array_inv!10457 _values!833) e!275233)))

(declare-fun b!469903 () Bool)

(declare-fun e!275234 () Bool)

(assert (=> b!469903 (= e!275234 tp_is_empty!13075)))

(declare-fun b!469904 () Bool)

(declare-fun e!275235 () Bool)

(assert (=> b!469904 (= e!275235 tp_is_empty!13075)))

(declare-fun b!469905 () Bool)

(declare-fun res!280820 () Bool)

(assert (=> b!469905 (=> (not res!280820) (not e!275232))))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!469905 (= res!280820 (and (= (size!14730 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14729 _keys!1025) (size!14730 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!469906 () Bool)

(declare-fun res!280821 () Bool)

(assert (=> b!469906 (=> (not res!280821) (not e!275232))))

(declare-datatypes ((List!8773 0))(
  ( (Nil!8770) (Cons!8769 (h!9625 (_ BitVec 64)) (t!14726 List!8773)) )
))
(declare-fun arrayNoDuplicates!0 (array!29905 (_ BitVec 32) List!8773) Bool)

(assert (=> b!469906 (= res!280821 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8770))))

(declare-fun b!469907 () Bool)

(declare-fun res!280818 () Bool)

(assert (=> b!469907 (=> (not res!280818) (not e!275232))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29905 (_ BitVec 32)) Bool)

(assert (=> b!469907 (= res!280818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!21313 () Bool)

(declare-fun mapRes!21313 () Bool)

(declare-fun tp!40962 () Bool)

(assert (=> mapNonEmpty!21313 (= mapRes!21313 (and tp!40962 e!275235))))

(declare-fun mapRest!21313 () (Array (_ BitVec 32) ValueCell!6194))

(declare-fun mapValue!21313 () ValueCell!6194)

(declare-fun mapKey!21313 () (_ BitVec 32))

(assert (=> mapNonEmpty!21313 (= (arr!14377 _values!833) (store mapRest!21313 mapKey!21313 mapValue!21313))))

(declare-fun mapIsEmpty!21313 () Bool)

(assert (=> mapIsEmpty!21313 mapRes!21313))

(declare-fun b!469908 () Bool)

(assert (=> b!469908 (= e!275232 (not true))))

(declare-datatypes ((tuple2!8704 0))(
  ( (tuple2!8705 (_1!4363 (_ BitVec 64)) (_2!4363 V!18539)) )
))
(declare-datatypes ((List!8774 0))(
  ( (Nil!8771) (Cons!8770 (h!9626 tuple2!8704) (t!14727 List!8774)) )
))
(declare-datatypes ((ListLongMap!7607 0))(
  ( (ListLongMap!7608 (toList!3819 List!8774)) )
))
(declare-fun lt!213106 () ListLongMap!7607)

(declare-fun lt!213108 () ListLongMap!7607)

(assert (=> b!469908 (= lt!213106 lt!213108)))

(declare-fun minValueBefore!38 () V!18539)

(declare-fun zeroValue!794 () V!18539)

(declare-datatypes ((Unit!13739 0))(
  ( (Unit!13740) )
))
(declare-fun lt!213107 () Unit!13739)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18539)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!151 (array!29905 array!29907 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18539 V!18539 V!18539 V!18539 (_ BitVec 32) Int) Unit!13739)

(assert (=> b!469908 (= lt!213107 (lemmaNoChangeToArrayThenSameMapNoExtras!151 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1994 (array!29905 array!29907 (_ BitVec 32) (_ BitVec 32) V!18539 V!18539 (_ BitVec 32) Int) ListLongMap!7607)

(assert (=> b!469908 (= lt!213108 (getCurrentListMapNoExtraKeys!1994 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!469908 (= lt!213106 (getCurrentListMapNoExtraKeys!1994 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469909 () Bool)

(assert (=> b!469909 (= e!275233 (and e!275234 mapRes!21313))))

(declare-fun condMapEmpty!21313 () Bool)

(declare-fun mapDefault!21313 () ValueCell!6194)

(assert (=> b!469909 (= condMapEmpty!21313 (= (arr!14377 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6194)) mapDefault!21313)))))

(assert (= (and start!42100 res!280819) b!469905))

(assert (= (and b!469905 res!280820) b!469907))

(assert (= (and b!469907 res!280818) b!469906))

(assert (= (and b!469906 res!280821) b!469908))

(assert (= (and b!469909 condMapEmpty!21313) mapIsEmpty!21313))

(assert (= (and b!469909 (not condMapEmpty!21313)) mapNonEmpty!21313))

(get-info :version)

(assert (= (and mapNonEmpty!21313 ((_ is ValueCellFull!6194) mapValue!21313)) b!469904))

(assert (= (and b!469909 ((_ is ValueCellFull!6194) mapDefault!21313)) b!469903))

(assert (= start!42100 b!469909))

(declare-fun m!451767 () Bool)

(assert (=> start!42100 m!451767))

(declare-fun m!451769 () Bool)

(assert (=> start!42100 m!451769))

(declare-fun m!451771 () Bool)

(assert (=> start!42100 m!451771))

(declare-fun m!451773 () Bool)

(assert (=> b!469908 m!451773))

(declare-fun m!451775 () Bool)

(assert (=> b!469908 m!451775))

(declare-fun m!451777 () Bool)

(assert (=> b!469908 m!451777))

(declare-fun m!451779 () Bool)

(assert (=> mapNonEmpty!21313 m!451779))

(declare-fun m!451781 () Bool)

(assert (=> b!469906 m!451781))

(declare-fun m!451783 () Bool)

(assert (=> b!469907 m!451783))

(check-sat (not b!469906) (not start!42100) (not b_next!11647) tp_is_empty!13075 (not b!469908) b_and!20043 (not b!469907) (not mapNonEmpty!21313))
(check-sat b_and!20043 (not b_next!11647))
