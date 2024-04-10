; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39818 () Bool)

(assert start!39818)

(declare-fun b_free!10085 () Bool)

(declare-fun b_next!10085 () Bool)

(assert (=> start!39818 (= b_free!10085 (not b_next!10085))))

(declare-fun tp!35783 () Bool)

(declare-fun b_and!17829 () Bool)

(assert (=> start!39818 (= tp!35783 b_and!17829)))

(declare-fun b!429846 () Bool)

(declare-fun e!254547 () Bool)

(declare-fun tp_is_empty!11237 () Bool)

(assert (=> b!429846 (= e!254547 tp_is_empty!11237)))

(declare-fun b!429847 () Bool)

(declare-fun res!252502 () Bool)

(declare-fun e!254542 () Bool)

(assert (=> b!429847 (=> (not res!252502) (not e!254542))))

(declare-datatypes ((array!26309 0))(
  ( (array!26310 (arr!12604 (Array (_ BitVec 32) (_ BitVec 64))) (size!12956 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26309)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!429847 (= res!252502 (or (= (select (arr!12604 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12604 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!429848 () Bool)

(declare-datatypes ((Unit!12637 0))(
  ( (Unit!12638) )
))
(declare-fun e!254543 () Unit!12637)

(declare-fun Unit!12639 () Unit!12637)

(assert (=> b!429848 (= e!254543 Unit!12639)))

(declare-fun b!429849 () Bool)

(declare-fun res!252503 () Bool)

(assert (=> b!429849 (=> (not res!252503) (not e!254542))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!429849 (= res!252503 (validKeyInArray!0 k!794))))

(declare-fun b!429850 () Bool)

(declare-fun res!252497 () Bool)

(declare-fun e!254548 () Bool)

(assert (=> b!429850 (=> (not res!252497) (not e!254548))))

(declare-fun lt!196474 () array!26309)

(declare-datatypes ((List!7474 0))(
  ( (Nil!7471) (Cons!7470 (h!8326 (_ BitVec 64)) (t!13008 List!7474)) )
))
(declare-fun arrayNoDuplicates!0 (array!26309 (_ BitVec 32) List!7474) Bool)

(assert (=> b!429850 (= res!252497 (arrayNoDuplicates!0 lt!196474 #b00000000000000000000000000000000 Nil!7471))))

(declare-fun b!429851 () Bool)

(declare-fun e!254545 () Bool)

(declare-fun mapRes!18477 () Bool)

(assert (=> b!429851 (= e!254545 (and e!254547 mapRes!18477))))

(declare-fun condMapEmpty!18477 () Bool)

(declare-datatypes ((V!16087 0))(
  ( (V!16088 (val!5663 Int)) )
))
(declare-datatypes ((ValueCell!5275 0))(
  ( (ValueCellFull!5275 (v!7910 V!16087)) (EmptyCell!5275) )
))
(declare-datatypes ((array!26311 0))(
  ( (array!26312 (arr!12605 (Array (_ BitVec 32) ValueCell!5275)) (size!12957 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26311)

(declare-fun mapDefault!18477 () ValueCell!5275)

