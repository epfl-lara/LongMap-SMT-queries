; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18140 () Bool)

(assert start!18140)

(declare-fun b!180607 () Bool)

(declare-fun b_free!4465 () Bool)

(declare-fun b_next!4465 () Bool)

(assert (=> b!180607 (= b_free!4465 (not b_next!4465))))

(declare-fun tp!16134 () Bool)

(declare-fun b_and!11001 () Bool)

(assert (=> b!180607 (= tp!16134 b_and!11001)))

(declare-fun b!180606 () Bool)

(declare-fun e!118978 () Bool)

(declare-fun tp_is_empty!4237 () Bool)

(assert (=> b!180606 (= e!118978 tp_is_empty!4237)))

(declare-fun e!118974 () Bool)

(declare-datatypes ((V!5297 0))(
  ( (V!5298 (val!2163 Int)) )
))
(declare-datatypes ((ValueCell!1775 0))(
  ( (ValueCellFull!1775 (v!4057 V!5297)) (EmptyCell!1775) )
))
(declare-datatypes ((array!7649 0))(
  ( (array!7650 (arr!3621 (Array (_ BitVec 32) (_ BitVec 64))) (size!3929 (_ BitVec 32))) )
))
(declare-datatypes ((array!7651 0))(
  ( (array!7652 (arr!3622 (Array (_ BitVec 32) ValueCell!1775)) (size!3930 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2458 0))(
  ( (LongMapFixedSize!2459 (defaultEntry!3706 Int) (mask!8711 (_ BitVec 32)) (extraKeys!3443 (_ BitVec 32)) (zeroValue!3547 V!5297) (minValue!3547 V!5297) (_size!1278 (_ BitVec 32)) (_keys!5600 array!7649) (_values!3689 array!7651) (_vacant!1278 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2458)

(declare-fun e!118980 () Bool)

(declare-fun array_inv!2331 (array!7649) Bool)

(declare-fun array_inv!2332 (array!7651) Bool)

(assert (=> b!180607 (= e!118974 (and tp!16134 tp_is_empty!4237 (array_inv!2331 (_keys!5600 thiss!1248)) (array_inv!2332 (_values!3689 thiss!1248)) e!118980))))

(declare-fun b!180608 () Bool)

(declare-fun e!118977 () Bool)

(declare-fun e!118975 () Bool)

(assert (=> b!180608 (= e!118977 e!118975)))

(declare-fun res!85536 () Bool)

(assert (=> b!180608 (=> (not res!85536) (not e!118975))))

(declare-datatypes ((SeekEntryResult!594 0))(
  ( (MissingZero!594 (index!4546 (_ BitVec 32))) (Found!594 (index!4547 (_ BitVec 32))) (Intermediate!594 (undefined!1406 Bool) (index!4548 (_ BitVec 32)) (x!19746 (_ BitVec 32))) (Undefined!594) (MissingVacant!594 (index!4549 (_ BitVec 32))) )
))
(declare-fun lt!89270 () SeekEntryResult!594)

(assert (=> b!180608 (= res!85536 (and (not (is-Undefined!594 lt!89270)) (not (is-MissingVacant!594 lt!89270)) (not (is-MissingZero!594 lt!89270)) (is-Found!594 lt!89270)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7649 (_ BitVec 32)) SeekEntryResult!594)

(assert (=> b!180608 (= lt!89270 (seekEntryOrOpen!0 key!828 (_keys!5600 thiss!1248) (mask!8711 thiss!1248)))))

(declare-fun b!180609 () Bool)

(declare-fun res!85539 () Bool)

(assert (=> b!180609 (=> (not res!85539) (not e!118977))))

(assert (=> b!180609 (= res!85539 (not (= key!828 (bvneg key!828))))))

(declare-fun b!180610 () Bool)

(declare-fun res!85540 () Bool)

(assert (=> b!180610 (=> (not res!85540) (not e!118975))))

(declare-datatypes ((tuple2!3372 0))(
  ( (tuple2!3373 (_1!1697 (_ BitVec 64)) (_2!1697 V!5297)) )
))
(declare-datatypes ((List!2298 0))(
  ( (Nil!2295) (Cons!2294 (h!2919 tuple2!3372) (t!7148 List!2298)) )
))
(declare-datatypes ((ListLongMap!2289 0))(
  ( (ListLongMap!2290 (toList!1160 List!2298)) )
))
(declare-fun contains!1236 (ListLongMap!2289 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!808 (array!7649 array!7651 (_ BitVec 32) (_ BitVec 32) V!5297 V!5297 (_ BitVec 32) Int) ListLongMap!2289)

(assert (=> b!180610 (= res!85540 (contains!1236 (getCurrentListMap!808 (_keys!5600 thiss!1248) (_values!3689 thiss!1248) (mask!8711 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248)) key!828))))

(declare-fun b!180611 () Bool)

(assert (=> b!180611 (= e!118975 (not (= (size!3930 (_values!3689 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8711 thiss!1248)))))))

(declare-fun b!180612 () Bool)

(declare-fun res!85538 () Bool)

(assert (=> b!180612 (=> (not res!85538) (not e!118975))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!180612 (= res!85538 (validMask!0 (mask!8711 thiss!1248)))))

(declare-fun res!85537 () Bool)

(assert (=> start!18140 (=> (not res!85537) (not e!118977))))

(declare-fun valid!1021 (LongMapFixedSize!2458) Bool)

(assert (=> start!18140 (= res!85537 (valid!1021 thiss!1248))))

(assert (=> start!18140 e!118977))

(assert (=> start!18140 e!118974))

(assert (=> start!18140 true))

(declare-fun mapIsEmpty!7258 () Bool)

(declare-fun mapRes!7258 () Bool)

(assert (=> mapIsEmpty!7258 mapRes!7258))

(declare-fun mapNonEmpty!7258 () Bool)

(declare-fun tp!16135 () Bool)

(declare-fun e!118976 () Bool)

(assert (=> mapNonEmpty!7258 (= mapRes!7258 (and tp!16135 e!118976))))

(declare-fun mapRest!7258 () (Array (_ BitVec 32) ValueCell!1775))

(declare-fun mapValue!7258 () ValueCell!1775)

(declare-fun mapKey!7258 () (_ BitVec 32))

(assert (=> mapNonEmpty!7258 (= (arr!3622 (_values!3689 thiss!1248)) (store mapRest!7258 mapKey!7258 mapValue!7258))))

(declare-fun b!180613 () Bool)

(assert (=> b!180613 (= e!118976 tp_is_empty!4237)))

(declare-fun b!180614 () Bool)

(assert (=> b!180614 (= e!118980 (and e!118978 mapRes!7258))))

(declare-fun condMapEmpty!7258 () Bool)

(declare-fun mapDefault!7258 () ValueCell!1775)

