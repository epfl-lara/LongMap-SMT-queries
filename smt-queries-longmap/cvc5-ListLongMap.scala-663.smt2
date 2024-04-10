; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16384 () Bool)

(assert start!16384)

(declare-fun b!163256 () Bool)

(declare-fun b_free!3787 () Bool)

(declare-fun b_next!3787 () Bool)

(assert (=> b!163256 (= b_free!3787 (not b_next!3787))))

(declare-fun tp!13942 () Bool)

(declare-fun b_and!10201 () Bool)

(assert (=> b!163256 (= tp!13942 b_and!10201)))

(declare-fun res!77272 () Bool)

(declare-fun e!107095 () Bool)

(assert (=> start!16384 (=> (not res!77272) (not e!107095))))

(declare-datatypes ((V!4433 0))(
  ( (V!4434 (val!1839 Int)) )
))
(declare-datatypes ((ValueCell!1451 0))(
  ( (ValueCellFull!1451 (v!3704 V!4433)) (EmptyCell!1451) )
))
(declare-datatypes ((array!6263 0))(
  ( (array!6264 (arr!2973 (Array (_ BitVec 32) (_ BitVec 64))) (size!3259 (_ BitVec 32))) )
))
(declare-datatypes ((array!6265 0))(
  ( (array!6266 (arr!2974 (Array (_ BitVec 32) ValueCell!1451)) (size!3260 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1810 0))(
  ( (LongMapFixedSize!1811 (defaultEntry!3347 Int) (mask!7999 (_ BitVec 32)) (extraKeys!3088 (_ BitVec 32)) (zeroValue!3190 V!4433) (minValue!3190 V!4433) (_size!954 (_ BitVec 32)) (_keys!5157 array!6263) (_values!3330 array!6265) (_vacant!954 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1810)

(declare-fun valid!812 (LongMapFixedSize!1810) Bool)

(assert (=> start!16384 (= res!77272 (valid!812 thiss!1248))))

(assert (=> start!16384 e!107095))

(declare-fun e!107097 () Bool)

(assert (=> start!16384 e!107097))

(assert (=> start!16384 true))

(declare-fun b!163252 () Bool)

(declare-fun res!77274 () Bool)

(assert (=> b!163252 (=> (not res!77274) (not e!107095))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!163252 (= res!77274 (not (= key!828 (bvneg key!828))))))

(declare-fun b!163253 () Bool)

(declare-fun e!107096 () Bool)

(assert (=> b!163253 (= e!107096 (and (= (size!3260 (_values!3330 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7999 thiss!1248))) (= (size!3259 (_keys!5157 thiss!1248)) (size!3260 (_values!3330 thiss!1248))) (bvslt (mask!7999 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!163254 () Bool)

(declare-fun res!77273 () Bool)

(assert (=> b!163254 (=> (not res!77273) (not e!107096))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!163254 (= res!77273 (validMask!0 (mask!7999 thiss!1248)))))

(declare-fun b!163255 () Bool)

(declare-fun e!107100 () Bool)

(declare-fun tp_is_empty!3589 () Bool)

(assert (=> b!163255 (= e!107100 tp_is_empty!3589)))

(declare-fun e!107098 () Bool)

(declare-fun array_inv!1901 (array!6263) Bool)

(declare-fun array_inv!1902 (array!6265) Bool)

(assert (=> b!163256 (= e!107097 (and tp!13942 tp_is_empty!3589 (array_inv!1901 (_keys!5157 thiss!1248)) (array_inv!1902 (_values!3330 thiss!1248)) e!107098))))

(declare-fun b!163257 () Bool)

(declare-fun e!107101 () Bool)

(assert (=> b!163257 (= e!107101 tp_is_empty!3589)))

(declare-fun mapNonEmpty!6082 () Bool)

(declare-fun mapRes!6082 () Bool)

(declare-fun tp!13941 () Bool)

(assert (=> mapNonEmpty!6082 (= mapRes!6082 (and tp!13941 e!107101))))

(declare-fun mapKey!6082 () (_ BitVec 32))

(declare-fun mapRest!6082 () (Array (_ BitVec 32) ValueCell!1451))

(declare-fun mapValue!6082 () ValueCell!1451)

(assert (=> mapNonEmpty!6082 (= (arr!2974 (_values!3330 thiss!1248)) (store mapRest!6082 mapKey!6082 mapValue!6082))))

(declare-fun b!163258 () Bool)

(assert (=> b!163258 (= e!107095 e!107096)))

(declare-fun res!77275 () Bool)

(assert (=> b!163258 (=> (not res!77275) (not e!107096))))

(declare-datatypes ((SeekEntryResult!396 0))(
  ( (MissingZero!396 (index!3752 (_ BitVec 32))) (Found!396 (index!3753 (_ BitVec 32))) (Intermediate!396 (undefined!1208 Bool) (index!3754 (_ BitVec 32)) (x!18086 (_ BitVec 32))) (Undefined!396) (MissingVacant!396 (index!3755 (_ BitVec 32))) )
))
(declare-fun lt!82651 () SeekEntryResult!396)

(assert (=> b!163258 (= res!77275 (and (not (is-Undefined!396 lt!82651)) (not (is-MissingVacant!396 lt!82651)) (not (is-MissingZero!396 lt!82651)) (is-Found!396 lt!82651)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6263 (_ BitVec 32)) SeekEntryResult!396)

(assert (=> b!163258 (= lt!82651 (seekEntryOrOpen!0 key!828 (_keys!5157 thiss!1248) (mask!7999 thiss!1248)))))

(declare-fun b!163259 () Bool)

(assert (=> b!163259 (= e!107098 (and e!107100 mapRes!6082))))

(declare-fun condMapEmpty!6082 () Bool)

(declare-fun mapDefault!6082 () ValueCell!1451)

