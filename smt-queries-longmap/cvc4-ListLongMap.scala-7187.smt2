; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92128 () Bool)

(assert start!92128)

(declare-fun b!1048009 () Bool)

(declare-fun b_free!21179 () Bool)

(declare-fun b_next!21179 () Bool)

(assert (=> b!1048009 (= b_free!21179 (not b_next!21179))))

(declare-fun tp!74803 () Bool)

(declare-fun b_and!33889 () Bool)

(assert (=> b!1048009 (= tp!74803 b_and!33889)))

(declare-fun b!1048007 () Bool)

(declare-fun res!697175 () Bool)

(declare-fun e!594292 () Bool)

(assert (=> b!1048007 (=> (not res!697175) (not e!594292))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!38071 0))(
  ( (V!38072 (val!12500 Int)) )
))
(declare-datatypes ((ValueCell!11746 0))(
  ( (ValueCellFull!11746 (v!15100 V!38071)) (EmptyCell!11746) )
))
(declare-datatypes ((array!65978 0))(
  ( (array!65979 (arr!31733 (Array (_ BitVec 32) (_ BitVec 64))) (size!32269 (_ BitVec 32))) )
))
(declare-datatypes ((array!65980 0))(
  ( (array!65981 (arr!31734 (Array (_ BitVec 32) ValueCell!11746)) (size!32270 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6086 0))(
  ( (LongMapFixedSize!6087 (defaultEntry!6447 Int) (mask!30604 (_ BitVec 32)) (extraKeys!6175 (_ BitVec 32)) (zeroValue!6281 V!38071) (minValue!6281 V!38071) (_size!3098 (_ BitVec 32)) (_keys!11726 array!65978) (_values!6470 array!65980) (_vacant!3098 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!6086)

(declare-datatypes ((SeekEntryResult!9864 0))(
  ( (MissingZero!9864 (index!41827 (_ BitVec 32))) (Found!9864 (index!41828 (_ BitVec 32))) (Intermediate!9864 (undefined!10676 Bool) (index!41829 (_ BitVec 32)) (x!93545 (_ BitVec 32))) (Undefined!9864) (MissingVacant!9864 (index!41830 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!65978 (_ BitVec 32)) SeekEntryResult!9864)

(assert (=> b!1048007 (= res!697175 (not (is-Found!9864 (seekEntry!0 key!909 (_keys!11726 thiss!1427) (mask!30604 thiss!1427)))))))

(declare-fun b!1048008 () Bool)

(declare-fun res!697173 () Bool)

(assert (=> b!1048008 (=> (not res!697173) (not e!594292))))

(assert (=> b!1048008 (= res!697173 (not (= key!909 (bvneg key!909))))))

(declare-fun e!594294 () Bool)

(declare-fun e!594291 () Bool)

(declare-fun tp_is_empty!24899 () Bool)

(declare-fun array_inv!24513 (array!65978) Bool)

(declare-fun array_inv!24514 (array!65980) Bool)

(assert (=> b!1048009 (= e!594291 (and tp!74803 tp_is_empty!24899 (array_inv!24513 (_keys!11726 thiss!1427)) (array_inv!24514 (_values!6470 thiss!1427)) e!594294))))

(declare-fun b!1048010 () Bool)

(declare-fun e!594295 () Bool)

(assert (=> b!1048010 (= e!594295 tp_is_empty!24899)))

(declare-fun b!1048011 () Bool)

(declare-fun e!594293 () Bool)

(assert (=> b!1048011 (= e!594293 tp_is_empty!24899)))

(declare-fun b!1048012 () Bool)

(assert (=> b!1048012 (= e!594292 false)))

(declare-datatypes ((tuple2!15856 0))(
  ( (tuple2!15857 (_1!7939 (_ BitVec 64)) (_2!7939 V!38071)) )
))
(declare-datatypes ((List!22049 0))(
  ( (Nil!22046) (Cons!22045 (h!23254 tuple2!15856) (t!31356 List!22049)) )
))
(declare-datatypes ((ListLongMap!13825 0))(
  ( (ListLongMap!13826 (toList!6928 List!22049)) )
))
(declare-fun lt!463098 () ListLongMap!13825)

(declare-fun map!14834 (LongMapFixedSize!6086) ListLongMap!13825)

(assert (=> b!1048012 (= lt!463098 (map!14834 thiss!1427))))

(declare-fun res!697174 () Bool)

(assert (=> start!92128 (=> (not res!697174) (not e!594292))))

(declare-fun valid!2285 (LongMapFixedSize!6086) Bool)

(assert (=> start!92128 (= res!697174 (valid!2285 thiss!1427))))

(assert (=> start!92128 e!594292))

(assert (=> start!92128 e!594291))

(assert (=> start!92128 true))

(declare-fun b!1048013 () Bool)

(declare-fun mapRes!38998 () Bool)

(assert (=> b!1048013 (= e!594294 (and e!594295 mapRes!38998))))

(declare-fun condMapEmpty!38998 () Bool)

(declare-fun mapDefault!38998 () ValueCell!11746)

