; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99296 () Bool)

(assert start!99296)

(declare-fun b_free!24875 () Bool)

(declare-fun b_next!24875 () Bool)

(assert (=> start!99296 (= b_free!24875 (not b_next!24875))))

(declare-fun tp!87339 () Bool)

(declare-fun b_and!40617 () Bool)

(assert (=> start!99296 (= tp!87339 b_and!40617)))

(declare-fun b!1169954 () Bool)

(declare-fun res!776384 () Bool)

(declare-fun e!664955 () Bool)

(assert (=> b!1169954 (=> (not res!776384) (not e!664955))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1169954 (= res!776384 (validKeyInArray!0 k!934))))

(declare-fun b!1169955 () Bool)

(declare-fun e!664952 () Bool)

(declare-fun e!664948 () Bool)

(declare-fun mapRes!45935 () Bool)

(assert (=> b!1169955 (= e!664952 (and e!664948 mapRes!45935))))

(declare-fun condMapEmpty!45935 () Bool)

(declare-datatypes ((V!44333 0))(
  ( (V!44334 (val!14759 Int)) )
))
(declare-datatypes ((ValueCell!13993 0))(
  ( (ValueCellFull!13993 (v!17397 V!44333)) (EmptyCell!13993) )
))
(declare-datatypes ((array!75631 0))(
  ( (array!75632 (arr!36465 (Array (_ BitVec 32) ValueCell!13993)) (size!37001 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75631)

(declare-fun mapDefault!45935 () ValueCell!13993)

