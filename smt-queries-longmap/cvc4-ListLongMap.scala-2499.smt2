; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38816 () Bool)

(assert start!38816)

(declare-fun b!405104 () Bool)

(declare-fun res!233757 () Bool)

(declare-fun e!243621 () Bool)

(assert (=> b!405104 (=> (not res!233757) (not e!243621))))

(declare-datatypes ((array!24363 0))(
  ( (array!24364 (arr!11631 (Array (_ BitVec 32) (_ BitVec 64))) (size!11983 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24363)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24363 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!405104 (= res!233757 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!405105 () Bool)

(declare-fun res!233755 () Bool)

(assert (=> b!405105 (=> (not res!233755) (not e!243621))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!405105 (= res!233755 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11983 _keys!709))))))

(declare-fun mapNonEmpty!16974 () Bool)

(declare-fun mapRes!16974 () Bool)

(declare-fun tp!33093 () Bool)

(declare-fun e!243623 () Bool)

(assert (=> mapNonEmpty!16974 (= mapRes!16974 (and tp!33093 e!243623))))

(declare-datatypes ((V!14751 0))(
  ( (V!14752 (val!5162 Int)) )
))
(declare-datatypes ((ValueCell!4774 0))(
  ( (ValueCellFull!4774 (v!7409 V!14751)) (EmptyCell!4774) )
))
(declare-datatypes ((array!24365 0))(
  ( (array!24366 (arr!11632 (Array (_ BitVec 32) ValueCell!4774)) (size!11984 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24365)

(declare-fun mapKey!16974 () (_ BitVec 32))

(declare-fun mapRest!16974 () (Array (_ BitVec 32) ValueCell!4774))

(declare-fun mapValue!16974 () ValueCell!4774)

(assert (=> mapNonEmpty!16974 (= (arr!11632 _values!549) (store mapRest!16974 mapKey!16974 mapValue!16974))))

(declare-fun b!405106 () Bool)

(declare-fun res!233754 () Bool)

(assert (=> b!405106 (=> (not res!233754) (not e!243621))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24363 (_ BitVec 32)) Bool)

(assert (=> b!405106 (= res!233754 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!405107 () Bool)

(declare-fun res!233749 () Bool)

(assert (=> b!405107 (=> (not res!233749) (not e!243621))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!405107 (= res!233749 (validKeyInArray!0 k!794))))

(declare-fun b!405108 () Bool)

(declare-fun e!243622 () Bool)

(declare-fun e!243619 () Bool)

(assert (=> b!405108 (= e!243622 (and e!243619 mapRes!16974))))

(declare-fun condMapEmpty!16974 () Bool)

(declare-fun mapDefault!16974 () ValueCell!4774)

