; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91654 () Bool)

(assert start!91654)

(declare-fun b!1043398 () Bool)

(declare-fun b_free!21091 () Bool)

(declare-fun b_next!21091 () Bool)

(assert (=> b!1043398 (= b_free!21091 (not b_next!21091))))

(declare-fun tp!74510 () Bool)

(declare-fun b_and!33623 () Bool)

(assert (=> b!1043398 (= tp!74510 b_and!33623)))

(declare-fun b!1043393 () Bool)

(declare-fun res!695142 () Bool)

(declare-fun e!591164 () Bool)

(assert (=> b!1043393 (=> res!695142 e!591164)))

(declare-datatypes ((V!37955 0))(
  ( (V!37956 (val!12456 Int)) )
))
(declare-datatypes ((ValueCell!11702 0))(
  ( (ValueCellFull!11702 (v!15047 V!37955)) (EmptyCell!11702) )
))
(declare-datatypes ((array!65784 0))(
  ( (array!65785 (arr!31645 (Array (_ BitVec 32) (_ BitVec 64))) (size!32180 (_ BitVec 32))) )
))
(declare-datatypes ((array!65786 0))(
  ( (array!65787 (arr!31646 (Array (_ BitVec 32) ValueCell!11702)) (size!32181 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5998 0))(
  ( (LongMapFixedSize!5999 (defaultEntry!6381 Int) (mask!30470 (_ BitVec 32)) (extraKeys!6109 (_ BitVec 32)) (zeroValue!6215 V!37955) (minValue!6215 V!37955) (_size!3054 (_ BitVec 32)) (_keys!11639 array!65784) (_values!6404 array!65786) (_vacant!3054 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5998)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65784 (_ BitVec 32)) Bool)

(assert (=> b!1043393 (= res!695142 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11639 thiss!1427) (mask!30470 thiss!1427))))))

(declare-fun b!1043394 () Bool)

(declare-fun e!591165 () Bool)

(declare-fun e!591163 () Bool)

(declare-fun mapRes!38837 () Bool)

(assert (=> b!1043394 (= e!591165 (and e!591163 mapRes!38837))))

(declare-fun condMapEmpty!38837 () Bool)

(declare-fun mapDefault!38837 () ValueCell!11702)

