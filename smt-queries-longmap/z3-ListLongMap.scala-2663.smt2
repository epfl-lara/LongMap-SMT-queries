; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39798 () Bool)

(assert start!39798)

(declare-fun b_free!10065 () Bool)

(declare-fun b_next!10065 () Bool)

(assert (=> start!39798 (= b_free!10065 (not b_next!10065))))

(declare-fun tp!35723 () Bool)

(declare-fun b_and!17789 () Bool)

(assert (=> start!39798 (= tp!35723 b_and!17789)))

(declare-fun b!429256 () Bool)

(declare-fun res!252075 () Bool)

(declare-fun e!254273 () Bool)

(assert (=> b!429256 (=> (not res!252075) (not e!254273))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!429256 (= res!252075 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!18447 () Bool)

(declare-fun mapRes!18447 () Bool)

(assert (=> mapIsEmpty!18447 mapRes!18447))

(declare-fun b!429258 () Bool)

(declare-fun res!252071 () Bool)

(assert (=> b!429258 (=> (not res!252071) (not e!254273))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!26271 0))(
  ( (array!26272 (arr!12585 (Array (_ BitVec 32) (_ BitVec 64))) (size!12937 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26271)

(assert (=> b!429258 (= res!252071 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12937 _keys!709))))))

(declare-fun b!429259 () Bool)

(declare-fun e!254279 () Bool)

(assert (=> b!429259 (= e!254273 e!254279)))

(declare-fun res!252084 () Bool)

(assert (=> b!429259 (=> (not res!252084) (not e!254279))))

(declare-fun lt!196170 () array!26271)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26271 (_ BitVec 32)) Bool)

(assert (=> b!429259 (= res!252084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!196170 mask!1025))))

(assert (=> b!429259 (= lt!196170 (array!26272 (store (arr!12585 _keys!709) i!563 k0!794) (size!12937 _keys!709)))))

(declare-fun b!429260 () Bool)

(declare-fun res!252077 () Bool)

(assert (=> b!429260 (=> (not res!252077) (not e!254273))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!429260 (= res!252077 (validMask!0 mask!1025))))

(declare-fun b!429261 () Bool)

(declare-fun res!252080 () Bool)

(assert (=> b!429261 (=> (not res!252080) (not e!254273))))

(declare-fun arrayContainsKey!0 (array!26271 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!429261 (= res!252080 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!429262 () Bool)

(declare-fun e!254278 () Bool)

(assert (=> b!429262 (= e!254278 true)))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!429262 (not (= (select (arr!12585 _keys!709) from!863) k0!794))))

(declare-datatypes ((Unit!12609 0))(
  ( (Unit!12610) )
))
(declare-fun lt!196172 () Unit!12609)

(declare-fun e!254280 () Unit!12609)

(assert (=> b!429262 (= lt!196172 e!254280)))

(declare-fun c!55433 () Bool)

(assert (=> b!429262 (= c!55433 (= (select (arr!12585 _keys!709) from!863) k0!794))))

