; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89412 () Bool)

(assert start!89412)

(declare-fun b!1025156 () Bool)

(declare-fun b_free!20411 () Bool)

(declare-fun b_next!20411 () Bool)

(assert (=> b!1025156 (= b_free!20411 (not b_next!20411))))

(declare-fun tp!72278 () Bool)

(declare-fun b_and!32657 () Bool)

(assert (=> b!1025156 (= tp!72278 b_and!32657)))

(declare-fun b!1025155 () Bool)

(declare-fun e!577984 () Bool)

(declare-fun tp_is_empty!24131 () Bool)

(assert (=> b!1025155 (= e!577984 tp_is_empty!24131)))

(declare-fun e!577983 () Bool)

(declare-datatypes ((V!37047 0))(
  ( (V!37048 (val!12116 Int)) )
))
(declare-datatypes ((ValueCell!11362 0))(
  ( (ValueCellFull!11362 (v!14685 V!37047)) (EmptyCell!11362) )
))
(declare-datatypes ((array!64312 0))(
  ( (array!64313 (arr!30965 (Array (_ BitVec 32) (_ BitVec 64))) (size!31478 (_ BitVec 32))) )
))
(declare-datatypes ((array!64314 0))(
  ( (array!64315 (arr!30966 (Array (_ BitVec 32) ValueCell!11362)) (size!31479 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5318 0))(
  ( (LongMapFixedSize!5319 (defaultEntry!6011 Int) (mask!29675 (_ BitVec 32)) (extraKeys!5743 (_ BitVec 32)) (zeroValue!5847 V!37047) (minValue!5847 V!37047) (_size!2714 (_ BitVec 32)) (_keys!11158 array!64312) (_values!6034 array!64314) (_vacant!2714 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5318)

(declare-fun e!577988 () Bool)

(declare-fun array_inv!23981 (array!64312) Bool)

(declare-fun array_inv!23982 (array!64314) Bool)

(assert (=> b!1025156 (= e!577988 (and tp!72278 tp_is_empty!24131 (array_inv!23981 (_keys!11158 thiss!1427)) (array_inv!23982 (_values!6034 thiss!1427)) e!577983))))

(declare-fun b!1025157 () Bool)

(declare-fun res!686355 () Bool)

(declare-fun e!577985 () Bool)

(assert (=> b!1025157 (=> res!686355 e!577985)))

(declare-datatypes ((List!21745 0))(
  ( (Nil!21742) (Cons!21741 (h!22939 (_ BitVec 64)) (t!30807 List!21745)) )
))
(declare-fun contains!5961 (List!21745 (_ BitVec 64)) Bool)

(assert (=> b!1025157 (= res!686355 (contains!5961 Nil!21742 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1025158 () Bool)

(declare-fun e!577986 () Bool)

(declare-fun e!577989 () Bool)

(assert (=> b!1025158 (= e!577986 e!577989)))

(declare-fun res!686354 () Bool)

(assert (=> b!1025158 (=> (not res!686354) (not e!577989))))

(declare-datatypes ((SeekEntryResult!9610 0))(
  ( (MissingZero!9610 (index!40811 (_ BitVec 32))) (Found!9610 (index!40812 (_ BitVec 32))) (Intermediate!9610 (undefined!10422 Bool) (index!40813 (_ BitVec 32)) (x!91152 (_ BitVec 32))) (Undefined!9610) (MissingVacant!9610 (index!40814 (_ BitVec 32))) )
))
(declare-fun lt!450811 () SeekEntryResult!9610)

(assert (=> b!1025158 (= res!686354 (is-Found!9610 lt!450811))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64312 (_ BitVec 32)) SeekEntryResult!9610)

(assert (=> b!1025158 (= lt!450811 (seekEntry!0 key!909 (_keys!11158 thiss!1427) (mask!29675 thiss!1427)))))

(declare-fun b!1025159 () Bool)

(declare-fun res!686353 () Bool)

(assert (=> b!1025159 (=> (not res!686353) (not e!577986))))

(assert (=> b!1025159 (= res!686353 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1025160 () Bool)

(declare-fun e!577990 () Bool)

(declare-fun mapRes!37625 () Bool)

(assert (=> b!1025160 (= e!577983 (and e!577990 mapRes!37625))))

(declare-fun condMapEmpty!37625 () Bool)

(declare-fun mapDefault!37625 () ValueCell!11362)

