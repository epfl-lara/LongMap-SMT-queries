; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17992 () Bool)

(assert start!17992)

(declare-fun b!179157 () Bool)

(declare-fun b_free!4417 () Bool)

(declare-fun b_next!4417 () Bool)

(assert (=> b!179157 (= b_free!4417 (not b_next!4417))))

(declare-fun tp!15972 () Bool)

(declare-fun b_and!10945 () Bool)

(assert (=> b!179157 (= tp!15972 b_and!10945)))

(declare-fun b!179151 () Bool)

(declare-fun e!118047 () Bool)

(declare-datatypes ((V!5233 0))(
  ( (V!5234 (val!2139 Int)) )
))
(declare-datatypes ((ValueCell!1751 0))(
  ( (ValueCellFull!1751 (v!4025 V!5233)) (EmptyCell!1751) )
))
(declare-datatypes ((array!7541 0))(
  ( (array!7542 (arr!3573 (Array (_ BitVec 32) (_ BitVec 64))) (size!3881 (_ BitVec 32))) )
))
(declare-datatypes ((array!7543 0))(
  ( (array!7544 (arr!3574 (Array (_ BitVec 32) ValueCell!1751)) (size!3882 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2410 0))(
  ( (LongMapFixedSize!2411 (defaultEntry!3678 Int) (mask!8654 (_ BitVec 32)) (extraKeys!3415 (_ BitVec 32)) (zeroValue!3519 V!5233) (minValue!3519 V!5233) (_size!1254 (_ BitVec 32)) (_keys!5563 array!7541) (_values!3661 array!7543) (_vacant!1254 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2410)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7541 (_ BitVec 32)) Bool)

(assert (=> b!179151 (= e!118047 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5563 thiss!1248) (mask!8654 thiss!1248))))))

(declare-fun b!179152 () Bool)

(declare-fun res!84847 () Bool)

(assert (=> b!179152 (=> (not res!84847) (not e!118047))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!179152 (= res!84847 (validMask!0 (mask!8654 thiss!1248)))))

(declare-fun b!179153 () Bool)

(declare-fun res!84845 () Bool)

(assert (=> b!179153 (=> (not res!84845) (not e!118047))))

(assert (=> b!179153 (= res!84845 (and (= (size!3882 (_values!3661 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8654 thiss!1248))) (= (size!3881 (_keys!5563 thiss!1248)) (size!3882 (_values!3661 thiss!1248))) (bvsge (mask!8654 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3415 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3415 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!179154 () Bool)

(declare-fun res!84850 () Bool)

(assert (=> b!179154 (=> (not res!84850) (not e!118047))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!179154 (= res!84850 (not (= key!828 (bvneg key!828))))))

(declare-fun res!84846 () Bool)

(assert (=> start!17992 (=> (not res!84846) (not e!118047))))

(declare-fun valid!1008 (LongMapFixedSize!2410) Bool)

(assert (=> start!17992 (= res!84846 (valid!1008 thiss!1248))))

(assert (=> start!17992 e!118047))

(declare-fun e!118048 () Bool)

(assert (=> start!17992 e!118048))

(assert (=> start!17992 true))

(declare-fun b!179155 () Bool)

(declare-fun e!118045 () Bool)

(declare-fun tp_is_empty!4189 () Bool)

(assert (=> b!179155 (= e!118045 tp_is_empty!4189)))

(declare-fun b!179156 () Bool)

(declare-fun res!84848 () Bool)

(assert (=> b!179156 (=> (not res!84848) (not e!118047))))

(declare-datatypes ((tuple2!3324 0))(
  ( (tuple2!3325 (_1!1673 (_ BitVec 64)) (_2!1673 V!5233)) )
))
(declare-datatypes ((List!2269 0))(
  ( (Nil!2266) (Cons!2265 (h!2890 tuple2!3324) (t!7111 List!2269)) )
))
(declare-datatypes ((ListLongMap!2251 0))(
  ( (ListLongMap!2252 (toList!1141 List!2269)) )
))
(declare-fun contains!1215 (ListLongMap!2251 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!793 (array!7541 array!7543 (_ BitVec 32) (_ BitVec 32) V!5233 V!5233 (_ BitVec 32) Int) ListLongMap!2251)

(assert (=> b!179156 (= res!84848 (not (contains!1215 (getCurrentListMap!793 (_keys!5563 thiss!1248) (_values!3661 thiss!1248) (mask!8654 thiss!1248) (extraKeys!3415 thiss!1248) (zeroValue!3519 thiss!1248) (minValue!3519 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3678 thiss!1248)) key!828)))))

(declare-fun e!118044 () Bool)

(declare-fun array_inv!2299 (array!7541) Bool)

(declare-fun array_inv!2300 (array!7543) Bool)

(assert (=> b!179157 (= e!118048 (and tp!15972 tp_is_empty!4189 (array_inv!2299 (_keys!5563 thiss!1248)) (array_inv!2300 (_values!3661 thiss!1248)) e!118044))))

(declare-fun b!179158 () Bool)

(declare-fun e!118046 () Bool)

(assert (=> b!179158 (= e!118046 tp_is_empty!4189)))

(declare-fun mapNonEmpty!7168 () Bool)

(declare-fun mapRes!7168 () Bool)

(declare-fun tp!15973 () Bool)

(assert (=> mapNonEmpty!7168 (= mapRes!7168 (and tp!15973 e!118046))))

(declare-fun mapRest!7168 () (Array (_ BitVec 32) ValueCell!1751))

(declare-fun mapKey!7168 () (_ BitVec 32))

(declare-fun mapValue!7168 () ValueCell!1751)

(assert (=> mapNonEmpty!7168 (= (arr!3574 (_values!3661 thiss!1248)) (store mapRest!7168 mapKey!7168 mapValue!7168))))

(declare-fun b!179159 () Bool)

(declare-fun res!84849 () Bool)

(assert (=> b!179159 (=> (not res!84849) (not e!118047))))

(declare-datatypes ((SeekEntryResult!579 0))(
  ( (MissingZero!579 (index!4484 (_ BitVec 32))) (Found!579 (index!4485 (_ BitVec 32))) (Intermediate!579 (undefined!1391 Bool) (index!4486 (_ BitVec 32)) (x!19599 (_ BitVec 32))) (Undefined!579) (MissingVacant!579 (index!4487 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7541 (_ BitVec 32)) SeekEntryResult!579)

(assert (=> b!179159 (= res!84849 (is-Undefined!579 (seekEntryOrOpen!0 key!828 (_keys!5563 thiss!1248) (mask!8654 thiss!1248))))))

(declare-fun b!179160 () Bool)

(assert (=> b!179160 (= e!118044 (and e!118045 mapRes!7168))))

(declare-fun condMapEmpty!7168 () Bool)

(declare-fun mapDefault!7168 () ValueCell!1751)

