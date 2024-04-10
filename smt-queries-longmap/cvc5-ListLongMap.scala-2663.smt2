; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39796 () Bool)

(assert start!39796)

(declare-fun b_free!10063 () Bool)

(declare-fun b_next!10063 () Bool)

(assert (=> start!39796 (= b_free!10063 (not b_next!10063))))

(declare-fun tp!35717 () Bool)

(declare-fun b_and!17785 () Bool)

(assert (=> start!39796 (= tp!35717 b_and!17785)))

(declare-fun b!429197 () Bool)

(declare-fun res!252042 () Bool)

(declare-fun e!254251 () Bool)

(assert (=> b!429197 (=> (not res!252042) (not e!254251))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!429197 (= res!252042 (validKeyInArray!0 k!794))))

(declare-fun b!429198 () Bool)

(declare-fun res!252031 () Bool)

(assert (=> b!429198 (=> (not res!252031) (not e!254251))))

(declare-datatypes ((array!26267 0))(
  ( (array!26268 (arr!12583 (Array (_ BitVec 32) (_ BitVec 64))) (size!12935 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26267)

(declare-datatypes ((List!7458 0))(
  ( (Nil!7455) (Cons!7454 (h!8310 (_ BitVec 64)) (t!12970 List!7458)) )
))
(declare-fun arrayNoDuplicates!0 (array!26267 (_ BitVec 32) List!7458) Bool)

(assert (=> b!429198 (= res!252031 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7455))))

(declare-fun b!429199 () Bool)

(declare-fun res!252032 () Bool)

(assert (=> b!429199 (=> (not res!252032) (not e!254251))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!429199 (= res!252032 (validMask!0 mask!1025))))

(declare-fun b!429200 () Bool)

(declare-fun e!254249 () Bool)

(declare-fun e!254250 () Bool)

(declare-fun mapRes!18444 () Bool)

(assert (=> b!429200 (= e!254249 (and e!254250 mapRes!18444))))

(declare-fun condMapEmpty!18444 () Bool)

(declare-datatypes ((V!16059 0))(
  ( (V!16060 (val!5652 Int)) )
))
(declare-datatypes ((ValueCell!5264 0))(
  ( (ValueCellFull!5264 (v!7899 V!16059)) (EmptyCell!5264) )
))
(declare-datatypes ((array!26269 0))(
  ( (array!26270 (arr!12584 (Array (_ BitVec 32) ValueCell!5264)) (size!12936 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26269)

(declare-fun mapDefault!18444 () ValueCell!5264)

