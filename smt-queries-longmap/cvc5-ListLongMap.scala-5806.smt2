; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74908 () Bool)

(assert start!74908)

(declare-fun b_free!15427 () Bool)

(declare-fun b_next!15427 () Bool)

(assert (=> start!74908 (= b_free!15427 (not b_next!15427))))

(declare-fun tp!53983 () Bool)

(declare-fun b_and!25553 () Bool)

(assert (=> start!74908 (= tp!53983 b_and!25553)))

(declare-fun b!883226 () Bool)

(declare-datatypes ((Unit!30122 0))(
  ( (Unit!30123) )
))
(declare-fun e!491555 () Unit!30122)

(declare-fun Unit!30124 () Unit!30122)

(assert (=> b!883226 (= e!491555 Unit!30124)))

(declare-fun b!883227 () Bool)

(declare-fun e!491557 () Bool)

(declare-fun tp_is_empty!17671 () Bool)

(assert (=> b!883227 (= e!491557 tp_is_empty!17671)))

(declare-fun b!883228 () Bool)

(declare-fun e!491556 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!51468 0))(
  ( (array!51469 (arr!24753 (Array (_ BitVec 32) (_ BitVec 64))) (size!25193 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51468)

(assert (=> b!883228 (= e!491556 (bvslt from!1053 (size!25193 _keys!868)))))

(declare-fun lt!399695 () Unit!30122)

(assert (=> b!883228 (= lt!399695 e!491555)))

(declare-fun c!93046 () Bool)

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!883228 (= c!93046 (= (select (arr!24753 _keys!868) from!1053) k!854))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!28609 0))(
  ( (V!28610 (val!8883 Int)) )
))
(declare-datatypes ((ValueCell!8396 0))(
  ( (ValueCellFull!8396 (v!11352 V!28609)) (EmptyCell!8396) )
))
(declare-datatypes ((array!51470 0))(
  ( (array!51471 (arr!24754 (Array (_ BitVec 32) ValueCell!8396)) (size!25194 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51470)

(declare-datatypes ((tuple2!11768 0))(
  ( (tuple2!11769 (_1!5895 (_ BitVec 64)) (_2!5895 V!28609)) )
))
(declare-datatypes ((List!17577 0))(
  ( (Nil!17574) (Cons!17573 (h!18704 tuple2!11768) (t!24806 List!17577)) )
))
(declare-datatypes ((ListLongMap!10537 0))(
  ( (ListLongMap!10538 (toList!5284 List!17577)) )
))
(declare-fun lt!399699 () ListLongMap!10537)

(declare-fun lt!399704 () ListLongMap!10537)

(declare-fun +!2553 (ListLongMap!10537 tuple2!11768) ListLongMap!10537)

(declare-fun get!13041 (ValueCell!8396 V!28609) V!28609)

(declare-fun dynLambda!1266 (Int (_ BitVec 64)) V!28609)

(assert (=> b!883228 (= lt!399704 (+!2553 lt!399699 (tuple2!11769 (select (arr!24753 _keys!868) from!1053) (get!13041 (select (arr!24754 _values!688) from!1053) (dynLambda!1266 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapIsEmpty!28143 () Bool)

(declare-fun mapRes!28143 () Bool)

(assert (=> mapIsEmpty!28143 mapRes!28143))

(declare-fun mapNonEmpty!28143 () Bool)

(declare-fun tp!53984 () Bool)

(assert (=> mapNonEmpty!28143 (= mapRes!28143 (and tp!53984 e!491557))))

(declare-fun mapKey!28143 () (_ BitVec 32))

(declare-fun mapRest!28143 () (Array (_ BitVec 32) ValueCell!8396))

(declare-fun mapValue!28143 () ValueCell!8396)

(assert (=> mapNonEmpty!28143 (= (arr!24754 _values!688) (store mapRest!28143 mapKey!28143 mapValue!28143))))

(declare-fun b!883230 () Bool)

(declare-fun e!491562 () Bool)

(assert (=> b!883230 (= e!491562 (not e!491556))))

(declare-fun res!600056 () Bool)

(assert (=> b!883230 (=> res!600056 e!491556)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!883230 (= res!600056 (not (validKeyInArray!0 (select (arr!24753 _keys!868) from!1053))))))

(declare-fun lt!399696 () ListLongMap!10537)

(assert (=> b!883230 (= lt!399696 lt!399699)))

(declare-fun lt!399703 () ListLongMap!10537)

(declare-fun v!557 () V!28609)

(assert (=> b!883230 (= lt!399699 (+!2553 lt!399703 (tuple2!11769 k!854 v!557)))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!28609)

(declare-fun zeroValue!654 () V!28609)

(declare-fun lt!399698 () array!51470)

(declare-fun getCurrentListMapNoExtraKeys!3244 (array!51468 array!51470 (_ BitVec 32) (_ BitVec 32) V!28609 V!28609 (_ BitVec 32) Int) ListLongMap!10537)

(assert (=> b!883230 (= lt!399696 (getCurrentListMapNoExtraKeys!3244 _keys!868 lt!399698 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!883230 (= lt!399703 (getCurrentListMapNoExtraKeys!3244 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lt!399701 () Unit!30122)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!739 (array!51468 array!51470 (_ BitVec 32) (_ BitVec 32) V!28609 V!28609 (_ BitVec 32) (_ BitVec 64) V!28609 (_ BitVec 32) Int) Unit!30122)

(assert (=> b!883230 (= lt!399701 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!739 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!883231 () Bool)

(declare-fun res!600063 () Bool)

(declare-fun e!491561 () Bool)

(assert (=> b!883231 (=> (not res!600063) (not e!491561))))

(assert (=> b!883231 (= res!600063 (validKeyInArray!0 k!854))))

(declare-fun b!883232 () Bool)

(declare-fun res!600059 () Bool)

(assert (=> b!883232 (=> (not res!600059) (not e!491561))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51468 (_ BitVec 32)) Bool)

(assert (=> b!883232 (= res!600059 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!883233 () Bool)

(declare-fun res!600060 () Bool)

(assert (=> b!883233 (=> (not res!600060) (not e!491561))))

(declare-datatypes ((List!17578 0))(
  ( (Nil!17575) (Cons!17574 (h!18705 (_ BitVec 64)) (t!24807 List!17578)) )
))
(declare-fun arrayNoDuplicates!0 (array!51468 (_ BitVec 32) List!17578) Bool)

(assert (=> b!883233 (= res!600060 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17575))))

(declare-fun b!883234 () Bool)

(declare-fun res!600055 () Bool)

(assert (=> b!883234 (=> (not res!600055) (not e!491561))))

(assert (=> b!883234 (= res!600055 (and (= (select (arr!24753 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!883229 () Bool)

(assert (=> b!883229 (= e!491561 e!491562)))

(declare-fun res!600062 () Bool)

(assert (=> b!883229 (=> (not res!600062) (not e!491562))))

(assert (=> b!883229 (= res!600062 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!883229 (= lt!399704 (getCurrentListMapNoExtraKeys!3244 _keys!868 lt!399698 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!883229 (= lt!399698 (array!51471 (store (arr!24754 _values!688) i!612 (ValueCellFull!8396 v!557)) (size!25194 _values!688)))))

(declare-fun lt!399697 () ListLongMap!10537)

(assert (=> b!883229 (= lt!399697 (getCurrentListMapNoExtraKeys!3244 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!600057 () Bool)

(assert (=> start!74908 (=> (not res!600057) (not e!491561))))

(assert (=> start!74908 (= res!600057 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25193 _keys!868))))))

(assert (=> start!74908 e!491561))

(assert (=> start!74908 tp_is_empty!17671))

(assert (=> start!74908 true))

(assert (=> start!74908 tp!53983))

(declare-fun array_inv!19490 (array!51468) Bool)

(assert (=> start!74908 (array_inv!19490 _keys!868)))

(declare-fun e!491559 () Bool)

(declare-fun array_inv!19491 (array!51470) Bool)

(assert (=> start!74908 (and (array_inv!19491 _values!688) e!491559)))

(declare-fun b!883235 () Bool)

(declare-fun e!491560 () Bool)

(assert (=> b!883235 (= e!491559 (and e!491560 mapRes!28143))))

(declare-fun condMapEmpty!28143 () Bool)

(declare-fun mapDefault!28143 () ValueCell!8396)

