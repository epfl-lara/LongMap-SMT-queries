; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80002 () Bool)

(assert start!80002)

(declare-fun b!940537 () Bool)

(declare-fun b_free!17857 () Bool)

(declare-fun b_next!17857 () Bool)

(assert (=> b!940537 (= b_free!17857 (not b_next!17857))))

(declare-fun tp!62045 () Bool)

(declare-fun b_and!29269 () Bool)

(assert (=> b!940537 (= tp!62045 b_and!29269)))

(declare-fun b!940536 () Bool)

(declare-fun e!528579 () Bool)

(declare-fun tp_is_empty!20365 () Bool)

(assert (=> b!940536 (= e!528579 tp_is_empty!20365)))

(declare-fun res!632409 () Bool)

(declare-fun e!528578 () Bool)

(assert (=> start!80002 (=> (not res!632409) (not e!528578))))

(declare-datatypes ((V!32119 0))(
  ( (V!32120 (val!10233 Int)) )
))
(declare-datatypes ((ValueCell!9701 0))(
  ( (ValueCellFull!9701 (v!12764 V!32119)) (EmptyCell!9701) )
))
(declare-datatypes ((array!56678 0))(
  ( (array!56679 (arr!27274 (Array (_ BitVec 32) ValueCell!9701)) (size!27735 (_ BitVec 32))) )
))
(declare-datatypes ((array!56680 0))(
  ( (array!56681 (arr!27275 (Array (_ BitVec 32) (_ BitVec 64))) (size!27736 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4552 0))(
  ( (LongMapFixedSize!4553 (defaultEntry!5567 Int) (mask!27110 (_ BitVec 32)) (extraKeys!5299 (_ BitVec 32)) (zeroValue!5403 V!32119) (minValue!5403 V!32119) (_size!2331 (_ BitVec 32)) (_keys!10417 array!56680) (_values!5590 array!56678) (_vacant!2331 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4552)

(declare-fun valid!1746 (LongMapFixedSize!4552) Bool)

(assert (=> start!80002 (= res!632409 (valid!1746 thiss!1141))))

(assert (=> start!80002 e!528578))

(declare-fun e!528577 () Bool)

(assert (=> start!80002 e!528577))

(assert (=> start!80002 true))

(declare-fun e!528575 () Bool)

(declare-fun array_inv!21200 (array!56680) Bool)

(declare-fun array_inv!21201 (array!56678) Bool)

(assert (=> b!940537 (= e!528577 (and tp!62045 tp_is_empty!20365 (array_inv!21200 (_keys!10417 thiss!1141)) (array_inv!21201 (_values!5590 thiss!1141)) e!528575))))

(declare-fun b!940538 () Bool)

(declare-fun res!632411 () Bool)

(declare-fun e!528573 () Bool)

(assert (=> b!940538 (=> res!632411 e!528573)))

(assert (=> b!940538 (= res!632411 (or (not (= (size!27735 (_values!5590 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27110 thiss!1141)))) (not (= (size!27736 (_keys!10417 thiss!1141)) (size!27735 (_values!5590 thiss!1141)))) (bvslt (mask!27110 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5299 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5299 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!32338 () Bool)

(declare-fun mapRes!32338 () Bool)

(assert (=> mapIsEmpty!32338 mapRes!32338))

(declare-fun b!940539 () Bool)

(declare-fun res!632408 () Bool)

(assert (=> b!940539 (=> (not res!632408) (not e!528578))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!940539 (= res!632408 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!940540 () Bool)

(assert (=> b!940540 (= e!528573 true)))

(declare-fun lt!424741 () Bool)

(declare-datatypes ((List!19190 0))(
  ( (Nil!19187) (Cons!19186 (h!20332 (_ BitVec 64)) (t!27505 List!19190)) )
))
(declare-fun arrayNoDuplicates!0 (array!56680 (_ BitVec 32) List!19190) Bool)

(assert (=> b!940540 (= lt!424741 (arrayNoDuplicates!0 (_keys!10417 thiss!1141) #b00000000000000000000000000000000 Nil!19187))))

(declare-fun b!940541 () Bool)

(declare-fun e!528580 () Bool)

(assert (=> b!940541 (= e!528580 tp_is_empty!20365)))

(declare-fun mapNonEmpty!32338 () Bool)

(declare-fun tp!62046 () Bool)

(assert (=> mapNonEmpty!32338 (= mapRes!32338 (and tp!62046 e!528580))))

(declare-fun mapRest!32338 () (Array (_ BitVec 32) ValueCell!9701))

(declare-fun mapValue!32338 () ValueCell!9701)

(declare-fun mapKey!32338 () (_ BitVec 32))

(assert (=> mapNonEmpty!32338 (= (arr!27274 (_values!5590 thiss!1141)) (store mapRest!32338 mapKey!32338 mapValue!32338))))

(declare-fun b!940542 () Bool)

(declare-fun res!632413 () Bool)

(assert (=> b!940542 (=> res!632413 e!528573)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56680 (_ BitVec 32)) Bool)

(assert (=> b!940542 (= res!632413 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10417 thiss!1141) (mask!27110 thiss!1141))))))

(declare-fun b!940543 () Bool)

(declare-fun e!528576 () Bool)

(assert (=> b!940543 (= e!528578 e!528576)))

(declare-fun res!632412 () Bool)

(assert (=> b!940543 (=> (not res!632412) (not e!528576))))

(declare-datatypes ((SeekEntryResult!9001 0))(
  ( (MissingZero!9001 (index!38375 (_ BitVec 32))) (Found!9001 (index!38376 (_ BitVec 32))) (Intermediate!9001 (undefined!9813 Bool) (index!38377 (_ BitVec 32)) (x!80670 (_ BitVec 32))) (Undefined!9001) (MissingVacant!9001 (index!38378 (_ BitVec 32))) )
))
(declare-fun lt!424740 () SeekEntryResult!9001)

(assert (=> b!940543 (= res!632412 (is-Found!9001 lt!424740))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!56680 (_ BitVec 32)) SeekEntryResult!9001)

(assert (=> b!940543 (= lt!424740 (seekEntry!0 key!756 (_keys!10417 thiss!1141) (mask!27110 thiss!1141)))))

(declare-fun b!940544 () Bool)

(assert (=> b!940544 (= e!528576 (not e!528573))))

(declare-fun res!632410 () Bool)

(assert (=> b!940544 (=> res!632410 e!528573)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!940544 (= res!632410 (not (validMask!0 (mask!27110 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!56680 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!940544 (arrayContainsKey!0 (_keys!10417 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31768 0))(
  ( (Unit!31769) )
))
(declare-fun lt!424739 () Unit!31768)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56680 (_ BitVec 64) (_ BitVec 32)) Unit!31768)

(assert (=> b!940544 (= lt!424739 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10417 thiss!1141) key!756 (index!38376 lt!424740)))))

(declare-fun b!940545 () Bool)

(assert (=> b!940545 (= e!528575 (and e!528579 mapRes!32338))))

(declare-fun condMapEmpty!32338 () Bool)

(declare-fun mapDefault!32338 () ValueCell!9701)

