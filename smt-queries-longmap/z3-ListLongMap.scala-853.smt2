; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20218 () Bool)

(assert start!20218)

(declare-fun b_free!4873 () Bool)

(declare-fun b_next!4873 () Bool)

(assert (=> start!20218 (= b_free!4873 (not b_next!4873))))

(declare-fun tp!17651 () Bool)

(declare-fun b_and!11593 () Bool)

(assert (=> start!20218 (= tp!17651 b_and!11593)))

(declare-fun res!94142 () Bool)

(declare-fun e!130426 () Bool)

(assert (=> start!20218 (=> (not res!94142) (not e!130426))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20218 (= res!94142 (validMask!0 mask!1149))))

(assert (=> start!20218 e!130426))

(declare-datatypes ((V!5953 0))(
  ( (V!5954 (val!2409 Int)) )
))
(declare-datatypes ((ValueCell!2021 0))(
  ( (ValueCellFull!2021 (v!4373 V!5953)) (EmptyCell!2021) )
))
(declare-datatypes ((array!8683 0))(
  ( (array!8684 (arr!4091 (Array (_ BitVec 32) ValueCell!2021)) (size!4417 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8683)

(declare-fun e!130427 () Bool)

(declare-fun array_inv!2665 (array!8683) Bool)

(assert (=> start!20218 (and (array_inv!2665 _values!649) e!130427)))

(assert (=> start!20218 true))

(declare-fun tp_is_empty!4729 () Bool)

(assert (=> start!20218 tp_is_empty!4729))

(declare-datatypes ((array!8685 0))(
  ( (array!8686 (arr!4092 (Array (_ BitVec 32) (_ BitVec 64))) (size!4418 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8685)

(declare-fun array_inv!2666 (array!8685) Bool)

(assert (=> start!20218 (array_inv!2666 _keys!825)))

(assert (=> start!20218 tp!17651))

(declare-fun b!198497 () Bool)

(declare-fun e!130428 () Bool)

(assert (=> b!198497 (= e!130428 tp_is_empty!4729)))

(declare-fun b!198498 () Bool)

(declare-fun e!130425 () Bool)

(assert (=> b!198498 (= e!130425 tp_is_empty!4729)))

(declare-fun mapIsEmpty!8162 () Bool)

(declare-fun mapRes!8162 () Bool)

(assert (=> mapIsEmpty!8162 mapRes!8162))

(declare-fun b!198499 () Bool)

(assert (=> b!198499 (= e!130427 (and e!130428 mapRes!8162))))

(declare-fun condMapEmpty!8162 () Bool)

(declare-fun mapDefault!8162 () ValueCell!2021)

(assert (=> b!198499 (= condMapEmpty!8162 (= (arr!4091 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2021)) mapDefault!8162)))))

(declare-fun mapNonEmpty!8162 () Bool)

(declare-fun tp!17650 () Bool)

(assert (=> mapNonEmpty!8162 (= mapRes!8162 (and tp!17650 e!130425))))

(declare-fun mapValue!8162 () ValueCell!2021)

(declare-fun mapRest!8162 () (Array (_ BitVec 32) ValueCell!2021))

(declare-fun mapKey!8162 () (_ BitVec 32))

(assert (=> mapNonEmpty!8162 (= (arr!4091 _values!649) (store mapRest!8162 mapKey!8162 mapValue!8162))))

(declare-fun b!198500 () Bool)

(declare-fun res!94136 () Bool)

(assert (=> b!198500 (=> (not res!94136) (not e!130426))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198500 (= res!94136 (validKeyInArray!0 k0!843))))

(declare-fun b!198501 () Bool)

(declare-fun res!94137 () Bool)

(assert (=> b!198501 (=> (not res!94137) (not e!130426))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!198501 (= res!94137 (= (select (arr!4092 _keys!825) i!601) k0!843))))

(declare-fun b!198502 () Bool)

(assert (=> b!198502 (= e!130426 (not true))))

(declare-datatypes ((tuple2!3612 0))(
  ( (tuple2!3613 (_1!1817 (_ BitVec 64)) (_2!1817 V!5953)) )
))
(declare-datatypes ((List!2544 0))(
  ( (Nil!2541) (Cons!2540 (h!3182 tuple2!3612) (t!7466 List!2544)) )
))
(declare-datatypes ((ListLongMap!2515 0))(
  ( (ListLongMap!2516 (toList!1273 List!2544)) )
))
(declare-fun lt!97800 () ListLongMap!2515)

(declare-fun lt!97802 () ListLongMap!2515)

(assert (=> b!198502 (and (= lt!97800 lt!97802) (= lt!97802 lt!97800))))

(declare-fun lt!97801 () ListLongMap!2515)

(declare-fun v!520 () V!5953)

(declare-fun +!322 (ListLongMap!2515 tuple2!3612) ListLongMap!2515)

(assert (=> b!198502 (= lt!97802 (+!322 lt!97801 (tuple2!3613 k0!843 v!520)))))

(declare-datatypes ((Unit!5896 0))(
  ( (Unit!5897) )
))
(declare-fun lt!97799 () Unit!5896)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5953)

(declare-fun zeroValue!615 () V!5953)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!2 (array!8685 array!8683 (_ BitVec 32) (_ BitVec 32) V!5953 V!5953 (_ BitVec 32) (_ BitVec 64) V!5953 (_ BitVec 32) Int) Unit!5896)

(assert (=> b!198502 (= lt!97799 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!2 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!253 (array!8685 array!8683 (_ BitVec 32) (_ BitVec 32) V!5953 V!5953 (_ BitVec 32) Int) ListLongMap!2515)

(assert (=> b!198502 (= lt!97800 (getCurrentListMapNoExtraKeys!253 _keys!825 (array!8684 (store (arr!4091 _values!649) i!601 (ValueCellFull!2021 v!520)) (size!4417 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!198502 (= lt!97801 (getCurrentListMapNoExtraKeys!253 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!198503 () Bool)

(declare-fun res!94139 () Bool)

(assert (=> b!198503 (=> (not res!94139) (not e!130426))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8685 (_ BitVec 32)) Bool)

(assert (=> b!198503 (= res!94139 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!198504 () Bool)

(declare-fun res!94141 () Bool)

(assert (=> b!198504 (=> (not res!94141) (not e!130426))))

(assert (=> b!198504 (= res!94141 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4418 _keys!825))))))

(declare-fun b!198505 () Bool)

(declare-fun res!94140 () Bool)

(assert (=> b!198505 (=> (not res!94140) (not e!130426))))

(assert (=> b!198505 (= res!94140 (and (= (size!4417 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4418 _keys!825) (size!4417 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!198506 () Bool)

(declare-fun res!94138 () Bool)

(assert (=> b!198506 (=> (not res!94138) (not e!130426))))

(declare-datatypes ((List!2545 0))(
  ( (Nil!2542) (Cons!2541 (h!3183 (_ BitVec 64)) (t!7467 List!2545)) )
))
(declare-fun arrayNoDuplicates!0 (array!8685 (_ BitVec 32) List!2545) Bool)

(assert (=> b!198506 (= res!94138 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2542))))

(assert (= (and start!20218 res!94142) b!198505))

(assert (= (and b!198505 res!94140) b!198503))

(assert (= (and b!198503 res!94139) b!198506))

(assert (= (and b!198506 res!94138) b!198504))

(assert (= (and b!198504 res!94141) b!198500))

(assert (= (and b!198500 res!94136) b!198501))

(assert (= (and b!198501 res!94137) b!198502))

(assert (= (and b!198499 condMapEmpty!8162) mapIsEmpty!8162))

(assert (= (and b!198499 (not condMapEmpty!8162)) mapNonEmpty!8162))

(get-info :version)

(assert (= (and mapNonEmpty!8162 ((_ is ValueCellFull!2021) mapValue!8162)) b!198498))

(assert (= (and b!198499 ((_ is ValueCellFull!2021) mapDefault!8162)) b!198497))

(assert (= start!20218 b!198499))

(declare-fun m!224595 () Bool)

(assert (=> b!198501 m!224595))

(declare-fun m!224597 () Bool)

(assert (=> b!198500 m!224597))

(declare-fun m!224599 () Bool)

(assert (=> b!198502 m!224599))

(declare-fun m!224601 () Bool)

(assert (=> b!198502 m!224601))

(declare-fun m!224603 () Bool)

(assert (=> b!198502 m!224603))

(declare-fun m!224605 () Bool)

(assert (=> b!198502 m!224605))

(declare-fun m!224607 () Bool)

(assert (=> b!198502 m!224607))

(declare-fun m!224609 () Bool)

(assert (=> mapNonEmpty!8162 m!224609))

(declare-fun m!224611 () Bool)

(assert (=> b!198506 m!224611))

(declare-fun m!224613 () Bool)

(assert (=> start!20218 m!224613))

(declare-fun m!224615 () Bool)

(assert (=> start!20218 m!224615))

(declare-fun m!224617 () Bool)

(assert (=> start!20218 m!224617))

(declare-fun m!224619 () Bool)

(assert (=> b!198503 m!224619))

(check-sat (not mapNonEmpty!8162) (not b!198506) (not b!198503) tp_is_empty!4729 (not b!198500) (not b_next!4873) (not start!20218) (not b!198502) b_and!11593)
(check-sat b_and!11593 (not b_next!4873))
