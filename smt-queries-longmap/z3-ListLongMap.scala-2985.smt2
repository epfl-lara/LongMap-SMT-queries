; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42202 () Bool)

(assert start!42202)

(declare-fun b_free!11721 () Bool)

(declare-fun b_next!11721 () Bool)

(assert (=> start!42202 (= b_free!11721 (not b_next!11721))))

(declare-fun tp!41187 () Bool)

(declare-fun b_and!20151 () Bool)

(assert (=> start!42202 (= tp!41187 b_and!20151)))

(declare-fun b!471036 () Bool)

(declare-fun res!281422 () Bool)

(declare-fun e!276017 () Bool)

(assert (=> b!471036 (=> (not res!281422) (not e!276017))))

(declare-datatypes ((array!30065 0))(
  ( (array!30066 (arr!14455 (Array (_ BitVec 32) (_ BitVec 64))) (size!14807 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30065)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30065 (_ BitVec 32)) Bool)

(assert (=> b!471036 (= res!281422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!471037 () Bool)

(declare-fun e!276019 () Bool)

(declare-fun tp_is_empty!13149 () Bool)

(assert (=> b!471037 (= e!276019 tp_is_empty!13149)))

(declare-fun mapIsEmpty!21427 () Bool)

(declare-fun mapRes!21427 () Bool)

(assert (=> mapIsEmpty!21427 mapRes!21427))

(declare-fun b!471038 () Bool)

(declare-fun e!276016 () Bool)

(declare-fun e!276020 () Bool)

(assert (=> b!471038 (= e!276016 (and e!276020 mapRes!21427))))

(declare-fun condMapEmpty!21427 () Bool)

(declare-datatypes ((V!18637 0))(
  ( (V!18638 (val!6619 Int)) )
))
(declare-datatypes ((ValueCell!6231 0))(
  ( (ValueCellFull!6231 (v!8910 V!18637)) (EmptyCell!6231) )
))
(declare-datatypes ((array!30067 0))(
  ( (array!30068 (arr!14456 (Array (_ BitVec 32) ValueCell!6231)) (size!14808 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30067)

(declare-fun mapDefault!21427 () ValueCell!6231)

(assert (=> b!471038 (= condMapEmpty!21427 (= (arr!14456 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6231)) mapDefault!21427)))))

(declare-fun b!471039 () Bool)

(declare-fun res!281424 () Bool)

(assert (=> b!471039 (=> (not res!281424) (not e!276017))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!471039 (= res!281424 (and (= (size!14808 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14807 _keys!1025) (size!14808 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!471040 () Bool)

(assert (=> b!471040 (= e!276020 tp_is_empty!13149)))

(declare-fun b!471041 () Bool)

(declare-fun res!281423 () Bool)

(assert (=> b!471041 (=> (not res!281423) (not e!276017))))

(declare-datatypes ((List!8797 0))(
  ( (Nil!8794) (Cons!8793 (h!9649 (_ BitVec 64)) (t!14761 List!8797)) )
))
(declare-fun arrayNoDuplicates!0 (array!30065 (_ BitVec 32) List!8797) Bool)

(assert (=> b!471041 (= res!281423 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8794))))

(declare-fun res!281425 () Bool)

(assert (=> start!42202 (=> (not res!281425) (not e!276017))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42202 (= res!281425 (validMask!0 mask!1365))))

(assert (=> start!42202 e!276017))

(assert (=> start!42202 tp_is_empty!13149))

(assert (=> start!42202 tp!41187))

(assert (=> start!42202 true))

(declare-fun array_inv!10426 (array!30065) Bool)

(assert (=> start!42202 (array_inv!10426 _keys!1025)))

(declare-fun array_inv!10427 (array!30067) Bool)

(assert (=> start!42202 (and (array_inv!10427 _values!833) e!276016)))

(declare-fun mapNonEmpty!21427 () Bool)

(declare-fun tp!41188 () Bool)

(assert (=> mapNonEmpty!21427 (= mapRes!21427 (and tp!41188 e!276019))))

(declare-fun mapRest!21427 () (Array (_ BitVec 32) ValueCell!6231))

(declare-fun mapValue!21427 () ValueCell!6231)

(declare-fun mapKey!21427 () (_ BitVec 32))

(assert (=> mapNonEmpty!21427 (= (arr!14456 _values!833) (store mapRest!21427 mapKey!21427 mapValue!21427))))

(declare-fun b!471042 () Bool)

(assert (=> b!471042 (= e!276017 (not true))))

(declare-datatypes ((tuple2!8718 0))(
  ( (tuple2!8719 (_1!4370 (_ BitVec 64)) (_2!4370 V!18637)) )
))
(declare-datatypes ((List!8798 0))(
  ( (Nil!8795) (Cons!8794 (h!9650 tuple2!8718) (t!14762 List!8798)) )
))
(declare-datatypes ((ListLongMap!7631 0))(
  ( (ListLongMap!7632 (toList!3831 List!8798)) )
))
(declare-fun lt!213715 () ListLongMap!7631)

(declare-fun lt!213714 () ListLongMap!7631)

(assert (=> b!471042 (= lt!213715 lt!213714)))

(declare-fun minValueBefore!38 () V!18637)

(declare-fun zeroValue!794 () V!18637)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13821 0))(
  ( (Unit!13822) )
))
(declare-fun lt!213713 () Unit!13821)

(declare-fun minValueAfter!38 () V!18637)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!174 (array!30065 array!30067 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18637 V!18637 V!18637 V!18637 (_ BitVec 32) Int) Unit!13821)

(assert (=> b!471042 (= lt!213713 (lemmaNoChangeToArrayThenSameMapNoExtras!174 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1994 (array!30065 array!30067 (_ BitVec 32) (_ BitVec 32) V!18637 V!18637 (_ BitVec 32) Int) ListLongMap!7631)

(assert (=> b!471042 (= lt!213714 (getCurrentListMapNoExtraKeys!1994 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471042 (= lt!213715 (getCurrentListMapNoExtraKeys!1994 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!42202 res!281425) b!471039))

(assert (= (and b!471039 res!281424) b!471036))

(assert (= (and b!471036 res!281422) b!471041))

(assert (= (and b!471041 res!281423) b!471042))

(assert (= (and b!471038 condMapEmpty!21427) mapIsEmpty!21427))

(assert (= (and b!471038 (not condMapEmpty!21427)) mapNonEmpty!21427))

(get-info :version)

(assert (= (and mapNonEmpty!21427 ((_ is ValueCellFull!6231) mapValue!21427)) b!471037))

(assert (= (and b!471038 ((_ is ValueCellFull!6231) mapDefault!21427)) b!471040))

(assert (= start!42202 b!471038))

(declare-fun m!453233 () Bool)

(assert (=> mapNonEmpty!21427 m!453233))

(declare-fun m!453235 () Bool)

(assert (=> b!471036 m!453235))

(declare-fun m!453237 () Bool)

(assert (=> b!471041 m!453237))

(declare-fun m!453239 () Bool)

(assert (=> b!471042 m!453239))

(declare-fun m!453241 () Bool)

(assert (=> b!471042 m!453241))

(declare-fun m!453243 () Bool)

(assert (=> b!471042 m!453243))

(declare-fun m!453245 () Bool)

(assert (=> start!42202 m!453245))

(declare-fun m!453247 () Bool)

(assert (=> start!42202 m!453247))

(declare-fun m!453249 () Bool)

(assert (=> start!42202 m!453249))

(check-sat tp_is_empty!13149 (not b!471041) (not mapNonEmpty!21427) (not b!471042) (not start!42202) b_and!20151 (not b!471036) (not b_next!11721))
(check-sat b_and!20151 (not b_next!11721))
