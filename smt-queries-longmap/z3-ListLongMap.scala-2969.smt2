; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42072 () Bool)

(assert start!42072)

(declare-fun b_free!11625 () Bool)

(declare-fun b_next!11625 () Bool)

(assert (=> start!42072 (= b_free!11625 (not b_next!11625))))

(declare-fun tp!40893 () Bool)

(declare-fun b_and!20035 () Bool)

(assert (=> start!42072 (= tp!40893 b_and!20035)))

(declare-fun b!469733 () Bool)

(declare-fun e!275103 () Bool)

(declare-fun tp_is_empty!13053 () Bool)

(assert (=> b!469733 (= e!275103 tp_is_empty!13053)))

(declare-fun b!469734 () Bool)

(declare-fun res!280707 () Bool)

(declare-fun e!275099 () Bool)

(assert (=> b!469734 (=> (not res!280707) (not e!275099))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29877 0))(
  ( (array!29878 (arr!14363 (Array (_ BitVec 32) (_ BitVec 64))) (size!14715 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29877)

(declare-datatypes ((V!18509 0))(
  ( (V!18510 (val!6571 Int)) )
))
(declare-datatypes ((ValueCell!6183 0))(
  ( (ValueCellFull!6183 (v!8861 V!18509)) (EmptyCell!6183) )
))
(declare-datatypes ((array!29879 0))(
  ( (array!29880 (arr!14364 (Array (_ BitVec 32) ValueCell!6183)) (size!14716 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29879)

(assert (=> b!469734 (= res!280707 (and (= (size!14716 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14715 _keys!1025) (size!14716 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!469735 () Bool)

(declare-fun e!275098 () Bool)

(declare-fun e!275102 () Bool)

(declare-fun mapRes!21277 () Bool)

(assert (=> b!469735 (= e!275098 (and e!275102 mapRes!21277))))

(declare-fun condMapEmpty!21277 () Bool)

(declare-fun mapDefault!21277 () ValueCell!6183)

(assert (=> b!469735 (= condMapEmpty!21277 (= (arr!14364 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6183)) mapDefault!21277)))))

(declare-fun b!469736 () Bool)

(declare-fun e!275100 () Bool)

(assert (=> b!469736 (= e!275100 true)))

(declare-datatypes ((tuple2!8650 0))(
  ( (tuple2!8651 (_1!4336 (_ BitVec 64)) (_2!4336 V!18509)) )
))
(declare-datatypes ((List!8729 0))(
  ( (Nil!8726) (Cons!8725 (h!9581 tuple2!8650) (t!14689 List!8729)) )
))
(declare-datatypes ((ListLongMap!7563 0))(
  ( (ListLongMap!7564 (toList!3797 List!8729)) )
))
(declare-fun lt!212970 () ListLongMap!7563)

(declare-fun lt!212969 () tuple2!8650)

(declare-fun minValueBefore!38 () V!18509)

(declare-fun +!1705 (ListLongMap!7563 tuple2!8650) ListLongMap!7563)

(assert (=> b!469736 (= (+!1705 lt!212970 lt!212969) (+!1705 (+!1705 lt!212970 (tuple2!8651 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212969))))

(declare-fun minValueAfter!38 () V!18509)

(assert (=> b!469736 (= lt!212969 (tuple2!8651 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13751 0))(
  ( (Unit!13752) )
))
(declare-fun lt!212966 () Unit!13751)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!118 (ListLongMap!7563 (_ BitVec 64) V!18509 V!18509) Unit!13751)

(assert (=> b!469736 (= lt!212966 (addSameAsAddTwiceSameKeyDiffValues!118 lt!212970 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun zeroValue!794 () V!18509)

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!212971 () ListLongMap!7563)

(declare-fun getCurrentListMap!2219 (array!29877 array!29879 (_ BitVec 32) (_ BitVec 32) V!18509 V!18509 (_ BitVec 32) Int) ListLongMap!7563)

(assert (=> b!469736 (= lt!212971 (getCurrentListMap!2219 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212972 () ListLongMap!7563)

(assert (=> b!469736 (= lt!212972 (getCurrentListMap!2219 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469737 () Bool)

(assert (=> b!469737 (= e!275099 (not e!275100))))

(declare-fun res!280708 () Bool)

(assert (=> b!469737 (=> res!280708 e!275100)))

(assert (=> b!469737 (= res!280708 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!212968 () ListLongMap!7563)

(assert (=> b!469737 (= lt!212970 lt!212968)))

(declare-fun lt!212967 () Unit!13751)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!143 (array!29877 array!29879 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18509 V!18509 V!18509 V!18509 (_ BitVec 32) Int) Unit!13751)

(assert (=> b!469737 (= lt!212967 (lemmaNoChangeToArrayThenSameMapNoExtras!143 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1963 (array!29877 array!29879 (_ BitVec 32) (_ BitVec 32) V!18509 V!18509 (_ BitVec 32) Int) ListLongMap!7563)

(assert (=> b!469737 (= lt!212968 (getCurrentListMapNoExtraKeys!1963 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!469737 (= lt!212970 (getCurrentListMapNoExtraKeys!1963 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!280711 () Bool)

(assert (=> start!42072 (=> (not res!280711) (not e!275099))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42072 (= res!280711 (validMask!0 mask!1365))))

(assert (=> start!42072 e!275099))

(assert (=> start!42072 tp_is_empty!13053))

(assert (=> start!42072 tp!40893))

(assert (=> start!42072 true))

(declare-fun array_inv!10364 (array!29877) Bool)

(assert (=> start!42072 (array_inv!10364 _keys!1025)))

(declare-fun array_inv!10365 (array!29879) Bool)

(assert (=> start!42072 (and (array_inv!10365 _values!833) e!275098)))

(declare-fun b!469738 () Bool)

(declare-fun res!280709 () Bool)

(assert (=> b!469738 (=> (not res!280709) (not e!275099))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29877 (_ BitVec 32)) Bool)

(assert (=> b!469738 (= res!280709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!21277 () Bool)

(assert (=> mapIsEmpty!21277 mapRes!21277))

(declare-fun mapNonEmpty!21277 () Bool)

(declare-fun tp!40894 () Bool)

(assert (=> mapNonEmpty!21277 (= mapRes!21277 (and tp!40894 e!275103))))

(declare-fun mapValue!21277 () ValueCell!6183)

(declare-fun mapKey!21277 () (_ BitVec 32))

(declare-fun mapRest!21277 () (Array (_ BitVec 32) ValueCell!6183))

(assert (=> mapNonEmpty!21277 (= (arr!14364 _values!833) (store mapRest!21277 mapKey!21277 mapValue!21277))))

(declare-fun b!469739 () Bool)

(assert (=> b!469739 (= e!275102 tp_is_empty!13053)))

(declare-fun b!469740 () Bool)

(declare-fun res!280710 () Bool)

(assert (=> b!469740 (=> (not res!280710) (not e!275099))))

(declare-datatypes ((List!8730 0))(
  ( (Nil!8727) (Cons!8726 (h!9582 (_ BitVec 64)) (t!14690 List!8730)) )
))
(declare-fun arrayNoDuplicates!0 (array!29877 (_ BitVec 32) List!8730) Bool)

(assert (=> b!469740 (= res!280710 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8727))))

(assert (= (and start!42072 res!280711) b!469734))

(assert (= (and b!469734 res!280707) b!469738))

(assert (= (and b!469738 res!280709) b!469740))

(assert (= (and b!469740 res!280710) b!469737))

(assert (= (and b!469737 (not res!280708)) b!469736))

(assert (= (and b!469735 condMapEmpty!21277) mapIsEmpty!21277))

(assert (= (and b!469735 (not condMapEmpty!21277)) mapNonEmpty!21277))

(get-info :version)

(assert (= (and mapNonEmpty!21277 ((_ is ValueCellFull!6183) mapValue!21277)) b!469733))

(assert (= (and b!469735 ((_ is ValueCellFull!6183) mapDefault!21277)) b!469739))

(assert (= start!42072 b!469735))

(declare-fun m!451971 () Bool)

(assert (=> b!469738 m!451971))

(declare-fun m!451973 () Bool)

(assert (=> mapNonEmpty!21277 m!451973))

(declare-fun m!451975 () Bool)

(assert (=> b!469740 m!451975))

(declare-fun m!451977 () Bool)

(assert (=> b!469736 m!451977))

(declare-fun m!451979 () Bool)

(assert (=> b!469736 m!451979))

(declare-fun m!451981 () Bool)

(assert (=> b!469736 m!451981))

(assert (=> b!469736 m!451977))

(declare-fun m!451983 () Bool)

(assert (=> b!469736 m!451983))

(declare-fun m!451985 () Bool)

(assert (=> b!469736 m!451985))

(declare-fun m!451987 () Bool)

(assert (=> b!469736 m!451987))

(declare-fun m!451989 () Bool)

(assert (=> start!42072 m!451989))

(declare-fun m!451991 () Bool)

(assert (=> start!42072 m!451991))

(declare-fun m!451993 () Bool)

(assert (=> start!42072 m!451993))

(declare-fun m!451995 () Bool)

(assert (=> b!469737 m!451995))

(declare-fun m!451997 () Bool)

(assert (=> b!469737 m!451997))

(declare-fun m!451999 () Bool)

(assert (=> b!469737 m!451999))

(check-sat (not b!469736) (not start!42072) b_and!20035 (not b!469738) (not b!469740) tp_is_empty!13053 (not b_next!11625) (not mapNonEmpty!21277) (not b!469737))
(check-sat b_and!20035 (not b_next!11625))
