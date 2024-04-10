; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72398 () Bool)

(assert start!72398)

(declare-fun b_free!13583 () Bool)

(declare-fun b_next!13583 () Bool)

(assert (=> start!72398 (= b_free!13583 (not b_next!13583))))

(declare-fun tp!47847 () Bool)

(declare-fun b_and!22669 () Bool)

(assert (=> start!72398 (= tp!47847 b_and!22669)))

(declare-fun b!839180 () Bool)

(declare-fun res!570590 () Bool)

(declare-fun e!468362 () Bool)

(assert (=> b!839180 (=> (not res!570590) (not e!468362))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!47182 0))(
  ( (array!47183 (arr!22622 (Array (_ BitVec 32) (_ BitVec 64))) (size!23062 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47182)

(assert (=> b!839180 (= res!570590 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23062 _keys!868))))))

(declare-fun b!839181 () Bool)

(declare-fun res!570589 () Bool)

(assert (=> b!839181 (=> (not res!570589) (not e!468362))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!839181 (= res!570589 (validMask!0 mask!1196))))

(declare-fun b!839183 () Bool)

(assert (=> b!839183 (= e!468362 (not true))))

(declare-fun e!468361 () Bool)

(assert (=> b!839183 e!468361))

(declare-fun c!91234 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!839183 (= c!91234 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((V!25645 0))(
  ( (V!25646 (val!7772 Int)) )
))
(declare-fun v!557 () V!25645)

(declare-fun defaultEntry!696 () Int)

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((ValueCell!7285 0))(
  ( (ValueCellFull!7285 (v!10197 V!25645)) (EmptyCell!7285) )
))
(declare-datatypes ((array!47184 0))(
  ( (array!47185 (arr!22623 (Array (_ BitVec 32) ValueCell!7285)) (size!23063 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47184)

(declare-fun minValue!654 () V!25645)

(declare-fun zeroValue!654 () V!25645)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((Unit!28821 0))(
  ( (Unit!28822) )
))
(declare-fun lt!380740 () Unit!28821)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!256 (array!47182 array!47184 (_ BitVec 32) (_ BitVec 32) V!25645 V!25645 (_ BitVec 32) (_ BitVec 64) V!25645 (_ BitVec 32) Int) Unit!28821)

(assert (=> b!839183 (= lt!380740 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!256 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!24773 () Bool)

(declare-fun mapRes!24773 () Bool)

(assert (=> mapIsEmpty!24773 mapRes!24773))

(declare-fun b!839184 () Bool)

(declare-datatypes ((tuple2!10284 0))(
  ( (tuple2!10285 (_1!5153 (_ BitVec 64)) (_2!5153 V!25645)) )
))
(declare-datatypes ((List!16085 0))(
  ( (Nil!16082) (Cons!16081 (h!17212 tuple2!10284) (t!22456 List!16085)) )
))
(declare-datatypes ((ListLongMap!9053 0))(
  ( (ListLongMap!9054 (toList!4542 List!16085)) )
))
(declare-fun call!36983 () ListLongMap!9053)

(declare-fun call!36982 () ListLongMap!9053)

(assert (=> b!839184 (= e!468361 (= call!36983 call!36982))))

(declare-fun b!839185 () Bool)

(declare-fun +!2015 (ListLongMap!9053 tuple2!10284) ListLongMap!9053)

(assert (=> b!839185 (= e!468361 (= call!36983 (+!2015 call!36982 (tuple2!10285 k!854 v!557))))))

(declare-fun b!839186 () Bool)

(declare-fun res!570587 () Bool)

(assert (=> b!839186 (=> (not res!570587) (not e!468362))))

(assert (=> b!839186 (= res!570587 (and (= (select (arr!22622 _keys!868) i!612) k!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23062 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!839187 () Bool)

(declare-fun res!570591 () Bool)

(assert (=> b!839187 (=> (not res!570591) (not e!468362))))

(declare-datatypes ((List!16086 0))(
  ( (Nil!16083) (Cons!16082 (h!17213 (_ BitVec 64)) (t!22457 List!16086)) )
))
(declare-fun arrayNoDuplicates!0 (array!47182 (_ BitVec 32) List!16086) Bool)

(assert (=> b!839187 (= res!570591 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16083))))

(declare-fun bm!36979 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2534 (array!47182 array!47184 (_ BitVec 32) (_ BitVec 32) V!25645 V!25645 (_ BitVec 32) Int) ListLongMap!9053)

(assert (=> bm!36979 (= call!36983 (getCurrentListMapNoExtraKeys!2534 _keys!868 (array!47185 (store (arr!22623 _values!688) i!612 (ValueCellFull!7285 v!557)) (size!23063 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839188 () Bool)

(declare-fun res!570592 () Bool)

(assert (=> b!839188 (=> (not res!570592) (not e!468362))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47182 (_ BitVec 32)) Bool)

(assert (=> b!839188 (= res!570592 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!839189 () Bool)

(declare-fun res!570586 () Bool)

(assert (=> b!839189 (=> (not res!570586) (not e!468362))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!839189 (= res!570586 (validKeyInArray!0 k!854))))

(declare-fun b!839190 () Bool)

(declare-fun e!468364 () Bool)

(declare-fun tp_is_empty!15449 () Bool)

(assert (=> b!839190 (= e!468364 tp_is_empty!15449)))

(declare-fun b!839182 () Bool)

(declare-fun res!570588 () Bool)

(assert (=> b!839182 (=> (not res!570588) (not e!468362))))

(assert (=> b!839182 (= res!570588 (and (= (size!23063 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23062 _keys!868) (size!23063 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!570593 () Bool)

(assert (=> start!72398 (=> (not res!570593) (not e!468362))))

(assert (=> start!72398 (= res!570593 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23062 _keys!868))))))

(assert (=> start!72398 e!468362))

(assert (=> start!72398 tp_is_empty!15449))

(assert (=> start!72398 true))

(assert (=> start!72398 tp!47847))

(declare-fun array_inv!18022 (array!47182) Bool)

(assert (=> start!72398 (array_inv!18022 _keys!868)))

(declare-fun e!468359 () Bool)

(declare-fun array_inv!18023 (array!47184) Bool)

(assert (=> start!72398 (and (array_inv!18023 _values!688) e!468359)))

(declare-fun mapNonEmpty!24773 () Bool)

(declare-fun tp!47848 () Bool)

(assert (=> mapNonEmpty!24773 (= mapRes!24773 (and tp!47848 e!468364))))

(declare-fun mapKey!24773 () (_ BitVec 32))

(declare-fun mapValue!24773 () ValueCell!7285)

(declare-fun mapRest!24773 () (Array (_ BitVec 32) ValueCell!7285))

(assert (=> mapNonEmpty!24773 (= (arr!22623 _values!688) (store mapRest!24773 mapKey!24773 mapValue!24773))))

(declare-fun bm!36980 () Bool)

(assert (=> bm!36980 (= call!36982 (getCurrentListMapNoExtraKeys!2534 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839191 () Bool)

(declare-fun e!468363 () Bool)

(assert (=> b!839191 (= e!468359 (and e!468363 mapRes!24773))))

(declare-fun condMapEmpty!24773 () Bool)

(declare-fun mapDefault!24773 () ValueCell!7285)

