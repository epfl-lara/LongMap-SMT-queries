; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37352 () Bool)

(assert start!37352)

(declare-fun b_free!8479 () Bool)

(declare-fun b_next!8479 () Bool)

(assert (=> start!37352 (= b_free!8479 (not b_next!8479))))

(declare-fun tp!30153 () Bool)

(declare-fun b_and!15721 () Bool)

(assert (=> start!37352 (= tp!30153 b_and!15721)))

(declare-fun b!379230 () Bool)

(declare-fun res!214985 () Bool)

(declare-fun e!230748 () Bool)

(assert (=> b!379230 (=> (not res!214985) (not e!230748))))

(declare-datatypes ((array!22177 0))(
  ( (array!22178 (arr!10557 (Array (_ BitVec 32) (_ BitVec 64))) (size!10909 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22177)

(declare-datatypes ((List!6000 0))(
  ( (Nil!5997) (Cons!5996 (h!6852 (_ BitVec 64)) (t!11150 List!6000)) )
))
(declare-fun arrayNoDuplicates!0 (array!22177 (_ BitVec 32) List!6000) Bool)

(assert (=> b!379230 (= res!214985 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5997))))

(declare-fun b!379231 () Bool)

(declare-fun e!230743 () Bool)

(declare-fun tp_is_empty!9127 () Bool)

(assert (=> b!379231 (= e!230743 tp_is_empty!9127)))

(declare-fun b!379232 () Bool)

(declare-fun res!214989 () Bool)

(assert (=> b!379232 (=> (not res!214989) (not e!230748))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!379232 (= res!214989 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10909 _keys!658))))))

(declare-fun mapIsEmpty!15255 () Bool)

(declare-fun mapRes!15255 () Bool)

(assert (=> mapIsEmpty!15255 mapRes!15255))

(declare-fun b!379233 () Bool)

(declare-fun res!214983 () Bool)

(assert (=> b!379233 (=> (not res!214983) (not e!230748))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22177 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!379233 (= res!214983 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!379234 () Bool)

(declare-fun e!230745 () Bool)

(assert (=> b!379234 (= e!230748 e!230745)))

(declare-fun res!214991 () Bool)

(assert (=> b!379234 (=> (not res!214991) (not e!230745))))

(declare-fun lt!177006 () array!22177)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22177 (_ BitVec 32)) Bool)

(assert (=> b!379234 (= res!214991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!177006 mask!970))))

(assert (=> b!379234 (= lt!177006 (array!22178 (store (arr!10557 _keys!658) i!548 k!778) (size!10909 _keys!658)))))

(declare-fun res!214982 () Bool)

(assert (=> start!37352 (=> (not res!214982) (not e!230748))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37352 (= res!214982 (validMask!0 mask!970))))

(assert (=> start!37352 e!230748))

(declare-datatypes ((V!13275 0))(
  ( (V!13276 (val!4608 Int)) )
))
(declare-datatypes ((ValueCell!4220 0))(
  ( (ValueCellFull!4220 (v!6805 V!13275)) (EmptyCell!4220) )
))
(declare-datatypes ((array!22179 0))(
  ( (array!22180 (arr!10558 (Array (_ BitVec 32) ValueCell!4220)) (size!10910 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22179)

(declare-fun e!230750 () Bool)

(declare-fun array_inv!7774 (array!22179) Bool)

(assert (=> start!37352 (and (array_inv!7774 _values!506) e!230750)))

(assert (=> start!37352 tp!30153))

(assert (=> start!37352 true))

(assert (=> start!37352 tp_is_empty!9127))

(declare-fun array_inv!7775 (array!22177) Bool)

(assert (=> start!37352 (array_inv!7775 _keys!658)))

(declare-fun b!379235 () Bool)

(declare-fun res!214980 () Bool)

(assert (=> b!379235 (=> (not res!214980) (not e!230748))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!379235 (= res!214980 (and (= (size!10910 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10909 _keys!658) (size!10910 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!379236 () Bool)

(declare-fun res!214988 () Bool)

(assert (=> b!379236 (=> (not res!214988) (not e!230748))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!379236 (= res!214988 (validKeyInArray!0 k!778))))

(declare-fun b!379237 () Bool)

(declare-fun e!230749 () Bool)

(assert (=> b!379237 (= e!230749 true)))

(declare-datatypes ((tuple2!6164 0))(
  ( (tuple2!6165 (_1!3093 (_ BitVec 64)) (_2!3093 V!13275)) )
))
(declare-datatypes ((List!6001 0))(
  ( (Nil!5998) (Cons!5997 (h!6853 tuple2!6164) (t!11151 List!6001)) )
))
(declare-datatypes ((ListLongMap!5077 0))(
  ( (ListLongMap!5078 (toList!2554 List!6001)) )
))
(declare-fun lt!177013 () ListLongMap!5077)

(declare-fun lt!177009 () ListLongMap!5077)

(declare-fun lt!177008 () tuple2!6164)

(declare-fun +!900 (ListLongMap!5077 tuple2!6164) ListLongMap!5077)

(assert (=> b!379237 (= lt!177013 (+!900 lt!177009 lt!177008))))

(declare-fun v!373 () V!13275)

(declare-datatypes ((Unit!11698 0))(
  ( (Unit!11699) )
))
(declare-fun lt!177003 () Unit!11698)

(declare-fun lt!177012 () ListLongMap!5077)

(declare-fun minValue!472 () V!13275)

(declare-fun addCommutativeForDiffKeys!299 (ListLongMap!5077 (_ BitVec 64) V!13275 (_ BitVec 64) V!13275) Unit!11698)

(assert (=> b!379237 (= lt!177003 (addCommutativeForDiffKeys!299 lt!177012 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!379238 () Bool)

(declare-fun res!214986 () Bool)

(assert (=> b!379238 (=> (not res!214986) (not e!230745))))

(assert (=> b!379238 (= res!214986 (arrayNoDuplicates!0 lt!177006 #b00000000000000000000000000000000 Nil!5997))))

(declare-fun mapNonEmpty!15255 () Bool)

(declare-fun tp!30152 () Bool)

(assert (=> mapNonEmpty!15255 (= mapRes!15255 (and tp!30152 e!230743))))

(declare-fun mapRest!15255 () (Array (_ BitVec 32) ValueCell!4220))

(declare-fun mapValue!15255 () ValueCell!4220)

(declare-fun mapKey!15255 () (_ BitVec 32))

(assert (=> mapNonEmpty!15255 (= (arr!10558 _values!506) (store mapRest!15255 mapKey!15255 mapValue!15255))))

(declare-fun b!379239 () Bool)

(declare-fun res!214981 () Bool)

(assert (=> b!379239 (=> (not res!214981) (not e!230748))))

(assert (=> b!379239 (= res!214981 (or (= (select (arr!10557 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10557 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!379240 () Bool)

(declare-fun e!230747 () Bool)

(assert (=> b!379240 (= e!230750 (and e!230747 mapRes!15255))))

(declare-fun condMapEmpty!15255 () Bool)

(declare-fun mapDefault!15255 () ValueCell!4220)

