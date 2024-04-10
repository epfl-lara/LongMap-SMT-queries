; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73084 () Bool)

(assert start!73084)

(declare-fun b_free!13999 () Bool)

(declare-fun b_next!13999 () Bool)

(assert (=> start!73084 (= b_free!13999 (not b_next!13999))))

(declare-fun tp!49500 () Bool)

(declare-fun b_and!23157 () Bool)

(assert (=> start!73084 (= tp!49500 b_and!23157)))

(declare-fun b!850131 () Bool)

(declare-fun res!577515 () Bool)

(declare-fun e!474254 () Bool)

(assert (=> b!850131 (=> (not res!577515) (not e!474254))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!850131 (= res!577515 (validMask!0 mask!1196))))

(declare-fun b!850132 () Bool)

(declare-fun e!474252 () Bool)

(declare-fun e!474256 () Bool)

(declare-fun mapRes!25802 () Bool)

(assert (=> b!850132 (= e!474252 (and e!474256 mapRes!25802))))

(declare-fun condMapEmpty!25802 () Bool)

(declare-datatypes ((V!26561 0))(
  ( (V!26562 (val!8115 Int)) )
))
(declare-datatypes ((ValueCell!7628 0))(
  ( (ValueCellFull!7628 (v!10540 V!26561)) (EmptyCell!7628) )
))
(declare-datatypes ((array!48476 0))(
  ( (array!48477 (arr!23269 (Array (_ BitVec 32) ValueCell!7628)) (size!23709 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48476)

(declare-fun mapDefault!25802 () ValueCell!7628)

