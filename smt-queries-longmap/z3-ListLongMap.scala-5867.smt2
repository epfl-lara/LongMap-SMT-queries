; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75734 () Bool)

(assert start!75734)

(declare-fun b!890498 () Bool)

(declare-fun b_free!15705 () Bool)

(declare-fun b_next!15705 () Bool)

(assert (=> b!890498 (= b_free!15705 (not b_next!15705))))

(declare-fun tp!55084 () Bool)

(declare-fun b_and!25945 () Bool)

(assert (=> b!890498 (= tp!55084 b_and!25945)))

(declare-fun e!496680 () Bool)

(declare-fun e!496683 () Bool)

(declare-datatypes ((array!52046 0))(
  ( (array!52047 (arr!25029 (Array (_ BitVec 32) (_ BitVec 64))) (size!25473 (_ BitVec 32))) )
))
(declare-datatypes ((V!29009 0))(
  ( (V!29010 (val!9067 Int)) )
))
(declare-datatypes ((ValueCell!8535 0))(
  ( (ValueCellFull!8535 (v!11545 V!29009)) (EmptyCell!8535) )
))
(declare-datatypes ((array!52048 0))(
  ( (array!52049 (arr!25030 (Array (_ BitVec 32) ValueCell!8535)) (size!25474 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4086 0))(
  ( (LongMapFixedSize!4087 (defaultEntry!5240 Int) (mask!25715 (_ BitVec 32)) (extraKeys!4934 (_ BitVec 32)) (zeroValue!5038 V!29009) (minValue!5038 V!29009) (_size!2098 (_ BitVec 32)) (_keys!9923 array!52046) (_values!5225 array!52048) (_vacant!2098 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4086)

(declare-fun tp_is_empty!18033 () Bool)

(declare-fun array_inv!19676 (array!52046) Bool)

(declare-fun array_inv!19677 (array!52048) Bool)

(assert (=> b!890498 (= e!496683 (and tp!55084 tp_is_empty!18033 (array_inv!19676 (_keys!9923 thiss!1181)) (array_inv!19677 (_values!5225 thiss!1181)) e!496680))))

(declare-fun b!890499 () Bool)

(declare-fun res!603363 () Bool)

(declare-fun e!496676 () Bool)

(assert (=> b!890499 (=> res!603363 e!496676)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52046 (_ BitVec 32)) Bool)

(assert (=> b!890499 (= res!603363 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9923 thiss!1181) (mask!25715 thiss!1181))))))

(declare-fun b!890500 () Bool)

(declare-fun e!496675 () Bool)

(declare-fun mapRes!28604 () Bool)

(assert (=> b!890500 (= e!496680 (and e!496675 mapRes!28604))))

(declare-fun condMapEmpty!28604 () Bool)

(declare-fun mapDefault!28604 () ValueCell!8535)

(assert (=> b!890500 (= condMapEmpty!28604 (= (arr!25030 (_values!5225 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8535)) mapDefault!28604)))))

(declare-fun b!890501 () Bool)

(declare-fun e!496677 () Bool)

(assert (=> b!890501 (= e!496677 tp_is_empty!18033)))

(declare-fun b!890503 () Bool)

(declare-fun res!603364 () Bool)

(assert (=> b!890503 (=> res!603364 e!496676)))

(assert (=> b!890503 (= res!603364 (or (not (= (size!25474 (_values!5225 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25715 thiss!1181)))) (not (= (size!25473 (_keys!9923 thiss!1181)) (size!25474 (_values!5225 thiss!1181)))) (bvslt (mask!25715 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4934 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4934 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!28604 () Bool)

(declare-fun tp!55083 () Bool)

(assert (=> mapNonEmpty!28604 (= mapRes!28604 (and tp!55083 e!496677))))

(declare-fun mapRest!28604 () (Array (_ BitVec 32) ValueCell!8535))

(declare-fun mapKey!28604 () (_ BitVec 32))

(declare-fun mapValue!28604 () ValueCell!8535)

(assert (=> mapNonEmpty!28604 (= (arr!25030 (_values!5225 thiss!1181)) (store mapRest!28604 mapKey!28604 mapValue!28604))))

(declare-fun b!890504 () Bool)

(declare-fun res!603360 () Bool)

(declare-fun e!496679 () Bool)

(assert (=> b!890504 (=> (not res!603360) (not e!496679))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!890504 (= res!603360 (not (= key!785 (bvneg key!785))))))

(declare-fun b!890505 () Bool)

(declare-fun e!496678 () Bool)

(declare-datatypes ((SeekEntryResult!8801 0))(
  ( (MissingZero!8801 (index!37575 (_ BitVec 32))) (Found!8801 (index!37576 (_ BitVec 32))) (Intermediate!8801 (undefined!9613 Bool) (index!37577 (_ BitVec 32)) (x!75649 (_ BitVec 32))) (Undefined!8801) (MissingVacant!8801 (index!37578 (_ BitVec 32))) )
))
(declare-fun lt!402321 () SeekEntryResult!8801)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!890505 (= e!496678 (inRange!0 (index!37576 lt!402321) (mask!25715 thiss!1181)))))

(declare-fun b!890506 () Bool)

(assert (=> b!890506 (= e!496676 true)))

(declare-fun lt!402319 () Bool)

(declare-datatypes ((List!17720 0))(
  ( (Nil!17717) (Cons!17716 (h!18847 (_ BitVec 64)) (t!25019 List!17720)) )
))
(declare-fun arrayNoDuplicates!0 (array!52046 (_ BitVec 32) List!17720) Bool)

(assert (=> b!890506 (= lt!402319 (arrayNoDuplicates!0 (_keys!9923 thiss!1181) #b00000000000000000000000000000000 Nil!17717))))

(declare-fun b!890507 () Bool)

(assert (=> b!890507 (= e!496675 tp_is_empty!18033)))

(declare-fun res!603361 () Bool)

(assert (=> start!75734 (=> (not res!603361) (not e!496679))))

(declare-fun valid!1585 (LongMapFixedSize!4086) Bool)

(assert (=> start!75734 (= res!603361 (valid!1585 thiss!1181))))

(assert (=> start!75734 e!496679))

(assert (=> start!75734 e!496683))

(assert (=> start!75734 true))

(declare-fun b!890502 () Bool)

(declare-fun e!496682 () Bool)

(assert (=> b!890502 (= e!496682 e!496676)))

(declare-fun res!603359 () Bool)

(assert (=> b!890502 (=> res!603359 e!496676)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!890502 (= res!603359 (not (validMask!0 (mask!25715 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52046 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!890502 (arrayContainsKey!0 (_keys!9923 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30302 0))(
  ( (Unit!30303) )
))
(declare-fun lt!402320 () Unit!30302)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52046 (_ BitVec 64) (_ BitVec 32)) Unit!30302)

(assert (=> b!890502 (= lt!402320 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9923 thiss!1181) key!785 (index!37576 lt!402321)))))

(declare-fun b!890508 () Bool)

(assert (=> b!890508 (= e!496679 (not e!496682))))

(declare-fun res!603365 () Bool)

(assert (=> b!890508 (=> res!603365 e!496682)))

(get-info :version)

(assert (=> b!890508 (= res!603365 (not ((_ is Found!8801) lt!402321)))))

(assert (=> b!890508 e!496678))

(declare-fun res!603362 () Bool)

(assert (=> b!890508 (=> res!603362 e!496678)))

(assert (=> b!890508 (= res!603362 (not ((_ is Found!8801) lt!402321)))))

(declare-fun lt!402322 () Unit!30302)

(declare-fun lemmaSeekEntryGivesInRangeIndex!12 (array!52046 array!52048 (_ BitVec 32) (_ BitVec 32) V!29009 V!29009 (_ BitVec 64)) Unit!30302)

(assert (=> b!890508 (= lt!402322 (lemmaSeekEntryGivesInRangeIndex!12 (_keys!9923 thiss!1181) (_values!5225 thiss!1181) (mask!25715 thiss!1181) (extraKeys!4934 thiss!1181) (zeroValue!5038 thiss!1181) (minValue!5038 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52046 (_ BitVec 32)) SeekEntryResult!8801)

(assert (=> b!890508 (= lt!402321 (seekEntry!0 key!785 (_keys!9923 thiss!1181) (mask!25715 thiss!1181)))))

(declare-fun mapIsEmpty!28604 () Bool)

(assert (=> mapIsEmpty!28604 mapRes!28604))

(assert (= (and start!75734 res!603361) b!890504))

(assert (= (and b!890504 res!603360) b!890508))

(assert (= (and b!890508 (not res!603362)) b!890505))

(assert (= (and b!890508 (not res!603365)) b!890502))

(assert (= (and b!890502 (not res!603359)) b!890503))

(assert (= (and b!890503 (not res!603364)) b!890499))

(assert (= (and b!890499 (not res!603363)) b!890506))

(assert (= (and b!890500 condMapEmpty!28604) mapIsEmpty!28604))

(assert (= (and b!890500 (not condMapEmpty!28604)) mapNonEmpty!28604))

(assert (= (and mapNonEmpty!28604 ((_ is ValueCellFull!8535) mapValue!28604)) b!890501))

(assert (= (and b!890500 ((_ is ValueCellFull!8535) mapDefault!28604)) b!890507))

(assert (= b!890498 b!890500))

(assert (= start!75734 b!890498))

(declare-fun m!829029 () Bool)

(assert (=> b!890502 m!829029))

(declare-fun m!829031 () Bool)

(assert (=> b!890502 m!829031))

(declare-fun m!829033 () Bool)

(assert (=> b!890502 m!829033))

(declare-fun m!829035 () Bool)

(assert (=> b!890498 m!829035))

(declare-fun m!829037 () Bool)

(assert (=> b!890498 m!829037))

(declare-fun m!829039 () Bool)

(assert (=> b!890506 m!829039))

(declare-fun m!829041 () Bool)

(assert (=> b!890508 m!829041))

(declare-fun m!829043 () Bool)

(assert (=> b!890508 m!829043))

(declare-fun m!829045 () Bool)

(assert (=> mapNonEmpty!28604 m!829045))

(declare-fun m!829047 () Bool)

(assert (=> start!75734 m!829047))

(declare-fun m!829049 () Bool)

(assert (=> b!890505 m!829049))

(declare-fun m!829051 () Bool)

(assert (=> b!890499 m!829051))

(check-sat (not mapNonEmpty!28604) b_and!25945 tp_is_empty!18033 (not b!890502) (not b_next!15705) (not b!890498) (not b!890505) (not start!75734) (not b!890508) (not b!890499) (not b!890506))
(check-sat b_and!25945 (not b_next!15705))
