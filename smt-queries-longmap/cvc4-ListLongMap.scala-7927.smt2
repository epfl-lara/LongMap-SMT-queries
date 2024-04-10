; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98406 () Bool)

(assert start!98406)

(declare-fun b_free!24011 () Bool)

(declare-fun b_next!24011 () Bool)

(assert (=> start!98406 (= b_free!24011 (not b_next!24011))))

(declare-fun tp!84743 () Bool)

(declare-fun b_and!38871 () Bool)

(assert (=> start!98406 (= tp!84743 b_and!38871)))

(declare-fun b!1135742 () Bool)

(declare-fun res!758091 () Bool)

(declare-fun e!646318 () Bool)

(assert (=> b!1135742 (=> (not res!758091) (not e!646318))))

(declare-datatypes ((array!73943 0))(
  ( (array!73944 (arr!35622 (Array (_ BitVec 32) (_ BitVec 64))) (size!36158 (_ BitVec 32))) )
))
(declare-fun lt!504918 () array!73943)

(declare-datatypes ((List!24842 0))(
  ( (Nil!24839) (Cons!24838 (h!26047 (_ BitVec 64)) (t!35845 List!24842)) )
))
(declare-fun arrayNoDuplicates!0 (array!73943 (_ BitVec 32) List!24842) Bool)

(assert (=> b!1135742 (= res!758091 (arrayNoDuplicates!0 lt!504918 #b00000000000000000000000000000000 Nil!24839))))

(declare-fun b!1135743 () Bool)

(declare-fun e!646329 () Bool)

(assert (=> b!1135743 (= e!646329 true)))

(declare-fun lt!504915 () Bool)

(declare-fun contains!6575 (List!24842 (_ BitVec 64)) Bool)

(assert (=> b!1135743 (= lt!504915 (contains!6575 Nil!24839 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1135744 () Bool)

(declare-fun res!758092 () Bool)

(declare-fun e!646326 () Bool)

(assert (=> b!1135744 (=> (not res!758092) (not e!646326))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1135744 (= res!758092 (validKeyInArray!0 k!934))))

(declare-fun b!1135745 () Bool)

(declare-fun e!646328 () Bool)

(declare-fun e!646324 () Bool)

(declare-fun mapRes!44636 () Bool)

(assert (=> b!1135745 (= e!646328 (and e!646324 mapRes!44636))))

(declare-fun condMapEmpty!44636 () Bool)

(declare-datatypes ((V!43181 0))(
  ( (V!43182 (val!14327 Int)) )
))
(declare-datatypes ((ValueCell!13561 0))(
  ( (ValueCellFull!13561 (v!16964 V!43181)) (EmptyCell!13561) )
))
(declare-datatypes ((array!73945 0))(
  ( (array!73946 (arr!35623 (Array (_ BitVec 32) ValueCell!13561)) (size!36159 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73945)

(declare-fun mapDefault!44636 () ValueCell!13561)

