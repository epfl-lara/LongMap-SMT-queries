; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78724 () Bool)

(assert start!78724)

(declare-fun b_free!16937 () Bool)

(declare-fun b_next!16937 () Bool)

(assert (=> start!78724 (= b_free!16937 (not b_next!16937))))

(declare-fun tp!59251 () Bool)

(declare-fun b_and!27611 () Bool)

(assert (=> start!78724 (= tp!59251 b_and!27611)))

(declare-fun b!918288 () Bool)

(declare-fun res!619126 () Bool)

(declare-fun e!515497 () Bool)

(assert (=> b!918288 (=> (not res!619126) (not e!515497))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!918288 (= res!619126 (validKeyInArray!0 k!1099))))

(declare-fun b!918289 () Bool)

(declare-fun e!515502 () Bool)

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!54874 0))(
  ( (array!54875 (arr!26382 (Array (_ BitVec 32) (_ BitVec 64))) (size!26841 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54874)

(assert (=> b!918289 (= e!515502 (not (bvsle from!1844 (size!26841 _keys!1487))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!412201 () (_ BitVec 64))

(declare-datatypes ((V!30891 0))(
  ( (V!30892 (val!9773 Int)) )
))
(declare-datatypes ((ValueCell!9241 0))(
  ( (ValueCellFull!9241 (v!12291 V!30891)) (EmptyCell!9241) )
))
(declare-datatypes ((array!54876 0))(
  ( (array!54877 (arr!26383 (Array (_ BitVec 32) ValueCell!9241)) (size!26842 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54876)

(declare-fun zeroValue!1173 () V!30891)

(declare-fun minValue!1173 () V!30891)

(declare-datatypes ((tuple2!12698 0))(
  ( (tuple2!12699 (_1!6360 (_ BitVec 64)) (_2!6360 V!30891)) )
))
(declare-datatypes ((List!18504 0))(
  ( (Nil!18501) (Cons!18500 (h!19646 tuple2!12698) (t!26171 List!18504)) )
))
(declare-datatypes ((ListLongMap!11395 0))(
  ( (ListLongMap!11396 (toList!5713 List!18504)) )
))
(declare-fun getCurrentListMap!2970 (array!54874 array!54876 (_ BitVec 32) (_ BitVec 32) V!30891 V!30891 (_ BitVec 32) Int) ListLongMap!11395)

(declare-fun +!2626 (ListLongMap!11395 tuple2!12698) ListLongMap!11395)

(declare-fun get!13827 (ValueCell!9241 V!30891) V!30891)

(declare-fun dynLambda!1415 (Int (_ BitVec 64)) V!30891)

(assert (=> b!918289 (= (getCurrentListMap!2970 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2626 (getCurrentListMap!2970 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!12699 lt!412201 (get!13827 (select (arr!26383 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1415 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!31000 0))(
  ( (Unit!31001) )
))
(declare-fun lt!412200 () Unit!31000)

(declare-fun lemmaListMapRecursiveValidKeyArray!16 (array!54874 array!54876 (_ BitVec 32) (_ BitVec 32) V!30891 V!30891 (_ BitVec 32) Int) Unit!31000)

(assert (=> b!918289 (= lt!412200 (lemmaListMapRecursiveValidKeyArray!16 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!918290 () Bool)

(declare-fun res!619127 () Bool)

(declare-fun e!515501 () Bool)

(assert (=> b!918290 (=> (not res!619127) (not e!515501))))

(declare-datatypes ((List!18505 0))(
  ( (Nil!18502) (Cons!18501 (h!19647 (_ BitVec 64)) (t!26172 List!18505)) )
))
(declare-fun arrayNoDuplicates!0 (array!54874 (_ BitVec 32) List!18505) Bool)

(assert (=> b!918290 (= res!619127 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18502))))

(declare-fun b!918291 () Bool)

(declare-fun e!515499 () Bool)

(declare-fun e!515498 () Bool)

(declare-fun mapRes!30924 () Bool)

(assert (=> b!918291 (= e!515499 (and e!515498 mapRes!30924))))

(declare-fun condMapEmpty!30924 () Bool)

(declare-fun mapDefault!30924 () ValueCell!9241)

