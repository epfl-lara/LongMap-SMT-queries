; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76312 () Bool)

(assert start!76312)

(declare-fun b!895592 () Bool)

(declare-fun b_free!15913 () Bool)

(declare-fun b_next!15913 () Bool)

(assert (=> b!895592 (= b_free!15913 (not b_next!15913))))

(declare-fun tp!55752 () Bool)

(declare-fun b_and!26205 () Bool)

(assert (=> b!895592 (= tp!55752 b_and!26205)))

(declare-fun b!895589 () Bool)

(declare-fun res!605775 () Bool)

(declare-fun e!500420 () Bool)

(assert (=> b!895589 (=> (not res!605775) (not e!500420))))

(declare-datatypes ((array!52486 0))(
  ( (array!52487 (arr!25237 (Array (_ BitVec 32) (_ BitVec 64))) (size!25687 (_ BitVec 32))) )
))
(declare-datatypes ((V!29287 0))(
  ( (V!29288 (val!9171 Int)) )
))
(declare-datatypes ((ValueCell!8639 0))(
  ( (ValueCellFull!8639 (v!11661 V!29287)) (EmptyCell!8639) )
))
(declare-datatypes ((array!52488 0))(
  ( (array!52489 (arr!25238 (Array (_ BitVec 32) ValueCell!8639)) (size!25688 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4294 0))(
  ( (LongMapFixedSize!4295 (defaultEntry!5359 Int) (mask!25963 (_ BitVec 32)) (extraKeys!5055 (_ BitVec 32)) (zeroValue!5159 V!29287) (minValue!5159 V!29287) (_size!2202 (_ BitVec 32)) (_keys!10076 array!52486) (_values!5346 array!52488) (_vacant!2202 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4294)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52486 (_ BitVec 32)) Bool)

(assert (=> b!895589 (= res!605775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10076 thiss!1181) (mask!25963 thiss!1181)))))

(declare-fun b!895590 () Bool)

(declare-datatypes ((List!17814 0))(
  ( (Nil!17811) (Cons!17810 (h!18947 (_ BitVec 64)) (t!25153 List!17814)) )
))
(declare-fun arrayNoDuplicates!0 (array!52486 (_ BitVec 32) List!17814) Bool)

(assert (=> b!895590 (= e!500420 (not (arrayNoDuplicates!0 (_keys!10076 thiss!1181) #b00000000000000000000000000000000 Nil!17811)))))

(declare-fun b!895591 () Bool)

(declare-fun e!500416 () Bool)

(declare-fun tp_is_empty!18241 () Bool)

(assert (=> b!895591 (= e!500416 tp_is_empty!18241)))

(declare-fun e!500418 () Bool)

(declare-fun e!500414 () Bool)

(declare-fun array_inv!19816 (array!52486) Bool)

(declare-fun array_inv!19817 (array!52488) Bool)

(assert (=> b!895592 (= e!500414 (and tp!55752 tp_is_empty!18241 (array_inv!19816 (_keys!10076 thiss!1181)) (array_inv!19817 (_values!5346 thiss!1181)) e!500418))))

(declare-fun b!895593 () Bool)

(declare-fun e!500419 () Bool)

(assert (=> b!895593 (= e!500419 e!500420)))

(declare-fun res!605773 () Bool)

(assert (=> b!895593 (=> (not res!605773) (not e!500420))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!895593 (= res!605773 (validMask!0 (mask!25963 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8883 0))(
  ( (MissingZero!8883 (index!37903 (_ BitVec 32))) (Found!8883 (index!37904 (_ BitVec 32))) (Intermediate!8883 (undefined!9695 Bool) (index!37905 (_ BitVec 32)) (x!76211 (_ BitVec 32))) (Undefined!8883) (MissingVacant!8883 (index!37906 (_ BitVec 32))) )
))
(declare-fun lt!404563 () SeekEntryResult!8883)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52486 (_ BitVec 32)) SeekEntryResult!8883)

(assert (=> b!895593 (= lt!404563 (seekEntry!0 key!785 (_keys!10076 thiss!1181) (mask!25963 thiss!1181)))))

(declare-fun mapNonEmpty!28960 () Bool)

(declare-fun mapRes!28960 () Bool)

(declare-fun tp!55751 () Bool)

(assert (=> mapNonEmpty!28960 (= mapRes!28960 (and tp!55751 e!500416))))

(declare-fun mapRest!28960 () (Array (_ BitVec 32) ValueCell!8639))

(declare-fun mapKey!28960 () (_ BitVec 32))

(declare-fun mapValue!28960 () ValueCell!8639)

(assert (=> mapNonEmpty!28960 (= (arr!25238 (_values!5346 thiss!1181)) (store mapRest!28960 mapKey!28960 mapValue!28960))))

(declare-fun mapIsEmpty!28960 () Bool)

(assert (=> mapIsEmpty!28960 mapRes!28960))

(declare-fun b!895594 () Bool)

(declare-fun e!500417 () Bool)

(assert (=> b!895594 (= e!500418 (and e!500417 mapRes!28960))))

(declare-fun condMapEmpty!28960 () Bool)

(declare-fun mapDefault!28960 () ValueCell!8639)

