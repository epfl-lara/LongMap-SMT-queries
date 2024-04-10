; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40232 () Bool)

(assert start!40232)

(declare-fun b_free!10499 () Bool)

(declare-fun b_next!10499 () Bool)

(assert (=> start!40232 (= b_free!10499 (not b_next!10499))))

(declare-fun tp!37026 () Bool)

(declare-fun b_and!18467 () Bool)

(assert (=> start!40232 (= tp!37026 b_and!18467)))

(declare-fun b!441332 () Bool)

(declare-fun res!261227 () Bool)

(declare-fun e!259886 () Bool)

(assert (=> b!441332 (=> (not res!261227) (not e!259886))))

(declare-datatypes ((array!27115 0))(
  ( (array!27116 (arr!13007 (Array (_ BitVec 32) (_ BitVec 64))) (size!13359 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27115)

(declare-datatypes ((List!7807 0))(
  ( (Nil!7804) (Cons!7803 (h!8659 (_ BitVec 64)) (t!13563 List!7807)) )
))
(declare-fun arrayNoDuplicates!0 (array!27115 (_ BitVec 32) List!7807) Bool)

(assert (=> b!441332 (= res!261227 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7804))))

(declare-fun b!441333 () Bool)

(declare-fun res!261231 () Bool)

(assert (=> b!441333 (=> (not res!261231) (not e!259886))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!441333 (= res!261231 (or (= (select (arr!13007 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13007 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!441334 () Bool)

(declare-fun res!261229 () Bool)

(assert (=> b!441334 (=> (not res!261229) (not e!259886))))

(assert (=> b!441334 (= res!261229 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13359 _keys!709))))))

(declare-fun b!441335 () Bool)

(declare-fun e!259884 () Bool)

(assert (=> b!441335 (= e!259886 e!259884)))

(declare-fun res!261224 () Bool)

(assert (=> b!441335 (=> (not res!261224) (not e!259884))))

(declare-fun lt!202865 () array!27115)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27115 (_ BitVec 32)) Bool)

(assert (=> b!441335 (= res!261224 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202865 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!441335 (= lt!202865 (array!27116 (store (arr!13007 _keys!709) i!563 k!794) (size!13359 _keys!709)))))

(declare-fun mapIsEmpty!19098 () Bool)

(declare-fun mapRes!19098 () Bool)

(assert (=> mapIsEmpty!19098 mapRes!19098))

(declare-fun b!441336 () Bool)

(declare-fun e!259882 () Bool)

(declare-fun e!259885 () Bool)

(assert (=> b!441336 (= e!259882 (and e!259885 mapRes!19098))))

(declare-fun condMapEmpty!19098 () Bool)

(declare-datatypes ((V!16639 0))(
  ( (V!16640 (val!5870 Int)) )
))
(declare-datatypes ((ValueCell!5482 0))(
  ( (ValueCellFull!5482 (v!8117 V!16639)) (EmptyCell!5482) )
))
(declare-datatypes ((array!27117 0))(
  ( (array!27118 (arr!13008 (Array (_ BitVec 32) ValueCell!5482)) (size!13360 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27117)

(declare-fun mapDefault!19098 () ValueCell!5482)

