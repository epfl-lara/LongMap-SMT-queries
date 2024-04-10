; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72982 () Bool)

(assert start!72982)

(declare-fun b_free!13897 () Bool)

(declare-fun b_next!13897 () Bool)

(assert (=> start!72982 (= b_free!13897 (not b_next!13897))))

(declare-fun tp!49195 () Bool)

(declare-fun b_and!22983 () Bool)

(assert (=> start!72982 (= tp!49195 b_and!22983)))

(declare-fun b!847798 () Bool)

(declare-fun res!576013 () Bool)

(declare-fun e!473061 () Bool)

(assert (=> b!847798 (=> (not res!576013) (not e!473061))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48276 0))(
  ( (array!48277 (arr!23169 (Array (_ BitVec 32) (_ BitVec 64))) (size!23609 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48276)

(assert (=> b!847798 (= res!576013 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23609 _keys!868))))))

(declare-fun b!847799 () Bool)

(declare-fun e!473065 () Bool)

(assert (=> b!847799 (= e!473065 (not true))))

(declare-fun e!473062 () Bool)

(assert (=> b!847799 e!473062))

(declare-fun c!91516 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!847799 (= c!91516 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28953 0))(
  ( (Unit!28954) )
))
(declare-fun lt!381840 () Unit!28953)

(declare-datatypes ((V!26425 0))(
  ( (V!26426 (val!8064 Int)) )
))
(declare-fun v!557 () V!26425)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((ValueCell!7577 0))(
  ( (ValueCellFull!7577 (v!10489 V!26425)) (EmptyCell!7577) )
))
(declare-datatypes ((array!48278 0))(
  ( (array!48279 (arr!23170 (Array (_ BitVec 32) ValueCell!7577)) (size!23610 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48278)

(declare-fun minValue!654 () V!26425)

(declare-fun zeroValue!654 () V!26425)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!322 (array!48276 array!48278 (_ BitVec 32) (_ BitVec 32) V!26425 V!26425 (_ BitVec 32) (_ BitVec 64) V!26425 (_ BitVec 32) Int) Unit!28953)

(assert (=> b!847799 (= lt!381840 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!322 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!576019 () Bool)

(assert (=> start!72982 (=> (not res!576019) (not e!473061))))

(assert (=> start!72982 (= res!576019 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23609 _keys!868))))))

(assert (=> start!72982 e!473061))

(declare-fun tp_is_empty!16033 () Bool)

(assert (=> start!72982 tp_is_empty!16033))

(assert (=> start!72982 true))

(assert (=> start!72982 tp!49195))

(declare-fun array_inv!18400 (array!48276) Bool)

(assert (=> start!72982 (array_inv!18400 _keys!868)))

(declare-fun e!473060 () Bool)

(declare-fun array_inv!18401 (array!48278) Bool)

(assert (=> start!72982 (and (array_inv!18401 _values!688) e!473060)))

(declare-fun b!847800 () Bool)

(declare-fun res!576018 () Bool)

(assert (=> b!847800 (=> (not res!576018) (not e!473061))))

(declare-datatypes ((List!16396 0))(
  ( (Nil!16393) (Cons!16392 (h!17523 (_ BitVec 64)) (t!22767 List!16396)) )
))
(declare-fun arrayNoDuplicates!0 (array!48276 (_ BitVec 32) List!16396) Bool)

(assert (=> b!847800 (= res!576018 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16393))))

(declare-fun b!847801 () Bool)

(declare-fun res!576014 () Bool)

(assert (=> b!847801 (=> (not res!576014) (not e!473061))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!847801 (= res!576014 (validMask!0 mask!1196))))

(declare-fun b!847802 () Bool)

(declare-fun res!576012 () Bool)

(assert (=> b!847802 (=> (not res!576012) (not e!473061))))

(assert (=> b!847802 (= res!576012 (and (= (size!23610 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23609 _keys!868) (size!23610 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!847803 () Bool)

(declare-fun e!473063 () Bool)

(assert (=> b!847803 (= e!473063 tp_is_empty!16033)))

(declare-fun bm!37543 () Bool)

(declare-datatypes ((tuple2!10538 0))(
  ( (tuple2!10539 (_1!5280 (_ BitVec 64)) (_2!5280 V!26425)) )
))
(declare-datatypes ((List!16397 0))(
  ( (Nil!16394) (Cons!16393 (h!17524 tuple2!10538) (t!22768 List!16397)) )
))
(declare-datatypes ((ListLongMap!9307 0))(
  ( (ListLongMap!9308 (toList!4669 List!16397)) )
))
(declare-fun call!37546 () ListLongMap!9307)

(declare-fun getCurrentListMapNoExtraKeys!2653 (array!48276 array!48278 (_ BitVec 32) (_ BitVec 32) V!26425 V!26425 (_ BitVec 32) Int) ListLongMap!9307)

(assert (=> bm!37543 (= call!37546 (getCurrentListMapNoExtraKeys!2653 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!847804 () Bool)

(declare-fun res!576017 () Bool)

(assert (=> b!847804 (=> (not res!576017) (not e!473061))))

(assert (=> b!847804 (= res!576017 (and (= (select (arr!23169 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!25649 () Bool)

(declare-fun mapRes!25649 () Bool)

(assert (=> mapIsEmpty!25649 mapRes!25649))

(declare-fun b!847805 () Bool)

(declare-fun e!473064 () Bool)

(assert (=> b!847805 (= e!473064 tp_is_empty!16033)))

(declare-fun b!847806 () Bool)

(assert (=> b!847806 (= e!473060 (and e!473063 mapRes!25649))))

(declare-fun condMapEmpty!25649 () Bool)

(declare-fun mapDefault!25649 () ValueCell!7577)

