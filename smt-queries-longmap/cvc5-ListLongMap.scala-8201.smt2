; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100072 () Bool)

(assert start!100072)

(declare-fun b_free!25651 () Bool)

(declare-fun b_next!25651 () Bool)

(assert (=> start!100072 (= b_free!25651 (not b_next!25651))))

(declare-fun tp!89667 () Bool)

(declare-fun b_and!42169 () Bool)

(assert (=> start!100072 (= tp!89667 b_and!42169)))

(declare-fun b!1192972 () Bool)

(declare-fun res!793654 () Bool)

(declare-fun e!678054 () Bool)

(assert (=> b!1192972 (=> (not res!793654) (not e!678054))))

(declare-datatypes ((array!77145 0))(
  ( (array!77146 (arr!37222 (Array (_ BitVec 32) (_ BitVec 64))) (size!37758 (_ BitVec 32))) )
))
(declare-fun lt!542421 () array!77145)

(declare-datatypes ((List!26217 0))(
  ( (Nil!26214) (Cons!26213 (h!27422 (_ BitVec 64)) (t!38860 List!26217)) )
))
(declare-fun arrayNoDuplicates!0 (array!77145 (_ BitVec 32) List!26217) Bool)

(assert (=> b!1192972 (= res!793654 (arrayNoDuplicates!0 lt!542421 #b00000000000000000000000000000000 Nil!26214))))

(declare-fun b!1192973 () Bool)

(declare-fun e!678052 () Bool)

(declare-fun tp_is_empty!30181 () Bool)

(assert (=> b!1192973 (= e!678052 tp_is_empty!30181)))

(declare-fun b!1192974 () Bool)

(declare-fun res!793653 () Bool)

(declare-fun e!678058 () Bool)

(assert (=> b!1192974 (=> (not res!793653) (not e!678058))))

(declare-fun _keys!1208 () array!77145)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45369 0))(
  ( (V!45370 (val!15147 Int)) )
))
(declare-datatypes ((ValueCell!14381 0))(
  ( (ValueCellFull!14381 (v!17785 V!45369)) (EmptyCell!14381) )
))
(declare-datatypes ((array!77147 0))(
  ( (array!77148 (arr!37223 (Array (_ BitVec 32) ValueCell!14381)) (size!37759 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77147)

(assert (=> b!1192974 (= res!793653 (and (= (size!37759 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37758 _keys!1208) (size!37759 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1192975 () Bool)

(assert (=> b!1192975 (= e!678058 e!678054)))

(declare-fun res!793662 () Bool)

(assert (=> b!1192975 (=> (not res!793662) (not e!678054))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77145 (_ BitVec 32)) Bool)

(assert (=> b!1192975 (= res!793662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542421 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1192975 (= lt!542421 (array!77146 (store (arr!37222 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37758 _keys!1208)))))

(declare-fun b!1192976 () Bool)

(declare-fun res!793661 () Bool)

(assert (=> b!1192976 (=> (not res!793661) (not e!678058))))

(assert (=> b!1192976 (= res!793661 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26214))))

(declare-fun b!1192977 () Bool)

(declare-fun e!678057 () Bool)

(declare-fun e!678055 () Bool)

(declare-fun mapRes!47099 () Bool)

(assert (=> b!1192977 (= e!678057 (and e!678055 mapRes!47099))))

(declare-fun condMapEmpty!47099 () Bool)

(declare-fun mapDefault!47099 () ValueCell!14381)

