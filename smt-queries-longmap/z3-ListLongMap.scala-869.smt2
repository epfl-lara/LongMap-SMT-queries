; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20312 () Bool)

(assert start!20312)

(declare-fun b_free!4971 () Bool)

(declare-fun b_next!4971 () Bool)

(assert (=> start!20312 (= b_free!4971 (not b_next!4971))))

(declare-fun tp!17944 () Bool)

(declare-fun b_and!11717 () Bool)

(assert (=> start!20312 (= tp!17944 b_and!11717)))

(declare-fun b!200114 () Bool)

(declare-fun res!95265 () Bool)

(declare-fun e!131262 () Bool)

(assert (=> b!200114 (=> (not res!95265) (not e!131262))))

(declare-datatypes ((array!8889 0))(
  ( (array!8890 (arr!4195 (Array (_ BitVec 32) (_ BitVec 64))) (size!4520 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8889)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6083 0))(
  ( (V!6084 (val!2458 Int)) )
))
(declare-datatypes ((ValueCell!2070 0))(
  ( (ValueCellFull!2070 (v!4428 V!6083)) (EmptyCell!2070) )
))
(declare-datatypes ((array!8891 0))(
  ( (array!8892 (arr!4196 (Array (_ BitVec 32) ValueCell!2070)) (size!4521 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8891)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!200114 (= res!95265 (and (= (size!4521 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4520 _keys!825) (size!4521 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!8309 () Bool)

(declare-fun mapRes!8309 () Bool)

(assert (=> mapIsEmpty!8309 mapRes!8309))

(declare-fun b!200115 () Bool)

(assert (=> b!200115 (= e!131262 (not (bvsle #b00000000000000000000000000000000 (size!4520 _keys!825))))))

(declare-fun lt!98722 () array!8891)

(declare-datatypes ((tuple2!3714 0))(
  ( (tuple2!3715 (_1!1868 (_ BitVec 64)) (_2!1868 V!6083)) )
))
(declare-datatypes ((List!2631 0))(
  ( (Nil!2628) (Cons!2627 (h!3269 tuple2!3714) (t!7562 List!2631)) )
))
(declare-datatypes ((ListLongMap!2627 0))(
  ( (ListLongMap!2628 (toList!1329 List!2631)) )
))
(declare-fun lt!98724 () ListLongMap!2627)

(declare-fun zeroValue!615 () V!6083)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6083)

(declare-fun getCurrentListMap!920 (array!8889 array!8891 (_ BitVec 32) (_ BitVec 32) V!6083 V!6083 (_ BitVec 32) Int) ListLongMap!2627)

(assert (=> b!200115 (= lt!98724 (getCurrentListMap!920 _keys!825 lt!98722 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98725 () ListLongMap!2627)

(declare-fun lt!98727 () ListLongMap!2627)

(assert (=> b!200115 (and (= lt!98725 lt!98727) (= lt!98727 lt!98725))))

(declare-fun lt!98723 () ListLongMap!2627)

(declare-fun v!520 () V!6083)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun +!356 (ListLongMap!2627 tuple2!3714) ListLongMap!2627)

(assert (=> b!200115 (= lt!98727 (+!356 lt!98723 (tuple2!3715 k0!843 v!520)))))

(declare-datatypes ((Unit!6014 0))(
  ( (Unit!6015) )
))
(declare-fun lt!98726 () Unit!6014)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!33 (array!8889 array!8891 (_ BitVec 32) (_ BitVec 32) V!6083 V!6083 (_ BitVec 32) (_ BitVec 64) V!6083 (_ BitVec 32) Int) Unit!6014)

(assert (=> b!200115 (= lt!98726 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!33 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!294 (array!8889 array!8891 (_ BitVec 32) (_ BitVec 32) V!6083 V!6083 (_ BitVec 32) Int) ListLongMap!2627)

(assert (=> b!200115 (= lt!98725 (getCurrentListMapNoExtraKeys!294 _keys!825 lt!98722 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200115 (= lt!98722 (array!8892 (store (arr!4196 _values!649) i!601 (ValueCellFull!2070 v!520)) (size!4521 _values!649)))))

(assert (=> b!200115 (= lt!98723 (getCurrentListMapNoExtraKeys!294 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!200116 () Bool)

(declare-fun e!131260 () Bool)

(declare-fun tp_is_empty!4827 () Bool)

(assert (=> b!200116 (= e!131260 tp_is_empty!4827)))

(declare-fun b!200117 () Bool)

(declare-fun res!95260 () Bool)

(assert (=> b!200117 (=> (not res!95260) (not e!131262))))

(declare-datatypes ((List!2632 0))(
  ( (Nil!2629) (Cons!2628 (h!3270 (_ BitVec 64)) (t!7563 List!2632)) )
))
(declare-fun arrayNoDuplicates!0 (array!8889 (_ BitVec 32) List!2632) Bool)

(assert (=> b!200117 (= res!95260 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2629))))

(declare-fun b!200118 () Bool)

(declare-fun e!131264 () Bool)

(assert (=> b!200118 (= e!131264 (and e!131260 mapRes!8309))))

(declare-fun condMapEmpty!8309 () Bool)

(declare-fun mapDefault!8309 () ValueCell!2070)

(assert (=> b!200118 (= condMapEmpty!8309 (= (arr!4196 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2070)) mapDefault!8309)))))

(declare-fun mapNonEmpty!8309 () Bool)

(declare-fun tp!17945 () Bool)

(declare-fun e!131261 () Bool)

(assert (=> mapNonEmpty!8309 (= mapRes!8309 (and tp!17945 e!131261))))

(declare-fun mapRest!8309 () (Array (_ BitVec 32) ValueCell!2070))

(declare-fun mapKey!8309 () (_ BitVec 32))

(declare-fun mapValue!8309 () ValueCell!2070)

(assert (=> mapNonEmpty!8309 (= (arr!4196 _values!649) (store mapRest!8309 mapKey!8309 mapValue!8309))))

(declare-fun res!95263 () Bool)

(assert (=> start!20312 (=> (not res!95263) (not e!131262))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20312 (= res!95263 (validMask!0 mask!1149))))

(assert (=> start!20312 e!131262))

(declare-fun array_inv!2761 (array!8891) Bool)

(assert (=> start!20312 (and (array_inv!2761 _values!649) e!131264)))

(assert (=> start!20312 true))

(assert (=> start!20312 tp_is_empty!4827))

(declare-fun array_inv!2762 (array!8889) Bool)

(assert (=> start!20312 (array_inv!2762 _keys!825)))

(assert (=> start!20312 tp!17944))

(declare-fun b!200119 () Bool)

(declare-fun res!95266 () Bool)

(assert (=> b!200119 (=> (not res!95266) (not e!131262))))

(assert (=> b!200119 (= res!95266 (= (select (arr!4195 _keys!825) i!601) k0!843))))

(declare-fun b!200120 () Bool)

(declare-fun res!95264 () Bool)

(assert (=> b!200120 (=> (not res!95264) (not e!131262))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!200120 (= res!95264 (validKeyInArray!0 k0!843))))

(declare-fun b!200121 () Bool)

(declare-fun res!95261 () Bool)

(assert (=> b!200121 (=> (not res!95261) (not e!131262))))

(assert (=> b!200121 (= res!95261 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4520 _keys!825))))))

(declare-fun b!200122 () Bool)

(assert (=> b!200122 (= e!131261 tp_is_empty!4827)))

(declare-fun b!200123 () Bool)

(declare-fun res!95262 () Bool)

(assert (=> b!200123 (=> (not res!95262) (not e!131262))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8889 (_ BitVec 32)) Bool)

(assert (=> b!200123 (= res!95262 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(assert (= (and start!20312 res!95263) b!200114))

(assert (= (and b!200114 res!95265) b!200123))

(assert (= (and b!200123 res!95262) b!200117))

(assert (= (and b!200117 res!95260) b!200121))

(assert (= (and b!200121 res!95261) b!200120))

(assert (= (and b!200120 res!95264) b!200119))

(assert (= (and b!200119 res!95266) b!200115))

(assert (= (and b!200118 condMapEmpty!8309) mapIsEmpty!8309))

(assert (= (and b!200118 (not condMapEmpty!8309)) mapNonEmpty!8309))

(get-info :version)

(assert (= (and mapNonEmpty!8309 ((_ is ValueCellFull!2070) mapValue!8309)) b!200122))

(assert (= (and b!200118 ((_ is ValueCellFull!2070) mapDefault!8309)) b!200116))

(assert (= start!20312 b!200118))

(declare-fun m!226535 () Bool)

(assert (=> b!200120 m!226535))

(declare-fun m!226537 () Bool)

(assert (=> b!200119 m!226537))

(declare-fun m!226539 () Bool)

(assert (=> b!200117 m!226539))

(declare-fun m!226541 () Bool)

(assert (=> start!20312 m!226541))

(declare-fun m!226543 () Bool)

(assert (=> start!20312 m!226543))

(declare-fun m!226545 () Bool)

(assert (=> start!20312 m!226545))

(declare-fun m!226547 () Bool)

(assert (=> b!200123 m!226547))

(declare-fun m!226549 () Bool)

(assert (=> mapNonEmpty!8309 m!226549))

(declare-fun m!226551 () Bool)

(assert (=> b!200115 m!226551))

(declare-fun m!226553 () Bool)

(assert (=> b!200115 m!226553))

(declare-fun m!226555 () Bool)

(assert (=> b!200115 m!226555))

(declare-fun m!226557 () Bool)

(assert (=> b!200115 m!226557))

(declare-fun m!226559 () Bool)

(assert (=> b!200115 m!226559))

(declare-fun m!226561 () Bool)

(assert (=> b!200115 m!226561))

(check-sat (not b!200120) b_and!11717 (not b!200115) (not b!200117) tp_is_empty!4827 (not start!20312) (not b_next!4971) (not b!200123) (not mapNonEmpty!8309))
(check-sat b_and!11717 (not b_next!4971))
