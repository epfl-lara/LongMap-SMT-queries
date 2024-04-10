; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80022 () Bool)

(assert start!80022)

(declare-fun b!940839 () Bool)

(declare-fun b_free!17877 () Bool)

(declare-fun b_next!17877 () Bool)

(assert (=> b!940839 (= b_free!17877 (not b_next!17877))))

(declare-fun tp!62105 () Bool)

(declare-fun b_and!29289 () Bool)

(assert (=> b!940839 (= tp!62105 b_and!29289)))

(declare-fun b!940836 () Bool)

(declare-fun e!528813 () Bool)

(assert (=> b!940836 (= e!528813 true)))

(declare-fun lt!424830 () Bool)

(declare-datatypes ((V!32145 0))(
  ( (V!32146 (val!10243 Int)) )
))
(declare-datatypes ((ValueCell!9711 0))(
  ( (ValueCellFull!9711 (v!12774 V!32145)) (EmptyCell!9711) )
))
(declare-datatypes ((array!56718 0))(
  ( (array!56719 (arr!27294 (Array (_ BitVec 32) ValueCell!9711)) (size!27755 (_ BitVec 32))) )
))
(declare-datatypes ((array!56720 0))(
  ( (array!56721 (arr!27295 (Array (_ BitVec 32) (_ BitVec 64))) (size!27756 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4572 0))(
  ( (LongMapFixedSize!4573 (defaultEntry!5577 Int) (mask!27126 (_ BitVec 32)) (extraKeys!5309 (_ BitVec 32)) (zeroValue!5413 V!32145) (minValue!5413 V!32145) (_size!2341 (_ BitVec 32)) (_keys!10427 array!56720) (_values!5600 array!56718) (_vacant!2341 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4572)

(declare-datatypes ((List!19197 0))(
  ( (Nil!19194) (Cons!19193 (h!20339 (_ BitVec 64)) (t!27512 List!19197)) )
))
(declare-fun arrayNoDuplicates!0 (array!56720 (_ BitVec 32) List!19197) Bool)

(assert (=> b!940836 (= lt!424830 (arrayNoDuplicates!0 (_keys!10427 thiss!1141) #b00000000000000000000000000000000 Nil!19194))))

(declare-fun b!940837 () Bool)

(declare-fun e!528814 () Bool)

(declare-fun tp_is_empty!20385 () Bool)

(assert (=> b!940837 (= e!528814 tp_is_empty!20385)))

(declare-fun b!940838 () Bool)

(declare-fun e!528816 () Bool)

(declare-fun e!528818 () Bool)

(assert (=> b!940838 (= e!528816 e!528818)))

(declare-fun res!632590 () Bool)

(assert (=> b!940838 (=> (not res!632590) (not e!528818))))

(declare-datatypes ((SeekEntryResult!9009 0))(
  ( (MissingZero!9009 (index!38407 (_ BitVec 32))) (Found!9009 (index!38408 (_ BitVec 32))) (Intermediate!9009 (undefined!9821 Bool) (index!38409 (_ BitVec 32)) (x!80702 (_ BitVec 32))) (Undefined!9009) (MissingVacant!9009 (index!38410 (_ BitVec 32))) )
))
(declare-fun lt!424829 () SeekEntryResult!9009)

(get-info :version)

(assert (=> b!940838 (= res!632590 ((_ is Found!9009) lt!424829))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!56720 (_ BitVec 32)) SeekEntryResult!9009)

(assert (=> b!940838 (= lt!424829 (seekEntry!0 key!756 (_keys!10427 thiss!1141) (mask!27126 thiss!1141)))))

(declare-fun e!528815 () Bool)

(declare-fun e!528817 () Bool)

(declare-fun array_inv!21214 (array!56720) Bool)

(declare-fun array_inv!21215 (array!56718) Bool)

(assert (=> b!940839 (= e!528815 (and tp!62105 tp_is_empty!20385 (array_inv!21214 (_keys!10427 thiss!1141)) (array_inv!21215 (_values!5600 thiss!1141)) e!528817))))

(declare-fun b!940840 () Bool)

(declare-fun res!632589 () Bool)

(assert (=> b!940840 (=> res!632589 e!528813)))

(assert (=> b!940840 (= res!632589 (or (not (= (size!27755 (_values!5600 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27126 thiss!1141)))) (not (= (size!27756 (_keys!10427 thiss!1141)) (size!27755 (_values!5600 thiss!1141)))) (bvslt (mask!27126 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5309 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5309 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun res!632588 () Bool)

(assert (=> start!80022 (=> (not res!632588) (not e!528816))))

(declare-fun valid!1753 (LongMapFixedSize!4572) Bool)

(assert (=> start!80022 (= res!632588 (valid!1753 thiss!1141))))

(assert (=> start!80022 e!528816))

(assert (=> start!80022 e!528815))

(assert (=> start!80022 true))

(declare-fun mapNonEmpty!32368 () Bool)

(declare-fun mapRes!32368 () Bool)

(declare-fun tp!62106 () Bool)

(assert (=> mapNonEmpty!32368 (= mapRes!32368 (and tp!62106 e!528814))))

(declare-fun mapKey!32368 () (_ BitVec 32))

(declare-fun mapRest!32368 () (Array (_ BitVec 32) ValueCell!9711))

(declare-fun mapValue!32368 () ValueCell!9711)

(assert (=> mapNonEmpty!32368 (= (arr!27294 (_values!5600 thiss!1141)) (store mapRest!32368 mapKey!32368 mapValue!32368))))

(declare-fun mapIsEmpty!32368 () Bool)

(assert (=> mapIsEmpty!32368 mapRes!32368))

(declare-fun b!940841 () Bool)

(declare-fun e!528819 () Bool)

(assert (=> b!940841 (= e!528817 (and e!528819 mapRes!32368))))

(declare-fun condMapEmpty!32368 () Bool)

(declare-fun mapDefault!32368 () ValueCell!9711)

(assert (=> b!940841 (= condMapEmpty!32368 (= (arr!27294 (_values!5600 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9711)) mapDefault!32368)))))

(declare-fun b!940842 () Bool)

(assert (=> b!940842 (= e!528818 (not e!528813))))

(declare-fun res!632591 () Bool)

(assert (=> b!940842 (=> res!632591 e!528813)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!940842 (= res!632591 (not (validMask!0 (mask!27126 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!56720 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!940842 (arrayContainsKey!0 (_keys!10427 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31784 0))(
  ( (Unit!31785) )
))
(declare-fun lt!424831 () Unit!31784)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56720 (_ BitVec 64) (_ BitVec 32)) Unit!31784)

(assert (=> b!940842 (= lt!424831 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10427 thiss!1141) key!756 (index!38408 lt!424829)))))

(declare-fun b!940843 () Bool)

(declare-fun res!632592 () Bool)

(assert (=> b!940843 (=> (not res!632592) (not e!528816))))

(assert (=> b!940843 (= res!632592 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!940844 () Bool)

(assert (=> b!940844 (= e!528819 tp_is_empty!20385)))

(declare-fun b!940845 () Bool)

(declare-fun res!632593 () Bool)

(assert (=> b!940845 (=> res!632593 e!528813)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56720 (_ BitVec 32)) Bool)

(assert (=> b!940845 (= res!632593 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10427 thiss!1141) (mask!27126 thiss!1141))))))

(assert (= (and start!80022 res!632588) b!940843))

(assert (= (and b!940843 res!632592) b!940838))

(assert (= (and b!940838 res!632590) b!940842))

(assert (= (and b!940842 (not res!632591)) b!940840))

(assert (= (and b!940840 (not res!632589)) b!940845))

(assert (= (and b!940845 (not res!632593)) b!940836))

(assert (= (and b!940841 condMapEmpty!32368) mapIsEmpty!32368))

(assert (= (and b!940841 (not condMapEmpty!32368)) mapNonEmpty!32368))

(assert (= (and mapNonEmpty!32368 ((_ is ValueCellFull!9711) mapValue!32368)) b!940837))

(assert (= (and b!940841 ((_ is ValueCellFull!9711) mapDefault!32368)) b!940844))

(assert (= b!940839 b!940841))

(assert (= start!80022 b!940839))

(declare-fun m!876153 () Bool)

(assert (=> start!80022 m!876153))

(declare-fun m!876155 () Bool)

(assert (=> b!940836 m!876155))

(declare-fun m!876157 () Bool)

(assert (=> b!940839 m!876157))

(declare-fun m!876159 () Bool)

(assert (=> b!940839 m!876159))

(declare-fun m!876161 () Bool)

(assert (=> mapNonEmpty!32368 m!876161))

(declare-fun m!876163 () Bool)

(assert (=> b!940842 m!876163))

(declare-fun m!876165 () Bool)

(assert (=> b!940842 m!876165))

(declare-fun m!876167 () Bool)

(assert (=> b!940842 m!876167))

(declare-fun m!876169 () Bool)

(assert (=> b!940845 m!876169))

(declare-fun m!876171 () Bool)

(assert (=> b!940838 m!876171))

(check-sat (not b!940845) tp_is_empty!20385 (not b!940839) (not mapNonEmpty!32368) (not b!940836) (not b!940842) (not b!940838) b_and!29289 (not b_next!17877) (not start!80022))
(check-sat b_and!29289 (not b_next!17877))
