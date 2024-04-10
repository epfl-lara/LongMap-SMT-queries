; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80008 () Bool)

(assert start!80008)

(declare-fun b!940626 () Bool)

(declare-fun b_free!17863 () Bool)

(declare-fun b_next!17863 () Bool)

(assert (=> b!940626 (= b_free!17863 (not b_next!17863))))

(declare-fun tp!62064 () Bool)

(declare-fun b_and!29275 () Bool)

(assert (=> b!940626 (= tp!62064 b_and!29275)))

(declare-fun tp_is_empty!20371 () Bool)

(declare-datatypes ((V!32127 0))(
  ( (V!32128 (val!10236 Int)) )
))
(declare-datatypes ((ValueCell!9704 0))(
  ( (ValueCellFull!9704 (v!12767 V!32127)) (EmptyCell!9704) )
))
(declare-datatypes ((array!56690 0))(
  ( (array!56691 (arr!27280 (Array (_ BitVec 32) ValueCell!9704)) (size!27741 (_ BitVec 32))) )
))
(declare-datatypes ((array!56692 0))(
  ( (array!56693 (arr!27281 (Array (_ BitVec 32) (_ BitVec 64))) (size!27742 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4558 0))(
  ( (LongMapFixedSize!4559 (defaultEntry!5570 Int) (mask!27115 (_ BitVec 32)) (extraKeys!5302 (_ BitVec 32)) (zeroValue!5406 V!32127) (minValue!5406 V!32127) (_size!2334 (_ BitVec 32)) (_keys!10420 array!56692) (_values!5593 array!56690) (_vacant!2334 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4558)

(declare-fun e!528650 () Bool)

(declare-fun e!528647 () Bool)

(declare-fun array_inv!21204 (array!56692) Bool)

(declare-fun array_inv!21205 (array!56690) Bool)

(assert (=> b!940626 (= e!528647 (and tp!62064 tp_is_empty!20371 (array_inv!21204 (_keys!10420 thiss!1141)) (array_inv!21205 (_values!5593 thiss!1141)) e!528650))))

(declare-fun b!940627 () Bool)

(declare-fun e!528651 () Bool)

(assert (=> b!940627 (= e!528651 tp_is_empty!20371)))

(declare-fun b!940628 () Bool)

(declare-fun e!528649 () Bool)

(assert (=> b!940628 (= e!528649 true)))

(declare-fun lt!424766 () Bool)

(declare-datatypes ((List!19192 0))(
  ( (Nil!19189) (Cons!19188 (h!20334 (_ BitVec 64)) (t!27507 List!19192)) )
))
(declare-fun arrayNoDuplicates!0 (array!56692 (_ BitVec 32) List!19192) Bool)

(assert (=> b!940628 (= lt!424766 (arrayNoDuplicates!0 (_keys!10420 thiss!1141) #b00000000000000000000000000000000 Nil!19189))))

(declare-fun b!940629 () Bool)

(declare-fun res!632465 () Bool)

(assert (=> b!940629 (=> res!632465 e!528649)))

(assert (=> b!940629 (= res!632465 (or (not (= (size!27741 (_values!5593 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27115 thiss!1141)))) (not (= (size!27742 (_keys!10420 thiss!1141)) (size!27741 (_values!5593 thiss!1141)))) (bvslt (mask!27115 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5302 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5302 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!32347 () Bool)

(declare-fun mapRes!32347 () Bool)

(assert (=> mapIsEmpty!32347 mapRes!32347))

(declare-fun b!940630 () Bool)

(declare-fun e!528652 () Bool)

(declare-fun e!528646 () Bool)

(assert (=> b!940630 (= e!528652 e!528646)))

(declare-fun res!632467 () Bool)

(assert (=> b!940630 (=> (not res!632467) (not e!528646))))

(declare-datatypes ((SeekEntryResult!9003 0))(
  ( (MissingZero!9003 (index!38383 (_ BitVec 32))) (Found!9003 (index!38384 (_ BitVec 32))) (Intermediate!9003 (undefined!9815 Bool) (index!38385 (_ BitVec 32)) (x!80680 (_ BitVec 32))) (Undefined!9003) (MissingVacant!9003 (index!38386 (_ BitVec 32))) )
))
(declare-fun lt!424767 () SeekEntryResult!9003)

(assert (=> b!940630 (= res!632467 (is-Found!9003 lt!424767))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!56692 (_ BitVec 32)) SeekEntryResult!9003)

(assert (=> b!940630 (= lt!424767 (seekEntry!0 key!756 (_keys!10420 thiss!1141) (mask!27115 thiss!1141)))))

(declare-fun res!632466 () Bool)

(assert (=> start!80008 (=> (not res!632466) (not e!528652))))

(declare-fun valid!1748 (LongMapFixedSize!4558) Bool)

(assert (=> start!80008 (= res!632466 (valid!1748 thiss!1141))))

(assert (=> start!80008 e!528652))

(assert (=> start!80008 e!528647))

(assert (=> start!80008 true))

(declare-fun b!940631 () Bool)

(declare-fun res!632463 () Bool)

(assert (=> b!940631 (=> (not res!632463) (not e!528652))))

(assert (=> b!940631 (= res!632463 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!32347 () Bool)

(declare-fun tp!62063 () Bool)

(assert (=> mapNonEmpty!32347 (= mapRes!32347 (and tp!62063 e!528651))))

(declare-fun mapValue!32347 () ValueCell!9704)

(declare-fun mapRest!32347 () (Array (_ BitVec 32) ValueCell!9704))

(declare-fun mapKey!32347 () (_ BitVec 32))

(assert (=> mapNonEmpty!32347 (= (arr!27280 (_values!5593 thiss!1141)) (store mapRest!32347 mapKey!32347 mapValue!32347))))

(declare-fun b!940632 () Bool)

(declare-fun e!528645 () Bool)

(assert (=> b!940632 (= e!528645 tp_is_empty!20371)))

(declare-fun b!940633 () Bool)

(declare-fun res!632462 () Bool)

(assert (=> b!940633 (=> res!632462 e!528649)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56692 (_ BitVec 32)) Bool)

(assert (=> b!940633 (= res!632462 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10420 thiss!1141) (mask!27115 thiss!1141))))))

(declare-fun b!940634 () Bool)

(assert (=> b!940634 (= e!528646 (not e!528649))))

(declare-fun res!632464 () Bool)

(assert (=> b!940634 (=> res!632464 e!528649)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!940634 (= res!632464 (not (validMask!0 (mask!27115 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!56692 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!940634 (arrayContainsKey!0 (_keys!10420 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31772 0))(
  ( (Unit!31773) )
))
(declare-fun lt!424768 () Unit!31772)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56692 (_ BitVec 64) (_ BitVec 32)) Unit!31772)

(assert (=> b!940634 (= lt!424768 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10420 thiss!1141) key!756 (index!38384 lt!424767)))))

(declare-fun b!940635 () Bool)

(assert (=> b!940635 (= e!528650 (and e!528645 mapRes!32347))))

(declare-fun condMapEmpty!32347 () Bool)

(declare-fun mapDefault!32347 () ValueCell!9704)

