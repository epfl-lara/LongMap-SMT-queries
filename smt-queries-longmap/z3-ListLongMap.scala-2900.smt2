; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41528 () Bool)

(assert start!41528)

(declare-fun b_free!11209 () Bool)

(declare-fun b_next!11209 () Bool)

(assert (=> start!41528 (= b_free!11209 (not b_next!11209))))

(declare-fun tp!39624 () Bool)

(declare-fun b_and!19559 () Bool)

(assert (=> start!41528 (= tp!39624 b_and!19559)))

(declare-fun res!277441 () Bool)

(declare-fun e!270978 () Bool)

(assert (=> start!41528 (=> (not res!277441) (not e!270978))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41528 (= res!277441 (validMask!0 mask!1365))))

(assert (=> start!41528 e!270978))

(declare-fun tp_is_empty!12637 () Bool)

(assert (=> start!41528 tp_is_empty!12637))

(assert (=> start!41528 tp!39624))

(assert (=> start!41528 true))

(declare-datatypes ((array!29064 0))(
  ( (array!29065 (arr!13963 (Array (_ BitVec 32) (_ BitVec 64))) (size!14315 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29064)

(declare-fun array_inv!10168 (array!29064) Bool)

(assert (=> start!41528 (array_inv!10168 _keys!1025)))

(declare-datatypes ((V!17955 0))(
  ( (V!17956 (val!6363 Int)) )
))
(declare-datatypes ((ValueCell!5975 0))(
  ( (ValueCellFull!5975 (v!8651 V!17955)) (EmptyCell!5975) )
))
(declare-datatypes ((array!29066 0))(
  ( (array!29067 (arr!13964 (Array (_ BitVec 32) ValueCell!5975)) (size!14316 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29066)

(declare-fun e!270977 () Bool)

(declare-fun array_inv!10169 (array!29066) Bool)

(assert (=> start!41528 (and (array_inv!10169 _values!833) e!270977)))

(declare-fun b!463980 () Bool)

(declare-fun e!270975 () Bool)

(declare-fun mapRes!20632 () Bool)

(assert (=> b!463980 (= e!270977 (and e!270975 mapRes!20632))))

(declare-fun condMapEmpty!20632 () Bool)

(declare-fun mapDefault!20632 () ValueCell!5975)

(assert (=> b!463980 (= condMapEmpty!20632 (= (arr!13964 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5975)) mapDefault!20632)))))

(declare-fun b!463981 () Bool)

(declare-fun res!277439 () Bool)

(assert (=> b!463981 (=> (not res!277439) (not e!270978))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!463981 (= res!277439 (and (= (size!14316 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14315 _keys!1025) (size!14316 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!463982 () Bool)

(declare-fun e!270976 () Bool)

(assert (=> b!463982 (= e!270976 tp_is_empty!12637)))

(declare-fun b!463983 () Bool)

(declare-fun res!277438 () Bool)

(assert (=> b!463983 (=> (not res!277438) (not e!270978))))

(declare-datatypes ((List!8359 0))(
  ( (Nil!8356) (Cons!8355 (h!9211 (_ BitVec 64)) (t!14297 List!8359)) )
))
(declare-fun arrayNoDuplicates!0 (array!29064 (_ BitVec 32) List!8359) Bool)

(assert (=> b!463983 (= res!277438 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8356))))

(declare-fun b!463984 () Bool)

(assert (=> b!463984 (= e!270978 false)))

(declare-fun zeroValue!794 () V!17955)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!17955)

(declare-datatypes ((tuple2!8278 0))(
  ( (tuple2!8279 (_1!4150 (_ BitVec 64)) (_2!4150 V!17955)) )
))
(declare-datatypes ((List!8360 0))(
  ( (Nil!8357) (Cons!8356 (h!9212 tuple2!8278) (t!14298 List!8360)) )
))
(declare-datatypes ((ListLongMap!7193 0))(
  ( (ListLongMap!7194 (toList!3612 List!8360)) )
))
(declare-fun lt!209564 () ListLongMap!7193)

(declare-fun getCurrentListMapNoExtraKeys!1839 (array!29064 array!29066 (_ BitVec 32) (_ BitVec 32) V!17955 V!17955 (_ BitVec 32) Int) ListLongMap!7193)

(assert (=> b!463984 (= lt!209564 (getCurrentListMapNoExtraKeys!1839 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!17955)

(declare-fun lt!209563 () ListLongMap!7193)

(assert (=> b!463984 (= lt!209563 (getCurrentListMapNoExtraKeys!1839 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!463985 () Bool)

(declare-fun res!277440 () Bool)

(assert (=> b!463985 (=> (not res!277440) (not e!270978))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29064 (_ BitVec 32)) Bool)

(assert (=> b!463985 (= res!277440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!20632 () Bool)

(assert (=> mapIsEmpty!20632 mapRes!20632))

(declare-fun mapNonEmpty!20632 () Bool)

(declare-fun tp!39625 () Bool)

(assert (=> mapNonEmpty!20632 (= mapRes!20632 (and tp!39625 e!270976))))

(declare-fun mapValue!20632 () ValueCell!5975)

(declare-fun mapKey!20632 () (_ BitVec 32))

(declare-fun mapRest!20632 () (Array (_ BitVec 32) ValueCell!5975))

(assert (=> mapNonEmpty!20632 (= (arr!13964 _values!833) (store mapRest!20632 mapKey!20632 mapValue!20632))))

(declare-fun b!463986 () Bool)

(assert (=> b!463986 (= e!270975 tp_is_empty!12637)))

(assert (= (and start!41528 res!277441) b!463981))

(assert (= (and b!463981 res!277439) b!463985))

(assert (= (and b!463985 res!277440) b!463983))

(assert (= (and b!463983 res!277438) b!463984))

(assert (= (and b!463980 condMapEmpty!20632) mapIsEmpty!20632))

(assert (= (and b!463980 (not condMapEmpty!20632)) mapNonEmpty!20632))

(get-info :version)

(assert (= (and mapNonEmpty!20632 ((_ is ValueCellFull!5975) mapValue!20632)) b!463982))

(assert (= (and b!463980 ((_ is ValueCellFull!5975) mapDefault!20632)) b!463986))

(assert (= start!41528 b!463980))

(declare-fun m!446671 () Bool)

(assert (=> b!463984 m!446671))

(declare-fun m!446673 () Bool)

(assert (=> b!463984 m!446673))

(declare-fun m!446675 () Bool)

(assert (=> b!463985 m!446675))

(declare-fun m!446677 () Bool)

(assert (=> b!463983 m!446677))

(declare-fun m!446679 () Bool)

(assert (=> mapNonEmpty!20632 m!446679))

(declare-fun m!446681 () Bool)

(assert (=> start!41528 m!446681))

(declare-fun m!446683 () Bool)

(assert (=> start!41528 m!446683))

(declare-fun m!446685 () Bool)

(assert (=> start!41528 m!446685))

(check-sat b_and!19559 (not b!463985) (not b!463983) (not b_next!11209) (not b!463984) (not mapNonEmpty!20632) tp_is_empty!12637 (not start!41528))
(check-sat b_and!19559 (not b_next!11209))
