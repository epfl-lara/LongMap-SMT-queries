; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90092 () Bool)

(assert start!90092)

(declare-fun b!1032115 () Bool)

(declare-fun b_free!20699 () Bool)

(declare-fun b_next!20699 () Bool)

(assert (=> b!1032115 (= b_free!20699 (not b_next!20699))))

(declare-fun tp!73167 () Bool)

(declare-fun b_and!33165 () Bool)

(assert (=> b!1032115 (= tp!73167 b_and!33165)))

(declare-fun b!1032112 () Bool)

(declare-fun e!583070 () Bool)

(declare-fun tp_is_empty!24419 () Bool)

(assert (=> b!1032112 (= e!583070 tp_is_empty!24419)))

(declare-fun mapIsEmpty!38082 () Bool)

(declare-fun mapRes!38082 () Bool)

(assert (=> mapIsEmpty!38082 mapRes!38082))

(declare-fun res!689924 () Bool)

(declare-fun e!583074 () Bool)

(assert (=> start!90092 (=> (not res!689924) (not e!583074))))

(declare-datatypes ((V!37431 0))(
  ( (V!37432 (val!12260 Int)) )
))
(declare-datatypes ((ValueCell!11506 0))(
  ( (ValueCellFull!11506 (v!14837 V!37431)) (EmptyCell!11506) )
))
(declare-datatypes ((array!64902 0))(
  ( (array!64903 (arr!31253 (Array (_ BitVec 32) (_ BitVec 64))) (size!31770 (_ BitVec 32))) )
))
(declare-datatypes ((array!64904 0))(
  ( (array!64905 (arr!31254 (Array (_ BitVec 32) ValueCell!11506)) (size!31771 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5606 0))(
  ( (LongMapFixedSize!5607 (defaultEntry!6177 Int) (mask!29985 (_ BitVec 32)) (extraKeys!5909 (_ BitVec 32)) (zeroValue!6013 V!37431) (minValue!6013 V!37431) (_size!2858 (_ BitVec 32)) (_keys!11350 array!64902) (_values!6200 array!64904) (_vacant!2858 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5606)

(declare-fun valid!2123 (LongMapFixedSize!5606) Bool)

(assert (=> start!90092 (= res!689924 (valid!2123 thiss!1427))))

(assert (=> start!90092 e!583074))

(declare-fun e!583077 () Bool)

(assert (=> start!90092 e!583077))

(assert (=> start!90092 true))

(declare-fun b!1032113 () Bool)

(declare-fun e!583075 () Bool)

(declare-datatypes ((Unit!33812 0))(
  ( (Unit!33813) )
))
(declare-datatypes ((tuple2!15722 0))(
  ( (tuple2!15723 (_1!7872 Unit!33812) (_2!7872 LongMapFixedSize!5606)) )
))
(declare-fun lt!455986 () tuple2!15722)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!64902 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1032113 (= e!583075 (arrayContainsKey!0 (_keys!11350 (_2!7872 lt!455986)) key!909 #b00000000000000000000000000000000))))

(declare-fun b!1032114 () Bool)

(declare-fun e!583068 () Unit!33812)

(declare-fun Unit!33814 () Unit!33812)

(assert (=> b!1032114 (= e!583068 Unit!33814)))

(declare-fun lt!455990 () Unit!33812)

(declare-fun lemmaKeyInListMapIsInArray!354 (array!64902 array!64904 (_ BitVec 32) (_ BitVec 32) V!37431 V!37431 (_ BitVec 64) Int) Unit!33812)

(assert (=> b!1032114 (= lt!455990 (lemmaKeyInListMapIsInArray!354 (_keys!11350 (_2!7872 lt!455986)) (_values!6200 (_2!7872 lt!455986)) (mask!29985 (_2!7872 lt!455986)) (extraKeys!5909 (_2!7872 lt!455986)) (zeroValue!6013 (_2!7872 lt!455986)) (minValue!6013 (_2!7872 lt!455986)) key!909 (defaultEntry!6177 (_2!7872 lt!455986))))))

(declare-fun c!104301 () Bool)

(assert (=> b!1032114 (= c!104301 (and (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!909 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!689925 () Bool)

(assert (=> b!1032114 (= res!689925 e!583075)))

(declare-fun e!583071 () Bool)

(assert (=> b!1032114 (=> (not res!689925) (not e!583071))))

(assert (=> b!1032114 e!583071))

(declare-fun e!583069 () Bool)

(declare-fun array_inv!24195 (array!64902) Bool)

(declare-fun array_inv!24196 (array!64904) Bool)

(assert (=> b!1032115 (= e!583077 (and tp!73167 tp_is_empty!24419 (array_inv!24195 (_keys!11350 thiss!1427)) (array_inv!24196 (_values!6200 thiss!1427)) e!583069))))

(declare-fun b!1032116 () Bool)

(declare-fun e!583076 () Bool)

(assert (=> b!1032116 (= e!583076 tp_is_empty!24419)))

(declare-fun b!1032117 () Bool)

(declare-fun e!583072 () Bool)

(assert (=> b!1032117 (= e!583074 e!583072)))

(declare-fun res!689927 () Bool)

(assert (=> b!1032117 (=> (not res!689927) (not e!583072))))

(declare-datatypes ((SeekEntryResult!9723 0))(
  ( (MissingZero!9723 (index!41263 (_ BitVec 32))) (Found!9723 (index!41264 (_ BitVec 32))) (Intermediate!9723 (undefined!10535 Bool) (index!41265 (_ BitVec 32)) (x!91947 (_ BitVec 32))) (Undefined!9723) (MissingVacant!9723 (index!41266 (_ BitVec 32))) )
))
(declare-fun lt!455987 () SeekEntryResult!9723)

(assert (=> b!1032117 (= res!689927 (is-Found!9723 lt!455987))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64902 (_ BitVec 32)) SeekEntryResult!9723)

(assert (=> b!1032117 (= lt!455987 (seekEntry!0 key!909 (_keys!11350 thiss!1427) (mask!29985 thiss!1427)))))

(declare-fun b!1032118 () Bool)

(assert (=> b!1032118 (= e!583071 false)))

(declare-fun b!1032119 () Bool)

(assert (=> b!1032119 (= e!583069 (and e!583076 mapRes!38082))))

(declare-fun condMapEmpty!38082 () Bool)

(declare-fun mapDefault!38082 () ValueCell!11506)

