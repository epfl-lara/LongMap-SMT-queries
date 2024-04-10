; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79940 () Bool)

(assert start!79940)

(declare-fun b!939896 () Bool)

(declare-fun b_free!17805 () Bool)

(declare-fun b_next!17805 () Bool)

(assert (=> b!939896 (= b_free!17805 (not b_next!17805))))

(declare-fun tp!61886 () Bool)

(declare-fun b_and!29217 () Bool)

(assert (=> b!939896 (= tp!61886 b_and!29217)))

(declare-fun b!939891 () Bool)

(declare-fun res!632085 () Bool)

(declare-fun e!528025 () Bool)

(assert (=> b!939891 (=> (not res!632085) (not e!528025))))

(declare-datatypes ((V!32049 0))(
  ( (V!32050 (val!10207 Int)) )
))
(declare-datatypes ((ValueCell!9675 0))(
  ( (ValueCellFull!9675 (v!12738 V!32049)) (EmptyCell!9675) )
))
(declare-datatypes ((array!56572 0))(
  ( (array!56573 (arr!27222 (Array (_ BitVec 32) ValueCell!9675)) (size!27683 (_ BitVec 32))) )
))
(declare-datatypes ((array!56574 0))(
  ( (array!56575 (arr!27223 (Array (_ BitVec 32) (_ BitVec 64))) (size!27684 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4500 0))(
  ( (LongMapFixedSize!4501 (defaultEntry!5541 Int) (mask!27065 (_ BitVec 32)) (extraKeys!5273 (_ BitVec 32)) (zeroValue!5377 V!32049) (minValue!5377 V!32049) (_size!2305 (_ BitVec 32)) (_keys!10391 array!56574) (_values!5564 array!56572) (_vacant!2305 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4500)

(assert (=> b!939891 (= res!632085 (= (size!27684 (_keys!10391 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27065 thiss!1141))))))

(declare-fun b!939892 () Bool)

(declare-fun key!756 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!939892 (= e!528025 (not (validKeyInArray!0 key!756)))))

(declare-fun b!939893 () Bool)

(declare-fun res!632083 () Bool)

(assert (=> b!939893 (=> (not res!632083) (not e!528025))))

(assert (=> b!939893 (= res!632083 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!939894 () Bool)

(declare-fun e!528022 () Bool)

(declare-fun e!528020 () Bool)

(declare-fun mapRes!32257 () Bool)

(assert (=> b!939894 (= e!528022 (and e!528020 mapRes!32257))))

(declare-fun condMapEmpty!32257 () Bool)

(declare-fun mapDefault!32257 () ValueCell!9675)

(assert (=> b!939894 (= condMapEmpty!32257 (= (arr!27222 (_values!5564 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9675)) mapDefault!32257)))))

(declare-fun b!939895 () Bool)

(declare-fun res!632086 () Bool)

(assert (=> b!939895 (=> (not res!632086) (not e!528025))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!939895 (= res!632086 (validMask!0 (mask!27065 thiss!1141)))))

(declare-fun tp_is_empty!20313 () Bool)

(declare-fun e!528024 () Bool)

(declare-fun array_inv!21170 (array!56574) Bool)

(declare-fun array_inv!21171 (array!56572) Bool)

(assert (=> b!939896 (= e!528024 (and tp!61886 tp_is_empty!20313 (array_inv!21170 (_keys!10391 thiss!1141)) (array_inv!21171 (_values!5564 thiss!1141)) e!528022))))

(declare-fun b!939897 () Bool)

(declare-fun e!528023 () Bool)

(assert (=> b!939897 (= e!528023 tp_is_empty!20313)))

(declare-fun res!632084 () Bool)

(assert (=> start!79940 (=> (not res!632084) (not e!528025))))

(declare-fun valid!1728 (LongMapFixedSize!4500) Bool)

(assert (=> start!79940 (= res!632084 (valid!1728 thiss!1141))))

(assert (=> start!79940 e!528025))

(assert (=> start!79940 e!528024))

(assert (=> start!79940 true))

(declare-fun mapNonEmpty!32257 () Bool)

(declare-fun tp!61887 () Bool)

(assert (=> mapNonEmpty!32257 (= mapRes!32257 (and tp!61887 e!528023))))

(declare-fun mapRest!32257 () (Array (_ BitVec 32) ValueCell!9675))

(declare-fun mapValue!32257 () ValueCell!9675)

(declare-fun mapKey!32257 () (_ BitVec 32))

(assert (=> mapNonEmpty!32257 (= (arr!27222 (_values!5564 thiss!1141)) (store mapRest!32257 mapKey!32257 mapValue!32257))))

(declare-fun mapIsEmpty!32257 () Bool)

(assert (=> mapIsEmpty!32257 mapRes!32257))

(declare-fun b!939898 () Bool)

(assert (=> b!939898 (= e!528020 tp_is_empty!20313)))

(assert (= (and start!79940 res!632084) b!939893))

(assert (= (and b!939893 res!632083) b!939895))

(assert (= (and b!939895 res!632086) b!939891))

(assert (= (and b!939891 res!632085) b!939892))

(assert (= (and b!939894 condMapEmpty!32257) mapIsEmpty!32257))

(assert (= (and b!939894 (not condMapEmpty!32257)) mapNonEmpty!32257))

(get-info :version)

(assert (= (and mapNonEmpty!32257 ((_ is ValueCellFull!9675) mapValue!32257)) b!939897))

(assert (= (and b!939894 ((_ is ValueCellFull!9675) mapDefault!32257)) b!939898))

(assert (= b!939896 b!939894))

(assert (= start!79940 b!939896))

(declare-fun m!875559 () Bool)

(assert (=> b!939895 m!875559))

(declare-fun m!875561 () Bool)

(assert (=> b!939896 m!875561))

(declare-fun m!875563 () Bool)

(assert (=> b!939896 m!875563))

(declare-fun m!875565 () Bool)

(assert (=> b!939892 m!875565))

(declare-fun m!875567 () Bool)

(assert (=> mapNonEmpty!32257 m!875567))

(declare-fun m!875569 () Bool)

(assert (=> start!79940 m!875569))

(check-sat (not b!939892) (not b!939896) (not start!79940) tp_is_empty!20313 (not b!939895) (not mapNonEmpty!32257) b_and!29217 (not b_next!17805))
(check-sat b_and!29217 (not b_next!17805))
(get-model)

(declare-fun d!113989 () Bool)

(assert (=> d!113989 (= (validMask!0 (mask!27065 thiss!1141)) (and (or (= (mask!27065 thiss!1141) #b00000000000000000000000000000111) (= (mask!27065 thiss!1141) #b00000000000000000000000000001111) (= (mask!27065 thiss!1141) #b00000000000000000000000000011111) (= (mask!27065 thiss!1141) #b00000000000000000000000000111111) (= (mask!27065 thiss!1141) #b00000000000000000000000001111111) (= (mask!27065 thiss!1141) #b00000000000000000000000011111111) (= (mask!27065 thiss!1141) #b00000000000000000000000111111111) (= (mask!27065 thiss!1141) #b00000000000000000000001111111111) (= (mask!27065 thiss!1141) #b00000000000000000000011111111111) (= (mask!27065 thiss!1141) #b00000000000000000000111111111111) (= (mask!27065 thiss!1141) #b00000000000000000001111111111111) (= (mask!27065 thiss!1141) #b00000000000000000011111111111111) (= (mask!27065 thiss!1141) #b00000000000000000111111111111111) (= (mask!27065 thiss!1141) #b00000000000000001111111111111111) (= (mask!27065 thiss!1141) #b00000000000000011111111111111111) (= (mask!27065 thiss!1141) #b00000000000000111111111111111111) (= (mask!27065 thiss!1141) #b00000000000001111111111111111111) (= (mask!27065 thiss!1141) #b00000000000011111111111111111111) (= (mask!27065 thiss!1141) #b00000000000111111111111111111111) (= (mask!27065 thiss!1141) #b00000000001111111111111111111111) (= (mask!27065 thiss!1141) #b00000000011111111111111111111111) (= (mask!27065 thiss!1141) #b00000000111111111111111111111111) (= (mask!27065 thiss!1141) #b00000001111111111111111111111111) (= (mask!27065 thiss!1141) #b00000011111111111111111111111111) (= (mask!27065 thiss!1141) #b00000111111111111111111111111111) (= (mask!27065 thiss!1141) #b00001111111111111111111111111111) (= (mask!27065 thiss!1141) #b00011111111111111111111111111111) (= (mask!27065 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27065 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!939895 d!113989))

(declare-fun d!113991 () Bool)

(assert (=> d!113991 (= (array_inv!21170 (_keys!10391 thiss!1141)) (bvsge (size!27684 (_keys!10391 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!939896 d!113991))

(declare-fun d!113993 () Bool)

(assert (=> d!113993 (= (array_inv!21171 (_values!5564 thiss!1141)) (bvsge (size!27683 (_values!5564 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!939896 d!113993))

(declare-fun d!113995 () Bool)

(assert (=> d!113995 (= (validKeyInArray!0 key!756) (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!939892 d!113995))

(declare-fun d!113997 () Bool)

(declare-fun res!632105 () Bool)

(declare-fun e!528046 () Bool)

(assert (=> d!113997 (=> (not res!632105) (not e!528046))))

(declare-fun simpleValid!338 (LongMapFixedSize!4500) Bool)

(assert (=> d!113997 (= res!632105 (simpleValid!338 thiss!1141))))

(assert (=> d!113997 (= (valid!1728 thiss!1141) e!528046)))

(declare-fun b!939929 () Bool)

(declare-fun res!632106 () Bool)

(assert (=> b!939929 (=> (not res!632106) (not e!528046))))

(declare-fun arrayCountValidKeys!0 (array!56574 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!939929 (= res!632106 (= (arrayCountValidKeys!0 (_keys!10391 thiss!1141) #b00000000000000000000000000000000 (size!27684 (_keys!10391 thiss!1141))) (_size!2305 thiss!1141)))))

(declare-fun b!939930 () Bool)

(declare-fun res!632107 () Bool)

(assert (=> b!939930 (=> (not res!632107) (not e!528046))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56574 (_ BitVec 32)) Bool)

(assert (=> b!939930 (= res!632107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10391 thiss!1141) (mask!27065 thiss!1141)))))

(declare-fun b!939931 () Bool)

(declare-datatypes ((List!19181 0))(
  ( (Nil!19178) (Cons!19177 (h!20323 (_ BitVec 64)) (t!27496 List!19181)) )
))
(declare-fun arrayNoDuplicates!0 (array!56574 (_ BitVec 32) List!19181) Bool)

(assert (=> b!939931 (= e!528046 (arrayNoDuplicates!0 (_keys!10391 thiss!1141) #b00000000000000000000000000000000 Nil!19178))))

(assert (= (and d!113997 res!632105) b!939929))

(assert (= (and b!939929 res!632106) b!939930))

(assert (= (and b!939930 res!632107) b!939931))

(declare-fun m!875583 () Bool)

(assert (=> d!113997 m!875583))

(declare-fun m!875585 () Bool)

(assert (=> b!939929 m!875585))

(declare-fun m!875587 () Bool)

(assert (=> b!939930 m!875587))

(declare-fun m!875589 () Bool)

(assert (=> b!939931 m!875589))

(assert (=> start!79940 d!113997))

(declare-fun b!939939 () Bool)

(declare-fun e!528051 () Bool)

(assert (=> b!939939 (= e!528051 tp_is_empty!20313)))

(declare-fun condMapEmpty!32263 () Bool)

(declare-fun mapDefault!32263 () ValueCell!9675)

(assert (=> mapNonEmpty!32257 (= condMapEmpty!32263 (= mapRest!32257 ((as const (Array (_ BitVec 32) ValueCell!9675)) mapDefault!32263)))))

(declare-fun mapRes!32263 () Bool)

(assert (=> mapNonEmpty!32257 (= tp!61887 (and e!528051 mapRes!32263))))

(declare-fun mapIsEmpty!32263 () Bool)

(assert (=> mapIsEmpty!32263 mapRes!32263))

(declare-fun mapNonEmpty!32263 () Bool)

(declare-fun tp!61896 () Bool)

(declare-fun e!528052 () Bool)

(assert (=> mapNonEmpty!32263 (= mapRes!32263 (and tp!61896 e!528052))))

(declare-fun mapRest!32263 () (Array (_ BitVec 32) ValueCell!9675))

(declare-fun mapValue!32263 () ValueCell!9675)

(declare-fun mapKey!32263 () (_ BitVec 32))

(assert (=> mapNonEmpty!32263 (= mapRest!32257 (store mapRest!32263 mapKey!32263 mapValue!32263))))

(declare-fun b!939938 () Bool)

(assert (=> b!939938 (= e!528052 tp_is_empty!20313)))

(assert (= (and mapNonEmpty!32257 condMapEmpty!32263) mapIsEmpty!32263))

(assert (= (and mapNonEmpty!32257 (not condMapEmpty!32263)) mapNonEmpty!32263))

(assert (= (and mapNonEmpty!32263 ((_ is ValueCellFull!9675) mapValue!32263)) b!939938))

(assert (= (and mapNonEmpty!32257 ((_ is ValueCellFull!9675) mapDefault!32263)) b!939939))

(declare-fun m!875591 () Bool)

(assert (=> mapNonEmpty!32263 m!875591))

(check-sat (not b!939929) (not mapNonEmpty!32263) (not d!113997) tp_is_empty!20313 (not b!939931) (not b!939930) b_and!29217 (not b_next!17805))
(check-sat b_and!29217 (not b_next!17805))
