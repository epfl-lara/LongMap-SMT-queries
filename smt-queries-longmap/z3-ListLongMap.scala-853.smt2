; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20218 () Bool)

(assert start!20218)

(declare-fun b_free!4873 () Bool)

(declare-fun b_next!4873 () Bool)

(assert (=> start!20218 (= b_free!4873 (not b_next!4873))))

(declare-fun tp!17650 () Bool)

(declare-fun b_and!11633 () Bool)

(assert (=> start!20218 (= tp!17650 b_and!11633)))

(declare-fun b!198691 () Bool)

(declare-fun e!130551 () Bool)

(declare-fun tp_is_empty!4729 () Bool)

(assert (=> b!198691 (= e!130551 tp_is_empty!4729)))

(declare-fun b!198692 () Bool)

(declare-fun e!130552 () Bool)

(assert (=> b!198692 (= e!130552 tp_is_empty!4729)))

(declare-fun mapIsEmpty!8162 () Bool)

(declare-fun mapRes!8162 () Bool)

(assert (=> mapIsEmpty!8162 mapRes!8162))

(declare-fun res!94258 () Bool)

(declare-fun e!130553 () Bool)

(assert (=> start!20218 (=> (not res!94258) (not e!130553))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20218 (= res!94258 (validMask!0 mask!1149))))

(assert (=> start!20218 e!130553))

