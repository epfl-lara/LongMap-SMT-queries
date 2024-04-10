; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89248 () Bool)

(assert start!89248)

(declare-fun b!1023364 () Bool)

(declare-fun b_free!20289 () Bool)

(declare-fun b_next!20289 () Bool)

(assert (=> b!1023364 (= b_free!20289 (not b_next!20289))))

(declare-fun tp!71901 () Bool)

(declare-fun b_and!32511 () Bool)

(assert (=> b!1023364 (= tp!71901 b_and!32511)))

(declare-fun b!1023356 () Bool)

(declare-fun res!685387 () Bool)

(declare-fun e!576639 () Bool)

(assert (=> b!1023356 (=> (not res!685387) (not e!576639))))

(declare-datatypes ((V!36885 0))(
  ( (V!36886 (val!12055 Int)) )
))
(declare-datatypes ((ValueCell!11301 0))(
  ( (ValueCellFull!11301 (v!14624 V!36885)) (EmptyCell!11301) )
))
(declare-datatypes ((array!64062 0))(
  ( (array!64063 (arr!30843 (Array (_ BitVec 32) (_ BitVec 64))) (size!31354 (_ BitVec 32))) )
))
(declare-datatypes ((array!64064 0))(
  ( (array!64065 (arr!30844 (Array (_ BitVec 32) ValueCell!11301)) (size!31355 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5196 0))(
  ( (LongMapFixedSize!5197 (defaultEntry!5950 Int) (mask!29569 (_ BitVec 32)) (extraKeys!5682 (_ BitVec 32)) (zeroValue!5786 V!36885) (minValue!5786 V!36885) (_size!2653 (_ BitVec 32)) (_keys!11095 array!64062) (_values!5973 array!64064) (_vacant!2653 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5196)

(assert (=> b!1023356 (= res!685387 (and (= (size!31355 (_values!5973 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29569 thiss!1427))) (= (size!31354 (_keys!11095 thiss!1427)) (size!31355 (_values!5973 thiss!1427))) (bvsge (mask!29569 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5682 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5682 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5682 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5682 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5682 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5682 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5682 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1023357 () Bool)

(declare-fun e!576637 () Bool)

(declare-fun tp_is_empty!24009 () Bool)

(assert (=> b!1023357 (= e!576637 tp_is_empty!24009)))

(declare-fun b!1023358 () Bool)

(declare-fun res!685384 () Bool)

(assert (=> b!1023358 (=> (not res!685384) (not e!576639))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023358 (= res!685384 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!685388 () Bool)

(assert (=> start!89248 (=> (not res!685388) (not e!576639))))

(declare-fun valid!1979 (LongMapFixedSize!5196) Bool)

(assert (=> start!89248 (= res!685388 (valid!1979 thiss!1427))))

(assert (=> start!89248 e!576639))

(declare-fun e!576635 () Bool)

(assert (=> start!89248 e!576635))

(assert (=> start!89248 true))

(declare-fun b!1023359 () Bool)

(declare-fun res!685385 () Bool)

(assert (=> b!1023359 (=> (not res!685385) (not e!576639))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1023359 (= res!685385 (validMask!0 (mask!29569 thiss!1427)))))

(declare-fun b!1023360 () Bool)

(declare-fun res!685386 () Bool)

(assert (=> b!1023360 (=> (not res!685386) (not e!576639))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64062 (_ BitVec 32)) Bool)

(assert (=> b!1023360 (= res!685386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11095 thiss!1427) (mask!29569 thiss!1427)))))

(declare-fun b!1023361 () Bool)

(declare-fun e!576634 () Bool)

(declare-fun e!576638 () Bool)

(declare-fun mapRes!37431 () Bool)

(assert (=> b!1023361 (= e!576634 (and e!576638 mapRes!37431))))

(declare-fun condMapEmpty!37431 () Bool)

(declare-fun mapDefault!37431 () ValueCell!11301)

(assert (=> b!1023361 (= condMapEmpty!37431 (= (arr!30844 (_values!5973 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11301)) mapDefault!37431)))))

(declare-fun b!1023362 () Bool)

(assert (=> b!1023362 (= e!576638 tp_is_empty!24009)))

(declare-fun b!1023363 () Bool)

(assert (=> b!1023363 (= e!576639 false)))

(declare-fun lt!450399 () Bool)

(declare-datatypes ((List!21711 0))(
  ( (Nil!21708) (Cons!21707 (h!22905 (_ BitVec 64)) (t!30749 List!21711)) )
))
(declare-fun arrayNoDuplicates!0 (array!64062 (_ BitVec 32) List!21711) Bool)

(assert (=> b!1023363 (= lt!450399 (arrayNoDuplicates!0 (_keys!11095 thiss!1427) #b00000000000000000000000000000000 Nil!21708))))

(declare-fun mapIsEmpty!37431 () Bool)

(assert (=> mapIsEmpty!37431 mapRes!37431))

(declare-fun array_inv!23901 (array!64062) Bool)

(declare-fun array_inv!23902 (array!64064) Bool)

(assert (=> b!1023364 (= e!576635 (and tp!71901 tp_is_empty!24009 (array_inv!23901 (_keys!11095 thiss!1427)) (array_inv!23902 (_values!5973 thiss!1427)) e!576634))))

(declare-fun mapNonEmpty!37431 () Bool)

(declare-fun tp!71902 () Bool)

(assert (=> mapNonEmpty!37431 (= mapRes!37431 (and tp!71902 e!576637))))

(declare-fun mapKey!37431 () (_ BitVec 32))

(declare-fun mapRest!37431 () (Array (_ BitVec 32) ValueCell!11301))

(declare-fun mapValue!37431 () ValueCell!11301)

(assert (=> mapNonEmpty!37431 (= (arr!30844 (_values!5973 thiss!1427)) (store mapRest!37431 mapKey!37431 mapValue!37431))))

(assert (= (and start!89248 res!685388) b!1023358))

(assert (= (and b!1023358 res!685384) b!1023359))

(assert (= (and b!1023359 res!685385) b!1023356))

(assert (= (and b!1023356 res!685387) b!1023360))

(assert (= (and b!1023360 res!685386) b!1023363))

(assert (= (and b!1023361 condMapEmpty!37431) mapIsEmpty!37431))

(assert (= (and b!1023361 (not condMapEmpty!37431)) mapNonEmpty!37431))

(get-info :version)

(assert (= (and mapNonEmpty!37431 ((_ is ValueCellFull!11301) mapValue!37431)) b!1023357))

(assert (= (and b!1023361 ((_ is ValueCellFull!11301) mapDefault!37431)) b!1023362))

(assert (= b!1023364 b!1023361))

(assert (= start!89248 b!1023364))

(declare-fun m!942079 () Bool)

(assert (=> b!1023364 m!942079))

(declare-fun m!942081 () Bool)

(assert (=> b!1023364 m!942081))

(declare-fun m!942083 () Bool)

(assert (=> mapNonEmpty!37431 m!942083))

(declare-fun m!942085 () Bool)

(assert (=> b!1023360 m!942085))

(declare-fun m!942087 () Bool)

(assert (=> b!1023359 m!942087))

(declare-fun m!942089 () Bool)

(assert (=> b!1023363 m!942089))

(declare-fun m!942091 () Bool)

(assert (=> start!89248 m!942091))

(check-sat (not start!89248) (not mapNonEmpty!37431) (not b_next!20289) (not b!1023359) b_and!32511 (not b!1023363) (not b!1023360) (not b!1023364) tp_is_empty!24009)
(check-sat b_and!32511 (not b_next!20289))
