; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37304 () Bool)

(assert start!37304)

(declare-fun b_free!8431 () Bool)

(declare-fun b_next!8431 () Bool)

(assert (=> start!37304 (= b_free!8431 (not b_next!8431))))

(declare-fun tp!30009 () Bool)

(declare-fun b_and!15673 () Bool)

(assert (=> start!37304 (= tp!30009 b_and!15673)))

(declare-fun b!378141 () Bool)

(declare-fun e!230169 () Bool)

(declare-datatypes ((array!22085 0))(
  ( (array!22086 (arr!10511 (Array (_ BitVec 32) (_ BitVec 64))) (size!10863 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22085)

(assert (=> b!378141 (= e!230169 (bvsle #b00000000000000000000000000000000 (size!10863 _keys!658)))))

(declare-datatypes ((V!13211 0))(
  ( (V!13212 (val!4584 Int)) )
))
(declare-datatypes ((tuple2!6120 0))(
  ( (tuple2!6121 (_1!3071 (_ BitVec 64)) (_2!3071 V!13211)) )
))
(declare-datatypes ((List!5958 0))(
  ( (Nil!5955) (Cons!5954 (h!6810 tuple2!6120) (t!11108 List!5958)) )
))
(declare-datatypes ((ListLongMap!5033 0))(
  ( (ListLongMap!5034 (toList!2532 List!5958)) )
))
(declare-fun lt!176106 () ListLongMap!5033)

(declare-fun lt!176111 () ListLongMap!5033)

(declare-fun lt!176113 () tuple2!6120)

(declare-fun +!878 (ListLongMap!5033 tuple2!6120) ListLongMap!5033)

(assert (=> b!378141 (= lt!176106 (+!878 lt!176111 lt!176113))))

(declare-fun v!373 () V!13211)

(declare-fun lt!176107 () ListLongMap!5033)

(declare-datatypes ((Unit!11656 0))(
  ( (Unit!11657) )
))
(declare-fun lt!176115 () Unit!11656)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun zeroValue!472 () V!13211)

(declare-fun addCommutativeForDiffKeys!284 (ListLongMap!5033 (_ BitVec 64) V!13211 (_ BitVec 64) V!13211) Unit!11656)

(assert (=> b!378141 (= lt!176115 (addCommutativeForDiffKeys!284 lt!176107 k!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!378142 () Bool)

(declare-fun res!214116 () Bool)

(declare-fun e!230173 () Bool)

(assert (=> b!378142 (=> (not res!214116) (not e!230173))))

(declare-fun arrayContainsKey!0 (array!22085 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!378142 (= res!214116 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!378143 () Bool)

(declare-fun e!230168 () Bool)

(assert (=> b!378143 (= e!230168 e!230169)))

(declare-fun res!214113 () Bool)

(assert (=> b!378143 (=> res!214113 e!230169)))

(assert (=> b!378143 (= res!214113 (= k!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!176103 () ListLongMap!5033)

(assert (=> b!378143 (= lt!176103 lt!176106)))

(declare-fun lt!176110 () ListLongMap!5033)

(declare-fun lt!176104 () tuple2!6120)

(assert (=> b!378143 (= lt!176106 (+!878 lt!176110 lt!176104))))

(declare-fun lt!176114 () ListLongMap!5033)

(assert (=> b!378143 (= lt!176114 lt!176111)))

(assert (=> b!378143 (= lt!176111 (+!878 lt!176107 lt!176104))))

(declare-fun lt!176109 () ListLongMap!5033)

(assert (=> b!378143 (= lt!176103 (+!878 lt!176109 lt!176104))))

(assert (=> b!378143 (= lt!176104 (tuple2!6121 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!378144 () Bool)

(declare-fun res!214110 () Bool)

(assert (=> b!378144 (=> (not res!214110) (not e!230173))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!378144 (= res!214110 (validKeyInArray!0 k!778))))

(declare-fun b!378145 () Bool)

(declare-fun res!214108 () Bool)

(assert (=> b!378145 (=> (not res!214108) (not e!230173))))

(declare-datatypes ((List!5959 0))(
  ( (Nil!5956) (Cons!5955 (h!6811 (_ BitVec 64)) (t!11109 List!5959)) )
))
(declare-fun arrayNoDuplicates!0 (array!22085 (_ BitVec 32) List!5959) Bool)

(assert (=> b!378145 (= res!214108 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5956))))

(declare-fun b!378146 () Bool)

(declare-fun e!230170 () Bool)

(declare-fun e!230167 () Bool)

(declare-fun mapRes!15183 () Bool)

(assert (=> b!378146 (= e!230170 (and e!230167 mapRes!15183))))

(declare-fun condMapEmpty!15183 () Bool)

(declare-datatypes ((ValueCell!4196 0))(
  ( (ValueCellFull!4196 (v!6781 V!13211)) (EmptyCell!4196) )
))
(declare-datatypes ((array!22087 0))(
  ( (array!22088 (arr!10512 (Array (_ BitVec 32) ValueCell!4196)) (size!10864 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22087)

(declare-fun mapDefault!15183 () ValueCell!4196)

