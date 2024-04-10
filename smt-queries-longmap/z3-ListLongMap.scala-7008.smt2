; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89034 () Bool)

(assert start!89034)

(declare-fun b!1020926 () Bool)

(declare-fun b_free!20103 () Bool)

(declare-fun b_next!20103 () Bool)

(assert (=> b!1020926 (= b_free!20103 (not b_next!20103))))

(declare-fun tp!71335 () Bool)

(declare-fun b_and!32291 () Bool)

(assert (=> b!1020926 (= tp!71335 b_and!32291)))

(declare-fun b!1020923 () Bool)

(declare-fun e!574780 () Bool)

(declare-fun e!574781 () Bool)

(assert (=> b!1020923 (= e!574780 e!574781)))

(declare-fun mapNonEmpty!37143 () Bool)

(declare-fun mapRes!37143 () Bool)

(declare-fun tp!71334 () Bool)

(declare-fun e!574775 () Bool)

(assert (=> mapNonEmpty!37143 (= mapRes!37143 (and tp!71334 e!574775))))

(declare-datatypes ((V!36637 0))(
  ( (V!36638 (val!11962 Int)) )
))
(declare-datatypes ((ValueCell!11208 0))(
  ( (ValueCellFull!11208 (v!14511 V!36637)) (EmptyCell!11208) )
))
(declare-fun mapRest!37143 () (Array (_ BitVec 32) ValueCell!11208))

