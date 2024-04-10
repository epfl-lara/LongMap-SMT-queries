; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74432 () Bool)

(assert start!74432)

(declare-fun b_free!15175 () Bool)

(declare-fun b_next!15175 () Bool)

(assert (=> start!74432 (= b_free!15175 (not b_next!15175))))

(declare-fun tp!53203 () Bool)

(declare-fun b_and!25003 () Bool)

(assert (=> start!74432 (= tp!53203 b_and!25003)))

(declare-fun b!876623 () Bool)

(declare-fun res!595675 () Bool)

(declare-fun e!487983 () Bool)

(assert (=> b!876623 (=> (not res!595675) (not e!487983))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!876623 (= res!595675 (validMask!0 mask!1196))))

(declare-fun b!876624 () Bool)

(declare-fun e!487984 () Bool)

(declare-fun tp_is_empty!17419 () Bool)

(assert (=> b!876624 (= e!487984 tp_is_empty!17419)))

(declare-fun b!876625 () Bool)

(declare-fun e!487989 () Bool)

(assert (=> b!876625 (= e!487989 tp_is_empty!17419)))

(declare-fun b!876626 () Bool)

(declare-fun e!487985 () Bool)

(declare-fun e!487986 () Bool)

(assert (=> b!876626 (= e!487985 (not e!487986))))

(declare-fun res!595677 () Bool)

(assert (=> b!876626 (=> res!595677 e!487986)))

(declare-datatypes ((array!50964 0))(
  ( (array!50965 (arr!24509 (Array (_ BitVec 32) (_ BitVec 64))) (size!24949 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50964)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!876626 (= res!595677 (not (validKeyInArray!0 (select (arr!24509 _keys!868) from!1053))))))

(declare-fun e!487988 () Bool)

(assert (=> b!876626 e!487988))

(declare-fun c!92612 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!876626 (= c!92612 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((V!28273 0))(
  ( (V!28274 (val!8757 Int)) )
))
(declare-fun v!557 () V!28273)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((ValueCell!8270 0))(
  ( (ValueCellFull!8270 (v!11190 V!28273)) (EmptyCell!8270) )
))
(declare-datatypes ((array!50966 0))(
  ( (array!50967 (arr!24510 (Array (_ BitVec 32) ValueCell!8270)) (size!24950 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50966)

(declare-fun minValue!654 () V!28273)

(declare-fun zeroValue!654 () V!28273)

(declare-datatypes ((Unit!29978 0))(
  ( (Unit!29979) )
))
(declare-fun lt!396594 () Unit!29978)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!682 (array!50964 array!50966 (_ BitVec 32) (_ BitVec 32) V!28273 V!28273 (_ BitVec 32) (_ BitVec 64) V!28273 (_ BitVec 32) Int) Unit!29978)

(assert (=> b!876626 (= lt!396594 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!682 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!595673 () Bool)

(assert (=> start!74432 (=> (not res!595673) (not e!487983))))

(assert (=> start!74432 (= res!595673 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24949 _keys!868))))))

(assert (=> start!74432 e!487983))

(assert (=> start!74432 tp_is_empty!17419))

(assert (=> start!74432 true))

(assert (=> start!74432 tp!53203))

(declare-fun array_inv!19320 (array!50964) Bool)

(assert (=> start!74432 (array_inv!19320 _keys!868)))

(declare-fun e!487987 () Bool)

(declare-fun array_inv!19321 (array!50966) Bool)

(assert (=> start!74432 (and (array_inv!19321 _values!688) e!487987)))

(declare-fun mapIsEmpty!27740 () Bool)

(declare-fun mapRes!27740 () Bool)

(assert (=> mapIsEmpty!27740 mapRes!27740))

(declare-fun b!876627 () Bool)

(declare-fun res!595672 () Bool)

(assert (=> b!876627 (=> (not res!595672) (not e!487983))))

(assert (=> b!876627 (= res!595672 (validKeyInArray!0 k!854))))

(declare-fun b!876628 () Bool)

(assert (=> b!876628 (= e!487987 (and e!487989 mapRes!27740))))

(declare-fun condMapEmpty!27740 () Bool)

(declare-fun mapDefault!27740 () ValueCell!8270)

