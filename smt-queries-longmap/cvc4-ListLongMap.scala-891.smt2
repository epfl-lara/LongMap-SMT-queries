; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20446 () Bool)

(assert start!20446)

(declare-fun b_free!5105 () Bool)

(declare-fun b_next!5105 () Bool)

(assert (=> start!20446 (= b_free!5105 (not b_next!5105))))

(declare-fun tp!18347 () Bool)

(declare-fun b_and!11851 () Bool)

(assert (=> start!20446 (= tp!18347 b_and!11851)))

(declare-fun b!202527 () Bool)

(declare-fun res!97078 () Bool)

(declare-fun e!132655 () Bool)

(assert (=> b!202527 (=> (not res!97078) (not e!132655))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9147 0))(
  ( (array!9148 (arr!4324 (Array (_ BitVec 32) (_ BitVec 64))) (size!4649 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9147)

(assert (=> b!202527 (= res!97078 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4649 _keys!825))))))

(declare-fun b!202528 () Bool)

(declare-fun e!132654 () Bool)

(declare-fun tp_is_empty!4961 () Bool)

(assert (=> b!202528 (= e!132654 tp_is_empty!4961)))

(declare-fun b!202529 () Bool)

(declare-fun res!97077 () Bool)

(assert (=> b!202529 (=> (not res!97077) (not e!132655))))

(declare-fun k!843 () (_ BitVec 64))

(assert (=> b!202529 (= res!97077 (= (select (arr!4324 _keys!825) i!601) k!843))))

(declare-fun b!202530 () Bool)

(declare-fun e!132652 () Bool)

(assert (=> b!202530 (= e!132652 true)))

(declare-datatypes ((V!6261 0))(
  ( (V!6262 (val!2525 Int)) )
))
(declare-datatypes ((tuple2!3830 0))(
  ( (tuple2!3831 (_1!1926 (_ BitVec 64)) (_2!1926 V!6261)) )
))
(declare-datatypes ((List!2734 0))(
  ( (Nil!2731) (Cons!2730 (h!3372 tuple2!3830) (t!7665 List!2734)) )
))
(declare-datatypes ((ListLongMap!2743 0))(
  ( (ListLongMap!2744 (toList!1387 List!2734)) )
))
(declare-fun lt!101706 () ListLongMap!2743)

(declare-fun lt!101709 () ListLongMap!2743)

(declare-fun lt!101704 () tuple2!3830)

(declare-fun +!414 (ListLongMap!2743 tuple2!3830) ListLongMap!2743)

(assert (=> b!202530 (= lt!101706 (+!414 lt!101709 lt!101704))))

(declare-fun lt!101712 () ListLongMap!2743)

(declare-fun v!520 () V!6261)

(declare-datatypes ((Unit!6124 0))(
  ( (Unit!6125) )
))
(declare-fun lt!101713 () Unit!6124)

(declare-fun zeroValue!615 () V!6261)

(declare-fun addCommutativeForDiffKeys!131 (ListLongMap!2743 (_ BitVec 64) V!6261 (_ BitVec 64) V!6261) Unit!6124)

(assert (=> b!202530 (= lt!101713 (addCommutativeForDiffKeys!131 lt!101712 k!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!202531 () Bool)

(declare-fun e!132653 () Bool)

(declare-fun e!132656 () Bool)

(declare-fun mapRes!8510 () Bool)

(assert (=> b!202531 (= e!132653 (and e!132656 mapRes!8510))))

(declare-fun condMapEmpty!8510 () Bool)

(declare-datatypes ((ValueCell!2137 0))(
  ( (ValueCellFull!2137 (v!4495 V!6261)) (EmptyCell!2137) )
))
(declare-datatypes ((array!9149 0))(
  ( (array!9150 (arr!4325 (Array (_ BitVec 32) ValueCell!2137)) (size!4650 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9149)

(declare-fun mapDefault!8510 () ValueCell!2137)

