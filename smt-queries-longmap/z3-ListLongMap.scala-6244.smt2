; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79890 () Bool)

(assert start!79890)

(declare-fun b!939578 () Bool)

(declare-fun b_free!17787 () Bool)

(declare-fun b_next!17787 () Bool)

(assert (=> b!939578 (= b_free!17787 (not b_next!17787))))

(declare-fun tp!61824 () Bool)

(declare-fun b_and!29199 () Bool)

(assert (=> b!939578 (= tp!61824 b_and!29199)))

(declare-fun mapIsEmpty!32222 () Bool)

(declare-fun mapRes!32222 () Bool)

(assert (=> mapIsEmpty!32222 mapRes!32222))

(declare-fun tp_is_empty!20295 () Bool)

(declare-fun e!527781 () Bool)

(declare-fun e!527780 () Bool)

(declare-datatypes ((V!32025 0))(
  ( (V!32026 (val!10198 Int)) )
))
(declare-datatypes ((ValueCell!9666 0))(
  ( (ValueCellFull!9666 (v!12729 V!32025)) (EmptyCell!9666) )
))
(declare-datatypes ((array!56532 0))(
  ( (array!56533 (arr!27204 (Array (_ BitVec 32) ValueCell!9666)) (size!27663 (_ BitVec 32))) )
))
(declare-datatypes ((array!56534 0))(
  ( (array!56535 (arr!27205 (Array (_ BitVec 32) (_ BitVec 64))) (size!27664 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4482 0))(
  ( (LongMapFixedSize!4483 (defaultEntry!5532 Int) (mask!27046 (_ BitVec 32)) (extraKeys!5264 (_ BitVec 32)) (zeroValue!5368 V!32025) (minValue!5368 V!32025) (_size!2296 (_ BitVec 32)) (_keys!10380 array!56534) (_values!5555 array!56532) (_vacant!2296 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4482)

(declare-fun array_inv!21158 (array!56534) Bool)

(declare-fun array_inv!21159 (array!56532) Bool)

(assert (=> b!939578 (= e!527780 (and tp!61824 tp_is_empty!20295 (array_inv!21158 (_keys!10380 thiss!1141)) (array_inv!21159 (_values!5555 thiss!1141)) e!527781))))

(declare-fun b!939579 () Bool)

(declare-fun e!527782 () Bool)

(assert (=> b!939579 (= e!527782 tp_is_empty!20295)))

(declare-fun b!939580 () Bool)

(declare-fun e!527784 () Bool)

(assert (=> b!939580 (= e!527784 tp_is_empty!20295)))

(declare-fun b!939581 () Bool)

(assert (=> b!939581 (= e!527781 (and e!527784 mapRes!32222))))

(declare-fun condMapEmpty!32222 () Bool)

(declare-fun mapDefault!32222 () ValueCell!9666)

(assert (=> b!939581 (= condMapEmpty!32222 (= (arr!27204 (_values!5555 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9666)) mapDefault!32222)))))

(declare-fun lt!424561 () Bool)

(declare-fun valid!1722 (LongMapFixedSize!4482) Bool)

(assert (=> start!79890 (= lt!424561 (valid!1722 thiss!1141))))

(assert (=> start!79890 false))

(assert (=> start!79890 e!527780))

(declare-fun mapNonEmpty!32222 () Bool)

(declare-fun tp!61825 () Bool)

(assert (=> mapNonEmpty!32222 (= mapRes!32222 (and tp!61825 e!527782))))

(declare-fun mapRest!32222 () (Array (_ BitVec 32) ValueCell!9666))

(declare-fun mapKey!32222 () (_ BitVec 32))

(declare-fun mapValue!32222 () ValueCell!9666)

(assert (=> mapNonEmpty!32222 (= (arr!27204 (_values!5555 thiss!1141)) (store mapRest!32222 mapKey!32222 mapValue!32222))))

(assert (= (and b!939581 condMapEmpty!32222) mapIsEmpty!32222))

(assert (= (and b!939581 (not condMapEmpty!32222)) mapNonEmpty!32222))

(get-info :version)

(assert (= (and mapNonEmpty!32222 ((_ is ValueCellFull!9666) mapValue!32222)) b!939579))

(assert (= (and b!939581 ((_ is ValueCellFull!9666) mapDefault!32222)) b!939580))

(assert (= b!939578 b!939581))

(assert (= start!79890 b!939578))

(declare-fun m!875407 () Bool)

(assert (=> b!939578 m!875407))

(declare-fun m!875409 () Bool)

(assert (=> b!939578 m!875409))

(declare-fun m!875411 () Bool)

(assert (=> start!79890 m!875411))

(declare-fun m!875413 () Bool)

(assert (=> mapNonEmpty!32222 m!875413))

(check-sat tp_is_empty!20295 (not b_next!17787) b_and!29199 (not start!79890) (not b!939578) (not mapNonEmpty!32222))
(check-sat b_and!29199 (not b_next!17787))
