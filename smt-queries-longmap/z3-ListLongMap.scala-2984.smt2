; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42180 () Bool)

(assert start!42180)

(declare-fun b_free!11713 () Bool)

(declare-fun b_next!11713 () Bool)

(assert (=> start!42180 (= b_free!11713 (not b_next!11713))))

(declare-fun tp!41163 () Bool)

(declare-fun b_and!20117 () Bool)

(assert (=> start!42180 (= tp!41163 b_and!20117)))

(declare-fun mapIsEmpty!21415 () Bool)

(declare-fun mapRes!21415 () Bool)

(assert (=> mapIsEmpty!21415 mapRes!21415))

(declare-fun b!470681 () Bool)

(declare-fun res!281246 () Bool)

(declare-fun e!275782 () Bool)

(assert (=> b!470681 (=> (not res!281246) (not e!275782))))

(declare-datatypes ((array!30031 0))(
  ( (array!30032 (arr!14438 (Array (_ BitVec 32) (_ BitVec 64))) (size!14791 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30031)

(declare-datatypes ((List!8815 0))(
  ( (Nil!8812) (Cons!8811 (h!9667 (_ BitVec 64)) (t!14770 List!8815)) )
))
(declare-fun arrayNoDuplicates!0 (array!30031 (_ BitVec 32) List!8815) Bool)

(assert (=> b!470681 (= res!281246 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8812))))

(declare-fun b!470682 () Bool)

(declare-fun e!275786 () Bool)

(declare-fun e!275785 () Bool)

(assert (=> b!470682 (= e!275786 (and e!275785 mapRes!21415))))

(declare-fun condMapEmpty!21415 () Bool)

(declare-datatypes ((V!18627 0))(
  ( (V!18628 (val!6615 Int)) )
))
(declare-datatypes ((ValueCell!6227 0))(
  ( (ValueCellFull!6227 (v!8900 V!18627)) (EmptyCell!6227) )
))
(declare-datatypes ((array!30033 0))(
  ( (array!30034 (arr!14439 (Array (_ BitVec 32) ValueCell!6227)) (size!14792 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30033)

(declare-fun mapDefault!21415 () ValueCell!6227)

(assert (=> b!470682 (= condMapEmpty!21415 (= (arr!14439 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6227)) mapDefault!21415)))))

(declare-fun b!470683 () Bool)

(declare-fun e!275783 () Bool)

(declare-fun tp_is_empty!13141 () Bool)

(assert (=> b!470683 (= e!275783 tp_is_empty!13141)))

(declare-fun res!281248 () Bool)

(assert (=> start!42180 (=> (not res!281248) (not e!275782))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42180 (= res!281248 (validMask!0 mask!1365))))

(assert (=> start!42180 e!275782))

(assert (=> start!42180 tp_is_empty!13141))

(assert (=> start!42180 tp!41163))

(assert (=> start!42180 true))

(declare-fun array_inv!10500 (array!30031) Bool)

(assert (=> start!42180 (array_inv!10500 _keys!1025)))

(declare-fun array_inv!10501 (array!30033) Bool)

(assert (=> start!42180 (and (array_inv!10501 _values!833) e!275786)))

(declare-fun b!470684 () Bool)

(declare-fun res!281245 () Bool)

(assert (=> b!470684 (=> (not res!281245) (not e!275782))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!470684 (= res!281245 (and (= (size!14792 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14791 _keys!1025) (size!14792 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!470685 () Bool)

(assert (=> b!470685 (= e!275782 (not true))))

(declare-datatypes ((tuple2!8744 0))(
  ( (tuple2!8745 (_1!4383 (_ BitVec 64)) (_2!4383 V!18627)) )
))
(declare-datatypes ((List!8816 0))(
  ( (Nil!8813) (Cons!8812 (h!9668 tuple2!8744) (t!14771 List!8816)) )
))
(declare-datatypes ((ListLongMap!7647 0))(
  ( (ListLongMap!7648 (toList!3839 List!8816)) )
))
(declare-fun lt!213445 () ListLongMap!7647)

(declare-fun lt!213443 () ListLongMap!7647)

(assert (=> b!470685 (= lt!213445 lt!213443)))

(declare-fun minValueBefore!38 () V!18627)

(declare-fun zeroValue!794 () V!18627)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13779 0))(
  ( (Unit!13780) )
))
(declare-fun lt!213444 () Unit!13779)

(declare-fun minValueAfter!38 () V!18627)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!171 (array!30031 array!30033 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18627 V!18627 V!18627 V!18627 (_ BitVec 32) Int) Unit!13779)

(assert (=> b!470685 (= lt!213444 (lemmaNoChangeToArrayThenSameMapNoExtras!171 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2014 (array!30031 array!30033 (_ BitVec 32) (_ BitVec 32) V!18627 V!18627 (_ BitVec 32) Int) ListLongMap!7647)

(assert (=> b!470685 (= lt!213443 (getCurrentListMapNoExtraKeys!2014 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470685 (= lt!213445 (getCurrentListMapNoExtraKeys!2014 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21415 () Bool)

(declare-fun tp!41164 () Bool)

(assert (=> mapNonEmpty!21415 (= mapRes!21415 (and tp!41164 e!275783))))

(declare-fun mapKey!21415 () (_ BitVec 32))

(declare-fun mapValue!21415 () ValueCell!6227)

(declare-fun mapRest!21415 () (Array (_ BitVec 32) ValueCell!6227))

(assert (=> mapNonEmpty!21415 (= (arr!14439 _values!833) (store mapRest!21415 mapKey!21415 mapValue!21415))))

(declare-fun b!470686 () Bool)

(assert (=> b!470686 (= e!275785 tp_is_empty!13141)))

(declare-fun b!470687 () Bool)

(declare-fun res!281247 () Bool)

(assert (=> b!470687 (=> (not res!281247) (not e!275782))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30031 (_ BitVec 32)) Bool)

(assert (=> b!470687 (= res!281247 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(assert (= (and start!42180 res!281248) b!470684))

(assert (= (and b!470684 res!281245) b!470687))

(assert (= (and b!470687 res!281247) b!470681))

(assert (= (and b!470681 res!281246) b!470685))

(assert (= (and b!470682 condMapEmpty!21415) mapIsEmpty!21415))

(assert (= (and b!470682 (not condMapEmpty!21415)) mapNonEmpty!21415))

(get-info :version)

(assert (= (and mapNonEmpty!21415 ((_ is ValueCellFull!6227) mapValue!21415)) b!470683))

(assert (= (and b!470682 ((_ is ValueCellFull!6227) mapDefault!21415)) b!470686))

(assert (= start!42180 b!470682))

(declare-fun m!452427 () Bool)

(assert (=> b!470687 m!452427))

(declare-fun m!452429 () Bool)

(assert (=> mapNonEmpty!21415 m!452429))

(declare-fun m!452431 () Bool)

(assert (=> b!470685 m!452431))

(declare-fun m!452433 () Bool)

(assert (=> b!470685 m!452433))

(declare-fun m!452435 () Bool)

(assert (=> b!470685 m!452435))

(declare-fun m!452437 () Bool)

(assert (=> b!470681 m!452437))

(declare-fun m!452439 () Bool)

(assert (=> start!42180 m!452439))

(declare-fun m!452441 () Bool)

(assert (=> start!42180 m!452441))

(declare-fun m!452443 () Bool)

(assert (=> start!42180 m!452443))

(check-sat (not start!42180) (not b!470681) b_and!20117 tp_is_empty!13141 (not b!470685) (not mapNonEmpty!21415) (not b_next!11713) (not b!470687))
(check-sat b_and!20117 (not b_next!11713))
