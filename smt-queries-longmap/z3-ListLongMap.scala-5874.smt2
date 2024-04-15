; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75756 () Bool)

(assert start!75756)

(declare-fun b!890922 () Bool)

(declare-fun b_free!15745 () Bool)

(declare-fun b_next!15745 () Bool)

(assert (=> b!890922 (= b_free!15745 (not b_next!15745))))

(declare-fun tp!55204 () Bool)

(declare-fun b_and!25959 () Bool)

(assert (=> b!890922 (= tp!55204 b_and!25959)))

(declare-fun mapNonEmpty!28664 () Bool)

(declare-fun mapRes!28664 () Bool)

(declare-fun tp!55205 () Bool)

(declare-fun e!497072 () Bool)

(assert (=> mapNonEmpty!28664 (= mapRes!28664 (and tp!55205 e!497072))))

(declare-fun mapKey!28664 () (_ BitVec 32))

(declare-datatypes ((array!52109 0))(
  ( (array!52110 (arr!25061 (Array (_ BitVec 32) (_ BitVec 64))) (size!25507 (_ BitVec 32))) )
))
(declare-datatypes ((V!29063 0))(
  ( (V!29064 (val!9087 Int)) )
))
(declare-datatypes ((ValueCell!8555 0))(
  ( (ValueCellFull!8555 (v!11559 V!29063)) (EmptyCell!8555) )
))
(declare-datatypes ((array!52111 0))(
  ( (array!52112 (arr!25062 (Array (_ BitVec 32) ValueCell!8555)) (size!25508 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4126 0))(
  ( (LongMapFixedSize!4127 (defaultEntry!5260 Int) (mask!25742 (_ BitVec 32)) (extraKeys!4954 (_ BitVec 32)) (zeroValue!5058 V!29063) (minValue!5058 V!29063) (_size!2118 (_ BitVec 32)) (_keys!9938 array!52109) (_values!5245 array!52111) (_vacant!2118 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4126)

(declare-fun mapValue!28664 () ValueCell!8555)

(declare-fun mapRest!28664 () (Array (_ BitVec 32) ValueCell!8555))

(assert (=> mapNonEmpty!28664 (= (arr!25062 (_values!5245 thiss!1181)) (store mapRest!28664 mapKey!28664 mapValue!28664))))

(declare-fun b!890919 () Bool)

(declare-fun e!497073 () Bool)

(declare-fun e!497069 () Bool)

(assert (=> b!890919 (= e!497073 (and e!497069 mapRes!28664))))

(declare-fun condMapEmpty!28664 () Bool)

(declare-fun mapDefault!28664 () ValueCell!8555)

(assert (=> b!890919 (= condMapEmpty!28664 (= (arr!25062 (_values!5245 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8555)) mapDefault!28664)))))

(declare-fun b!890920 () Bool)

(declare-fun e!497071 () Bool)

(declare-fun e!497067 () Bool)

(assert (=> b!890920 (= e!497071 e!497067)))

(declare-fun res!603670 () Bool)

(assert (=> b!890920 (=> res!603670 e!497067)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!890920 (= res!603670 (not (validMask!0 (mask!25742 thiss!1181))))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52109 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!890920 (arrayContainsKey!0 (_keys!9938 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-datatypes ((SeekEntryResult!8820 0))(
  ( (MissingZero!8820 (index!37651 (_ BitVec 32))) (Found!8820 (index!37652 (_ BitVec 32))) (Intermediate!8820 (undefined!9632 Bool) (index!37653 (_ BitVec 32)) (x!75719 (_ BitVec 32))) (Undefined!8820) (MissingVacant!8820 (index!37654 (_ BitVec 32))) )
))
(declare-fun lt!402325 () SeekEntryResult!8820)

(declare-datatypes ((Unit!30276 0))(
  ( (Unit!30277) )
))
(declare-fun lt!402324 () Unit!30276)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52109 (_ BitVec 64) (_ BitVec 32)) Unit!30276)

(assert (=> b!890920 (= lt!402324 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9938 thiss!1181) key!785 (index!37652 lt!402325)))))

(declare-fun b!890921 () Bool)

(declare-fun tp_is_empty!18073 () Bool)

(assert (=> b!890921 (= e!497069 tp_is_empty!18073)))

(declare-fun e!497070 () Bool)

(declare-fun array_inv!19746 (array!52109) Bool)

(declare-fun array_inv!19747 (array!52111) Bool)

(assert (=> b!890922 (= e!497070 (and tp!55204 tp_is_empty!18073 (array_inv!19746 (_keys!9938 thiss!1181)) (array_inv!19747 (_values!5245 thiss!1181)) e!497073))))

(declare-fun res!603674 () Bool)

(declare-fun e!497068 () Bool)

(assert (=> start!75756 (=> (not res!603674) (not e!497068))))

(declare-fun valid!1607 (LongMapFixedSize!4126) Bool)

(assert (=> start!75756 (= res!603674 (valid!1607 thiss!1181))))

(assert (=> start!75756 e!497068))

(assert (=> start!75756 e!497070))

(assert (=> start!75756 true))

(declare-fun b!890923 () Bool)

(assert (=> b!890923 (= e!497072 tp_is_empty!18073)))

(declare-fun b!890924 () Bool)

(assert (=> b!890924 (= e!497067 true)))

(declare-fun lt!402326 () Bool)

(declare-datatypes ((List!17743 0))(
  ( (Nil!17740) (Cons!17739 (h!18870 (_ BitVec 64)) (t!25033 List!17743)) )
))
(declare-fun arrayNoDuplicates!0 (array!52109 (_ BitVec 32) List!17743) Bool)

(assert (=> b!890924 (= lt!402326 (arrayNoDuplicates!0 (_keys!9938 thiss!1181) #b00000000000000000000000000000000 Nil!17740))))

(declare-fun b!890925 () Bool)

(assert (=> b!890925 (= e!497068 (not e!497071))))

(declare-fun res!603675 () Bool)

(assert (=> b!890925 (=> res!603675 e!497071)))

(get-info :version)

(assert (=> b!890925 (= res!603675 (not ((_ is Found!8820) lt!402325)))))

(declare-fun e!497075 () Bool)

(assert (=> b!890925 e!497075))

(declare-fun res!603669 () Bool)

(assert (=> b!890925 (=> res!603669 e!497075)))

(assert (=> b!890925 (= res!603669 (not ((_ is Found!8820) lt!402325)))))

(declare-fun lt!402323 () Unit!30276)

(declare-fun lemmaSeekEntryGivesInRangeIndex!28 (array!52109 array!52111 (_ BitVec 32) (_ BitVec 32) V!29063 V!29063 (_ BitVec 64)) Unit!30276)

(assert (=> b!890925 (= lt!402323 (lemmaSeekEntryGivesInRangeIndex!28 (_keys!9938 thiss!1181) (_values!5245 thiss!1181) (mask!25742 thiss!1181) (extraKeys!4954 thiss!1181) (zeroValue!5058 thiss!1181) (minValue!5058 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52109 (_ BitVec 32)) SeekEntryResult!8820)

(assert (=> b!890925 (= lt!402325 (seekEntry!0 key!785 (_keys!9938 thiss!1181) (mask!25742 thiss!1181)))))

(declare-fun b!890926 () Bool)

(declare-fun res!603671 () Bool)

(assert (=> b!890926 (=> res!603671 e!497067)))

(assert (=> b!890926 (= res!603671 (or (not (= (size!25508 (_values!5245 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25742 thiss!1181)))) (not (= (size!25507 (_keys!9938 thiss!1181)) (size!25508 (_values!5245 thiss!1181)))) (bvslt (mask!25742 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4954 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4954 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!28664 () Bool)

(assert (=> mapIsEmpty!28664 mapRes!28664))

(declare-fun b!890927 () Bool)

(declare-fun res!603673 () Bool)

(assert (=> b!890927 (=> (not res!603673) (not e!497068))))

(assert (=> b!890927 (= res!603673 (not (= key!785 (bvneg key!785))))))

(declare-fun b!890928 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!890928 (= e!497075 (inRange!0 (index!37652 lt!402325) (mask!25742 thiss!1181)))))

(declare-fun b!890929 () Bool)

(declare-fun res!603672 () Bool)

(assert (=> b!890929 (=> res!603672 e!497067)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52109 (_ BitVec 32)) Bool)

(assert (=> b!890929 (= res!603672 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9938 thiss!1181) (mask!25742 thiss!1181))))))

(assert (= (and start!75756 res!603674) b!890927))

(assert (= (and b!890927 res!603673) b!890925))

(assert (= (and b!890925 (not res!603669)) b!890928))

(assert (= (and b!890925 (not res!603675)) b!890920))

(assert (= (and b!890920 (not res!603670)) b!890926))

(assert (= (and b!890926 (not res!603671)) b!890929))

(assert (= (and b!890929 (not res!603672)) b!890924))

(assert (= (and b!890919 condMapEmpty!28664) mapIsEmpty!28664))

(assert (= (and b!890919 (not condMapEmpty!28664)) mapNonEmpty!28664))

(assert (= (and mapNonEmpty!28664 ((_ is ValueCellFull!8555) mapValue!28664)) b!890923))

(assert (= (and b!890919 ((_ is ValueCellFull!8555) mapDefault!28664)) b!890921))

(assert (= b!890922 b!890919))

(assert (= start!75756 b!890922))

(declare-fun m!828751 () Bool)

(assert (=> b!890925 m!828751))

(declare-fun m!828753 () Bool)

(assert (=> b!890925 m!828753))

(declare-fun m!828755 () Bool)

(assert (=> b!890928 m!828755))

(declare-fun m!828757 () Bool)

(assert (=> start!75756 m!828757))

(declare-fun m!828759 () Bool)

(assert (=> b!890920 m!828759))

(declare-fun m!828761 () Bool)

(assert (=> b!890920 m!828761))

(declare-fun m!828763 () Bool)

(assert (=> b!890920 m!828763))

(declare-fun m!828765 () Bool)

(assert (=> b!890929 m!828765))

(declare-fun m!828767 () Bool)

(assert (=> b!890922 m!828767))

(declare-fun m!828769 () Bool)

(assert (=> b!890922 m!828769))

(declare-fun m!828771 () Bool)

(assert (=> mapNonEmpty!28664 m!828771))

(declare-fun m!828773 () Bool)

(assert (=> b!890924 m!828773))

(check-sat (not b_next!15745) (not b!890925) (not b!890929) tp_is_empty!18073 (not b!890920) (not b!890928) (not b!890924) (not b!890922) (not mapNonEmpty!28664) b_and!25959 (not start!75756))
(check-sat b_and!25959 (not b_next!15745))
