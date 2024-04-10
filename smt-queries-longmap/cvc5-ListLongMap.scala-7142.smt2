; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90740 () Bool)

(assert start!90740)

(declare-fun b!1037510 () Bool)

(declare-fun b_free!20905 () Bool)

(declare-fun b_next!20905 () Bool)

(assert (=> b!1037510 (= b_free!20905 (not b_next!20905))))

(declare-fun tp!73863 () Bool)

(declare-fun b_and!33437 () Bool)

(assert (=> b!1037510 (= tp!73863 b_and!33437)))

(declare-fun res!692210 () Bool)

(declare-fun e!586908 () Bool)

(assert (=> start!90740 (=> (not res!692210) (not e!586908))))

(declare-datatypes ((V!37707 0))(
  ( (V!37708 (val!12363 Int)) )
))
(declare-datatypes ((ValueCell!11609 0))(
  ( (ValueCellFull!11609 (v!14946 V!37707)) (EmptyCell!11609) )
))
(declare-datatypes ((array!65356 0))(
  ( (array!65357 (arr!31459 (Array (_ BitVec 32) (_ BitVec 64))) (size!31989 (_ BitVec 32))) )
))
(declare-datatypes ((array!65358 0))(
  ( (array!65359 (arr!31460 (Array (_ BitVec 32) ValueCell!11609)) (size!31990 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5812 0))(
  ( (LongMapFixedSize!5813 (defaultEntry!6288 Int) (mask!30210 (_ BitVec 32)) (extraKeys!6016 (_ BitVec 32)) (zeroValue!6122 V!37707) (minValue!6122 V!37707) (_size!2961 (_ BitVec 32)) (_keys!11485 array!65356) (_values!6311 array!65358) (_vacant!2961 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5812)

(declare-fun valid!2191 (LongMapFixedSize!5812) Bool)

(assert (=> start!90740 (= res!692210 (valid!2191 thiss!1427))))

(assert (=> start!90740 e!586908))

(declare-fun e!586903 () Bool)

(assert (=> start!90740 e!586903))

(assert (=> start!90740 true))

(declare-fun b!1037503 () Bool)

(declare-fun e!586906 () Bool)

(assert (=> b!1037503 (= e!586908 e!586906)))

(declare-fun res!692211 () Bool)

(assert (=> b!1037503 (=> (not res!692211) (not e!586906))))

(declare-datatypes ((SeekEntryResult!9756 0))(
  ( (MissingZero!9756 (index!41395 (_ BitVec 32))) (Found!9756 (index!41396 (_ BitVec 32))) (Intermediate!9756 (undefined!10568 Bool) (index!41397 (_ BitVec 32)) (x!92563 (_ BitVec 32))) (Undefined!9756) (MissingVacant!9756 (index!41398 (_ BitVec 32))) )
))
(declare-fun lt!457511 () SeekEntryResult!9756)

(assert (=> b!1037503 (= res!692211 (is-Found!9756 lt!457511))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65356 (_ BitVec 32)) SeekEntryResult!9756)

(assert (=> b!1037503 (= lt!457511 (seekEntry!0 key!909 (_keys!11485 thiss!1427) (mask!30210 thiss!1427)))))

(declare-fun mapIsEmpty!38469 () Bool)

(declare-fun mapRes!38469 () Bool)

(assert (=> mapIsEmpty!38469 mapRes!38469))

(declare-fun b!1037504 () Bool)

(declare-fun e!586905 () Bool)

(declare-fun tp_is_empty!24625 () Bool)

(assert (=> b!1037504 (= e!586905 tp_is_empty!24625)))

(declare-fun b!1037505 () Bool)

(declare-fun e!586902 () Bool)

(assert (=> b!1037505 (= e!586902 (and e!586905 mapRes!38469))))

(declare-fun condMapEmpty!38469 () Bool)

(declare-fun mapDefault!38469 () ValueCell!11609)

