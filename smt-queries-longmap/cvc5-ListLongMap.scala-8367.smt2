; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101784 () Bool)

(assert start!101784)

(declare-fun b_free!26473 () Bool)

(declare-fun b_next!26473 () Bool)

(assert (=> start!101784 (= b_free!26473 (not b_next!26473))))

(declare-fun tp!92464 () Bool)

(declare-fun b_and!44207 () Bool)

(assert (=> start!101784 (= tp!92464 b_and!44207)))

(declare-fun b!1225989 () Bool)

(declare-fun res!814786 () Bool)

(declare-fun e!696299 () Bool)

(assert (=> b!1225989 (=> (not res!814786) (not e!696299))))

(declare-datatypes ((array!79131 0))(
  ( (array!79132 (arr!38192 (Array (_ BitVec 32) (_ BitVec 64))) (size!38728 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!79131)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1225989 (= res!814786 (= (select (arr!38192 _keys!1208) i!673) k!934))))

(declare-fun mapIsEmpty!48664 () Bool)

(declare-fun mapRes!48664 () Bool)

(assert (=> mapIsEmpty!48664 mapRes!48664))

(declare-fun b!1225990 () Bool)

(declare-fun res!814777 () Bool)

(assert (=> b!1225990 (=> (not res!814777) (not e!696299))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1225990 (= res!814777 (validKeyInArray!0 k!934))))

(declare-fun b!1225991 () Bool)

(declare-fun e!696297 () Bool)

(declare-fun e!696301 () Bool)

(assert (=> b!1225991 (= e!696297 (and e!696301 mapRes!48664))))

(declare-fun condMapEmpty!48664 () Bool)

(declare-datatypes ((V!46697 0))(
  ( (V!46698 (val!15645 Int)) )
))
(declare-datatypes ((ValueCell!14879 0))(
  ( (ValueCellFull!14879 (v!18307 V!46697)) (EmptyCell!14879) )
))
(declare-datatypes ((array!79133 0))(
  ( (array!79134 (arr!38193 (Array (_ BitVec 32) ValueCell!14879)) (size!38729 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!79133)

(declare-fun mapDefault!48664 () ValueCell!14879)

