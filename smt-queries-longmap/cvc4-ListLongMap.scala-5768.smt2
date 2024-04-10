; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74514 () Bool)

(assert start!74514)

(declare-fun b_free!15203 () Bool)

(declare-fun b_next!15203 () Bool)

(assert (=> start!74514 (= b_free!15203 (not b_next!15203))))

(declare-fun tp!53290 () Bool)

(declare-fun b_and!25079 () Bool)

(assert (=> start!74514 (= tp!53290 b_and!25079)))

(declare-fun b!877685 () Bool)

(declare-fun e!488556 () Bool)

(assert (=> b!877685 (= e!488556 false)))

(declare-datatypes ((V!28309 0))(
  ( (V!28310 (val!8771 Int)) )
))
(declare-fun v!557 () V!28309)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!51022 0))(
  ( (array!51023 (arr!24537 (Array (_ BitVec 32) (_ BitVec 64))) (size!24977 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51022)

(declare-datatypes ((ValueCell!8284 0))(
  ( (ValueCellFull!8284 (v!11211 V!28309)) (EmptyCell!8284) )
))
(declare-datatypes ((array!51024 0))(
  ( (array!51025 (arr!24538 (Array (_ BitVec 32) ValueCell!8284)) (size!24978 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51024)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!28309)

(declare-fun zeroValue!654 () V!28309)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11598 0))(
  ( (tuple2!11599 (_1!5810 (_ BitVec 64)) (_2!5810 V!28309)) )
))
(declare-datatypes ((List!17413 0))(
  ( (Nil!17410) (Cons!17409 (h!18540 tuple2!11598) (t!24502 List!17413)) )
))
(declare-datatypes ((ListLongMap!10367 0))(
  ( (ListLongMap!10368 (toList!5199 List!17413)) )
))
(declare-fun lt!397118 () ListLongMap!10367)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3166 (array!51022 array!51024 (_ BitVec 32) (_ BitVec 32) V!28309 V!28309 (_ BitVec 32) Int) ListLongMap!10367)

(assert (=> b!877685 (= lt!397118 (getCurrentListMapNoExtraKeys!3166 _keys!868 (array!51025 (store (arr!24538 _values!688) i!612 (ValueCellFull!8284 v!557)) (size!24978 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!397119 () ListLongMap!10367)

(assert (=> b!877685 (= lt!397119 (getCurrentListMapNoExtraKeys!3166 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!877686 () Bool)

(declare-fun e!488560 () Bool)

(declare-fun tp_is_empty!17447 () Bool)

(assert (=> b!877686 (= e!488560 tp_is_empty!17447)))

(declare-fun b!877687 () Bool)

(declare-fun res!596239 () Bool)

(assert (=> b!877687 (=> (not res!596239) (not e!488556))))

(assert (=> b!877687 (= res!596239 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24977 _keys!868))))))

(declare-fun b!877688 () Bool)

(declare-fun res!596237 () Bool)

(assert (=> b!877688 (=> (not res!596237) (not e!488556))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51022 (_ BitVec 32)) Bool)

(assert (=> b!877688 (= res!596237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!877689 () Bool)

(declare-fun res!596238 () Bool)

(assert (=> b!877689 (=> (not res!596238) (not e!488556))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!877689 (= res!596238 (validKeyInArray!0 k!854))))

(declare-fun b!877690 () Bool)

(declare-fun res!596233 () Bool)

(assert (=> b!877690 (=> (not res!596233) (not e!488556))))

(assert (=> b!877690 (= res!596233 (and (= (size!24978 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24977 _keys!868) (size!24978 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!877691 () Bool)

(declare-fun res!596240 () Bool)

(assert (=> b!877691 (=> (not res!596240) (not e!488556))))

(assert (=> b!877691 (= res!596240 (and (= (select (arr!24537 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!877692 () Bool)

(declare-fun e!488558 () Bool)

(declare-fun e!488557 () Bool)

(declare-fun mapRes!27786 () Bool)

(assert (=> b!877692 (= e!488558 (and e!488557 mapRes!27786))))

(declare-fun condMapEmpty!27786 () Bool)

(declare-fun mapDefault!27786 () ValueCell!8284)

