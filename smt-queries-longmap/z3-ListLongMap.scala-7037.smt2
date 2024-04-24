; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89468 () Bool)

(assert start!89468)

(declare-fun b!1024488 () Bool)

(declare-fun b_free!20275 () Bool)

(declare-fun b_next!20275 () Bool)

(assert (=> b!1024488 (= b_free!20275 (not b_next!20275))))

(declare-fun tp!71860 () Bool)

(declare-fun b_and!32507 () Bool)

(assert (=> b!1024488 (= tp!71860 b_and!32507)))

(declare-fun b!1024482 () Bool)

(declare-fun res!685790 () Bool)

(declare-fun e!577356 () Bool)

(assert (=> b!1024482 (=> (not res!685790) (not e!577356))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1024482 (= res!685790 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1024483 () Bool)

(declare-fun res!685789 () Bool)

(assert (=> b!1024483 (=> (not res!685789) (not e!577356))))

(declare-datatypes ((V!36867 0))(
  ( (V!36868 (val!12048 Int)) )
))
(declare-datatypes ((ValueCell!11294 0))(
  ( (ValueCellFull!11294 (v!14613 V!36867)) (EmptyCell!11294) )
))
(declare-datatypes ((array!64083 0))(
  ( (array!64084 (arr!30847 (Array (_ BitVec 32) (_ BitVec 64))) (size!31359 (_ BitVec 32))) )
))
(declare-datatypes ((array!64085 0))(
  ( (array!64086 (arr!30848 (Array (_ BitVec 32) ValueCell!11294)) (size!31360 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5182 0))(
  ( (LongMapFixedSize!5183 (defaultEntry!5943 Int) (mask!29618 (_ BitVec 32)) (extraKeys!5675 (_ BitVec 32)) (zeroValue!5779 V!36867) (minValue!5779 V!36867) (_size!2646 (_ BitVec 32)) (_keys!11126 array!64083) (_values!5966 array!64085) (_vacant!2646 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5182)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1024483 (= res!685789 (validMask!0 (mask!29618 thiss!1427)))))

(declare-fun b!1024484 () Bool)

(declare-fun e!577352 () Bool)

(declare-fun tp_is_empty!23995 () Bool)

(assert (=> b!1024484 (= e!577352 tp_is_empty!23995)))

(declare-fun b!1024485 () Bool)

(declare-fun e!577351 () Bool)

(declare-fun mapRes!37410 () Bool)

(assert (=> b!1024485 (= e!577351 (and e!577352 mapRes!37410))))

(declare-fun condMapEmpty!37410 () Bool)

(declare-fun mapDefault!37410 () ValueCell!11294)

(assert (=> b!1024485 (= condMapEmpty!37410 (= (arr!30848 (_values!5966 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11294)) mapDefault!37410)))))

(declare-fun b!1024486 () Bool)

(assert (=> b!1024486 (= e!577356 false)))

(declare-fun lt!450893 () Bool)

(declare-datatypes ((List!21689 0))(
  ( (Nil!21686) (Cons!21685 (h!22892 (_ BitVec 64)) (t!30719 List!21689)) )
))
(declare-fun arrayNoDuplicates!0 (array!64083 (_ BitVec 32) List!21689) Bool)

(assert (=> b!1024486 (= lt!450893 (arrayNoDuplicates!0 (_keys!11126 thiss!1427) #b00000000000000000000000000000000 Nil!21686))))

(declare-fun b!1024487 () Bool)

(declare-fun res!685791 () Bool)

(assert (=> b!1024487 (=> (not res!685791) (not e!577356))))

(assert (=> b!1024487 (= res!685791 (and (= (size!31360 (_values!5966 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29618 thiss!1427))) (= (size!31359 (_keys!11126 thiss!1427)) (size!31360 (_values!5966 thiss!1427))) (bvsge (mask!29618 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5675 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5675 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5675 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5675 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5675 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5675 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5675 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!577353 () Bool)

(declare-fun array_inv!23919 (array!64083) Bool)

(declare-fun array_inv!23920 (array!64085) Bool)

(assert (=> b!1024488 (= e!577353 (and tp!71860 tp_is_empty!23995 (array_inv!23919 (_keys!11126 thiss!1427)) (array_inv!23920 (_values!5966 thiss!1427)) e!577351))))

(declare-fun b!1024489 () Bool)

(declare-fun e!577354 () Bool)

(assert (=> b!1024489 (= e!577354 tp_is_empty!23995)))

(declare-fun b!1024490 () Bool)

(declare-fun res!685792 () Bool)

(assert (=> b!1024490 (=> (not res!685792) (not e!577356))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64083 (_ BitVec 32)) Bool)

(assert (=> b!1024490 (= res!685792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11126 thiss!1427) (mask!29618 thiss!1427)))))

(declare-fun mapNonEmpty!37410 () Bool)

(declare-fun tp!71859 () Bool)

(assert (=> mapNonEmpty!37410 (= mapRes!37410 (and tp!71859 e!577354))))

(declare-fun mapValue!37410 () ValueCell!11294)

(declare-fun mapRest!37410 () (Array (_ BitVec 32) ValueCell!11294))

(declare-fun mapKey!37410 () (_ BitVec 32))

(assert (=> mapNonEmpty!37410 (= (arr!30848 (_values!5966 thiss!1427)) (store mapRest!37410 mapKey!37410 mapValue!37410))))

(declare-fun res!685793 () Bool)

(assert (=> start!89468 (=> (not res!685793) (not e!577356))))

(declare-fun valid!1980 (LongMapFixedSize!5182) Bool)

(assert (=> start!89468 (= res!685793 (valid!1980 thiss!1427))))

(assert (=> start!89468 e!577356))

(assert (=> start!89468 e!577353))

(assert (=> start!89468 true))

(declare-fun mapIsEmpty!37410 () Bool)

(assert (=> mapIsEmpty!37410 mapRes!37410))

(assert (= (and start!89468 res!685793) b!1024482))

(assert (= (and b!1024482 res!685790) b!1024483))

(assert (= (and b!1024483 res!685789) b!1024487))

(assert (= (and b!1024487 res!685791) b!1024490))

(assert (= (and b!1024490 res!685792) b!1024486))

(assert (= (and b!1024485 condMapEmpty!37410) mapIsEmpty!37410))

(assert (= (and b!1024485 (not condMapEmpty!37410)) mapNonEmpty!37410))

(get-info :version)

(assert (= (and mapNonEmpty!37410 ((_ is ValueCellFull!11294) mapValue!37410)) b!1024489))

(assert (= (and b!1024485 ((_ is ValueCellFull!11294) mapDefault!37410)) b!1024484))

(assert (= b!1024488 b!1024485))

(assert (= start!89468 b!1024488))

(declare-fun m!943645 () Bool)

(assert (=> b!1024488 m!943645))

(declare-fun m!943647 () Bool)

(assert (=> b!1024488 m!943647))

(declare-fun m!943649 () Bool)

(assert (=> mapNonEmpty!37410 m!943649))

(declare-fun m!943651 () Bool)

(assert (=> start!89468 m!943651))

(declare-fun m!943653 () Bool)

(assert (=> b!1024486 m!943653))

(declare-fun m!943655 () Bool)

(assert (=> b!1024490 m!943655))

(declare-fun m!943657 () Bool)

(assert (=> b!1024483 m!943657))

(check-sat tp_is_empty!23995 (not b_next!20275) (not mapNonEmpty!37410) (not b!1024488) (not start!89468) (not b!1024483) (not b!1024490) (not b!1024486) b_and!32507)
(check-sat b_and!32507 (not b_next!20275))
