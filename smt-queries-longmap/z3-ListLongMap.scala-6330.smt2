; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81556 () Bool)

(assert start!81556)

(declare-fun b!952710 () Bool)

(declare-fun b_free!18301 () Bool)

(declare-fun b_next!18301 () Bool)

(assert (=> b!952710 (= b_free!18301 (not b_next!18301))))

(declare-fun tp!63532 () Bool)

(declare-fun b_and!29759 () Bool)

(assert (=> b!952710 (= tp!63532 b_and!29759)))

(declare-fun b!952703 () Bool)

(declare-fun res!638190 () Bool)

(declare-fun e!536555 () Bool)

(assert (=> b!952703 (=> (not res!638190) (not e!536555))))

(declare-datatypes ((V!32711 0))(
  ( (V!32712 (val!10455 Int)) )
))
(declare-datatypes ((ValueCell!9923 0))(
  ( (ValueCellFull!9923 (v!13007 V!32711)) (EmptyCell!9923) )
))
(declare-datatypes ((array!57621 0))(
  ( (array!57622 (arr!27701 (Array (_ BitVec 32) ValueCell!9923)) (size!28182 (_ BitVec 32))) )
))
(declare-datatypes ((array!57623 0))(
  ( (array!57624 (arr!27702 (Array (_ BitVec 32) (_ BitVec 64))) (size!28183 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4996 0))(
  ( (LongMapFixedSize!4997 (defaultEntry!5833 Int) (mask!27687 (_ BitVec 32)) (extraKeys!5565 (_ BitVec 32)) (zeroValue!5669 V!32711) (minValue!5669 V!32711) (_size!2553 (_ BitVec 32)) (_keys!10787 array!57623) (_values!5856 array!57621) (_vacant!2553 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4996)

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13634 0))(
  ( (tuple2!13635 (_1!6828 (_ BitVec 64)) (_2!6828 V!32711)) )
))
(declare-datatypes ((List!19372 0))(
  ( (Nil!19369) (Cons!19368 (h!20530 tuple2!13634) (t!27722 List!19372)) )
))
(declare-datatypes ((ListLongMap!12321 0))(
  ( (ListLongMap!12322 (toList!6176 List!19372)) )
))
(declare-fun contains!5214 (ListLongMap!12321 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3338 (array!57623 array!57621 (_ BitVec 32) (_ BitVec 32) V!32711 V!32711 (_ BitVec 32) Int) ListLongMap!12321)

(assert (=> b!952703 (= res!638190 (contains!5214 (getCurrentListMap!3338 (_keys!10787 thiss!1141) (_values!5856 thiss!1141) (mask!27687 thiss!1141) (extraKeys!5565 thiss!1141) (zeroValue!5669 thiss!1141) (minValue!5669 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5833 thiss!1141)) key!756))))

(declare-fun b!952704 () Bool)

(declare-fun res!638191 () Bool)

(assert (=> b!952704 (=> (not res!638191) (not e!536555))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9160 0))(
  ( (MissingZero!9160 (index!39011 (_ BitVec 32))) (Found!9160 (index!39012 (_ BitVec 32))) (Intermediate!9160 (undefined!9972 Bool) (index!39013 (_ BitVec 32)) (x!81969 (_ BitVec 32))) (Undefined!9160) (MissingVacant!9160 (index!39014 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57623 (_ BitVec 32)) SeekEntryResult!9160)

(assert (=> b!952704 (= res!638191 (not ((_ is Found!9160) (seekEntry!0 key!756 (_keys!10787 thiss!1141) (mask!27687 thiss!1141)))))))

(declare-fun res!638189 () Bool)

(assert (=> start!81556 (=> (not res!638189) (not e!536555))))

(declare-fun valid!1906 (LongMapFixedSize!4996) Bool)

(assert (=> start!81556 (= res!638189 (valid!1906 thiss!1141))))

(assert (=> start!81556 e!536555))

(declare-fun e!536551 () Bool)

(assert (=> start!81556 e!536551))

(assert (=> start!81556 true))

(declare-fun mapIsEmpty!33157 () Bool)

(declare-fun mapRes!33157 () Bool)

(assert (=> mapIsEmpty!33157 mapRes!33157))

(declare-fun b!952705 () Bool)

(declare-fun res!638188 () Bool)

(assert (=> b!952705 (=> (not res!638188) (not e!536555))))

(assert (=> b!952705 (= res!638188 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!952706 () Bool)

(assert (=> b!952706 (= e!536555 (not true))))

(assert (=> b!952706 false))

(declare-datatypes ((Unit!31927 0))(
  ( (Unit!31928) )
))
(declare-fun lt!429216 () Unit!31927)

(declare-fun lt!429215 () (_ BitVec 32))

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!57623 (_ BitVec 32)) Unit!31927)

(assert (=> b!952706 (= lt!429216 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!756 lt!429215 (_keys!10787 thiss!1141) (mask!27687 thiss!1141)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57623 (_ BitVec 32)) Bool)

(assert (=> b!952706 (arrayForallSeekEntryOrOpenFound!0 lt!429215 (_keys!10787 thiss!1141) (mask!27687 thiss!1141))))

(declare-fun lt!429217 () Unit!31927)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57623 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!31927)

(assert (=> b!952706 (= lt!429217 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10787 thiss!1141) (mask!27687 thiss!1141) #b00000000000000000000000000000000 lt!429215))))

(declare-fun arrayScanForKey!0 (array!57623 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!952706 (= lt!429215 (arrayScanForKey!0 (_keys!10787 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57623 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!952706 (arrayContainsKey!0 (_keys!10787 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!429214 () Unit!31927)

(declare-fun lemmaKeyInListMapIsInArray!320 (array!57623 array!57621 (_ BitVec 32) (_ BitVec 32) V!32711 V!32711 (_ BitVec 64) Int) Unit!31927)

(assert (=> b!952706 (= lt!429214 (lemmaKeyInListMapIsInArray!320 (_keys!10787 thiss!1141) (_values!5856 thiss!1141) (mask!27687 thiss!1141) (extraKeys!5565 thiss!1141) (zeroValue!5669 thiss!1141) (minValue!5669 thiss!1141) key!756 (defaultEntry!5833 thiss!1141)))))

(declare-fun mapNonEmpty!33157 () Bool)

(declare-fun tp!63531 () Bool)

(declare-fun e!536552 () Bool)

(assert (=> mapNonEmpty!33157 (= mapRes!33157 (and tp!63531 e!536552))))

(declare-fun mapValue!33157 () ValueCell!9923)

(declare-fun mapKey!33157 () (_ BitVec 32))

(declare-fun mapRest!33157 () (Array (_ BitVec 32) ValueCell!9923))

(assert (=> mapNonEmpty!33157 (= (arr!27701 (_values!5856 thiss!1141)) (store mapRest!33157 mapKey!33157 mapValue!33157))))

(declare-fun b!952707 () Bool)

(declare-fun tp_is_empty!20809 () Bool)

(assert (=> b!952707 (= e!536552 tp_is_empty!20809)))

(declare-fun b!952708 () Bool)

(declare-fun e!536550 () Bool)

(declare-fun e!536554 () Bool)

(assert (=> b!952708 (= e!536550 (and e!536554 mapRes!33157))))

(declare-fun condMapEmpty!33157 () Bool)

(declare-fun mapDefault!33157 () ValueCell!9923)

(assert (=> b!952708 (= condMapEmpty!33157 (= (arr!27701 (_values!5856 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9923)) mapDefault!33157)))))

(declare-fun b!952709 () Bool)

(assert (=> b!952709 (= e!536554 tp_is_empty!20809)))

(declare-fun array_inv!21558 (array!57623) Bool)

(declare-fun array_inv!21559 (array!57621) Bool)

(assert (=> b!952710 (= e!536551 (and tp!63532 tp_is_empty!20809 (array_inv!21558 (_keys!10787 thiss!1141)) (array_inv!21559 (_values!5856 thiss!1141)) e!536550))))

(assert (= (and start!81556 res!638189) b!952705))

(assert (= (and b!952705 res!638188) b!952704))

(assert (= (and b!952704 res!638191) b!952703))

(assert (= (and b!952703 res!638190) b!952706))

(assert (= (and b!952708 condMapEmpty!33157) mapIsEmpty!33157))

(assert (= (and b!952708 (not condMapEmpty!33157)) mapNonEmpty!33157))

(assert (= (and mapNonEmpty!33157 ((_ is ValueCellFull!9923) mapValue!33157)) b!952707))

(assert (= (and b!952708 ((_ is ValueCellFull!9923) mapDefault!33157)) b!952709))

(assert (= b!952710 b!952708))

(assert (= start!81556 b!952710))

(declare-fun m!884261 () Bool)

(assert (=> start!81556 m!884261))

(declare-fun m!884263 () Bool)

(assert (=> b!952706 m!884263))

(declare-fun m!884265 () Bool)

(assert (=> b!952706 m!884265))

(declare-fun m!884267 () Bool)

(assert (=> b!952706 m!884267))

(declare-fun m!884269 () Bool)

(assert (=> b!952706 m!884269))

(declare-fun m!884271 () Bool)

(assert (=> b!952706 m!884271))

(declare-fun m!884273 () Bool)

(assert (=> b!952706 m!884273))

(declare-fun m!884275 () Bool)

(assert (=> b!952704 m!884275))

(declare-fun m!884277 () Bool)

(assert (=> mapNonEmpty!33157 m!884277))

(declare-fun m!884279 () Bool)

(assert (=> b!952710 m!884279))

(declare-fun m!884281 () Bool)

(assert (=> b!952710 m!884281))

(declare-fun m!884283 () Bool)

(assert (=> b!952703 m!884283))

(assert (=> b!952703 m!884283))

(declare-fun m!884285 () Bool)

(assert (=> b!952703 m!884285))

(check-sat (not mapNonEmpty!33157) (not b!952703) tp_is_empty!20809 b_and!29759 (not b!952704) (not b!952706) (not b!952710) (not start!81556) (not b_next!18301))
(check-sat b_and!29759 (not b_next!18301))
