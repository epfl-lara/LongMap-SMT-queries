; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90866 () Bool)

(assert start!90866)

(declare-fun b!1038554 () Bool)

(declare-fun b_free!20947 () Bool)

(declare-fun b_next!20947 () Bool)

(assert (=> b!1038554 (= b_free!20947 (not b_next!20947))))

(declare-fun tp!74004 () Bool)

(declare-fun b_and!33479 () Bool)

(assert (=> b!1038554 (= tp!74004 b_and!33479)))

(declare-fun b!1038553 () Bool)

(declare-fun e!587658 () Bool)

(declare-fun e!587653 () Bool)

(assert (=> b!1038553 (= e!587658 e!587653)))

(declare-fun res!692781 () Bool)

(assert (=> b!1038553 (=> (not res!692781) (not e!587653))))

(declare-datatypes ((SeekEntryResult!9772 0))(
  ( (MissingZero!9772 (index!41459 (_ BitVec 32))) (Found!9772 (index!41460 (_ BitVec 32))) (Intermediate!9772 (undefined!10584 Bool) (index!41461 (_ BitVec 32)) (x!92675 (_ BitVec 32))) (Undefined!9772) (MissingVacant!9772 (index!41462 (_ BitVec 32))) )
))
(declare-fun lt!457779 () SeekEntryResult!9772)

(assert (=> b!1038553 (= res!692781 (is-Found!9772 lt!457779))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37763 0))(
  ( (V!37764 (val!12384 Int)) )
))
(declare-datatypes ((ValueCell!11630 0))(
  ( (ValueCellFull!11630 (v!14970 V!37763)) (EmptyCell!11630) )
))
(declare-datatypes ((array!65450 0))(
  ( (array!65451 (arr!31501 (Array (_ BitVec 32) (_ BitVec 64))) (size!32031 (_ BitVec 32))) )
))
(declare-datatypes ((array!65452 0))(
  ( (array!65453 (arr!31502 (Array (_ BitVec 32) ValueCell!11630)) (size!32032 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5854 0))(
  ( (LongMapFixedSize!5855 (defaultEntry!6309 Int) (mask!30251 (_ BitVec 32)) (extraKeys!6037 (_ BitVec 32)) (zeroValue!6143 V!37763) (minValue!6143 V!37763) (_size!2982 (_ BitVec 32)) (_keys!11511 array!65450) (_values!6332 array!65452) (_vacant!2982 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5854)

(declare-fun seekEntry!0 ((_ BitVec 64) array!65450 (_ BitVec 32)) SeekEntryResult!9772)

(assert (=> b!1038553 (= lt!457779 (seekEntry!0 key!909 (_keys!11511 thiss!1427) (mask!30251 thiss!1427)))))

(declare-fun mapIsEmpty!38547 () Bool)

(declare-fun mapRes!38547 () Bool)

(assert (=> mapIsEmpty!38547 mapRes!38547))

(declare-fun e!587654 () Bool)

(declare-fun tp_is_empty!24667 () Bool)

(declare-fun e!587657 () Bool)

(declare-fun array_inv!24357 (array!65450) Bool)

(declare-fun array_inv!24358 (array!65452) Bool)

(assert (=> b!1038554 (= e!587654 (and tp!74004 tp_is_empty!24667 (array_inv!24357 (_keys!11511 thiss!1427)) (array_inv!24358 (_values!6332 thiss!1427)) e!587657))))

(declare-fun b!1038555 () Bool)

(declare-fun e!587656 () Bool)

(assert (=> b!1038555 (= e!587657 (and e!587656 mapRes!38547))))

(declare-fun condMapEmpty!38547 () Bool)

(declare-fun mapDefault!38547 () ValueCell!11630)

