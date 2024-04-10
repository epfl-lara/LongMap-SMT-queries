; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78718 () Bool)

(assert start!78718)

(declare-fun b_free!16931 () Bool)

(declare-fun b_next!16931 () Bool)

(assert (=> start!78718 (= b_free!16931 (not b_next!16931))))

(declare-fun tp!59234 () Bool)

(declare-fun b_and!27599 () Bool)

(assert (=> start!78718 (= tp!59234 b_and!27599)))

(declare-fun b!918165 () Bool)

(declare-fun e!515436 () Bool)

(declare-fun tp_is_empty!19439 () Bool)

(assert (=> b!918165 (= e!515436 tp_is_empty!19439)))

(declare-fun b!918166 () Bool)

(declare-fun res!619036 () Bool)

(declare-fun e!515435 () Bool)

(assert (=> b!918166 (=> (not res!619036) (not e!515435))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!54862 0))(
  ( (array!54863 (arr!26376 (Array (_ BitVec 32) (_ BitVec 64))) (size!26835 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54862)

(assert (=> b!918166 (= res!619036 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26835 _keys!1487))))))

(declare-fun b!918167 () Bool)

(declare-fun e!515434 () Bool)

(assert (=> b!918167 (= e!515434 (not true))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30883 0))(
  ( (V!30884 (val!9770 Int)) )
))
(declare-datatypes ((ValueCell!9238 0))(
  ( (ValueCellFull!9238 (v!12288 V!30883)) (EmptyCell!9238) )
))
(declare-datatypes ((array!54864 0))(
  ( (array!54865 (arr!26377 (Array (_ BitVec 32) ValueCell!9238)) (size!26836 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54864)

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!412173 () (_ BitVec 64))

(declare-fun zeroValue!1173 () V!30883)

(declare-fun minValue!1173 () V!30883)

(declare-datatypes ((tuple2!12694 0))(
  ( (tuple2!12695 (_1!6358 (_ BitVec 64)) (_2!6358 V!30883)) )
))
(declare-datatypes ((List!18500 0))(
  ( (Nil!18497) (Cons!18496 (h!19642 tuple2!12694) (t!26161 List!18500)) )
))
(declare-datatypes ((ListLongMap!11391 0))(
  ( (ListLongMap!11392 (toList!5711 List!18500)) )
))
(declare-fun getCurrentListMap!2968 (array!54862 array!54864 (_ BitVec 32) (_ BitVec 32) V!30883 V!30883 (_ BitVec 32) Int) ListLongMap!11391)

(declare-fun +!2624 (ListLongMap!11391 tuple2!12694) ListLongMap!11391)

(declare-fun get!13823 (ValueCell!9238 V!30883) V!30883)

(declare-fun dynLambda!1413 (Int (_ BitVec 64)) V!30883)

(assert (=> b!918167 (= (getCurrentListMap!2968 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2624 (getCurrentListMap!2968 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!12695 lt!412173 (get!13823 (select (arr!26377 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1413 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!30996 0))(
  ( (Unit!30997) )
))
(declare-fun lt!412172 () Unit!30996)

(declare-fun lemmaListMapRecursiveValidKeyArray!14 (array!54862 array!54864 (_ BitVec 32) (_ BitVec 32) V!30883 V!30883 (_ BitVec 32) Int) Unit!30996)

(assert (=> b!918167 (= lt!412172 (lemmaListMapRecursiveValidKeyArray!14 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun res!619038 () Bool)

(assert (=> start!78718 (=> (not res!619038) (not e!515435))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78718 (= res!619038 (validMask!0 mask!1881))))

(assert (=> start!78718 e!515435))

(assert (=> start!78718 true))

(assert (=> start!78718 tp_is_empty!19439))

(declare-fun e!515437 () Bool)

(declare-fun array_inv!20566 (array!54864) Bool)

(assert (=> start!78718 (and (array_inv!20566 _values!1231) e!515437)))

(assert (=> start!78718 tp!59234))

(declare-fun array_inv!20567 (array!54862) Bool)

(assert (=> start!78718 (array_inv!20567 _keys!1487)))

(declare-fun b!918168 () Bool)

(declare-fun res!619034 () Bool)

(assert (=> b!918168 (=> (not res!619034) (not e!515435))))

(declare-datatypes ((List!18501 0))(
  ( (Nil!18498) (Cons!18497 (h!19643 (_ BitVec 64)) (t!26162 List!18501)) )
))
(declare-fun arrayNoDuplicates!0 (array!54862 (_ BitVec 32) List!18501) Bool)

(assert (=> b!918168 (= res!619034 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18498))))

(declare-fun mapIsEmpty!30915 () Bool)

(declare-fun mapRes!30915 () Bool)

(assert (=> mapIsEmpty!30915 mapRes!30915))

(declare-fun b!918169 () Bool)

(declare-fun e!515439 () Bool)

(assert (=> b!918169 (= e!515439 e!515434)))

(declare-fun res!619030 () Bool)

(assert (=> b!918169 (=> (not res!619030) (not e!515434))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!918169 (= res!619030 (validKeyInArray!0 lt!412173))))

(assert (=> b!918169 (= lt!412173 (select (arr!26376 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!918170 () Bool)

(declare-fun res!619035 () Bool)

(assert (=> b!918170 (=> (not res!619035) (not e!515439))))

(assert (=> b!918170 (= res!619035 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!918171 () Bool)

(assert (=> b!918171 (= e!515437 (and e!515436 mapRes!30915))))

(declare-fun condMapEmpty!30915 () Bool)

(declare-fun mapDefault!30915 () ValueCell!9238)

