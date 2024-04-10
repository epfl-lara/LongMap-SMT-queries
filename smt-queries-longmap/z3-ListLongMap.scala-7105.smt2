; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90078 () Bool)

(assert start!90078)

(declare-fun b!1031847 () Bool)

(declare-fun b_free!20685 () Bool)

(declare-fun b_next!20685 () Bool)

(assert (=> b!1031847 (= b_free!20685 (not b_next!20685))))

(declare-fun tp!73126 () Bool)

(declare-fun b_and!33137 () Bool)

(assert (=> b!1031847 (= tp!73126 b_and!33137)))

(declare-fun mapIsEmpty!38061 () Bool)

(declare-fun mapRes!38061 () Bool)

(assert (=> mapIsEmpty!38061 mapRes!38061))

(declare-fun b!1031846 () Bool)

(declare-fun e!582866 () Bool)

(declare-datatypes ((V!37413 0))(
  ( (V!37414 (val!12253 Int)) )
))
(declare-datatypes ((ValueCell!11499 0))(
  ( (ValueCellFull!11499 (v!14830 V!37413)) (EmptyCell!11499) )
))
(declare-datatypes ((Unit!33771 0))(
  ( (Unit!33772) )
))
(declare-datatypes ((array!64874 0))(
  ( (array!64875 (arr!31239 (Array (_ BitVec 32) (_ BitVec 64))) (size!31756 (_ BitVec 32))) )
))
(declare-datatypes ((array!64876 0))(
  ( (array!64877 (arr!31240 (Array (_ BitVec 32) ValueCell!11499)) (size!31757 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5592 0))(
  ( (LongMapFixedSize!5593 (defaultEntry!6170 Int) (mask!29974 (_ BitVec 32)) (extraKeys!5902 (_ BitVec 32)) (zeroValue!6006 V!37413) (minValue!6006 V!37413) (_size!2851 (_ BitVec 32)) (_keys!11343 array!64874) (_values!6193 array!64876) (_vacant!2851 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15694 0))(
  ( (tuple2!15695 (_1!7858 Unit!33771) (_2!7858 LongMapFixedSize!5592)) )
))
(declare-fun lt!455736 () tuple2!15694)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!64874 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1031846 (= e!582866 (arrayContainsKey!0 (_keys!11343 (_2!7858 lt!455736)) key!909 #b00000000000000000000000000000000))))

(declare-fun tp_is_empty!24405 () Bool)

(declare-fun e!582865 () Bool)

(declare-fun thiss!1427 () LongMapFixedSize!5592)

(declare-fun e!582860 () Bool)

(declare-fun array_inv!24181 (array!64874) Bool)

(declare-fun array_inv!24182 (array!64876) Bool)

(assert (=> b!1031847 (= e!582865 (and tp!73126 tp_is_empty!24405 (array_inv!24181 (_keys!11343 thiss!1427)) (array_inv!24182 (_values!6193 thiss!1427)) e!582860))))

(declare-fun b!1031848 () Bool)

(declare-fun e!582862 () Bool)

(assert (=> b!1031848 (= e!582862 tp_is_empty!24405)))

(declare-fun b!1031849 () Bool)

(declare-fun e!582863 () Bool)

(declare-fun e!582858 () Bool)

(assert (=> b!1031849 (= e!582863 e!582858)))

(declare-fun res!689841 () Bool)

(assert (=> b!1031849 (=> (not res!689841) (not e!582858))))

(declare-datatypes ((SeekEntryResult!9716 0))(
  ( (MissingZero!9716 (index!41235 (_ BitVec 32))) (Found!9716 (index!41236 (_ BitVec 32))) (Intermediate!9716 (undefined!10528 Bool) (index!41237 (_ BitVec 32)) (x!91910 (_ BitVec 32))) (Undefined!9716) (MissingVacant!9716 (index!41238 (_ BitVec 32))) )
))
(declare-fun lt!455730 () SeekEntryResult!9716)

(get-info :version)

(assert (=> b!1031849 (= res!689841 ((_ is Found!9716) lt!455730))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64874 (_ BitVec 32)) SeekEntryResult!9716)

(assert (=> b!1031849 (= lt!455730 (seekEntry!0 key!909 (_keys!11343 thiss!1427) (mask!29974 thiss!1427)))))

(declare-fun b!1031850 () Bool)

(declare-fun e!582867 () Unit!33771)

(declare-fun Unit!33773 () Unit!33771)

(assert (=> b!1031850 (= e!582867 Unit!33773)))

(declare-fun lt!455734 () Unit!33771)

(declare-fun lemmaKeyInListMapIsInArray!347 (array!64874 array!64876 (_ BitVec 32) (_ BitVec 32) V!37413 V!37413 (_ BitVec 64) Int) Unit!33771)

(assert (=> b!1031850 (= lt!455734 (lemmaKeyInListMapIsInArray!347 (_keys!11343 (_2!7858 lt!455736)) (_values!6193 (_2!7858 lt!455736)) (mask!29974 (_2!7858 lt!455736)) (extraKeys!5902 (_2!7858 lt!455736)) (zeroValue!6006 (_2!7858 lt!455736)) (minValue!6006 (_2!7858 lt!455736)) key!909 (defaultEntry!6170 (_2!7858 lt!455736))))))

(declare-fun c!104258 () Bool)

(assert (=> b!1031850 (= c!104258 (and (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!909 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!689840 () Bool)

(assert (=> b!1031850 (= res!689840 e!582866)))

(declare-fun e!582859 () Bool)

(assert (=> b!1031850 (=> (not res!689840) (not e!582859))))

(assert (=> b!1031850 e!582859))

(declare-fun b!1031851 () Bool)

(declare-fun e!582864 () Bool)

(assert (=> b!1031851 (= e!582860 (and e!582864 mapRes!38061))))

(declare-fun condMapEmpty!38061 () Bool)

(declare-fun mapDefault!38061 () ValueCell!11499)

(assert (=> b!1031851 (= condMapEmpty!38061 (= (arr!31240 (_values!6193 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11499)) mapDefault!38061)))))

(declare-fun b!1031852 () Bool)

(assert (=> b!1031852 (= e!582858 (not true))))

(declare-fun lt!455739 () Bool)

(declare-fun valid!2116 (LongMapFixedSize!5592) Bool)

(assert (=> b!1031852 (= lt!455739 (valid!2116 (_2!7858 lt!455736)))))

(declare-fun lt!455731 () Unit!33771)

(assert (=> b!1031852 (= lt!455731 e!582867)))

(declare-fun c!104259 () Bool)

(declare-datatypes ((tuple2!15696 0))(
  ( (tuple2!15697 (_1!7859 (_ BitVec 64)) (_2!7859 V!37413)) )
))
(declare-datatypes ((List!21881 0))(
  ( (Nil!21878) (Cons!21877 (h!23079 tuple2!15696) (t!31061 List!21881)) )
))
(declare-datatypes ((ListLongMap!13739 0))(
  ( (ListLongMap!13740 (toList!6885 List!21881)) )
))
(declare-fun contains!5999 (ListLongMap!13739 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3933 (array!64874 array!64876 (_ BitVec 32) (_ BitVec 32) V!37413 V!37413 (_ BitVec 32) Int) ListLongMap!13739)

(assert (=> b!1031852 (= c!104259 (contains!5999 (getCurrentListMap!3933 (_keys!11343 (_2!7858 lt!455736)) (_values!6193 (_2!7858 lt!455736)) (mask!29974 (_2!7858 lt!455736)) (extraKeys!5902 (_2!7858 lt!455736)) (zeroValue!6006 (_2!7858 lt!455736)) (minValue!6006 (_2!7858 lt!455736)) #b00000000000000000000000000000000 (defaultEntry!6170 (_2!7858 lt!455736))) key!909))))

(declare-fun lt!455733 () array!64876)

(declare-fun lt!455741 () array!64874)

(declare-fun Unit!33774 () Unit!33771)

(declare-fun Unit!33775 () Unit!33771)

(assert (=> b!1031852 (= lt!455736 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2851 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15695 Unit!33774 (LongMapFixedSize!5593 (defaultEntry!6170 thiss!1427) (mask!29974 thiss!1427) (extraKeys!5902 thiss!1427) (zeroValue!6006 thiss!1427) (minValue!6006 thiss!1427) (bvsub (_size!2851 thiss!1427) #b00000000000000000000000000000001) lt!455741 lt!455733 (bvadd #b00000000000000000000000000000001 (_vacant!2851 thiss!1427)))) (tuple2!15695 Unit!33775 (LongMapFixedSize!5593 (defaultEntry!6170 thiss!1427) (mask!29974 thiss!1427) (extraKeys!5902 thiss!1427) (zeroValue!6006 thiss!1427) (minValue!6006 thiss!1427) (bvsub (_size!2851 thiss!1427) #b00000000000000000000000000000001) lt!455741 lt!455733 (_vacant!2851 thiss!1427)))))))

(declare-fun -!512 (ListLongMap!13739 (_ BitVec 64)) ListLongMap!13739)

(assert (=> b!1031852 (= (-!512 (getCurrentListMap!3933 (_keys!11343 thiss!1427) (_values!6193 thiss!1427) (mask!29974 thiss!1427) (extraKeys!5902 thiss!1427) (zeroValue!6006 thiss!1427) (minValue!6006 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6170 thiss!1427)) key!909) (getCurrentListMap!3933 lt!455741 lt!455733 (mask!29974 thiss!1427) (extraKeys!5902 thiss!1427) (zeroValue!6006 thiss!1427) (minValue!6006 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6170 thiss!1427)))))

(declare-fun dynLambda!1982 (Int (_ BitVec 64)) V!37413)

(assert (=> b!1031852 (= lt!455733 (array!64877 (store (arr!31240 (_values!6193 thiss!1427)) (index!41236 lt!455730) (ValueCellFull!11499 (dynLambda!1982 (defaultEntry!6170 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31757 (_values!6193 thiss!1427))))))

(declare-fun lt!455737 () Unit!33771)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!38 (array!64874 array!64876 (_ BitVec 32) (_ BitVec 32) V!37413 V!37413 (_ BitVec 32) (_ BitVec 64) Int) Unit!33771)

(assert (=> b!1031852 (= lt!455737 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!38 (_keys!11343 thiss!1427) (_values!6193 thiss!1427) (mask!29974 thiss!1427) (extraKeys!5902 thiss!1427) (zeroValue!6006 thiss!1427) (minValue!6006 thiss!1427) (index!41236 lt!455730) key!909 (defaultEntry!6170 thiss!1427)))))

(assert (=> b!1031852 (not (arrayContainsKey!0 lt!455741 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!455740 () Unit!33771)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64874 (_ BitVec 32) (_ BitVec 64)) Unit!33771)

(assert (=> b!1031852 (= lt!455740 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11343 thiss!1427) (index!41236 lt!455730) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64874 (_ BitVec 32)) Bool)

(assert (=> b!1031852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!455741 (mask!29974 thiss!1427))))

(declare-fun lt!455738 () Unit!33771)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64874 (_ BitVec 32) (_ BitVec 32)) Unit!33771)

(assert (=> b!1031852 (= lt!455738 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11343 thiss!1427) (index!41236 lt!455730) (mask!29974 thiss!1427)))))

(declare-datatypes ((List!21882 0))(
  ( (Nil!21879) (Cons!21878 (h!23080 (_ BitVec 64)) (t!31062 List!21882)) )
))
(declare-fun arrayNoDuplicates!0 (array!64874 (_ BitVec 32) List!21882) Bool)

(assert (=> b!1031852 (arrayNoDuplicates!0 lt!455741 #b00000000000000000000000000000000 Nil!21879)))

(declare-fun lt!455735 () Unit!33771)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64874 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21882) Unit!33771)

(assert (=> b!1031852 (= lt!455735 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11343 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41236 lt!455730) #b00000000000000000000000000000000 Nil!21879))))

(declare-fun arrayCountValidKeys!0 (array!64874 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1031852 (= (arrayCountValidKeys!0 lt!455741 #b00000000000000000000000000000000 (size!31756 (_keys!11343 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11343 thiss!1427) #b00000000000000000000000000000000 (size!31756 (_keys!11343 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1031852 (= lt!455741 (array!64875 (store (arr!31239 (_keys!11343 thiss!1427)) (index!41236 lt!455730) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31756 (_keys!11343 thiss!1427))))))

(declare-fun lt!455732 () Unit!33771)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64874 (_ BitVec 32) (_ BitVec 64)) Unit!33771)

(assert (=> b!1031852 (= lt!455732 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11343 thiss!1427) (index!41236 lt!455730) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1031853 () Bool)

(assert (=> b!1031853 (= e!582864 tp_is_empty!24405)))

(declare-fun b!1031854 () Bool)

(declare-fun Unit!33776 () Unit!33771)

(assert (=> b!1031854 (= e!582867 Unit!33776)))

(declare-fun b!1031855 () Bool)

(declare-fun res!689842 () Bool)

(assert (=> b!1031855 (=> (not res!689842) (not e!582863))))

(assert (=> b!1031855 (= res!689842 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1031856 () Bool)

(assert (=> b!1031856 (= e!582866 (ite (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5902 (_2!7858 lt!455736)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5902 (_2!7858 lt!455736)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1031857 () Bool)

(assert (=> b!1031857 (= e!582859 false)))

(declare-fun mapNonEmpty!38061 () Bool)

(declare-fun tp!73125 () Bool)

(assert (=> mapNonEmpty!38061 (= mapRes!38061 (and tp!73125 e!582862))))

(declare-fun mapValue!38061 () ValueCell!11499)

(declare-fun mapKey!38061 () (_ BitVec 32))

(declare-fun mapRest!38061 () (Array (_ BitVec 32) ValueCell!11499))

(assert (=> mapNonEmpty!38061 (= (arr!31240 (_values!6193 thiss!1427)) (store mapRest!38061 mapKey!38061 mapValue!38061))))

(declare-fun res!689843 () Bool)

(assert (=> start!90078 (=> (not res!689843) (not e!582863))))

(assert (=> start!90078 (= res!689843 (valid!2116 thiss!1427))))

(assert (=> start!90078 e!582863))

(assert (=> start!90078 e!582865))

(assert (=> start!90078 true))

(assert (= (and start!90078 res!689843) b!1031855))

(assert (= (and b!1031855 res!689842) b!1031849))

(assert (= (and b!1031849 res!689841) b!1031852))

(assert (= (and b!1031852 c!104259) b!1031850))

(assert (= (and b!1031852 (not c!104259)) b!1031854))

(assert (= (and b!1031850 c!104258) b!1031846))

(assert (= (and b!1031850 (not c!104258)) b!1031856))

(assert (= (and b!1031850 res!689840) b!1031857))

(assert (= (and b!1031851 condMapEmpty!38061) mapIsEmpty!38061))

(assert (= (and b!1031851 (not condMapEmpty!38061)) mapNonEmpty!38061))

(assert (= (and mapNonEmpty!38061 ((_ is ValueCellFull!11499) mapValue!38061)) b!1031848))

(assert (= (and b!1031851 ((_ is ValueCellFull!11499) mapDefault!38061)) b!1031853))

(assert (= b!1031847 b!1031851))

(assert (= start!90078 b!1031847))

(declare-fun b_lambda!16029 () Bool)

(assert (=> (not b_lambda!16029) (not b!1031852)))

(declare-fun t!31060 () Bool)

(declare-fun tb!7003 () Bool)

(assert (=> (and b!1031847 (= (defaultEntry!6170 thiss!1427) (defaultEntry!6170 thiss!1427)) t!31060) tb!7003))

(declare-fun result!14335 () Bool)

(assert (=> tb!7003 (= result!14335 tp_is_empty!24405)))

(assert (=> b!1031852 t!31060))

(declare-fun b_and!33139 () Bool)

(assert (= b_and!33137 (and (=> t!31060 result!14335) b_and!33139)))

(declare-fun m!952141 () Bool)

(assert (=> b!1031849 m!952141))

(declare-fun m!952143 () Bool)

(assert (=> b!1031846 m!952143))

(declare-fun m!952145 () Bool)

(assert (=> mapNonEmpty!38061 m!952145))

(declare-fun m!952147 () Bool)

(assert (=> b!1031852 m!952147))

(declare-fun m!952149 () Bool)

(assert (=> b!1031852 m!952149))

(declare-fun m!952151 () Bool)

(assert (=> b!1031852 m!952151))

(declare-fun m!952153 () Bool)

(assert (=> b!1031852 m!952153))

(declare-fun m!952155 () Bool)

(assert (=> b!1031852 m!952155))

(declare-fun m!952157 () Bool)

(assert (=> b!1031852 m!952157))

(declare-fun m!952159 () Bool)

(assert (=> b!1031852 m!952159))

(declare-fun m!952161 () Bool)

(assert (=> b!1031852 m!952161))

(declare-fun m!952163 () Bool)

(assert (=> b!1031852 m!952163))

(declare-fun m!952165 () Bool)

(assert (=> b!1031852 m!952165))

(declare-fun m!952167 () Bool)

(assert (=> b!1031852 m!952167))

(declare-fun m!952169 () Bool)

(assert (=> b!1031852 m!952169))

(declare-fun m!952171 () Bool)

(assert (=> b!1031852 m!952171))

(declare-fun m!952173 () Bool)

(assert (=> b!1031852 m!952173))

(declare-fun m!952175 () Bool)

(assert (=> b!1031852 m!952175))

(declare-fun m!952177 () Bool)

(assert (=> b!1031852 m!952177))

(assert (=> b!1031852 m!952175))

(assert (=> b!1031852 m!952163))

(declare-fun m!952179 () Bool)

(assert (=> b!1031852 m!952179))

(declare-fun m!952181 () Bool)

(assert (=> b!1031852 m!952181))

(declare-fun m!952183 () Bool)

(assert (=> b!1031852 m!952183))

(declare-fun m!952185 () Bool)

(assert (=> b!1031850 m!952185))

(declare-fun m!952187 () Bool)

(assert (=> b!1031847 m!952187))

(declare-fun m!952189 () Bool)

(assert (=> b!1031847 m!952189))

(declare-fun m!952191 () Bool)

(assert (=> start!90078 m!952191))

(check-sat (not b!1031849) (not b!1031846) (not b!1031847) (not b_lambda!16029) (not start!90078) (not b!1031850) b_and!33139 (not mapNonEmpty!38061) (not b!1031852) tp_is_empty!24405 (not b_next!20685))
(check-sat b_and!33139 (not b_next!20685))