(declare-datatypes ((array!63684 0))(
  ( (array!63685 (arr!30657 (Array (_ BitVec 32) (_ BitVec 64))) (size!31168 (_ BitVec 32))) )
))
(declare-datatypes ((array!63686 0))(
  ( (array!63687 (arr!30658 (Array (_ BitVec 32) ValueCell!11208)) (size!31169 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5010 0))(
  ( (LongMapFixedSize!5011 (defaultEntry!5857 Int) (mask!29414 (_ BitVec 32)) (extraKeys!5589 (_ BitVec 32)) (zeroValue!5693 V!36637) (minValue!5693 V!36637) (_size!2560 (_ BitVec 32)) (_keys!11002 array!63684) (_values!5880 array!63686) (_vacant!2560 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1084 0))(
  ( (Cell!1085 (v!14512 LongMapFixedSize!5010)) )
))
(declare-datatypes ((LongMap!1084 0))(
  ( (LongMap!1085 (underlying!553 Cell!1084)) )
))
(declare-fun thiss!908 () LongMap!1084)

(declare-fun mapKey!37143 () (_ BitVec 32))

(declare-fun mapValue!37143 () ValueCell!11208)

(assert (=> mapNonEmpty!37143 (= (arr!30658 (_values!5880 (v!14512 (underlying!553 thiss!908)))) (store mapRest!37143 mapKey!37143 mapValue!37143))))

(declare-fun res!684299 () Bool)

(declare-fun e!574776 () Bool)

(assert (=> start!89034 (=> (not res!684299) (not e!574776))))

(declare-fun valid!1907 (LongMap!1084) Bool)

(assert (=> start!89034 (= res!684299 (valid!1907 thiss!908))))

(assert (=> start!89034 e!574776))

(assert (=> start!89034 e!574780))

(declare-fun b!1020924 () Bool)

(declare-fun e!574779 () Bool)

(declare-fun tp_is_empty!23823 () Bool)

(assert (=> b!1020924 (= e!574779 tp_is_empty!23823)))

(declare-fun mapIsEmpty!37143 () Bool)

(assert (=> mapIsEmpty!37143 mapRes!37143))

(declare-fun b!1020925 () Bool)

(declare-fun e!574778 () Bool)

(assert (=> b!1020925 (= e!574781 e!574778)))

(declare-fun e!574777 () Bool)

(declare-fun array_inv!23781 (array!63684) Bool)

(declare-fun array_inv!23782 (array!63686) Bool)

(assert (=> b!1020926 (= e!574778 (and tp!71335 tp_is_empty!23823 (array_inv!23781 (_keys!11002 (v!14512 (underlying!553 thiss!908)))) (array_inv!23782 (_values!5880 (v!14512 (underlying!553 thiss!908)))) e!574777))))

(declare-fun b!1020927 () Bool)

(declare-fun valid!1908 (LongMapFixedSize!5010) Bool)

(assert (=> b!1020927 (= e!574776 (not (valid!1908 (v!14512 (underlying!553 thiss!908)))))))

(declare-fun b!1020928 () Bool)

(assert (=> b!1020928 (= e!574775 tp_is_empty!23823)))

(declare-fun b!1020929 () Bool)

(assert (=> b!1020929 (= e!574777 (and e!574779 mapRes!37143))))

(declare-fun condMapEmpty!37143 () Bool)

(declare-fun mapDefault!37143 () ValueCell!11208)

(assert (=> b!1020929 (= condMapEmpty!37143 (= (arr!30658 (_values!5880 (v!14512 (underlying!553 thiss!908)))) ((as const (Array (_ BitVec 32) ValueCell!11208)) mapDefault!37143)))))

(assert (= (and start!89034 res!684299) b!1020927))

(assert (= (and b!1020929 condMapEmpty!37143) mapIsEmpty!37143))

(assert (= (and b!1020929 (not condMapEmpty!37143)) mapNonEmpty!37143))

(get-info :version)

(assert (= (and mapNonEmpty!37143 ((_ is ValueCellFull!11208) mapValue!37143)) b!1020928))

(assert (= (and b!1020929 ((_ is ValueCellFull!11208) mapDefault!37143)) b!1020924))

(assert (= b!1020926 b!1020929))

(assert (= b!1020925 b!1020926))

(assert (= b!1020923 b!1020925))

(assert (= start!89034 b!1020923))

(declare-fun m!940643 () Bool)

(assert (=> mapNonEmpty!37143 m!940643))

(declare-fun m!940645 () Bool)

(assert (=> start!89034 m!940645))

(declare-fun m!940647 () Bool)

(assert (=> b!1020926 m!940647))

(declare-fun m!940649 () Bool)

(assert (=> b!1020926 m!940649))

(declare-fun m!940651 () Bool)

(assert (=> b!1020927 m!940651))

(check-sat (not b_next!20103) (not mapNonEmpty!37143) tp_is_empty!23823 (not b!1020927) (not start!89034) b_and!32291 (not b!1020926))
(check-sat b_and!32291 (not b_next!20103))
(get-model)

(declare-fun d!122477 () Bool)

(declare-fun res!684309 () Bool)

(declare-fun e!574809 () Bool)

(assert (=> d!122477 (=> (not res!684309) (not e!574809))))

(declare-fun simpleValid!385 (LongMapFixedSize!5010) Bool)

(assert (=> d!122477 (= res!684309 (simpleValid!385 (v!14512 (underlying!553 thiss!908))))))

(assert (=> d!122477 (= (valid!1908 (v!14512 (underlying!553 thiss!908))) e!574809)))

(declare-fun b!1020957 () Bool)

(declare-fun res!684310 () Bool)

(assert (=> b!1020957 (=> (not res!684310) (not e!574809))))

(declare-fun arrayCountValidKeys!0 (array!63684 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1020957 (= res!684310 (= (arrayCountValidKeys!0 (_keys!11002 (v!14512 (underlying!553 thiss!908))) #b00000000000000000000000000000000 (size!31168 (_keys!11002 (v!14512 (underlying!553 thiss!908))))) (_size!2560 (v!14512 (underlying!553 thiss!908)))))))

(declare-fun b!1020958 () Bool)

(declare-fun res!684311 () Bool)

(assert (=> b!1020958 (=> (not res!684311) (not e!574809))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63684 (_ BitVec 32)) Bool)

(assert (=> b!1020958 (= res!684311 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11002 (v!14512 (underlying!553 thiss!908))) (mask!29414 (v!14512 (underlying!553 thiss!908)))))))

(declare-fun b!1020959 () Bool)

(declare-datatypes ((List!21649 0))(
  ( (Nil!21646) (Cons!21645 (h!22843 (_ BitVec 64)) (t!30659 List!21649)) )
))
(declare-fun arrayNoDuplicates!0 (array!63684 (_ BitVec 32) List!21649) Bool)

(assert (=> b!1020959 (= e!574809 (arrayNoDuplicates!0 (_keys!11002 (v!14512 (underlying!553 thiss!908))) #b00000000000000000000000000000000 Nil!21646))))

(assert (= (and d!122477 res!684309) b!1020957))

(assert (= (and b!1020957 res!684310) b!1020958))

(assert (= (and b!1020958 res!684311) b!1020959))

(declare-fun m!940663 () Bool)

(assert (=> d!122477 m!940663))

(declare-fun m!940665 () Bool)

(assert (=> b!1020957 m!940665))

(declare-fun m!940667 () Bool)

(assert (=> b!1020958 m!940667))

(declare-fun m!940669 () Bool)

(assert (=> b!1020959 m!940669))

(assert (=> b!1020927 d!122477))

(declare-fun d!122479 () Bool)

(assert (=> d!122479 (= (valid!1907 thiss!908) (valid!1908 (v!14512 (underlying!553 thiss!908))))))

(declare-fun bs!29749 () Bool)

(assert (= bs!29749 d!122479))

(assert (=> bs!29749 m!940651))

(assert (=> start!89034 d!122479))

(declare-fun d!122481 () Bool)

(assert (=> d!122481 (= (array_inv!23781 (_keys!11002 (v!14512 (underlying!553 thiss!908)))) (bvsge (size!31168 (_keys!11002 (v!14512 (underlying!553 thiss!908)))) #b00000000000000000000000000000000))))

(assert (=> b!1020926 d!122481))

(declare-fun d!122483 () Bool)

(assert (=> d!122483 (= (array_inv!23782 (_values!5880 (v!14512 (underlying!553 thiss!908)))) (bvsge (size!31169 (_values!5880 (v!14512 (underlying!553 thiss!908)))) #b00000000000000000000000000000000))))

(assert (=> b!1020926 d!122483))

(declare-fun condMapEmpty!37149 () Bool)

(declare-fun mapDefault!37149 () ValueCell!11208)

(assert (=> mapNonEmpty!37143 (= condMapEmpty!37149 (= mapRest!37143 ((as const (Array (_ BitVec 32) ValueCell!11208)) mapDefault!37149)))))

(declare-fun e!574815 () Bool)

(declare-fun mapRes!37149 () Bool)

(assert (=> mapNonEmpty!37143 (= tp!71334 (and e!574815 mapRes!37149))))

(declare-fun b!1020967 () Bool)

(assert (=> b!1020967 (= e!574815 tp_is_empty!23823)))

(declare-fun mapIsEmpty!37149 () Bool)

(assert (=> mapIsEmpty!37149 mapRes!37149))

(declare-fun b!1020966 () Bool)

(declare-fun e!574814 () Bool)

(assert (=> b!1020966 (= e!574814 tp_is_empty!23823)))

(declare-fun mapNonEmpty!37149 () Bool)

(declare-fun tp!71344 () Bool)

(assert (=> mapNonEmpty!37149 (= mapRes!37149 (and tp!71344 e!574814))))

(declare-fun mapRest!37149 () (Array (_ BitVec 32) ValueCell!11208))

(declare-fun mapValue!37149 () ValueCell!11208)

(declare-fun mapKey!37149 () (_ BitVec 32))

(assert (=> mapNonEmpty!37149 (= mapRest!37143 (store mapRest!37149 mapKey!37149 mapValue!37149))))

(assert (= (and mapNonEmpty!37143 condMapEmpty!37149) mapIsEmpty!37149))

(assert (= (and mapNonEmpty!37143 (not condMapEmpty!37149)) mapNonEmpty!37149))

(assert (= (and mapNonEmpty!37149 ((_ is ValueCellFull!11208) mapValue!37149)) b!1020966))

(assert (= (and mapNonEmpty!37143 ((_ is ValueCellFull!11208) mapDefault!37149)) b!1020967))

(declare-fun m!940671 () Bool)

(assert (=> mapNonEmpty!37149 m!940671))

(check-sat (not mapNonEmpty!37149) (not b!1020959) (not b_next!20103) (not b!1020957) (not b!1020958) tp_is_empty!23823 (not d!122479) b_and!32291 (not d!122477))
(check-sat b_and!32291 (not b_next!20103))
