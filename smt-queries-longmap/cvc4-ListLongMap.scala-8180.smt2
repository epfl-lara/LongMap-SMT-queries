; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99950 () Bool)

(assert start!99950)

(declare-fun b_free!25529 () Bool)

(declare-fun b_next!25529 () Bool)

(assert (=> start!99950 (= b_free!25529 (not b_next!25529))))

(declare-fun tp!89301 () Bool)

(declare-fun b_and!41925 () Bool)

(assert (=> start!99950 (= tp!89301 b_and!41925)))

(declare-fun b!1190105 () Bool)

(declare-fun res!791466 () Bool)

(declare-fun e!676588 () Bool)

(assert (=> b!1190105 (=> (not res!791466) (not e!676588))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1190105 (= res!791466 (validKeyInArray!0 k!934))))

(declare-fun b!1190106 () Bool)

(declare-fun res!791464 () Bool)

(assert (=> b!1190106 (=> (not res!791464) (not e!676588))))

(declare-datatypes ((array!76909 0))(
  ( (array!76910 (arr!37104 (Array (_ BitVec 32) (_ BitVec 64))) (size!37640 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76909)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76909 (_ BitVec 32)) Bool)

(assert (=> b!1190106 (= res!791464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1190107 () Bool)

(declare-fun e!676590 () Bool)

(assert (=> b!1190107 (= e!676588 e!676590)))

(declare-fun res!791462 () Bool)

(assert (=> b!1190107 (=> (not res!791462) (not e!676590))))

(declare-fun lt!541322 () array!76909)

(assert (=> b!1190107 (= res!791462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541322 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1190107 (= lt!541322 (array!76910 (store (arr!37104 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37640 _keys!1208)))))

(declare-fun b!1190108 () Bool)

(declare-fun res!791458 () Bool)

(assert (=> b!1190108 (=> (not res!791458) (not e!676588))))

(assert (=> b!1190108 (= res!791458 (= (select (arr!37104 _keys!1208) i!673) k!934))))

(declare-fun b!1190109 () Bool)

(declare-fun res!791463 () Bool)

(assert (=> b!1190109 (=> (not res!791463) (not e!676588))))

(declare-datatypes ((List!26122 0))(
  ( (Nil!26119) (Cons!26118 (h!27327 (_ BitVec 64)) (t!38643 List!26122)) )
))
(declare-fun arrayNoDuplicates!0 (array!76909 (_ BitVec 32) List!26122) Bool)

(assert (=> b!1190109 (= res!791463 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26119))))

(declare-fun b!1190110 () Bool)

(declare-fun res!791459 () Bool)

(assert (=> b!1190110 (=> (not res!791459) (not e!676590))))

(assert (=> b!1190110 (= res!791459 (arrayNoDuplicates!0 lt!541322 #b00000000000000000000000000000000 Nil!26119))))

(declare-fun b!1190111 () Bool)

(declare-fun e!676592 () Bool)

(declare-fun e!676594 () Bool)

(declare-fun mapRes!46916 () Bool)

(assert (=> b!1190111 (= e!676592 (and e!676594 mapRes!46916))))

(declare-fun condMapEmpty!46916 () Bool)

(declare-datatypes ((V!45205 0))(
  ( (V!45206 (val!15086 Int)) )
))
(declare-datatypes ((ValueCell!14320 0))(
  ( (ValueCellFull!14320 (v!17724 V!45205)) (EmptyCell!14320) )
))
(declare-datatypes ((array!76911 0))(
  ( (array!76912 (arr!37105 (Array (_ BitVec 32) ValueCell!14320)) (size!37641 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76911)

(declare-fun mapDefault!46916 () ValueCell!14320)

