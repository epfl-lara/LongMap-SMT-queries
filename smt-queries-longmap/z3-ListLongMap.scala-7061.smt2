; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89418 () Bool)

(assert start!89418)

(declare-fun b!1025141 () Bool)

(declare-fun b_free!20419 () Bool)

(declare-fun b_next!20419 () Bool)

(assert (=> b!1025141 (= b_free!20419 (not b_next!20419))))

(declare-fun tp!72303 () Bool)

(declare-fun b_and!32639 () Bool)

(assert (=> b!1025141 (= tp!72303 b_and!32639)))

(declare-fun b!1025136 () Bool)

(declare-fun e!577994 () Bool)

(declare-fun tp_is_empty!24139 () Bool)

(assert (=> b!1025136 (= e!577994 tp_is_empty!24139)))

(declare-fun b!1025137 () Bool)

(declare-fun res!686371 () Bool)

(declare-fun e!577990 () Bool)

(assert (=> b!1025137 (=> res!686371 e!577990)))

(declare-datatypes ((V!37059 0))(
  ( (V!37060 (val!12120 Int)) )
))
(declare-datatypes ((ValueCell!11366 0))(
  ( (ValueCellFull!11366 (v!14688 V!37059)) (EmptyCell!11366) )
))
(declare-datatypes ((array!64267 0))(
  ( (array!64268 (arr!30942 (Array (_ BitVec 32) (_ BitVec 64))) (size!31457 (_ BitVec 32))) )
))
(declare-datatypes ((array!64269 0))(
  ( (array!64270 (arr!30943 (Array (_ BitVec 32) ValueCell!11366)) (size!31458 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5326 0))(
  ( (LongMapFixedSize!5327 (defaultEntry!6015 Int) (mask!29678 (_ BitVec 32)) (extraKeys!5747 (_ BitVec 32)) (zeroValue!5851 V!37059) (minValue!5851 V!37059) (_size!2718 (_ BitVec 32)) (_keys!11158 array!64267) (_values!6038 array!64269) (_vacant!2718 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5326)

(declare-datatypes ((List!21784 0))(
  ( (Nil!21781) (Cons!21780 (h!22978 (_ BitVec 64)) (t!30837 List!21784)) )
))
(declare-fun arrayNoDuplicates!0 (array!64267 (_ BitVec 32) List!21784) Bool)

(assert (=> b!1025137 (= res!686371 (not (arrayNoDuplicates!0 (_keys!11158 thiss!1427) #b00000000000000000000000000000000 Nil!21781)))))

(declare-fun b!1025138 () Bool)

(declare-fun e!577992 () Bool)

(assert (=> b!1025138 (= e!577992 (not e!577990))))

(declare-fun res!686368 () Bool)

(assert (=> b!1025138 (=> res!686368 e!577990)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1025138 (= res!686368 (not (validMask!0 (mask!29678 thiss!1427))))))

(declare-fun lt!450673 () array!64267)

(assert (=> b!1025138 (arrayNoDuplicates!0 lt!450673 #b00000000000000000000000000000000 Nil!21781)))

(declare-datatypes ((Unit!33287 0))(
  ( (Unit!33288) )
))
(declare-fun lt!450671 () Unit!33287)

(declare-datatypes ((SeekEntryResult!9609 0))(
  ( (MissingZero!9609 (index!40807 (_ BitVec 32))) (Found!9609 (index!40808 (_ BitVec 32))) (Intermediate!9609 (undefined!10421 Bool) (index!40809 (_ BitVec 32)) (x!91164 (_ BitVec 32))) (Undefined!9609) (MissingVacant!9609 (index!40810 (_ BitVec 32))) )
))
(declare-fun lt!450670 () SeekEntryResult!9609)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64267 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21784) Unit!33287)

(assert (=> b!1025138 (= lt!450671 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11158 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40808 lt!450670) #b00000000000000000000000000000000 Nil!21781))))

(declare-fun arrayCountValidKeys!0 (array!64267 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1025138 (= (arrayCountValidKeys!0 lt!450673 #b00000000000000000000000000000000 (size!31457 (_keys!11158 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11158 thiss!1427) #b00000000000000000000000000000000 (size!31457 (_keys!11158 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1025138 (= lt!450673 (array!64268 (store (arr!30942 (_keys!11158 thiss!1427)) (index!40808 lt!450670) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31457 (_keys!11158 thiss!1427))))))

(declare-fun lt!450672 () Unit!33287)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64267 (_ BitVec 32) (_ BitVec 64)) Unit!33287)

(assert (=> b!1025138 (= lt!450672 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11158 thiss!1427) (index!40808 lt!450670) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1025139 () Bool)

(declare-fun e!577988 () Bool)

(assert (=> b!1025139 (= e!577988 tp_is_empty!24139)))

(declare-fun mapNonEmpty!37637 () Bool)

(declare-fun mapRes!37637 () Bool)

(declare-fun tp!72302 () Bool)

(assert (=> mapNonEmpty!37637 (= mapRes!37637 (and tp!72302 e!577988))))

(declare-fun mapValue!37637 () ValueCell!11366)

(declare-fun mapRest!37637 () (Array (_ BitVec 32) ValueCell!11366))

(declare-fun mapKey!37637 () (_ BitVec 32))

(assert (=> mapNonEmpty!37637 (= (arr!30943 (_values!6038 thiss!1427)) (store mapRest!37637 mapKey!37637 mapValue!37637))))

(declare-fun b!1025140 () Bool)

(assert (=> b!1025140 (= e!577990 true)))

(declare-fun lt!450669 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64267 (_ BitVec 32)) Bool)

(assert (=> b!1025140 (= lt!450669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11158 thiss!1427) (mask!29678 thiss!1427)))))

(declare-fun b!1025142 () Bool)

(declare-fun res!686374 () Bool)

(assert (=> b!1025142 (=> res!686374 e!577990)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1025142 (= res!686374 (not (validKeyInArray!0 (select (arr!30942 (_keys!11158 thiss!1427)) (index!40808 lt!450670)))))))

(declare-fun mapIsEmpty!37637 () Bool)

(assert (=> mapIsEmpty!37637 mapRes!37637))

(declare-fun b!1025143 () Bool)

(declare-fun e!577991 () Bool)

(assert (=> b!1025143 (= e!577991 (and e!577994 mapRes!37637))))

(declare-fun condMapEmpty!37637 () Bool)

(declare-fun mapDefault!37637 () ValueCell!11366)

(assert (=> b!1025143 (= condMapEmpty!37637 (= (arr!30943 (_values!6038 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11366)) mapDefault!37637)))))

(declare-fun b!1025144 () Bool)

(declare-fun res!686372 () Bool)

(assert (=> b!1025144 (=> res!686372 e!577990)))

(assert (=> b!1025144 (= res!686372 (or (not (= (size!31457 (_keys!11158 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29678 thiss!1427)))) (bvslt (index!40808 lt!450670) #b00000000000000000000000000000000) (bvsge (index!40808 lt!450670) (size!31457 (_keys!11158 thiss!1427)))))))

(declare-fun b!1025145 () Bool)

(declare-fun e!577989 () Bool)

(assert (=> b!1025145 (= e!577989 e!577992)))

(declare-fun res!686370 () Bool)

(assert (=> b!1025145 (=> (not res!686370) (not e!577992))))

(get-info :version)

(assert (=> b!1025145 (= res!686370 ((_ is Found!9609) lt!450670))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64267 (_ BitVec 32)) SeekEntryResult!9609)

(assert (=> b!1025145 (= lt!450670 (seekEntry!0 key!909 (_keys!11158 thiss!1427) (mask!29678 thiss!1427)))))

(declare-fun b!1025146 () Bool)

(declare-fun res!686369 () Bool)

(assert (=> b!1025146 (=> (not res!686369) (not e!577989))))

(assert (=> b!1025146 (= res!686369 (not (= key!909 (bvneg key!909))))))

(declare-fun e!577993 () Bool)

(declare-fun array_inv!23979 (array!64267) Bool)

(declare-fun array_inv!23980 (array!64269) Bool)

(assert (=> b!1025141 (= e!577993 (and tp!72303 tp_is_empty!24139 (array_inv!23979 (_keys!11158 thiss!1427)) (array_inv!23980 (_values!6038 thiss!1427)) e!577991))))

(declare-fun res!686373 () Bool)

(assert (=> start!89418 (=> (not res!686373) (not e!577989))))

(declare-fun valid!2020 (LongMapFixedSize!5326) Bool)

(assert (=> start!89418 (= res!686373 (valid!2020 thiss!1427))))

(assert (=> start!89418 e!577989))

(assert (=> start!89418 e!577993))

(assert (=> start!89418 true))

(assert (= (and start!89418 res!686373) b!1025146))

(assert (= (and b!1025146 res!686369) b!1025145))

(assert (= (and b!1025145 res!686370) b!1025138))

(assert (= (and b!1025138 (not res!686368)) b!1025144))

(assert (= (and b!1025144 (not res!686372)) b!1025142))

(assert (= (and b!1025142 (not res!686374)) b!1025137))

(assert (= (and b!1025137 (not res!686371)) b!1025140))

(assert (= (and b!1025143 condMapEmpty!37637) mapIsEmpty!37637))

(assert (= (and b!1025143 (not condMapEmpty!37637)) mapNonEmpty!37637))

(assert (= (and mapNonEmpty!37637 ((_ is ValueCellFull!11366) mapValue!37637)) b!1025139))

(assert (= (and b!1025143 ((_ is ValueCellFull!11366) mapDefault!37637)) b!1025136))

(assert (= b!1025141 b!1025143))

(assert (= start!89418 b!1025141))

(declare-fun m!942851 () Bool)

(assert (=> b!1025138 m!942851))

(declare-fun m!942853 () Bool)

(assert (=> b!1025138 m!942853))

(declare-fun m!942855 () Bool)

(assert (=> b!1025138 m!942855))

(declare-fun m!942857 () Bool)

(assert (=> b!1025138 m!942857))

(declare-fun m!942859 () Bool)

(assert (=> b!1025138 m!942859))

(declare-fun m!942861 () Bool)

(assert (=> b!1025138 m!942861))

(declare-fun m!942863 () Bool)

(assert (=> b!1025138 m!942863))

(declare-fun m!942865 () Bool)

(assert (=> b!1025142 m!942865))

(assert (=> b!1025142 m!942865))

(declare-fun m!942867 () Bool)

(assert (=> b!1025142 m!942867))

(declare-fun m!942869 () Bool)

(assert (=> mapNonEmpty!37637 m!942869))

(declare-fun m!942871 () Bool)

(assert (=> start!89418 m!942871))

(declare-fun m!942873 () Bool)

(assert (=> b!1025140 m!942873))

(declare-fun m!942875 () Bool)

(assert (=> b!1025141 m!942875))

(declare-fun m!942877 () Bool)

(assert (=> b!1025141 m!942877))

(declare-fun m!942879 () Bool)

(assert (=> b!1025137 m!942879))

(declare-fun m!942881 () Bool)

(assert (=> b!1025145 m!942881))

(check-sat (not mapNonEmpty!37637) (not b!1025137) (not b!1025138) tp_is_empty!24139 b_and!32639 (not b!1025141) (not start!89418) (not b!1025142) (not b!1025140) (not b!1025145) (not b_next!20419))
(check-sat b_and!32639 (not b_next!20419))
