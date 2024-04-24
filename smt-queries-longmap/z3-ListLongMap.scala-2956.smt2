; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41958 () Bool)

(assert start!41958)

(declare-fun b_free!11545 () Bool)

(declare-fun b_next!11545 () Bool)

(assert (=> start!41958 (= b_free!11545 (not b_next!11545))))

(declare-fun tp!40651 () Bool)

(declare-fun b_and!19953 () Bool)

(assert (=> start!41958 (= tp!40651 b_and!19953)))

(declare-fun b!468533 () Bool)

(declare-fun res!280025 () Bool)

(declare-fun e!274232 () Bool)

(assert (=> b!468533 (=> (not res!280025) (not e!274232))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((array!29710 0))(
  ( (array!29711 (arr!14280 (Array (_ BitVec 32) (_ BitVec 64))) (size!14632 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29710)

(declare-datatypes ((V!18403 0))(
  ( (V!18404 (val!6531 Int)) )
))
(declare-datatypes ((ValueCell!6143 0))(
  ( (ValueCellFull!6143 (v!8821 V!18403)) (EmptyCell!6143) )
))
(declare-datatypes ((array!29712 0))(
  ( (array!29713 (arr!14281 (Array (_ BitVec 32) ValueCell!6143)) (size!14633 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29712)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!468533 (= res!280025 (and (= (size!14633 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14632 _keys!1025) (size!14633 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!280027 () Bool)

(assert (=> start!41958 (=> (not res!280027) (not e!274232))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41958 (= res!280027 (validMask!0 mask!1365))))

(assert (=> start!41958 e!274232))

(declare-fun tp_is_empty!12973 () Bool)

(assert (=> start!41958 tp_is_empty!12973))

(assert (=> start!41958 tp!40651))

(assert (=> start!41958 true))

(declare-fun array_inv!10398 (array!29710) Bool)

(assert (=> start!41958 (array_inv!10398 _keys!1025)))

(declare-fun e!274231 () Bool)

(declare-fun array_inv!10399 (array!29712) Bool)

(assert (=> start!41958 (and (array_inv!10399 _values!833) e!274231)))

(declare-fun b!468534 () Bool)

(declare-fun res!280026 () Bool)

(assert (=> b!468534 (=> (not res!280026) (not e!274232))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29710 (_ BitVec 32)) Bool)

(assert (=> b!468534 (= res!280026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!21154 () Bool)

(declare-fun mapRes!21154 () Bool)

(assert (=> mapIsEmpty!21154 mapRes!21154))

(declare-fun b!468535 () Bool)

(declare-fun e!274227 () Bool)

(assert (=> b!468535 (= e!274227 true)))

(declare-datatypes ((tuple2!8504 0))(
  ( (tuple2!8505 (_1!4263 (_ BitVec 64)) (_2!4263 V!18403)) )
))
(declare-datatypes ((List!8582 0))(
  ( (Nil!8579) (Cons!8578 (h!9434 tuple2!8504) (t!14532 List!8582)) )
))
(declare-datatypes ((ListLongMap!7419 0))(
  ( (ListLongMap!7420 (toList!3725 List!8582)) )
))
(declare-fun lt!211993 () ListLongMap!7419)

(declare-fun lt!211992 () tuple2!8504)

(declare-fun minValueBefore!38 () V!18403)

(declare-fun +!1688 (ListLongMap!7419 tuple2!8504) ListLongMap!7419)

(assert (=> b!468535 (= (+!1688 lt!211993 lt!211992) (+!1688 (+!1688 lt!211993 (tuple2!8505 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!211992))))

(declare-fun minValueAfter!38 () V!18403)

(assert (=> b!468535 (= lt!211992 (tuple2!8505 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13659 0))(
  ( (Unit!13660) )
))
(declare-fun lt!211988 () Unit!13659)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!94 (ListLongMap!7419 (_ BitVec 64) V!18403 V!18403) Unit!13659)

(assert (=> b!468535 (= lt!211988 (addSameAsAddTwiceSameKeyDiffValues!94 lt!211993 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!211991 () ListLongMap!7419)

(declare-fun zeroValue!794 () V!18403)

(declare-fun defaultEntry!841 () Int)

(declare-fun getCurrentListMap!2154 (array!29710 array!29712 (_ BitVec 32) (_ BitVec 32) V!18403 V!18403 (_ BitVec 32) Int) ListLongMap!7419)

(assert (=> b!468535 (= lt!211991 (getCurrentListMap!2154 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!211990 () ListLongMap!7419)

(assert (=> b!468535 (= lt!211990 (getCurrentListMap!2154 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468536 () Bool)

(assert (=> b!468536 (= e!274232 (not e!274227))))

(declare-fun res!280024 () Bool)

(assert (=> b!468536 (=> res!280024 e!274227)))

(assert (=> b!468536 (= res!280024 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!211987 () ListLongMap!7419)

(assert (=> b!468536 (= lt!211993 lt!211987)))

(declare-fun lt!211989 () Unit!13659)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!104 (array!29710 array!29712 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18403 V!18403 V!18403 V!18403 (_ BitVec 32) Int) Unit!13659)

(assert (=> b!468536 (= lt!211989 (lemmaNoChangeToArrayThenSameMapNoExtras!104 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1944 (array!29710 array!29712 (_ BitVec 32) (_ BitVec 32) V!18403 V!18403 (_ BitVec 32) Int) ListLongMap!7419)

(assert (=> b!468536 (= lt!211987 (getCurrentListMapNoExtraKeys!1944 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468536 (= lt!211993 (getCurrentListMapNoExtraKeys!1944 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468537 () Bool)

(declare-fun res!280023 () Bool)

(assert (=> b!468537 (=> (not res!280023) (not e!274232))))

(declare-datatypes ((List!8583 0))(
  ( (Nil!8580) (Cons!8579 (h!9435 (_ BitVec 64)) (t!14533 List!8583)) )
))
(declare-fun arrayNoDuplicates!0 (array!29710 (_ BitVec 32) List!8583) Bool)

(assert (=> b!468537 (= res!280023 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8580))))

(declare-fun b!468538 () Bool)

(declare-fun e!274230 () Bool)

(assert (=> b!468538 (= e!274231 (and e!274230 mapRes!21154))))

(declare-fun condMapEmpty!21154 () Bool)

(declare-fun mapDefault!21154 () ValueCell!6143)

(assert (=> b!468538 (= condMapEmpty!21154 (= (arr!14281 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6143)) mapDefault!21154)))))

(declare-fun b!468539 () Bool)

(assert (=> b!468539 (= e!274230 tp_is_empty!12973)))

(declare-fun mapNonEmpty!21154 () Bool)

(declare-fun tp!40650 () Bool)

(declare-fun e!274229 () Bool)

(assert (=> mapNonEmpty!21154 (= mapRes!21154 (and tp!40650 e!274229))))

(declare-fun mapValue!21154 () ValueCell!6143)

(declare-fun mapKey!21154 () (_ BitVec 32))

(declare-fun mapRest!21154 () (Array (_ BitVec 32) ValueCell!6143))

(assert (=> mapNonEmpty!21154 (= (arr!14281 _values!833) (store mapRest!21154 mapKey!21154 mapValue!21154))))

(declare-fun b!468540 () Bool)

(assert (=> b!468540 (= e!274229 tp_is_empty!12973)))

(assert (= (and start!41958 res!280027) b!468533))

(assert (= (and b!468533 res!280025) b!468534))

(assert (= (and b!468534 res!280026) b!468537))

(assert (= (and b!468537 res!280023) b!468536))

(assert (= (and b!468536 (not res!280024)) b!468535))

(assert (= (and b!468538 condMapEmpty!21154) mapIsEmpty!21154))

(assert (= (and b!468538 (not condMapEmpty!21154)) mapNonEmpty!21154))

(get-info :version)

(assert (= (and mapNonEmpty!21154 ((_ is ValueCellFull!6143) mapValue!21154)) b!468540))

(assert (= (and b!468538 ((_ is ValueCellFull!6143) mapDefault!21154)) b!468539))

(assert (= start!41958 b!468538))

(declare-fun m!450753 () Bool)

(assert (=> b!468536 m!450753))

(declare-fun m!450755 () Bool)

(assert (=> b!468536 m!450755))

(declare-fun m!450757 () Bool)

(assert (=> b!468536 m!450757))

(declare-fun m!450759 () Bool)

(assert (=> b!468534 m!450759))

(declare-fun m!450761 () Bool)

(assert (=> b!468535 m!450761))

(declare-fun m!450763 () Bool)

(assert (=> b!468535 m!450763))

(declare-fun m!450765 () Bool)

(assert (=> b!468535 m!450765))

(declare-fun m!450767 () Bool)

(assert (=> b!468535 m!450767))

(assert (=> b!468535 m!450763))

(declare-fun m!450769 () Bool)

(assert (=> b!468535 m!450769))

(declare-fun m!450771 () Bool)

(assert (=> b!468535 m!450771))

(declare-fun m!450773 () Bool)

(assert (=> b!468537 m!450773))

(declare-fun m!450775 () Bool)

(assert (=> mapNonEmpty!21154 m!450775))

(declare-fun m!450777 () Bool)

(assert (=> start!41958 m!450777))

(declare-fun m!450779 () Bool)

(assert (=> start!41958 m!450779))

(declare-fun m!450781 () Bool)

(assert (=> start!41958 m!450781))

(check-sat (not b!468536) (not start!41958) (not b_next!11545) (not b!468535) b_and!19953 tp_is_empty!12973 (not b!468537) (not mapNonEmpty!21154) (not b!468534))
(check-sat b_and!19953 (not b_next!11545))
