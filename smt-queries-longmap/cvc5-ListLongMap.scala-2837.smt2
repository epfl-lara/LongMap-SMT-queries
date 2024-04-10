; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40986 () Bool)

(assert start!40986)

(declare-fun b_free!10921 () Bool)

(declare-fun b_next!10921 () Bool)

(assert (=> start!40986 (= b_free!10921 (not b_next!10921))))

(declare-fun tp!38590 () Bool)

(declare-fun b_and!19063 () Bool)

(assert (=> start!40986 (= tp!38590 b_and!19063)))

(declare-fun b!456349 () Bool)

(declare-fun res!272301 () Bool)

(declare-fun e!266646 () Bool)

(assert (=> b!456349 (=> (not res!272301) (not e!266646))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!456349 (= res!272301 (bvsle from!863 i!563))))

(declare-fun b!456350 () Bool)

(declare-fun e!266644 () Bool)

(assert (=> b!456350 (= e!266644 e!266646)))

(declare-fun res!272303 () Bool)

(assert (=> b!456350 (=> (not res!272303) (not e!266646))))

(declare-datatypes ((array!28321 0))(
  ( (array!28322 (arr!13604 (Array (_ BitVec 32) (_ BitVec 64))) (size!13956 (_ BitVec 32))) )
))
(declare-fun lt!206521 () array!28321)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28321 (_ BitVec 32)) Bool)

(assert (=> b!456350 (= res!272303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206521 mask!1025))))

(declare-fun _keys!709 () array!28321)

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!456350 (= lt!206521 (array!28322 (store (arr!13604 _keys!709) i!563 k!794) (size!13956 _keys!709)))))

(declare-fun b!456351 () Bool)

(declare-fun e!266650 () Bool)

(declare-fun e!266645 () Bool)

(declare-fun mapRes!20029 () Bool)

(assert (=> b!456351 (= e!266650 (and e!266645 mapRes!20029))))

(declare-fun condMapEmpty!20029 () Bool)

(declare-datatypes ((V!17451 0))(
  ( (V!17452 (val!6174 Int)) )
))
(declare-datatypes ((ValueCell!5786 0))(
  ( (ValueCellFull!5786 (v!8440 V!17451)) (EmptyCell!5786) )
))
(declare-datatypes ((array!28323 0))(
  ( (array!28324 (arr!13605 (Array (_ BitVec 32) ValueCell!5786)) (size!13957 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28323)

(declare-fun mapDefault!20029 () ValueCell!5786)

