; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101666 () Bool)

(assert start!101666)

(declare-fun b_free!26387 () Bool)

(declare-fun b_next!26387 () Bool)

(assert (=> start!101666 (= b_free!26387 (not b_next!26387))))

(declare-fun tp!92204 () Bool)

(declare-fun b_and!44017 () Bool)

(assert (=> start!101666 (= tp!92204 b_and!44017)))

(declare-fun b!1223224 () Bool)

(declare-datatypes ((Unit!40526 0))(
  ( (Unit!40527) )
))
(declare-fun e!694704 () Unit!40526)

(declare-fun Unit!40528 () Unit!40526)

(assert (=> b!1223224 (= e!694704 Unit!40528)))

(declare-fun b!1223225 () Bool)

(declare-fun e!694696 () Bool)

(declare-fun e!694699 () Bool)

(declare-fun mapRes!48532 () Bool)

(assert (=> b!1223225 (= e!694696 (and e!694699 mapRes!48532))))

(declare-fun condMapEmpty!48532 () Bool)

(declare-datatypes ((V!46581 0))(
  ( (V!46582 (val!15602 Int)) )
))
(declare-datatypes ((ValueCell!14836 0))(
  ( (ValueCellFull!14836 (v!18263 V!46581)) (EmptyCell!14836) )
))
(declare-datatypes ((array!78965 0))(
  ( (array!78966 (arr!38110 (Array (_ BitVec 32) ValueCell!14836)) (size!38646 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78965)

(declare-fun mapDefault!48532 () ValueCell!14836)

