; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80014 () Bool)

(assert start!80014)

(declare-fun b!940722 () Bool)

(declare-fun b_free!17869 () Bool)

(declare-fun b_next!17869 () Bool)

(assert (=> b!940722 (= b_free!17869 (not b_next!17869))))

(declare-fun tp!62082 () Bool)

(declare-fun b_and!29281 () Bool)

(assert (=> b!940722 (= tp!62082 b_and!29281)))

(declare-fun mapNonEmpty!32356 () Bool)

(declare-fun mapRes!32356 () Bool)

(declare-fun tp!62081 () Bool)

(declare-fun e!528722 () Bool)

(assert (=> mapNonEmpty!32356 (= mapRes!32356 (and tp!62081 e!528722))))

(declare-datatypes ((V!32135 0))(
  ( (V!32136 (val!10239 Int)) )
))
(declare-datatypes ((ValueCell!9707 0))(
  ( (ValueCellFull!9707 (v!12770 V!32135)) (EmptyCell!9707) )
))
(declare-fun mapRest!32356 () (Array (_ BitVec 32) ValueCell!9707))

(declare-datatypes ((array!56702 0))(
  ( (array!56703 (arr!27286 (Array (_ BitVec 32) ValueCell!9707)) (size!27747 (_ BitVec 32))) )
))
(declare-datatypes ((array!56704 0))(
  ( (array!56705 (arr!27287 (Array (_ BitVec 32) (_ BitVec 64))) (size!27748 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4564 0))(
  ( (LongMapFixedSize!4565 (defaultEntry!5573 Int) (mask!27120 (_ BitVec 32)) (extraKeys!5305 (_ BitVec 32)) (zeroValue!5409 V!32135) (minValue!5409 V!32135) (_size!2337 (_ BitVec 32)) (_keys!10423 array!56704) (_values!5596 array!56702) (_vacant!2337 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4564)

(declare-fun mapValue!32356 () ValueCell!9707)

(declare-fun mapKey!32356 () (_ BitVec 32))

(assert (=> mapNonEmpty!32356 (= (arr!27286 (_values!5596 thiss!1141)) (store mapRest!32356 mapKey!32356 mapValue!32356))))

(declare-fun b!940716 () Bool)

(declare-fun e!528721 () Bool)

(declare-fun e!528724 () Bool)

(assert (=> b!940716 (= e!528721 e!528724)))

(declare-fun res!632520 () Bool)

(assert (=> b!940716 (=> (not res!632520) (not e!528724))))

(declare-datatypes ((SeekEntryResult!9006 0))(
  ( (MissingZero!9006 (index!38395 (_ BitVec 32))) (Found!9006 (index!38396 (_ BitVec 32))) (Intermediate!9006 (undefined!9818 Bool) (index!38397 (_ BitVec 32)) (x!80691 (_ BitVec 32))) (Undefined!9006) (MissingVacant!9006 (index!38398 (_ BitVec 32))) )
))
(declare-fun lt!424794 () SeekEntryResult!9006)

(assert (=> b!940716 (= res!632520 (is-Found!9006 lt!424794))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!56704 (_ BitVec 32)) SeekEntryResult!9006)

(assert (=> b!940716 (= lt!424794 (seekEntry!0 key!756 (_keys!10423 thiss!1141) (mask!27120 thiss!1141)))))

(declare-fun b!940717 () Bool)

(declare-fun res!632517 () Bool)

(declare-fun e!528720 () Bool)

(assert (=> b!940717 (=> res!632517 e!528720)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56704 (_ BitVec 32)) Bool)

(assert (=> b!940717 (= res!632517 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10423 thiss!1141) (mask!27120 thiss!1141))))))

(declare-fun b!940718 () Bool)

(declare-fun res!632521 () Bool)

(assert (=> b!940718 (=> (not res!632521) (not e!528721))))

(assert (=> b!940718 (= res!632521 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!940719 () Bool)

(assert (=> b!940719 (= e!528724 (not e!528720))))

(declare-fun res!632519 () Bool)

(assert (=> b!940719 (=> res!632519 e!528720)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!940719 (= res!632519 (not (validMask!0 (mask!27120 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!56704 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!940719 (arrayContainsKey!0 (_keys!10423 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31778 0))(
  ( (Unit!31779) )
))
(declare-fun lt!424795 () Unit!31778)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56704 (_ BitVec 64) (_ BitVec 32)) Unit!31778)

(assert (=> b!940719 (= lt!424795 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10423 thiss!1141) key!756 (index!38396 lt!424794)))))

(declare-fun b!940721 () Bool)

(declare-fun e!528718 () Bool)

(declare-fun e!528719 () Bool)

(assert (=> b!940721 (= e!528718 (and e!528719 mapRes!32356))))

(declare-fun condMapEmpty!32356 () Bool)

(declare-fun mapDefault!32356 () ValueCell!9707)

