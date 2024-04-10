; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75830 () Bool)

(assert start!75830)

(declare-fun b!892166 () Bool)

(declare-fun b_free!15801 () Bool)

(declare-fun b_next!15801 () Bool)

(assert (=> b!892166 (= b_free!15801 (not b_next!15801))))

(declare-fun tp!55371 () Bool)

(declare-fun b_and!26041 () Bool)

(assert (=> b!892166 (= tp!55371 b_and!26041)))

(declare-fun res!604451 () Bool)

(declare-fun e!497971 () Bool)

(assert (=> start!75830 (=> (not res!604451) (not e!497971))))

(declare-datatypes ((array!52238 0))(
  ( (array!52239 (arr!25125 (Array (_ BitVec 32) (_ BitVec 64))) (size!25569 (_ BitVec 32))) )
))
(declare-datatypes ((V!29137 0))(
  ( (V!29138 (val!9115 Int)) )
))
(declare-datatypes ((ValueCell!8583 0))(
  ( (ValueCellFull!8583 (v!11593 V!29137)) (EmptyCell!8583) )
))
(declare-datatypes ((array!52240 0))(
  ( (array!52241 (arr!25126 (Array (_ BitVec 32) ValueCell!8583)) (size!25570 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4182 0))(
  ( (LongMapFixedSize!4183 (defaultEntry!5288 Int) (mask!25795 (_ BitVec 32)) (extraKeys!4982 (_ BitVec 32)) (zeroValue!5086 V!29137) (minValue!5086 V!29137) (_size!2146 (_ BitVec 32)) (_keys!9971 array!52238) (_values!5273 array!52240) (_vacant!2146 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4182)

(declare-fun valid!1618 (LongMapFixedSize!4182) Bool)

(assert (=> start!75830 (= res!604451 (valid!1618 thiss!1181))))

(assert (=> start!75830 e!497971))

(declare-fun e!497979 () Bool)

(assert (=> start!75830 e!497979))

(assert (=> start!75830 true))

(declare-fun b!892159 () Bool)

(declare-fun e!497972 () Bool)

(declare-fun e!497974 () Bool)

(assert (=> b!892159 (= e!497972 e!497974)))

(declare-fun res!604446 () Bool)

(assert (=> b!892159 (=> res!604446 e!497974)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!892159 (= res!604446 (not (validMask!0 (mask!25795 thiss!1181))))))

(declare-datatypes ((tuple2!11986 0))(
  ( (tuple2!11987 (_1!6004 (_ BitVec 64)) (_2!6004 V!29137)) )
))
(declare-datatypes ((List!17775 0))(
  ( (Nil!17772) (Cons!17771 (h!18902 tuple2!11986) (t!25074 List!17775)) )
))
(declare-datatypes ((ListLongMap!10683 0))(
  ( (ListLongMap!10684 (toList!5357 List!17775)) )
))
(declare-fun lt!403049 () ListLongMap!10683)

(declare-datatypes ((SeekEntryResult!8842 0))(
  ( (MissingZero!8842 (index!37739 (_ BitVec 32))) (Found!8842 (index!37740 (_ BitVec 32))) (Intermediate!8842 (undefined!9654 Bool) (index!37741 (_ BitVec 32)) (x!75818 (_ BitVec 32))) (Undefined!8842) (MissingVacant!8842 (index!37742 (_ BitVec 32))) )
))
(declare-fun lt!403052 () SeekEntryResult!8842)

(declare-fun contains!4359 (ListLongMap!10683 (_ BitVec 64)) Bool)

(assert (=> b!892159 (contains!4359 lt!403049 (select (arr!25125 (_keys!9971 thiss!1181)) (index!37740 lt!403052)))))

(declare-fun getCurrentListMap!2638 (array!52238 array!52240 (_ BitVec 32) (_ BitVec 32) V!29137 V!29137 (_ BitVec 32) Int) ListLongMap!10683)

(assert (=> b!892159 (= lt!403049 (getCurrentListMap!2638 (_keys!9971 thiss!1181) (_values!5273 thiss!1181) (mask!25795 thiss!1181) (extraKeys!4982 thiss!1181) (zeroValue!5086 thiss!1181) (minValue!5086 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5288 thiss!1181)))))

(declare-datatypes ((Unit!30380 0))(
  ( (Unit!30381) )
))
(declare-fun lt!403054 () Unit!30380)

(declare-fun lemmaValidKeyInArrayIsInListMap!227 (array!52238 array!52240 (_ BitVec 32) (_ BitVec 32) V!29137 V!29137 (_ BitVec 32) Int) Unit!30380)

(assert (=> b!892159 (= lt!403054 (lemmaValidKeyInArrayIsInListMap!227 (_keys!9971 thiss!1181) (_values!5273 thiss!1181) (mask!25795 thiss!1181) (extraKeys!4982 thiss!1181) (zeroValue!5086 thiss!1181) (minValue!5086 thiss!1181) (index!37740 lt!403052) (defaultEntry!5288 thiss!1181)))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52238 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!892159 (arrayContainsKey!0 (_keys!9971 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!403053 () Unit!30380)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52238 (_ BitVec 64) (_ BitVec 32)) Unit!30380)

(assert (=> b!892159 (= lt!403053 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9971 thiss!1181) key!785 (index!37740 lt!403052)))))

(declare-fun b!892160 () Bool)

(declare-fun e!497973 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!892160 (= e!497973 (inRange!0 (index!37740 lt!403052) (mask!25795 thiss!1181)))))

(declare-fun b!892161 () Bool)

(assert (=> b!892161 (= e!497974 true)))

(declare-fun lt!403051 () Bool)

(assert (=> b!892161 (= lt!403051 (contains!4359 lt!403049 key!785))))

(declare-fun b!892162 () Bool)

(declare-fun e!497978 () Bool)

(declare-fun e!497976 () Bool)

(declare-fun mapRes!28748 () Bool)

(assert (=> b!892162 (= e!497978 (and e!497976 mapRes!28748))))

(declare-fun condMapEmpty!28748 () Bool)

(declare-fun mapDefault!28748 () ValueCell!8583)

(assert (=> b!892162 (= condMapEmpty!28748 (= (arr!25126 (_values!5273 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8583)) mapDefault!28748)))))

(declare-fun b!892163 () Bool)

(declare-fun tp_is_empty!18129 () Bool)

(assert (=> b!892163 (= e!497976 tp_is_empty!18129)))

(declare-fun b!892164 () Bool)

(declare-fun res!604444 () Bool)

(assert (=> b!892164 (=> (not res!604444) (not e!497971))))

(assert (=> b!892164 (= res!604444 (not (= key!785 (bvneg key!785))))))

(declare-fun b!892165 () Bool)

(declare-fun res!604450 () Bool)

(assert (=> b!892165 (=> res!604450 e!497974)))

(declare-datatypes ((List!17776 0))(
  ( (Nil!17773) (Cons!17772 (h!18903 (_ BitVec 64)) (t!25075 List!17776)) )
))
(declare-fun arrayNoDuplicates!0 (array!52238 (_ BitVec 32) List!17776) Bool)

(assert (=> b!892165 (= res!604450 (not (arrayNoDuplicates!0 (_keys!9971 thiss!1181) #b00000000000000000000000000000000 Nil!17773)))))

(declare-fun array_inv!19738 (array!52238) Bool)

(declare-fun array_inv!19739 (array!52240) Bool)

(assert (=> b!892166 (= e!497979 (and tp!55371 tp_is_empty!18129 (array_inv!19738 (_keys!9971 thiss!1181)) (array_inv!19739 (_values!5273 thiss!1181)) e!497978))))

(declare-fun mapIsEmpty!28748 () Bool)

(assert (=> mapIsEmpty!28748 mapRes!28748))

(declare-fun mapNonEmpty!28748 () Bool)

(declare-fun tp!55372 () Bool)

(declare-fun e!497975 () Bool)

(assert (=> mapNonEmpty!28748 (= mapRes!28748 (and tp!55372 e!497975))))

(declare-fun mapValue!28748 () ValueCell!8583)

(declare-fun mapRest!28748 () (Array (_ BitVec 32) ValueCell!8583))

(declare-fun mapKey!28748 () (_ BitVec 32))

(assert (=> mapNonEmpty!28748 (= (arr!25126 (_values!5273 thiss!1181)) (store mapRest!28748 mapKey!28748 mapValue!28748))))

(declare-fun b!892167 () Bool)

(assert (=> b!892167 (= e!497971 (not e!497972))))

(declare-fun res!604447 () Bool)

(assert (=> b!892167 (=> res!604447 e!497972)))

(get-info :version)

(assert (=> b!892167 (= res!604447 (not ((_ is Found!8842) lt!403052)))))

(assert (=> b!892167 e!497973))

(declare-fun res!604448 () Bool)

(assert (=> b!892167 (=> res!604448 e!497973)))

(assert (=> b!892167 (= res!604448 (not ((_ is Found!8842) lt!403052)))))

(declare-fun lt!403050 () Unit!30380)

(declare-fun lemmaSeekEntryGivesInRangeIndex!42 (array!52238 array!52240 (_ BitVec 32) (_ BitVec 32) V!29137 V!29137 (_ BitVec 64)) Unit!30380)

(assert (=> b!892167 (= lt!403050 (lemmaSeekEntryGivesInRangeIndex!42 (_keys!9971 thiss!1181) (_values!5273 thiss!1181) (mask!25795 thiss!1181) (extraKeys!4982 thiss!1181) (zeroValue!5086 thiss!1181) (minValue!5086 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52238 (_ BitVec 32)) SeekEntryResult!8842)

(assert (=> b!892167 (= lt!403052 (seekEntry!0 key!785 (_keys!9971 thiss!1181) (mask!25795 thiss!1181)))))

(declare-fun b!892168 () Bool)

(declare-fun res!604445 () Bool)

(assert (=> b!892168 (=> res!604445 e!497974)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52238 (_ BitVec 32)) Bool)

(assert (=> b!892168 (= res!604445 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9971 thiss!1181) (mask!25795 thiss!1181))))))

(declare-fun b!892169 () Bool)

(assert (=> b!892169 (= e!497975 tp_is_empty!18129)))

(declare-fun b!892170 () Bool)

(declare-fun res!604449 () Bool)

(assert (=> b!892170 (=> res!604449 e!497974)))

(assert (=> b!892170 (= res!604449 (or (not (= (size!25570 (_values!5273 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25795 thiss!1181)))) (not (= (size!25569 (_keys!9971 thiss!1181)) (size!25570 (_values!5273 thiss!1181)))) (bvslt (mask!25795 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4982 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4982 thiss!1181) #b00000000000000000000000000000011)))))

(assert (= (and start!75830 res!604451) b!892164))

(assert (= (and b!892164 res!604444) b!892167))

(assert (= (and b!892167 (not res!604448)) b!892160))

(assert (= (and b!892167 (not res!604447)) b!892159))

(assert (= (and b!892159 (not res!604446)) b!892170))

(assert (= (and b!892170 (not res!604449)) b!892168))

(assert (= (and b!892168 (not res!604445)) b!892165))

(assert (= (and b!892165 (not res!604450)) b!892161))

(assert (= (and b!892162 condMapEmpty!28748) mapIsEmpty!28748))

(assert (= (and b!892162 (not condMapEmpty!28748)) mapNonEmpty!28748))

(assert (= (and mapNonEmpty!28748 ((_ is ValueCellFull!8583) mapValue!28748)) b!892169))

(assert (= (and b!892162 ((_ is ValueCellFull!8583) mapDefault!28748)) b!892163))

(assert (= b!892166 b!892162))

(assert (= start!75830 b!892166))

(declare-fun m!830431 () Bool)

(assert (=> b!892160 m!830431))

(declare-fun m!830433 () Bool)

(assert (=> mapNonEmpty!28748 m!830433))

(declare-fun m!830435 () Bool)

(assert (=> start!75830 m!830435))

(declare-fun m!830437 () Bool)

(assert (=> b!892166 m!830437))

(declare-fun m!830439 () Bool)

(assert (=> b!892166 m!830439))

(declare-fun m!830441 () Bool)

(assert (=> b!892167 m!830441))

(declare-fun m!830443 () Bool)

(assert (=> b!892167 m!830443))

(declare-fun m!830445 () Bool)

(assert (=> b!892159 m!830445))

(declare-fun m!830447 () Bool)

(assert (=> b!892159 m!830447))

(declare-fun m!830449 () Bool)

(assert (=> b!892159 m!830449))

(assert (=> b!892159 m!830445))

(declare-fun m!830451 () Bool)

(assert (=> b!892159 m!830451))

(declare-fun m!830453 () Bool)

(assert (=> b!892159 m!830453))

(declare-fun m!830455 () Bool)

(assert (=> b!892159 m!830455))

(declare-fun m!830457 () Bool)

(assert (=> b!892159 m!830457))

(declare-fun m!830459 () Bool)

(assert (=> b!892168 m!830459))

(declare-fun m!830461 () Bool)

(assert (=> b!892161 m!830461))

(declare-fun m!830463 () Bool)

(assert (=> b!892165 m!830463))

(check-sat (not b!892168) (not start!75830) (not mapNonEmpty!28748) (not b!892161) (not b!892165) (not b!892167) (not b!892159) (not b!892166) b_and!26041 (not b_next!15801) tp_is_empty!18129 (not b!892160))
(check-sat b_and!26041 (not b_next!15801))
