; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76624 () Bool)

(assert start!76624)

(declare-fun b!897387 () Bool)

(declare-fun b_free!15983 () Bool)

(declare-fun b_next!15983 () Bool)

(assert (=> b!897387 (= b_free!15983 (not b_next!15983))))

(declare-fun tp!55998 () Bool)

(declare-fun b_and!26275 () Bool)

(assert (=> b!897387 (= tp!55998 b_and!26275)))

(declare-fun b!897382 () Bool)

(declare-fun res!606597 () Bool)

(declare-fun e!501804 () Bool)

(assert (=> b!897382 (=> (not res!606597) (not e!501804))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!897382 (= res!606597 (not (= key!785 (bvneg key!785))))))

(declare-fun res!606593 () Bool)

(assert (=> start!76624 (=> (not res!606593) (not e!501804))))

(declare-datatypes ((array!52648 0))(
  ( (array!52649 (arr!25307 (Array (_ BitVec 32) (_ BitVec 64))) (size!25761 (_ BitVec 32))) )
))
(declare-datatypes ((V!29379 0))(
  ( (V!29380 (val!9206 Int)) )
))
(declare-datatypes ((ValueCell!8674 0))(
  ( (ValueCellFull!8674 (v!11696 V!29379)) (EmptyCell!8674) )
))
(declare-datatypes ((array!52650 0))(
  ( (array!52651 (arr!25308 (Array (_ BitVec 32) ValueCell!8674)) (size!25762 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4364 0))(
  ( (LongMapFixedSize!4365 (defaultEntry!5394 Int) (mask!26079 (_ BitVec 32)) (extraKeys!5103 (_ BitVec 32)) (zeroValue!5207 V!29379) (minValue!5207 V!29379) (_size!2237 (_ BitVec 32)) (_keys!10149 array!52648) (_values!5394 array!52650) (_vacant!2237 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4364)

(declare-fun valid!1681 (LongMapFixedSize!4364) Bool)

(assert (=> start!76624 (= res!606593 (valid!1681 thiss!1181))))

(assert (=> start!76624 e!501804))

(declare-fun e!501800 () Bool)

(assert (=> start!76624 e!501800))

(assert (=> start!76624 true))

(declare-fun mapNonEmpty!29102 () Bool)

(declare-fun mapRes!29102 () Bool)

(declare-fun tp!55999 () Bool)

(declare-fun e!501803 () Bool)

(assert (=> mapNonEmpty!29102 (= mapRes!29102 (and tp!55999 e!501803))))

(declare-fun mapValue!29102 () ValueCell!8674)

(declare-fun mapKey!29102 () (_ BitVec 32))

(declare-fun mapRest!29102 () (Array (_ BitVec 32) ValueCell!8674))

(assert (=> mapNonEmpty!29102 (= (arr!25308 (_values!5394 thiss!1181)) (store mapRest!29102 mapKey!29102 mapValue!29102))))

(declare-fun b!897383 () Bool)

(declare-fun e!501802 () Bool)

(declare-datatypes ((SeekEntryResult!8909 0))(
  ( (MissingZero!8909 (index!38007 (_ BitVec 32))) (Found!8909 (index!38008 (_ BitVec 32))) (Intermediate!8909 (undefined!9721 Bool) (index!38009 (_ BitVec 32)) (x!76449 (_ BitVec 32))) (Undefined!8909) (MissingVacant!8909 (index!38010 (_ BitVec 32))) )
))
(declare-fun lt!405162 () SeekEntryResult!8909)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!897383 (= e!501802 (inRange!0 (index!38008 lt!405162) (mask!26079 thiss!1181)))))

(declare-fun b!897384 () Bool)

(declare-fun e!501805 () Bool)

(declare-fun e!501806 () Bool)

(assert (=> b!897384 (= e!501805 e!501806)))

(declare-fun res!606596 () Bool)

(assert (=> b!897384 (=> res!606596 e!501806)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!897384 (= res!606596 (not (validMask!0 (mask!26079 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52648 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!897384 (arrayContainsKey!0 (_keys!10149 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30508 0))(
  ( (Unit!30509) )
))
(declare-fun lt!405161 () Unit!30508)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52648 (_ BitVec 64) (_ BitVec 32)) Unit!30508)

(assert (=> b!897384 (= lt!405161 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10149 thiss!1181) key!785 (index!38008 lt!405162)))))

(declare-fun b!897385 () Bool)

(declare-fun e!501807 () Bool)

(declare-fun tp_is_empty!18311 () Bool)

(assert (=> b!897385 (= e!501807 tp_is_empty!18311)))

(declare-fun b!897386 () Bool)

(assert (=> b!897386 (= e!501806 (or (not (= (size!25762 (_values!5394 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26079 thiss!1181)))) (not (= (size!25761 (_keys!10149 thiss!1181)) (size!25762 (_values!5394 thiss!1181)))) (bvslt (mask!26079 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5103 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5103 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!29102 () Bool)

(assert (=> mapIsEmpty!29102 mapRes!29102))

(declare-fun e!501801 () Bool)

(declare-fun array_inv!19862 (array!52648) Bool)

(declare-fun array_inv!19863 (array!52650) Bool)

(assert (=> b!897387 (= e!501800 (and tp!55998 tp_is_empty!18311 (array_inv!19862 (_keys!10149 thiss!1181)) (array_inv!19863 (_values!5394 thiss!1181)) e!501801))))

(declare-fun b!897388 () Bool)

(assert (=> b!897388 (= e!501801 (and e!501807 mapRes!29102))))

(declare-fun condMapEmpty!29102 () Bool)

(declare-fun mapDefault!29102 () ValueCell!8674)

