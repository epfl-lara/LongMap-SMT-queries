; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89978 () Bool)

(assert start!89978)

(declare-fun b!1030446 () Bool)

(declare-fun b_free!20617 () Bool)

(declare-fun b_next!20617 () Bool)

(assert (=> b!1030446 (= b_free!20617 (not b_next!20617))))

(declare-fun tp!72919 () Bool)

(declare-fun b_and!32995 () Bool)

(assert (=> b!1030446 (= tp!72919 b_and!32995)))

(declare-fun b!1030441 () Bool)

(declare-fun res!689076 () Bool)

(declare-fun e!581886 () Bool)

(assert (=> b!1030441 (=> res!689076 e!581886)))

(declare-datatypes ((V!37323 0))(
  ( (V!37324 (val!12219 Int)) )
))
(declare-datatypes ((ValueCell!11465 0))(
  ( (ValueCellFull!11465 (v!14796 V!37323)) (EmptyCell!11465) )
))
(declare-datatypes ((Unit!33661 0))(
  ( (Unit!33662) )
))
(declare-datatypes ((array!64736 0))(
  ( (array!64737 (arr!31171 (Array (_ BitVec 32) (_ BitVec 64))) (size!31688 (_ BitVec 32))) )
))
(declare-datatypes ((array!64738 0))(
  ( (array!64739 (arr!31172 (Array (_ BitVec 32) ValueCell!11465)) (size!31689 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5524 0))(
  ( (LongMapFixedSize!5525 (defaultEntry!6134 Int) (mask!29912 (_ BitVec 32)) (extraKeys!5866 (_ BitVec 32)) (zeroValue!5970 V!37323) (minValue!5970 V!37323) (_size!2817 (_ BitVec 32)) (_keys!11305 array!64736) (_values!6157 array!64738) (_vacant!2817 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15590 0))(
  ( (tuple2!15591 (_1!7806 Unit!33661) (_2!7806 LongMapFixedSize!5524)) )
))
(declare-fun lt!454557 () tuple2!15590)

(assert (=> b!1030441 (= res!689076 (or (not (= (size!31689 (_values!6157 (_2!7806 lt!454557))) (bvadd #b00000000000000000000000000000001 (mask!29912 (_2!7806 lt!454557))))) (not (= (size!31688 (_keys!11305 (_2!7806 lt!454557))) (size!31689 (_values!6157 (_2!7806 lt!454557))))) (bvslt (mask!29912 (_2!7806 lt!454557)) #b00000000000000000000000000000000) (bvslt (extraKeys!5866 (_2!7806 lt!454557)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5866 (_2!7806 lt!454557)) #b00000000000000000000000000000011)))))

(declare-fun res!689079 () Bool)

(declare-fun e!581889 () Bool)

(assert (=> start!89978 (=> (not res!689079) (not e!581889))))

(declare-fun thiss!1427 () LongMapFixedSize!5524)

(declare-fun valid!2091 (LongMapFixedSize!5524) Bool)

(assert (=> start!89978 (= res!689079 (valid!2091 thiss!1427))))

(assert (=> start!89978 e!581889))

(declare-fun e!581887 () Bool)

(assert (=> start!89978 e!581887))

(assert (=> start!89978 true))

(declare-fun b!1030442 () Bool)

(declare-fun e!581888 () Bool)

(declare-fun e!581885 () Bool)

(declare-fun mapRes!37956 () Bool)

(assert (=> b!1030442 (= e!581888 (and e!581885 mapRes!37956))))

(declare-fun condMapEmpty!37956 () Bool)

(declare-fun mapDefault!37956 () ValueCell!11465)

