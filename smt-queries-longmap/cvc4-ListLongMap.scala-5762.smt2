; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74424 () Bool)

(assert start!74424)

(declare-fun b_free!15167 () Bool)

(declare-fun b_next!15167 () Bool)

(assert (=> start!74424 (= b_free!15167 (not b_next!15167))))

(declare-fun tp!53179 () Bool)

(declare-fun b_and!24987 () Bool)

(assert (=> start!74424 (= tp!53179 b_and!24987)))

(declare-fun b!876435 () Bool)

(declare-fun e!487887 () Bool)

(declare-fun tp_is_empty!17411 () Bool)

(assert (=> b!876435 (= e!487887 tp_is_empty!17411)))

(declare-fun b!876436 () Bool)

(declare-fun res!595553 () Bool)

(declare-fun e!487891 () Bool)

(assert (=> b!876436 (=> (not res!595553) (not e!487891))))

(declare-datatypes ((array!50948 0))(
  ( (array!50949 (arr!24501 (Array (_ BitVec 32) (_ BitVec 64))) (size!24941 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50948)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50948 (_ BitVec 32)) Bool)

(assert (=> b!876436 (= res!595553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!595555 () Bool)

(assert (=> start!74424 (=> (not res!595555) (not e!487891))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74424 (= res!595555 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24941 _keys!868))))))

(assert (=> start!74424 e!487891))

(assert (=> start!74424 tp_is_empty!17411))

(assert (=> start!74424 true))

(assert (=> start!74424 tp!53179))

(declare-fun array_inv!19316 (array!50948) Bool)

(assert (=> start!74424 (array_inv!19316 _keys!868)))

(declare-datatypes ((V!28261 0))(
  ( (V!28262 (val!8753 Int)) )
))
(declare-datatypes ((ValueCell!8266 0))(
  ( (ValueCellFull!8266 (v!11186 V!28261)) (EmptyCell!8266) )
))
(declare-datatypes ((array!50950 0))(
  ( (array!50951 (arr!24502 (Array (_ BitVec 32) ValueCell!8266)) (size!24942 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50950)

(declare-fun e!487893 () Bool)

(declare-fun array_inv!19317 (array!50950) Bool)

(assert (=> start!74424 (and (array_inv!19317 _values!688) e!487893)))

(declare-fun b!876437 () Bool)

(declare-fun e!487888 () Bool)

(declare-fun e!487886 () Bool)

(assert (=> b!876437 (= e!487888 (not e!487886))))

(declare-fun res!595554 () Bool)

(assert (=> b!876437 (=> res!595554 e!487886)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!876437 (= res!595554 (not (validKeyInArray!0 (select (arr!24501 _keys!868) from!1053))))))

(declare-fun e!487889 () Bool)

(assert (=> b!876437 e!487889))

(declare-fun c!92600 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!876437 (= c!92600 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!28261)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun minValue!654 () V!28261)

(declare-fun zeroValue!654 () V!28261)

(declare-datatypes ((Unit!29970 0))(
  ( (Unit!29971) )
))
(declare-fun lt!396481 () Unit!29970)

(declare-fun defaultEntry!696 () Int)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!678 (array!50948 array!50950 (_ BitVec 32) (_ BitVec 32) V!28261 V!28261 (_ BitVec 32) (_ BitVec 64) V!28261 (_ BitVec 32) Int) Unit!29970)

(assert (=> b!876437 (= lt!396481 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!678 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876438 () Bool)

(declare-fun e!487890 () Bool)

(declare-fun mapRes!27728 () Bool)

(assert (=> b!876438 (= e!487893 (and e!487890 mapRes!27728))))

(declare-fun condMapEmpty!27728 () Bool)

(declare-fun mapDefault!27728 () ValueCell!8266)

