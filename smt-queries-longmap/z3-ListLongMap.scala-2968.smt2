; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42066 () Bool)

(assert start!42066)

(declare-fun b_free!11619 () Bool)

(declare-fun b_next!11619 () Bool)

(assert (=> start!42066 (= b_free!11619 (not b_next!11619))))

(declare-fun tp!40875 () Bool)

(declare-fun b_and!20029 () Bool)

(assert (=> start!42066 (= tp!40875 b_and!20029)))

(declare-fun mapIsEmpty!21268 () Bool)

(declare-fun mapRes!21268 () Bool)

(assert (=> mapIsEmpty!21268 mapRes!21268))

(declare-fun b!469661 () Bool)

(declare-fun res!280664 () Bool)

(declare-fun e!275048 () Bool)

(assert (=> b!469661 (=> (not res!280664) (not e!275048))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29865 0))(
  ( (array!29866 (arr!14357 (Array (_ BitVec 32) (_ BitVec 64))) (size!14709 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29865)

(declare-datatypes ((V!18501 0))(
  ( (V!18502 (val!6568 Int)) )
))
(declare-datatypes ((ValueCell!6180 0))(
  ( (ValueCellFull!6180 (v!8858 V!18501)) (EmptyCell!6180) )
))
(declare-datatypes ((array!29867 0))(
  ( (array!29868 (arr!14358 (Array (_ BitVec 32) ValueCell!6180)) (size!14710 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29867)

(assert (=> b!469661 (= res!280664 (and (= (size!14710 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14709 _keys!1025) (size!14710 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!469662 () Bool)

(declare-fun e!275045 () Bool)

(declare-fun tp_is_empty!13047 () Bool)

(assert (=> b!469662 (= e!275045 tp_is_empty!13047)))

(declare-fun b!469663 () Bool)

(declare-fun res!280666 () Bool)

(assert (=> b!469663 (=> (not res!280666) (not e!275048))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29865 (_ BitVec 32)) Bool)

(assert (=> b!469663 (= res!280666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!469664 () Bool)

(declare-fun e!275049 () Bool)

(assert (=> b!469664 (= e!275049 (and e!275045 mapRes!21268))))

(declare-fun condMapEmpty!21268 () Bool)

(declare-fun mapDefault!21268 () ValueCell!6180)

(assert (=> b!469664 (= condMapEmpty!21268 (= (arr!14358 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6180)) mapDefault!21268)))))

(declare-fun mapNonEmpty!21268 () Bool)

(declare-fun tp!40876 () Bool)

(declare-fun e!275047 () Bool)

(assert (=> mapNonEmpty!21268 (= mapRes!21268 (and tp!40876 e!275047))))

(declare-fun mapKey!21268 () (_ BitVec 32))

(declare-fun mapValue!21268 () ValueCell!6180)

(declare-fun mapRest!21268 () (Array (_ BitVec 32) ValueCell!6180))

(assert (=> mapNonEmpty!21268 (= (arr!14358 _values!833) (store mapRest!21268 mapKey!21268 mapValue!21268))))

(declare-fun res!280662 () Bool)

(assert (=> start!42066 (=> (not res!280662) (not e!275048))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42066 (= res!280662 (validMask!0 mask!1365))))

(assert (=> start!42066 e!275048))

(assert (=> start!42066 tp_is_empty!13047))

(assert (=> start!42066 tp!40875))

(assert (=> start!42066 true))

(declare-fun array_inv!10362 (array!29865) Bool)

(assert (=> start!42066 (array_inv!10362 _keys!1025)))

(declare-fun array_inv!10363 (array!29867) Bool)

(assert (=> start!42066 (and (array_inv!10363 _values!833) e!275049)))

(declare-fun b!469665 () Bool)

(declare-fun e!275046 () Bool)

(assert (=> b!469665 (= e!275048 (not e!275046))))

(declare-fun res!280665 () Bool)

(assert (=> b!469665 (=> res!280665 e!275046)))

(assert (=> b!469665 (= res!280665 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8646 0))(
  ( (tuple2!8647 (_1!4334 (_ BitVec 64)) (_2!4334 V!18501)) )
))
(declare-datatypes ((List!8725 0))(
  ( (Nil!8722) (Cons!8721 (h!9577 tuple2!8646) (t!14685 List!8725)) )
))
(declare-datatypes ((ListLongMap!7559 0))(
  ( (ListLongMap!7560 (toList!3795 List!8725)) )
))
(declare-fun lt!212908 () ListLongMap!7559)

(declare-fun lt!212905 () ListLongMap!7559)

(assert (=> b!469665 (= lt!212908 lt!212905)))

(declare-fun minValueBefore!38 () V!18501)

(declare-fun zeroValue!794 () V!18501)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18501)

(declare-datatypes ((Unit!13747 0))(
  ( (Unit!13748) )
))
(declare-fun lt!212907 () Unit!13747)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!142 (array!29865 array!29867 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18501 V!18501 V!18501 V!18501 (_ BitVec 32) Int) Unit!13747)

(assert (=> b!469665 (= lt!212907 (lemmaNoChangeToArrayThenSameMapNoExtras!142 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1962 (array!29865 array!29867 (_ BitVec 32) (_ BitVec 32) V!18501 V!18501 (_ BitVec 32) Int) ListLongMap!7559)

(assert (=> b!469665 (= lt!212905 (getCurrentListMapNoExtraKeys!1962 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!469665 (= lt!212908 (getCurrentListMapNoExtraKeys!1962 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469666 () Bool)

(declare-fun res!280663 () Bool)

(assert (=> b!469666 (=> (not res!280663) (not e!275048))))

(declare-datatypes ((List!8726 0))(
  ( (Nil!8723) (Cons!8722 (h!9578 (_ BitVec 64)) (t!14686 List!8726)) )
))
(declare-fun arrayNoDuplicates!0 (array!29865 (_ BitVec 32) List!8726) Bool)

(assert (=> b!469666 (= res!280663 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8723))))

(declare-fun b!469667 () Bool)

(assert (=> b!469667 (= e!275047 tp_is_empty!13047)))

(declare-fun b!469668 () Bool)

(assert (=> b!469668 (= e!275046 true)))

(declare-fun lt!212903 () tuple2!8646)

(declare-fun +!1703 (ListLongMap!7559 tuple2!8646) ListLongMap!7559)

(assert (=> b!469668 (= (+!1703 lt!212908 lt!212903) (+!1703 (+!1703 lt!212908 (tuple2!8647 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212903))))

(assert (=> b!469668 (= lt!212903 (tuple2!8647 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!212904 () Unit!13747)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!116 (ListLongMap!7559 (_ BitVec 64) V!18501 V!18501) Unit!13747)

(assert (=> b!469668 (= lt!212904 (addSameAsAddTwiceSameKeyDiffValues!116 lt!212908 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!212906 () ListLongMap!7559)

(declare-fun getCurrentListMap!2217 (array!29865 array!29867 (_ BitVec 32) (_ BitVec 32) V!18501 V!18501 (_ BitVec 32) Int) ListLongMap!7559)

(assert (=> b!469668 (= lt!212906 (getCurrentListMap!2217 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212909 () ListLongMap!7559)

(assert (=> b!469668 (= lt!212909 (getCurrentListMap!2217 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!42066 res!280662) b!469661))

(assert (= (and b!469661 res!280664) b!469663))

(assert (= (and b!469663 res!280666) b!469666))

(assert (= (and b!469666 res!280663) b!469665))

(assert (= (and b!469665 (not res!280665)) b!469668))

(assert (= (and b!469664 condMapEmpty!21268) mapIsEmpty!21268))

(assert (= (and b!469664 (not condMapEmpty!21268)) mapNonEmpty!21268))

(get-info :version)

(assert (= (and mapNonEmpty!21268 ((_ is ValueCellFull!6180) mapValue!21268)) b!469667))

(assert (= (and b!469664 ((_ is ValueCellFull!6180) mapDefault!21268)) b!469662))

(assert (= start!42066 b!469664))

(declare-fun m!451881 () Bool)

(assert (=> b!469665 m!451881))

(declare-fun m!451883 () Bool)

(assert (=> b!469665 m!451883))

(declare-fun m!451885 () Bool)

(assert (=> b!469665 m!451885))

(declare-fun m!451887 () Bool)

(assert (=> b!469663 m!451887))

(declare-fun m!451889 () Bool)

(assert (=> b!469666 m!451889))

(declare-fun m!451891 () Bool)

(assert (=> b!469668 m!451891))

(declare-fun m!451893 () Bool)

(assert (=> b!469668 m!451893))

(assert (=> b!469668 m!451891))

(declare-fun m!451895 () Bool)

(assert (=> b!469668 m!451895))

(declare-fun m!451897 () Bool)

(assert (=> b!469668 m!451897))

(declare-fun m!451899 () Bool)

(assert (=> b!469668 m!451899))

(declare-fun m!451901 () Bool)

(assert (=> b!469668 m!451901))

(declare-fun m!451903 () Bool)

(assert (=> mapNonEmpty!21268 m!451903))

(declare-fun m!451905 () Bool)

(assert (=> start!42066 m!451905))

(declare-fun m!451907 () Bool)

(assert (=> start!42066 m!451907))

(declare-fun m!451909 () Bool)

(assert (=> start!42066 m!451909))

(check-sat (not b!469665) (not b!469666) (not b_next!11619) (not b!469668) (not start!42066) tp_is_empty!13047 b_and!20029 (not mapNonEmpty!21268) (not b!469663))
(check-sat b_and!20029 (not b_next!11619))
