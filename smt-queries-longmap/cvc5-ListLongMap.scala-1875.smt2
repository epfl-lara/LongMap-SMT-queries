; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33684 () Bool)

(assert start!33684)

(declare-fun b_free!6919 () Bool)

(declare-fun b_next!6919 () Bool)

(assert (=> start!33684 (= b_free!6919 (not b_next!6919))))

(declare-fun tp!24261 () Bool)

(declare-fun b_and!14099 () Bool)

(assert (=> start!33684 (= tp!24261 b_and!14099)))

(declare-fun b!334668 () Bool)

(declare-fun res!184542 () Bool)

(declare-fun e!205422 () Bool)

(assert (=> b!334668 (=> (not res!184542) (not e!205422))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!334668 (= res!184542 (validKeyInArray!0 k!1348))))

(declare-fun mapIsEmpty!11703 () Bool)

(declare-fun mapRes!11703 () Bool)

(assert (=> mapIsEmpty!11703 mapRes!11703))

(declare-fun res!184540 () Bool)

(assert (=> start!33684 (=> (not res!184540) (not e!205422))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33684 (= res!184540 (validMask!0 mask!2385))))

(assert (=> start!33684 e!205422))

(assert (=> start!33684 true))

(declare-fun tp_is_empty!6871 () Bool)

(assert (=> start!33684 tp_is_empty!6871))

(assert (=> start!33684 tp!24261))

(declare-datatypes ((V!10139 0))(
  ( (V!10140 (val!3480 Int)) )
))
(declare-datatypes ((ValueCell!3092 0))(
  ( (ValueCellFull!3092 (v!5642 V!10139)) (EmptyCell!3092) )
))
(declare-datatypes ((array!17335 0))(
  ( (array!17336 (arr!8198 (Array (_ BitVec 32) ValueCell!3092)) (size!8550 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17335)

(declare-fun e!205420 () Bool)

(declare-fun array_inv!6094 (array!17335) Bool)

(assert (=> start!33684 (and (array_inv!6094 _values!1525) e!205420)))

(declare-datatypes ((array!17337 0))(
  ( (array!17338 (arr!8199 (Array (_ BitVec 32) (_ BitVec 64))) (size!8551 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17337)

(declare-fun array_inv!6095 (array!17337) Bool)

(assert (=> start!33684 (array_inv!6095 _keys!1895)))

(declare-fun b!334669 () Bool)

(declare-fun e!205425 () Bool)

(assert (=> b!334669 (= e!205425 tp_is_empty!6871)))

(declare-fun b!334670 () Bool)

(declare-fun e!205421 () Bool)

(assert (=> b!334670 (= e!205420 (and e!205421 mapRes!11703))))

(declare-fun condMapEmpty!11703 () Bool)

(declare-fun mapDefault!11703 () ValueCell!3092)

