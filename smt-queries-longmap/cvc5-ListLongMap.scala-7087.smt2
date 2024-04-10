; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89608 () Bool)

(assert start!89608)

(declare-fun b!1027739 () Bool)

(declare-fun b_free!20575 () Bool)

(declare-fun b_next!20575 () Bool)

(assert (=> b!1027739 (= b_free!20575 (not b_next!20575))))

(declare-fun tp!72773 () Bool)

(declare-fun b_and!32833 () Bool)

(assert (=> b!1027739 (= tp!72773 b_and!32833)))

(declare-fun res!687844 () Bool)

(declare-fun e!580067 () Bool)

(assert (=> start!89608 (=> (not res!687844) (not e!580067))))

(declare-datatypes ((V!37267 0))(
  ( (V!37268 (val!12198 Int)) )
))
(declare-datatypes ((ValueCell!11444 0))(
  ( (ValueCellFull!11444 (v!14767 V!37267)) (EmptyCell!11444) )
))
(declare-datatypes ((array!64642 0))(
  ( (array!64643 (arr!31129 (Array (_ BitVec 32) (_ BitVec 64))) (size!31642 (_ BitVec 32))) )
))
(declare-datatypes ((array!64644 0))(
  ( (array!64645 (arr!31130 (Array (_ BitVec 32) ValueCell!11444)) (size!31643 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5482 0))(
  ( (LongMapFixedSize!5483 (defaultEntry!6095 Int) (mask!29819 (_ BitVec 32)) (extraKeys!5827 (_ BitVec 32)) (zeroValue!5931 V!37267) (minValue!5931 V!37267) (_size!2796 (_ BitVec 32)) (_keys!11244 array!64642) (_values!6118 array!64644) (_vacant!2796 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5482)

(declare-fun valid!2076 (LongMapFixedSize!5482) Bool)

(assert (=> start!89608 (= res!687844 (valid!2076 thiss!1427))))

(assert (=> start!89608 e!580067))

(declare-fun e!580071 () Bool)

(assert (=> start!89608 e!580071))

(assert (=> start!89608 true))

(declare-fun b!1027738 () Bool)

(declare-fun e!580065 () Bool)

(assert (=> b!1027738 (= e!580067 e!580065)))

(declare-fun res!687843 () Bool)

(assert (=> b!1027738 (=> (not res!687843) (not e!580065))))

(declare-datatypes ((SeekEntryResult!9676 0))(
  ( (MissingZero!9676 (index!41075 (_ BitVec 32))) (Found!9676 (index!41076 (_ BitVec 32))) (Intermediate!9676 (undefined!10488 Bool) (index!41077 (_ BitVec 32)) (x!91460 (_ BitVec 32))) (Undefined!9676) (MissingVacant!9676 (index!41078 (_ BitVec 32))) )
))
(declare-fun lt!452493 () SeekEntryResult!9676)

(assert (=> b!1027738 (= res!687843 (is-Found!9676 lt!452493))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64642 (_ BitVec 32)) SeekEntryResult!9676)

(assert (=> b!1027738 (= lt!452493 (seekEntry!0 key!909 (_keys!11244 thiss!1427) (mask!29819 thiss!1427)))))

(declare-fun e!580072 () Bool)

(declare-fun tp_is_empty!24295 () Bool)

(declare-fun array_inv!24099 (array!64642) Bool)

(declare-fun array_inv!24100 (array!64644) Bool)

(assert (=> b!1027739 (= e!580071 (and tp!72773 tp_is_empty!24295 (array_inv!24099 (_keys!11244 thiss!1427)) (array_inv!24100 (_values!6118 thiss!1427)) e!580072))))

(declare-fun mapNonEmpty!37874 () Bool)

(declare-fun mapRes!37874 () Bool)

(declare-fun tp!72774 () Bool)

(declare-fun e!580069 () Bool)

(assert (=> mapNonEmpty!37874 (= mapRes!37874 (and tp!72774 e!580069))))

(declare-fun mapRest!37874 () (Array (_ BitVec 32) ValueCell!11444))

(declare-fun mapValue!37874 () ValueCell!11444)

(declare-fun mapKey!37874 () (_ BitVec 32))

(assert (=> mapNonEmpty!37874 (= (arr!31130 (_values!6118 thiss!1427)) (store mapRest!37874 mapKey!37874 mapValue!37874))))

(declare-fun b!1027740 () Bool)

(declare-fun res!687842 () Bool)

(assert (=> b!1027740 (=> (not res!687842) (not e!580067))))

(assert (=> b!1027740 (= res!687842 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1027741 () Bool)

(declare-fun e!580066 () Bool)

(assert (=> b!1027741 (= e!580066 tp_is_empty!24295)))

(declare-fun mapIsEmpty!37874 () Bool)

(assert (=> mapIsEmpty!37874 mapRes!37874))

(declare-fun b!1027742 () Bool)

(assert (=> b!1027742 (= e!580069 tp_is_empty!24295)))

(declare-fun b!1027743 () Bool)

(assert (=> b!1027743 (= e!580072 (and e!580066 mapRes!37874))))

(declare-fun condMapEmpty!37874 () Bool)

(declare-fun mapDefault!37874 () ValueCell!11444)

