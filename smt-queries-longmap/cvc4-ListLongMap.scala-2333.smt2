; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37464 () Bool)

(assert start!37464)

(declare-fun b_free!8591 () Bool)

(declare-fun b_next!8591 () Bool)

(assert (=> start!37464 (= b_free!8591 (not b_next!8591))))

(declare-fun tp!30488 () Bool)

(declare-fun b_and!15833 () Bool)

(assert (=> start!37464 (= tp!30488 b_and!15833)))

(declare-fun b!381688 () Bool)

(declare-fun e!232025 () Bool)

(declare-fun tp_is_empty!9239 () Bool)

(assert (=> b!381688 (= e!232025 tp_is_empty!9239)))

(declare-fun b!381689 () Bool)

(declare-fun res!216937 () Bool)

(declare-fun e!232029 () Bool)

(assert (=> b!381689 (=> (not res!216937) (not e!232029))))

(declare-datatypes ((array!22391 0))(
  ( (array!22392 (arr!10664 (Array (_ BitVec 32) (_ BitVec 64))) (size!11016 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22391)

(declare-datatypes ((List!6097 0))(
  ( (Nil!6094) (Cons!6093 (h!6949 (_ BitVec 64)) (t!11247 List!6097)) )
))
(declare-fun arrayNoDuplicates!0 (array!22391 (_ BitVec 32) List!6097) Bool)

(assert (=> b!381689 (= res!216937 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6094))))

(declare-fun res!216940 () Bool)

(assert (=> start!37464 (=> (not res!216940) (not e!232029))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37464 (= res!216940 (validMask!0 mask!970))))

(assert (=> start!37464 e!232029))

(declare-datatypes ((V!13423 0))(
  ( (V!13424 (val!4664 Int)) )
))
(declare-datatypes ((ValueCell!4276 0))(
  ( (ValueCellFull!4276 (v!6861 V!13423)) (EmptyCell!4276) )
))
(declare-datatypes ((array!22393 0))(
  ( (array!22394 (arr!10665 (Array (_ BitVec 32) ValueCell!4276)) (size!11017 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22393)

(declare-fun e!232026 () Bool)

(declare-fun array_inv!7850 (array!22393) Bool)

(assert (=> start!37464 (and (array_inv!7850 _values!506) e!232026)))

(assert (=> start!37464 tp!30488))

(assert (=> start!37464 true))

(assert (=> start!37464 tp_is_empty!9239))

(declare-fun array_inv!7851 (array!22391) Bool)

(assert (=> start!37464 (array_inv!7851 _keys!658)))

(declare-fun b!381690 () Bool)

(declare-fun res!216939 () Bool)

(assert (=> b!381690 (=> (not res!216939) (not e!232029))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!381690 (= res!216939 (and (= (size!11017 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11016 _keys!658) (size!11017 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!381691 () Bool)

(declare-fun res!216944 () Bool)

(assert (=> b!381691 (=> (not res!216944) (not e!232029))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!381691 (= res!216944 (validKeyInArray!0 k!778))))

(declare-fun b!381692 () Bool)

(declare-fun res!216943 () Bool)

(assert (=> b!381692 (=> (not res!216943) (not e!232029))))

(declare-fun arrayContainsKey!0 (array!22391 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!381692 (= res!216943 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!381693 () Bool)

(declare-fun res!216934 () Bool)

(declare-fun e!232028 () Bool)

(assert (=> b!381693 (=> (not res!216934) (not e!232028))))

(declare-fun lt!178939 () array!22391)

(assert (=> b!381693 (= res!216934 (arrayNoDuplicates!0 lt!178939 #b00000000000000000000000000000000 Nil!6094))))

(declare-fun b!381694 () Bool)

(declare-fun e!232031 () Bool)

(assert (=> b!381694 (= e!232031 tp_is_empty!9239)))

(declare-fun b!381695 () Bool)

(declare-fun res!216936 () Bool)

(assert (=> b!381695 (=> (not res!216936) (not e!232029))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!381695 (= res!216936 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11016 _keys!658))))))

(declare-fun b!381696 () Bool)

(declare-fun e!232030 () Bool)

(assert (=> b!381696 (= e!232030 true)))

(declare-datatypes ((tuple2!6266 0))(
  ( (tuple2!6267 (_1!3144 (_ BitVec 64)) (_2!3144 V!13423)) )
))
(declare-datatypes ((List!6098 0))(
  ( (Nil!6095) (Cons!6094 (h!6950 tuple2!6266) (t!11248 List!6098)) )
))
(declare-datatypes ((ListLongMap!5179 0))(
  ( (ListLongMap!5180 (toList!2605 List!6098)) )
))
(declare-fun lt!178944 () ListLongMap!5179)

(declare-fun lt!178941 () ListLongMap!5179)

(assert (=> b!381696 (= lt!178944 lt!178941)))

(declare-fun b!381697 () Bool)

(declare-fun mapRes!15423 () Bool)

(assert (=> b!381697 (= e!232026 (and e!232031 mapRes!15423))))

(declare-fun condMapEmpty!15423 () Bool)

(declare-fun mapDefault!15423 () ValueCell!4276)

