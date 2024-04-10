; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100018 () Bool)

(assert start!100018)

(declare-fun b_free!25597 () Bool)

(declare-fun b_next!25597 () Bool)

(assert (=> start!100018 (= b_free!25597 (not b_next!25597))))

(declare-fun tp!89504 () Bool)

(declare-fun b_and!42061 () Bool)

(assert (=> start!100018 (= tp!89504 b_and!42061)))

(declare-fun b!1191703 () Bool)

(declare-fun res!792690 () Bool)

(declare-fun e!677410 () Bool)

(assert (=> b!1191703 (=> (not res!792690) (not e!677410))))

(declare-datatypes ((array!77045 0))(
  ( (array!77046 (arr!37172 (Array (_ BitVec 32) (_ BitVec 64))) (size!37708 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77045)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1191703 (= res!792690 (= (select (arr!37172 _keys!1208) i!673) k!934))))

(declare-fun b!1191704 () Bool)

(declare-fun e!677406 () Bool)

(assert (=> b!1191704 (= e!677410 e!677406)))

(declare-fun res!792682 () Bool)

(assert (=> b!1191704 (=> (not res!792682) (not e!677406))))

(declare-fun lt!541937 () array!77045)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77045 (_ BitVec 32)) Bool)

(assert (=> b!1191704 (= res!792682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541937 mask!1564))))

(assert (=> b!1191704 (= lt!541937 (array!77046 (store (arr!37172 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37708 _keys!1208)))))

(declare-fun b!1191705 () Bool)

(declare-fun e!677407 () Bool)

(assert (=> b!1191705 (= e!677406 (not e!677407))))

(declare-fun res!792684 () Bool)

(assert (=> b!1191705 (=> res!792684 e!677407)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1191705 (= res!792684 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77045 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1191705 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39532 0))(
  ( (Unit!39533) )
))
(declare-fun lt!541938 () Unit!39532)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77045 (_ BitVec 64) (_ BitVec 32)) Unit!39532)

(assert (=> b!1191705 (= lt!541938 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1191706 () Bool)

(declare-fun e!677403 () Bool)

(declare-fun e!677404 () Bool)

(declare-fun mapRes!47018 () Bool)

(assert (=> b!1191706 (= e!677403 (and e!677404 mapRes!47018))))

(declare-fun condMapEmpty!47018 () Bool)

(declare-datatypes ((V!45297 0))(
  ( (V!45298 (val!15120 Int)) )
))
(declare-datatypes ((ValueCell!14354 0))(
  ( (ValueCellFull!14354 (v!17758 V!45297)) (EmptyCell!14354) )
))
(declare-datatypes ((array!77047 0))(
  ( (array!77048 (arr!37173 (Array (_ BitVec 32) ValueCell!14354)) (size!37709 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77047)

(declare-fun mapDefault!47018 () ValueCell!14354)

