; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20854 () Bool)

(assert start!20854)

(declare-fun b_free!5507 () Bool)

(declare-fun b_next!5507 () Bool)

(assert (=> start!20854 (= b_free!5507 (not b_next!5507))))

(declare-fun tp!19562 () Bool)

(declare-fun b_and!12253 () Bool)

(assert (=> start!20854 (= tp!19562 b_and!12253)))

(declare-fun b!209270 () Bool)

(declare-fun res!101980 () Bool)

(declare-fun e!136361 () Bool)

(assert (=> b!209270 (=> (not res!101980) (not e!136361))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9937 0))(
  ( (array!9938 (arr!4719 (Array (_ BitVec 32) (_ BitVec 64))) (size!5044 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9937)

(assert (=> b!209270 (= res!101980 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5044 _keys!825))))))

(declare-fun b!209271 () Bool)

(declare-fun e!136360 () Bool)

(declare-fun tp_is_empty!5369 () Bool)

(assert (=> b!209271 (= e!136360 tp_is_empty!5369)))

(declare-fun b!209272 () Bool)

(declare-fun res!101978 () Bool)

(assert (=> b!209272 (=> (not res!101978) (not e!136361))))

(declare-fun k!843 () (_ BitVec 64))

(assert (=> b!209272 (= res!101978 (= (select (arr!4719 _keys!825) i!601) k!843))))

(declare-fun b!209273 () Bool)

(declare-fun res!101977 () Bool)

(assert (=> b!209273 (=> (not res!101977) (not e!136361))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!209273 (= res!101977 (validKeyInArray!0 k!843))))

(declare-fun b!209274 () Bool)

(declare-fun e!136362 () Bool)

(declare-fun mapRes!9122 () Bool)

(assert (=> b!209274 (= e!136362 (and e!136360 mapRes!9122))))

(declare-fun condMapEmpty!9122 () Bool)

(declare-datatypes ((V!6805 0))(
  ( (V!6806 (val!2729 Int)) )
))
(declare-datatypes ((ValueCell!2341 0))(
  ( (ValueCellFull!2341 (v!4699 V!6805)) (EmptyCell!2341) )
))
(declare-datatypes ((array!9939 0))(
  ( (array!9940 (arr!4720 (Array (_ BitVec 32) ValueCell!2341)) (size!5045 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9939)

(declare-fun mapDefault!9122 () ValueCell!2341)

