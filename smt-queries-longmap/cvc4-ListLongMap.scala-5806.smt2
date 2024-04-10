; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74912 () Bool)

(assert start!74912)

(declare-fun b_free!15431 () Bool)

(declare-fun b_next!15431 () Bool)

(assert (=> start!74912 (= b_free!15431 (not b_next!15431))))

(declare-fun tp!53996 () Bool)

(declare-fun b_and!25561 () Bool)

(assert (=> start!74912 (= tp!53996 b_and!25561)))

(declare-fun b!883320 () Bool)

(declare-fun res!600118 () Bool)

(declare-fun e!491606 () Bool)

(assert (=> b!883320 (=> (not res!600118) (not e!491606))))

(declare-datatypes ((array!51476 0))(
  ( (array!51477 (arr!24757 (Array (_ BitVec 32) (_ BitVec 64))) (size!25197 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51476)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51476 (_ BitVec 32)) Bool)

(assert (=> b!883320 (= res!600118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!600121 () Bool)

(assert (=> start!74912 (=> (not res!600121) (not e!491606))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74912 (= res!600121 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25197 _keys!868))))))

(assert (=> start!74912 e!491606))

(declare-fun tp_is_empty!17675 () Bool)

(assert (=> start!74912 tp_is_empty!17675))

(assert (=> start!74912 true))

(assert (=> start!74912 tp!53996))

(declare-fun array_inv!19494 (array!51476) Bool)

(assert (=> start!74912 (array_inv!19494 _keys!868)))

(declare-datatypes ((V!28613 0))(
  ( (V!28614 (val!8885 Int)) )
))
(declare-datatypes ((ValueCell!8398 0))(
  ( (ValueCellFull!8398 (v!11354 V!28613)) (EmptyCell!8398) )
))
(declare-datatypes ((array!51478 0))(
  ( (array!51479 (arr!24758 (Array (_ BitVec 32) ValueCell!8398)) (size!25198 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51478)

(declare-fun e!491604 () Bool)

(declare-fun array_inv!19495 (array!51478) Bool)

(assert (=> start!74912 (and (array_inv!19495 _values!688) e!491604)))

(declare-fun b!883321 () Bool)

(declare-fun res!600117 () Bool)

(assert (=> b!883321 (=> (not res!600117) (not e!491606))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!883321 (= res!600117 (and (= (select (arr!24757 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!883322 () Bool)

(declare-datatypes ((Unit!30129 0))(
  ( (Unit!30130) )
))
(declare-fun e!491607 () Unit!30129)

(declare-fun Unit!30131 () Unit!30129)

(assert (=> b!883322 (= e!491607 Unit!30131)))

(declare-fun mapNonEmpty!28149 () Bool)

(declare-fun mapRes!28149 () Bool)

(declare-fun tp!53995 () Bool)

(declare-fun e!491608 () Bool)

(assert (=> mapNonEmpty!28149 (= mapRes!28149 (and tp!53995 e!491608))))

(declare-fun mapKey!28149 () (_ BitVec 32))

(declare-fun mapRest!28149 () (Array (_ BitVec 32) ValueCell!8398))

(declare-fun mapValue!28149 () ValueCell!8398)

(assert (=> mapNonEmpty!28149 (= (arr!24758 _values!688) (store mapRest!28149 mapKey!28149 mapValue!28149))))

(declare-fun b!883323 () Bool)

(declare-fun res!600114 () Bool)

(assert (=> b!883323 (=> (not res!600114) (not e!491606))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!883323 (= res!600114 (and (= (size!25198 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25197 _keys!868) (size!25198 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!883324 () Bool)

(declare-fun e!491605 () Bool)

(assert (=> b!883324 (= e!491606 e!491605)))

(declare-fun res!600116 () Bool)

(assert (=> b!883324 (=> (not res!600116) (not e!491605))))

(assert (=> b!883324 (= res!600116 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!399764 () array!51478)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11772 0))(
  ( (tuple2!11773 (_1!5897 (_ BitVec 64)) (_2!5897 V!28613)) )
))
(declare-datatypes ((List!17581 0))(
  ( (Nil!17578) (Cons!17577 (h!18708 tuple2!11772) (t!24814 List!17581)) )
))
(declare-datatypes ((ListLongMap!10541 0))(
  ( (ListLongMap!10542 (toList!5286 List!17581)) )
))
(declare-fun lt!399768 () ListLongMap!10541)

(declare-fun minValue!654 () V!28613)

(declare-fun zeroValue!654 () V!28613)

(declare-fun getCurrentListMapNoExtraKeys!3246 (array!51476 array!51478 (_ BitVec 32) (_ BitVec 32) V!28613 V!28613 (_ BitVec 32) Int) ListLongMap!10541)

(assert (=> b!883324 (= lt!399768 (getCurrentListMapNoExtraKeys!3246 _keys!868 lt!399764 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28613)

(assert (=> b!883324 (= lt!399764 (array!51479 (store (arr!24758 _values!688) i!612 (ValueCellFull!8398 v!557)) (size!25198 _values!688)))))

(declare-fun lt!399763 () ListLongMap!10541)

(assert (=> b!883324 (= lt!399763 (getCurrentListMapNoExtraKeys!3246 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!28149 () Bool)

(assert (=> mapIsEmpty!28149 mapRes!28149))

(declare-fun b!883325 () Bool)

(declare-fun e!491609 () Bool)

(assert (=> b!883325 (= e!491609 tp_is_empty!17675)))

(declare-fun b!883326 () Bool)

(declare-fun res!600122 () Bool)

(assert (=> b!883326 (=> (not res!600122) (not e!491606))))

(assert (=> b!883326 (= res!600122 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25197 _keys!868))))))

(declare-fun b!883327 () Bool)

(declare-fun res!600123 () Bool)

(assert (=> b!883327 (=> (not res!600123) (not e!491606))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!883327 (= res!600123 (validMask!0 mask!1196))))

(declare-fun b!883328 () Bool)

(assert (=> b!883328 (= e!491608 tp_is_empty!17675)))

(declare-fun b!883329 () Bool)

(declare-fun e!491610 () Bool)

(assert (=> b!883329 (= e!491610 (bvslt from!1053 (size!25197 _keys!868)))))

(declare-fun lt!399766 () Unit!30129)

(assert (=> b!883329 (= lt!399766 e!491607)))

(declare-fun c!93052 () Bool)

(assert (=> b!883329 (= c!93052 (= (select (arr!24757 _keys!868) from!1053) k!854))))

(declare-fun lt!399760 () ListLongMap!10541)

(declare-fun +!2555 (ListLongMap!10541 tuple2!11772) ListLongMap!10541)

(declare-fun get!13043 (ValueCell!8398 V!28613) V!28613)

(declare-fun dynLambda!1268 (Int (_ BitVec 64)) V!28613)

(assert (=> b!883329 (= lt!399768 (+!2555 lt!399760 (tuple2!11773 (select (arr!24757 _keys!868) from!1053) (get!13043 (select (arr!24758 _values!688) from!1053) (dynLambda!1268 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!883330 () Bool)

(declare-fun Unit!30132 () Unit!30129)

(assert (=> b!883330 (= e!491607 Unit!30132)))

(declare-fun lt!399762 () Unit!30129)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51476 (_ BitVec 32) (_ BitVec 32)) Unit!30129)

(assert (=> b!883330 (= lt!399762 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17582 0))(
  ( (Nil!17579) (Cons!17578 (h!18709 (_ BitVec 64)) (t!24815 List!17582)) )
))
(declare-fun arrayNoDuplicates!0 (array!51476 (_ BitVec 32) List!17582) Bool)

(assert (=> b!883330 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17579)))

(declare-fun lt!399769 () Unit!30129)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51476 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30129)

(assert (=> b!883330 (= lt!399769 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!51476 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!883330 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!399765 () Unit!30129)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!51476 (_ BitVec 64) (_ BitVec 32) List!17582) Unit!30129)

(assert (=> b!883330 (= lt!399765 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!17579))))

(assert (=> b!883330 false))

(declare-fun b!883331 () Bool)

(declare-fun res!600119 () Bool)

(assert (=> b!883331 (=> (not res!600119) (not e!491606))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!883331 (= res!600119 (validKeyInArray!0 k!854))))

(declare-fun b!883332 () Bool)

(assert (=> b!883332 (= e!491604 (and e!491609 mapRes!28149))))

(declare-fun condMapEmpty!28149 () Bool)

(declare-fun mapDefault!28149 () ValueCell!8398)

