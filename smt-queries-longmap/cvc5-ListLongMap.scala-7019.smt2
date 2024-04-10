; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89126 () Bool)

(assert start!89126)

(declare-fun b!1021796 () Bool)

(declare-fun b_free!20167 () Bool)

(declare-fun b_next!20167 () Bool)

(assert (=> b!1021796 (= b_free!20167 (not b_next!20167))))

(declare-fun tp!71536 () Bool)

(declare-fun b_and!32365 () Bool)

(assert (=> b!1021796 (= tp!71536 b_and!32365)))

(declare-fun mapIsEmpty!37248 () Bool)

(declare-fun mapRes!37248 () Bool)

(assert (=> mapIsEmpty!37248 mapRes!37248))

(declare-fun b!1021793 () Bool)

(declare-fun res!684578 () Bool)

(declare-fun e!575536 () Bool)

(assert (=> b!1021793 (=> (not res!684578) (not e!575536))))

(declare-datatypes ((V!36723 0))(
  ( (V!36724 (val!11994 Int)) )
))
(declare-datatypes ((ValueCell!11240 0))(
  ( (ValueCellFull!11240 (v!14563 V!36723)) (EmptyCell!11240) )
))
(declare-datatypes ((array!63818 0))(
  ( (array!63819 (arr!30721 (Array (_ BitVec 32) (_ BitVec 64))) (size!31232 (_ BitVec 32))) )
))
(declare-datatypes ((array!63820 0))(
  ( (array!63821 (arr!30722 (Array (_ BitVec 32) ValueCell!11240)) (size!31233 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5074 0))(
  ( (LongMapFixedSize!5075 (defaultEntry!5889 Int) (mask!29468 (_ BitVec 32)) (extraKeys!5621 (_ BitVec 32)) (zeroValue!5725 V!36723) (minValue!5725 V!36723) (_size!2592 (_ BitVec 32)) (_keys!11034 array!63818) (_values!5912 array!63820) (_vacant!2592 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5074)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1021793 (= res!684578 (validMask!0 (mask!29468 thiss!1427)))))

(declare-fun b!1021794 () Bool)

(declare-fun res!684577 () Bool)

(assert (=> b!1021794 (=> (not res!684577) (not e!575536))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1021794 (= res!684577 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1021795 () Bool)

(declare-fun res!684580 () Bool)

(assert (=> b!1021795 (=> (not res!684580) (not e!575536))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63818 (_ BitVec 32)) Bool)

(assert (=> b!1021795 (= res!684580 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11034 thiss!1427) (mask!29468 thiss!1427)))))

(declare-fun b!1021797 () Bool)

(declare-fun e!575538 () Bool)

(declare-fun e!575541 () Bool)

(assert (=> b!1021797 (= e!575538 (and e!575541 mapRes!37248))))

(declare-fun condMapEmpty!37248 () Bool)

(declare-fun mapDefault!37248 () ValueCell!11240)

