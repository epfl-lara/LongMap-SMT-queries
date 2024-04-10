; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17724 () Bool)

(assert start!17724)

(declare-fun b!177188 () Bool)

(declare-fun b_free!4377 () Bool)

(declare-fun b_next!4377 () Bool)

(assert (=> b!177188 (= b_free!4377 (not b_next!4377))))

(declare-fun tp!15830 () Bool)

(declare-fun b_and!10877 () Bool)

(assert (=> b!177188 (= tp!15830 b_and!10877)))

(declare-fun b!177184 () Bool)

(declare-fun e!116842 () Bool)

(declare-fun tp_is_empty!4149 () Bool)

(assert (=> b!177184 (= e!116842 tp_is_empty!4149)))

(declare-fun mapIsEmpty!7086 () Bool)

(declare-fun mapRes!7086 () Bool)

(assert (=> mapIsEmpty!7086 mapRes!7086))

(declare-fun res!83991 () Bool)

(declare-fun e!116845 () Bool)

(assert (=> start!17724 (=> (not res!83991) (not e!116845))))

(declare-datatypes ((V!5179 0))(
  ( (V!5180 (val!2119 Int)) )
))
(declare-datatypes ((ValueCell!1731 0))(
  ( (ValueCellFull!1731 (v!3999 V!5179)) (EmptyCell!1731) )
))
(declare-datatypes ((array!7449 0))(
  ( (array!7450 (arr!3533 (Array (_ BitVec 32) (_ BitVec 64))) (size!3837 (_ BitVec 32))) )
))
(declare-datatypes ((array!7451 0))(
  ( (array!7452 (arr!3534 (Array (_ BitVec 32) ValueCell!1731)) (size!3838 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2370 0))(
  ( (LongMapFixedSize!2371 (defaultEntry!3648 Int) (mask!8582 (_ BitVec 32)) (extraKeys!3385 (_ BitVec 32)) (zeroValue!3489 V!5179) (minValue!3489 V!5179) (_size!1234 (_ BitVec 32)) (_keys!5515 array!7449) (_values!3631 array!7451) (_vacant!1234 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2370)

(declare-fun valid!994 (LongMapFixedSize!2370) Bool)

(assert (=> start!17724 (= res!83991 (valid!994 thiss!1248))))

(assert (=> start!17724 e!116845))

(declare-fun e!116843 () Bool)

(assert (=> start!17724 e!116843))

(assert (=> start!17724 true))

(declare-fun b!177185 () Bool)

(declare-fun res!83990 () Bool)

(assert (=> b!177185 (=> (not res!83990) (not e!116845))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3300 0))(
  ( (tuple2!3301 (_1!1661 (_ BitVec 64)) (_2!1661 V!5179)) )
))
(declare-datatypes ((List!2251 0))(
  ( (Nil!2248) (Cons!2247 (h!2868 tuple2!3300) (t!7081 List!2251)) )
))
(declare-datatypes ((ListLongMap!2227 0))(
  ( (ListLongMap!2228 (toList!1129 List!2251)) )
))
(declare-fun contains!1195 (ListLongMap!2227 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!781 (array!7449 array!7451 (_ BitVec 32) (_ BitVec 32) V!5179 V!5179 (_ BitVec 32) Int) ListLongMap!2227)

(assert (=> b!177185 (= res!83990 (contains!1195 (getCurrentListMap!781 (_keys!5515 thiss!1248) (_values!3631 thiss!1248) (mask!8582 thiss!1248) (extraKeys!3385 thiss!1248) (zeroValue!3489 thiss!1248) (minValue!3489 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3648 thiss!1248)) key!828))))

(declare-fun b!177186 () Bool)

(declare-fun e!116846 () Bool)

(assert (=> b!177186 (= e!116846 tp_is_empty!4149)))

(declare-fun b!177187 () Bool)

(assert (=> b!177187 (= e!116845 (not true))))

(assert (=> b!177187 false))

(declare-datatypes ((Unit!5416 0))(
  ( (Unit!5417) )
))
(declare-fun lt!87582 () Unit!5416)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!136 (array!7449 array!7451 (_ BitVec 32) (_ BitVec 32) V!5179 V!5179 (_ BitVec 64) Int) Unit!5416)

(assert (=> b!177187 (= lt!87582 (lemmaInListMapThenSeekEntryOrOpenFindsIt!136 (_keys!5515 thiss!1248) (_values!3631 thiss!1248) (mask!8582 thiss!1248) (extraKeys!3385 thiss!1248) (zeroValue!3489 thiss!1248) (minValue!3489 thiss!1248) key!828 (defaultEntry!3648 thiss!1248)))))

(declare-fun e!116841 () Bool)

(declare-fun array_inv!2265 (array!7449) Bool)

(declare-fun array_inv!2266 (array!7451) Bool)

(assert (=> b!177188 (= e!116843 (and tp!15830 tp_is_empty!4149 (array_inv!2265 (_keys!5515 thiss!1248)) (array_inv!2266 (_values!3631 thiss!1248)) e!116841))))

(declare-fun mapNonEmpty!7086 () Bool)

(declare-fun tp!15831 () Bool)

(assert (=> mapNonEmpty!7086 (= mapRes!7086 (and tp!15831 e!116846))))

(declare-fun mapKey!7086 () (_ BitVec 32))

(declare-fun mapRest!7086 () (Array (_ BitVec 32) ValueCell!1731))

(declare-fun mapValue!7086 () ValueCell!1731)

(assert (=> mapNonEmpty!7086 (= (arr!3534 (_values!3631 thiss!1248)) (store mapRest!7086 mapKey!7086 mapValue!7086))))

(declare-fun b!177189 () Bool)

(declare-fun res!83992 () Bool)

(assert (=> b!177189 (=> (not res!83992) (not e!116845))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!564 0))(
  ( (MissingZero!564 (index!4424 (_ BitVec 32))) (Found!564 (index!4425 (_ BitVec 32))) (Intermediate!564 (undefined!1376 Bool) (index!4426 (_ BitVec 32)) (x!19436 (_ BitVec 32))) (Undefined!564) (MissingVacant!564 (index!4427 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7449 (_ BitVec 32)) SeekEntryResult!564)

(assert (=> b!177189 (= res!83992 ((_ is Undefined!564) (seekEntryOrOpen!0 key!828 (_keys!5515 thiss!1248) (mask!8582 thiss!1248))))))

(declare-fun b!177190 () Bool)

(declare-fun res!83993 () Bool)

(assert (=> b!177190 (=> (not res!83993) (not e!116845))))

(assert (=> b!177190 (= res!83993 (not (= key!828 (bvneg key!828))))))

(declare-fun b!177191 () Bool)

(assert (=> b!177191 (= e!116841 (and e!116842 mapRes!7086))))

(declare-fun condMapEmpty!7086 () Bool)

(declare-fun mapDefault!7086 () ValueCell!1731)

(assert (=> b!177191 (= condMapEmpty!7086 (= (arr!3534 (_values!3631 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1731)) mapDefault!7086)))))

(assert (= (and start!17724 res!83991) b!177190))

(assert (= (and b!177190 res!83993) b!177189))

(assert (= (and b!177189 res!83992) b!177185))

(assert (= (and b!177185 res!83990) b!177187))

(assert (= (and b!177191 condMapEmpty!7086) mapIsEmpty!7086))

(assert (= (and b!177191 (not condMapEmpty!7086)) mapNonEmpty!7086))

(assert (= (and mapNonEmpty!7086 ((_ is ValueCellFull!1731) mapValue!7086)) b!177186))

(assert (= (and b!177191 ((_ is ValueCellFull!1731) mapDefault!7086)) b!177184))

(assert (= b!177188 b!177191))

(assert (= start!17724 b!177188))

(declare-fun m!205761 () Bool)

(assert (=> start!17724 m!205761))

(declare-fun m!205763 () Bool)

(assert (=> b!177185 m!205763))

(assert (=> b!177185 m!205763))

(declare-fun m!205765 () Bool)

(assert (=> b!177185 m!205765))

(declare-fun m!205767 () Bool)

(assert (=> b!177188 m!205767))

(declare-fun m!205769 () Bool)

(assert (=> b!177188 m!205769))

(declare-fun m!205771 () Bool)

(assert (=> b!177187 m!205771))

(declare-fun m!205773 () Bool)

(assert (=> b!177189 m!205773))

(declare-fun m!205775 () Bool)

(assert (=> mapNonEmpty!7086 m!205775))

(check-sat (not b!177187) (not b!177185) (not start!17724) tp_is_empty!4149 (not mapNonEmpty!7086) (not b_next!4377) (not b!177188) (not b!177189) b_and!10877)
(check-sat b_and!10877 (not b_next!4377))
