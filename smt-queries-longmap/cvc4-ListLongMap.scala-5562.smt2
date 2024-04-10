; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73160 () Bool)

(assert start!73160)

(declare-fun b_free!14075 () Bool)

(declare-fun b_next!14075 () Bool)

(assert (=> start!73160 (= b_free!14075 (not b_next!14075))))

(declare-fun tp!49729 () Bool)

(declare-fun b_and!23309 () Bool)

(assert (=> start!73160 (= tp!49729 b_and!23309)))

(declare-fun b!851917 () Bool)

(declare-fun e!475167 () Bool)

(declare-fun tp_is_empty!16211 () Bool)

(assert (=> b!851917 (= e!475167 tp_is_empty!16211)))

(declare-fun b!851918 () Bool)

(declare-fun res!578657 () Bool)

(declare-fun e!475163 () Bool)

(assert (=> b!851918 (=> (not res!578657) (not e!475163))))

(declare-datatypes ((array!48620 0))(
  ( (array!48621 (arr!23341 (Array (_ BitVec 32) (_ BitVec 64))) (size!23781 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48620)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48620 (_ BitVec 32)) Bool)

(assert (=> b!851918 (= res!578657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun bm!38077 () Bool)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((V!26661 0))(
  ( (V!26662 (val!8153 Int)) )
))
(declare-fun minValue!654 () V!26661)

(declare-fun zeroValue!654 () V!26661)

(declare-datatypes ((tuple2!10700 0))(
  ( (tuple2!10701 (_1!5361 (_ BitVec 64)) (_2!5361 V!26661)) )
))
(declare-datatypes ((List!16535 0))(
  ( (Nil!16532) (Cons!16531 (h!17662 tuple2!10700) (t!23056 List!16535)) )
))
(declare-datatypes ((ListLongMap!9469 0))(
  ( (ListLongMap!9470 (toList!4750 List!16535)) )
))
(declare-fun call!38081 () ListLongMap!9469)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!7666 0))(
  ( (ValueCellFull!7666 (v!10578 V!26661)) (EmptyCell!7666) )
))
(declare-datatypes ((array!48622 0))(
  ( (array!48623 (arr!23342 (Array (_ BitVec 32) ValueCell!7666)) (size!23782 (_ BitVec 32))) )
))
(declare-fun lt!383767 () array!48622)

(declare-fun getCurrentListMapNoExtraKeys!2732 (array!48620 array!48622 (_ BitVec 32) (_ BitVec 32) V!26661 V!26661 (_ BitVec 32) Int) ListLongMap!9469)

(assert (=> bm!38077 (= call!38081 (getCurrentListMapNoExtraKeys!2732 _keys!868 lt!383767 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851919 () Bool)

(declare-fun e!475164 () Bool)

(assert (=> b!851919 (= e!475164 tp_is_empty!16211)))

(declare-fun b!851920 () Bool)

(declare-fun e!475166 () Bool)

(declare-fun call!38080 () ListLongMap!9469)

(assert (=> b!851920 (= e!475166 (= call!38081 call!38080))))

(declare-fun b!851921 () Bool)

(declare-fun v!557 () V!26661)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun +!2149 (ListLongMap!9469 tuple2!10700) ListLongMap!9469)

(assert (=> b!851921 (= e!475166 (= call!38081 (+!2149 call!38080 (tuple2!10701 k!854 v!557))))))

(declare-fun b!851922 () Bool)

(declare-fun res!578652 () Bool)

(assert (=> b!851922 (=> (not res!578652) (not e!475163))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!851922 (= res!578652 (and (= (select (arr!23341 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!851923 () Bool)

(declare-fun res!578653 () Bool)

(assert (=> b!851923 (=> (not res!578653) (not e!475163))))

(declare-datatypes ((List!16536 0))(
  ( (Nil!16533) (Cons!16532 (h!17663 (_ BitVec 64)) (t!23057 List!16536)) )
))
(declare-fun arrayNoDuplicates!0 (array!48620 (_ BitVec 32) List!16536) Bool)

(assert (=> b!851923 (= res!578653 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16533))))

(declare-fun b!851924 () Bool)

(declare-fun e!475162 () Bool)

(declare-fun mapRes!25916 () Bool)

(assert (=> b!851924 (= e!475162 (and e!475167 mapRes!25916))))

(declare-fun condMapEmpty!25916 () Bool)

(declare-fun _values!688 () array!48622)

(declare-fun mapDefault!25916 () ValueCell!7666)

