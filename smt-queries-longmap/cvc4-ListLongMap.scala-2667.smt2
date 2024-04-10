; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39824 () Bool)

(assert start!39824)

(declare-fun b_free!10091 () Bool)

(declare-fun b_next!10091 () Bool)

(assert (=> start!39824 (= b_free!10091 (not b_next!10091))))

(declare-fun tp!35801 () Bool)

(declare-fun b_and!17841 () Bool)

(assert (=> start!39824 (= tp!35801 b_and!17841)))

(declare-fun b!430023 () Bool)

(declare-fun res!252627 () Bool)

(declare-fun e!254623 () Bool)

(assert (=> b!430023 (=> (not res!252627) (not e!254623))))

(declare-datatypes ((array!26321 0))(
  ( (array!26322 (arr!12610 (Array (_ BitVec 32) (_ BitVec 64))) (size!12962 (_ BitVec 32))) )
))
(declare-fun lt!196563 () array!26321)

(declare-datatypes ((List!7479 0))(
  ( (Nil!7476) (Cons!7475 (h!8331 (_ BitVec 64)) (t!13019 List!7479)) )
))
(declare-fun arrayNoDuplicates!0 (array!26321 (_ BitVec 32) List!7479) Bool)

(assert (=> b!430023 (= res!252627 (arrayNoDuplicates!0 lt!196563 #b00000000000000000000000000000000 Nil!7476))))

(declare-fun b!430024 () Bool)

(declare-fun res!252630 () Bool)

(declare-fun e!254626 () Bool)

(assert (=> b!430024 (=> (not res!252630) (not e!254626))))

(declare-fun _keys!709 () array!26321)

(assert (=> b!430024 (= res!252630 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7476))))

(declare-fun b!430025 () Bool)

(declare-fun res!252619 () Bool)

(assert (=> b!430025 (=> (not res!252619) (not e!254626))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!430025 (= res!252619 (validMask!0 mask!1025))))

(declare-fun b!430026 () Bool)

(declare-fun res!252618 () Bool)

(assert (=> b!430026 (=> (not res!252618) (not e!254626))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!430026 (= res!252618 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12962 _keys!709))))))

(declare-fun b!430027 () Bool)

(declare-fun e!254628 () Bool)

(declare-fun e!254630 () Bool)

(declare-fun mapRes!18486 () Bool)

(assert (=> b!430027 (= e!254628 (and e!254630 mapRes!18486))))

(declare-fun condMapEmpty!18486 () Bool)

(declare-datatypes ((V!16095 0))(
  ( (V!16096 (val!5666 Int)) )
))
(declare-datatypes ((ValueCell!5278 0))(
  ( (ValueCellFull!5278 (v!7913 V!16095)) (EmptyCell!5278) )
))
(declare-datatypes ((array!26323 0))(
  ( (array!26324 (arr!12611 (Array (_ BitVec 32) ValueCell!5278)) (size!12963 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26323)

(declare-fun mapDefault!18486 () ValueCell!5278)