(declare-datatypes ((V!16061 0))(
  ( (V!16062 (val!5653 Int)) )
))
(declare-datatypes ((tuple2!7444 0))(
  ( (tuple2!7445 (_1!3733 (_ BitVec 64)) (_2!3733 V!16061)) )
))
(declare-datatypes ((List!7459 0))(
  ( (Nil!7456) (Cons!7455 (h!8311 tuple2!7444) (t!12973 List!7459)) )
))
(declare-datatypes ((ListLongMap!6357 0))(
  ( (ListLongMap!6358 (toList!3194 List!7459)) )
))
(declare-fun lt!196168 () ListLongMap!6357)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5265 0))(
  ( (ValueCellFull!5265 (v!7900 V!16061)) (EmptyCell!5265) )
))
(declare-datatypes ((array!26273 0))(
  ( (array!26274 (arr!12586 (Array (_ BitVec 32) ValueCell!5265)) (size!12938 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26273)

(declare-fun lt!196166 () ListLongMap!6357)

(declare-fun +!1344 (ListLongMap!6357 tuple2!7444) ListLongMap!6357)

(declare-fun get!6240 (ValueCell!5265 V!16061) V!16061)

(declare-fun dynLambda!771 (Int (_ BitVec 64)) V!16061)

(assert (=> b!429262 (= lt!196168 (+!1344 lt!196166 (tuple2!7445 (select (arr!12585 _keys!709) from!863) (get!6240 (select (arr!12586 _values!549) from!863) (dynLambda!771 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!429263 () Bool)

(declare-fun res!252078 () Bool)

(assert (=> b!429263 (=> (not res!252078) (not e!254279))))

(assert (=> b!429263 (= res!252078 (bvsle from!863 i!563))))

(declare-fun b!429264 () Bool)

(declare-fun e!254277 () Bool)

(assert (=> b!429264 (= e!254277 (not e!254278))))

(declare-fun res!252083 () Bool)

(assert (=> b!429264 (=> res!252083 e!254278)))

(assert (=> b!429264 (= res!252083 (not (validKeyInArray!0 (select (arr!12585 _keys!709) from!863))))))

(declare-fun lt!196167 () ListLongMap!6357)

(assert (=> b!429264 (= lt!196167 lt!196166)))

(declare-fun v!412 () V!16061)

(declare-fun lt!196169 () ListLongMap!6357)

(assert (=> b!429264 (= lt!196166 (+!1344 lt!196169 (tuple2!7445 k0!794 v!412)))))

(declare-fun minValue!515 () V!16061)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!196174 () array!26273)

(declare-fun zeroValue!515 () V!16061)

(declare-fun getCurrentListMapNoExtraKeys!1396 (array!26271 array!26273 (_ BitVec 32) (_ BitVec 32) V!16061 V!16061 (_ BitVec 32) Int) ListLongMap!6357)

(assert (=> b!429264 (= lt!196167 (getCurrentListMapNoExtraKeys!1396 lt!196170 lt!196174 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!429264 (= lt!196169 (getCurrentListMapNoExtraKeys!1396 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!196173 () Unit!12609)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!533 (array!26271 array!26273 (_ BitVec 32) (_ BitVec 32) V!16061 V!16061 (_ BitVec 32) (_ BitVec 64) V!16061 (_ BitVec 32) Int) Unit!12609)

(assert (=> b!429264 (= lt!196173 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!533 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!18447 () Bool)

(declare-fun tp!35724 () Bool)

(declare-fun e!254272 () Bool)

(assert (=> mapNonEmpty!18447 (= mapRes!18447 (and tp!35724 e!254272))))

(declare-fun mapValue!18447 () ValueCell!5265)

(declare-fun mapRest!18447 () (Array (_ BitVec 32) ValueCell!5265))

(declare-fun mapKey!18447 () (_ BitVec 32))

(assert (=> mapNonEmpty!18447 (= (arr!12586 _values!549) (store mapRest!18447 mapKey!18447 mapValue!18447))))

(declare-fun b!429265 () Bool)

(declare-fun res!252074 () Bool)

(assert (=> b!429265 (=> (not res!252074) (not e!254273))))

(assert (=> b!429265 (= res!252074 (or (= (select (arr!12585 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12585 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!429266 () Bool)

(declare-fun Unit!12611 () Unit!12609)

(assert (=> b!429266 (= e!254280 Unit!12611)))

(declare-fun res!252081 () Bool)

(assert (=> start!39798 (=> (not res!252081) (not e!254273))))

(assert (=> start!39798 (= res!252081 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12937 _keys!709))))))

(assert (=> start!39798 e!254273))

(declare-fun tp_is_empty!11217 () Bool)

(assert (=> start!39798 tp_is_empty!11217))

(assert (=> start!39798 tp!35723))

(assert (=> start!39798 true))

(declare-fun e!254276 () Bool)

(declare-fun array_inv!9170 (array!26273) Bool)

(assert (=> start!39798 (and (array_inv!9170 _values!549) e!254276)))

(declare-fun array_inv!9171 (array!26271) Bool)

(assert (=> start!39798 (array_inv!9171 _keys!709)))

(declare-fun b!429257 () Bool)

(assert (=> b!429257 (= e!254272 tp_is_empty!11217)))

(declare-fun b!429267 () Bool)

(declare-fun Unit!12612 () Unit!12609)

(assert (=> b!429267 (= e!254280 Unit!12612)))

(declare-fun lt!196171 () Unit!12609)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26271 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12609)

(assert (=> b!429267 (= lt!196171 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!429267 false))

(declare-fun b!429268 () Bool)

(declare-fun e!254275 () Bool)

(assert (=> b!429268 (= e!254275 tp_is_empty!11217)))

(declare-fun b!429269 () Bool)

(declare-fun res!252076 () Bool)

(assert (=> b!429269 (=> (not res!252076) (not e!254273))))

(assert (=> b!429269 (= res!252076 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!429270 () Bool)

(assert (=> b!429270 (= e!254279 e!254277)))

(declare-fun res!252082 () Bool)

(assert (=> b!429270 (=> (not res!252082) (not e!254277))))

(assert (=> b!429270 (= res!252082 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!429270 (= lt!196168 (getCurrentListMapNoExtraKeys!1396 lt!196170 lt!196174 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!429270 (= lt!196174 (array!26274 (store (arr!12586 _values!549) i!563 (ValueCellFull!5265 v!412)) (size!12938 _values!549)))))

(declare-fun lt!196175 () ListLongMap!6357)

(assert (=> b!429270 (= lt!196175 (getCurrentListMapNoExtraKeys!1396 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!429271 () Bool)

(declare-fun res!252072 () Bool)

(assert (=> b!429271 (=> (not res!252072) (not e!254273))))

(declare-datatypes ((List!7460 0))(
  ( (Nil!7457) (Cons!7456 (h!8312 (_ BitVec 64)) (t!12974 List!7460)) )
))
(declare-fun arrayNoDuplicates!0 (array!26271 (_ BitVec 32) List!7460) Bool)

(assert (=> b!429271 (= res!252072 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7457))))

(declare-fun b!429272 () Bool)

(declare-fun res!252073 () Bool)

(assert (=> b!429272 (=> (not res!252073) (not e!254279))))

(assert (=> b!429272 (= res!252073 (arrayNoDuplicates!0 lt!196170 #b00000000000000000000000000000000 Nil!7457))))

(declare-fun b!429273 () Bool)

(declare-fun res!252079 () Bool)

(assert (=> b!429273 (=> (not res!252079) (not e!254273))))

(assert (=> b!429273 (= res!252079 (and (= (size!12938 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12937 _keys!709) (size!12938 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!429274 () Bool)

(assert (=> b!429274 (= e!254276 (and e!254275 mapRes!18447))))

(declare-fun condMapEmpty!18447 () Bool)

(declare-fun mapDefault!18447 () ValueCell!5265)

(assert (=> b!429274 (= condMapEmpty!18447 (= (arr!12586 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5265)) mapDefault!18447)))))

(assert (= (and start!39798 res!252081) b!429260))

(assert (= (and b!429260 res!252077) b!429273))

(assert (= (and b!429273 res!252079) b!429269))

(assert (= (and b!429269 res!252076) b!429271))

(assert (= (and b!429271 res!252072) b!429258))

(assert (= (and b!429258 res!252071) b!429256))

(assert (= (and b!429256 res!252075) b!429265))

(assert (= (and b!429265 res!252074) b!429261))

(assert (= (and b!429261 res!252080) b!429259))

(assert (= (and b!429259 res!252084) b!429272))

(assert (= (and b!429272 res!252073) b!429263))

(assert (= (and b!429263 res!252078) b!429270))

(assert (= (and b!429270 res!252082) b!429264))

(assert (= (and b!429264 (not res!252083)) b!429262))

(assert (= (and b!429262 c!55433) b!429267))

(assert (= (and b!429262 (not c!55433)) b!429266))

(assert (= (and b!429274 condMapEmpty!18447) mapIsEmpty!18447))

(assert (= (and b!429274 (not condMapEmpty!18447)) mapNonEmpty!18447))

(get-info :version)

(assert (= (and mapNonEmpty!18447 ((_ is ValueCellFull!5265) mapValue!18447)) b!429257))

(assert (= (and b!429274 ((_ is ValueCellFull!5265) mapDefault!18447)) b!429268))

(assert (= start!39798 b!429274))

(declare-fun b_lambda!9153 () Bool)

(assert (=> (not b_lambda!9153) (not b!429262)))

(declare-fun t!12972 () Bool)

(declare-fun tb!3471 () Bool)

(assert (=> (and start!39798 (= defaultEntry!557 defaultEntry!557) t!12972) tb!3471))

(declare-fun result!6469 () Bool)

(assert (=> tb!3471 (= result!6469 tp_is_empty!11217)))

(assert (=> b!429262 t!12972))

(declare-fun b_and!17791 () Bool)

(assert (= b_and!17789 (and (=> t!12972 result!6469) b_and!17791)))

(declare-fun m!417589 () Bool)

(assert (=> b!429261 m!417589))

(declare-fun m!417591 () Bool)

(assert (=> b!429265 m!417591))

(declare-fun m!417593 () Bool)

(assert (=> mapNonEmpty!18447 m!417593))

(declare-fun m!417595 () Bool)

(assert (=> start!39798 m!417595))

(declare-fun m!417597 () Bool)

(assert (=> start!39798 m!417597))

(declare-fun m!417599 () Bool)

(assert (=> b!429256 m!417599))

(declare-fun m!417601 () Bool)

(assert (=> b!429262 m!417601))

(declare-fun m!417603 () Bool)

(assert (=> b!429262 m!417603))

(declare-fun m!417605 () Bool)

(assert (=> b!429262 m!417605))

(declare-fun m!417607 () Bool)

(assert (=> b!429262 m!417607))

(assert (=> b!429262 m!417607))

(assert (=> b!429262 m!417603))

(declare-fun m!417609 () Bool)

(assert (=> b!429262 m!417609))

(declare-fun m!417611 () Bool)

(assert (=> b!429259 m!417611))

(declare-fun m!417613 () Bool)

(assert (=> b!429259 m!417613))

(declare-fun m!417615 () Bool)

(assert (=> b!429272 m!417615))

(declare-fun m!417617 () Bool)

(assert (=> b!429269 m!417617))

(declare-fun m!417619 () Bool)

(assert (=> b!429271 m!417619))

(assert (=> b!429264 m!417601))

(declare-fun m!417621 () Bool)

(assert (=> b!429264 m!417621))

(declare-fun m!417623 () Bool)

(assert (=> b!429264 m!417623))

(declare-fun m!417625 () Bool)

(assert (=> b!429264 m!417625))

(assert (=> b!429264 m!417601))

(declare-fun m!417627 () Bool)

(assert (=> b!429264 m!417627))

(declare-fun m!417629 () Bool)

(assert (=> b!429264 m!417629))

(declare-fun m!417631 () Bool)

(assert (=> b!429260 m!417631))

(declare-fun m!417633 () Bool)

(assert (=> b!429267 m!417633))

(declare-fun m!417635 () Bool)

(assert (=> b!429270 m!417635))

(declare-fun m!417637 () Bool)

(assert (=> b!429270 m!417637))

(declare-fun m!417639 () Bool)

(assert (=> b!429270 m!417639))

(check-sat tp_is_empty!11217 (not b!429271) (not b!429262) (not b!429259) b_and!17791 (not b!429264) (not b!429272) (not b_lambda!9153) (not start!39798) (not b_next!10065) (not b!429261) (not b!429269) (not mapNonEmpty!18447) (not b!429270) (not b!429267) (not b!429256) (not b!429260))
(check-sat b_and!17791 (not b_next!10065))
