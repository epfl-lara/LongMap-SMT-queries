; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40012 () Bool)

(assert start!40012)

(declare-fun b_free!10279 () Bool)

(declare-fun b_next!10279 () Bool)

(assert (=> start!40012 (= b_free!10279 (not b_next!10279))))

(declare-fun tp!36366 () Bool)

(declare-fun b_and!18217 () Bool)

(assert (=> start!40012 (= tp!36366 b_and!18217)))

(declare-fun b!435850 () Bool)

(declare-fun res!256858 () Bool)

(declare-fun e!257451 () Bool)

(assert (=> b!435850 (=> (not res!256858) (not e!257451))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!435850 (= res!256858 (validMask!0 mask!1025))))

(declare-fun b!435851 () Bool)

(declare-fun e!257448 () Bool)

(assert (=> b!435851 (= e!257448 true)))

(declare-datatypes ((V!16347 0))(
  ( (V!16348 (val!5760 Int)) )
))
(declare-datatypes ((tuple2!7628 0))(
  ( (tuple2!7629 (_1!3825 (_ BitVec 64)) (_2!3825 V!16347)) )
))
(declare-datatypes ((List!7630 0))(
  ( (Nil!7627) (Cons!7626 (h!8482 tuple2!7628) (t!13358 List!7630)) )
))
(declare-datatypes ((ListLongMap!6541 0))(
  ( (ListLongMap!6542 (toList!3286 List!7630)) )
))
(declare-fun lt!200788 () ListLongMap!6541)

(declare-fun lt!200783 () tuple2!7628)

(declare-fun lt!200790 () tuple2!7628)

(declare-fun lt!200784 () ListLongMap!6541)

(declare-fun +!1434 (ListLongMap!6541 tuple2!7628) ListLongMap!6541)

(assert (=> b!435851 (= lt!200784 (+!1434 (+!1434 lt!200788 lt!200783) lt!200790))))

(declare-fun k!794 () (_ BitVec 64))

(declare-datatypes ((array!26689 0))(
  ( (array!26690 (arr!12794 (Array (_ BitVec 32) (_ BitVec 64))) (size!13146 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26689)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!200793 () V!16347)

(declare-datatypes ((Unit!12951 0))(
  ( (Unit!12952) )
))
(declare-fun lt!200794 () Unit!12951)

(declare-fun v!412 () V!16347)

(declare-fun addCommutativeForDiffKeys!416 (ListLongMap!6541 (_ BitVec 64) V!16347 (_ BitVec 64) V!16347) Unit!12951)

(assert (=> b!435851 (= lt!200794 (addCommutativeForDiffKeys!416 lt!200788 k!794 v!412 (select (arr!12794 _keys!709) from!863) lt!200793))))

(declare-fun b!435852 () Bool)

(declare-fun res!256855 () Bool)

(assert (=> b!435852 (=> (not res!256855) (not e!257451))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!435852 (= res!256855 (validKeyInArray!0 k!794))))

(declare-fun b!435853 () Bool)

(declare-fun e!257450 () Bool)

(declare-fun e!257442 () Bool)

(declare-fun mapRes!18768 () Bool)

(assert (=> b!435853 (= e!257450 (and e!257442 mapRes!18768))))

(declare-fun condMapEmpty!18768 () Bool)

(declare-datatypes ((ValueCell!5372 0))(
  ( (ValueCellFull!5372 (v!8007 V!16347)) (EmptyCell!5372) )
))
(declare-datatypes ((array!26691 0))(
  ( (array!26692 (arr!12795 (Array (_ BitVec 32) ValueCell!5372)) (size!13147 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26691)

(declare-fun mapDefault!18768 () ValueCell!5372)

