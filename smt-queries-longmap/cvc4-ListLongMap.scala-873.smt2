; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20338 () Bool)

(assert start!20338)

(declare-fun b_free!4997 () Bool)

(declare-fun b_next!4997 () Bool)

(assert (=> start!20338 (= b_free!4997 (not b_next!4997))))

(declare-fun tp!18022 () Bool)

(declare-fun b_and!11743 () Bool)

(assert (=> start!20338 (= tp!18022 b_and!11743)))

(declare-fun res!95609 () Bool)

(declare-fun e!131517 () Bool)

(assert (=> start!20338 (=> (not res!95609) (not e!131517))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20338 (= res!95609 (validMask!0 mask!1149))))

(assert (=> start!20338 e!131517))

(declare-datatypes ((V!6117 0))(
  ( (V!6118 (val!2471 Int)) )
))
(declare-datatypes ((ValueCell!2083 0))(
  ( (ValueCellFull!2083 (v!4441 V!6117)) (EmptyCell!2083) )
))
(declare-datatypes ((array!8937 0))(
  ( (array!8938 (arr!4219 (Array (_ BitVec 32) ValueCell!2083)) (size!4544 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8937)

(declare-fun e!131519 () Bool)

(declare-fun array_inv!2775 (array!8937) Bool)

(assert (=> start!20338 (and (array_inv!2775 _values!649) e!131519)))

(assert (=> start!20338 true))

(declare-fun tp_is_empty!4853 () Bool)

(assert (=> start!20338 tp_is_empty!4853))

(declare-datatypes ((array!8939 0))(
  ( (array!8940 (arr!4220 (Array (_ BitVec 32) (_ BitVec 64))) (size!4545 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8939)

(declare-fun array_inv!2776 (array!8939) Bool)

(assert (=> start!20338 (array_inv!2776 _keys!825)))

(assert (=> start!20338 tp!18022))

(declare-fun b!200574 () Bool)

(declare-fun res!95610 () Bool)

(assert (=> b!200574 (=> (not res!95610) (not e!131517))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!200574 (= res!95610 (and (= (size!4544 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4545 _keys!825) (size!4544 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!200575 () Bool)

(declare-fun e!131520 () Bool)

(assert (=> b!200575 (= e!131517 (not e!131520))))

(declare-fun res!95611 () Bool)

(assert (=> b!200575 (=> res!95611 e!131520)))

(assert (=> b!200575 (= res!95611 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!3734 0))(
  ( (tuple2!3735 (_1!1878 (_ BitVec 64)) (_2!1878 V!6117)) )
))
(declare-datatypes ((List!2651 0))(
  ( (Nil!2648) (Cons!2647 (h!3289 tuple2!3734) (t!7582 List!2651)) )
))
(declare-datatypes ((ListLongMap!2647 0))(
  ( (ListLongMap!2648 (toList!1339 List!2651)) )
))
(declare-fun lt!99223 () ListLongMap!2647)

(declare-fun zeroValue!615 () V!6117)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6117)

(declare-fun getCurrentListMap!929 (array!8939 array!8937 (_ BitVec 32) (_ BitVec 32) V!6117 V!6117 (_ BitVec 32) Int) ListLongMap!2647)

(assert (=> b!200575 (= lt!99223 (getCurrentListMap!929 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99231 () array!8937)

(declare-fun lt!99218 () ListLongMap!2647)

(assert (=> b!200575 (= lt!99218 (getCurrentListMap!929 _keys!825 lt!99231 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99216 () ListLongMap!2647)

(declare-fun lt!99226 () ListLongMap!2647)

(assert (=> b!200575 (and (= lt!99216 lt!99226) (= lt!99226 lt!99216))))

(declare-fun lt!99225 () ListLongMap!2647)

(declare-fun lt!99222 () tuple2!3734)

(declare-fun +!366 (ListLongMap!2647 tuple2!3734) ListLongMap!2647)

(assert (=> b!200575 (= lt!99226 (+!366 lt!99225 lt!99222))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun v!520 () V!6117)

(assert (=> b!200575 (= lt!99222 (tuple2!3735 k!843 v!520))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((Unit!6032 0))(
  ( (Unit!6033) )
))
(declare-fun lt!99221 () Unit!6032)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!42 (array!8939 array!8937 (_ BitVec 32) (_ BitVec 32) V!6117 V!6117 (_ BitVec 32) (_ BitVec 64) V!6117 (_ BitVec 32) Int) Unit!6032)

(assert (=> b!200575 (= lt!99221 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!42 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!303 (array!8939 array!8937 (_ BitVec 32) (_ BitVec 32) V!6117 V!6117 (_ BitVec 32) Int) ListLongMap!2647)

(assert (=> b!200575 (= lt!99216 (getCurrentListMapNoExtraKeys!303 _keys!825 lt!99231 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200575 (= lt!99231 (array!8938 (store (arr!4219 _values!649) i!601 (ValueCellFull!2083 v!520)) (size!4544 _values!649)))))

(assert (=> b!200575 (= lt!99225 (getCurrentListMapNoExtraKeys!303 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapNonEmpty!8348 () Bool)

(declare-fun mapRes!8348 () Bool)

(declare-fun tp!18023 () Bool)

(declare-fun e!131516 () Bool)

(assert (=> mapNonEmpty!8348 (= mapRes!8348 (and tp!18023 e!131516))))

(declare-fun mapValue!8348 () ValueCell!2083)

(declare-fun mapRest!8348 () (Array (_ BitVec 32) ValueCell!2083))

(declare-fun mapKey!8348 () (_ BitVec 32))

(assert (=> mapNonEmpty!8348 (= (arr!4219 _values!649) (store mapRest!8348 mapKey!8348 mapValue!8348))))

(declare-fun mapIsEmpty!8348 () Bool)

(assert (=> mapIsEmpty!8348 mapRes!8348))

(declare-fun b!200576 () Bool)

(declare-fun res!95605 () Bool)

(assert (=> b!200576 (=> (not res!95605) (not e!131517))))

(declare-datatypes ((List!2652 0))(
  ( (Nil!2649) (Cons!2648 (h!3290 (_ BitVec 64)) (t!7583 List!2652)) )
))
(declare-fun arrayNoDuplicates!0 (array!8939 (_ BitVec 32) List!2652) Bool)

(assert (=> b!200576 (= res!95605 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2649))))

(declare-fun b!200577 () Bool)

(assert (=> b!200577 (= e!131516 tp_is_empty!4853)))

(declare-fun b!200578 () Bool)

(declare-fun res!95603 () Bool)

(assert (=> b!200578 (=> (not res!95603) (not e!131517))))

(assert (=> b!200578 (= res!95603 (= (select (arr!4220 _keys!825) i!601) k!843))))

(declare-fun b!200579 () Bool)

(declare-fun e!131521 () Bool)

(assert (=> b!200579 (= e!131521 true)))

(declare-fun lt!99230 () ListLongMap!2647)

(declare-fun lt!99219 () tuple2!3734)

(declare-fun lt!99228 () ListLongMap!2647)

(assert (=> b!200579 (= (+!366 lt!99230 lt!99219) (+!366 lt!99228 lt!99222))))

(declare-fun lt!99217 () ListLongMap!2647)

(declare-fun lt!99229 () Unit!6032)

(declare-fun addCommutativeForDiffKeys!89 (ListLongMap!2647 (_ BitVec 64) V!6117 (_ BitVec 64) V!6117) Unit!6032)

(assert (=> b!200579 (= lt!99229 (addCommutativeForDiffKeys!89 lt!99217 k!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!200580 () Bool)

(declare-fun res!95606 () Bool)

(assert (=> b!200580 (=> (not res!95606) (not e!131517))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8939 (_ BitVec 32)) Bool)

(assert (=> b!200580 (= res!95606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!200581 () Bool)

(declare-fun res!95604 () Bool)

(assert (=> b!200581 (=> (not res!95604) (not e!131517))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!200581 (= res!95604 (validKeyInArray!0 k!843))))

(declare-fun b!200582 () Bool)

(declare-fun e!131518 () Bool)

(assert (=> b!200582 (= e!131519 (and e!131518 mapRes!8348))))

(declare-fun condMapEmpty!8348 () Bool)

(declare-fun mapDefault!8348 () ValueCell!2083)

