; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16536 () Bool)

(assert start!16536)

(declare-fun b!164515 () Bool)

(declare-fun b_free!3841 () Bool)

(declare-fun b_next!3841 () Bool)

(assert (=> b!164515 (= b_free!3841 (not b_next!3841))))

(declare-fun tp!14123 () Bool)

(declare-fun b_and!10255 () Bool)

(assert (=> b!164515 (= tp!14123 b_and!10255)))

(declare-fun b!164513 () Bool)

(declare-fun res!77901 () Bool)

(declare-fun e!107939 () Bool)

(assert (=> b!164513 (=> (not res!77901) (not e!107939))))

(declare-datatypes ((V!4505 0))(
  ( (V!4506 (val!1866 Int)) )
))
(declare-datatypes ((ValueCell!1478 0))(
  ( (ValueCellFull!1478 (v!3731 V!4505)) (EmptyCell!1478) )
))
(declare-datatypes ((array!6383 0))(
  ( (array!6384 (arr!3027 (Array (_ BitVec 32) (_ BitVec 64))) (size!3315 (_ BitVec 32))) )
))
(declare-datatypes ((array!6385 0))(
  ( (array!6386 (arr!3028 (Array (_ BitVec 32) ValueCell!1478)) (size!3316 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1864 0))(
  ( (LongMapFixedSize!1865 (defaultEntry!3374 Int) (mask!8067 (_ BitVec 32)) (extraKeys!3115 (_ BitVec 32)) (zeroValue!3217 V!4505) (minValue!3217 V!4505) (_size!981 (_ BitVec 32)) (_keys!5199 array!6383) (_values!3357 array!6385) (_vacant!981 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1864)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!164513 (= res!77901 (validMask!0 (mask!8067 thiss!1248)))))

(declare-fun b!164514 () Bool)

(declare-fun e!107936 () Bool)

(declare-fun tp_is_empty!3643 () Bool)

(assert (=> b!164514 (= e!107936 tp_is_empty!3643)))

(declare-fun e!107937 () Bool)

(declare-fun e!107935 () Bool)

(declare-fun array_inv!1941 (array!6383) Bool)

(declare-fun array_inv!1942 (array!6385) Bool)

(assert (=> b!164515 (= e!107937 (and tp!14123 tp_is_empty!3643 (array_inv!1941 (_keys!5199 thiss!1248)) (array_inv!1942 (_values!3357 thiss!1248)) e!107935))))

(declare-fun b!164516 () Bool)

(declare-fun e!107933 () Bool)

(assert (=> b!164516 (= e!107933 e!107939)))

(declare-fun res!77903 () Bool)

(assert (=> b!164516 (=> (not res!77903) (not e!107939))))

(declare-datatypes ((SeekEntryResult!418 0))(
  ( (MissingZero!418 (index!3840 (_ BitVec 32))) (Found!418 (index!3841 (_ BitVec 32))) (Intermediate!418 (undefined!1230 Bool) (index!3842 (_ BitVec 32)) (x!18246 (_ BitVec 32))) (Undefined!418) (MissingVacant!418 (index!3843 (_ BitVec 32))) )
))
(declare-fun lt!82902 () SeekEntryResult!418)

(assert (=> b!164516 (= res!77903 (and (not (is-Undefined!418 lt!82902)) (not (is-MissingVacant!418 lt!82902)) (not (is-MissingZero!418 lt!82902)) (is-Found!418 lt!82902)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6383 (_ BitVec 32)) SeekEntryResult!418)

(assert (=> b!164516 (= lt!82902 (seekEntryOrOpen!0 key!828 (_keys!5199 thiss!1248) (mask!8067 thiss!1248)))))

(declare-fun b!164517 () Bool)

(declare-fun res!77902 () Bool)

(assert (=> b!164517 (=> (not res!77902) (not e!107939))))

(assert (=> b!164517 (= res!77902 (and (= (size!3316 (_values!3357 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8067 thiss!1248))) (= (size!3315 (_keys!5199 thiss!1248)) (size!3316 (_values!3357 thiss!1248))) (bvsge (mask!8067 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3115 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3115 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!164518 () Bool)

(declare-fun res!77904 () Bool)

(assert (=> b!164518 (=> (not res!77904) (not e!107933))))

(assert (=> b!164518 (= res!77904 (not (= key!828 (bvneg key!828))))))

(declare-fun b!164519 () Bool)

(declare-fun res!77906 () Bool)

(assert (=> b!164519 (=> (not res!77906) (not e!107939))))

(declare-datatypes ((tuple2!3030 0))(
  ( (tuple2!3031 (_1!1526 (_ BitVec 64)) (_2!1526 V!4505)) )
))
(declare-datatypes ((List!2012 0))(
  ( (Nil!2009) (Cons!2008 (h!2625 tuple2!3030) (t!6814 List!2012)) )
))
(declare-datatypes ((ListLongMap!1985 0))(
  ( (ListLongMap!1986 (toList!1008 List!2012)) )
))
(declare-fun contains!1050 (ListLongMap!1985 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!666 (array!6383 array!6385 (_ BitVec 32) (_ BitVec 32) V!4505 V!4505 (_ BitVec 32) Int) ListLongMap!1985)

(assert (=> b!164519 (= res!77906 (contains!1050 (getCurrentListMap!666 (_keys!5199 thiss!1248) (_values!3357 thiss!1248) (mask!8067 thiss!1248) (extraKeys!3115 thiss!1248) (zeroValue!3217 thiss!1248) (minValue!3217 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3374 thiss!1248)) key!828))))

(declare-fun b!164520 () Bool)

(assert (=> b!164520 (= e!107939 false)))

(declare-fun lt!82903 () Bool)

(declare-datatypes ((List!2013 0))(
  ( (Nil!2010) (Cons!2009 (h!2626 (_ BitVec 64)) (t!6815 List!2013)) )
))
(declare-fun arrayNoDuplicates!0 (array!6383 (_ BitVec 32) List!2013) Bool)

(assert (=> b!164520 (= lt!82903 (arrayNoDuplicates!0 (_keys!5199 thiss!1248) #b00000000000000000000000000000000 Nil!2010))))

(declare-fun mapNonEmpty!6183 () Bool)

(declare-fun mapRes!6183 () Bool)

(declare-fun tp!14124 () Bool)

(assert (=> mapNonEmpty!6183 (= mapRes!6183 (and tp!14124 e!107936))))

(declare-fun mapKey!6183 () (_ BitVec 32))

(declare-fun mapRest!6183 () (Array (_ BitVec 32) ValueCell!1478))

(declare-fun mapValue!6183 () ValueCell!1478)

(assert (=> mapNonEmpty!6183 (= (arr!3028 (_values!3357 thiss!1248)) (store mapRest!6183 mapKey!6183 mapValue!6183))))

(declare-fun b!164521 () Bool)

(declare-fun e!107934 () Bool)

(assert (=> b!164521 (= e!107934 tp_is_empty!3643)))

(declare-fun res!77907 () Bool)

(assert (=> start!16536 (=> (not res!77907) (not e!107933))))

(declare-fun valid!830 (LongMapFixedSize!1864) Bool)

(assert (=> start!16536 (= res!77907 (valid!830 thiss!1248))))

(assert (=> start!16536 e!107933))

(assert (=> start!16536 e!107937))

(assert (=> start!16536 true))

(declare-fun mapIsEmpty!6183 () Bool)

(assert (=> mapIsEmpty!6183 mapRes!6183))

(declare-fun b!164522 () Bool)

(assert (=> b!164522 (= e!107935 (and e!107934 mapRes!6183))))

(declare-fun condMapEmpty!6183 () Bool)

(declare-fun mapDefault!6183 () ValueCell!1478)

