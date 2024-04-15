; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16060 () Bool)

(assert start!16060)

(declare-fun b!159185 () Bool)

(declare-fun b_free!3517 () Bool)

(declare-fun b_next!3517 () Bool)

(assert (=> b!159185 (= b_free!3517 (not b_next!3517))))

(declare-fun tp!13120 () Bool)

(declare-fun b_and!9905 () Bool)

(assert (=> b!159185 (= tp!13120 b_and!9905)))

(declare-fun b!159183 () Bool)

(declare-fun e!104200 () Bool)

(declare-fun e!104203 () Bool)

(declare-fun mapRes!5666 () Bool)

(assert (=> b!159183 (= e!104200 (and e!104203 mapRes!5666))))

(declare-fun condMapEmpty!5666 () Bool)

(declare-datatypes ((V!4073 0))(
  ( (V!4074 (val!1704 Int)) )
))
(declare-datatypes ((ValueCell!1316 0))(
  ( (ValueCellFull!1316 (v!3563 V!4073)) (EmptyCell!1316) )
))
(declare-datatypes ((array!5697 0))(
  ( (array!5698 (arr!2692 (Array (_ BitVec 32) (_ BitVec 64))) (size!2977 (_ BitVec 32))) )
))
(declare-datatypes ((array!5699 0))(
  ( (array!5700 (arr!2693 (Array (_ BitVec 32) ValueCell!1316)) (size!2978 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1540 0))(
  ( (LongMapFixedSize!1541 (defaultEntry!3212 Int) (mask!7759 (_ BitVec 32)) (extraKeys!2953 (_ BitVec 32)) (zeroValue!3055 V!4073) (minValue!3055 V!4073) (_size!819 (_ BitVec 32)) (_keys!5012 array!5697) (_values!3195 array!5699) (_vacant!819 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1540)

(declare-fun mapDefault!5666 () ValueCell!1316)

(assert (=> b!159183 (= condMapEmpty!5666 (= (arr!2693 (_values!3195 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1316)) mapDefault!5666)))))

(declare-fun mapIsEmpty!5666 () Bool)

(assert (=> mapIsEmpty!5666 mapRes!5666))

(declare-fun b!159184 () Bool)

(declare-fun tp_is_empty!3319 () Bool)

(assert (=> b!159184 (= e!104203 tp_is_empty!3319)))

(declare-fun e!104199 () Bool)

(declare-fun array_inv!1727 (array!5697) Bool)

(declare-fun array_inv!1728 (array!5699) Bool)

(assert (=> b!159185 (= e!104199 (and tp!13120 tp_is_empty!3319 (array_inv!1727 (_keys!5012 thiss!1248)) (array_inv!1728 (_values!3195 thiss!1248)) e!104200))))

(declare-fun b!159186 () Bool)

(declare-fun res!75168 () Bool)

(declare-fun e!104198 () Bool)

(assert (=> b!159186 (=> (not res!75168) (not e!104198))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5697 (_ BitVec 32)) Bool)

(assert (=> b!159186 (= res!75168 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5012 thiss!1248) (mask!7759 thiss!1248)))))

(declare-fun b!159187 () Bool)

(declare-fun res!75169 () Bool)

(assert (=> b!159187 (=> (not res!75169) (not e!104198))))

(declare-fun key!828 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!315 0))(
  ( (MissingZero!315 (index!3428 (_ BitVec 32))) (Found!315 (index!3429 (_ BitVec 32))) (Intermediate!315 (undefined!1127 Bool) (index!3430 (_ BitVec 32)) (x!17602 (_ BitVec 32))) (Undefined!315) (MissingVacant!315 (index!3431 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5697 (_ BitVec 32)) SeekEntryResult!315)

(assert (=> b!159187 (= res!75169 ((_ is Undefined!315) (seekEntryOrOpen!0 key!828 (_keys!5012 thiss!1248) (mask!7759 thiss!1248))))))

(declare-fun res!75171 () Bool)

(assert (=> start!16060 (=> (not res!75171) (not e!104198))))

(declare-fun valid!725 (LongMapFixedSize!1540) Bool)

(assert (=> start!16060 (= res!75171 (valid!725 thiss!1248))))

(assert (=> start!16060 e!104198))

(assert (=> start!16060 e!104199))

(assert (=> start!16060 true))

(declare-fun b!159188 () Bool)

(declare-fun res!75165 () Bool)

(assert (=> b!159188 (=> (not res!75165) (not e!104198))))

(declare-datatypes ((tuple2!2848 0))(
  ( (tuple2!2849 (_1!1435 (_ BitVec 64)) (_2!1435 V!4073)) )
))
(declare-datatypes ((List!1899 0))(
  ( (Nil!1896) (Cons!1895 (h!2508 tuple2!2848) (t!6692 List!1899)) )
))
(declare-datatypes ((ListLongMap!1835 0))(
  ( (ListLongMap!1836 (toList!933 List!1899)) )
))
(declare-fun contains!972 (ListLongMap!1835 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!583 (array!5697 array!5699 (_ BitVec 32) (_ BitVec 32) V!4073 V!4073 (_ BitVec 32) Int) ListLongMap!1835)

(assert (=> b!159188 (= res!75165 (contains!972 (getCurrentListMap!583 (_keys!5012 thiss!1248) (_values!3195 thiss!1248) (mask!7759 thiss!1248) (extraKeys!2953 thiss!1248) (zeroValue!3055 thiss!1248) (minValue!3055 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3212 thiss!1248)) key!828))))

(declare-fun b!159189 () Bool)

(declare-fun res!75170 () Bool)

(assert (=> b!159189 (=> (not res!75170) (not e!104198))))

(assert (=> b!159189 (= res!75170 (and (= (size!2978 (_values!3195 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7759 thiss!1248))) (= (size!2977 (_keys!5012 thiss!1248)) (size!2978 (_values!3195 thiss!1248))) (bvsge (mask!7759 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2953 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2953 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!159190 () Bool)

(declare-fun res!75167 () Bool)

(assert (=> b!159190 (=> (not res!75167) (not e!104198))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!159190 (= res!75167 (validMask!0 (mask!7759 thiss!1248)))))

(declare-fun b!159191 () Bool)

(declare-fun res!75166 () Bool)

(assert (=> b!159191 (=> (not res!75166) (not e!104198))))

(assert (=> b!159191 (= res!75166 (not (= key!828 (bvneg key!828))))))

(declare-fun b!159192 () Bool)

(assert (=> b!159192 (= e!104198 false)))

(declare-fun lt!81807 () Bool)

(declare-datatypes ((List!1900 0))(
  ( (Nil!1897) (Cons!1896 (h!2509 (_ BitVec 64)) (t!6693 List!1900)) )
))
(declare-fun arrayNoDuplicates!0 (array!5697 (_ BitVec 32) List!1900) Bool)

(assert (=> b!159192 (= lt!81807 (arrayNoDuplicates!0 (_keys!5012 thiss!1248) #b00000000000000000000000000000000 Nil!1897))))

(declare-fun mapNonEmpty!5666 () Bool)

(declare-fun tp!13121 () Bool)

(declare-fun e!104202 () Bool)

(assert (=> mapNonEmpty!5666 (= mapRes!5666 (and tp!13121 e!104202))))

(declare-fun mapRest!5666 () (Array (_ BitVec 32) ValueCell!1316))

(declare-fun mapValue!5666 () ValueCell!1316)

(declare-fun mapKey!5666 () (_ BitVec 32))

(assert (=> mapNonEmpty!5666 (= (arr!2693 (_values!3195 thiss!1248)) (store mapRest!5666 mapKey!5666 mapValue!5666))))

(declare-fun b!159193 () Bool)

(assert (=> b!159193 (= e!104202 tp_is_empty!3319)))

(assert (= (and start!16060 res!75171) b!159191))

(assert (= (and b!159191 res!75166) b!159187))

(assert (= (and b!159187 res!75169) b!159188))

(assert (= (and b!159188 res!75165) b!159190))

(assert (= (and b!159190 res!75167) b!159189))

(assert (= (and b!159189 res!75170) b!159186))

(assert (= (and b!159186 res!75168) b!159192))

(assert (= (and b!159183 condMapEmpty!5666) mapIsEmpty!5666))

(assert (= (and b!159183 (not condMapEmpty!5666)) mapNonEmpty!5666))

(assert (= (and mapNonEmpty!5666 ((_ is ValueCellFull!1316) mapValue!5666)) b!159193))

(assert (= (and b!159183 ((_ is ValueCellFull!1316) mapDefault!5666)) b!159184))

(assert (= b!159185 b!159183))

(assert (= start!16060 b!159185))

(declare-fun m!191017 () Bool)

(assert (=> b!159185 m!191017))

(declare-fun m!191019 () Bool)

(assert (=> b!159185 m!191019))

(declare-fun m!191021 () Bool)

(assert (=> start!16060 m!191021))

(declare-fun m!191023 () Bool)

(assert (=> mapNonEmpty!5666 m!191023))

(declare-fun m!191025 () Bool)

(assert (=> b!159187 m!191025))

(declare-fun m!191027 () Bool)

(assert (=> b!159192 m!191027))

(declare-fun m!191029 () Bool)

(assert (=> b!159188 m!191029))

(assert (=> b!159188 m!191029))

(declare-fun m!191031 () Bool)

(assert (=> b!159188 m!191031))

(declare-fun m!191033 () Bool)

(assert (=> b!159186 m!191033))

(declare-fun m!191035 () Bool)

(assert (=> b!159190 m!191035))

(check-sat (not b_next!3517) (not b!159185) b_and!9905 (not start!16060) (not b!159192) (not b!159187) tp_is_empty!3319 (not b!159186) (not b!159188) (not b!159190) (not mapNonEmpty!5666))
(check-sat b_and!9905 (not b_next!3517))
