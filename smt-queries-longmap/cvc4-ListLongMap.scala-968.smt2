; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20990 () Bool)

(assert start!20990)

(declare-fun b_free!5561 () Bool)

(declare-fun b_next!5561 () Bool)

(assert (=> start!20990 (= b_free!5561 (not b_next!5561))))

(declare-fun tp!19736 () Bool)

(declare-fun b_and!12355 () Bool)

(assert (=> start!20990 (= tp!19736 b_and!12355)))

(declare-datatypes ((V!6877 0))(
  ( (V!6878 (val!2756 Int)) )
))
(declare-datatypes ((tuple2!4164 0))(
  ( (tuple2!4165 (_1!2093 (_ BitVec 64)) (_2!2093 V!6877)) )
))
(declare-fun lt!108369 () tuple2!4164)

(declare-datatypes ((List!3058 0))(
  ( (Nil!3055) (Cons!3054 (h!3696 tuple2!4164) (t!7997 List!3058)) )
))
(declare-datatypes ((ListLongMap!3077 0))(
  ( (ListLongMap!3078 (toList!1554 List!3058)) )
))
(declare-fun lt!108363 () ListLongMap!3077)

(declare-fun e!137349 () Bool)

(declare-fun lt!108375 () ListLongMap!3077)

(declare-fun b!210960 () Bool)

(declare-fun +!557 (ListLongMap!3077 tuple2!4164) ListLongMap!3077)

(assert (=> b!210960 (= e!137349 (= (+!557 lt!108375 lt!108369) lt!108363))))

(declare-fun lt!108367 () tuple2!4164)

(declare-fun lt!108368 () ListLongMap!3077)

(declare-fun lt!108374 () ListLongMap!3077)

(assert (=> b!210960 (= (+!557 lt!108374 lt!108367) (+!557 lt!108368 lt!108369))))

(declare-fun lt!108360 () ListLongMap!3077)

(declare-fun minValue!615 () V!6877)

(declare-datatypes ((Unit!6404 0))(
  ( (Unit!6405) )
))
(declare-fun lt!108371 () Unit!6404)

(declare-fun v!520 () V!6877)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun addCommutativeForDiffKeys!202 (ListLongMap!3077 (_ BitVec 64) V!6877 (_ BitVec 64) V!6877) Unit!6404)

(assert (=> b!210960 (= lt!108371 (addCommutativeForDiffKeys!202 lt!108360 k!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!210961 () Bool)

(declare-fun res!102999 () Bool)

(declare-fun e!137350 () Bool)

(assert (=> b!210961 (=> (not res!102999) (not e!137350))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!210961 (= res!102999 (validKeyInArray!0 k!843))))

(declare-fun b!210962 () Bool)

(declare-fun e!137346 () Bool)

(declare-fun e!137347 () Bool)

(declare-fun mapRes!9215 () Bool)

(assert (=> b!210962 (= e!137346 (and e!137347 mapRes!9215))))

(declare-fun condMapEmpty!9215 () Bool)

(declare-datatypes ((ValueCell!2368 0))(
  ( (ValueCellFull!2368 (v!4742 V!6877)) (EmptyCell!2368) )
))
(declare-datatypes ((array!10047 0))(
  ( (array!10048 (arr!4770 (Array (_ BitVec 32) ValueCell!2368)) (size!5095 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10047)

(declare-fun mapDefault!9215 () ValueCell!2368)

