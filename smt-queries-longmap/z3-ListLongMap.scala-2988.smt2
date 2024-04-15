; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42204 () Bool)

(assert start!42204)

(declare-fun b_free!11737 () Bool)

(declare-fun b_next!11737 () Bool)

(assert (=> start!42204 (= b_free!11737 (not b_next!11737))))

(declare-fun tp!41235 () Bool)

(declare-fun b_and!20141 () Bool)

(assert (=> start!42204 (= tp!41235 b_and!20141)))

(declare-fun b!470933 () Bool)

(declare-fun res!281389 () Bool)

(declare-fun e!275963 () Bool)

(assert (=> b!470933 (=> (not res!281389) (not e!275963))))

(declare-datatypes ((array!30077 0))(
  ( (array!30078 (arr!14461 (Array (_ BitVec 32) (_ BitVec 64))) (size!14814 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30077)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30077 (_ BitVec 32)) Bool)

(assert (=> b!470933 (= res!281389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!470934 () Bool)

(declare-fun e!275965 () Bool)

(declare-fun tp_is_empty!13165 () Bool)

(assert (=> b!470934 (= e!275965 tp_is_empty!13165)))

(declare-fun b!470935 () Bool)

(declare-fun e!275962 () Bool)

(declare-fun e!275966 () Bool)

(declare-fun mapRes!21451 () Bool)

(assert (=> b!470935 (= e!275962 (and e!275966 mapRes!21451))))

(declare-fun condMapEmpty!21451 () Bool)

(declare-datatypes ((V!18659 0))(
  ( (V!18660 (val!6627 Int)) )
))
(declare-datatypes ((ValueCell!6239 0))(
  ( (ValueCellFull!6239 (v!8912 V!18659)) (EmptyCell!6239) )
))
(declare-datatypes ((array!30079 0))(
  ( (array!30080 (arr!14462 (Array (_ BitVec 32) ValueCell!6239)) (size!14815 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30079)

(declare-fun mapDefault!21451 () ValueCell!6239)

(assert (=> b!470935 (= condMapEmpty!21451 (= (arr!14462 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6239)) mapDefault!21451)))))

(declare-fun mapIsEmpty!21451 () Bool)

(assert (=> mapIsEmpty!21451 mapRes!21451))

(declare-fun res!281392 () Bool)

(assert (=> start!42204 (=> (not res!281392) (not e!275963))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42204 (= res!281392 (validMask!0 mask!1365))))

(assert (=> start!42204 e!275963))

(assert (=> start!42204 tp_is_empty!13165))

(assert (=> start!42204 tp!41235))

(assert (=> start!42204 true))

(declare-fun array_inv!10516 (array!30077) Bool)

(assert (=> start!42204 (array_inv!10516 _keys!1025)))

(declare-fun array_inv!10517 (array!30079) Bool)

(assert (=> start!42204 (and (array_inv!10517 _values!833) e!275962)))

(declare-fun b!470936 () Bool)

(assert (=> b!470936 (= e!275966 tp_is_empty!13165)))

(declare-fun mapNonEmpty!21451 () Bool)

(declare-fun tp!41236 () Bool)

(assert (=> mapNonEmpty!21451 (= mapRes!21451 (and tp!41236 e!275965))))

(declare-fun mapRest!21451 () (Array (_ BitVec 32) ValueCell!6239))

(declare-fun mapKey!21451 () (_ BitVec 32))

(declare-fun mapValue!21451 () ValueCell!6239)

(assert (=> mapNonEmpty!21451 (= (arr!14462 _values!833) (store mapRest!21451 mapKey!21451 mapValue!21451))))

(declare-fun b!470937 () Bool)

(assert (=> b!470937 (= e!275963 (not true))))

(declare-datatypes ((tuple2!8760 0))(
  ( (tuple2!8761 (_1!4391 (_ BitVec 64)) (_2!4391 V!18659)) )
))
(declare-datatypes ((List!8833 0))(
  ( (Nil!8830) (Cons!8829 (h!9685 tuple2!8760) (t!14788 List!8833)) )
))
(declare-datatypes ((ListLongMap!7663 0))(
  ( (ListLongMap!7664 (toList!3847 List!8833)) )
))
(declare-fun lt!213553 () ListLongMap!7663)

(declare-fun lt!213552 () ListLongMap!7663)

(assert (=> b!470937 (= lt!213553 lt!213552)))

(declare-fun minValueBefore!38 () V!18659)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13795 0))(
  ( (Unit!13796) )
))
(declare-fun lt!213551 () Unit!13795)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun zeroValue!794 () V!18659)

(declare-fun minValueAfter!38 () V!18659)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!179 (array!30077 array!30079 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18659 V!18659 V!18659 V!18659 (_ BitVec 32) Int) Unit!13795)

(assert (=> b!470937 (= lt!213551 (lemmaNoChangeToArrayThenSameMapNoExtras!179 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2022 (array!30077 array!30079 (_ BitVec 32) (_ BitVec 32) V!18659 V!18659 (_ BitVec 32) Int) ListLongMap!7663)

(assert (=> b!470937 (= lt!213552 (getCurrentListMapNoExtraKeys!2022 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470937 (= lt!213553 (getCurrentListMapNoExtraKeys!2022 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!470938 () Bool)

(declare-fun res!281390 () Bool)

(assert (=> b!470938 (=> (not res!281390) (not e!275963))))

(declare-datatypes ((List!8834 0))(
  ( (Nil!8831) (Cons!8830 (h!9686 (_ BitVec 64)) (t!14789 List!8834)) )
))
(declare-fun arrayNoDuplicates!0 (array!30077 (_ BitVec 32) List!8834) Bool)

(assert (=> b!470938 (= res!281390 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8831))))

(declare-fun b!470939 () Bool)

(declare-fun res!281391 () Bool)

(assert (=> b!470939 (=> (not res!281391) (not e!275963))))

(assert (=> b!470939 (= res!281391 (and (= (size!14815 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14814 _keys!1025) (size!14815 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!42204 res!281392) b!470939))

(assert (= (and b!470939 res!281391) b!470933))

(assert (= (and b!470933 res!281389) b!470938))

(assert (= (and b!470938 res!281390) b!470937))

(assert (= (and b!470935 condMapEmpty!21451) mapIsEmpty!21451))

(assert (= (and b!470935 (not condMapEmpty!21451)) mapNonEmpty!21451))

(get-info :version)

(assert (= (and mapNonEmpty!21451 ((_ is ValueCellFull!6239) mapValue!21451)) b!470934))

(assert (= (and b!470935 ((_ is ValueCellFull!6239) mapDefault!21451)) b!470936))

(assert (= start!42204 b!470935))

(declare-fun m!452643 () Bool)

(assert (=> mapNonEmpty!21451 m!452643))

(declare-fun m!452645 () Bool)

(assert (=> start!42204 m!452645))

(declare-fun m!452647 () Bool)

(assert (=> start!42204 m!452647))

(declare-fun m!452649 () Bool)

(assert (=> start!42204 m!452649))

(declare-fun m!452651 () Bool)

(assert (=> b!470933 m!452651))

(declare-fun m!452653 () Bool)

(assert (=> b!470937 m!452653))

(declare-fun m!452655 () Bool)

(assert (=> b!470937 m!452655))

(declare-fun m!452657 () Bool)

(assert (=> b!470937 m!452657))

(declare-fun m!452659 () Bool)

(assert (=> b!470938 m!452659))

(check-sat tp_is_empty!13165 (not mapNonEmpty!21451) (not b!470937) (not b!470938) (not start!42204) b_and!20141 (not b_next!11737) (not b!470933))
(check-sat b_and!20141 (not b_next!11737))
