; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75836 () Bool)

(assert start!75836)

(declare-fun b!892277 () Bool)

(declare-fun b_free!15807 () Bool)

(declare-fun b_next!15807 () Bool)

(assert (=> b!892277 (= b_free!15807 (not b_next!15807))))

(declare-fun tp!55390 () Bool)

(declare-fun b_and!26047 () Bool)

(assert (=> b!892277 (= tp!55390 b_and!26047)))

(declare-fun b!892267 () Bool)

(declare-fun e!498057 () Bool)

(declare-datatypes ((SeekEntryResult!8843 0))(
  ( (MissingZero!8843 (index!37743 (_ BitVec 32))) (Found!8843 (index!37744 (_ BitVec 32))) (Intermediate!8843 (undefined!9655 Bool) (index!37745 (_ BitVec 32)) (x!75827 (_ BitVec 32))) (Undefined!8843) (MissingVacant!8843 (index!37746 (_ BitVec 32))) )
))
(declare-fun lt!403107 () SeekEntryResult!8843)

(declare-datatypes ((array!52250 0))(
  ( (array!52251 (arr!25131 (Array (_ BitVec 32) (_ BitVec 64))) (size!25575 (_ BitVec 32))) )
))
(declare-datatypes ((V!29145 0))(
  ( (V!29146 (val!9118 Int)) )
))
(declare-datatypes ((ValueCell!8586 0))(
  ( (ValueCellFull!8586 (v!11596 V!29145)) (EmptyCell!8586) )
))
(declare-datatypes ((array!52252 0))(
  ( (array!52253 (arr!25132 (Array (_ BitVec 32) ValueCell!8586)) (size!25576 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4188 0))(
  ( (LongMapFixedSize!4189 (defaultEntry!5291 Int) (mask!25800 (_ BitVec 32)) (extraKeys!4985 (_ BitVec 32)) (zeroValue!5089 V!29145) (minValue!5089 V!29145) (_size!2149 (_ BitVec 32)) (_keys!9974 array!52250) (_values!5276 array!52252) (_vacant!2149 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4188)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!892267 (= e!498057 (inRange!0 (index!37744 lt!403107) (mask!25800 thiss!1181)))))

(declare-fun mapIsEmpty!28757 () Bool)

(declare-fun mapRes!28757 () Bool)

(assert (=> mapIsEmpty!28757 mapRes!28757))

(declare-fun b!892268 () Bool)

(declare-fun e!498060 () Bool)

(declare-fun tp_is_empty!18135 () Bool)

(assert (=> b!892268 (= e!498060 tp_is_empty!18135)))

(declare-fun b!892269 () Bool)

(declare-fun e!498055 () Bool)

(declare-fun e!498058 () Bool)

(assert (=> b!892269 (= e!498055 (not e!498058))))

(declare-fun res!604516 () Bool)

(assert (=> b!892269 (=> res!604516 e!498058)))

(get-info :version)

(assert (=> b!892269 (= res!604516 (not ((_ is Found!8843) lt!403107)))))

(assert (=> b!892269 e!498057))

(declare-fun res!604518 () Bool)

(assert (=> b!892269 (=> res!604518 e!498057)))

(assert (=> b!892269 (= res!604518 (not ((_ is Found!8843) lt!403107)))))

(declare-datatypes ((Unit!30382 0))(
  ( (Unit!30383) )
))
(declare-fun lt!403103 () Unit!30382)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!43 (array!52250 array!52252 (_ BitVec 32) (_ BitVec 32) V!29145 V!29145 (_ BitVec 64)) Unit!30382)

(assert (=> b!892269 (= lt!403103 (lemmaSeekEntryGivesInRangeIndex!43 (_keys!9974 thiss!1181) (_values!5276 thiss!1181) (mask!25800 thiss!1181) (extraKeys!4985 thiss!1181) (zeroValue!5089 thiss!1181) (minValue!5089 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52250 (_ BitVec 32)) SeekEntryResult!8843)

(assert (=> b!892269 (= lt!403107 (seekEntry!0 key!785 (_keys!9974 thiss!1181) (mask!25800 thiss!1181)))))

(declare-fun mapNonEmpty!28757 () Bool)

(declare-fun tp!55389 () Bool)

(declare-fun e!498056 () Bool)

(assert (=> mapNonEmpty!28757 (= mapRes!28757 (and tp!55389 e!498056))))

(declare-fun mapKey!28757 () (_ BitVec 32))

(declare-fun mapValue!28757 () ValueCell!8586)

(declare-fun mapRest!28757 () (Array (_ BitVec 32) ValueCell!8586))

(assert (=> mapNonEmpty!28757 (= (arr!25132 (_values!5276 thiss!1181)) (store mapRest!28757 mapKey!28757 mapValue!28757))))

(declare-fun b!892270 () Bool)

(declare-fun res!604519 () Bool)

(declare-fun e!498059 () Bool)

(assert (=> b!892270 (=> res!604519 e!498059)))

(assert (=> b!892270 (= res!604519 (or (not (= (size!25576 (_values!5276 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25800 thiss!1181)))) (not (= (size!25575 (_keys!9974 thiss!1181)) (size!25576 (_values!5276 thiss!1181)))) (bvslt (mask!25800 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4985 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4985 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!892271 () Bool)

(assert (=> b!892271 (= e!498059 true)))

(declare-fun lt!403104 () Bool)

(declare-datatypes ((tuple2!11988 0))(
  ( (tuple2!11989 (_1!6005 (_ BitVec 64)) (_2!6005 V!29145)) )
))
(declare-datatypes ((List!17777 0))(
  ( (Nil!17774) (Cons!17773 (h!18904 tuple2!11988) (t!25076 List!17777)) )
))
(declare-datatypes ((ListLongMap!10685 0))(
  ( (ListLongMap!10686 (toList!5358 List!17777)) )
))
(declare-fun lt!403105 () ListLongMap!10685)

(declare-fun contains!4360 (ListLongMap!10685 (_ BitVec 64)) Bool)

(assert (=> b!892271 (= lt!403104 (contains!4360 lt!403105 key!785))))

(declare-fun b!892272 () Bool)

(declare-fun e!498052 () Bool)

(assert (=> b!892272 (= e!498052 (and e!498060 mapRes!28757))))

(declare-fun condMapEmpty!28757 () Bool)

(declare-fun mapDefault!28757 () ValueCell!8586)

(assert (=> b!892272 (= condMapEmpty!28757 (= (arr!25132 (_values!5276 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8586)) mapDefault!28757)))))

(declare-fun b!892273 () Bool)

(assert (=> b!892273 (= e!498056 tp_is_empty!18135)))

(declare-fun res!604523 () Bool)

(assert (=> start!75836 (=> (not res!604523) (not e!498055))))

(declare-fun valid!1620 (LongMapFixedSize!4188) Bool)

(assert (=> start!75836 (= res!604523 (valid!1620 thiss!1181))))

(assert (=> start!75836 e!498055))

(declare-fun e!498053 () Bool)

(assert (=> start!75836 e!498053))

(assert (=> start!75836 true))

(declare-fun b!892274 () Bool)

(declare-fun res!604522 () Bool)

(assert (=> b!892274 (=> (not res!604522) (not e!498055))))

(assert (=> b!892274 (= res!604522 (not (= key!785 (bvneg key!785))))))

(declare-fun b!892275 () Bool)

(declare-fun res!604521 () Bool)

(assert (=> b!892275 (=> res!604521 e!498059)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52250 (_ BitVec 32)) Bool)

(assert (=> b!892275 (= res!604521 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9974 thiss!1181) (mask!25800 thiss!1181))))))

(declare-fun b!892276 () Bool)

(declare-fun res!604517 () Bool)

(assert (=> b!892276 (=> res!604517 e!498059)))

(declare-datatypes ((List!17778 0))(
  ( (Nil!17775) (Cons!17774 (h!18905 (_ BitVec 64)) (t!25077 List!17778)) )
))
(declare-fun arrayNoDuplicates!0 (array!52250 (_ BitVec 32) List!17778) Bool)

(assert (=> b!892276 (= res!604517 (not (arrayNoDuplicates!0 (_keys!9974 thiss!1181) #b00000000000000000000000000000000 Nil!17775)))))

(declare-fun array_inv!19740 (array!52250) Bool)

(declare-fun array_inv!19741 (array!52252) Bool)

(assert (=> b!892277 (= e!498053 (and tp!55390 tp_is_empty!18135 (array_inv!19740 (_keys!9974 thiss!1181)) (array_inv!19741 (_values!5276 thiss!1181)) e!498052))))

(declare-fun b!892278 () Bool)

(assert (=> b!892278 (= e!498058 e!498059)))

(declare-fun res!604520 () Bool)

(assert (=> b!892278 (=> res!604520 e!498059)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!892278 (= res!604520 (not (validMask!0 (mask!25800 thiss!1181))))))

(assert (=> b!892278 (contains!4360 lt!403105 (select (arr!25131 (_keys!9974 thiss!1181)) (index!37744 lt!403107)))))

(declare-fun getCurrentListMap!2639 (array!52250 array!52252 (_ BitVec 32) (_ BitVec 32) V!29145 V!29145 (_ BitVec 32) Int) ListLongMap!10685)

(assert (=> b!892278 (= lt!403105 (getCurrentListMap!2639 (_keys!9974 thiss!1181) (_values!5276 thiss!1181) (mask!25800 thiss!1181) (extraKeys!4985 thiss!1181) (zeroValue!5089 thiss!1181) (minValue!5089 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5291 thiss!1181)))))

(declare-fun lt!403108 () Unit!30382)

(declare-fun lemmaValidKeyInArrayIsInListMap!228 (array!52250 array!52252 (_ BitVec 32) (_ BitVec 32) V!29145 V!29145 (_ BitVec 32) Int) Unit!30382)

(assert (=> b!892278 (= lt!403108 (lemmaValidKeyInArrayIsInListMap!228 (_keys!9974 thiss!1181) (_values!5276 thiss!1181) (mask!25800 thiss!1181) (extraKeys!4985 thiss!1181) (zeroValue!5089 thiss!1181) (minValue!5089 thiss!1181) (index!37744 lt!403107) (defaultEntry!5291 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52250 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!892278 (arrayContainsKey!0 (_keys!9974 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!403106 () Unit!30382)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52250 (_ BitVec 64) (_ BitVec 32)) Unit!30382)

(assert (=> b!892278 (= lt!403106 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9974 thiss!1181) key!785 (index!37744 lt!403107)))))

(assert (= (and start!75836 res!604523) b!892274))

(assert (= (and b!892274 res!604522) b!892269))

(assert (= (and b!892269 (not res!604518)) b!892267))

(assert (= (and b!892269 (not res!604516)) b!892278))

(assert (= (and b!892278 (not res!604520)) b!892270))

(assert (= (and b!892270 (not res!604519)) b!892275))

(assert (= (and b!892275 (not res!604521)) b!892276))

(assert (= (and b!892276 (not res!604517)) b!892271))

(assert (= (and b!892272 condMapEmpty!28757) mapIsEmpty!28757))

(assert (= (and b!892272 (not condMapEmpty!28757)) mapNonEmpty!28757))

(assert (= (and mapNonEmpty!28757 ((_ is ValueCellFull!8586) mapValue!28757)) b!892273))

(assert (= (and b!892272 ((_ is ValueCellFull!8586) mapDefault!28757)) b!892268))

(assert (= b!892277 b!892272))

(assert (= start!75836 b!892277))

(declare-fun m!830533 () Bool)

(assert (=> b!892275 m!830533))

(declare-fun m!830535 () Bool)

(assert (=> b!892278 m!830535))

(declare-fun m!830537 () Bool)

(assert (=> b!892278 m!830537))

(declare-fun m!830539 () Bool)

(assert (=> b!892278 m!830539))

(assert (=> b!892278 m!830535))

(declare-fun m!830541 () Bool)

(assert (=> b!892278 m!830541))

(declare-fun m!830543 () Bool)

(assert (=> b!892278 m!830543))

(declare-fun m!830545 () Bool)

(assert (=> b!892278 m!830545))

(declare-fun m!830547 () Bool)

(assert (=> b!892278 m!830547))

(declare-fun m!830549 () Bool)

(assert (=> mapNonEmpty!28757 m!830549))

(declare-fun m!830551 () Bool)

(assert (=> b!892267 m!830551))

(declare-fun m!830553 () Bool)

(assert (=> b!892277 m!830553))

(declare-fun m!830555 () Bool)

(assert (=> b!892277 m!830555))

(declare-fun m!830557 () Bool)

(assert (=> b!892271 m!830557))

(declare-fun m!830559 () Bool)

(assert (=> start!75836 m!830559))

(declare-fun m!830561 () Bool)

(assert (=> b!892269 m!830561))

(declare-fun m!830563 () Bool)

(assert (=> b!892269 m!830563))

(declare-fun m!830565 () Bool)

(assert (=> b!892276 m!830565))

(check-sat (not b!892277) (not b!892278) (not start!75836) (not b_next!15807) (not b!892269) (not b!892267) (not b!892276) (not b!892271) tp_is_empty!18135 b_and!26047 (not mapNonEmpty!28757) (not b!892275))
(check-sat b_and!26047 (not b_next!15807))
