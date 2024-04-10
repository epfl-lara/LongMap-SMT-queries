; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35618 () Bool)

(assert start!35618)

(declare-fun b_free!7873 () Bool)

(declare-fun b_next!7873 () Bool)

(assert (=> start!35618 (= b_free!7873 (not b_next!7873))))

(declare-fun tp!27602 () Bool)

(declare-fun b_and!15115 () Bool)

(assert (=> start!35618 (= tp!27602 b_and!15115)))

(declare-fun b!357395 () Bool)

(declare-fun e!218843 () Bool)

(declare-fun tp_is_empty!8071 () Bool)

(assert (=> b!357395 (= e!218843 tp_is_empty!8071)))

(declare-fun res!198486 () Bool)

(declare-fun e!218838 () Bool)

(assert (=> start!35618 (=> (not res!198486) (not e!218838))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35618 (= res!198486 (validMask!0 mask!1842))))

(assert (=> start!35618 e!218838))

(assert (=> start!35618 tp_is_empty!8071))

(assert (=> start!35618 true))

(assert (=> start!35618 tp!27602))

(declare-datatypes ((array!19709 0))(
  ( (array!19710 (arr!9348 (Array (_ BitVec 32) (_ BitVec 64))) (size!9700 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19709)

(declare-fun array_inv!6872 (array!19709) Bool)

(assert (=> start!35618 (array_inv!6872 _keys!1456)))

(declare-datatypes ((V!11739 0))(
  ( (V!11740 (val!4080 Int)) )
))
(declare-datatypes ((ValueCell!3692 0))(
  ( (ValueCellFull!3692 (v!6274 V!11739)) (EmptyCell!3692) )
))
(declare-datatypes ((array!19711 0))(
  ( (array!19712 (arr!9349 (Array (_ BitVec 32) ValueCell!3692)) (size!9701 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19711)

(declare-fun e!218839 () Bool)

(declare-fun array_inv!6873 (array!19711) Bool)

(assert (=> start!35618 (and (array_inv!6873 _values!1208) e!218839)))

(declare-fun b!357396 () Bool)

(declare-fun res!198485 () Bool)

(assert (=> b!357396 (=> (not res!198485) (not e!218838))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k!1077 () (_ BitVec 64))

(assert (=> b!357396 (= res!198485 (not (= (select (arr!9348 _keys!1456) from!1805) k!1077)))))

(declare-fun b!357397 () Bool)

(declare-fun mapRes!13614 () Bool)

(assert (=> b!357397 (= e!218839 (and e!218843 mapRes!13614))))

(declare-fun condMapEmpty!13614 () Bool)

(declare-fun mapDefault!13614 () ValueCell!3692)

