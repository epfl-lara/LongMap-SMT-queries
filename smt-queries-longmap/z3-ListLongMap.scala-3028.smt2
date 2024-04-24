; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42528 () Bool)

(assert start!42528)

(declare-fun b_free!11977 () Bool)

(declare-fun b_next!11977 () Bool)

(assert (=> start!42528 (= b_free!11977 (not b_next!11977))))

(declare-fun tp!41971 () Bool)

(declare-fun b_and!20467 () Bool)

(assert (=> start!42528 (= tp!41971 b_and!20467)))

(declare-fun b!474586 () Bool)

(declare-fun e!278572 () Bool)

(declare-fun tp_is_empty!13405 () Bool)

(assert (=> b!474586 (= e!278572 tp_is_empty!13405)))

(declare-fun b!474587 () Bool)

(declare-fun res!283475 () Bool)

(declare-fun e!278570 () Bool)

(assert (=> b!474587 (=> (not res!283475) (not e!278570))))

(declare-datatypes ((array!30538 0))(
  ( (array!30539 (arr!14686 (Array (_ BitVec 32) (_ BitVec 64))) (size!15038 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30538)

(declare-datatypes ((List!8880 0))(
  ( (Nil!8877) (Cons!8876 (h!9732 (_ BitVec 64)) (t!14846 List!8880)) )
))
(declare-fun arrayNoDuplicates!0 (array!30538 (_ BitVec 32) List!8880) Bool)

(assert (=> b!474587 (= res!283475 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8877))))

(declare-fun res!283473 () Bool)

(assert (=> start!42528 (=> (not res!283473) (not e!278570))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42528 (= res!283473 (validMask!0 mask!1365))))

(assert (=> start!42528 e!278570))

(assert (=> start!42528 tp_is_empty!13405))

(assert (=> start!42528 tp!41971))

(assert (=> start!42528 true))

(declare-fun array_inv!10676 (array!30538) Bool)

(assert (=> start!42528 (array_inv!10676 _keys!1025)))

(declare-datatypes ((V!18979 0))(
  ( (V!18980 (val!6747 Int)) )
))
(declare-datatypes ((ValueCell!6359 0))(
  ( (ValueCellFull!6359 (v!9041 V!18979)) (EmptyCell!6359) )
))
(declare-datatypes ((array!30540 0))(
  ( (array!30541 (arr!14687 (Array (_ BitVec 32) ValueCell!6359)) (size!15039 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30540)

(declare-fun e!278574 () Bool)

(declare-fun array_inv!10677 (array!30540) Bool)

(assert (=> start!42528 (and (array_inv!10677 _values!833) e!278574)))

(declare-fun b!474588 () Bool)

(declare-fun e!278571 () Bool)

(assert (=> b!474588 (= e!278571 tp_is_empty!13405)))

(declare-fun mapNonEmpty!21826 () Bool)

(declare-fun mapRes!21826 () Bool)

(declare-fun tp!41970 () Bool)

(assert (=> mapNonEmpty!21826 (= mapRes!21826 (and tp!41970 e!278571))))

(declare-fun mapRest!21826 () (Array (_ BitVec 32) ValueCell!6359))

(declare-fun mapKey!21826 () (_ BitVec 32))

(declare-fun mapValue!21826 () ValueCell!6359)

(assert (=> mapNonEmpty!21826 (= (arr!14687 _values!833) (store mapRest!21826 mapKey!21826 mapValue!21826))))

(declare-fun b!474589 () Bool)

(declare-fun res!283474 () Bool)

(assert (=> b!474589 (=> (not res!283474) (not e!278570))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!474589 (= res!283474 (and (= (size!15039 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15038 _keys!1025) (size!15039 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!474590 () Bool)

(assert (=> b!474590 (= e!278570 false)))

(declare-datatypes ((tuple2!8820 0))(
  ( (tuple2!8821 (_1!4421 (_ BitVec 64)) (_2!4421 V!18979)) )
))
(declare-datatypes ((List!8881 0))(
  ( (Nil!8878) (Cons!8877 (h!9733 tuple2!8820) (t!14847 List!8881)) )
))
(declare-datatypes ((ListLongMap!7735 0))(
  ( (ListLongMap!7736 (toList!3883 List!8881)) )
))
(declare-fun lt!216262 () ListLongMap!7735)

(declare-fun zeroValue!794 () V!18979)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18979)

(declare-fun getCurrentListMapNoExtraKeys!2090 (array!30538 array!30540 (_ BitVec 32) (_ BitVec 32) V!18979 V!18979 (_ BitVec 32) Int) ListLongMap!7735)

(assert (=> b!474590 (= lt!216262 (getCurrentListMapNoExtraKeys!2090 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!18979)

(declare-fun lt!216263 () ListLongMap!7735)

(assert (=> b!474590 (= lt!216263 (getCurrentListMapNoExtraKeys!2090 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474591 () Bool)

(assert (=> b!474591 (= e!278574 (and e!278572 mapRes!21826))))

(declare-fun condMapEmpty!21826 () Bool)

(declare-fun mapDefault!21826 () ValueCell!6359)

(assert (=> b!474591 (= condMapEmpty!21826 (= (arr!14687 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6359)) mapDefault!21826)))))

(declare-fun mapIsEmpty!21826 () Bool)

(assert (=> mapIsEmpty!21826 mapRes!21826))

(declare-fun b!474592 () Bool)

(declare-fun res!283472 () Bool)

(assert (=> b!474592 (=> (not res!283472) (not e!278570))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30538 (_ BitVec 32)) Bool)

(assert (=> b!474592 (= res!283472 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(assert (= (and start!42528 res!283473) b!474589))

(assert (= (and b!474589 res!283474) b!474592))

(assert (= (and b!474592 res!283472) b!474587))

(assert (= (and b!474587 res!283475) b!474590))

(assert (= (and b!474591 condMapEmpty!21826) mapIsEmpty!21826))

(assert (= (and b!474591 (not condMapEmpty!21826)) mapNonEmpty!21826))

(get-info :version)

(assert (= (and mapNonEmpty!21826 ((_ is ValueCellFull!6359) mapValue!21826)) b!474588))

(assert (= (and b!474591 ((_ is ValueCellFull!6359) mapDefault!21826)) b!474586))

(assert (= start!42528 b!474591))

(declare-fun m!457197 () Bool)

(assert (=> b!474587 m!457197))

(declare-fun m!457199 () Bool)

(assert (=> start!42528 m!457199))

(declare-fun m!457201 () Bool)

(assert (=> start!42528 m!457201))

(declare-fun m!457203 () Bool)

(assert (=> start!42528 m!457203))

(declare-fun m!457205 () Bool)

(assert (=> mapNonEmpty!21826 m!457205))

(declare-fun m!457207 () Bool)

(assert (=> b!474590 m!457207))

(declare-fun m!457209 () Bool)

(assert (=> b!474590 m!457209))

(declare-fun m!457211 () Bool)

(assert (=> b!474592 m!457211))

(check-sat (not b_next!11977) (not b!474587) (not b!474590) b_and!20467 (not start!42528) tp_is_empty!13405 (not b!474592) (not mapNonEmpty!21826))
(check-sat b_and!20467 (not b_next!11977))
