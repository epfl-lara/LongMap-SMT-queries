; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81544 () Bool)

(assert start!81544)

(declare-fun b!952762 () Bool)

(declare-fun b_free!18299 () Bool)

(declare-fun b_next!18299 () Bool)

(assert (=> b!952762 (= b_free!18299 (not b_next!18299))))

(declare-fun tp!63521 () Bool)

(declare-fun b_and!29781 () Bool)

(assert (=> b!952762 (= tp!63521 b_and!29781)))

(declare-fun b!952753 () Bool)

(declare-fun e!536588 () Bool)

(declare-fun e!536583 () Bool)

(assert (=> b!952753 (= e!536588 (not e!536583))))

(declare-fun res!638229 () Bool)

(assert (=> b!952753 (=> res!638229 e!536583)))

(declare-datatypes ((V!32707 0))(
  ( (V!32708 (val!10454 Int)) )
))
(declare-datatypes ((ValueCell!9922 0))(
  ( (ValueCellFull!9922 (v!13006 V!32707)) (EmptyCell!9922) )
))
(declare-datatypes ((array!57650 0))(
  ( (array!57651 (arr!27716 (Array (_ BitVec 32) ValueCell!9922)) (size!28195 (_ BitVec 32))) )
))
(declare-datatypes ((array!57652 0))(
  ( (array!57653 (arr!27717 (Array (_ BitVec 32) (_ BitVec 64))) (size!28196 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4994 0))(
  ( (LongMapFixedSize!4995 (defaultEntry!5830 Int) (mask!27684 (_ BitVec 32)) (extraKeys!5562 (_ BitVec 32)) (zeroValue!5666 V!32707) (minValue!5666 V!32707) (_size!2552 (_ BitVec 32)) (_keys!10786 array!57652) (_values!5853 array!57650) (_vacant!2552 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4994)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!952753 (= res!638229 (not (validMask!0 (mask!27684 thiss!1141))))))

(declare-fun lt!429321 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57652 (_ BitVec 32)) Bool)

(assert (=> b!952753 (arrayForallSeekEntryOrOpenFound!0 lt!429321 (_keys!10786 thiss!1141) (mask!27684 thiss!1141))))

(declare-datatypes ((Unit!32051 0))(
  ( (Unit!32052) )
))
(declare-fun lt!429320 () Unit!32051)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57652 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!32051)

(assert (=> b!952753 (= lt!429320 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10786 thiss!1141) (mask!27684 thiss!1141) #b00000000000000000000000000000000 lt!429321))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!57652 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!952753 (= lt!429321 (arrayScanForKey!0 (_keys!10786 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57652 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!952753 (arrayContainsKey!0 (_keys!10786 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!429319 () Unit!32051)

(declare-fun lemmaKeyInListMapIsInArray!337 (array!57652 array!57650 (_ BitVec 32) (_ BitVec 32) V!32707 V!32707 (_ BitVec 64) Int) Unit!32051)

(assert (=> b!952753 (= lt!429319 (lemmaKeyInListMapIsInArray!337 (_keys!10786 thiss!1141) (_values!5853 thiss!1141) (mask!27684 thiss!1141) (extraKeys!5562 thiss!1141) (zeroValue!5666 thiss!1141) (minValue!5666 thiss!1141) key!756 (defaultEntry!5830 thiss!1141)))))

(declare-fun b!952754 () Bool)

(declare-fun res!638230 () Bool)

(assert (=> b!952754 (=> (not res!638230) (not e!536588))))

(assert (=> b!952754 (= res!638230 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!952755 () Bool)

(declare-fun res!638233 () Bool)

(assert (=> b!952755 (=> res!638233 e!536583)))

(assert (=> b!952755 (= res!638233 (not (= (size!28196 (_keys!10786 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27684 thiss!1141)))))))

(declare-fun res!638231 () Bool)

(assert (=> start!81544 (=> (not res!638231) (not e!536588))))

(declare-fun valid!1900 (LongMapFixedSize!4994) Bool)

(assert (=> start!81544 (= res!638231 (valid!1900 thiss!1141))))

(assert (=> start!81544 e!536588))

(declare-fun e!536585 () Bool)

(assert (=> start!81544 e!536585))

(assert (=> start!81544 true))

(declare-fun b!952756 () Bool)

(declare-fun res!638236 () Bool)

(assert (=> b!952756 (=> (not res!638236) (not e!536588))))

(declare-datatypes ((tuple2!13588 0))(
  ( (tuple2!13589 (_1!6805 (_ BitVec 64)) (_2!6805 V!32707)) )
))
(declare-datatypes ((List!19368 0))(
  ( (Nil!19365) (Cons!19364 (h!20526 tuple2!13588) (t!27725 List!19368)) )
))
(declare-datatypes ((ListLongMap!12285 0))(
  ( (ListLongMap!12286 (toList!6158 List!19368)) )
))
(declare-fun contains!5253 (ListLongMap!12285 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3391 (array!57652 array!57650 (_ BitVec 32) (_ BitVec 32) V!32707 V!32707 (_ BitVec 32) Int) ListLongMap!12285)

(assert (=> b!952756 (= res!638236 (contains!5253 (getCurrentListMap!3391 (_keys!10786 thiss!1141) (_values!5853 thiss!1141) (mask!27684 thiss!1141) (extraKeys!5562 thiss!1141) (zeroValue!5666 thiss!1141) (minValue!5666 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5830 thiss!1141)) key!756))))

(declare-fun b!952757 () Bool)

(declare-fun res!638235 () Bool)

(assert (=> b!952757 (=> (not res!638235) (not e!536588))))

(declare-datatypes ((SeekEntryResult!9163 0))(
  ( (MissingZero!9163 (index!39023 (_ BitVec 32))) (Found!9163 (index!39024 (_ BitVec 32))) (Intermediate!9163 (undefined!9975 Bool) (index!39025 (_ BitVec 32)) (x!81959 (_ BitVec 32))) (Undefined!9163) (MissingVacant!9163 (index!39026 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57652 (_ BitVec 32)) SeekEntryResult!9163)

(assert (=> b!952757 (= res!638235 (not (is-Found!9163 (seekEntry!0 key!756 (_keys!10786 thiss!1141) (mask!27684 thiss!1141)))))))

(declare-fun b!952758 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57652 (_ BitVec 32)) SeekEntryResult!9163)

(assert (=> b!952758 (= e!536583 (= (seekEntryOrOpen!0 key!756 (_keys!10786 thiss!1141) (mask!27684 thiss!1141)) (Found!9163 lt!429321)))))

(declare-fun b!952759 () Bool)

(declare-fun res!638234 () Bool)

(assert (=> b!952759 (=> res!638234 e!536583)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!952759 (= res!638234 (not (validKeyInArray!0 key!756)))))

(declare-fun b!952760 () Bool)

(declare-fun e!536584 () Bool)

(declare-fun tp_is_empty!20807 () Bool)

(assert (=> b!952760 (= e!536584 tp_is_empty!20807)))

(declare-fun b!952761 () Bool)

(declare-fun res!638232 () Bool)

(assert (=> b!952761 (=> res!638232 e!536583)))

(assert (=> b!952761 (= res!638232 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10786 thiss!1141) (mask!27684 thiss!1141))))))

(declare-fun mapIsEmpty!33151 () Bool)

(declare-fun mapRes!33151 () Bool)

(assert (=> mapIsEmpty!33151 mapRes!33151))

(declare-fun e!536589 () Bool)

(declare-fun array_inv!21508 (array!57652) Bool)

(declare-fun array_inv!21509 (array!57650) Bool)

(assert (=> b!952762 (= e!536585 (and tp!63521 tp_is_empty!20807 (array_inv!21508 (_keys!10786 thiss!1141)) (array_inv!21509 (_values!5853 thiss!1141)) e!536589))))

(declare-fun mapNonEmpty!33151 () Bool)

(declare-fun tp!63522 () Bool)

(declare-fun e!536586 () Bool)

(assert (=> mapNonEmpty!33151 (= mapRes!33151 (and tp!63522 e!536586))))

(declare-fun mapKey!33151 () (_ BitVec 32))

(declare-fun mapValue!33151 () ValueCell!9922)

(declare-fun mapRest!33151 () (Array (_ BitVec 32) ValueCell!9922))

(assert (=> mapNonEmpty!33151 (= (arr!27716 (_values!5853 thiss!1141)) (store mapRest!33151 mapKey!33151 mapValue!33151))))

(declare-fun b!952763 () Bool)

(assert (=> b!952763 (= e!536586 tp_is_empty!20807)))

(declare-fun b!952764 () Bool)

(assert (=> b!952764 (= e!536589 (and e!536584 mapRes!33151))))

(declare-fun condMapEmpty!33151 () Bool)

(declare-fun mapDefault!33151 () ValueCell!9922)

