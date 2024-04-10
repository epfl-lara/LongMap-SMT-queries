; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95612 () Bool)

(assert start!95612)

(declare-fun b_free!22265 () Bool)

(declare-fun b_next!22265 () Bool)

(assert (=> start!95612 (= b_free!22265 (not b_next!22265))))

(declare-fun tp!78643 () Bool)

(declare-fun b_and!35243 () Bool)

(assert (=> start!95612 (= tp!78643 b_and!35243)))

(declare-fun b!1080285 () Bool)

(declare-fun res!719976 () Bool)

(declare-fun e!617565 () Bool)

(assert (=> b!1080285 (=> (not res!719976) (not e!617565))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1080285 (= res!719976 (validKeyInArray!0 k!904))))

(declare-fun b!1080286 () Bool)

(declare-fun e!617564 () Bool)

(declare-fun e!617562 () Bool)

(declare-fun mapRes!41155 () Bool)

(assert (=> b!1080286 (= e!617564 (and e!617562 mapRes!41155))))

(declare-fun condMapEmpty!41155 () Bool)

(declare-datatypes ((V!40149 0))(
  ( (V!40150 (val!13190 Int)) )
))
(declare-datatypes ((ValueCell!12424 0))(
  ( (ValueCellFull!12424 (v!15811 V!40149)) (EmptyCell!12424) )
))
(declare-datatypes ((array!69487 0))(
  ( (array!69488 (arr!33417 (Array (_ BitVec 32) ValueCell!12424)) (size!33953 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69487)

(declare-fun mapDefault!41155 () ValueCell!12424)

