; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16570 () Bool)

(assert start!16570)

(declare-fun b!164863 () Bool)

(declare-fun b_free!3871 () Bool)

(declare-fun b_next!3871 () Bool)

(assert (=> b!164863 (= b_free!3871 (not b_next!3871))))

(declare-fun tp!14213 () Bool)

(declare-fun b_and!10259 () Bool)

(assert (=> b!164863 (= tp!14213 b_and!10259)))

(declare-fun b!164861 () Bool)

(declare-fun res!78121 () Bool)

(declare-fun e!108150 () Bool)

(assert (=> b!164861 (=> (not res!78121) (not e!108150))))

(declare-datatypes ((V!4545 0))(
  ( (V!4546 (val!1881 Int)) )
))
(declare-datatypes ((ValueCell!1493 0))(
  ( (ValueCellFull!1493 (v!3740 V!4545)) (EmptyCell!1493) )
))
(declare-datatypes ((array!6423 0))(
  ( (array!6424 (arr!3046 (Array (_ BitVec 32) (_ BitVec 64))) (size!3335 (_ BitVec 32))) )
))
(declare-datatypes ((array!6425 0))(
  ( (array!6426 (arr!3047 (Array (_ BitVec 32) ValueCell!1493)) (size!3336 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1894 0))(
  ( (LongMapFixedSize!1895 (defaultEntry!3389 Int) (mask!8091 (_ BitVec 32)) (extraKeys!3130 (_ BitVec 32)) (zeroValue!3232 V!4545) (minValue!3232 V!4545) (_size!996 (_ BitVec 32)) (_keys!5213 array!6423) (_values!3372 array!6425) (_vacant!996 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1894)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3040 0))(
  ( (tuple2!3041 (_1!1531 (_ BitVec 64)) (_2!1531 V!4545)) )
))
(declare-datatypes ((List!2040 0))(
  ( (Nil!2037) (Cons!2036 (h!2653 tuple2!3040) (t!6833 List!2040)) )
))
(declare-datatypes ((ListLongMap!1983 0))(
  ( (ListLongMap!1984 (toList!1007 List!2040)) )
))
(declare-fun contains!1052 (ListLongMap!1983 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!649 (array!6423 array!6425 (_ BitVec 32) (_ BitVec 32) V!4545 V!4545 (_ BitVec 32) Int) ListLongMap!1983)

(assert (=> b!164861 (= res!78121 (contains!1052 (getCurrentListMap!649 (_keys!5213 thiss!1248) (_values!3372 thiss!1248) (mask!8091 thiss!1248) (extraKeys!3130 thiss!1248) (zeroValue!3232 thiss!1248) (minValue!3232 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3389 thiss!1248)) key!828))))

(declare-fun b!164862 () Bool)

(declare-fun e!108149 () Bool)

(assert (=> b!164862 (= e!108149 e!108150)))

(declare-fun res!78125 () Bool)

(assert (=> b!164862 (=> (not res!78125) (not e!108150))))

(declare-datatypes ((SeekEntryResult!437 0))(
  ( (MissingZero!437 (index!3916 (_ BitVec 32))) (Found!437 (index!3917 (_ BitVec 32))) (Intermediate!437 (undefined!1249 Bool) (index!3918 (_ BitVec 32)) (x!18304 (_ BitVec 32))) (Undefined!437) (MissingVacant!437 (index!3919 (_ BitVec 32))) )
))
(declare-fun lt!82811 () SeekEntryResult!437)

(get-info :version)

(assert (=> b!164862 (= res!78125 (and (not ((_ is Undefined!437) lt!82811)) (not ((_ is MissingVacant!437) lt!82811)) (not ((_ is MissingZero!437) lt!82811)) ((_ is Found!437) lt!82811)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6423 (_ BitVec 32)) SeekEntryResult!437)

(assert (=> b!164862 (= lt!82811 (seekEntryOrOpen!0 key!828 (_keys!5213 thiss!1248) (mask!8091 thiss!1248)))))

(declare-fun res!78124 () Bool)

(assert (=> start!16570 (=> (not res!78124) (not e!108149))))

(declare-fun valid!846 (LongMapFixedSize!1894) Bool)

(assert (=> start!16570 (= res!78124 (valid!846 thiss!1248))))

(assert (=> start!16570 e!108149))

(declare-fun e!108147 () Bool)

(assert (=> start!16570 e!108147))

(assert (=> start!16570 true))

(declare-fun e!108151 () Bool)

(declare-fun tp_is_empty!3673 () Bool)

(declare-fun array_inv!1959 (array!6423) Bool)

(declare-fun array_inv!1960 (array!6425) Bool)

(assert (=> b!164863 (= e!108147 (and tp!14213 tp_is_empty!3673 (array_inv!1959 (_keys!5213 thiss!1248)) (array_inv!1960 (_values!3372 thiss!1248)) e!108151))))

(declare-fun b!164864 () Bool)

(declare-fun res!78127 () Bool)

(assert (=> b!164864 (=> (not res!78127) (not e!108149))))

(assert (=> b!164864 (= res!78127 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!6228 () Bool)

(declare-fun mapRes!6228 () Bool)

(assert (=> mapIsEmpty!6228 mapRes!6228))

(declare-fun b!164865 () Bool)

(assert (=> b!164865 (= e!108150 false)))

(declare-fun lt!82812 () Bool)

(declare-datatypes ((List!2041 0))(
  ( (Nil!2038) (Cons!2037 (h!2654 (_ BitVec 64)) (t!6834 List!2041)) )
))
(declare-fun arrayNoDuplicates!0 (array!6423 (_ BitVec 32) List!2041) Bool)

(assert (=> b!164865 (= lt!82812 (arrayNoDuplicates!0 (_keys!5213 thiss!1248) #b00000000000000000000000000000000 Nil!2038))))

(declare-fun b!164866 () Bool)

(declare-fun res!78126 () Bool)

(assert (=> b!164866 (=> (not res!78126) (not e!108150))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6423 (_ BitVec 32)) Bool)

(assert (=> b!164866 (= res!78126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5213 thiss!1248) (mask!8091 thiss!1248)))))

(declare-fun mapNonEmpty!6228 () Bool)

(declare-fun tp!14214 () Bool)

(declare-fun e!108152 () Bool)

(assert (=> mapNonEmpty!6228 (= mapRes!6228 (and tp!14214 e!108152))))

(declare-fun mapKey!6228 () (_ BitVec 32))

(declare-fun mapValue!6228 () ValueCell!1493)

(declare-fun mapRest!6228 () (Array (_ BitVec 32) ValueCell!1493))

(assert (=> mapNonEmpty!6228 (= (arr!3047 (_values!3372 thiss!1248)) (store mapRest!6228 mapKey!6228 mapValue!6228))))

(declare-fun b!164867 () Bool)

(declare-fun e!108153 () Bool)

(assert (=> b!164867 (= e!108151 (and e!108153 mapRes!6228))))

(declare-fun condMapEmpty!6228 () Bool)

(declare-fun mapDefault!6228 () ValueCell!1493)

(assert (=> b!164867 (= condMapEmpty!6228 (= (arr!3047 (_values!3372 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1493)) mapDefault!6228)))))

(declare-fun b!164868 () Bool)

(assert (=> b!164868 (= e!108153 tp_is_empty!3673)))

(declare-fun b!164869 () Bool)

(declare-fun res!78123 () Bool)

(assert (=> b!164869 (=> (not res!78123) (not e!108150))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!164869 (= res!78123 (validMask!0 (mask!8091 thiss!1248)))))

(declare-fun b!164870 () Bool)

(declare-fun res!78122 () Bool)

(assert (=> b!164870 (=> (not res!78122) (not e!108150))))

(assert (=> b!164870 (= res!78122 (and (= (size!3336 (_values!3372 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8091 thiss!1248))) (= (size!3335 (_keys!5213 thiss!1248)) (size!3336 (_values!3372 thiss!1248))) (bvsge (mask!8091 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3130 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3130 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!164871 () Bool)

(assert (=> b!164871 (= e!108152 tp_is_empty!3673)))

(assert (= (and start!16570 res!78124) b!164864))

(assert (= (and b!164864 res!78127) b!164862))

(assert (= (and b!164862 res!78125) b!164861))

(assert (= (and b!164861 res!78121) b!164869))

(assert (= (and b!164869 res!78123) b!164870))

(assert (= (and b!164870 res!78122) b!164866))

(assert (= (and b!164866 res!78126) b!164865))

(assert (= (and b!164867 condMapEmpty!6228) mapIsEmpty!6228))

(assert (= (and b!164867 (not condMapEmpty!6228)) mapNonEmpty!6228))

(assert (= (and mapNonEmpty!6228 ((_ is ValueCellFull!1493) mapValue!6228)) b!164871))

(assert (= (and b!164867 ((_ is ValueCellFull!1493) mapDefault!6228)) b!164868))

(assert (= b!164863 b!164867))

(assert (= start!16570 b!164863))

(declare-fun m!194371 () Bool)

(assert (=> start!16570 m!194371))

(declare-fun m!194373 () Bool)

(assert (=> mapNonEmpty!6228 m!194373))

(declare-fun m!194375 () Bool)

(assert (=> b!164866 m!194375))

(declare-fun m!194377 () Bool)

(assert (=> b!164863 m!194377))

(declare-fun m!194379 () Bool)

(assert (=> b!164863 m!194379))

(declare-fun m!194381 () Bool)

(assert (=> b!164861 m!194381))

(assert (=> b!164861 m!194381))

(declare-fun m!194383 () Bool)

(assert (=> b!164861 m!194383))

(declare-fun m!194385 () Bool)

(assert (=> b!164862 m!194385))

(declare-fun m!194387 () Bool)

(assert (=> b!164865 m!194387))

(declare-fun m!194389 () Bool)

(assert (=> b!164869 m!194389))

(check-sat (not b!164869) (not mapNonEmpty!6228) (not b!164863) b_and!10259 (not b_next!3871) (not b!164861) (not b!164866) (not b!164865) (not b!164862) (not start!16570) tp_is_empty!3673)
(check-sat b_and!10259 (not b_next!3871))
