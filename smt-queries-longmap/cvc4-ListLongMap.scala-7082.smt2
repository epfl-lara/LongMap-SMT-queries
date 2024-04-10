; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89550 () Bool)

(assert start!89550)

(declare-fun b!1027189 () Bool)

(declare-fun b_free!20549 () Bool)

(declare-fun b_next!20549 () Bool)

(assert (=> b!1027189 (= b_free!20549 (not b_next!20549))))

(declare-fun tp!72693 () Bool)

(declare-fun b_and!32795 () Bool)

(assert (=> b!1027189 (= tp!72693 b_and!32795)))

(declare-fun mapNonEmpty!37832 () Bool)

(declare-fun mapRes!37832 () Bool)

(declare-fun tp!72692 () Bool)

(declare-fun e!579639 () Bool)

(assert (=> mapNonEmpty!37832 (= mapRes!37832 (and tp!72692 e!579639))))

(declare-datatypes ((V!37231 0))(
  ( (V!37232 (val!12185 Int)) )
))
(declare-datatypes ((ValueCell!11431 0))(
  ( (ValueCellFull!11431 (v!14754 V!37231)) (EmptyCell!11431) )
))
(declare-fun mapRest!37832 () (Array (_ BitVec 32) ValueCell!11431))

(declare-fun mapKey!37832 () (_ BitVec 32))

(declare-fun mapValue!37832 () ValueCell!11431)

(declare-datatypes ((array!64588 0))(
  ( (array!64589 (arr!31103 (Array (_ BitVec 32) (_ BitVec 64))) (size!31616 (_ BitVec 32))) )
))
(declare-datatypes ((array!64590 0))(
  ( (array!64591 (arr!31104 (Array (_ BitVec 32) ValueCell!11431)) (size!31617 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5456 0))(
  ( (LongMapFixedSize!5457 (defaultEntry!6080 Int) (mask!29790 (_ BitVec 32)) (extraKeys!5812 (_ BitVec 32)) (zeroValue!5916 V!37231) (minValue!5916 V!37231) (_size!2783 (_ BitVec 32)) (_keys!11227 array!64588) (_values!6103 array!64590) (_vacant!2783 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5456)

(assert (=> mapNonEmpty!37832 (= (arr!31104 (_values!6103 thiss!1427)) (store mapRest!37832 mapKey!37832 mapValue!37832))))

(declare-fun mapIsEmpty!37832 () Bool)

(assert (=> mapIsEmpty!37832 mapRes!37832))

(declare-fun b!1027182 () Bool)

(declare-fun e!579645 () Bool)

(assert (=> b!1027182 (= e!579645 true)))

(declare-fun lt!452077 () Bool)

(declare-datatypes ((List!21800 0))(
  ( (Nil!21797) (Cons!21796 (h!22994 (_ BitVec 64)) (t!30862 List!21800)) )
))
(declare-fun arrayNoDuplicates!0 (array!64588 (_ BitVec 32) List!21800) Bool)

(assert (=> b!1027182 (= lt!452077 (arrayNoDuplicates!0 (_keys!11227 thiss!1427) #b00000000000000000000000000000000 Nil!21797))))

(declare-fun b!1027183 () Bool)

(declare-fun res!687553 () Bool)

(declare-fun e!579641 () Bool)

(assert (=> b!1027183 (=> (not res!687553) (not e!579641))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1027183 (= res!687553 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1027184 () Bool)

(declare-fun tp_is_empty!24269 () Bool)

(assert (=> b!1027184 (= e!579639 tp_is_empty!24269)))

(declare-fun b!1027185 () Bool)

(declare-fun e!579640 () Bool)

(declare-fun e!579642 () Bool)

(assert (=> b!1027185 (= e!579640 (and e!579642 mapRes!37832))))

(declare-fun condMapEmpty!37832 () Bool)

(declare-fun mapDefault!37832 () ValueCell!11431)

