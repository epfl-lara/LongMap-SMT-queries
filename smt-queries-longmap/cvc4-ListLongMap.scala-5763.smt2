; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74430 () Bool)

(assert start!74430)

(declare-fun b_free!15173 () Bool)

(declare-fun b_next!15173 () Bool)

(assert (=> start!74430 (= b_free!15173 (not b_next!15173))))

(declare-fun tp!53197 () Bool)

(declare-fun b_and!24999 () Bool)

(assert (=> start!74430 (= tp!53197 b_and!24999)))

(declare-fun b!876576 () Bool)

(declare-fun res!595644 () Bool)

(declare-fun e!487959 () Bool)

(assert (=> b!876576 (=> (not res!595644) (not e!487959))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!876576 (= res!595644 (validMask!0 mask!1196))))

(declare-fun b!876577 () Bool)

(declare-fun res!595646 () Bool)

(assert (=> b!876577 (=> (not res!595646) (not e!487959))))

(declare-datatypes ((array!50960 0))(
  ( (array!50961 (arr!24507 (Array (_ BitVec 32) (_ BitVec 64))) (size!24947 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50960)

(declare-datatypes ((List!17395 0))(
  ( (Nil!17392) (Cons!17391 (h!18522 (_ BitVec 64)) (t!24472 List!17395)) )
))
(declare-fun arrayNoDuplicates!0 (array!50960 (_ BitVec 32) List!17395) Bool)

(assert (=> b!876577 (= res!595646 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17392))))

(declare-fun b!876578 () Bool)

(declare-fun e!487965 () Bool)

(declare-fun e!487962 () Bool)

(assert (=> b!876578 (= e!487965 (not e!487962))))

(declare-fun res!595647 () Bool)

(assert (=> b!876578 (=> res!595647 e!487962)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!876578 (= res!595647 (not (validKeyInArray!0 (select (arr!24507 _keys!868) from!1053))))))

(declare-fun e!487964 () Bool)

(assert (=> b!876578 e!487964))

(declare-fun c!92609 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!876578 (= c!92609 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((V!28269 0))(
  ( (V!28270 (val!8756 Int)) )
))
(declare-fun v!557 () V!28269)

(declare-datatypes ((Unit!29976 0))(
  ( (Unit!29977) )
))
(declare-fun lt!396569 () Unit!29976)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((ValueCell!8269 0))(
  ( (ValueCellFull!8269 (v!11189 V!28269)) (EmptyCell!8269) )
))
(declare-datatypes ((array!50962 0))(
  ( (array!50963 (arr!24508 (Array (_ BitVec 32) ValueCell!8269)) (size!24948 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50962)

(declare-fun minValue!654 () V!28269)

(declare-fun zeroValue!654 () V!28269)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!681 (array!50960 array!50962 (_ BitVec 32) (_ BitVec 32) V!28269 V!28269 (_ BitVec 32) (_ BitVec 64) V!28269 (_ BitVec 32) Int) Unit!29976)

(assert (=> b!876578 (= lt!396569 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!681 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876579 () Bool)

(declare-fun res!595648 () Bool)

(assert (=> b!876579 (=> (not res!595648) (not e!487959))))

(assert (=> b!876579 (= res!595648 (and (= (select (arr!24507 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!876580 () Bool)

(declare-fun res!595641 () Bool)

(assert (=> b!876580 (=> (not res!595641) (not e!487959))))

(assert (=> b!876580 (= res!595641 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24947 _keys!868))))))

(declare-fun mapNonEmpty!27737 () Bool)

(declare-fun mapRes!27737 () Bool)

(declare-fun tp!53196 () Bool)

(declare-fun e!487960 () Bool)

(assert (=> mapNonEmpty!27737 (= mapRes!27737 (and tp!53196 e!487960))))

(declare-fun mapKey!27737 () (_ BitVec 32))

(declare-fun mapRest!27737 () (Array (_ BitVec 32) ValueCell!8269))

(declare-fun mapValue!27737 () ValueCell!8269)

(assert (=> mapNonEmpty!27737 (= (arr!24508 _values!688) (store mapRest!27737 mapKey!27737 mapValue!27737))))

(declare-fun b!876581 () Bool)

(declare-fun e!487963 () Bool)

(declare-fun e!487961 () Bool)

(assert (=> b!876581 (= e!487963 (and e!487961 mapRes!27737))))

(declare-fun condMapEmpty!27737 () Bool)

(declare-fun mapDefault!27737 () ValueCell!8269)

