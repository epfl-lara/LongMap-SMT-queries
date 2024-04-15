; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80948 () Bool)

(assert start!80948)

(declare-fun b!948158 () Bool)

(declare-fun b_free!18199 () Bool)

(declare-fun b_next!18199 () Bool)

(assert (=> b!948158 (= b_free!18199 (not b_next!18199))))

(declare-fun tp!63173 () Bool)

(declare-fun b_and!29605 () Bool)

(assert (=> b!948158 (= tp!63173 b_and!29605)))

(declare-fun b!948157 () Bool)

(declare-fun res!636169 () Bool)

(declare-fun e!533732 () Bool)

(assert (=> b!948157 (=> (not res!636169) (not e!533732))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32575 0))(
  ( (V!32576 (val!10404 Int)) )
))
(declare-datatypes ((ValueCell!9872 0))(
  ( (ValueCellFull!9872 (v!12940 V!32575)) (EmptyCell!9872) )
))
(declare-datatypes ((array!57385 0))(
  ( (array!57386 (arr!27599 (Array (_ BitVec 32) ValueCell!9872)) (size!28075 (_ BitVec 32))) )
))
(declare-datatypes ((array!57387 0))(
  ( (array!57388 (arr!27600 (Array (_ BitVec 32) (_ BitVec 64))) (size!28076 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4894 0))(
  ( (LongMapFixedSize!4895 (defaultEntry!5749 Int) (mask!27502 (_ BitVec 32)) (extraKeys!5481 (_ BitVec 32)) (zeroValue!5585 V!32575) (minValue!5585 V!32575) (_size!2502 (_ BitVec 32)) (_keys!10663 array!57387) (_values!5772 array!57385) (_vacant!2502 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4894)

(get-info :version)

(declare-datatypes ((SeekEntryResult!9125 0))(
  ( (MissingZero!9125 (index!38871 (_ BitVec 32))) (Found!9125 (index!38872 (_ BitVec 32))) (Intermediate!9125 (undefined!9937 Bool) (index!38873 (_ BitVec 32)) (x!81598 (_ BitVec 32))) (Undefined!9125) (MissingVacant!9125 (index!38874 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57387 (_ BitVec 32)) SeekEntryResult!9125)

(assert (=> b!948157 (= res!636169 (not ((_ is Found!9125) (seekEntry!0 key!756 (_keys!10663 thiss!1141) (mask!27502 thiss!1141)))))))

(declare-fun e!533731 () Bool)

(declare-fun tp_is_empty!20707 () Bool)

(declare-fun e!533730 () Bool)

(declare-fun array_inv!21482 (array!57387) Bool)

(declare-fun array_inv!21483 (array!57385) Bool)

(assert (=> b!948158 (= e!533730 (and tp!63173 tp_is_empty!20707 (array_inv!21482 (_keys!10663 thiss!1141)) (array_inv!21483 (_values!5772 thiss!1141)) e!533731))))

(declare-fun b!948159 () Bool)

(assert (=> b!948159 (= e!533732 (and (= (size!28075 (_values!5772 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27502 thiss!1141))) (not (= (size!28076 (_keys!10663 thiss!1141)) (size!28075 (_values!5772 thiss!1141))))))))

(declare-fun mapIsEmpty!32951 () Bool)

(declare-fun mapRes!32951 () Bool)

(assert (=> mapIsEmpty!32951 mapRes!32951))

(declare-fun b!948160 () Bool)

(declare-fun res!636173 () Bool)

(assert (=> b!948160 (=> (not res!636173) (not e!533732))))

(declare-datatypes ((tuple2!13568 0))(
  ( (tuple2!13569 (_1!6795 (_ BitVec 64)) (_2!6795 V!32575)) )
))
(declare-datatypes ((List!19320 0))(
  ( (Nil!19317) (Cons!19316 (h!20473 tuple2!13568) (t!27638 List!19320)) )
))
(declare-datatypes ((ListLongMap!12255 0))(
  ( (ListLongMap!12256 (toList!6143 List!19320)) )
))
(declare-fun contains!5170 (ListLongMap!12255 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3305 (array!57387 array!57385 (_ BitVec 32) (_ BitVec 32) V!32575 V!32575 (_ BitVec 32) Int) ListLongMap!12255)

(assert (=> b!948160 (= res!636173 (contains!5170 (getCurrentListMap!3305 (_keys!10663 thiss!1141) (_values!5772 thiss!1141) (mask!27502 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141)) key!756))))

(declare-fun b!948161 () Bool)

(declare-fun e!533734 () Bool)

(assert (=> b!948161 (= e!533734 tp_is_empty!20707)))

(declare-fun b!948162 () Bool)

(declare-fun res!636170 () Bool)

(assert (=> b!948162 (=> (not res!636170) (not e!533732))))

(assert (=> b!948162 (= res!636170 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!948163 () Bool)

(declare-fun e!533735 () Bool)

(assert (=> b!948163 (= e!533735 tp_is_empty!20707)))

(declare-fun b!948164 () Bool)

(assert (=> b!948164 (= e!533731 (and e!533734 mapRes!32951))))

(declare-fun condMapEmpty!32951 () Bool)

(declare-fun mapDefault!32951 () ValueCell!9872)

(assert (=> b!948164 (= condMapEmpty!32951 (= (arr!27599 (_values!5772 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9872)) mapDefault!32951)))))

(declare-fun b!948165 () Bool)

(declare-fun res!636171 () Bool)

(assert (=> b!948165 (=> (not res!636171) (not e!533732))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!948165 (= res!636171 (validMask!0 (mask!27502 thiss!1141)))))

(declare-fun mapNonEmpty!32951 () Bool)

(declare-fun tp!63172 () Bool)

(assert (=> mapNonEmpty!32951 (= mapRes!32951 (and tp!63172 e!533735))))

(declare-fun mapValue!32951 () ValueCell!9872)

(declare-fun mapRest!32951 () (Array (_ BitVec 32) ValueCell!9872))

(declare-fun mapKey!32951 () (_ BitVec 32))

(assert (=> mapNonEmpty!32951 (= (arr!27599 (_values!5772 thiss!1141)) (store mapRest!32951 mapKey!32951 mapValue!32951))))

(declare-fun res!636172 () Bool)

(assert (=> start!80948 (=> (not res!636172) (not e!533732))))

(declare-fun valid!1866 (LongMapFixedSize!4894) Bool)

(assert (=> start!80948 (= res!636172 (valid!1866 thiss!1141))))

(assert (=> start!80948 e!533732))

(assert (=> start!80948 e!533730))

(assert (=> start!80948 true))

(assert (= (and start!80948 res!636172) b!948162))

(assert (= (and b!948162 res!636170) b!948157))

(assert (= (and b!948157 res!636169) b!948160))

(assert (= (and b!948160 res!636173) b!948165))

(assert (= (and b!948165 res!636171) b!948159))

(assert (= (and b!948164 condMapEmpty!32951) mapIsEmpty!32951))

(assert (= (and b!948164 (not condMapEmpty!32951)) mapNonEmpty!32951))

(assert (= (and mapNonEmpty!32951 ((_ is ValueCellFull!9872) mapValue!32951)) b!948163))

(assert (= (and b!948164 ((_ is ValueCellFull!9872) mapDefault!32951)) b!948161))

(assert (= b!948158 b!948164))

(assert (= start!80948 b!948158))

(declare-fun m!880423 () Bool)

(assert (=> mapNonEmpty!32951 m!880423))

(declare-fun m!880425 () Bool)

(assert (=> b!948157 m!880425))

(declare-fun m!880427 () Bool)

(assert (=> start!80948 m!880427))

(declare-fun m!880429 () Bool)

(assert (=> b!948160 m!880429))

(assert (=> b!948160 m!880429))

(declare-fun m!880431 () Bool)

(assert (=> b!948160 m!880431))

(declare-fun m!880433 () Bool)

(assert (=> b!948158 m!880433))

(declare-fun m!880435 () Bool)

(assert (=> b!948158 m!880435))

(declare-fun m!880437 () Bool)

(assert (=> b!948165 m!880437))

(check-sat (not b_next!18199) (not mapNonEmpty!32951) tp_is_empty!20707 (not b!948157) (not b!948165) (not b!948158) b_and!29605 (not start!80948) (not b!948160))
(check-sat b_and!29605 (not b_next!18199))
(get-model)

(declare-fun b!948232 () Bool)

(declare-fun e!533778 () SeekEntryResult!9125)

(declare-fun lt!426817 () SeekEntryResult!9125)

(assert (=> b!948232 (= e!533778 (Found!9125 (index!38873 lt!426817)))))

(declare-fun b!948233 () Bool)

(declare-fun c!98805 () Bool)

(declare-fun lt!426815 () (_ BitVec 64))

(assert (=> b!948233 (= c!98805 (= lt!426815 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!533779 () SeekEntryResult!9125)

(assert (=> b!948233 (= e!533778 e!533779)))

(declare-fun b!948234 () Bool)

(declare-fun e!533780 () SeekEntryResult!9125)

(assert (=> b!948234 (= e!533780 e!533778)))

(assert (=> b!948234 (= lt!426815 (select (arr!27600 (_keys!10663 thiss!1141)) (index!38873 lt!426817)))))

(declare-fun c!98807 () Bool)

(assert (=> b!948234 (= c!98807 (= lt!426815 key!756))))

(declare-fun b!948235 () Bool)

(assert (=> b!948235 (= e!533779 (MissingZero!9125 (index!38873 lt!426817)))))

(declare-fun b!948237 () Bool)

(declare-fun lt!426816 () SeekEntryResult!9125)

(assert (=> b!948237 (= e!533779 (ite ((_ is MissingVacant!9125) lt!426816) (MissingZero!9125 (index!38874 lt!426816)) lt!426816))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57387 (_ BitVec 32)) SeekEntryResult!9125)

(assert (=> b!948237 (= lt!426816 (seekKeyOrZeroReturnVacant!0 (x!81598 lt!426817) (index!38873 lt!426817) (index!38873 lt!426817) key!756 (_keys!10663 thiss!1141) (mask!27502 thiss!1141)))))

(declare-fun d!114643 () Bool)

(declare-fun lt!426814 () SeekEntryResult!9125)

(assert (=> d!114643 (and (or ((_ is MissingVacant!9125) lt!426814) (not ((_ is Found!9125) lt!426814)) (and (bvsge (index!38872 lt!426814) #b00000000000000000000000000000000) (bvslt (index!38872 lt!426814) (size!28076 (_keys!10663 thiss!1141))))) (not ((_ is MissingVacant!9125) lt!426814)) (or (not ((_ is Found!9125) lt!426814)) (= (select (arr!27600 (_keys!10663 thiss!1141)) (index!38872 lt!426814)) key!756)))))

(assert (=> d!114643 (= lt!426814 e!533780)))

(declare-fun c!98806 () Bool)

(assert (=> d!114643 (= c!98806 (and ((_ is Intermediate!9125) lt!426817) (undefined!9937 lt!426817)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57387 (_ BitVec 32)) SeekEntryResult!9125)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114643 (= lt!426817 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27502 thiss!1141)) key!756 (_keys!10663 thiss!1141) (mask!27502 thiss!1141)))))

(assert (=> d!114643 (validMask!0 (mask!27502 thiss!1141))))

(assert (=> d!114643 (= (seekEntry!0 key!756 (_keys!10663 thiss!1141) (mask!27502 thiss!1141)) lt!426814)))

(declare-fun b!948236 () Bool)

(assert (=> b!948236 (= e!533780 Undefined!9125)))

(assert (= (and d!114643 c!98806) b!948236))

(assert (= (and d!114643 (not c!98806)) b!948234))

(assert (= (and b!948234 c!98807) b!948232))

(assert (= (and b!948234 (not c!98807)) b!948233))

(assert (= (and b!948233 c!98805) b!948235))

(assert (= (and b!948233 (not c!98805)) b!948237))

(declare-fun m!880471 () Bool)

(assert (=> b!948234 m!880471))

(declare-fun m!880473 () Bool)

(assert (=> b!948237 m!880473))

(declare-fun m!880475 () Bool)

(assert (=> d!114643 m!880475))

(declare-fun m!880477 () Bool)

(assert (=> d!114643 m!880477))

(assert (=> d!114643 m!880477))

(declare-fun m!880479 () Bool)

(assert (=> d!114643 m!880479))

(assert (=> d!114643 m!880437))

(assert (=> b!948157 d!114643))

(declare-fun d!114645 () Bool)

(assert (=> d!114645 (= (validMask!0 (mask!27502 thiss!1141)) (and (or (= (mask!27502 thiss!1141) #b00000000000000000000000000000111) (= (mask!27502 thiss!1141) #b00000000000000000000000000001111) (= (mask!27502 thiss!1141) #b00000000000000000000000000011111) (= (mask!27502 thiss!1141) #b00000000000000000000000000111111) (= (mask!27502 thiss!1141) #b00000000000000000000000001111111) (= (mask!27502 thiss!1141) #b00000000000000000000000011111111) (= (mask!27502 thiss!1141) #b00000000000000000000000111111111) (= (mask!27502 thiss!1141) #b00000000000000000000001111111111) (= (mask!27502 thiss!1141) #b00000000000000000000011111111111) (= (mask!27502 thiss!1141) #b00000000000000000000111111111111) (= (mask!27502 thiss!1141) #b00000000000000000001111111111111) (= (mask!27502 thiss!1141) #b00000000000000000011111111111111) (= (mask!27502 thiss!1141) #b00000000000000000111111111111111) (= (mask!27502 thiss!1141) #b00000000000000001111111111111111) (= (mask!27502 thiss!1141) #b00000000000000011111111111111111) (= (mask!27502 thiss!1141) #b00000000000000111111111111111111) (= (mask!27502 thiss!1141) #b00000000000001111111111111111111) (= (mask!27502 thiss!1141) #b00000000000011111111111111111111) (= (mask!27502 thiss!1141) #b00000000000111111111111111111111) (= (mask!27502 thiss!1141) #b00000000001111111111111111111111) (= (mask!27502 thiss!1141) #b00000000011111111111111111111111) (= (mask!27502 thiss!1141) #b00000000111111111111111111111111) (= (mask!27502 thiss!1141) #b00000001111111111111111111111111) (= (mask!27502 thiss!1141) #b00000011111111111111111111111111) (= (mask!27502 thiss!1141) #b00000111111111111111111111111111) (= (mask!27502 thiss!1141) #b00001111111111111111111111111111) (= (mask!27502 thiss!1141) #b00011111111111111111111111111111) (= (mask!27502 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27502 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!948165 d!114645))

(declare-fun d!114647 () Bool)

(declare-fun e!533786 () Bool)

(assert (=> d!114647 e!533786))

(declare-fun res!636206 () Bool)

(assert (=> d!114647 (=> res!636206 e!533786)))

(declare-fun lt!426827 () Bool)

(assert (=> d!114647 (= res!636206 (not lt!426827))))

(declare-fun lt!426826 () Bool)

(assert (=> d!114647 (= lt!426827 lt!426826)))

(declare-datatypes ((Unit!31831 0))(
  ( (Unit!31832) )
))
(declare-fun lt!426828 () Unit!31831)

(declare-fun e!533785 () Unit!31831)

(assert (=> d!114647 (= lt!426828 e!533785)))

(declare-fun c!98810 () Bool)

(assert (=> d!114647 (= c!98810 lt!426826)))

(declare-fun containsKey!458 (List!19320 (_ BitVec 64)) Bool)

(assert (=> d!114647 (= lt!426826 (containsKey!458 (toList!6143 (getCurrentListMap!3305 (_keys!10663 thiss!1141) (_values!5772 thiss!1141) (mask!27502 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141))) key!756))))

(assert (=> d!114647 (= (contains!5170 (getCurrentListMap!3305 (_keys!10663 thiss!1141) (_values!5772 thiss!1141) (mask!27502 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141)) key!756) lt!426827)))

(declare-fun b!948244 () Bool)

(declare-fun lt!426829 () Unit!31831)

(assert (=> b!948244 (= e!533785 lt!426829)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!353 (List!19320 (_ BitVec 64)) Unit!31831)

(assert (=> b!948244 (= lt!426829 (lemmaContainsKeyImpliesGetValueByKeyDefined!353 (toList!6143 (getCurrentListMap!3305 (_keys!10663 thiss!1141) (_values!5772 thiss!1141) (mask!27502 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141))) key!756))))

(declare-datatypes ((Option!500 0))(
  ( (Some!499 (v!12943 V!32575)) (None!498) )
))
(declare-fun isDefined!366 (Option!500) Bool)

(declare-fun getValueByKey!494 (List!19320 (_ BitVec 64)) Option!500)

(assert (=> b!948244 (isDefined!366 (getValueByKey!494 (toList!6143 (getCurrentListMap!3305 (_keys!10663 thiss!1141) (_values!5772 thiss!1141) (mask!27502 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141))) key!756))))

(declare-fun b!948245 () Bool)

(declare-fun Unit!31833 () Unit!31831)

(assert (=> b!948245 (= e!533785 Unit!31833)))

(declare-fun b!948246 () Bool)

(assert (=> b!948246 (= e!533786 (isDefined!366 (getValueByKey!494 (toList!6143 (getCurrentListMap!3305 (_keys!10663 thiss!1141) (_values!5772 thiss!1141) (mask!27502 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141))) key!756)))))

(assert (= (and d!114647 c!98810) b!948244))

(assert (= (and d!114647 (not c!98810)) b!948245))

(assert (= (and d!114647 (not res!636206)) b!948246))

(declare-fun m!880481 () Bool)

(assert (=> d!114647 m!880481))

(declare-fun m!880483 () Bool)

(assert (=> b!948244 m!880483))

(declare-fun m!880485 () Bool)

(assert (=> b!948244 m!880485))

(assert (=> b!948244 m!880485))

(declare-fun m!880487 () Bool)

(assert (=> b!948244 m!880487))

(assert (=> b!948246 m!880485))

(assert (=> b!948246 m!880485))

(assert (=> b!948246 m!880487))

(assert (=> b!948160 d!114647))

(declare-fun b!948289 () Bool)

(declare-fun e!533815 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!948289 (= e!533815 (validKeyInArray!0 (select (arr!27600 (_keys!10663 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!948290 () Bool)

(declare-fun e!533825 () Bool)

(declare-fun lt!426892 () ListLongMap!12255)

(declare-fun apply!865 (ListLongMap!12255 (_ BitVec 64)) V!32575)

(assert (=> b!948290 (= e!533825 (= (apply!865 lt!426892 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5585 thiss!1141)))))

(declare-fun b!948291 () Bool)

(declare-fun e!533816 () Unit!31831)

(declare-fun lt!426874 () Unit!31831)

(assert (=> b!948291 (= e!533816 lt!426874)))

(declare-fun lt!426887 () ListLongMap!12255)

(declare-fun getCurrentListMapNoExtraKeys!3347 (array!57387 array!57385 (_ BitVec 32) (_ BitVec 32) V!32575 V!32575 (_ BitVec 32) Int) ListLongMap!12255)

(assert (=> b!948291 (= lt!426887 (getCurrentListMapNoExtraKeys!3347 (_keys!10663 thiss!1141) (_values!5772 thiss!1141) (mask!27502 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141)))))

(declare-fun lt!426877 () (_ BitVec 64))

(assert (=> b!948291 (= lt!426877 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!426889 () (_ BitVec 64))

(assert (=> b!948291 (= lt!426889 (select (arr!27600 (_keys!10663 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426893 () Unit!31831)

(declare-fun addStillContains!564 (ListLongMap!12255 (_ BitVec 64) V!32575 (_ BitVec 64)) Unit!31831)

(assert (=> b!948291 (= lt!426893 (addStillContains!564 lt!426887 lt!426877 (zeroValue!5585 thiss!1141) lt!426889))))

(declare-fun +!2875 (ListLongMap!12255 tuple2!13568) ListLongMap!12255)

(assert (=> b!948291 (contains!5170 (+!2875 lt!426887 (tuple2!13569 lt!426877 (zeroValue!5585 thiss!1141))) lt!426889)))

(declare-fun lt!426886 () Unit!31831)

(assert (=> b!948291 (= lt!426886 lt!426893)))

(declare-fun lt!426876 () ListLongMap!12255)

(assert (=> b!948291 (= lt!426876 (getCurrentListMapNoExtraKeys!3347 (_keys!10663 thiss!1141) (_values!5772 thiss!1141) (mask!27502 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141)))))

(declare-fun lt!426890 () (_ BitVec 64))

(assert (=> b!948291 (= lt!426890 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!426884 () (_ BitVec 64))

(assert (=> b!948291 (= lt!426884 (select (arr!27600 (_keys!10663 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426894 () Unit!31831)

(declare-fun addApplyDifferent!444 (ListLongMap!12255 (_ BitVec 64) V!32575 (_ BitVec 64)) Unit!31831)

(assert (=> b!948291 (= lt!426894 (addApplyDifferent!444 lt!426876 lt!426890 (minValue!5585 thiss!1141) lt!426884))))

(assert (=> b!948291 (= (apply!865 (+!2875 lt!426876 (tuple2!13569 lt!426890 (minValue!5585 thiss!1141))) lt!426884) (apply!865 lt!426876 lt!426884))))

(declare-fun lt!426882 () Unit!31831)

(assert (=> b!948291 (= lt!426882 lt!426894)))

(declare-fun lt!426879 () ListLongMap!12255)

(assert (=> b!948291 (= lt!426879 (getCurrentListMapNoExtraKeys!3347 (_keys!10663 thiss!1141) (_values!5772 thiss!1141) (mask!27502 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141)))))

(declare-fun lt!426878 () (_ BitVec 64))

(assert (=> b!948291 (= lt!426878 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!426880 () (_ BitVec 64))

(assert (=> b!948291 (= lt!426880 (select (arr!27600 (_keys!10663 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426875 () Unit!31831)

(assert (=> b!948291 (= lt!426875 (addApplyDifferent!444 lt!426879 lt!426878 (zeroValue!5585 thiss!1141) lt!426880))))

(assert (=> b!948291 (= (apply!865 (+!2875 lt!426879 (tuple2!13569 lt!426878 (zeroValue!5585 thiss!1141))) lt!426880) (apply!865 lt!426879 lt!426880))))

(declare-fun lt!426891 () Unit!31831)

(assert (=> b!948291 (= lt!426891 lt!426875)))

(declare-fun lt!426881 () ListLongMap!12255)

(assert (=> b!948291 (= lt!426881 (getCurrentListMapNoExtraKeys!3347 (_keys!10663 thiss!1141) (_values!5772 thiss!1141) (mask!27502 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141)))))

(declare-fun lt!426883 () (_ BitVec 64))

(assert (=> b!948291 (= lt!426883 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!426885 () (_ BitVec 64))

(assert (=> b!948291 (= lt!426885 (select (arr!27600 (_keys!10663 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!948291 (= lt!426874 (addApplyDifferent!444 lt!426881 lt!426883 (minValue!5585 thiss!1141) lt!426885))))

(assert (=> b!948291 (= (apply!865 (+!2875 lt!426881 (tuple2!13569 lt!426883 (minValue!5585 thiss!1141))) lt!426885) (apply!865 lt!426881 lt!426885))))

(declare-fun b!948292 () Bool)

(declare-fun e!533818 () Bool)

(declare-fun e!533814 () Bool)

(assert (=> b!948292 (= e!533818 e!533814)))

(declare-fun c!98826 () Bool)

(assert (=> b!948292 (= c!98826 (not (= (bvand (extraKeys!5481 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!948293 () Bool)

(declare-fun res!636225 () Bool)

(assert (=> b!948293 (=> (not res!636225) (not e!533818))))

(declare-fun e!533813 () Bool)

(assert (=> b!948293 (= res!636225 e!533813)))

(declare-fun res!636230 () Bool)

(assert (=> b!948293 (=> res!636230 e!533813)))

(declare-fun e!533823 () Bool)

(assert (=> b!948293 (= res!636230 (not e!533823))))

(declare-fun res!636227 () Bool)

(assert (=> b!948293 (=> (not res!636227) (not e!533823))))

(assert (=> b!948293 (= res!636227 (bvslt #b00000000000000000000000000000000 (size!28076 (_keys!10663 thiss!1141))))))

(declare-fun b!948294 () Bool)

(declare-fun e!533819 () ListLongMap!12255)

(declare-fun call!41193 () ListLongMap!12255)

(assert (=> b!948294 (= e!533819 call!41193)))

(declare-fun b!948295 () Bool)

(declare-fun call!41194 () Bool)

(assert (=> b!948295 (= e!533814 (not call!41194))))

(declare-fun bm!41186 () Bool)

(declare-fun call!41191 () Bool)

(assert (=> bm!41186 (= call!41191 (contains!5170 lt!426892 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!948296 () Bool)

(declare-fun e!533824 () ListLongMap!12255)

(assert (=> b!948296 (= e!533824 e!533819)))

(declare-fun c!98827 () Bool)

(assert (=> b!948296 (= c!98827 (and (not (= (bvand (extraKeys!5481 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5481 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!948297 () Bool)

(declare-fun e!533817 () Bool)

(assert (=> b!948297 (= e!533813 e!533817)))

(declare-fun res!636228 () Bool)

(assert (=> b!948297 (=> (not res!636228) (not e!533817))))

(assert (=> b!948297 (= res!636228 (contains!5170 lt!426892 (select (arr!27600 (_keys!10663 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!948297 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28076 (_keys!10663 thiss!1141))))))

(declare-fun b!948298 () Bool)

(declare-fun c!98823 () Bool)

(assert (=> b!948298 (= c!98823 (and (not (= (bvand (extraKeys!5481 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5481 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!533820 () ListLongMap!12255)

(assert (=> b!948298 (= e!533819 e!533820)))

(declare-fun b!948299 () Bool)

(assert (=> b!948299 (= e!533823 (validKeyInArray!0 (select (arr!27600 (_keys!10663 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!948300 () Bool)

(declare-fun e!533822 () Bool)

(assert (=> b!948300 (= e!533822 e!533825)))

(declare-fun res!636226 () Bool)

(assert (=> b!948300 (= res!636226 call!41191)))

(assert (=> b!948300 (=> (not res!636226) (not e!533825))))

(declare-fun b!948301 () Bool)

(declare-fun res!636229 () Bool)

(assert (=> b!948301 (=> (not res!636229) (not e!533818))))

(assert (=> b!948301 (= res!636229 e!533822)))

(declare-fun c!98824 () Bool)

(assert (=> b!948301 (= c!98824 (not (= (bvand (extraKeys!5481 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!948302 () Bool)

(declare-fun e!533821 () Bool)

(assert (=> b!948302 (= e!533821 (= (apply!865 lt!426892 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5585 thiss!1141)))))

(declare-fun bm!41187 () Bool)

(assert (=> bm!41187 (= call!41194 (contains!5170 lt!426892 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!948303 () Bool)

(declare-fun call!41190 () ListLongMap!12255)

(assert (=> b!948303 (= e!533820 call!41190)))

(declare-fun b!948304 () Bool)

(assert (=> b!948304 (= e!533820 call!41193)))

(declare-fun b!948305 () Bool)

(declare-fun Unit!31834 () Unit!31831)

(assert (=> b!948305 (= e!533816 Unit!31834)))

(declare-fun b!948306 () Bool)

(assert (=> b!948306 (= e!533814 e!533821)))

(declare-fun res!636231 () Bool)

(assert (=> b!948306 (= res!636231 call!41194)))

(assert (=> b!948306 (=> (not res!636231) (not e!533821))))

(declare-fun bm!41188 () Bool)

(declare-fun call!41189 () ListLongMap!12255)

(assert (=> bm!41188 (= call!41189 (getCurrentListMapNoExtraKeys!3347 (_keys!10663 thiss!1141) (_values!5772 thiss!1141) (mask!27502 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141)))))

(declare-fun d!114649 () Bool)

(assert (=> d!114649 e!533818))

(declare-fun res!636233 () Bool)

(assert (=> d!114649 (=> (not res!636233) (not e!533818))))

(assert (=> d!114649 (= res!636233 (or (bvsge #b00000000000000000000000000000000 (size!28076 (_keys!10663 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28076 (_keys!10663 thiss!1141))))))))

(declare-fun lt!426888 () ListLongMap!12255)

(assert (=> d!114649 (= lt!426892 lt!426888)))

(declare-fun lt!426895 () Unit!31831)

(assert (=> d!114649 (= lt!426895 e!533816)))

(declare-fun c!98825 () Bool)

(assert (=> d!114649 (= c!98825 e!533815)))

(declare-fun res!636232 () Bool)

(assert (=> d!114649 (=> (not res!636232) (not e!533815))))

(assert (=> d!114649 (= res!636232 (bvslt #b00000000000000000000000000000000 (size!28076 (_keys!10663 thiss!1141))))))

(assert (=> d!114649 (= lt!426888 e!533824)))

(declare-fun c!98828 () Bool)

(assert (=> d!114649 (= c!98828 (and (not (= (bvand (extraKeys!5481 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5481 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!114649 (validMask!0 (mask!27502 thiss!1141))))

(assert (=> d!114649 (= (getCurrentListMap!3305 (_keys!10663 thiss!1141) (_values!5772 thiss!1141) (mask!27502 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141)) lt!426892)))

(declare-fun bm!41185 () Bool)

(declare-fun call!41188 () ListLongMap!12255)

(assert (=> bm!41185 (= call!41188 call!41189)))

(declare-fun b!948307 () Bool)

(declare-fun get!14497 (ValueCell!9872 V!32575) V!32575)

(declare-fun dynLambda!1631 (Int (_ BitVec 64)) V!32575)

(assert (=> b!948307 (= e!533817 (= (apply!865 lt!426892 (select (arr!27600 (_keys!10663 thiss!1141)) #b00000000000000000000000000000000)) (get!14497 (select (arr!27599 (_values!5772 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1631 (defaultEntry!5749 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!948307 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28075 (_values!5772 thiss!1141))))))

(assert (=> b!948307 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28076 (_keys!10663 thiss!1141))))))

(declare-fun bm!41189 () Bool)

(assert (=> bm!41189 (= call!41190 call!41188)))

(declare-fun b!948308 () Bool)

(declare-fun call!41192 () ListLongMap!12255)

(assert (=> b!948308 (= e!533824 (+!2875 call!41192 (tuple2!13569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141))))))

(declare-fun bm!41190 () Bool)

(assert (=> bm!41190 (= call!41193 call!41192)))

(declare-fun bm!41191 () Bool)

(assert (=> bm!41191 (= call!41192 (+!2875 (ite c!98828 call!41189 (ite c!98827 call!41188 call!41190)) (ite (or c!98828 c!98827) (tuple2!13569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5585 thiss!1141)) (tuple2!13569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141)))))))

(declare-fun b!948309 () Bool)

(assert (=> b!948309 (= e!533822 (not call!41191))))

(assert (= (and d!114649 c!98828) b!948308))

(assert (= (and d!114649 (not c!98828)) b!948296))

(assert (= (and b!948296 c!98827) b!948294))

(assert (= (and b!948296 (not c!98827)) b!948298))

(assert (= (and b!948298 c!98823) b!948304))

(assert (= (and b!948298 (not c!98823)) b!948303))

(assert (= (or b!948304 b!948303) bm!41189))

(assert (= (or b!948294 bm!41189) bm!41185))

(assert (= (or b!948294 b!948304) bm!41190))

(assert (= (or b!948308 bm!41185) bm!41188))

(assert (= (or b!948308 bm!41190) bm!41191))

(assert (= (and d!114649 res!636232) b!948289))

(assert (= (and d!114649 c!98825) b!948291))

(assert (= (and d!114649 (not c!98825)) b!948305))

(assert (= (and d!114649 res!636233) b!948293))

(assert (= (and b!948293 res!636227) b!948299))

(assert (= (and b!948293 (not res!636230)) b!948297))

(assert (= (and b!948297 res!636228) b!948307))

(assert (= (and b!948293 res!636225) b!948301))

(assert (= (and b!948301 c!98824) b!948300))

(assert (= (and b!948301 (not c!98824)) b!948309))

(assert (= (and b!948300 res!636226) b!948290))

(assert (= (or b!948300 b!948309) bm!41186))

(assert (= (and b!948301 res!636229) b!948292))

(assert (= (and b!948292 c!98826) b!948306))

(assert (= (and b!948292 (not c!98826)) b!948295))

(assert (= (and b!948306 res!636231) b!948302))

(assert (= (or b!948306 b!948295) bm!41187))

(declare-fun b_lambda!14301 () Bool)

(assert (=> (not b_lambda!14301) (not b!948307)))

(declare-fun t!27641 () Bool)

(declare-fun tb!6171 () Bool)

(assert (=> (and b!948158 (= (defaultEntry!5749 thiss!1141) (defaultEntry!5749 thiss!1141)) t!27641) tb!6171))

(declare-fun result!12251 () Bool)

(assert (=> tb!6171 (= result!12251 tp_is_empty!20707)))

(assert (=> b!948307 t!27641))

(declare-fun b_and!29611 () Bool)

(assert (= b_and!29605 (and (=> t!27641 result!12251) b_and!29611)))

(declare-fun m!880489 () Bool)

(assert (=> bm!41186 m!880489))

(declare-fun m!880491 () Bool)

(assert (=> b!948308 m!880491))

(declare-fun m!880493 () Bool)

(assert (=> bm!41188 m!880493))

(declare-fun m!880495 () Bool)

(assert (=> b!948290 m!880495))

(assert (=> d!114649 m!880437))

(declare-fun m!880497 () Bool)

(assert (=> b!948299 m!880497))

(assert (=> b!948299 m!880497))

(declare-fun m!880499 () Bool)

(assert (=> b!948299 m!880499))

(assert (=> b!948297 m!880497))

(assert (=> b!948297 m!880497))

(declare-fun m!880501 () Bool)

(assert (=> b!948297 m!880501))

(assert (=> b!948289 m!880497))

(assert (=> b!948289 m!880497))

(assert (=> b!948289 m!880499))

(declare-fun m!880503 () Bool)

(assert (=> b!948302 m!880503))

(declare-fun m!880505 () Bool)

(assert (=> bm!41191 m!880505))

(declare-fun m!880507 () Bool)

(assert (=> bm!41187 m!880507))

(declare-fun m!880509 () Bool)

(assert (=> b!948291 m!880509))

(assert (=> b!948291 m!880509))

(declare-fun m!880511 () Bool)

(assert (=> b!948291 m!880511))

(declare-fun m!880513 () Bool)

(assert (=> b!948291 m!880513))

(declare-fun m!880515 () Bool)

(assert (=> b!948291 m!880515))

(declare-fun m!880517 () Bool)

(assert (=> b!948291 m!880517))

(declare-fun m!880519 () Bool)

(assert (=> b!948291 m!880519))

(declare-fun m!880521 () Bool)

(assert (=> b!948291 m!880521))

(declare-fun m!880523 () Bool)

(assert (=> b!948291 m!880523))

(declare-fun m!880525 () Bool)

(assert (=> b!948291 m!880525))

(declare-fun m!880527 () Bool)

(assert (=> b!948291 m!880527))

(declare-fun m!880529 () Bool)

(assert (=> b!948291 m!880529))

(declare-fun m!880531 () Bool)

(assert (=> b!948291 m!880531))

(assert (=> b!948291 m!880497))

(assert (=> b!948291 m!880493))

(assert (=> b!948291 m!880515))

(declare-fun m!880533 () Bool)

(assert (=> b!948291 m!880533))

(assert (=> b!948291 m!880525))

(declare-fun m!880535 () Bool)

(assert (=> b!948291 m!880535))

(assert (=> b!948291 m!880521))

(declare-fun m!880537 () Bool)

(assert (=> b!948291 m!880537))

(declare-fun m!880539 () Bool)

(assert (=> b!948307 m!880539))

(declare-fun m!880541 () Bool)

(assert (=> b!948307 m!880541))

(declare-fun m!880543 () Bool)

(assert (=> b!948307 m!880543))

(assert (=> b!948307 m!880541))

(assert (=> b!948307 m!880539))

(assert (=> b!948307 m!880497))

(declare-fun m!880545 () Bool)

(assert (=> b!948307 m!880545))

(assert (=> b!948307 m!880497))

(assert (=> b!948160 d!114649))

(declare-fun d!114651 () Bool)

(declare-fun res!636240 () Bool)

(declare-fun e!533828 () Bool)

(assert (=> d!114651 (=> (not res!636240) (not e!533828))))

(declare-fun simpleValid!368 (LongMapFixedSize!4894) Bool)

(assert (=> d!114651 (= res!636240 (simpleValid!368 thiss!1141))))

(assert (=> d!114651 (= (valid!1866 thiss!1141) e!533828)))

(declare-fun b!948318 () Bool)

(declare-fun res!636241 () Bool)

(assert (=> b!948318 (=> (not res!636241) (not e!533828))))

(declare-fun arrayCountValidKeys!0 (array!57387 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!948318 (= res!636241 (= (arrayCountValidKeys!0 (_keys!10663 thiss!1141) #b00000000000000000000000000000000 (size!28076 (_keys!10663 thiss!1141))) (_size!2502 thiss!1141)))))

(declare-fun b!948319 () Bool)

(declare-fun res!636242 () Bool)

(assert (=> b!948319 (=> (not res!636242) (not e!533828))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57387 (_ BitVec 32)) Bool)

(assert (=> b!948319 (= res!636242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10663 thiss!1141) (mask!27502 thiss!1141)))))

(declare-fun b!948320 () Bool)

(declare-datatypes ((List!19322 0))(
  ( (Nil!19319) (Cons!19318 (h!20475 (_ BitVec 64)) (t!27642 List!19322)) )
))
(declare-fun arrayNoDuplicates!0 (array!57387 (_ BitVec 32) List!19322) Bool)

(assert (=> b!948320 (= e!533828 (arrayNoDuplicates!0 (_keys!10663 thiss!1141) #b00000000000000000000000000000000 Nil!19319))))

(assert (= (and d!114651 res!636240) b!948318))

(assert (= (and b!948318 res!636241) b!948319))

(assert (= (and b!948319 res!636242) b!948320))

(declare-fun m!880547 () Bool)

(assert (=> d!114651 m!880547))

(declare-fun m!880549 () Bool)

(assert (=> b!948318 m!880549))

(declare-fun m!880551 () Bool)

(assert (=> b!948319 m!880551))

(declare-fun m!880553 () Bool)

(assert (=> b!948320 m!880553))

(assert (=> start!80948 d!114651))

(declare-fun d!114653 () Bool)

(assert (=> d!114653 (= (array_inv!21482 (_keys!10663 thiss!1141)) (bvsge (size!28076 (_keys!10663 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!948158 d!114653))

(declare-fun d!114655 () Bool)

(assert (=> d!114655 (= (array_inv!21483 (_values!5772 thiss!1141)) (bvsge (size!28075 (_values!5772 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!948158 d!114655))

(declare-fun mapIsEmpty!32960 () Bool)

(declare-fun mapRes!32960 () Bool)

(assert (=> mapIsEmpty!32960 mapRes!32960))

(declare-fun b!948327 () Bool)

(declare-fun e!533833 () Bool)

(assert (=> b!948327 (= e!533833 tp_is_empty!20707)))

(declare-fun condMapEmpty!32960 () Bool)

(declare-fun mapDefault!32960 () ValueCell!9872)

(assert (=> mapNonEmpty!32951 (= condMapEmpty!32960 (= mapRest!32951 ((as const (Array (_ BitVec 32) ValueCell!9872)) mapDefault!32960)))))

(declare-fun e!533834 () Bool)

(assert (=> mapNonEmpty!32951 (= tp!63172 (and e!533834 mapRes!32960))))

(declare-fun b!948328 () Bool)

(assert (=> b!948328 (= e!533834 tp_is_empty!20707)))

(declare-fun mapNonEmpty!32960 () Bool)

(declare-fun tp!63188 () Bool)

(assert (=> mapNonEmpty!32960 (= mapRes!32960 (and tp!63188 e!533833))))

(declare-fun mapKey!32960 () (_ BitVec 32))

(declare-fun mapRest!32960 () (Array (_ BitVec 32) ValueCell!9872))

(declare-fun mapValue!32960 () ValueCell!9872)

(assert (=> mapNonEmpty!32960 (= mapRest!32951 (store mapRest!32960 mapKey!32960 mapValue!32960))))

(assert (= (and mapNonEmpty!32951 condMapEmpty!32960) mapIsEmpty!32960))

(assert (= (and mapNonEmpty!32951 (not condMapEmpty!32960)) mapNonEmpty!32960))

(assert (= (and mapNonEmpty!32960 ((_ is ValueCellFull!9872) mapValue!32960)) b!948327))

(assert (= (and mapNonEmpty!32951 ((_ is ValueCellFull!9872) mapDefault!32960)) b!948328))

(declare-fun m!880555 () Bool)

(assert (=> mapNonEmpty!32960 m!880555))

(declare-fun b_lambda!14303 () Bool)

(assert (= b_lambda!14301 (or (and b!948158 b_free!18199) b_lambda!14303)))

(check-sat (not b!948246) (not b!948299) (not d!114649) (not bm!41188) (not b!948307) (not b!948319) b_and!29611 (not bm!41191) (not d!114647) (not d!114643) (not d!114651) (not b!948302) (not b_next!18199) (not bm!41186) (not bm!41187) tp_is_empty!20707 (not b!948318) (not b!948320) (not b!948237) (not b_lambda!14303) (not mapNonEmpty!32960) (not b!948297) (not b!948289) (not b!948308) (not b!948291) (not b!948244) (not b!948290))
(check-sat b_and!29611 (not b_next!18199))
(get-model)

(declare-fun d!114657 () Bool)

(declare-fun res!636247 () Bool)

(declare-fun e!533839 () Bool)

(assert (=> d!114657 (=> res!636247 e!533839)))

(assert (=> d!114657 (= res!636247 (and ((_ is Cons!19316) (toList!6143 (getCurrentListMap!3305 (_keys!10663 thiss!1141) (_values!5772 thiss!1141) (mask!27502 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141)))) (= (_1!6795 (h!20473 (toList!6143 (getCurrentListMap!3305 (_keys!10663 thiss!1141) (_values!5772 thiss!1141) (mask!27502 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141))))) key!756)))))

(assert (=> d!114657 (= (containsKey!458 (toList!6143 (getCurrentListMap!3305 (_keys!10663 thiss!1141) (_values!5772 thiss!1141) (mask!27502 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141))) key!756) e!533839)))

(declare-fun b!948333 () Bool)

(declare-fun e!533840 () Bool)

(assert (=> b!948333 (= e!533839 e!533840)))

(declare-fun res!636248 () Bool)

(assert (=> b!948333 (=> (not res!636248) (not e!533840))))

(assert (=> b!948333 (= res!636248 (and (or (not ((_ is Cons!19316) (toList!6143 (getCurrentListMap!3305 (_keys!10663 thiss!1141) (_values!5772 thiss!1141) (mask!27502 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141))))) (bvsle (_1!6795 (h!20473 (toList!6143 (getCurrentListMap!3305 (_keys!10663 thiss!1141) (_values!5772 thiss!1141) (mask!27502 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141))))) key!756)) ((_ is Cons!19316) (toList!6143 (getCurrentListMap!3305 (_keys!10663 thiss!1141) (_values!5772 thiss!1141) (mask!27502 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141)))) (bvslt (_1!6795 (h!20473 (toList!6143 (getCurrentListMap!3305 (_keys!10663 thiss!1141) (_values!5772 thiss!1141) (mask!27502 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141))))) key!756)))))

(declare-fun b!948334 () Bool)

(assert (=> b!948334 (= e!533840 (containsKey!458 (t!27638 (toList!6143 (getCurrentListMap!3305 (_keys!10663 thiss!1141) (_values!5772 thiss!1141) (mask!27502 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141)))) key!756))))

(assert (= (and d!114657 (not res!636247)) b!948333))

(assert (= (and b!948333 res!636248) b!948334))

(declare-fun m!880557 () Bool)

(assert (=> b!948334 m!880557))

(assert (=> d!114647 d!114657))

(declare-fun d!114659 () Bool)

(declare-fun e!533843 () Bool)

(assert (=> d!114659 e!533843))

(declare-fun res!636254 () Bool)

(assert (=> d!114659 (=> (not res!636254) (not e!533843))))

(declare-fun lt!426907 () ListLongMap!12255)

(assert (=> d!114659 (= res!636254 (contains!5170 lt!426907 (_1!6795 (tuple2!13569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141)))))))

(declare-fun lt!426905 () List!19320)

(assert (=> d!114659 (= lt!426907 (ListLongMap!12256 lt!426905))))

(declare-fun lt!426904 () Unit!31831)

(declare-fun lt!426906 () Unit!31831)

(assert (=> d!114659 (= lt!426904 lt!426906)))

(assert (=> d!114659 (= (getValueByKey!494 lt!426905 (_1!6795 (tuple2!13569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141)))) (Some!499 (_2!6795 (tuple2!13569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!264 (List!19320 (_ BitVec 64) V!32575) Unit!31831)

(assert (=> d!114659 (= lt!426906 (lemmaContainsTupThenGetReturnValue!264 lt!426905 (_1!6795 (tuple2!13569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141))) (_2!6795 (tuple2!13569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141)))))))

(declare-fun insertStrictlySorted!321 (List!19320 (_ BitVec 64) V!32575) List!19320)

(assert (=> d!114659 (= lt!426905 (insertStrictlySorted!321 (toList!6143 call!41192) (_1!6795 (tuple2!13569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141))) (_2!6795 (tuple2!13569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141)))))))

(assert (=> d!114659 (= (+!2875 call!41192 (tuple2!13569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141))) lt!426907)))

(declare-fun b!948339 () Bool)

(declare-fun res!636253 () Bool)

(assert (=> b!948339 (=> (not res!636253) (not e!533843))))

(assert (=> b!948339 (= res!636253 (= (getValueByKey!494 (toList!6143 lt!426907) (_1!6795 (tuple2!13569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141)))) (Some!499 (_2!6795 (tuple2!13569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141))))))))

(declare-fun b!948340 () Bool)

(declare-fun contains!5172 (List!19320 tuple2!13568) Bool)

(assert (=> b!948340 (= e!533843 (contains!5172 (toList!6143 lt!426907) (tuple2!13569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141))))))

(assert (= (and d!114659 res!636254) b!948339))

(assert (= (and b!948339 res!636253) b!948340))

(declare-fun m!880559 () Bool)

(assert (=> d!114659 m!880559))

(declare-fun m!880561 () Bool)

(assert (=> d!114659 m!880561))

(declare-fun m!880563 () Bool)

(assert (=> d!114659 m!880563))

(declare-fun m!880565 () Bool)

(assert (=> d!114659 m!880565))

(declare-fun m!880567 () Bool)

(assert (=> b!948339 m!880567))

(declare-fun m!880569 () Bool)

(assert (=> b!948340 m!880569))

(assert (=> b!948308 d!114659))

(declare-fun d!114661 () Bool)

(assert (=> d!114661 (= (apply!865 (+!2875 lt!426876 (tuple2!13569 lt!426890 (minValue!5585 thiss!1141))) lt!426884) (apply!865 lt!426876 lt!426884))))

(declare-fun lt!426910 () Unit!31831)

(declare-fun choose!1584 (ListLongMap!12255 (_ BitVec 64) V!32575 (_ BitVec 64)) Unit!31831)

(assert (=> d!114661 (= lt!426910 (choose!1584 lt!426876 lt!426890 (minValue!5585 thiss!1141) lt!426884))))

(declare-fun e!533846 () Bool)

(assert (=> d!114661 e!533846))

(declare-fun res!636257 () Bool)

(assert (=> d!114661 (=> (not res!636257) (not e!533846))))

(assert (=> d!114661 (= res!636257 (contains!5170 lt!426876 lt!426884))))

(assert (=> d!114661 (= (addApplyDifferent!444 lt!426876 lt!426890 (minValue!5585 thiss!1141) lt!426884) lt!426910)))

(declare-fun b!948344 () Bool)

(assert (=> b!948344 (= e!533846 (not (= lt!426884 lt!426890)))))

(assert (= (and d!114661 res!636257) b!948344))

(assert (=> d!114661 m!880525))

(assert (=> d!114661 m!880523))

(declare-fun m!880571 () Bool)

(assert (=> d!114661 m!880571))

(assert (=> d!114661 m!880525))

(assert (=> d!114661 m!880527))

(declare-fun m!880573 () Bool)

(assert (=> d!114661 m!880573))

(assert (=> b!948291 d!114661))

(declare-fun d!114663 () Bool)

(declare-fun e!533847 () Bool)

(assert (=> d!114663 e!533847))

(declare-fun res!636259 () Bool)

(assert (=> d!114663 (=> (not res!636259) (not e!533847))))

(declare-fun lt!426914 () ListLongMap!12255)

(assert (=> d!114663 (= res!636259 (contains!5170 lt!426914 (_1!6795 (tuple2!13569 lt!426877 (zeroValue!5585 thiss!1141)))))))

(declare-fun lt!426912 () List!19320)

(assert (=> d!114663 (= lt!426914 (ListLongMap!12256 lt!426912))))

(declare-fun lt!426911 () Unit!31831)

(declare-fun lt!426913 () Unit!31831)

(assert (=> d!114663 (= lt!426911 lt!426913)))

(assert (=> d!114663 (= (getValueByKey!494 lt!426912 (_1!6795 (tuple2!13569 lt!426877 (zeroValue!5585 thiss!1141)))) (Some!499 (_2!6795 (tuple2!13569 lt!426877 (zeroValue!5585 thiss!1141)))))))

(assert (=> d!114663 (= lt!426913 (lemmaContainsTupThenGetReturnValue!264 lt!426912 (_1!6795 (tuple2!13569 lt!426877 (zeroValue!5585 thiss!1141))) (_2!6795 (tuple2!13569 lt!426877 (zeroValue!5585 thiss!1141)))))))

(assert (=> d!114663 (= lt!426912 (insertStrictlySorted!321 (toList!6143 lt!426887) (_1!6795 (tuple2!13569 lt!426877 (zeroValue!5585 thiss!1141))) (_2!6795 (tuple2!13569 lt!426877 (zeroValue!5585 thiss!1141)))))))

(assert (=> d!114663 (= (+!2875 lt!426887 (tuple2!13569 lt!426877 (zeroValue!5585 thiss!1141))) lt!426914)))

(declare-fun b!948345 () Bool)

(declare-fun res!636258 () Bool)

(assert (=> b!948345 (=> (not res!636258) (not e!533847))))

(assert (=> b!948345 (= res!636258 (= (getValueByKey!494 (toList!6143 lt!426914) (_1!6795 (tuple2!13569 lt!426877 (zeroValue!5585 thiss!1141)))) (Some!499 (_2!6795 (tuple2!13569 lt!426877 (zeroValue!5585 thiss!1141))))))))

(declare-fun b!948346 () Bool)

(assert (=> b!948346 (= e!533847 (contains!5172 (toList!6143 lt!426914) (tuple2!13569 lt!426877 (zeroValue!5585 thiss!1141))))))

(assert (= (and d!114663 res!636259) b!948345))

(assert (= (and b!948345 res!636258) b!948346))

(declare-fun m!880575 () Bool)

(assert (=> d!114663 m!880575))

(declare-fun m!880577 () Bool)

(assert (=> d!114663 m!880577))

(declare-fun m!880579 () Bool)

(assert (=> d!114663 m!880579))

(declare-fun m!880581 () Bool)

(assert (=> d!114663 m!880581))

(declare-fun m!880583 () Bool)

(assert (=> b!948345 m!880583))

(declare-fun m!880585 () Bool)

(assert (=> b!948346 m!880585))

(assert (=> b!948291 d!114663))

(declare-fun d!114665 () Bool)

(declare-fun get!14498 (Option!500) V!32575)

(assert (=> d!114665 (= (apply!865 (+!2875 lt!426881 (tuple2!13569 lt!426883 (minValue!5585 thiss!1141))) lt!426885) (get!14498 (getValueByKey!494 (toList!6143 (+!2875 lt!426881 (tuple2!13569 lt!426883 (minValue!5585 thiss!1141)))) lt!426885)))))

(declare-fun bs!26625 () Bool)

(assert (= bs!26625 d!114665))

(declare-fun m!880587 () Bool)

(assert (=> bs!26625 m!880587))

(assert (=> bs!26625 m!880587))

(declare-fun m!880589 () Bool)

(assert (=> bs!26625 m!880589))

(assert (=> b!948291 d!114665))

(declare-fun d!114667 () Bool)

(assert (=> d!114667 (= (apply!865 (+!2875 lt!426881 (tuple2!13569 lt!426883 (minValue!5585 thiss!1141))) lt!426885) (apply!865 lt!426881 lt!426885))))

(declare-fun lt!426915 () Unit!31831)

(assert (=> d!114667 (= lt!426915 (choose!1584 lt!426881 lt!426883 (minValue!5585 thiss!1141) lt!426885))))

(declare-fun e!533848 () Bool)

(assert (=> d!114667 e!533848))

(declare-fun res!636260 () Bool)

(assert (=> d!114667 (=> (not res!636260) (not e!533848))))

(assert (=> d!114667 (= res!636260 (contains!5170 lt!426881 lt!426885))))

(assert (=> d!114667 (= (addApplyDifferent!444 lt!426881 lt!426883 (minValue!5585 thiss!1141) lt!426885) lt!426915)))

(declare-fun b!948347 () Bool)

(assert (=> b!948347 (= e!533848 (not (= lt!426885 lt!426883)))))

(assert (= (and d!114667 res!636260) b!948347))

(assert (=> d!114667 m!880509))

(assert (=> d!114667 m!880513))

(declare-fun m!880591 () Bool)

(assert (=> d!114667 m!880591))

(assert (=> d!114667 m!880509))

(assert (=> d!114667 m!880511))

(declare-fun m!880593 () Bool)

(assert (=> d!114667 m!880593))

(assert (=> b!948291 d!114667))

(declare-fun d!114669 () Bool)

(assert (=> d!114669 (contains!5170 (+!2875 lt!426887 (tuple2!13569 lt!426877 (zeroValue!5585 thiss!1141))) lt!426889)))

(declare-fun lt!426918 () Unit!31831)

(declare-fun choose!1585 (ListLongMap!12255 (_ BitVec 64) V!32575 (_ BitVec 64)) Unit!31831)

(assert (=> d!114669 (= lt!426918 (choose!1585 lt!426887 lt!426877 (zeroValue!5585 thiss!1141) lt!426889))))

(assert (=> d!114669 (contains!5170 lt!426887 lt!426889)))

(assert (=> d!114669 (= (addStillContains!564 lt!426887 lt!426877 (zeroValue!5585 thiss!1141) lt!426889) lt!426918)))

(declare-fun bs!26626 () Bool)

(assert (= bs!26626 d!114669))

(assert (=> bs!26626 m!880521))

(assert (=> bs!26626 m!880521))

(assert (=> bs!26626 m!880537))

(declare-fun m!880595 () Bool)

(assert (=> bs!26626 m!880595))

(declare-fun m!880597 () Bool)

(assert (=> bs!26626 m!880597))

(assert (=> b!948291 d!114669))

(declare-fun d!114671 () Bool)

(declare-fun e!533850 () Bool)

(assert (=> d!114671 e!533850))

(declare-fun res!636261 () Bool)

(assert (=> d!114671 (=> res!636261 e!533850)))

(declare-fun lt!426920 () Bool)

(assert (=> d!114671 (= res!636261 (not lt!426920))))

(declare-fun lt!426919 () Bool)

(assert (=> d!114671 (= lt!426920 lt!426919)))

(declare-fun lt!426921 () Unit!31831)

(declare-fun e!533849 () Unit!31831)

(assert (=> d!114671 (= lt!426921 e!533849)))

(declare-fun c!98829 () Bool)

(assert (=> d!114671 (= c!98829 lt!426919)))

(assert (=> d!114671 (= lt!426919 (containsKey!458 (toList!6143 (+!2875 lt!426887 (tuple2!13569 lt!426877 (zeroValue!5585 thiss!1141)))) lt!426889))))

(assert (=> d!114671 (= (contains!5170 (+!2875 lt!426887 (tuple2!13569 lt!426877 (zeroValue!5585 thiss!1141))) lt!426889) lt!426920)))

(declare-fun b!948349 () Bool)

(declare-fun lt!426922 () Unit!31831)

(assert (=> b!948349 (= e!533849 lt!426922)))

(assert (=> b!948349 (= lt!426922 (lemmaContainsKeyImpliesGetValueByKeyDefined!353 (toList!6143 (+!2875 lt!426887 (tuple2!13569 lt!426877 (zeroValue!5585 thiss!1141)))) lt!426889))))

(assert (=> b!948349 (isDefined!366 (getValueByKey!494 (toList!6143 (+!2875 lt!426887 (tuple2!13569 lt!426877 (zeroValue!5585 thiss!1141)))) lt!426889))))

(declare-fun b!948350 () Bool)

(declare-fun Unit!31835 () Unit!31831)

(assert (=> b!948350 (= e!533849 Unit!31835)))

(declare-fun b!948351 () Bool)

(assert (=> b!948351 (= e!533850 (isDefined!366 (getValueByKey!494 (toList!6143 (+!2875 lt!426887 (tuple2!13569 lt!426877 (zeroValue!5585 thiss!1141)))) lt!426889)))))

(assert (= (and d!114671 c!98829) b!948349))

(assert (= (and d!114671 (not c!98829)) b!948350))

(assert (= (and d!114671 (not res!636261)) b!948351))

(declare-fun m!880599 () Bool)

(assert (=> d!114671 m!880599))

(declare-fun m!880601 () Bool)

(assert (=> b!948349 m!880601))

(declare-fun m!880603 () Bool)

(assert (=> b!948349 m!880603))

(assert (=> b!948349 m!880603))

(declare-fun m!880605 () Bool)

(assert (=> b!948349 m!880605))

(assert (=> b!948351 m!880603))

(assert (=> b!948351 m!880603))

(assert (=> b!948351 m!880605))

(assert (=> b!948291 d!114671))

(declare-fun d!114673 () Bool)

(declare-fun e!533851 () Bool)

(assert (=> d!114673 e!533851))

(declare-fun res!636263 () Bool)

(assert (=> d!114673 (=> (not res!636263) (not e!533851))))

(declare-fun lt!426926 () ListLongMap!12255)

(assert (=> d!114673 (= res!636263 (contains!5170 lt!426926 (_1!6795 (tuple2!13569 lt!426890 (minValue!5585 thiss!1141)))))))

(declare-fun lt!426924 () List!19320)

(assert (=> d!114673 (= lt!426926 (ListLongMap!12256 lt!426924))))

(declare-fun lt!426923 () Unit!31831)

(declare-fun lt!426925 () Unit!31831)

(assert (=> d!114673 (= lt!426923 lt!426925)))

(assert (=> d!114673 (= (getValueByKey!494 lt!426924 (_1!6795 (tuple2!13569 lt!426890 (minValue!5585 thiss!1141)))) (Some!499 (_2!6795 (tuple2!13569 lt!426890 (minValue!5585 thiss!1141)))))))

(assert (=> d!114673 (= lt!426925 (lemmaContainsTupThenGetReturnValue!264 lt!426924 (_1!6795 (tuple2!13569 lt!426890 (minValue!5585 thiss!1141))) (_2!6795 (tuple2!13569 lt!426890 (minValue!5585 thiss!1141)))))))

(assert (=> d!114673 (= lt!426924 (insertStrictlySorted!321 (toList!6143 lt!426876) (_1!6795 (tuple2!13569 lt!426890 (minValue!5585 thiss!1141))) (_2!6795 (tuple2!13569 lt!426890 (minValue!5585 thiss!1141)))))))

(assert (=> d!114673 (= (+!2875 lt!426876 (tuple2!13569 lt!426890 (minValue!5585 thiss!1141))) lt!426926)))

(declare-fun b!948352 () Bool)

(declare-fun res!636262 () Bool)

(assert (=> b!948352 (=> (not res!636262) (not e!533851))))

(assert (=> b!948352 (= res!636262 (= (getValueByKey!494 (toList!6143 lt!426926) (_1!6795 (tuple2!13569 lt!426890 (minValue!5585 thiss!1141)))) (Some!499 (_2!6795 (tuple2!13569 lt!426890 (minValue!5585 thiss!1141))))))))

(declare-fun b!948353 () Bool)

(assert (=> b!948353 (= e!533851 (contains!5172 (toList!6143 lt!426926) (tuple2!13569 lt!426890 (minValue!5585 thiss!1141))))))

(assert (= (and d!114673 res!636263) b!948352))

(assert (= (and b!948352 res!636262) b!948353))

(declare-fun m!880607 () Bool)

(assert (=> d!114673 m!880607))

(declare-fun m!880609 () Bool)

(assert (=> d!114673 m!880609))

(declare-fun m!880611 () Bool)

(assert (=> d!114673 m!880611))

(declare-fun m!880613 () Bool)

(assert (=> d!114673 m!880613))

(declare-fun m!880615 () Bool)

(assert (=> b!948352 m!880615))

(declare-fun m!880617 () Bool)

(assert (=> b!948353 m!880617))

(assert (=> b!948291 d!114673))

(declare-fun d!114675 () Bool)

(declare-fun e!533852 () Bool)

(assert (=> d!114675 e!533852))

(declare-fun res!636265 () Bool)

(assert (=> d!114675 (=> (not res!636265) (not e!533852))))

(declare-fun lt!426930 () ListLongMap!12255)

(assert (=> d!114675 (= res!636265 (contains!5170 lt!426930 (_1!6795 (tuple2!13569 lt!426883 (minValue!5585 thiss!1141)))))))

(declare-fun lt!426928 () List!19320)

(assert (=> d!114675 (= lt!426930 (ListLongMap!12256 lt!426928))))

(declare-fun lt!426927 () Unit!31831)

(declare-fun lt!426929 () Unit!31831)

(assert (=> d!114675 (= lt!426927 lt!426929)))

(assert (=> d!114675 (= (getValueByKey!494 lt!426928 (_1!6795 (tuple2!13569 lt!426883 (minValue!5585 thiss!1141)))) (Some!499 (_2!6795 (tuple2!13569 lt!426883 (minValue!5585 thiss!1141)))))))

(assert (=> d!114675 (= lt!426929 (lemmaContainsTupThenGetReturnValue!264 lt!426928 (_1!6795 (tuple2!13569 lt!426883 (minValue!5585 thiss!1141))) (_2!6795 (tuple2!13569 lt!426883 (minValue!5585 thiss!1141)))))))

(assert (=> d!114675 (= lt!426928 (insertStrictlySorted!321 (toList!6143 lt!426881) (_1!6795 (tuple2!13569 lt!426883 (minValue!5585 thiss!1141))) (_2!6795 (tuple2!13569 lt!426883 (minValue!5585 thiss!1141)))))))

(assert (=> d!114675 (= (+!2875 lt!426881 (tuple2!13569 lt!426883 (minValue!5585 thiss!1141))) lt!426930)))

(declare-fun b!948354 () Bool)

(declare-fun res!636264 () Bool)

(assert (=> b!948354 (=> (not res!636264) (not e!533852))))

(assert (=> b!948354 (= res!636264 (= (getValueByKey!494 (toList!6143 lt!426930) (_1!6795 (tuple2!13569 lt!426883 (minValue!5585 thiss!1141)))) (Some!499 (_2!6795 (tuple2!13569 lt!426883 (minValue!5585 thiss!1141))))))))

(declare-fun b!948355 () Bool)

(assert (=> b!948355 (= e!533852 (contains!5172 (toList!6143 lt!426930) (tuple2!13569 lt!426883 (minValue!5585 thiss!1141))))))

(assert (= (and d!114675 res!636265) b!948354))

(assert (= (and b!948354 res!636264) b!948355))

(declare-fun m!880619 () Bool)

(assert (=> d!114675 m!880619))

(declare-fun m!880621 () Bool)

(assert (=> d!114675 m!880621))

(declare-fun m!880623 () Bool)

(assert (=> d!114675 m!880623))

(declare-fun m!880625 () Bool)

(assert (=> d!114675 m!880625))

(declare-fun m!880627 () Bool)

(assert (=> b!948354 m!880627))

(declare-fun m!880629 () Bool)

(assert (=> b!948355 m!880629))

(assert (=> b!948291 d!114675))

(declare-fun d!114677 () Bool)

(assert (=> d!114677 (= (apply!865 (+!2875 lt!426879 (tuple2!13569 lt!426878 (zeroValue!5585 thiss!1141))) lt!426880) (apply!865 lt!426879 lt!426880))))

(declare-fun lt!426931 () Unit!31831)

(assert (=> d!114677 (= lt!426931 (choose!1584 lt!426879 lt!426878 (zeroValue!5585 thiss!1141) lt!426880))))

(declare-fun e!533853 () Bool)

(assert (=> d!114677 e!533853))

(declare-fun res!636266 () Bool)

(assert (=> d!114677 (=> (not res!636266) (not e!533853))))

(assert (=> d!114677 (= res!636266 (contains!5170 lt!426879 lt!426880))))

(assert (=> d!114677 (= (addApplyDifferent!444 lt!426879 lt!426878 (zeroValue!5585 thiss!1141) lt!426880) lt!426931)))

(declare-fun b!948356 () Bool)

(assert (=> b!948356 (= e!533853 (not (= lt!426880 lt!426878)))))

(assert (= (and d!114677 res!636266) b!948356))

(assert (=> d!114677 m!880515))

(assert (=> d!114677 m!880519))

(declare-fun m!880631 () Bool)

(assert (=> d!114677 m!880631))

(assert (=> d!114677 m!880515))

(assert (=> d!114677 m!880517))

(declare-fun m!880633 () Bool)

(assert (=> d!114677 m!880633))

(assert (=> b!948291 d!114677))

(declare-fun d!114679 () Bool)

(assert (=> d!114679 (= (apply!865 (+!2875 lt!426879 (tuple2!13569 lt!426878 (zeroValue!5585 thiss!1141))) lt!426880) (get!14498 (getValueByKey!494 (toList!6143 (+!2875 lt!426879 (tuple2!13569 lt!426878 (zeroValue!5585 thiss!1141)))) lt!426880)))))

(declare-fun bs!26627 () Bool)

(assert (= bs!26627 d!114679))

(declare-fun m!880635 () Bool)

(assert (=> bs!26627 m!880635))

(assert (=> bs!26627 m!880635))

(declare-fun m!880637 () Bool)

(assert (=> bs!26627 m!880637))

(assert (=> b!948291 d!114679))

(declare-fun d!114681 () Bool)

(assert (=> d!114681 (= (apply!865 lt!426876 lt!426884) (get!14498 (getValueByKey!494 (toList!6143 lt!426876) lt!426884)))))

(declare-fun bs!26628 () Bool)

(assert (= bs!26628 d!114681))

(declare-fun m!880639 () Bool)

(assert (=> bs!26628 m!880639))

(assert (=> bs!26628 m!880639))

(declare-fun m!880641 () Bool)

(assert (=> bs!26628 m!880641))

(assert (=> b!948291 d!114681))

(declare-fun d!114683 () Bool)

(assert (=> d!114683 (= (apply!865 (+!2875 lt!426876 (tuple2!13569 lt!426890 (minValue!5585 thiss!1141))) lt!426884) (get!14498 (getValueByKey!494 (toList!6143 (+!2875 lt!426876 (tuple2!13569 lt!426890 (minValue!5585 thiss!1141)))) lt!426884)))))

(declare-fun bs!26629 () Bool)

(assert (= bs!26629 d!114683))

(declare-fun m!880643 () Bool)

(assert (=> bs!26629 m!880643))

(assert (=> bs!26629 m!880643))

(declare-fun m!880645 () Bool)

(assert (=> bs!26629 m!880645))

(assert (=> b!948291 d!114683))

(declare-fun b!948381 () Bool)

(declare-fun e!533872 () Bool)

(declare-fun e!533873 () Bool)

(assert (=> b!948381 (= e!533872 e!533873)))

(declare-fun c!98840 () Bool)

(declare-fun e!533871 () Bool)

(assert (=> b!948381 (= c!98840 e!533871)))

(declare-fun res!636276 () Bool)

(assert (=> b!948381 (=> (not res!636276) (not e!533871))))

(assert (=> b!948381 (= res!636276 (bvslt #b00000000000000000000000000000000 (size!28076 (_keys!10663 thiss!1141))))))

(declare-fun d!114685 () Bool)

(assert (=> d!114685 e!533872))

(declare-fun res!636278 () Bool)

(assert (=> d!114685 (=> (not res!636278) (not e!533872))))

(declare-fun lt!426947 () ListLongMap!12255)

(assert (=> d!114685 (= res!636278 (not (contains!5170 lt!426947 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!533874 () ListLongMap!12255)

(assert (=> d!114685 (= lt!426947 e!533874)))

(declare-fun c!98841 () Bool)

(assert (=> d!114685 (= c!98841 (bvsge #b00000000000000000000000000000000 (size!28076 (_keys!10663 thiss!1141))))))

(assert (=> d!114685 (validMask!0 (mask!27502 thiss!1141))))

(assert (=> d!114685 (= (getCurrentListMapNoExtraKeys!3347 (_keys!10663 thiss!1141) (_values!5772 thiss!1141) (mask!27502 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141)) lt!426947)))

(declare-fun bm!41194 () Bool)

(declare-fun call!41197 () ListLongMap!12255)

(assert (=> bm!41194 (= call!41197 (getCurrentListMapNoExtraKeys!3347 (_keys!10663 thiss!1141) (_values!5772 thiss!1141) (mask!27502 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5749 thiss!1141)))))

(declare-fun b!948382 () Bool)

(assert (=> b!948382 (= e!533871 (validKeyInArray!0 (select (arr!27600 (_keys!10663 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!948382 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!948383 () Bool)

(declare-fun e!533869 () ListLongMap!12255)

(assert (=> b!948383 (= e!533874 e!533869)))

(declare-fun c!98838 () Bool)

(assert (=> b!948383 (= c!98838 (validKeyInArray!0 (select (arr!27600 (_keys!10663 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!948384 () Bool)

(declare-fun e!533870 () Bool)

(assert (=> b!948384 (= e!533873 e!533870)))

(assert (=> b!948384 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28076 (_keys!10663 thiss!1141))))))

(declare-fun res!636277 () Bool)

(assert (=> b!948384 (= res!636277 (contains!5170 lt!426947 (select (arr!27600 (_keys!10663 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!948384 (=> (not res!636277) (not e!533870))))

(declare-fun b!948385 () Bool)

(declare-fun lt!426951 () Unit!31831)

(declare-fun lt!426952 () Unit!31831)

(assert (=> b!948385 (= lt!426951 lt!426952)))

(declare-fun lt!426949 () ListLongMap!12255)

(declare-fun lt!426950 () (_ BitVec 64))

(declare-fun lt!426946 () (_ BitVec 64))

(declare-fun lt!426948 () V!32575)

(assert (=> b!948385 (not (contains!5170 (+!2875 lt!426949 (tuple2!13569 lt!426950 lt!426948)) lt!426946))))

(declare-fun addStillNotContains!225 (ListLongMap!12255 (_ BitVec 64) V!32575 (_ BitVec 64)) Unit!31831)

(assert (=> b!948385 (= lt!426952 (addStillNotContains!225 lt!426949 lt!426950 lt!426948 lt!426946))))

(assert (=> b!948385 (= lt!426946 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!948385 (= lt!426948 (get!14497 (select (arr!27599 (_values!5772 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1631 (defaultEntry!5749 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!948385 (= lt!426950 (select (arr!27600 (_keys!10663 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!948385 (= lt!426949 call!41197)))

(assert (=> b!948385 (= e!533869 (+!2875 call!41197 (tuple2!13569 (select (arr!27600 (_keys!10663 thiss!1141)) #b00000000000000000000000000000000) (get!14497 (select (arr!27599 (_values!5772 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1631 (defaultEntry!5749 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!948386 () Bool)

(declare-fun e!533868 () Bool)

(assert (=> b!948386 (= e!533873 e!533868)))

(declare-fun c!98839 () Bool)

(assert (=> b!948386 (= c!98839 (bvslt #b00000000000000000000000000000000 (size!28076 (_keys!10663 thiss!1141))))))

(declare-fun b!948387 () Bool)

(assert (=> b!948387 (= e!533868 (= lt!426947 (getCurrentListMapNoExtraKeys!3347 (_keys!10663 thiss!1141) (_values!5772 thiss!1141) (mask!27502 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5749 thiss!1141))))))

(declare-fun b!948388 () Bool)

(declare-fun res!636275 () Bool)

(assert (=> b!948388 (=> (not res!636275) (not e!533872))))

(assert (=> b!948388 (= res!636275 (not (contains!5170 lt!426947 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!948389 () Bool)

(declare-fun isEmpty!711 (ListLongMap!12255) Bool)

(assert (=> b!948389 (= e!533868 (isEmpty!711 lt!426947))))

(declare-fun b!948390 () Bool)

(assert (=> b!948390 (= e!533869 call!41197)))

(declare-fun b!948391 () Bool)

(assert (=> b!948391 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28076 (_keys!10663 thiss!1141))))))

(assert (=> b!948391 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28075 (_values!5772 thiss!1141))))))

(assert (=> b!948391 (= e!533870 (= (apply!865 lt!426947 (select (arr!27600 (_keys!10663 thiss!1141)) #b00000000000000000000000000000000)) (get!14497 (select (arr!27599 (_values!5772 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1631 (defaultEntry!5749 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!948392 () Bool)

(assert (=> b!948392 (= e!533874 (ListLongMap!12256 Nil!19317))))

(assert (= (and d!114685 c!98841) b!948392))

(assert (= (and d!114685 (not c!98841)) b!948383))

(assert (= (and b!948383 c!98838) b!948385))

(assert (= (and b!948383 (not c!98838)) b!948390))

(assert (= (or b!948385 b!948390) bm!41194))

(assert (= (and d!114685 res!636278) b!948388))

(assert (= (and b!948388 res!636275) b!948381))

(assert (= (and b!948381 res!636276) b!948382))

(assert (= (and b!948381 c!98840) b!948384))

(assert (= (and b!948381 (not c!98840)) b!948386))

(assert (= (and b!948384 res!636277) b!948391))

(assert (= (and b!948386 c!98839) b!948387))

(assert (= (and b!948386 (not c!98839)) b!948389))

(declare-fun b_lambda!14305 () Bool)

(assert (=> (not b_lambda!14305) (not b!948385)))

(assert (=> b!948385 t!27641))

(declare-fun b_and!29613 () Bool)

(assert (= b_and!29611 (and (=> t!27641 result!12251) b_and!29613)))

(declare-fun b_lambda!14307 () Bool)

(assert (=> (not b_lambda!14307) (not b!948391)))

(assert (=> b!948391 t!27641))

(declare-fun b_and!29615 () Bool)

(assert (= b_and!29613 (and (=> t!27641 result!12251) b_and!29615)))

(declare-fun m!880647 () Bool)

(assert (=> b!948387 m!880647))

(declare-fun m!880649 () Bool)

(assert (=> b!948388 m!880649))

(declare-fun m!880651 () Bool)

(assert (=> d!114685 m!880651))

(assert (=> d!114685 m!880437))

(assert (=> b!948391 m!880539))

(assert (=> b!948391 m!880497))

(assert (=> b!948391 m!880497))

(declare-fun m!880653 () Bool)

(assert (=> b!948391 m!880653))

(assert (=> b!948391 m!880541))

(assert (=> b!948391 m!880539))

(assert (=> b!948391 m!880541))

(assert (=> b!948391 m!880543))

(assert (=> b!948384 m!880497))

(assert (=> b!948384 m!880497))

(declare-fun m!880655 () Bool)

(assert (=> b!948384 m!880655))

(declare-fun m!880657 () Bool)

(assert (=> b!948389 m!880657))

(assert (=> b!948383 m!880497))

(assert (=> b!948383 m!880497))

(assert (=> b!948383 m!880499))

(assert (=> bm!41194 m!880647))

(assert (=> b!948382 m!880497))

(assert (=> b!948382 m!880497))

(assert (=> b!948382 m!880499))

(declare-fun m!880659 () Bool)

(assert (=> b!948385 m!880659))

(assert (=> b!948385 m!880539))

(declare-fun m!880661 () Bool)

(assert (=> b!948385 m!880661))

(assert (=> b!948385 m!880497))

(declare-fun m!880663 () Bool)

(assert (=> b!948385 m!880663))

(assert (=> b!948385 m!880663))

(declare-fun m!880665 () Bool)

(assert (=> b!948385 m!880665))

(assert (=> b!948385 m!880541))

(assert (=> b!948385 m!880539))

(assert (=> b!948385 m!880541))

(assert (=> b!948385 m!880543))

(assert (=> b!948291 d!114685))

(declare-fun d!114687 () Bool)

(assert (=> d!114687 (= (apply!865 lt!426879 lt!426880) (get!14498 (getValueByKey!494 (toList!6143 lt!426879) lt!426880)))))

(declare-fun bs!26630 () Bool)

(assert (= bs!26630 d!114687))

(declare-fun m!880667 () Bool)

(assert (=> bs!26630 m!880667))

(assert (=> bs!26630 m!880667))

(declare-fun m!880669 () Bool)

(assert (=> bs!26630 m!880669))

(assert (=> b!948291 d!114687))

(declare-fun d!114689 () Bool)

(assert (=> d!114689 (= (apply!865 lt!426881 lt!426885) (get!14498 (getValueByKey!494 (toList!6143 lt!426881) lt!426885)))))

(declare-fun bs!26631 () Bool)

(assert (= bs!26631 d!114689))

(declare-fun m!880671 () Bool)

(assert (=> bs!26631 m!880671))

(assert (=> bs!26631 m!880671))

(declare-fun m!880673 () Bool)

(assert (=> bs!26631 m!880673))

(assert (=> b!948291 d!114689))

(declare-fun d!114691 () Bool)

(declare-fun e!533875 () Bool)

(assert (=> d!114691 e!533875))

(declare-fun res!636280 () Bool)

(assert (=> d!114691 (=> (not res!636280) (not e!533875))))

(declare-fun lt!426956 () ListLongMap!12255)

(assert (=> d!114691 (= res!636280 (contains!5170 lt!426956 (_1!6795 (tuple2!13569 lt!426878 (zeroValue!5585 thiss!1141)))))))

(declare-fun lt!426954 () List!19320)

(assert (=> d!114691 (= lt!426956 (ListLongMap!12256 lt!426954))))

(declare-fun lt!426953 () Unit!31831)

(declare-fun lt!426955 () Unit!31831)

(assert (=> d!114691 (= lt!426953 lt!426955)))

(assert (=> d!114691 (= (getValueByKey!494 lt!426954 (_1!6795 (tuple2!13569 lt!426878 (zeroValue!5585 thiss!1141)))) (Some!499 (_2!6795 (tuple2!13569 lt!426878 (zeroValue!5585 thiss!1141)))))))

(assert (=> d!114691 (= lt!426955 (lemmaContainsTupThenGetReturnValue!264 lt!426954 (_1!6795 (tuple2!13569 lt!426878 (zeroValue!5585 thiss!1141))) (_2!6795 (tuple2!13569 lt!426878 (zeroValue!5585 thiss!1141)))))))

(assert (=> d!114691 (= lt!426954 (insertStrictlySorted!321 (toList!6143 lt!426879) (_1!6795 (tuple2!13569 lt!426878 (zeroValue!5585 thiss!1141))) (_2!6795 (tuple2!13569 lt!426878 (zeroValue!5585 thiss!1141)))))))

(assert (=> d!114691 (= (+!2875 lt!426879 (tuple2!13569 lt!426878 (zeroValue!5585 thiss!1141))) lt!426956)))

(declare-fun b!948393 () Bool)

(declare-fun res!636279 () Bool)

(assert (=> b!948393 (=> (not res!636279) (not e!533875))))

(assert (=> b!948393 (= res!636279 (= (getValueByKey!494 (toList!6143 lt!426956) (_1!6795 (tuple2!13569 lt!426878 (zeroValue!5585 thiss!1141)))) (Some!499 (_2!6795 (tuple2!13569 lt!426878 (zeroValue!5585 thiss!1141))))))))

(declare-fun b!948394 () Bool)

(assert (=> b!948394 (= e!533875 (contains!5172 (toList!6143 lt!426956) (tuple2!13569 lt!426878 (zeroValue!5585 thiss!1141))))))

(assert (= (and d!114691 res!636280) b!948393))

(assert (= (and b!948393 res!636279) b!948394))

(declare-fun m!880675 () Bool)

(assert (=> d!114691 m!880675))

(declare-fun m!880677 () Bool)

(assert (=> d!114691 m!880677))

(declare-fun m!880679 () Bool)

(assert (=> d!114691 m!880679))

(declare-fun m!880681 () Bool)

(assert (=> d!114691 m!880681))

(declare-fun m!880683 () Bool)

(assert (=> b!948393 m!880683))

(declare-fun m!880685 () Bool)

(assert (=> b!948394 m!880685))

(assert (=> b!948291 d!114691))

(declare-fun d!114693 () Bool)

(assert (=> d!114693 (= (validKeyInArray!0 (select (arr!27600 (_keys!10663 thiss!1141)) #b00000000000000000000000000000000)) (and (not (= (select (arr!27600 (_keys!10663 thiss!1141)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27600 (_keys!10663 thiss!1141)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!948299 d!114693))

(declare-fun d!114695 () Bool)

(assert (=> d!114695 (= (apply!865 lt!426892 #b0000000000000000000000000000000000000000000000000000000000000000) (get!14498 (getValueByKey!494 (toList!6143 lt!426892) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26632 () Bool)

(assert (= bs!26632 d!114695))

(declare-fun m!880687 () Bool)

(assert (=> bs!26632 m!880687))

(assert (=> bs!26632 m!880687))

(declare-fun m!880689 () Bool)

(assert (=> bs!26632 m!880689))

(assert (=> b!948290 d!114695))

(declare-fun d!114697 () Bool)

(assert (=> d!114697 (= (apply!865 lt!426892 (select (arr!27600 (_keys!10663 thiss!1141)) #b00000000000000000000000000000000)) (get!14498 (getValueByKey!494 (toList!6143 lt!426892) (select (arr!27600 (_keys!10663 thiss!1141)) #b00000000000000000000000000000000))))))

(declare-fun bs!26633 () Bool)

(assert (= bs!26633 d!114697))

(assert (=> bs!26633 m!880497))

(declare-fun m!880691 () Bool)

(assert (=> bs!26633 m!880691))

(assert (=> bs!26633 m!880691))

(declare-fun m!880693 () Bool)

(assert (=> bs!26633 m!880693))

(assert (=> b!948307 d!114697))

(declare-fun d!114699 () Bool)

(declare-fun c!98844 () Bool)

(assert (=> d!114699 (= c!98844 ((_ is ValueCellFull!9872) (select (arr!27599 (_values!5772 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun e!533878 () V!32575)

(assert (=> d!114699 (= (get!14497 (select (arr!27599 (_values!5772 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1631 (defaultEntry!5749 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)) e!533878)))

(declare-fun b!948399 () Bool)

(declare-fun get!14499 (ValueCell!9872 V!32575) V!32575)

(assert (=> b!948399 (= e!533878 (get!14499 (select (arr!27599 (_values!5772 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1631 (defaultEntry!5749 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!948400 () Bool)

(declare-fun get!14500 (ValueCell!9872 V!32575) V!32575)

(assert (=> b!948400 (= e!533878 (get!14500 (select (arr!27599 (_values!5772 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1631 (defaultEntry!5749 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!114699 c!98844) b!948399))

(assert (= (and d!114699 (not c!98844)) b!948400))

(assert (=> b!948399 m!880539))

(assert (=> b!948399 m!880541))

(declare-fun m!880695 () Bool)

(assert (=> b!948399 m!880695))

(assert (=> b!948400 m!880539))

(assert (=> b!948400 m!880541))

(declare-fun m!880697 () Bool)

(assert (=> b!948400 m!880697))

(assert (=> b!948307 d!114699))

(assert (=> b!948289 d!114693))

(assert (=> bm!41188 d!114685))

(declare-fun d!114701 () Bool)

(declare-fun e!533880 () Bool)

(assert (=> d!114701 e!533880))

(declare-fun res!636281 () Bool)

(assert (=> d!114701 (=> res!636281 e!533880)))

(declare-fun lt!426958 () Bool)

(assert (=> d!114701 (= res!636281 (not lt!426958))))

(declare-fun lt!426957 () Bool)

(assert (=> d!114701 (= lt!426958 lt!426957)))

(declare-fun lt!426959 () Unit!31831)

(declare-fun e!533879 () Unit!31831)

(assert (=> d!114701 (= lt!426959 e!533879)))

(declare-fun c!98845 () Bool)

(assert (=> d!114701 (= c!98845 lt!426957)))

(assert (=> d!114701 (= lt!426957 (containsKey!458 (toList!6143 lt!426892) (select (arr!27600 (_keys!10663 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!114701 (= (contains!5170 lt!426892 (select (arr!27600 (_keys!10663 thiss!1141)) #b00000000000000000000000000000000)) lt!426958)))

(declare-fun b!948401 () Bool)

(declare-fun lt!426960 () Unit!31831)

(assert (=> b!948401 (= e!533879 lt!426960)))

(assert (=> b!948401 (= lt!426960 (lemmaContainsKeyImpliesGetValueByKeyDefined!353 (toList!6143 lt!426892) (select (arr!27600 (_keys!10663 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!948401 (isDefined!366 (getValueByKey!494 (toList!6143 lt!426892) (select (arr!27600 (_keys!10663 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!948402 () Bool)

(declare-fun Unit!31836 () Unit!31831)

(assert (=> b!948402 (= e!533879 Unit!31836)))

(declare-fun b!948403 () Bool)

(assert (=> b!948403 (= e!533880 (isDefined!366 (getValueByKey!494 (toList!6143 lt!426892) (select (arr!27600 (_keys!10663 thiss!1141)) #b00000000000000000000000000000000))))))

(assert (= (and d!114701 c!98845) b!948401))

(assert (= (and d!114701 (not c!98845)) b!948402))

(assert (= (and d!114701 (not res!636281)) b!948403))

(assert (=> d!114701 m!880497))

(declare-fun m!880699 () Bool)

(assert (=> d!114701 m!880699))

(assert (=> b!948401 m!880497))

(declare-fun m!880701 () Bool)

(assert (=> b!948401 m!880701))

(assert (=> b!948401 m!880497))

(assert (=> b!948401 m!880691))

(assert (=> b!948401 m!880691))

(declare-fun m!880703 () Bool)

(assert (=> b!948401 m!880703))

(assert (=> b!948403 m!880497))

(assert (=> b!948403 m!880691))

(assert (=> b!948403 m!880691))

(assert (=> b!948403 m!880703))

(assert (=> b!948297 d!114701))

(declare-fun b!948414 () Bool)

(declare-fun e!533890 () Bool)

(declare-fun e!533892 () Bool)

(assert (=> b!948414 (= e!533890 e!533892)))

(declare-fun c!98848 () Bool)

(assert (=> b!948414 (= c!98848 (validKeyInArray!0 (select (arr!27600 (_keys!10663 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!948415 () Bool)

(declare-fun e!533889 () Bool)

(declare-fun contains!5173 (List!19322 (_ BitVec 64)) Bool)

(assert (=> b!948415 (= e!533889 (contains!5173 Nil!19319 (select (arr!27600 (_keys!10663 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!948416 () Bool)

(declare-fun call!41200 () Bool)

(assert (=> b!948416 (= e!533892 call!41200)))

(declare-fun bm!41197 () Bool)

(assert (=> bm!41197 (= call!41200 (arrayNoDuplicates!0 (_keys!10663 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98848 (Cons!19318 (select (arr!27600 (_keys!10663 thiss!1141)) #b00000000000000000000000000000000) Nil!19319) Nil!19319)))))

(declare-fun b!948417 () Bool)

(declare-fun e!533891 () Bool)

(assert (=> b!948417 (= e!533891 e!533890)))

(declare-fun res!636289 () Bool)

(assert (=> b!948417 (=> (not res!636289) (not e!533890))))

(assert (=> b!948417 (= res!636289 (not e!533889))))

(declare-fun res!636290 () Bool)

(assert (=> b!948417 (=> (not res!636290) (not e!533889))))

(assert (=> b!948417 (= res!636290 (validKeyInArray!0 (select (arr!27600 (_keys!10663 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114703 () Bool)

(declare-fun res!636288 () Bool)

(assert (=> d!114703 (=> res!636288 e!533891)))

(assert (=> d!114703 (= res!636288 (bvsge #b00000000000000000000000000000000 (size!28076 (_keys!10663 thiss!1141))))))

(assert (=> d!114703 (= (arrayNoDuplicates!0 (_keys!10663 thiss!1141) #b00000000000000000000000000000000 Nil!19319) e!533891)))

(declare-fun b!948418 () Bool)

(assert (=> b!948418 (= e!533892 call!41200)))

(assert (= (and d!114703 (not res!636288)) b!948417))

(assert (= (and b!948417 res!636290) b!948415))

(assert (= (and b!948417 res!636289) b!948414))

(assert (= (and b!948414 c!98848) b!948418))

(assert (= (and b!948414 (not c!98848)) b!948416))

(assert (= (or b!948418 b!948416) bm!41197))

(assert (=> b!948414 m!880497))

(assert (=> b!948414 m!880497))

(assert (=> b!948414 m!880499))

(assert (=> b!948415 m!880497))

(assert (=> b!948415 m!880497))

(declare-fun m!880705 () Bool)

(assert (=> b!948415 m!880705))

(assert (=> bm!41197 m!880497))

(declare-fun m!880707 () Bool)

(assert (=> bm!41197 m!880707))

(assert (=> b!948417 m!880497))

(assert (=> b!948417 m!880497))

(assert (=> b!948417 m!880499))

(assert (=> b!948320 d!114703))

(declare-fun d!114705 () Bool)

(declare-fun res!636295 () Bool)

(declare-fun e!533899 () Bool)

(assert (=> d!114705 (=> res!636295 e!533899)))

(assert (=> d!114705 (= res!636295 (bvsge #b00000000000000000000000000000000 (size!28076 (_keys!10663 thiss!1141))))))

(assert (=> d!114705 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10663 thiss!1141) (mask!27502 thiss!1141)) e!533899)))

(declare-fun bm!41200 () Bool)

(declare-fun call!41203 () Bool)

(assert (=> bm!41200 (= call!41203 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10663 thiss!1141) (mask!27502 thiss!1141)))))

(declare-fun b!948427 () Bool)

(declare-fun e!533901 () Bool)

(assert (=> b!948427 (= e!533899 e!533901)))

(declare-fun c!98851 () Bool)

(assert (=> b!948427 (= c!98851 (validKeyInArray!0 (select (arr!27600 (_keys!10663 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!948428 () Bool)

(assert (=> b!948428 (= e!533901 call!41203)))

(declare-fun b!948429 () Bool)

(declare-fun e!533900 () Bool)

(assert (=> b!948429 (= e!533901 e!533900)))

(declare-fun lt!426967 () (_ BitVec 64))

(assert (=> b!948429 (= lt!426967 (select (arr!27600 (_keys!10663 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426968 () Unit!31831)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57387 (_ BitVec 64) (_ BitVec 32)) Unit!31831)

(assert (=> b!948429 (= lt!426968 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10663 thiss!1141) lt!426967 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57387 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!948429 (arrayContainsKey!0 (_keys!10663 thiss!1141) lt!426967 #b00000000000000000000000000000000)))

(declare-fun lt!426969 () Unit!31831)

(assert (=> b!948429 (= lt!426969 lt!426968)))

(declare-fun res!636296 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57387 (_ BitVec 32)) SeekEntryResult!9125)

(assert (=> b!948429 (= res!636296 (= (seekEntryOrOpen!0 (select (arr!27600 (_keys!10663 thiss!1141)) #b00000000000000000000000000000000) (_keys!10663 thiss!1141) (mask!27502 thiss!1141)) (Found!9125 #b00000000000000000000000000000000)))))

(assert (=> b!948429 (=> (not res!636296) (not e!533900))))

(declare-fun b!948430 () Bool)

(assert (=> b!948430 (= e!533900 call!41203)))

(assert (= (and d!114705 (not res!636295)) b!948427))

(assert (= (and b!948427 c!98851) b!948429))

(assert (= (and b!948427 (not c!98851)) b!948428))

(assert (= (and b!948429 res!636296) b!948430))

(assert (= (or b!948430 b!948428) bm!41200))

(declare-fun m!880709 () Bool)

(assert (=> bm!41200 m!880709))

(assert (=> b!948427 m!880497))

(assert (=> b!948427 m!880497))

(assert (=> b!948427 m!880499))

(assert (=> b!948429 m!880497))

(declare-fun m!880711 () Bool)

(assert (=> b!948429 m!880711))

(declare-fun m!880713 () Bool)

(assert (=> b!948429 m!880713))

(assert (=> b!948429 m!880497))

(declare-fun m!880715 () Bool)

(assert (=> b!948429 m!880715))

(assert (=> b!948319 d!114705))

(declare-fun d!114707 () Bool)

(declare-fun e!533903 () Bool)

(assert (=> d!114707 e!533903))

(declare-fun res!636297 () Bool)

(assert (=> d!114707 (=> res!636297 e!533903)))

(declare-fun lt!426971 () Bool)

(assert (=> d!114707 (= res!636297 (not lt!426971))))

(declare-fun lt!426970 () Bool)

(assert (=> d!114707 (= lt!426971 lt!426970)))

(declare-fun lt!426972 () Unit!31831)

(declare-fun e!533902 () Unit!31831)

(assert (=> d!114707 (= lt!426972 e!533902)))

(declare-fun c!98852 () Bool)

(assert (=> d!114707 (= c!98852 lt!426970)))

(assert (=> d!114707 (= lt!426970 (containsKey!458 (toList!6143 lt!426892) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!114707 (= (contains!5170 lt!426892 #b0000000000000000000000000000000000000000000000000000000000000000) lt!426971)))

(declare-fun b!948431 () Bool)

(declare-fun lt!426973 () Unit!31831)

(assert (=> b!948431 (= e!533902 lt!426973)))

(assert (=> b!948431 (= lt!426973 (lemmaContainsKeyImpliesGetValueByKeyDefined!353 (toList!6143 lt!426892) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!948431 (isDefined!366 (getValueByKey!494 (toList!6143 lt!426892) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!948432 () Bool)

(declare-fun Unit!31837 () Unit!31831)

(assert (=> b!948432 (= e!533902 Unit!31837)))

(declare-fun b!948433 () Bool)

(assert (=> b!948433 (= e!533903 (isDefined!366 (getValueByKey!494 (toList!6143 lt!426892) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!114707 c!98852) b!948431))

(assert (= (and d!114707 (not c!98852)) b!948432))

(assert (= (and d!114707 (not res!636297)) b!948433))

(declare-fun m!880717 () Bool)

(assert (=> d!114707 m!880717))

(declare-fun m!880719 () Bool)

(assert (=> b!948431 m!880719))

(assert (=> b!948431 m!880687))

(assert (=> b!948431 m!880687))

(declare-fun m!880721 () Bool)

(assert (=> b!948431 m!880721))

(assert (=> b!948433 m!880687))

(assert (=> b!948433 m!880687))

(assert (=> b!948433 m!880721))

(assert (=> bm!41186 d!114707))

(declare-fun d!114709 () Bool)

(declare-fun isEmpty!712 (Option!500) Bool)

(assert (=> d!114709 (= (isDefined!366 (getValueByKey!494 (toList!6143 (getCurrentListMap!3305 (_keys!10663 thiss!1141) (_values!5772 thiss!1141) (mask!27502 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141))) key!756)) (not (isEmpty!712 (getValueByKey!494 (toList!6143 (getCurrentListMap!3305 (_keys!10663 thiss!1141) (_values!5772 thiss!1141) (mask!27502 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141))) key!756))))))

(declare-fun bs!26634 () Bool)

(assert (= bs!26634 d!114709))

(assert (=> bs!26634 m!880485))

(declare-fun m!880723 () Bool)

(assert (=> bs!26634 m!880723))

(assert (=> b!948246 d!114709))

(declare-fun b!948444 () Bool)

(declare-fun e!533909 () Option!500)

(assert (=> b!948444 (= e!533909 (getValueByKey!494 (t!27638 (toList!6143 (getCurrentListMap!3305 (_keys!10663 thiss!1141) (_values!5772 thiss!1141) (mask!27502 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141)))) key!756))))

(declare-fun d!114711 () Bool)

(declare-fun c!98857 () Bool)

(assert (=> d!114711 (= c!98857 (and ((_ is Cons!19316) (toList!6143 (getCurrentListMap!3305 (_keys!10663 thiss!1141) (_values!5772 thiss!1141) (mask!27502 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141)))) (= (_1!6795 (h!20473 (toList!6143 (getCurrentListMap!3305 (_keys!10663 thiss!1141) (_values!5772 thiss!1141) (mask!27502 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141))))) key!756)))))

(declare-fun e!533908 () Option!500)

(assert (=> d!114711 (= (getValueByKey!494 (toList!6143 (getCurrentListMap!3305 (_keys!10663 thiss!1141) (_values!5772 thiss!1141) (mask!27502 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141))) key!756) e!533908)))

(declare-fun b!948443 () Bool)

(assert (=> b!948443 (= e!533908 e!533909)))

(declare-fun c!98858 () Bool)

(assert (=> b!948443 (= c!98858 (and ((_ is Cons!19316) (toList!6143 (getCurrentListMap!3305 (_keys!10663 thiss!1141) (_values!5772 thiss!1141) (mask!27502 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141)))) (not (= (_1!6795 (h!20473 (toList!6143 (getCurrentListMap!3305 (_keys!10663 thiss!1141) (_values!5772 thiss!1141) (mask!27502 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141))))) key!756))))))

(declare-fun b!948445 () Bool)

(assert (=> b!948445 (= e!533909 None!498)))

(declare-fun b!948442 () Bool)

(assert (=> b!948442 (= e!533908 (Some!499 (_2!6795 (h!20473 (toList!6143 (getCurrentListMap!3305 (_keys!10663 thiss!1141) (_values!5772 thiss!1141) (mask!27502 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141)))))))))

(assert (= (and d!114711 c!98857) b!948442))

(assert (= (and d!114711 (not c!98857)) b!948443))

(assert (= (and b!948443 c!98858) b!948444))

(assert (= (and b!948443 (not c!98858)) b!948445))

(declare-fun m!880725 () Bool)

(assert (=> b!948444 m!880725))

(assert (=> b!948246 d!114711))

(declare-fun b!948454 () Bool)

(declare-fun e!533914 () (_ BitVec 32))

(declare-fun call!41206 () (_ BitVec 32))

(assert (=> b!948454 (= e!533914 (bvadd #b00000000000000000000000000000001 call!41206))))

(declare-fun bm!41203 () Bool)

(assert (=> bm!41203 (= call!41206 (arrayCountValidKeys!0 (_keys!10663 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28076 (_keys!10663 thiss!1141))))))

(declare-fun b!948455 () Bool)

(assert (=> b!948455 (= e!533914 call!41206)))

(declare-fun b!948456 () Bool)

(declare-fun e!533915 () (_ BitVec 32))

(assert (=> b!948456 (= e!533915 #b00000000000000000000000000000000)))

(declare-fun b!948457 () Bool)

(assert (=> b!948457 (= e!533915 e!533914)))

(declare-fun c!98863 () Bool)

(assert (=> b!948457 (= c!98863 (validKeyInArray!0 (select (arr!27600 (_keys!10663 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114713 () Bool)

(declare-fun lt!426976 () (_ BitVec 32))

(assert (=> d!114713 (and (bvsge lt!426976 #b00000000000000000000000000000000) (bvsle lt!426976 (bvsub (size!28076 (_keys!10663 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!114713 (= lt!426976 e!533915)))

(declare-fun c!98864 () Bool)

(assert (=> d!114713 (= c!98864 (bvsge #b00000000000000000000000000000000 (size!28076 (_keys!10663 thiss!1141))))))

(assert (=> d!114713 (and (bvsle #b00000000000000000000000000000000 (size!28076 (_keys!10663 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!28076 (_keys!10663 thiss!1141)) (size!28076 (_keys!10663 thiss!1141))))))

(assert (=> d!114713 (= (arrayCountValidKeys!0 (_keys!10663 thiss!1141) #b00000000000000000000000000000000 (size!28076 (_keys!10663 thiss!1141))) lt!426976)))

(assert (= (and d!114713 c!98864) b!948456))

(assert (= (and d!114713 (not c!98864)) b!948457))

(assert (= (and b!948457 c!98863) b!948454))

(assert (= (and b!948457 (not c!98863)) b!948455))

(assert (= (or b!948454 b!948455) bm!41203))

(declare-fun m!880727 () Bool)

(assert (=> bm!41203 m!880727))

(assert (=> b!948457 m!880497))

(assert (=> b!948457 m!880497))

(assert (=> b!948457 m!880499))

(assert (=> b!948318 d!114713))

(assert (=> d!114649 d!114645))

(declare-fun b!948470 () Bool)

(declare-fun e!533922 () SeekEntryResult!9125)

(declare-fun e!533923 () SeekEntryResult!9125)

(assert (=> b!948470 (= e!533922 e!533923)))

(declare-fun c!98873 () Bool)

(declare-fun lt!426982 () (_ BitVec 64))

(assert (=> b!948470 (= c!98873 (= lt!426982 key!756))))

(declare-fun b!948471 () Bool)

(assert (=> b!948471 (= e!533922 Undefined!9125)))

(declare-fun b!948472 () Bool)

(declare-fun c!98871 () Bool)

(assert (=> b!948472 (= c!98871 (= lt!426982 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!533924 () SeekEntryResult!9125)

(assert (=> b!948472 (= e!533923 e!533924)))

(declare-fun b!948473 () Bool)

(assert (=> b!948473 (= e!533923 (Found!9125 (index!38873 lt!426817)))))

(declare-fun b!948474 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!948474 (= e!533924 (seekKeyOrZeroReturnVacant!0 (bvadd (x!81598 lt!426817) #b00000000000000000000000000000001) (nextIndex!0 (index!38873 lt!426817) (x!81598 lt!426817) (mask!27502 thiss!1141)) (index!38873 lt!426817) key!756 (_keys!10663 thiss!1141) (mask!27502 thiss!1141)))))

(declare-fun d!114715 () Bool)

(declare-fun lt!426981 () SeekEntryResult!9125)

(assert (=> d!114715 (and (or ((_ is Undefined!9125) lt!426981) (not ((_ is Found!9125) lt!426981)) (and (bvsge (index!38872 lt!426981) #b00000000000000000000000000000000) (bvslt (index!38872 lt!426981) (size!28076 (_keys!10663 thiss!1141))))) (or ((_ is Undefined!9125) lt!426981) ((_ is Found!9125) lt!426981) (not ((_ is MissingVacant!9125) lt!426981)) (not (= (index!38874 lt!426981) (index!38873 lt!426817))) (and (bvsge (index!38874 lt!426981) #b00000000000000000000000000000000) (bvslt (index!38874 lt!426981) (size!28076 (_keys!10663 thiss!1141))))) (or ((_ is Undefined!9125) lt!426981) (ite ((_ is Found!9125) lt!426981) (= (select (arr!27600 (_keys!10663 thiss!1141)) (index!38872 lt!426981)) key!756) (and ((_ is MissingVacant!9125) lt!426981) (= (index!38874 lt!426981) (index!38873 lt!426817)) (= (select (arr!27600 (_keys!10663 thiss!1141)) (index!38874 lt!426981)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!114715 (= lt!426981 e!533922)))

(declare-fun c!98872 () Bool)

(assert (=> d!114715 (= c!98872 (bvsge (x!81598 lt!426817) #b01111111111111111111111111111110))))

(assert (=> d!114715 (= lt!426982 (select (arr!27600 (_keys!10663 thiss!1141)) (index!38873 lt!426817)))))

(assert (=> d!114715 (validMask!0 (mask!27502 thiss!1141))))

(assert (=> d!114715 (= (seekKeyOrZeroReturnVacant!0 (x!81598 lt!426817) (index!38873 lt!426817) (index!38873 lt!426817) key!756 (_keys!10663 thiss!1141) (mask!27502 thiss!1141)) lt!426981)))

(declare-fun b!948475 () Bool)

(assert (=> b!948475 (= e!533924 (MissingVacant!9125 (index!38873 lt!426817)))))

(assert (= (and d!114715 c!98872) b!948471))

(assert (= (and d!114715 (not c!98872)) b!948470))

(assert (= (and b!948470 c!98873) b!948473))

(assert (= (and b!948470 (not c!98873)) b!948472))

(assert (= (and b!948472 c!98871) b!948475))

(assert (= (and b!948472 (not c!98871)) b!948474))

(declare-fun m!880729 () Bool)

(assert (=> b!948474 m!880729))

(assert (=> b!948474 m!880729))

(declare-fun m!880731 () Bool)

(assert (=> b!948474 m!880731))

(declare-fun m!880733 () Bool)

(assert (=> d!114715 m!880733))

(declare-fun m!880735 () Bool)

(assert (=> d!114715 m!880735))

(assert (=> d!114715 m!880471))

(assert (=> d!114715 m!880437))

(assert (=> b!948237 d!114715))

(declare-fun b!948486 () Bool)

(declare-fun res!636309 () Bool)

(declare-fun e!533927 () Bool)

(assert (=> b!948486 (=> (not res!636309) (not e!533927))))

(declare-fun size!28081 (LongMapFixedSize!4894) (_ BitVec 32))

(assert (=> b!948486 (= res!636309 (= (size!28081 thiss!1141) (bvadd (_size!2502 thiss!1141) (bvsdiv (bvadd (extraKeys!5481 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!948485 () Bool)

(declare-fun res!636307 () Bool)

(assert (=> b!948485 (=> (not res!636307) (not e!533927))))

(assert (=> b!948485 (= res!636307 (bvsge (size!28081 thiss!1141) (_size!2502 thiss!1141)))))

(declare-fun b!948484 () Bool)

(declare-fun res!636306 () Bool)

(assert (=> b!948484 (=> (not res!636306) (not e!533927))))

(assert (=> b!948484 (= res!636306 (and (= (size!28075 (_values!5772 thiss!1141)) (bvadd (mask!27502 thiss!1141) #b00000000000000000000000000000001)) (= (size!28076 (_keys!10663 thiss!1141)) (size!28075 (_values!5772 thiss!1141))) (bvsge (_size!2502 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2502 thiss!1141) (bvadd (mask!27502 thiss!1141) #b00000000000000000000000000000001))))))

(declare-fun b!948487 () Bool)

(assert (=> b!948487 (= e!533927 (and (bvsge (extraKeys!5481 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5481 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2502 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun d!114717 () Bool)

(declare-fun res!636308 () Bool)

(assert (=> d!114717 (=> (not res!636308) (not e!533927))))

(assert (=> d!114717 (= res!636308 (validMask!0 (mask!27502 thiss!1141)))))

(assert (=> d!114717 (= (simpleValid!368 thiss!1141) e!533927)))

(assert (= (and d!114717 res!636308) b!948484))

(assert (= (and b!948484 res!636306) b!948485))

(assert (= (and b!948485 res!636307) b!948486))

(assert (= (and b!948486 res!636309) b!948487))

(declare-fun m!880737 () Bool)

(assert (=> b!948486 m!880737))

(assert (=> b!948485 m!880737))

(assert (=> d!114717 m!880437))

(assert (=> d!114651 d!114717))

(declare-fun b!948506 () Bool)

(declare-fun e!533939 () Bool)

(declare-fun lt!426987 () SeekEntryResult!9125)

(assert (=> b!948506 (= e!533939 (bvsge (x!81598 lt!426987) #b01111111111111111111111111111110))))

(declare-fun b!948507 () Bool)

(declare-fun e!533941 () Bool)

(assert (=> b!948507 (= e!533939 e!533941)))

(declare-fun res!636318 () Bool)

(assert (=> b!948507 (= res!636318 (and ((_ is Intermediate!9125) lt!426987) (not (undefined!9937 lt!426987)) (bvslt (x!81598 lt!426987) #b01111111111111111111111111111110) (bvsge (x!81598 lt!426987) #b00000000000000000000000000000000) (bvsge (x!81598 lt!426987) #b00000000000000000000000000000000)))))

(assert (=> b!948507 (=> (not res!636318) (not e!533941))))

(declare-fun b!948508 () Bool)

(assert (=> b!948508 (and (bvsge (index!38873 lt!426987) #b00000000000000000000000000000000) (bvslt (index!38873 lt!426987) (size!28076 (_keys!10663 thiss!1141))))))

(declare-fun e!533940 () Bool)

(assert (=> b!948508 (= e!533940 (= (select (arr!27600 (_keys!10663 thiss!1141)) (index!38873 lt!426987)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!114719 () Bool)

(assert (=> d!114719 e!533939))

(declare-fun c!98882 () Bool)

(assert (=> d!114719 (= c!98882 (and ((_ is Intermediate!9125) lt!426987) (undefined!9937 lt!426987)))))

(declare-fun e!533938 () SeekEntryResult!9125)

(assert (=> d!114719 (= lt!426987 e!533938)))

(declare-fun c!98881 () Bool)

(assert (=> d!114719 (= c!98881 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!426988 () (_ BitVec 64))

(assert (=> d!114719 (= lt!426988 (select (arr!27600 (_keys!10663 thiss!1141)) (toIndex!0 key!756 (mask!27502 thiss!1141))))))

(assert (=> d!114719 (validMask!0 (mask!27502 thiss!1141))))

(assert (=> d!114719 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27502 thiss!1141)) key!756 (_keys!10663 thiss!1141) (mask!27502 thiss!1141)) lt!426987)))

(declare-fun b!948509 () Bool)

(declare-fun e!533942 () SeekEntryResult!9125)

(assert (=> b!948509 (= e!533942 (Intermediate!9125 false (toIndex!0 key!756 (mask!27502 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!948510 () Bool)

(assert (=> b!948510 (and (bvsge (index!38873 lt!426987) #b00000000000000000000000000000000) (bvslt (index!38873 lt!426987) (size!28076 (_keys!10663 thiss!1141))))))

(declare-fun res!636316 () Bool)

(assert (=> b!948510 (= res!636316 (= (select (arr!27600 (_keys!10663 thiss!1141)) (index!38873 lt!426987)) key!756))))

(assert (=> b!948510 (=> res!636316 e!533940)))

(assert (=> b!948510 (= e!533941 e!533940)))

(declare-fun b!948511 () Bool)

(assert (=> b!948511 (= e!533938 e!533942)))

(declare-fun c!98880 () Bool)

(assert (=> b!948511 (= c!98880 (or (= lt!426988 key!756) (= (bvadd lt!426988 lt!426988) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!948512 () Bool)

(assert (=> b!948512 (and (bvsge (index!38873 lt!426987) #b00000000000000000000000000000000) (bvslt (index!38873 lt!426987) (size!28076 (_keys!10663 thiss!1141))))))

(declare-fun res!636317 () Bool)

(assert (=> b!948512 (= res!636317 (= (select (arr!27600 (_keys!10663 thiss!1141)) (index!38873 lt!426987)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!948512 (=> res!636317 e!533940)))

(declare-fun b!948513 () Bool)

(assert (=> b!948513 (= e!533938 (Intermediate!9125 true (toIndex!0 key!756 (mask!27502 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!948514 () Bool)

(assert (=> b!948514 (= e!533942 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27502 thiss!1141)) #b00000000000000000000000000000000 (mask!27502 thiss!1141)) key!756 (_keys!10663 thiss!1141) (mask!27502 thiss!1141)))))

(assert (= (and d!114719 c!98881) b!948513))

(assert (= (and d!114719 (not c!98881)) b!948511))

(assert (= (and b!948511 c!98880) b!948509))

(assert (= (and b!948511 (not c!98880)) b!948514))

(assert (= (and d!114719 c!98882) b!948506))

(assert (= (and d!114719 (not c!98882)) b!948507))

(assert (= (and b!948507 res!636318) b!948510))

(assert (= (and b!948510 (not res!636316)) b!948512))

(assert (= (and b!948512 (not res!636317)) b!948508))

(assert (=> d!114719 m!880477))

(declare-fun m!880739 () Bool)

(assert (=> d!114719 m!880739))

(assert (=> d!114719 m!880437))

(declare-fun m!880741 () Bool)

(assert (=> b!948512 m!880741))

(assert (=> b!948508 m!880741))

(assert (=> b!948514 m!880477))

(declare-fun m!880743 () Bool)

(assert (=> b!948514 m!880743))

(assert (=> b!948514 m!880743))

(declare-fun m!880745 () Bool)

(assert (=> b!948514 m!880745))

(assert (=> b!948510 m!880741))

(assert (=> d!114643 d!114719))

(declare-fun d!114721 () Bool)

(declare-fun lt!426994 () (_ BitVec 32))

(declare-fun lt!426993 () (_ BitVec 32))

(assert (=> d!114721 (= lt!426994 (bvmul (bvxor lt!426993 (bvlshr lt!426993 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!114721 (= lt!426993 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!114721 (and (bvsge (mask!27502 thiss!1141) #b00000000000000000000000000000000) (let ((res!636319 (let ((h!20476 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!81616 (bvmul (bvxor h!20476 (bvlshr h!20476 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!81616 (bvlshr x!81616 #b00000000000000000000000000001101)) (mask!27502 thiss!1141)))))) (and (bvslt res!636319 (bvadd (mask!27502 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!636319 #b00000000000000000000000000000000))))))

(assert (=> d!114721 (= (toIndex!0 key!756 (mask!27502 thiss!1141)) (bvand (bvxor lt!426994 (bvlshr lt!426994 #b00000000000000000000000000001101)) (mask!27502 thiss!1141)))))

(assert (=> d!114643 d!114721))

(assert (=> d!114643 d!114645))

(declare-fun d!114723 () Bool)

(assert (=> d!114723 (isDefined!366 (getValueByKey!494 (toList!6143 (getCurrentListMap!3305 (_keys!10663 thiss!1141) (_values!5772 thiss!1141) (mask!27502 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141))) key!756))))

(declare-fun lt!426997 () Unit!31831)

(declare-fun choose!1586 (List!19320 (_ BitVec 64)) Unit!31831)

(assert (=> d!114723 (= lt!426997 (choose!1586 (toList!6143 (getCurrentListMap!3305 (_keys!10663 thiss!1141) (_values!5772 thiss!1141) (mask!27502 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141))) key!756))))

(declare-fun e!533945 () Bool)

(assert (=> d!114723 e!533945))

(declare-fun res!636322 () Bool)

(assert (=> d!114723 (=> (not res!636322) (not e!533945))))

(declare-fun isStrictlySorted!505 (List!19320) Bool)

(assert (=> d!114723 (= res!636322 (isStrictlySorted!505 (toList!6143 (getCurrentListMap!3305 (_keys!10663 thiss!1141) (_values!5772 thiss!1141) (mask!27502 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141)))))))

(assert (=> d!114723 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!353 (toList!6143 (getCurrentListMap!3305 (_keys!10663 thiss!1141) (_values!5772 thiss!1141) (mask!27502 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141))) key!756) lt!426997)))

(declare-fun b!948517 () Bool)

(assert (=> b!948517 (= e!533945 (containsKey!458 (toList!6143 (getCurrentListMap!3305 (_keys!10663 thiss!1141) (_values!5772 thiss!1141) (mask!27502 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141))) key!756))))

(assert (= (and d!114723 res!636322) b!948517))

(assert (=> d!114723 m!880485))

(assert (=> d!114723 m!880485))

(assert (=> d!114723 m!880487))

(declare-fun m!880747 () Bool)

(assert (=> d!114723 m!880747))

(declare-fun m!880749 () Bool)

(assert (=> d!114723 m!880749))

(assert (=> b!948517 m!880481))

(assert (=> b!948244 d!114723))

(assert (=> b!948244 d!114709))

(assert (=> b!948244 d!114711))

(declare-fun d!114725 () Bool)

(declare-fun e!533947 () Bool)

(assert (=> d!114725 e!533947))

(declare-fun res!636323 () Bool)

(assert (=> d!114725 (=> res!636323 e!533947)))

(declare-fun lt!426999 () Bool)

(assert (=> d!114725 (= res!636323 (not lt!426999))))

(declare-fun lt!426998 () Bool)

(assert (=> d!114725 (= lt!426999 lt!426998)))

(declare-fun lt!427000 () Unit!31831)

(declare-fun e!533946 () Unit!31831)

(assert (=> d!114725 (= lt!427000 e!533946)))

(declare-fun c!98883 () Bool)

(assert (=> d!114725 (= c!98883 lt!426998)))

(assert (=> d!114725 (= lt!426998 (containsKey!458 (toList!6143 lt!426892) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!114725 (= (contains!5170 lt!426892 #b1000000000000000000000000000000000000000000000000000000000000000) lt!426999)))

(declare-fun b!948518 () Bool)

(declare-fun lt!427001 () Unit!31831)

(assert (=> b!948518 (= e!533946 lt!427001)))

(assert (=> b!948518 (= lt!427001 (lemmaContainsKeyImpliesGetValueByKeyDefined!353 (toList!6143 lt!426892) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!948518 (isDefined!366 (getValueByKey!494 (toList!6143 lt!426892) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!948519 () Bool)

(declare-fun Unit!31838 () Unit!31831)

(assert (=> b!948519 (= e!533946 Unit!31838)))

(declare-fun b!948520 () Bool)

(assert (=> b!948520 (= e!533947 (isDefined!366 (getValueByKey!494 (toList!6143 lt!426892) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!114725 c!98883) b!948518))

(assert (= (and d!114725 (not c!98883)) b!948519))

(assert (= (and d!114725 (not res!636323)) b!948520))

(declare-fun m!880751 () Bool)

(assert (=> d!114725 m!880751))

(declare-fun m!880753 () Bool)

(assert (=> b!948518 m!880753))

(declare-fun m!880755 () Bool)

(assert (=> b!948518 m!880755))

(assert (=> b!948518 m!880755))

(declare-fun m!880757 () Bool)

(assert (=> b!948518 m!880757))

(assert (=> b!948520 m!880755))

(assert (=> b!948520 m!880755))

(assert (=> b!948520 m!880757))

(assert (=> bm!41187 d!114725))

(declare-fun d!114727 () Bool)

(declare-fun e!533948 () Bool)

(assert (=> d!114727 e!533948))

(declare-fun res!636325 () Bool)

(assert (=> d!114727 (=> (not res!636325) (not e!533948))))

(declare-fun lt!427005 () ListLongMap!12255)

(assert (=> d!114727 (= res!636325 (contains!5170 lt!427005 (_1!6795 (ite (or c!98828 c!98827) (tuple2!13569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5585 thiss!1141)) (tuple2!13569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141))))))))

(declare-fun lt!427003 () List!19320)

(assert (=> d!114727 (= lt!427005 (ListLongMap!12256 lt!427003))))

(declare-fun lt!427002 () Unit!31831)

(declare-fun lt!427004 () Unit!31831)

(assert (=> d!114727 (= lt!427002 lt!427004)))

(assert (=> d!114727 (= (getValueByKey!494 lt!427003 (_1!6795 (ite (or c!98828 c!98827) (tuple2!13569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5585 thiss!1141)) (tuple2!13569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141))))) (Some!499 (_2!6795 (ite (or c!98828 c!98827) (tuple2!13569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5585 thiss!1141)) (tuple2!13569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141))))))))

(assert (=> d!114727 (= lt!427004 (lemmaContainsTupThenGetReturnValue!264 lt!427003 (_1!6795 (ite (or c!98828 c!98827) (tuple2!13569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5585 thiss!1141)) (tuple2!13569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141)))) (_2!6795 (ite (or c!98828 c!98827) (tuple2!13569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5585 thiss!1141)) (tuple2!13569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141))))))))

(assert (=> d!114727 (= lt!427003 (insertStrictlySorted!321 (toList!6143 (ite c!98828 call!41189 (ite c!98827 call!41188 call!41190))) (_1!6795 (ite (or c!98828 c!98827) (tuple2!13569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5585 thiss!1141)) (tuple2!13569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141)))) (_2!6795 (ite (or c!98828 c!98827) (tuple2!13569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5585 thiss!1141)) (tuple2!13569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141))))))))

(assert (=> d!114727 (= (+!2875 (ite c!98828 call!41189 (ite c!98827 call!41188 call!41190)) (ite (or c!98828 c!98827) (tuple2!13569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5585 thiss!1141)) (tuple2!13569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141)))) lt!427005)))

(declare-fun b!948521 () Bool)

(declare-fun res!636324 () Bool)

(assert (=> b!948521 (=> (not res!636324) (not e!533948))))

(assert (=> b!948521 (= res!636324 (= (getValueByKey!494 (toList!6143 lt!427005) (_1!6795 (ite (or c!98828 c!98827) (tuple2!13569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5585 thiss!1141)) (tuple2!13569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141))))) (Some!499 (_2!6795 (ite (or c!98828 c!98827) (tuple2!13569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5585 thiss!1141)) (tuple2!13569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141)))))))))

(declare-fun b!948522 () Bool)

(assert (=> b!948522 (= e!533948 (contains!5172 (toList!6143 lt!427005) (ite (or c!98828 c!98827) (tuple2!13569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5585 thiss!1141)) (tuple2!13569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141)))))))

(assert (= (and d!114727 res!636325) b!948521))

(assert (= (and b!948521 res!636324) b!948522))

(declare-fun m!880759 () Bool)

(assert (=> d!114727 m!880759))

(declare-fun m!880761 () Bool)

(assert (=> d!114727 m!880761))

(declare-fun m!880763 () Bool)

(assert (=> d!114727 m!880763))

(declare-fun m!880765 () Bool)

(assert (=> d!114727 m!880765))

(declare-fun m!880767 () Bool)

(assert (=> b!948521 m!880767))

(declare-fun m!880769 () Bool)

(assert (=> b!948522 m!880769))

(assert (=> bm!41191 d!114727))

(declare-fun d!114729 () Bool)

(assert (=> d!114729 (= (apply!865 lt!426892 #b1000000000000000000000000000000000000000000000000000000000000000) (get!14498 (getValueByKey!494 (toList!6143 lt!426892) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26635 () Bool)

(assert (= bs!26635 d!114729))

(assert (=> bs!26635 m!880755))

(assert (=> bs!26635 m!880755))

(declare-fun m!880771 () Bool)

(assert (=> bs!26635 m!880771))

(assert (=> b!948302 d!114729))

(declare-fun mapIsEmpty!32961 () Bool)

(declare-fun mapRes!32961 () Bool)

(assert (=> mapIsEmpty!32961 mapRes!32961))

(declare-fun b!948523 () Bool)

(declare-fun e!533949 () Bool)

(assert (=> b!948523 (= e!533949 tp_is_empty!20707)))

(declare-fun condMapEmpty!32961 () Bool)

(declare-fun mapDefault!32961 () ValueCell!9872)

(assert (=> mapNonEmpty!32960 (= condMapEmpty!32961 (= mapRest!32960 ((as const (Array (_ BitVec 32) ValueCell!9872)) mapDefault!32961)))))

(declare-fun e!533950 () Bool)

(assert (=> mapNonEmpty!32960 (= tp!63188 (and e!533950 mapRes!32961))))

(declare-fun b!948524 () Bool)

(assert (=> b!948524 (= e!533950 tp_is_empty!20707)))

(declare-fun mapNonEmpty!32961 () Bool)

(declare-fun tp!63189 () Bool)

(assert (=> mapNonEmpty!32961 (= mapRes!32961 (and tp!63189 e!533949))))

(declare-fun mapKey!32961 () (_ BitVec 32))

(declare-fun mapValue!32961 () ValueCell!9872)

(declare-fun mapRest!32961 () (Array (_ BitVec 32) ValueCell!9872))

(assert (=> mapNonEmpty!32961 (= mapRest!32960 (store mapRest!32961 mapKey!32961 mapValue!32961))))

(assert (= (and mapNonEmpty!32960 condMapEmpty!32961) mapIsEmpty!32961))

(assert (= (and mapNonEmpty!32960 (not condMapEmpty!32961)) mapNonEmpty!32961))

(assert (= (and mapNonEmpty!32961 ((_ is ValueCellFull!9872) mapValue!32961)) b!948523))

(assert (= (and mapNonEmpty!32960 ((_ is ValueCellFull!9872) mapDefault!32961)) b!948524))

(declare-fun m!880773 () Bool)

(assert (=> mapNonEmpty!32961 m!880773))

(declare-fun b_lambda!14309 () Bool)

(assert (= b_lambda!14305 (or (and b!948158 b_free!18199) b_lambda!14309)))

(declare-fun b_lambda!14311 () Bool)

(assert (= b_lambda!14307 (or (and b!948158 b_free!18199) b_lambda!14311)))

(check-sat (not d!114697) (not b!948353) (not b!948403) (not b!948485) (not b!948399) (not b!948429) (not bm!41200) (not b!948415) (not d!114687) (not b!948520) (not b!948518) (not b!948334) (not d!114689) (not b_next!18199) (not b!948388) (not b!948339) (not d!114725) (not b!948444) (not b!948431) (not b!948457) (not b!948517) (not d!114715) (not b!948385) (not d!114679) (not d!114663) (not b!948433) (not b!948384) (not d!114695) (not b!948427) (not b!948340) (not b!948522) (not bm!41194) tp_is_empty!20707 (not b!948387) (not d!114729) (not b!948345) (not d!114707) (not b!948393) (not d!114667) (not d!114665) (not b!948394) (not b!948400) (not d!114675) (not b_lambda!14309) (not d!114677) (not b!948346) (not b!948355) (not b!948486) (not d!114691) (not b!948349) (not d!114723) (not b!948417) (not b!948352) (not b_lambda!14303) (not b!948391) (not b!948521) (not b_lambda!14311) (not b!948382) (not d!114685) (not d!114669) (not d!114681) (not mapNonEmpty!32961) (not b!948514) (not d!114719) (not d!114673) (not d!114709) (not d!114671) (not b!948389) (not d!114661) b_and!29615 (not b!948414) (not d!114659) (not b!948474) (not b!948383) (not bm!41203) (not b!948401) (not b!948351) (not bm!41197) (not b!948354) (not d!114683) (not d!114717) (not d!114727) (not d!114701))
(check-sat b_and!29615 (not b_next!18199))