(declare-datatypes ((V!5953 0))(
  ( (V!5954 (val!2409 Int)) )
))
(declare-datatypes ((ValueCell!2021 0))(
  ( (ValueCellFull!2021 (v!4380 V!5953)) (EmptyCell!2021) )
))
(declare-datatypes ((array!8691 0))(
  ( (array!8692 (arr!4096 (Array (_ BitVec 32) ValueCell!2021)) (size!4421 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8691)

(declare-fun e!130550 () Bool)

(declare-fun array_inv!2671 (array!8691) Bool)

(assert (=> start!20218 (and (array_inv!2671 _values!649) e!130550)))

(assert (=> start!20218 true))

(assert (=> start!20218 tp_is_empty!4729))

(declare-datatypes ((array!8693 0))(
  ( (array!8694 (arr!4097 (Array (_ BitVec 32) (_ BitVec 64))) (size!4422 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8693)

(declare-fun array_inv!2672 (array!8693) Bool)

(assert (=> start!20218 (array_inv!2672 _keys!825)))

(assert (=> start!20218 tp!17650))

(declare-fun b!198693 () Bool)

(assert (=> b!198693 (= e!130550 (and e!130551 mapRes!8162))))

(declare-fun condMapEmpty!8162 () Bool)

(declare-fun mapDefault!8162 () ValueCell!2021)

(assert (=> b!198693 (= condMapEmpty!8162 (= (arr!4096 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2021)) mapDefault!8162)))))

(declare-fun b!198694 () Bool)

(declare-fun res!94252 () Bool)

(assert (=> b!198694 (=> (not res!94252) (not e!130553))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!198694 (= res!94252 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4422 _keys!825))))))

(declare-fun b!198695 () Bool)

(declare-fun res!94256 () Bool)

(assert (=> b!198695 (=> (not res!94256) (not e!130553))))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!198695 (= res!94256 (= (select (arr!4097 _keys!825) i!601) k0!843))))

(declare-fun b!198696 () Bool)

(declare-fun res!94257 () Bool)

(assert (=> b!198696 (=> (not res!94257) (not e!130553))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!198696 (= res!94257 (and (= (size!4421 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4422 _keys!825) (size!4421 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!8162 () Bool)

(declare-fun tp!17651 () Bool)

(assert (=> mapNonEmpty!8162 (= mapRes!8162 (and tp!17651 e!130552))))

(declare-fun mapValue!8162 () ValueCell!2021)

(declare-fun mapRest!8162 () (Array (_ BitVec 32) ValueCell!2021))

(declare-fun mapKey!8162 () (_ BitVec 32))

(assert (=> mapNonEmpty!8162 (= (arr!4096 _values!649) (store mapRest!8162 mapKey!8162 mapValue!8162))))

(declare-fun b!198697 () Bool)

(declare-fun res!94253 () Bool)

(assert (=> b!198697 (=> (not res!94253) (not e!130553))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198697 (= res!94253 (validKeyInArray!0 k0!843))))

(declare-fun b!198698 () Bool)

(assert (=> b!198698 (= e!130553 (not true))))

(declare-datatypes ((tuple2!3592 0))(
  ( (tuple2!3593 (_1!1807 (_ BitVec 64)) (_2!1807 V!5953)) )
))
(declare-datatypes ((List!2513 0))(
  ( (Nil!2510) (Cons!2509 (h!3151 tuple2!3592) (t!7436 List!2513)) )
))
(declare-datatypes ((ListLongMap!2507 0))(
  ( (ListLongMap!2508 (toList!1269 List!2513)) )
))
(declare-fun lt!98040 () ListLongMap!2507)

(declare-fun lt!98042 () ListLongMap!2507)

(assert (=> b!198698 (and (= lt!98040 lt!98042) (= lt!98042 lt!98040))))

(declare-fun v!520 () V!5953)

(declare-fun lt!98039 () ListLongMap!2507)

(declare-fun +!323 (ListLongMap!2507 tuple2!3592) ListLongMap!2507)

(assert (=> b!198698 (= lt!98042 (+!323 lt!98039 (tuple2!3593 k0!843 v!520)))))

(declare-datatypes ((Unit!5932 0))(
  ( (Unit!5933) )
))
(declare-fun lt!98041 () Unit!5932)

(declare-fun zeroValue!615 () V!5953)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5953)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!2 (array!8693 array!8691 (_ BitVec 32) (_ BitVec 32) V!5953 V!5953 (_ BitVec 32) (_ BitVec 64) V!5953 (_ BitVec 32) Int) Unit!5932)

(assert (=> b!198698 (= lt!98041 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!2 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!259 (array!8693 array!8691 (_ BitVec 32) (_ BitVec 32) V!5953 V!5953 (_ BitVec 32) Int) ListLongMap!2507)

(assert (=> b!198698 (= lt!98040 (getCurrentListMapNoExtraKeys!259 _keys!825 (array!8692 (store (arr!4096 _values!649) i!601 (ValueCellFull!2021 v!520)) (size!4421 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!198698 (= lt!98039 (getCurrentListMapNoExtraKeys!259 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!198699 () Bool)

(declare-fun res!94255 () Bool)

(assert (=> b!198699 (=> (not res!94255) (not e!130553))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8693 (_ BitVec 32)) Bool)

(assert (=> b!198699 (= res!94255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!198700 () Bool)

(declare-fun res!94254 () Bool)

(assert (=> b!198700 (=> (not res!94254) (not e!130553))))

(declare-datatypes ((List!2514 0))(
  ( (Nil!2511) (Cons!2510 (h!3152 (_ BitVec 64)) (t!7437 List!2514)) )
))
(declare-fun arrayNoDuplicates!0 (array!8693 (_ BitVec 32) List!2514) Bool)

(assert (=> b!198700 (= res!94254 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2511))))

(assert (= (and start!20218 res!94258) b!198696))

(assert (= (and b!198696 res!94257) b!198699))

(assert (= (and b!198699 res!94255) b!198700))

(assert (= (and b!198700 res!94254) b!198694))

(assert (= (and b!198694 res!94252) b!198697))

(assert (= (and b!198697 res!94253) b!198695))

(assert (= (and b!198695 res!94256) b!198698))

(assert (= (and b!198693 condMapEmpty!8162) mapIsEmpty!8162))

(assert (= (and b!198693 (not condMapEmpty!8162)) mapNonEmpty!8162))

(get-info :version)

(assert (= (and mapNonEmpty!8162 ((_ is ValueCellFull!2021) mapValue!8162)) b!198692))

(assert (= (and b!198693 ((_ is ValueCellFull!2021) mapDefault!8162)) b!198691))

(assert (= start!20218 b!198693))

(declare-fun m!225393 () Bool)

(assert (=> b!198695 m!225393))

(declare-fun m!225395 () Bool)

(assert (=> b!198700 m!225395))

(declare-fun m!225397 () Bool)

(assert (=> b!198699 m!225397))

(declare-fun m!225399 () Bool)

(assert (=> b!198698 m!225399))

(declare-fun m!225401 () Bool)

(assert (=> b!198698 m!225401))

(declare-fun m!225403 () Bool)

(assert (=> b!198698 m!225403))

(declare-fun m!225405 () Bool)

(assert (=> b!198698 m!225405))

(declare-fun m!225407 () Bool)

(assert (=> b!198698 m!225407))

(declare-fun m!225409 () Bool)

(assert (=> start!20218 m!225409))

(declare-fun m!225411 () Bool)

(assert (=> start!20218 m!225411))

(declare-fun m!225413 () Bool)

(assert (=> start!20218 m!225413))

(declare-fun m!225415 () Bool)

(assert (=> mapNonEmpty!8162 m!225415))

(declare-fun m!225417 () Bool)

(assert (=> b!198697 m!225417))

(check-sat (not start!20218) (not b!198700) (not b!198697) (not b!198699) (not b_next!4873) tp_is_empty!4729 (not mapNonEmpty!8162) b_and!11633 (not b!198698))
(check-sat b_and!11633 (not b_next!4873))
