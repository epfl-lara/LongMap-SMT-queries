; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80018 () Bool)

(assert start!80018)

(declare-fun b!940777 () Bool)

(declare-fun b_free!17873 () Bool)

(declare-fun b_next!17873 () Bool)

(assert (=> b!940777 (= b_free!17873 (not b_next!17873))))

(declare-fun tp!62093 () Bool)

(declare-fun b_and!29285 () Bool)

(assert (=> b!940777 (= tp!62093 b_and!29285)))

(declare-fun b!940776 () Bool)

(declare-fun res!632554 () Bool)

(declare-fun e!528767 () Bool)

(assert (=> b!940776 (=> res!632554 e!528767)))

(declare-datatypes ((V!32139 0))(
  ( (V!32140 (val!10241 Int)) )
))
(declare-datatypes ((ValueCell!9709 0))(
  ( (ValueCellFull!9709 (v!12772 V!32139)) (EmptyCell!9709) )
))
(declare-datatypes ((array!56710 0))(
  ( (array!56711 (arr!27290 (Array (_ BitVec 32) ValueCell!9709)) (size!27751 (_ BitVec 32))) )
))
(declare-datatypes ((array!56712 0))(
  ( (array!56713 (arr!27291 (Array (_ BitVec 32) (_ BitVec 64))) (size!27752 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4568 0))(
  ( (LongMapFixedSize!4569 (defaultEntry!5575 Int) (mask!27122 (_ BitVec 32)) (extraKeys!5307 (_ BitVec 32)) (zeroValue!5411 V!32139) (minValue!5411 V!32139) (_size!2339 (_ BitVec 32)) (_keys!10425 array!56712) (_values!5598 array!56710) (_vacant!2339 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4568)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56712 (_ BitVec 32)) Bool)

(assert (=> b!940776 (= res!632554 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10425 thiss!1141) (mask!27122 thiss!1141))))))

(declare-fun tp_is_empty!20381 () Bool)

(declare-fun e!528769 () Bool)

(declare-fun e!528765 () Bool)

(declare-fun array_inv!21212 (array!56712) Bool)

(declare-fun array_inv!21213 (array!56710) Bool)

(assert (=> b!940777 (= e!528765 (and tp!62093 tp_is_empty!20381 (array_inv!21212 (_keys!10425 thiss!1141)) (array_inv!21213 (_values!5598 thiss!1141)) e!528769))))

(declare-fun mapNonEmpty!32362 () Bool)

(declare-fun mapRes!32362 () Bool)

(declare-fun tp!62094 () Bool)

(declare-fun e!528770 () Bool)

(assert (=> mapNonEmpty!32362 (= mapRes!32362 (and tp!62094 e!528770))))

(declare-fun mapValue!32362 () ValueCell!9709)

(declare-fun mapKey!32362 () (_ BitVec 32))

(declare-fun mapRest!32362 () (Array (_ BitVec 32) ValueCell!9709))

(assert (=> mapNonEmpty!32362 (= (arr!27290 (_values!5598 thiss!1141)) (store mapRest!32362 mapKey!32362 mapValue!32362))))

(declare-fun b!940778 () Bool)

(declare-fun e!528768 () Bool)

(declare-fun e!528766 () Bool)

(assert (=> b!940778 (= e!528768 e!528766)))

(declare-fun res!632556 () Bool)

(assert (=> b!940778 (=> (not res!632556) (not e!528766))))

(declare-datatypes ((SeekEntryResult!9008 0))(
  ( (MissingZero!9008 (index!38403 (_ BitVec 32))) (Found!9008 (index!38404 (_ BitVec 32))) (Intermediate!9008 (undefined!9820 Bool) (index!38405 (_ BitVec 32)) (x!80693 (_ BitVec 32))) (Undefined!9008) (MissingVacant!9008 (index!38406 (_ BitVec 32))) )
))
(declare-fun lt!424811 () SeekEntryResult!9008)

(assert (=> b!940778 (= res!632556 (is-Found!9008 lt!424811))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!56712 (_ BitVec 32)) SeekEntryResult!9008)

(assert (=> b!940778 (= lt!424811 (seekEntry!0 key!756 (_keys!10425 thiss!1141) (mask!27122 thiss!1141)))))

(declare-fun b!940779 () Bool)

(declare-fun e!528771 () Bool)

(assert (=> b!940779 (= e!528771 tp_is_empty!20381)))

(declare-fun b!940780 () Bool)

(declare-fun res!632553 () Bool)

(assert (=> b!940780 (=> (not res!632553) (not e!528768))))

(assert (=> b!940780 (= res!632553 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!940781 () Bool)

(assert (=> b!940781 (= e!528770 tp_is_empty!20381)))

(declare-fun b!940782 () Bool)

(declare-fun res!632552 () Bool)

(assert (=> b!940782 (=> res!632552 e!528767)))

(assert (=> b!940782 (= res!632552 (or (not (= (size!27751 (_values!5598 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27122 thiss!1141)))) (not (= (size!27752 (_keys!10425 thiss!1141)) (size!27751 (_values!5598 thiss!1141)))) (bvslt (mask!27122 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5307 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5307 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!940783 () Bool)

(assert (=> b!940783 (= e!528767 true)))

(declare-fun lt!424812 () Bool)

(declare-datatypes ((List!19196 0))(
  ( (Nil!19193) (Cons!19192 (h!20338 (_ BitVec 64)) (t!27511 List!19196)) )
))
(declare-fun arrayNoDuplicates!0 (array!56712 (_ BitVec 32) List!19196) Bool)

(assert (=> b!940783 (= lt!424812 (arrayNoDuplicates!0 (_keys!10425 thiss!1141) #b00000000000000000000000000000000 Nil!19193))))

(declare-fun mapIsEmpty!32362 () Bool)

(assert (=> mapIsEmpty!32362 mapRes!32362))

(declare-fun b!940784 () Bool)

(assert (=> b!940784 (= e!528766 (not e!528767))))

(declare-fun res!632557 () Bool)

(assert (=> b!940784 (=> res!632557 e!528767)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!940784 (= res!632557 (not (validMask!0 (mask!27122 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!56712 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!940784 (arrayContainsKey!0 (_keys!10425 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31782 0))(
  ( (Unit!31783) )
))
(declare-fun lt!424813 () Unit!31782)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56712 (_ BitVec 64) (_ BitVec 32)) Unit!31782)

(assert (=> b!940784 (= lt!424813 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10425 thiss!1141) key!756 (index!38404 lt!424811)))))

(declare-fun res!632555 () Bool)

(assert (=> start!80018 (=> (not res!632555) (not e!528768))))

(declare-fun valid!1752 (LongMapFixedSize!4568) Bool)

(assert (=> start!80018 (= res!632555 (valid!1752 thiss!1141))))

(assert (=> start!80018 e!528768))

(assert (=> start!80018 e!528765))

(assert (=> start!80018 true))

(declare-fun b!940785 () Bool)

(assert (=> b!940785 (= e!528769 (and e!528771 mapRes!32362))))

(declare-fun condMapEmpty!32362 () Bool)

(declare-fun mapDefault!32362 () ValueCell!9709)

