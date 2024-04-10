; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80424 () Bool)

(assert start!80424)

(declare-fun b!944743 () Bool)

(declare-fun b_free!18067 () Bool)

(declare-fun b_next!18067 () Bool)

(assert (=> b!944743 (= b_free!18067 (not b_next!18067))))

(declare-fun tp!62711 () Bool)

(declare-fun b_and!29485 () Bool)

(assert (=> b!944743 (= tp!62711 b_and!29485)))

(declare-fun e!531284 () Bool)

(declare-datatypes ((V!32399 0))(
  ( (V!32400 (val!10338 Int)) )
))
(declare-datatypes ((ValueCell!9806 0))(
  ( (ValueCellFull!9806 (v!12870 V!32399)) (EmptyCell!9806) )
))
(declare-datatypes ((array!57118 0))(
  ( (array!57119 (arr!27484 (Array (_ BitVec 32) ValueCell!9806)) (size!27950 (_ BitVec 32))) )
))
(declare-datatypes ((array!57120 0))(
  ( (array!57121 (arr!27485 (Array (_ BitVec 32) (_ BitVec 64))) (size!27951 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4762 0))(
  ( (LongMapFixedSize!4763 (defaultEntry!5676 Int) (mask!27332 (_ BitVec 32)) (extraKeys!5408 (_ BitVec 32)) (zeroValue!5512 V!32399) (minValue!5512 V!32399) (_size!2436 (_ BitVec 32)) (_keys!10554 array!57120) (_values!5699 array!57118) (_vacant!2436 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4762)

(declare-fun e!531281 () Bool)

(declare-fun tp_is_empty!20575 () Bool)

(declare-fun array_inv!21354 (array!57120) Bool)

(declare-fun array_inv!21355 (array!57118) Bool)

(assert (=> b!944743 (= e!531281 (and tp!62711 tp_is_empty!20575 (array_inv!21354 (_keys!10554 thiss!1141)) (array_inv!21355 (_values!5699 thiss!1141)) e!531284))))

(declare-fun res!634659 () Bool)

(declare-fun e!531286 () Bool)

(assert (=> start!80424 (=> (not res!634659) (not e!531286))))

(declare-fun valid!1821 (LongMapFixedSize!4762) Bool)

(assert (=> start!80424 (= res!634659 (valid!1821 thiss!1141))))

(assert (=> start!80424 e!531286))

(assert (=> start!80424 e!531281))

(assert (=> start!80424 true))

(declare-fun b!944744 () Bool)

(declare-fun res!634656 () Bool)

(assert (=> b!944744 (=> (not res!634656) (not e!531286))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!944744 (= res!634656 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!944745 () Bool)

(declare-fun res!634653 () Bool)

(assert (=> b!944745 (=> (not res!634653) (not e!531286))))

(declare-datatypes ((tuple2!13494 0))(
  ( (tuple2!13495 (_1!6758 (_ BitVec 64)) (_2!6758 V!32399)) )
))
(declare-datatypes ((List!19281 0))(
  ( (Nil!19278) (Cons!19277 (h!20428 tuple2!13494) (t!27598 List!19281)) )
))
(declare-datatypes ((ListLongMap!12191 0))(
  ( (ListLongMap!12192 (toList!6111 List!19281)) )
))
(declare-fun contains!5183 (ListLongMap!12191 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3345 (array!57120 array!57118 (_ BitVec 32) (_ BitVec 32) V!32399 V!32399 (_ BitVec 32) Int) ListLongMap!12191)

(assert (=> b!944745 (= res!634653 (contains!5183 (getCurrentListMap!3345 (_keys!10554 thiss!1141) (_values!5699 thiss!1141) (mask!27332 thiss!1141) (extraKeys!5408 thiss!1141) (zeroValue!5512 thiss!1141) (minValue!5512 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5676 thiss!1141)) key!756))))

(declare-fun b!944746 () Bool)

(declare-fun res!634658 () Bool)

(declare-fun e!531282 () Bool)

(assert (=> b!944746 (=> res!634658 e!531282)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!944746 (= res!634658 (not (validKeyInArray!0 key!756)))))

(declare-fun b!944747 () Bool)

(declare-fun res!634657 () Bool)

(assert (=> b!944747 (=> res!634657 e!531282)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57120 (_ BitVec 32)) Bool)

(assert (=> b!944747 (= res!634657 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10554 thiss!1141) (mask!27332 thiss!1141))))))

(declare-fun b!944748 () Bool)

(declare-fun res!634652 () Bool)

(assert (=> b!944748 (=> res!634652 e!531282)))

(assert (=> b!944748 (= res!634652 (not (= (size!27951 (_keys!10554 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27332 thiss!1141)))))))

(declare-fun b!944749 () Bool)

(declare-fun res!634655 () Bool)

(assert (=> b!944749 (=> (not res!634655) (not e!531286))))

(declare-datatypes ((SeekEntryResult!9075 0))(
  ( (MissingZero!9075 (index!38671 (_ BitVec 32))) (Found!9075 (index!38672 (_ BitVec 32))) (Intermediate!9075 (undefined!9887 Bool) (index!38673 (_ BitVec 32)) (x!81150 (_ BitVec 32))) (Undefined!9075) (MissingVacant!9075 (index!38674 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57120 (_ BitVec 32)) SeekEntryResult!9075)

(assert (=> b!944749 (= res!634655 (not (is-Found!9075 (seekEntry!0 key!756 (_keys!10554 thiss!1141) (mask!27332 thiss!1141)))))))

(declare-fun mapNonEmpty!32688 () Bool)

(declare-fun mapRes!32688 () Bool)

(declare-fun tp!62710 () Bool)

(declare-fun e!531280 () Bool)

(assert (=> mapNonEmpty!32688 (= mapRes!32688 (and tp!62710 e!531280))))

(declare-fun mapRest!32688 () (Array (_ BitVec 32) ValueCell!9806))

(declare-fun mapValue!32688 () ValueCell!9806)

(declare-fun mapKey!32688 () (_ BitVec 32))

(assert (=> mapNonEmpty!32688 (= (arr!27484 (_values!5699 thiss!1141)) (store mapRest!32688 mapKey!32688 mapValue!32688))))

(declare-fun b!944750 () Bool)

(declare-fun e!531285 () Bool)

(assert (=> b!944750 (= e!531285 tp_is_empty!20575)))

(declare-fun mapIsEmpty!32688 () Bool)

(assert (=> mapIsEmpty!32688 mapRes!32688))

(declare-fun b!944751 () Bool)

(assert (=> b!944751 (= e!531280 tp_is_empty!20575)))

(declare-fun b!944752 () Bool)

(assert (=> b!944752 (= e!531286 (not e!531282))))

(declare-fun res!634654 () Bool)

(assert (=> b!944752 (=> res!634654 e!531282)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!944752 (= res!634654 (not (validMask!0 (mask!27332 thiss!1141))))))

(declare-fun lt!425730 () (_ BitVec 32))

(assert (=> b!944752 (arrayForallSeekEntryOrOpenFound!0 lt!425730 (_keys!10554 thiss!1141) (mask!27332 thiss!1141))))

(declare-datatypes ((Unit!31864 0))(
  ( (Unit!31865) )
))
(declare-fun lt!425732 () Unit!31864)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57120 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!31864)

(assert (=> b!944752 (= lt!425732 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10554 thiss!1141) (mask!27332 thiss!1141) #b00000000000000000000000000000000 lt!425730))))

(declare-fun arrayScanForKey!0 (array!57120 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!944752 (= lt!425730 (arrayScanForKey!0 (_keys!10554 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57120 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!944752 (arrayContainsKey!0 (_keys!10554 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!425731 () Unit!31864)

(declare-fun lemmaKeyInListMapIsInArray!312 (array!57120 array!57118 (_ BitVec 32) (_ BitVec 32) V!32399 V!32399 (_ BitVec 64) Int) Unit!31864)

(assert (=> b!944752 (= lt!425731 (lemmaKeyInListMapIsInArray!312 (_keys!10554 thiss!1141) (_values!5699 thiss!1141) (mask!27332 thiss!1141) (extraKeys!5408 thiss!1141) (zeroValue!5512 thiss!1141) (minValue!5512 thiss!1141) key!756 (defaultEntry!5676 thiss!1141)))))

(declare-fun b!944753 () Bool)

(assert (=> b!944753 (= e!531282 true)))

(declare-fun lt!425733 () SeekEntryResult!9075)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57120 (_ BitVec 32)) SeekEntryResult!9075)

(assert (=> b!944753 (= lt!425733 (seekEntryOrOpen!0 key!756 (_keys!10554 thiss!1141) (mask!27332 thiss!1141)))))

(declare-fun b!944754 () Bool)

(assert (=> b!944754 (= e!531284 (and e!531285 mapRes!32688))))

(declare-fun condMapEmpty!32688 () Bool)

(declare-fun mapDefault!32688 () ValueCell!9806)

