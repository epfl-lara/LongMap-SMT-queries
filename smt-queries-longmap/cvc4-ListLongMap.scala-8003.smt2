; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98862 () Bool)

(assert start!98862)

(declare-fun b_free!24467 () Bool)

(declare-fun b_next!24467 () Bool)

(assert (=> start!98862 (= b_free!24467 (not b_next!24467))))

(declare-fun tp!86112 () Bool)

(declare-fun b_and!39783 () Bool)

(assert (=> start!98862 (= tp!86112 b_and!39783)))

(declare-fun b!1156494 () Bool)

(declare-datatypes ((Unit!38096 0))(
  ( (Unit!38097) )
))
(declare-fun e!657698 () Unit!38096)

(declare-fun e!657707 () Unit!38096)

(assert (=> b!1156494 (= e!657698 e!657707)))

(declare-fun c!115061 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!519158 () Bool)

(assert (=> b!1156494 (= c!115061 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!519158))))

(declare-fun b!1156495 () Bool)

(declare-fun res!768181 () Bool)

(declare-fun e!657700 () Bool)

(assert (=> b!1156495 (=> (not res!768181) (not e!657700))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1156495 (= res!768181 (validKeyInArray!0 k!934))))

(declare-fun b!1156496 () Bool)

(declare-fun res!768174 () Bool)

(assert (=> b!1156496 (=> (not res!768174) (not e!657700))))

(declare-datatypes ((array!74841 0))(
  ( (array!74842 (arr!36071 (Array (_ BitVec 32) (_ BitVec 64))) (size!36607 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74841)

(declare-datatypes ((List!25259 0))(
  ( (Nil!25256) (Cons!25255 (h!26464 (_ BitVec 64)) (t!36718 List!25259)) )
))
(declare-fun arrayNoDuplicates!0 (array!74841 (_ BitVec 32) List!25259) Bool)

(assert (=> b!1156496 (= res!768174 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25256))))

(declare-fun b!1156497 () Bool)

(declare-fun e!657694 () Bool)

(declare-fun e!657702 () Bool)

(declare-fun mapRes!45320 () Bool)

(assert (=> b!1156497 (= e!657694 (and e!657702 mapRes!45320))))

(declare-fun condMapEmpty!45320 () Bool)

(declare-datatypes ((V!43789 0))(
  ( (V!43790 (val!14555 Int)) )
))
(declare-datatypes ((ValueCell!13789 0))(
  ( (ValueCellFull!13789 (v!17192 V!43789)) (EmptyCell!13789) )
))
(declare-datatypes ((array!74843 0))(
  ( (array!74844 (arr!36072 (Array (_ BitVec 32) ValueCell!13789)) (size!36608 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74843)

(declare-fun mapDefault!45320 () ValueCell!13789)

