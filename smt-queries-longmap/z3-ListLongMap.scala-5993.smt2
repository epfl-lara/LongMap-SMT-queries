; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77812 () Bool)

(assert start!77812)

(declare-fun b_free!16371 () Bool)

(declare-fun b_next!16371 () Bool)

(assert (=> start!77812 (= b_free!16371 (not b_next!16371))))

(declare-fun tp!57377 () Bool)

(declare-fun b_and!26899 () Bool)

(assert (=> start!77812 (= tp!57377 b_and!26899)))

(declare-fun b!908268 () Bool)

(declare-fun res!613015 () Bool)

(declare-fun e!509054 () Bool)

(assert (=> b!908268 (=> (not res!613015) (not e!509054))))

(declare-datatypes ((array!53612 0))(
  ( (array!53613 (arr!25764 (Array (_ BitVec 32) (_ BitVec 64))) (size!26223 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53612)

(declare-datatypes ((List!18102 0))(
  ( (Nil!18099) (Cons!18098 (h!19244 (_ BitVec 64)) (t!25645 List!18102)) )
))
(declare-fun arrayNoDuplicates!0 (array!53612 (_ BitVec 32) List!18102) Bool)

(assert (=> b!908268 (= res!613015 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18099))))

(declare-fun b!908269 () Bool)

(declare-fun e!509055 () Bool)

(declare-fun tp_is_empty!18789 () Bool)

(assert (=> b!908269 (= e!509055 tp_is_empty!18789)))

(declare-fun b!908270 () Bool)

(declare-fun e!509050 () Bool)

(declare-fun e!509053 () Bool)

(declare-fun mapRes!29899 () Bool)

(assert (=> b!908270 (= e!509050 (and e!509053 mapRes!29899))))

(declare-fun condMapEmpty!29899 () Bool)

(declare-datatypes ((V!30017 0))(
  ( (V!30018 (val!9445 Int)) )
))
(declare-datatypes ((ValueCell!8913 0))(
  ( (ValueCellFull!8913 (v!11952 V!30017)) (EmptyCell!8913) )
))
(declare-datatypes ((array!53614 0))(
  ( (array!53615 (arr!25765 (Array (_ BitVec 32) ValueCell!8913)) (size!26224 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53614)

(declare-fun mapDefault!29899 () ValueCell!8913)

(assert (=> b!908270 (= condMapEmpty!29899 (= (arr!25765 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8913)) mapDefault!29899)))))

(declare-fun b!908271 () Bool)

(declare-fun res!613017 () Bool)

(declare-fun e!509049 () Bool)

(assert (=> b!908271 (=> res!613017 e!509049)))

(declare-fun lt!409654 () V!30017)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-datatypes ((tuple2!12304 0))(
  ( (tuple2!12305 (_1!6163 (_ BitVec 64)) (_2!6163 V!30017)) )
))
(declare-datatypes ((List!18103 0))(
  ( (Nil!18100) (Cons!18099 (h!19245 tuple2!12304) (t!25646 List!18103)) )
))
(declare-datatypes ((ListLongMap!11001 0))(
  ( (ListLongMap!11002 (toList!5516 List!18103)) )
))
(declare-fun lt!409653 () ListLongMap!11001)

(declare-fun apply!500 (ListLongMap!11001 (_ BitVec 64)) V!30017)

(assert (=> b!908271 (= res!613017 (not (= (apply!500 lt!409653 k0!1033) lt!409654)))))

(declare-fun b!908272 () Bool)

(declare-fun res!613018 () Bool)

(declare-fun e!509051 () Bool)

(assert (=> b!908272 (=> (not res!613018) (not e!509051))))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!908272 (= res!613018 (and (= (select (arr!25764 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!908273 () Bool)

(declare-fun res!613016 () Bool)

(assert (=> b!908273 (=> (not res!613016) (not e!509051))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!908273 (= res!613016 (inRange!0 i!717 mask!1756))))

(declare-fun mapNonEmpty!29899 () Bool)

(declare-fun tp!57378 () Bool)

(assert (=> mapNonEmpty!29899 (= mapRes!29899 (and tp!57378 e!509055))))

(declare-fun mapValue!29899 () ValueCell!8913)

(declare-fun mapRest!29899 () (Array (_ BitVec 32) ValueCell!8913))

(declare-fun mapKey!29899 () (_ BitVec 32))

(assert (=> mapNonEmpty!29899 (= (arr!25765 _values!1152) (store mapRest!29899 mapKey!29899 mapValue!29899))))

(declare-fun b!908274 () Bool)

(assert (=> b!908274 (= e!509053 tp_is_empty!18789)))

(declare-fun b!908275 () Bool)

(declare-fun e!509052 () Bool)

(assert (=> b!908275 (= e!509052 e!509049)))

(declare-fun res!613023 () Bool)

(assert (=> b!908275 (=> res!613023 e!509049)))

(declare-fun contains!4559 (ListLongMap!11001 (_ BitVec 64)) Bool)

(assert (=> b!908275 (= res!613023 (not (contains!4559 lt!409653 k0!1033)))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30017)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30017)

(declare-fun getCurrentListMap!2779 (array!53612 array!53614 (_ BitVec 32) (_ BitVec 32) V!30017 V!30017 (_ BitVec 32) Int) ListLongMap!11001)

(assert (=> b!908275 (= lt!409653 (getCurrentListMap!2779 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!908276 () Bool)

(declare-fun res!613019 () Bool)

(assert (=> b!908276 (=> (not res!613019) (not e!509054))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53612 (_ BitVec 32)) Bool)

(assert (=> b!908276 (= res!613019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun res!613014 () Bool)

(assert (=> start!77812 (=> (not res!613014) (not e!509054))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77812 (= res!613014 (validMask!0 mask!1756))))

(assert (=> start!77812 e!509054))

(declare-fun array_inv!20174 (array!53614) Bool)

(assert (=> start!77812 (and (array_inv!20174 _values!1152) e!509050)))

(assert (=> start!77812 tp!57377))

(assert (=> start!77812 true))

(assert (=> start!77812 tp_is_empty!18789))

(declare-fun array_inv!20175 (array!53612) Bool)

(assert (=> start!77812 (array_inv!20175 _keys!1386)))

(declare-fun b!908277 () Bool)

(declare-fun res!613021 () Bool)

(assert (=> b!908277 (=> (not res!613021) (not e!509054))))

(assert (=> b!908277 (= res!613021 (and (= (size!26224 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26223 _keys!1386) (size!26224 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!908278 () Bool)

(assert (=> b!908278 (= e!509049 true)))

(declare-fun lt!409655 () ListLongMap!11001)

(assert (=> b!908278 (= (apply!500 lt!409655 k0!1033) lt!409654)))

(declare-datatypes ((Unit!30828 0))(
  ( (Unit!30829) )
))
(declare-fun lt!409651 () Unit!30828)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!52 (array!53612 array!53614 (_ BitVec 32) (_ BitVec 32) V!30017 V!30017 (_ BitVec 64) V!30017 (_ BitVec 32) Int) Unit!30828)

(assert (=> b!908278 (= lt!409651 (lemmaListMapApplyFromThenApplyFromZero!52 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409654 i!717 defaultEntry!1160))))

(declare-fun b!908279 () Bool)

(assert (=> b!908279 (= e!509054 e!509051)))

(declare-fun res!613022 () Bool)

(assert (=> b!908279 (=> (not res!613022) (not e!509051))))

(assert (=> b!908279 (= res!613022 (contains!4559 lt!409655 k0!1033))))

(assert (=> b!908279 (= lt!409655 (getCurrentListMap!2779 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun mapIsEmpty!29899 () Bool)

(assert (=> mapIsEmpty!29899 mapRes!29899))

(declare-fun b!908280 () Bool)

(assert (=> b!908280 (= e!509051 (not e!509052))))

(declare-fun res!613020 () Bool)

(assert (=> b!908280 (=> res!613020 e!509052)))

(assert (=> b!908280 (= res!613020 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26223 _keys!1386))))))

(declare-fun get!13562 (ValueCell!8913 V!30017) V!30017)

(declare-fun dynLambda!1375 (Int (_ BitVec 64)) V!30017)

(assert (=> b!908280 (= lt!409654 (get!13562 (select (arr!25765 _values!1152) i!717) (dynLambda!1375 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53612 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!908280 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!409652 () Unit!30828)

(declare-fun lemmaKeyInListMapIsInArray!247 (array!53612 array!53614 (_ BitVec 32) (_ BitVec 32) V!30017 V!30017 (_ BitVec 64) Int) Unit!30828)

(assert (=> b!908280 (= lt!409652 (lemmaKeyInListMapIsInArray!247 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(assert (= (and start!77812 res!613014) b!908277))

(assert (= (and b!908277 res!613021) b!908276))

(assert (= (and b!908276 res!613019) b!908268))

(assert (= (and b!908268 res!613015) b!908279))

(assert (= (and b!908279 res!613022) b!908273))

(assert (= (and b!908273 res!613016) b!908272))

(assert (= (and b!908272 res!613018) b!908280))

(assert (= (and b!908280 (not res!613020)) b!908275))

(assert (= (and b!908275 (not res!613023)) b!908271))

(assert (= (and b!908271 (not res!613017)) b!908278))

(assert (= (and b!908270 condMapEmpty!29899) mapIsEmpty!29899))

(assert (= (and b!908270 (not condMapEmpty!29899)) mapNonEmpty!29899))

(get-info :version)

(assert (= (and mapNonEmpty!29899 ((_ is ValueCellFull!8913) mapValue!29899)) b!908269))

(assert (= (and b!908270 ((_ is ValueCellFull!8913) mapDefault!29899)) b!908274))

(assert (= start!77812 b!908270))

(declare-fun b_lambda!13255 () Bool)

(assert (=> (not b_lambda!13255) (not b!908280)))

(declare-fun t!25644 () Bool)

(declare-fun tb!5393 () Bool)

(assert (=> (and start!77812 (= defaultEntry!1160 defaultEntry!1160) t!25644) tb!5393))

(declare-fun result!10583 () Bool)

(assert (=> tb!5393 (= result!10583 tp_is_empty!18789)))

(assert (=> b!908280 t!25644))

(declare-fun b_and!26901 () Bool)

(assert (= b_and!26899 (and (=> t!25644 result!10583) b_and!26901)))

(declare-fun m!843609 () Bool)

(assert (=> b!908273 m!843609))

(declare-fun m!843611 () Bool)

(assert (=> b!908275 m!843611))

(declare-fun m!843613 () Bool)

(assert (=> b!908275 m!843613))

(declare-fun m!843615 () Bool)

(assert (=> b!908276 m!843615))

(declare-fun m!843617 () Bool)

(assert (=> b!908272 m!843617))

(declare-fun m!843619 () Bool)

(assert (=> start!77812 m!843619))

(declare-fun m!843621 () Bool)

(assert (=> start!77812 m!843621))

(declare-fun m!843623 () Bool)

(assert (=> start!77812 m!843623))

(declare-fun m!843625 () Bool)

(assert (=> b!908278 m!843625))

(declare-fun m!843627 () Bool)

(assert (=> b!908278 m!843627))

(declare-fun m!843629 () Bool)

(assert (=> b!908279 m!843629))

(declare-fun m!843631 () Bool)

(assert (=> b!908279 m!843631))

(declare-fun m!843633 () Bool)

(assert (=> b!908268 m!843633))

(declare-fun m!843635 () Bool)

(assert (=> b!908280 m!843635))

(declare-fun m!843637 () Bool)

(assert (=> b!908280 m!843637))

(declare-fun m!843639 () Bool)

(assert (=> b!908280 m!843639))

(declare-fun m!843641 () Bool)

(assert (=> b!908280 m!843641))

(assert (=> b!908280 m!843635))

(assert (=> b!908280 m!843639))

(declare-fun m!843643 () Bool)

(assert (=> b!908280 m!843643))

(declare-fun m!843645 () Bool)

(assert (=> mapNonEmpty!29899 m!843645))

(declare-fun m!843647 () Bool)

(assert (=> b!908271 m!843647))

(check-sat (not b!908268) (not b!908271) (not b!908275) (not b!908280) tp_is_empty!18789 (not b!908276) (not start!77812) (not b!908278) b_and!26901 (not b!908273) (not b_next!16371) (not b!908279) (not b_lambda!13255) (not mapNonEmpty!29899))
(check-sat b_and!26901 (not b_next!16371))
