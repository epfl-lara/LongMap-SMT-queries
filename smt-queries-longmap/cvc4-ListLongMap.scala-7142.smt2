; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90744 () Bool)

(assert start!90744)

(declare-fun b!1037556 () Bool)

(declare-fun b_free!20909 () Bool)

(declare-fun b_next!20909 () Bool)

(assert (=> b!1037556 (= b_free!20909 (not b_next!20909))))

(declare-fun tp!73876 () Bool)

(declare-fun b_and!33441 () Bool)

(assert (=> b!1037556 (= tp!73876 b_and!33441)))

(declare-fun b!1037552 () Bool)

(declare-fun e!586950 () Bool)

(declare-fun e!586949 () Bool)

(assert (=> b!1037552 (= e!586950 e!586949)))

(declare-fun res!692233 () Bool)

(assert (=> b!1037552 (=> (not res!692233) (not e!586949))))

(declare-datatypes ((SeekEntryResult!9758 0))(
  ( (MissingZero!9758 (index!41403 (_ BitVec 32))) (Found!9758 (index!41404 (_ BitVec 32))) (Intermediate!9758 (undefined!10570 Bool) (index!41405 (_ BitVec 32)) (x!92565 (_ BitVec 32))) (Undefined!9758) (MissingVacant!9758 (index!41406 (_ BitVec 32))) )
))
(declare-fun lt!457524 () SeekEntryResult!9758)

(assert (=> b!1037552 (= res!692233 (is-Found!9758 lt!457524))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37711 0))(
  ( (V!37712 (val!12365 Int)) )
))
(declare-datatypes ((ValueCell!11611 0))(
  ( (ValueCellFull!11611 (v!14948 V!37711)) (EmptyCell!11611) )
))
(declare-datatypes ((array!65364 0))(
  ( (array!65365 (arr!31463 (Array (_ BitVec 32) (_ BitVec 64))) (size!31993 (_ BitVec 32))) )
))
(declare-datatypes ((array!65366 0))(
  ( (array!65367 (arr!31464 (Array (_ BitVec 32) ValueCell!11611)) (size!31994 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5816 0))(
  ( (LongMapFixedSize!5817 (defaultEntry!6290 Int) (mask!30212 (_ BitVec 32)) (extraKeys!6018 (_ BitVec 32)) (zeroValue!6124 V!37711) (minValue!6124 V!37711) (_size!2963 (_ BitVec 32)) (_keys!11487 array!65364) (_values!6313 array!65366) (_vacant!2963 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5816)

(declare-fun seekEntry!0 ((_ BitVec 64) array!65364 (_ BitVec 32)) SeekEntryResult!9758)

(assert (=> b!1037552 (= lt!457524 (seekEntry!0 key!909 (_keys!11487 thiss!1427) (mask!30212 thiss!1427)))))

(declare-fun b!1037553 () Bool)

(declare-fun e!586956 () Bool)

(declare-fun e!586953 () Bool)

(declare-fun mapRes!38475 () Bool)

(assert (=> b!1037553 (= e!586956 (and e!586953 mapRes!38475))))

(declare-fun condMapEmpty!38475 () Bool)

(declare-fun mapDefault!38475 () ValueCell!11611)

