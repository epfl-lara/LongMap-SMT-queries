; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42186 () Bool)

(assert start!42186)

(declare-fun b_free!11719 () Bool)

(declare-fun b_next!11719 () Bool)

(assert (=> start!42186 (= b_free!11719 (not b_next!11719))))

(declare-fun tp!41182 () Bool)

(declare-fun b_and!20159 () Bool)

(assert (=> start!42186 (= tp!41182 b_and!20159)))

(declare-fun mapIsEmpty!21424 () Bool)

(declare-fun mapRes!21424 () Bool)

(assert (=> mapIsEmpty!21424 mapRes!21424))

(declare-fun b!470954 () Bool)

(declare-fun e!275966 () Bool)

(assert (=> b!470954 (= e!275966 (not true))))

(declare-datatypes ((V!18635 0))(
  ( (V!18636 (val!6618 Int)) )
))
(declare-datatypes ((tuple2!8634 0))(
  ( (tuple2!8635 (_1!4328 (_ BitVec 64)) (_2!4328 V!18635)) )
))
(declare-datatypes ((List!8705 0))(
  ( (Nil!8702) (Cons!8701 (h!9557 tuple2!8634) (t!14661 List!8705)) )
))
(declare-datatypes ((ListLongMap!7549 0))(
  ( (ListLongMap!7550 (toList!3790 List!8705)) )
))
(declare-fun lt!213717 () ListLongMap!7549)

(declare-fun lt!213716 () ListLongMap!7549)

(assert (=> b!470954 (= lt!213717 lt!213716)))

(declare-datatypes ((Unit!13793 0))(
  ( (Unit!13794) )
))
(declare-fun lt!213718 () Unit!13793)

(declare-fun minValueBefore!38 () V!18635)

(declare-fun zeroValue!794 () V!18635)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30046 0))(
  ( (array!30047 (arr!14445 (Array (_ BitVec 32) (_ BitVec 64))) (size!14797 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30046)

(declare-datatypes ((ValueCell!6230 0))(
  ( (ValueCellFull!6230 (v!8910 V!18635)) (EmptyCell!6230) )
))
(declare-datatypes ((array!30048 0))(
  ( (array!30049 (arr!14446 (Array (_ BitVec 32) ValueCell!6230)) (size!14798 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30048)

(declare-fun minValueAfter!38 () V!18635)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!165 (array!30046 array!30048 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18635 V!18635 V!18635 V!18635 (_ BitVec 32) Int) Unit!13793)

(assert (=> b!470954 (= lt!213718 (lemmaNoChangeToArrayThenSameMapNoExtras!165 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2005 (array!30046 array!30048 (_ BitVec 32) (_ BitVec 32) V!18635 V!18635 (_ BitVec 32) Int) ListLongMap!7549)

(assert (=> b!470954 (= lt!213716 (getCurrentListMapNoExtraKeys!2005 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470954 (= lt!213717 (getCurrentListMapNoExtraKeys!2005 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!470955 () Bool)

(declare-fun res!281406 () Bool)

(assert (=> b!470955 (=> (not res!281406) (not e!275966))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30046 (_ BitVec 32)) Bool)

(assert (=> b!470955 (= res!281406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!470956 () Bool)

(declare-fun e!275962 () Bool)

(declare-fun tp_is_empty!13147 () Bool)

(assert (=> b!470956 (= e!275962 tp_is_empty!13147)))

(declare-fun mapNonEmpty!21424 () Bool)

(declare-fun tp!41181 () Bool)

(declare-fun e!275964 () Bool)

(assert (=> mapNonEmpty!21424 (= mapRes!21424 (and tp!41181 e!275964))))

(declare-fun mapValue!21424 () ValueCell!6230)

(declare-fun mapKey!21424 () (_ BitVec 32))

(declare-fun mapRest!21424 () (Array (_ BitVec 32) ValueCell!6230))

(assert (=> mapNonEmpty!21424 (= (arr!14446 _values!833) (store mapRest!21424 mapKey!21424 mapValue!21424))))

(declare-fun res!281403 () Bool)

(assert (=> start!42186 (=> (not res!281403) (not e!275966))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42186 (= res!281403 (validMask!0 mask!1365))))

(assert (=> start!42186 e!275966))

(assert (=> start!42186 tp_is_empty!13147))

(assert (=> start!42186 tp!41182))

(assert (=> start!42186 true))

(declare-fun array_inv!10510 (array!30046) Bool)

(assert (=> start!42186 (array_inv!10510 _keys!1025)))

(declare-fun e!275963 () Bool)

(declare-fun array_inv!10511 (array!30048) Bool)

(assert (=> start!42186 (and (array_inv!10511 _values!833) e!275963)))

(declare-fun b!470957 () Bool)

(assert (=> b!470957 (= e!275963 (and e!275962 mapRes!21424))))

(declare-fun condMapEmpty!21424 () Bool)

(declare-fun mapDefault!21424 () ValueCell!6230)

(assert (=> b!470957 (= condMapEmpty!21424 (= (arr!14446 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6230)) mapDefault!21424)))))

(declare-fun b!470958 () Bool)

(declare-fun res!281404 () Bool)

(assert (=> b!470958 (=> (not res!281404) (not e!275966))))

(declare-datatypes ((List!8706 0))(
  ( (Nil!8703) (Cons!8702 (h!9558 (_ BitVec 64)) (t!14662 List!8706)) )
))
(declare-fun arrayNoDuplicates!0 (array!30046 (_ BitVec 32) List!8706) Bool)

(assert (=> b!470958 (= res!281404 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8703))))

(declare-fun b!470959 () Bool)

(declare-fun res!281405 () Bool)

(assert (=> b!470959 (=> (not res!281405) (not e!275966))))

(assert (=> b!470959 (= res!281405 (and (= (size!14798 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14797 _keys!1025) (size!14798 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!470960 () Bool)

(assert (=> b!470960 (= e!275964 tp_is_empty!13147)))

(assert (= (and start!42186 res!281403) b!470959))

(assert (= (and b!470959 res!281405) b!470955))

(assert (= (and b!470955 res!281406) b!470958))

(assert (= (and b!470958 res!281404) b!470954))

(assert (= (and b!470957 condMapEmpty!21424) mapIsEmpty!21424))

(assert (= (and b!470957 (not condMapEmpty!21424)) mapNonEmpty!21424))

(get-info :version)

(assert (= (and mapNonEmpty!21424 ((_ is ValueCellFull!6230) mapValue!21424)) b!470960))

(assert (= (and b!470957 ((_ is ValueCellFull!6230) mapDefault!21424)) b!470956))

(assert (= start!42186 b!470957))

(declare-fun m!453397 () Bool)

(assert (=> b!470954 m!453397))

(declare-fun m!453399 () Bool)

(assert (=> b!470954 m!453399))

(declare-fun m!453401 () Bool)

(assert (=> b!470954 m!453401))

(declare-fun m!453403 () Bool)

(assert (=> mapNonEmpty!21424 m!453403))

(declare-fun m!453405 () Bool)

(assert (=> b!470958 m!453405))

(declare-fun m!453407 () Bool)

(assert (=> start!42186 m!453407))

(declare-fun m!453409 () Bool)

(assert (=> start!42186 m!453409))

(declare-fun m!453411 () Bool)

(assert (=> start!42186 m!453411))

(declare-fun m!453413 () Bool)

(assert (=> b!470955 m!453413))

(check-sat (not b_next!11719) (not b!470958) (not b!470955) b_and!20159 tp_is_empty!13147 (not start!42186) (not mapNonEmpty!21424) (not b!470954))
(check-sat b_and!20159 (not b_next!11719))
