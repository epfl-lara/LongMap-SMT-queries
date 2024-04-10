; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39800 () Bool)

(assert start!39800)

(declare-fun b_free!10067 () Bool)

(declare-fun b_next!10067 () Bool)

(assert (=> start!39800 (= b_free!10067 (not b_next!10067))))

(declare-fun tp!35729 () Bool)

(declare-fun b_and!17793 () Bool)

(assert (=> start!39800 (= tp!35729 b_and!17793)))

(declare-fun b!429315 () Bool)

(declare-fun e!254302 () Bool)

(declare-fun tp_is_empty!11219 () Bool)

(assert (=> b!429315 (= e!254302 tp_is_empty!11219)))

(declare-fun b!429316 () Bool)

(declare-fun res!252118 () Bool)

(declare-fun e!254303 () Bool)

(assert (=> b!429316 (=> (not res!252118) (not e!254303))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!429316 (= res!252118 (validMask!0 mask!1025))))

(declare-fun b!429317 () Bool)

(declare-fun res!252123 () Bool)

(assert (=> b!429317 (=> (not res!252123) (not e!254303))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!429317 (= res!252123 (validKeyInArray!0 k!794))))

(declare-fun b!429318 () Bool)

(declare-fun e!254307 () Bool)

(declare-fun e!254306 () Bool)

(declare-fun mapRes!18450 () Bool)

(assert (=> b!429318 (= e!254307 (and e!254306 mapRes!18450))))

(declare-fun condMapEmpty!18450 () Bool)

(declare-datatypes ((V!16063 0))(
  ( (V!16064 (val!5654 Int)) )
))
(declare-datatypes ((ValueCell!5266 0))(
  ( (ValueCellFull!5266 (v!7901 V!16063)) (EmptyCell!5266) )
))
(declare-datatypes ((array!26275 0))(
  ( (array!26276 (arr!12587 (Array (_ BitVec 32) ValueCell!5266)) (size!12939 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26275)

(declare-fun mapDefault!18450 () ValueCell!5266)

