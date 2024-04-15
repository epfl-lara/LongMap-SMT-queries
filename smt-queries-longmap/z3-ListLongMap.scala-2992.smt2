; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42242 () Bool)

(assert start!42242)

(declare-fun b_free!11761 () Bool)

(declare-fun b_next!11761 () Bool)

(assert (=> start!42242 (= b_free!11761 (not b_next!11761))))

(declare-fun tp!41310 () Bool)

(declare-fun b_and!20173 () Bool)

(assert (=> start!42242 (= tp!41310 b_and!20173)))

(declare-fun b!471270 () Bool)

(declare-fun res!281566 () Bool)

(declare-fun e!276200 () Bool)

(assert (=> b!471270 (=> (not res!281566) (not e!276200))))

(declare-datatypes ((array!30125 0))(
  ( (array!30126 (arr!14484 (Array (_ BitVec 32) (_ BitVec 64))) (size!14837 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30125)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30125 (_ BitVec 32)) Bool)

(assert (=> b!471270 (= res!281566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!471271 () Bool)

(declare-fun e!276199 () Bool)

(declare-fun e!276198 () Bool)

(declare-fun mapRes!21490 () Bool)

(assert (=> b!471271 (= e!276199 (and e!276198 mapRes!21490))))

(declare-fun condMapEmpty!21490 () Bool)

(declare-datatypes ((V!18691 0))(
  ( (V!18692 (val!6639 Int)) )
))
(declare-datatypes ((ValueCell!6251 0))(
  ( (ValueCellFull!6251 (v!8924 V!18691)) (EmptyCell!6251) )
))
(declare-datatypes ((array!30127 0))(
  ( (array!30128 (arr!14485 (Array (_ BitVec 32) ValueCell!6251)) (size!14838 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30127)

(declare-fun mapDefault!21490 () ValueCell!6251)

(assert (=> b!471271 (= condMapEmpty!21490 (= (arr!14485 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6251)) mapDefault!21490)))))

(declare-fun b!471272 () Bool)

(declare-fun res!281567 () Bool)

(assert (=> b!471272 (=> (not res!281567) (not e!276200))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!471272 (= res!281567 (and (= (size!14838 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14837 _keys!1025) (size!14838 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!471273 () Bool)

(assert (=> b!471273 (= e!276200 (not true))))

(declare-datatypes ((tuple2!8778 0))(
  ( (tuple2!8779 (_1!4400 (_ BitVec 64)) (_2!4400 V!18691)) )
))
(declare-datatypes ((List!8849 0))(
  ( (Nil!8846) (Cons!8845 (h!9701 tuple2!8778) (t!14806 List!8849)) )
))
(declare-datatypes ((ListLongMap!7681 0))(
  ( (ListLongMap!7682 (toList!3856 List!8849)) )
))
(declare-fun lt!213699 () ListLongMap!7681)

(declare-fun lt!213701 () ListLongMap!7681)

(assert (=> b!471273 (= lt!213699 lt!213701)))

(declare-fun minValueBefore!38 () V!18691)

(declare-fun zeroValue!794 () V!18691)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13813 0))(
  ( (Unit!13814) )
))
(declare-fun lt!213700 () Unit!13813)

(declare-fun minValueAfter!38 () V!18691)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!188 (array!30125 array!30127 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18691 V!18691 V!18691 V!18691 (_ BitVec 32) Int) Unit!13813)

(assert (=> b!471273 (= lt!213700 (lemmaNoChangeToArrayThenSameMapNoExtras!188 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2031 (array!30125 array!30127 (_ BitVec 32) (_ BitVec 32) V!18691 V!18691 (_ BitVec 32) Int) ListLongMap!7681)

(assert (=> b!471273 (= lt!213701 (getCurrentListMapNoExtraKeys!2031 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471273 (= lt!213699 (getCurrentListMapNoExtraKeys!2031 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!471274 () Bool)

(declare-fun e!276197 () Bool)

(declare-fun tp_is_empty!13189 () Bool)

(assert (=> b!471274 (= e!276197 tp_is_empty!13189)))

(declare-fun mapIsEmpty!21490 () Bool)

(assert (=> mapIsEmpty!21490 mapRes!21490))

(declare-fun mapNonEmpty!21490 () Bool)

(declare-fun tp!41311 () Bool)

(assert (=> mapNonEmpty!21490 (= mapRes!21490 (and tp!41311 e!276197))))

(declare-fun mapRest!21490 () (Array (_ BitVec 32) ValueCell!6251))

(declare-fun mapValue!21490 () ValueCell!6251)

(declare-fun mapKey!21490 () (_ BitVec 32))

(assert (=> mapNonEmpty!21490 (= (arr!14485 _values!833) (store mapRest!21490 mapKey!21490 mapValue!21490))))

(declare-fun res!281565 () Bool)

(assert (=> start!42242 (=> (not res!281565) (not e!276200))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42242 (= res!281565 (validMask!0 mask!1365))))

(assert (=> start!42242 e!276200))

(assert (=> start!42242 tp_is_empty!13189))

(assert (=> start!42242 tp!41310))

(assert (=> start!42242 true))

(declare-fun array_inv!10536 (array!30125) Bool)

(assert (=> start!42242 (array_inv!10536 _keys!1025)))

(declare-fun array_inv!10537 (array!30127) Bool)

(assert (=> start!42242 (and (array_inv!10537 _values!833) e!276199)))

(declare-fun b!471275 () Bool)

(assert (=> b!471275 (= e!276198 tp_is_empty!13189)))

(declare-fun b!471276 () Bool)

(declare-fun res!281564 () Bool)

(assert (=> b!471276 (=> (not res!281564) (not e!276200))))

(declare-datatypes ((List!8850 0))(
  ( (Nil!8847) (Cons!8846 (h!9702 (_ BitVec 64)) (t!14807 List!8850)) )
))
(declare-fun arrayNoDuplicates!0 (array!30125 (_ BitVec 32) List!8850) Bool)

(assert (=> b!471276 (= res!281564 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8847))))

(assert (= (and start!42242 res!281565) b!471272))

(assert (= (and b!471272 res!281567) b!471270))

(assert (= (and b!471270 res!281566) b!471276))

(assert (= (and b!471276 res!281564) b!471273))

(assert (= (and b!471271 condMapEmpty!21490) mapIsEmpty!21490))

(assert (= (and b!471271 (not condMapEmpty!21490)) mapNonEmpty!21490))

(get-info :version)

(assert (= (and mapNonEmpty!21490 ((_ is ValueCellFull!6251) mapValue!21490)) b!471274))

(assert (= (and b!471271 ((_ is ValueCellFull!6251) mapDefault!21490)) b!471275))

(assert (= start!42242 b!471271))

(declare-fun m!452925 () Bool)

(assert (=> b!471276 m!452925))

(declare-fun m!452927 () Bool)

(assert (=> b!471270 m!452927))

(declare-fun m!452929 () Bool)

(assert (=> mapNonEmpty!21490 m!452929))

(declare-fun m!452931 () Bool)

(assert (=> b!471273 m!452931))

(declare-fun m!452933 () Bool)

(assert (=> b!471273 m!452933))

(declare-fun m!452935 () Bool)

(assert (=> b!471273 m!452935))

(declare-fun m!452937 () Bool)

(assert (=> start!42242 m!452937))

(declare-fun m!452939 () Bool)

(assert (=> start!42242 m!452939))

(declare-fun m!452941 () Bool)

(assert (=> start!42242 m!452941))

(check-sat tp_is_empty!13189 (not b!471276) (not b!471273) (not mapNonEmpty!21490) b_and!20173 (not b!471270) (not start!42242) (not b_next!11761))
(check-sat b_and!20173 (not b_next!11761))
