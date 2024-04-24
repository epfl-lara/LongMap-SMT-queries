; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42204 () Bool)

(assert start!42204)

(declare-fun b_free!11737 () Bool)

(declare-fun b_next!11737 () Bool)

(assert (=> start!42204 (= b_free!11737 (not b_next!11737))))

(declare-fun tp!41236 () Bool)

(declare-fun b_and!20177 () Bool)

(assert (=> start!42204 (= tp!41236 b_and!20177)))

(declare-fun b!471143 () Bool)

(declare-fun res!281511 () Bool)

(declare-fun e!276099 () Bool)

(assert (=> b!471143 (=> (not res!281511) (not e!276099))))

(declare-datatypes ((array!30080 0))(
  ( (array!30081 (arr!14462 (Array (_ BitVec 32) (_ BitVec 64))) (size!14814 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30080)

(declare-datatypes ((List!8719 0))(
  ( (Nil!8716) (Cons!8715 (h!9571 (_ BitVec 64)) (t!14675 List!8719)) )
))
(declare-fun arrayNoDuplicates!0 (array!30080 (_ BitVec 32) List!8719) Bool)

(assert (=> b!471143 (= res!281511 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8716))))

(declare-fun b!471144 () Bool)

(assert (=> b!471144 (= e!276099 (not true))))

(declare-datatypes ((V!18659 0))(
  ( (V!18660 (val!6627 Int)) )
))
(declare-datatypes ((tuple2!8650 0))(
  ( (tuple2!8651 (_1!4336 (_ BitVec 64)) (_2!4336 V!18659)) )
))
(declare-datatypes ((List!8720 0))(
  ( (Nil!8717) (Cons!8716 (h!9572 tuple2!8650) (t!14676 List!8720)) )
))
(declare-datatypes ((ListLongMap!7565 0))(
  ( (ListLongMap!7566 (toList!3798 List!8720)) )
))
(declare-fun lt!213797 () ListLongMap!7565)

(declare-fun lt!213798 () ListLongMap!7565)

(assert (=> b!471144 (= lt!213797 lt!213798)))

(declare-fun minValueBefore!38 () V!18659)

(declare-fun zeroValue!794 () V!18659)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6239 0))(
  ( (ValueCellFull!6239 (v!8919 V!18659)) (EmptyCell!6239) )
))
(declare-datatypes ((array!30082 0))(
  ( (array!30083 (arr!14463 (Array (_ BitVec 32) ValueCell!6239)) (size!14815 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30082)

(declare-datatypes ((Unit!13809 0))(
  ( (Unit!13810) )
))
(declare-fun lt!213799 () Unit!13809)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18659)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!173 (array!30080 array!30082 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18659 V!18659 V!18659 V!18659 (_ BitVec 32) Int) Unit!13809)

(assert (=> b!471144 (= lt!213799 (lemmaNoChangeToArrayThenSameMapNoExtras!173 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2013 (array!30080 array!30082 (_ BitVec 32) (_ BitVec 32) V!18659 V!18659 (_ BitVec 32) Int) ListLongMap!7565)

(assert (=> b!471144 (= lt!213798 (getCurrentListMapNoExtraKeys!2013 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471144 (= lt!213797 (getCurrentListMapNoExtraKeys!2013 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!471145 () Bool)

(declare-fun res!281512 () Bool)

(assert (=> b!471145 (=> (not res!281512) (not e!276099))))

(assert (=> b!471145 (= res!281512 (and (= (size!14815 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14814 _keys!1025) (size!14815 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!471146 () Bool)

(declare-fun e!276097 () Bool)

(declare-fun tp_is_empty!13165 () Bool)

(assert (=> b!471146 (= e!276097 tp_is_empty!13165)))

(declare-fun b!471147 () Bool)

(declare-fun e!276101 () Bool)

(declare-fun mapRes!21451 () Bool)

(assert (=> b!471147 (= e!276101 (and e!276097 mapRes!21451))))

(declare-fun condMapEmpty!21451 () Bool)

(declare-fun mapDefault!21451 () ValueCell!6239)

(assert (=> b!471147 (= condMapEmpty!21451 (= (arr!14463 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6239)) mapDefault!21451)))))

(declare-fun b!471148 () Bool)

(declare-fun e!276098 () Bool)

(assert (=> b!471148 (= e!276098 tp_is_empty!13165)))

(declare-fun b!471149 () Bool)

(declare-fun res!281514 () Bool)

(assert (=> b!471149 (=> (not res!281514) (not e!276099))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30080 (_ BitVec 32)) Bool)

(assert (=> b!471149 (= res!281514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!281513 () Bool)

(assert (=> start!42204 (=> (not res!281513) (not e!276099))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42204 (= res!281513 (validMask!0 mask!1365))))

(assert (=> start!42204 e!276099))

(assert (=> start!42204 tp_is_empty!13165))

(assert (=> start!42204 tp!41236))

(assert (=> start!42204 true))

(declare-fun array_inv!10524 (array!30080) Bool)

(assert (=> start!42204 (array_inv!10524 _keys!1025)))

(declare-fun array_inv!10525 (array!30082) Bool)

(assert (=> start!42204 (and (array_inv!10525 _values!833) e!276101)))

(declare-fun mapIsEmpty!21451 () Bool)

(assert (=> mapIsEmpty!21451 mapRes!21451))

(declare-fun mapNonEmpty!21451 () Bool)

(declare-fun tp!41235 () Bool)

(assert (=> mapNonEmpty!21451 (= mapRes!21451 (and tp!41235 e!276098))))

(declare-fun mapValue!21451 () ValueCell!6239)

(declare-fun mapRest!21451 () (Array (_ BitVec 32) ValueCell!6239))

(declare-fun mapKey!21451 () (_ BitVec 32))

(assert (=> mapNonEmpty!21451 (= (arr!14463 _values!833) (store mapRest!21451 mapKey!21451 mapValue!21451))))

(assert (= (and start!42204 res!281513) b!471145))

(assert (= (and b!471145 res!281512) b!471149))

(assert (= (and b!471149 res!281514) b!471143))

(assert (= (and b!471143 res!281511) b!471144))

(assert (= (and b!471147 condMapEmpty!21451) mapIsEmpty!21451))

(assert (= (and b!471147 (not condMapEmpty!21451)) mapNonEmpty!21451))

(get-info :version)

(assert (= (and mapNonEmpty!21451 ((_ is ValueCellFull!6239) mapValue!21451)) b!471148))

(assert (= (and b!471147 ((_ is ValueCellFull!6239) mapDefault!21451)) b!471146))

(assert (= start!42204 b!471147))

(declare-fun m!453559 () Bool)

(assert (=> b!471144 m!453559))

(declare-fun m!453561 () Bool)

(assert (=> b!471144 m!453561))

(declare-fun m!453563 () Bool)

(assert (=> b!471144 m!453563))

(declare-fun m!453565 () Bool)

(assert (=> start!42204 m!453565))

(declare-fun m!453567 () Bool)

(assert (=> start!42204 m!453567))

(declare-fun m!453569 () Bool)

(assert (=> start!42204 m!453569))

(declare-fun m!453571 () Bool)

(assert (=> b!471143 m!453571))

(declare-fun m!453573 () Bool)

(assert (=> mapNonEmpty!21451 m!453573))

(declare-fun m!453575 () Bool)

(assert (=> b!471149 m!453575))

(check-sat (not mapNonEmpty!21451) (not start!42204) tp_is_empty!13165 b_and!20177 (not b_next!11737) (not b!471149) (not b!471143) (not b!471144))
(check-sat b_and!20177 (not b_next!11737))
