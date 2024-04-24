; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20272 () Bool)

(assert start!20272)

(declare-fun b_free!4927 () Bool)

(declare-fun b_next!4927 () Bool)

(assert (=> start!20272 (= b_free!4927 (not b_next!4927))))

(declare-fun tp!17813 () Bool)

(declare-fun b_and!11687 () Bool)

(assert (=> start!20272 (= tp!17813 b_and!11687)))

(declare-fun b!199501 () Bool)

(declare-fun res!94825 () Bool)

(declare-fun e!130958 () Bool)

(assert (=> b!199501 (=> (not res!94825) (not e!130958))))

(declare-datatypes ((array!8795 0))(
  ( (array!8796 (arr!4148 (Array (_ BitVec 32) (_ BitVec 64))) (size!4473 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8795)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!199501 (= res!94825 (= (select (arr!4148 _keys!825) i!601) k0!843))))

(declare-fun res!94824 () Bool)

(assert (=> start!20272 (=> (not res!94824) (not e!130958))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20272 (= res!94824 (validMask!0 mask!1149))))

(assert (=> start!20272 e!130958))

(declare-datatypes ((V!6025 0))(
  ( (V!6026 (val!2436 Int)) )
))
(declare-datatypes ((ValueCell!2048 0))(
  ( (ValueCellFull!2048 (v!4407 V!6025)) (EmptyCell!2048) )
))
(declare-datatypes ((array!8797 0))(
  ( (array!8798 (arr!4149 (Array (_ BitVec 32) ValueCell!2048)) (size!4474 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8797)

(declare-fun e!130956 () Bool)

(declare-fun array_inv!2705 (array!8797) Bool)

(assert (=> start!20272 (and (array_inv!2705 _values!649) e!130956)))

(assert (=> start!20272 true))

(declare-fun tp_is_empty!4783 () Bool)

(assert (=> start!20272 tp_is_empty!4783))

(declare-fun array_inv!2706 (array!8795) Bool)

(assert (=> start!20272 (array_inv!2706 _keys!825)))

(assert (=> start!20272 tp!17813))

(declare-fun b!199502 () Bool)

(declare-fun res!94822 () Bool)

(assert (=> b!199502 (=> (not res!94822) (not e!130958))))

(assert (=> b!199502 (= res!94822 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4473 _keys!825))))))

(declare-fun b!199503 () Bool)

(declare-fun res!94823 () Bool)

(assert (=> b!199503 (=> (not res!94823) (not e!130958))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!199503 (= res!94823 (and (= (size!4474 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4473 _keys!825) (size!4474 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!199504 () Bool)

(declare-fun e!130957 () Bool)

(assert (=> b!199504 (= e!130957 tp_is_empty!4783)))

(declare-fun b!199505 () Bool)

(declare-fun e!130955 () Bool)

(assert (=> b!199505 (= e!130955 tp_is_empty!4783)))

(declare-fun mapIsEmpty!8243 () Bool)

(declare-fun mapRes!8243 () Bool)

(assert (=> mapIsEmpty!8243 mapRes!8243))

(declare-fun mapNonEmpty!8243 () Bool)

(declare-fun tp!17812 () Bool)

(assert (=> mapNonEmpty!8243 (= mapRes!8243 (and tp!17812 e!130957))))

(declare-fun mapKey!8243 () (_ BitVec 32))

(declare-fun mapValue!8243 () ValueCell!2048)

(declare-fun mapRest!8243 () (Array (_ BitVec 32) ValueCell!2048))

(assert (=> mapNonEmpty!8243 (= (arr!4149 _values!649) (store mapRest!8243 mapKey!8243 mapValue!8243))))

(declare-fun b!199506 () Bool)

(declare-fun res!94821 () Bool)

(assert (=> b!199506 (=> (not res!94821) (not e!130958))))

(declare-datatypes ((List!2547 0))(
  ( (Nil!2544) (Cons!2543 (h!3185 (_ BitVec 64)) (t!7470 List!2547)) )
))
(declare-fun arrayNoDuplicates!0 (array!8795 (_ BitVec 32) List!2547) Bool)

(assert (=> b!199506 (= res!94821 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2544))))

(declare-fun b!199507 () Bool)

(assert (=> b!199507 (= e!130956 (and e!130955 mapRes!8243))))

(declare-fun condMapEmpty!8243 () Bool)

(declare-fun mapDefault!8243 () ValueCell!2048)

(assert (=> b!199507 (= condMapEmpty!8243 (= (arr!4149 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2048)) mapDefault!8243)))))

(declare-fun b!199508 () Bool)

(assert (=> b!199508 (= e!130958 (not true))))

(declare-fun lt!98389 () array!8797)

(declare-datatypes ((tuple2!3628 0))(
  ( (tuple2!3629 (_1!1825 (_ BitVec 64)) (_2!1825 V!6025)) )
))
(declare-datatypes ((List!2548 0))(
  ( (Nil!2545) (Cons!2544 (h!3186 tuple2!3628) (t!7471 List!2548)) )
))
(declare-datatypes ((ListLongMap!2543 0))(
  ( (ListLongMap!2544 (toList!1287 List!2548)) )
))
(declare-fun lt!98385 () ListLongMap!2543)

(declare-fun zeroValue!615 () V!6025)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6025)

(declare-fun getCurrentListMap!884 (array!8795 array!8797 (_ BitVec 32) (_ BitVec 32) V!6025 V!6025 (_ BitVec 32) Int) ListLongMap!2543)

(assert (=> b!199508 (= lt!98385 (getCurrentListMap!884 _keys!825 lt!98389 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98388 () ListLongMap!2543)

(declare-fun lt!98386 () ListLongMap!2543)

(assert (=> b!199508 (and (= lt!98388 lt!98386) (= lt!98386 lt!98388))))

(declare-fun v!520 () V!6025)

(declare-fun lt!98387 () ListLongMap!2543)

(declare-fun +!341 (ListLongMap!2543 tuple2!3628) ListLongMap!2543)

(assert (=> b!199508 (= lt!98386 (+!341 lt!98387 (tuple2!3629 k0!843 v!520)))))

(declare-datatypes ((Unit!5968 0))(
  ( (Unit!5969) )
))
(declare-fun lt!98390 () Unit!5968)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!20 (array!8795 array!8797 (_ BitVec 32) (_ BitVec 32) V!6025 V!6025 (_ BitVec 32) (_ BitVec 64) V!6025 (_ BitVec 32) Int) Unit!5968)

(assert (=> b!199508 (= lt!98390 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!20 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!277 (array!8795 array!8797 (_ BitVec 32) (_ BitVec 32) V!6025 V!6025 (_ BitVec 32) Int) ListLongMap!2543)

(assert (=> b!199508 (= lt!98388 (getCurrentListMapNoExtraKeys!277 _keys!825 lt!98389 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!199508 (= lt!98389 (array!8798 (store (arr!4149 _values!649) i!601 (ValueCellFull!2048 v!520)) (size!4474 _values!649)))))

(assert (=> b!199508 (= lt!98387 (getCurrentListMapNoExtraKeys!277 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!199509 () Bool)

(declare-fun res!94819 () Bool)

(assert (=> b!199509 (=> (not res!94819) (not e!130958))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199509 (= res!94819 (validKeyInArray!0 k0!843))))

(declare-fun b!199510 () Bool)

(declare-fun res!94820 () Bool)

(assert (=> b!199510 (=> (not res!94820) (not e!130958))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8795 (_ BitVec 32)) Bool)

(assert (=> b!199510 (= res!94820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(assert (= (and start!20272 res!94824) b!199503))

(assert (= (and b!199503 res!94823) b!199510))

(assert (= (and b!199510 res!94820) b!199506))

(assert (= (and b!199506 res!94821) b!199502))

(assert (= (and b!199502 res!94822) b!199509))

(assert (= (and b!199509 res!94819) b!199501))

(assert (= (and b!199501 res!94825) b!199508))

(assert (= (and b!199507 condMapEmpty!8243) mapIsEmpty!8243))

(assert (= (and b!199507 (not condMapEmpty!8243)) mapNonEmpty!8243))

(get-info :version)

(assert (= (and mapNonEmpty!8243 ((_ is ValueCellFull!2048) mapValue!8243)) b!199504))

(assert (= (and b!199507 ((_ is ValueCellFull!2048) mapDefault!8243)) b!199505))

(assert (= start!20272 b!199507))

(declare-fun m!226101 () Bool)

(assert (=> b!199508 m!226101))

(declare-fun m!226103 () Bool)

(assert (=> b!199508 m!226103))

(declare-fun m!226105 () Bool)

(assert (=> b!199508 m!226105))

(declare-fun m!226107 () Bool)

(assert (=> b!199508 m!226107))

(declare-fun m!226109 () Bool)

(assert (=> b!199508 m!226109))

(declare-fun m!226111 () Bool)

(assert (=> b!199508 m!226111))

(declare-fun m!226113 () Bool)

(assert (=> b!199510 m!226113))

(declare-fun m!226115 () Bool)

(assert (=> b!199506 m!226115))

(declare-fun m!226117 () Bool)

(assert (=> start!20272 m!226117))

(declare-fun m!226119 () Bool)

(assert (=> start!20272 m!226119))

(declare-fun m!226121 () Bool)

(assert (=> start!20272 m!226121))

(declare-fun m!226123 () Bool)

(assert (=> b!199509 m!226123))

(declare-fun m!226125 () Bool)

(assert (=> b!199501 m!226125))

(declare-fun m!226127 () Bool)

(assert (=> mapNonEmpty!8243 m!226127))

(check-sat (not b!199510) (not start!20272) (not b_next!4927) (not mapNonEmpty!8243) (not b!199509) (not b!199508) b_and!11687 (not b!199506) tp_is_empty!4783)
(check-sat b_and!11687 (not b_next!4927))
