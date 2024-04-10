; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41850 () Bool)

(assert start!41850)

(declare-fun b_free!11453 () Bool)

(declare-fun b_next!11453 () Bool)

(assert (=> start!41850 (= b_free!11453 (not b_next!11453))))

(declare-fun tp!40369 () Bool)

(declare-fun b_and!19833 () Bool)

(assert (=> start!41850 (= tp!40369 b_and!19833)))

(declare-fun res!279299 () Bool)

(declare-fun e!273336 () Bool)

(assert (=> start!41850 (=> (not res!279299) (not e!273336))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41850 (= res!279299 (validMask!0 mask!1365))))

(assert (=> start!41850 e!273336))

(declare-fun tp_is_empty!12881 () Bool)

(assert (=> start!41850 tp_is_empty!12881))

(assert (=> start!41850 tp!40369))

(assert (=> start!41850 true))

(declare-datatypes ((array!29543 0))(
  ( (array!29544 (arr!14199 (Array (_ BitVec 32) (_ BitVec 64))) (size!14551 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29543)

(declare-fun array_inv!10250 (array!29543) Bool)

(assert (=> start!41850 (array_inv!10250 _keys!1025)))

(declare-datatypes ((V!18279 0))(
  ( (V!18280 (val!6485 Int)) )
))
(declare-datatypes ((ValueCell!6097 0))(
  ( (ValueCellFull!6097 (v!8774 V!18279)) (EmptyCell!6097) )
))
(declare-datatypes ((array!29545 0))(
  ( (array!29546 (arr!14200 (Array (_ BitVec 32) ValueCell!6097)) (size!14552 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29545)

(declare-fun e!273335 () Bool)

(declare-fun array_inv!10251 (array!29545) Bool)

(assert (=> start!41850 (and (array_inv!10251 _values!833) e!273335)))

(declare-fun b!467303 () Bool)

(declare-fun e!273338 () Bool)

(declare-fun mapRes!21010 () Bool)

(assert (=> b!467303 (= e!273335 (and e!273338 mapRes!21010))))

(declare-fun condMapEmpty!21010 () Bool)

(declare-fun mapDefault!21010 () ValueCell!6097)

