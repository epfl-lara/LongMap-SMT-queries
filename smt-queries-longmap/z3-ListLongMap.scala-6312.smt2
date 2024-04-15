; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80892 () Bool)

(assert start!80892)

(declare-fun b!947774 () Bool)

(declare-fun b_free!18193 () Bool)

(declare-fun b_next!18193 () Bool)

(assert (=> b!947774 (= b_free!18193 (not b_next!18193))))

(declare-fun tp!63151 () Bool)

(declare-fun b_and!29593 () Bool)

(assert (=> b!947774 (= tp!63151 b_and!29593)))

(declare-fun mapIsEmpty!32938 () Bool)

(declare-fun mapRes!32938 () Bool)

(assert (=> mapIsEmpty!32938 mapRes!32938))

(declare-fun b!947771 () Bool)

(declare-fun e!533499 () Bool)

(declare-datatypes ((V!32567 0))(
  ( (V!32568 (val!10401 Int)) )
))
(declare-datatypes ((ValueCell!9869 0))(
  ( (ValueCellFull!9869 (v!12936 V!32567)) (EmptyCell!9869) )
))
(declare-datatypes ((array!57371 0))(
  ( (array!57372 (arr!27593 (Array (_ BitVec 32) ValueCell!9869)) (size!28068 (_ BitVec 32))) )
))
(declare-datatypes ((array!57373 0))(
  ( (array!57374 (arr!27594 (Array (_ BitVec 32) (_ BitVec 64))) (size!28069 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4888 0))(
  ( (LongMapFixedSize!4889 (defaultEntry!5744 Int) (mask!27489 (_ BitVec 32)) (extraKeys!5476 (_ BitVec 32)) (zeroValue!5580 V!32567) (minValue!5580 V!32567) (_size!2499 (_ BitVec 32)) (_keys!10654 array!57373) (_values!5767 array!57371) (_vacant!2499 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4888)

(assert (=> b!947771 (= e!533499 (not (= (size!28068 (_values!5767 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27489 thiss!1141)))))))

(declare-fun b!947772 () Bool)

(declare-fun res!636002 () Bool)

(assert (=> b!947772 (=> (not res!636002) (not e!533499))))

(declare-fun key!756 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9123 0))(
  ( (MissingZero!9123 (index!38863 (_ BitVec 32))) (Found!9123 (index!38864 (_ BitVec 32))) (Intermediate!9123 (undefined!9935 Bool) (index!38865 (_ BitVec 32)) (x!81570 (_ BitVec 32))) (Undefined!9123) (MissingVacant!9123 (index!38866 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57373 (_ BitVec 32)) SeekEntryResult!9123)

(assert (=> b!947772 (= res!636002 (not ((_ is Found!9123) (seekEntry!0 key!756 (_keys!10654 thiss!1141) (mask!27489 thiss!1141)))))))

(declare-fun b!947773 () Bool)

(declare-fun res!636004 () Bool)

(assert (=> b!947773 (=> (not res!636004) (not e!533499))))

(declare-datatypes ((tuple2!13564 0))(
  ( (tuple2!13565 (_1!6793 (_ BitVec 64)) (_2!6793 V!32567)) )
))
(declare-datatypes ((List!19317 0))(
  ( (Nil!19314) (Cons!19313 (h!20469 tuple2!13564) (t!27633 List!19317)) )
))
(declare-datatypes ((ListLongMap!12251 0))(
  ( (ListLongMap!12252 (toList!6141 List!19317)) )
))
(declare-fun contains!5166 (ListLongMap!12251 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3303 (array!57373 array!57371 (_ BitVec 32) (_ BitVec 32) V!32567 V!32567 (_ BitVec 32) Int) ListLongMap!12251)

(assert (=> b!947773 (= res!636004 (contains!5166 (getCurrentListMap!3303 (_keys!10654 thiss!1141) (_values!5767 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141)) key!756))))

(declare-fun b!947775 () Bool)

(declare-fun res!636006 () Bool)

(assert (=> b!947775 (=> (not res!636006) (not e!533499))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!947775 (= res!636006 (validMask!0 (mask!27489 thiss!1141)))))

(declare-fun b!947776 () Bool)

(declare-fun e!533500 () Bool)

(declare-fun tp_is_empty!20701 () Bool)

(assert (=> b!947776 (= e!533500 tp_is_empty!20701)))

(declare-fun b!947777 () Bool)

(declare-fun e!533497 () Bool)

(assert (=> b!947777 (= e!533497 tp_is_empty!20701)))

(declare-fun mapNonEmpty!32938 () Bool)

(declare-fun tp!63150 () Bool)

(assert (=> mapNonEmpty!32938 (= mapRes!32938 (and tp!63150 e!533500))))

(declare-fun mapValue!32938 () ValueCell!9869)

(declare-fun mapRest!32938 () (Array (_ BitVec 32) ValueCell!9869))

(declare-fun mapKey!32938 () (_ BitVec 32))

(assert (=> mapNonEmpty!32938 (= (arr!27593 (_values!5767 thiss!1141)) (store mapRest!32938 mapKey!32938 mapValue!32938))))

(declare-fun b!947778 () Bool)

(declare-fun res!636005 () Bool)

(assert (=> b!947778 (=> (not res!636005) (not e!533499))))

(assert (=> b!947778 (= res!636005 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!947779 () Bool)

(declare-fun e!533501 () Bool)

(assert (=> b!947779 (= e!533501 (and e!533497 mapRes!32938))))

(declare-fun condMapEmpty!32938 () Bool)

(declare-fun mapDefault!32938 () ValueCell!9869)

(assert (=> b!947779 (= condMapEmpty!32938 (= (arr!27593 (_values!5767 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9869)) mapDefault!32938)))))

(declare-fun res!636003 () Bool)

(assert (=> start!80892 (=> (not res!636003) (not e!533499))))

(declare-fun valid!1864 (LongMapFixedSize!4888) Bool)

(assert (=> start!80892 (= res!636003 (valid!1864 thiss!1141))))

(assert (=> start!80892 e!533499))

(declare-fun e!533498 () Bool)

(assert (=> start!80892 e!533498))

(assert (=> start!80892 true))

(declare-fun array_inv!21476 (array!57373) Bool)

(declare-fun array_inv!21477 (array!57371) Bool)

(assert (=> b!947774 (= e!533498 (and tp!63151 tp_is_empty!20701 (array_inv!21476 (_keys!10654 thiss!1141)) (array_inv!21477 (_values!5767 thiss!1141)) e!533501))))

(assert (= (and start!80892 res!636003) b!947778))

(assert (= (and b!947778 res!636005) b!947772))

(assert (= (and b!947772 res!636002) b!947773))

(assert (= (and b!947773 res!636004) b!947775))

(assert (= (and b!947775 res!636006) b!947771))

(assert (= (and b!947779 condMapEmpty!32938) mapIsEmpty!32938))

(assert (= (and b!947779 (not condMapEmpty!32938)) mapNonEmpty!32938))

(assert (= (and mapNonEmpty!32938 ((_ is ValueCellFull!9869) mapValue!32938)) b!947776))

(assert (= (and b!947779 ((_ is ValueCellFull!9869) mapDefault!32938)) b!947777))

(assert (= b!947774 b!947779))

(assert (= start!80892 b!947774))

(declare-fun m!880071 () Bool)

(assert (=> b!947772 m!880071))

(declare-fun m!880073 () Bool)

(assert (=> b!947775 m!880073))

(declare-fun m!880075 () Bool)

(assert (=> b!947774 m!880075))

(declare-fun m!880077 () Bool)

(assert (=> b!947774 m!880077))

(declare-fun m!880079 () Bool)

(assert (=> start!80892 m!880079))

(declare-fun m!880081 () Bool)

(assert (=> mapNonEmpty!32938 m!880081))

(declare-fun m!880083 () Bool)

(assert (=> b!947773 m!880083))

(assert (=> b!947773 m!880083))

(declare-fun m!880085 () Bool)

(assert (=> b!947773 m!880085))

(check-sat (not mapNonEmpty!32938) (not b!947772) (not start!80892) b_and!29593 (not b!947775) (not b_next!18193) tp_is_empty!20701 (not b!947774) (not b!947773))
(check-sat b_and!29593 (not b_next!18193))
(get-model)

(declare-fun d!114553 () Bool)

(declare-fun res!636043 () Bool)

(declare-fun e!533541 () Bool)

(assert (=> d!114553 (=> (not res!636043) (not e!533541))))

(declare-fun simpleValid!367 (LongMapFixedSize!4888) Bool)

(assert (=> d!114553 (= res!636043 (simpleValid!367 thiss!1141))))

(assert (=> d!114553 (= (valid!1864 thiss!1141) e!533541)))

(declare-fun b!947840 () Bool)

(declare-fun res!636044 () Bool)

(assert (=> b!947840 (=> (not res!636044) (not e!533541))))

(declare-fun arrayCountValidKeys!0 (array!57373 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!947840 (= res!636044 (= (arrayCountValidKeys!0 (_keys!10654 thiss!1141) #b00000000000000000000000000000000 (size!28069 (_keys!10654 thiss!1141))) (_size!2499 thiss!1141)))))

(declare-fun b!947841 () Bool)

(declare-fun res!636045 () Bool)

(assert (=> b!947841 (=> (not res!636045) (not e!533541))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57373 (_ BitVec 32)) Bool)

(assert (=> b!947841 (= res!636045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10654 thiss!1141) (mask!27489 thiss!1141)))))

(declare-fun b!947842 () Bool)

(declare-datatypes ((List!19319 0))(
  ( (Nil!19316) (Cons!19315 (h!20471 (_ BitVec 64)) (t!27637 List!19319)) )
))
(declare-fun arrayNoDuplicates!0 (array!57373 (_ BitVec 32) List!19319) Bool)

(assert (=> b!947842 (= e!533541 (arrayNoDuplicates!0 (_keys!10654 thiss!1141) #b00000000000000000000000000000000 Nil!19316))))

(assert (= (and d!114553 res!636043) b!947840))

(assert (= (and b!947840 res!636044) b!947841))

(assert (= (and b!947841 res!636045) b!947842))

(declare-fun m!880119 () Bool)

(assert (=> d!114553 m!880119))

(declare-fun m!880121 () Bool)

(assert (=> b!947840 m!880121))

(declare-fun m!880123 () Bool)

(assert (=> b!947841 m!880123))

(declare-fun m!880125 () Bool)

(assert (=> b!947842 m!880125))

(assert (=> start!80892 d!114553))

(declare-fun d!114555 () Bool)

(assert (=> d!114555 (= (array_inv!21476 (_keys!10654 thiss!1141)) (bvsge (size!28069 (_keys!10654 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!947774 d!114555))

(declare-fun d!114557 () Bool)

(assert (=> d!114557 (= (array_inv!21477 (_values!5767 thiss!1141)) (bvsge (size!28068 (_values!5767 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!947774 d!114557))

(declare-fun d!114559 () Bool)

(assert (=> d!114559 (= (validMask!0 (mask!27489 thiss!1141)) (and (or (= (mask!27489 thiss!1141) #b00000000000000000000000000000111) (= (mask!27489 thiss!1141) #b00000000000000000000000000001111) (= (mask!27489 thiss!1141) #b00000000000000000000000000011111) (= (mask!27489 thiss!1141) #b00000000000000000000000000111111) (= (mask!27489 thiss!1141) #b00000000000000000000000001111111) (= (mask!27489 thiss!1141) #b00000000000000000000000011111111) (= (mask!27489 thiss!1141) #b00000000000000000000000111111111) (= (mask!27489 thiss!1141) #b00000000000000000000001111111111) (= (mask!27489 thiss!1141) #b00000000000000000000011111111111) (= (mask!27489 thiss!1141) #b00000000000000000000111111111111) (= (mask!27489 thiss!1141) #b00000000000000000001111111111111) (= (mask!27489 thiss!1141) #b00000000000000000011111111111111) (= (mask!27489 thiss!1141) #b00000000000000000111111111111111) (= (mask!27489 thiss!1141) #b00000000000000001111111111111111) (= (mask!27489 thiss!1141) #b00000000000000011111111111111111) (= (mask!27489 thiss!1141) #b00000000000000111111111111111111) (= (mask!27489 thiss!1141) #b00000000000001111111111111111111) (= (mask!27489 thiss!1141) #b00000000000011111111111111111111) (= (mask!27489 thiss!1141) #b00000000000111111111111111111111) (= (mask!27489 thiss!1141) #b00000000001111111111111111111111) (= (mask!27489 thiss!1141) #b00000000011111111111111111111111) (= (mask!27489 thiss!1141) #b00000000111111111111111111111111) (= (mask!27489 thiss!1141) #b00000001111111111111111111111111) (= (mask!27489 thiss!1141) #b00000011111111111111111111111111) (= (mask!27489 thiss!1141) #b00000111111111111111111111111111) (= (mask!27489 thiss!1141) #b00001111111111111111111111111111) (= (mask!27489 thiss!1141) #b00011111111111111111111111111111) (= (mask!27489 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27489 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!947775 d!114559))

(declare-fun b!947855 () Bool)

(declare-fun e!533550 () SeekEntryResult!9123)

(declare-fun e!533548 () SeekEntryResult!9123)

(assert (=> b!947855 (= e!533550 e!533548)))

(declare-fun lt!426616 () (_ BitVec 64))

(declare-fun lt!426615 () SeekEntryResult!9123)

(assert (=> b!947855 (= lt!426616 (select (arr!27594 (_keys!10654 thiss!1141)) (index!38865 lt!426615)))))

(declare-fun c!98722 () Bool)

(assert (=> b!947855 (= c!98722 (= lt!426616 key!756))))

(declare-fun b!947856 () Bool)

(assert (=> b!947856 (= e!533548 (Found!9123 (index!38865 lt!426615)))))

(declare-fun b!947858 () Bool)

(declare-fun e!533549 () SeekEntryResult!9123)

(assert (=> b!947858 (= e!533549 (MissingZero!9123 (index!38865 lt!426615)))))

(declare-fun b!947859 () Bool)

(assert (=> b!947859 (= e!533550 Undefined!9123)))

(declare-fun b!947860 () Bool)

(declare-fun lt!426614 () SeekEntryResult!9123)

(assert (=> b!947860 (= e!533549 (ite ((_ is MissingVacant!9123) lt!426614) (MissingZero!9123 (index!38866 lt!426614)) lt!426614))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57373 (_ BitVec 32)) SeekEntryResult!9123)

(assert (=> b!947860 (= lt!426614 (seekKeyOrZeroReturnVacant!0 (x!81570 lt!426615) (index!38865 lt!426615) (index!38865 lt!426615) key!756 (_keys!10654 thiss!1141) (mask!27489 thiss!1141)))))

(declare-fun b!947857 () Bool)

(declare-fun c!98720 () Bool)

(assert (=> b!947857 (= c!98720 (= lt!426616 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!947857 (= e!533548 e!533549)))

(declare-fun d!114561 () Bool)

(declare-fun lt!426617 () SeekEntryResult!9123)

(assert (=> d!114561 (and (or ((_ is MissingVacant!9123) lt!426617) (not ((_ is Found!9123) lt!426617)) (and (bvsge (index!38864 lt!426617) #b00000000000000000000000000000000) (bvslt (index!38864 lt!426617) (size!28069 (_keys!10654 thiss!1141))))) (not ((_ is MissingVacant!9123) lt!426617)) (or (not ((_ is Found!9123) lt!426617)) (= (select (arr!27594 (_keys!10654 thiss!1141)) (index!38864 lt!426617)) key!756)))))

(assert (=> d!114561 (= lt!426617 e!533550)))

(declare-fun c!98721 () Bool)

(assert (=> d!114561 (= c!98721 (and ((_ is Intermediate!9123) lt!426615) (undefined!9935 lt!426615)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57373 (_ BitVec 32)) SeekEntryResult!9123)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114561 (= lt!426615 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27489 thiss!1141)) key!756 (_keys!10654 thiss!1141) (mask!27489 thiss!1141)))))

(assert (=> d!114561 (validMask!0 (mask!27489 thiss!1141))))

(assert (=> d!114561 (= (seekEntry!0 key!756 (_keys!10654 thiss!1141) (mask!27489 thiss!1141)) lt!426617)))

(assert (= (and d!114561 c!98721) b!947859))

(assert (= (and d!114561 (not c!98721)) b!947855))

(assert (= (and b!947855 c!98722) b!947856))

(assert (= (and b!947855 (not c!98722)) b!947857))

(assert (= (and b!947857 c!98720) b!947858))

(assert (= (and b!947857 (not c!98720)) b!947860))

(declare-fun m!880127 () Bool)

(assert (=> b!947855 m!880127))

(declare-fun m!880129 () Bool)

(assert (=> b!947860 m!880129))

(declare-fun m!880131 () Bool)

(assert (=> d!114561 m!880131))

(declare-fun m!880133 () Bool)

(assert (=> d!114561 m!880133))

(assert (=> d!114561 m!880133))

(declare-fun m!880135 () Bool)

(assert (=> d!114561 m!880135))

(assert (=> d!114561 m!880073))

(assert (=> b!947772 d!114561))

(declare-fun d!114563 () Bool)

(declare-fun e!533556 () Bool)

(assert (=> d!114563 e!533556))

(declare-fun res!636048 () Bool)

(assert (=> d!114563 (=> res!636048 e!533556)))

(declare-fun lt!426629 () Bool)

(assert (=> d!114563 (= res!636048 (not lt!426629))))

(declare-fun lt!426628 () Bool)

(assert (=> d!114563 (= lt!426629 lt!426628)))

(declare-datatypes ((Unit!31823 0))(
  ( (Unit!31824) )
))
(declare-fun lt!426626 () Unit!31823)

(declare-fun e!533555 () Unit!31823)

(assert (=> d!114563 (= lt!426626 e!533555)))

(declare-fun c!98725 () Bool)

(assert (=> d!114563 (= c!98725 lt!426628)))

(declare-fun containsKey!457 (List!19317 (_ BitVec 64)) Bool)

(assert (=> d!114563 (= lt!426628 (containsKey!457 (toList!6141 (getCurrentListMap!3303 (_keys!10654 thiss!1141) (_values!5767 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141))) key!756))))

(assert (=> d!114563 (= (contains!5166 (getCurrentListMap!3303 (_keys!10654 thiss!1141) (_values!5767 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141)) key!756) lt!426629)))

(declare-fun b!947867 () Bool)

(declare-fun lt!426627 () Unit!31823)

(assert (=> b!947867 (= e!533555 lt!426627)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!352 (List!19317 (_ BitVec 64)) Unit!31823)

(assert (=> b!947867 (= lt!426627 (lemmaContainsKeyImpliesGetValueByKeyDefined!352 (toList!6141 (getCurrentListMap!3303 (_keys!10654 thiss!1141) (_values!5767 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141))) key!756))))

(declare-datatypes ((Option!499 0))(
  ( (Some!498 (v!12939 V!32567)) (None!497) )
))
(declare-fun isDefined!365 (Option!499) Bool)

(declare-fun getValueByKey!493 (List!19317 (_ BitVec 64)) Option!499)

(assert (=> b!947867 (isDefined!365 (getValueByKey!493 (toList!6141 (getCurrentListMap!3303 (_keys!10654 thiss!1141) (_values!5767 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141))) key!756))))

(declare-fun b!947868 () Bool)

(declare-fun Unit!31825 () Unit!31823)

(assert (=> b!947868 (= e!533555 Unit!31825)))

(declare-fun b!947869 () Bool)

(assert (=> b!947869 (= e!533556 (isDefined!365 (getValueByKey!493 (toList!6141 (getCurrentListMap!3303 (_keys!10654 thiss!1141) (_values!5767 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141))) key!756)))))

(assert (= (and d!114563 c!98725) b!947867))

(assert (= (and d!114563 (not c!98725)) b!947868))

(assert (= (and d!114563 (not res!636048)) b!947869))

(declare-fun m!880137 () Bool)

(assert (=> d!114563 m!880137))

(declare-fun m!880139 () Bool)

(assert (=> b!947867 m!880139))

(declare-fun m!880141 () Bool)

(assert (=> b!947867 m!880141))

(assert (=> b!947867 m!880141))

(declare-fun m!880143 () Bool)

(assert (=> b!947867 m!880143))

(assert (=> b!947869 m!880141))

(assert (=> b!947869 m!880141))

(assert (=> b!947869 m!880143))

(assert (=> b!947773 d!114563))

(declare-fun b!947912 () Bool)

(declare-fun e!533584 () ListLongMap!12251)

(declare-fun call!41157 () ListLongMap!12251)

(assert (=> b!947912 (= e!533584 call!41157)))

(declare-fun d!114565 () Bool)

(declare-fun e!533590 () Bool)

(assert (=> d!114565 e!533590))

(declare-fun res!636068 () Bool)

(assert (=> d!114565 (=> (not res!636068) (not e!533590))))

(assert (=> d!114565 (= res!636068 (or (bvsge #b00000000000000000000000000000000 (size!28069 (_keys!10654 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28069 (_keys!10654 thiss!1141))))))))

(declare-fun lt!426695 () ListLongMap!12251)

(declare-fun lt!426693 () ListLongMap!12251)

(assert (=> d!114565 (= lt!426695 lt!426693)))

(declare-fun lt!426682 () Unit!31823)

(declare-fun e!533593 () Unit!31823)

(assert (=> d!114565 (= lt!426682 e!533593)))

(declare-fun c!98743 () Bool)

(declare-fun e!533592 () Bool)

(assert (=> d!114565 (= c!98743 e!533592)))

(declare-fun res!636069 () Bool)

(assert (=> d!114565 (=> (not res!636069) (not e!533592))))

(assert (=> d!114565 (= res!636069 (bvslt #b00000000000000000000000000000000 (size!28069 (_keys!10654 thiss!1141))))))

(declare-fun e!533587 () ListLongMap!12251)

(assert (=> d!114565 (= lt!426693 e!533587)))

(declare-fun c!98739 () Bool)

(assert (=> d!114565 (= c!98739 (and (not (= (bvand (extraKeys!5476 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5476 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!114565 (validMask!0 (mask!27489 thiss!1141))))

(assert (=> d!114565 (= (getCurrentListMap!3303 (_keys!10654 thiss!1141) (_values!5767 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141)) lt!426695)))

(declare-fun bm!41152 () Bool)

(declare-fun call!41158 () ListLongMap!12251)

(declare-fun call!41160 () ListLongMap!12251)

(assert (=> bm!41152 (= call!41158 call!41160)))

(declare-fun b!947913 () Bool)

(assert (=> b!947913 (= e!533587 e!533584)))

(declare-fun c!98738 () Bool)

(assert (=> b!947913 (= c!98738 (and (not (= (bvand (extraKeys!5476 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5476 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!947914 () Bool)

(declare-fun Unit!31826 () Unit!31823)

(assert (=> b!947914 (= e!533593 Unit!31826)))

(declare-fun b!947915 () Bool)

(declare-fun e!533591 () Bool)

(declare-fun e!533594 () Bool)

(assert (=> b!947915 (= e!533591 e!533594)))

(declare-fun res!636074 () Bool)

(declare-fun call!41156 () Bool)

(assert (=> b!947915 (= res!636074 call!41156)))

(assert (=> b!947915 (=> (not res!636074) (not e!533594))))

(declare-fun b!947916 () Bool)

(declare-fun apply!864 (ListLongMap!12251 (_ BitVec 64)) V!32567)

(assert (=> b!947916 (= e!533594 (= (apply!864 lt!426695 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5580 thiss!1141)))))

(declare-fun b!947917 () Bool)

(declare-fun e!533588 () Bool)

(declare-fun call!41161 () Bool)

(assert (=> b!947917 (= e!533588 (not call!41161))))

(declare-fun b!947918 () Bool)

(declare-fun e!533589 () Bool)

(assert (=> b!947918 (= e!533588 e!533589)))

(declare-fun res!636073 () Bool)

(assert (=> b!947918 (= res!636073 call!41161)))

(assert (=> b!947918 (=> (not res!636073) (not e!533589))))

(declare-fun b!947919 () Bool)

(declare-fun res!636067 () Bool)

(assert (=> b!947919 (=> (not res!636067) (not e!533590))))

(declare-fun e!533595 () Bool)

(assert (=> b!947919 (= res!636067 e!533595)))

(declare-fun res!636072 () Bool)

(assert (=> b!947919 (=> res!636072 e!533595)))

(declare-fun e!533585 () Bool)

(assert (=> b!947919 (= res!636072 (not e!533585))))

(declare-fun res!636070 () Bool)

(assert (=> b!947919 (=> (not res!636070) (not e!533585))))

(assert (=> b!947919 (= res!636070 (bvslt #b00000000000000000000000000000000 (size!28069 (_keys!10654 thiss!1141))))))

(declare-fun b!947920 () Bool)

(declare-fun c!98742 () Bool)

(assert (=> b!947920 (= c!98742 (and (not (= (bvand (extraKeys!5476 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5476 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!533586 () ListLongMap!12251)

(assert (=> b!947920 (= e!533584 e!533586)))

(declare-fun b!947921 () Bool)

(declare-fun call!41155 () ListLongMap!12251)

(declare-fun +!2874 (ListLongMap!12251 tuple2!13564) ListLongMap!12251)

(assert (=> b!947921 (= e!533587 (+!2874 call!41155 (tuple2!13565 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141))))))

(declare-fun bm!41153 () Bool)

(assert (=> bm!41153 (= call!41161 (contains!5166 lt!426695 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!947922 () Bool)

(assert (=> b!947922 (= e!533586 call!41157)))

(declare-fun bm!41154 () Bool)

(assert (=> bm!41154 (= call!41157 call!41155)))

(declare-fun b!947923 () Bool)

(assert (=> b!947923 (= e!533589 (= (apply!864 lt!426695 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5580 thiss!1141)))))

(declare-fun bm!41155 () Bool)

(declare-fun call!41159 () ListLongMap!12251)

(assert (=> bm!41155 (= call!41160 call!41159)))

(declare-fun b!947924 () Bool)

(declare-fun e!533583 () Bool)

(declare-fun get!14491 (ValueCell!9869 V!32567) V!32567)

(declare-fun dynLambda!1630 (Int (_ BitVec 64)) V!32567)

(assert (=> b!947924 (= e!533583 (= (apply!864 lt!426695 (select (arr!27594 (_keys!10654 thiss!1141)) #b00000000000000000000000000000000)) (get!14491 (select (arr!27593 (_values!5767 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1630 (defaultEntry!5744 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!947924 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28068 (_values!5767 thiss!1141))))))

(assert (=> b!947924 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28069 (_keys!10654 thiss!1141))))))

(declare-fun bm!41156 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3346 (array!57373 array!57371 (_ BitVec 32) (_ BitVec 32) V!32567 V!32567 (_ BitVec 32) Int) ListLongMap!12251)

(assert (=> bm!41156 (= call!41159 (getCurrentListMapNoExtraKeys!3346 (_keys!10654 thiss!1141) (_values!5767 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141)))))

(declare-fun b!947925 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!947925 (= e!533585 (validKeyInArray!0 (select (arr!27594 (_keys!10654 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!947926 () Bool)

(declare-fun res!636071 () Bool)

(assert (=> b!947926 (=> (not res!636071) (not e!533590))))

(assert (=> b!947926 (= res!636071 e!533591)))

(declare-fun c!98740 () Bool)

(assert (=> b!947926 (= c!98740 (not (= (bvand (extraKeys!5476 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!947927 () Bool)

(assert (=> b!947927 (= e!533591 (not call!41156))))

(declare-fun b!947928 () Bool)

(assert (=> b!947928 (= e!533590 e!533588)))

(declare-fun c!98741 () Bool)

(assert (=> b!947928 (= c!98741 (not (= (bvand (extraKeys!5476 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!41157 () Bool)

(assert (=> bm!41157 (= call!41156 (contains!5166 lt!426695 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!947929 () Bool)

(assert (=> b!947929 (= e!533592 (validKeyInArray!0 (select (arr!27594 (_keys!10654 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!947930 () Bool)

(assert (=> b!947930 (= e!533595 e!533583)))

(declare-fun res!636075 () Bool)

(assert (=> b!947930 (=> (not res!636075) (not e!533583))))

(assert (=> b!947930 (= res!636075 (contains!5166 lt!426695 (select (arr!27594 (_keys!10654 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!947930 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28069 (_keys!10654 thiss!1141))))))

(declare-fun b!947931 () Bool)

(declare-fun lt!426678 () Unit!31823)

(assert (=> b!947931 (= e!533593 lt!426678)))

(declare-fun lt!426680 () ListLongMap!12251)

(assert (=> b!947931 (= lt!426680 (getCurrentListMapNoExtraKeys!3346 (_keys!10654 thiss!1141) (_values!5767 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141)))))

(declare-fun lt!426675 () (_ BitVec 64))

(assert (=> b!947931 (= lt!426675 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!426683 () (_ BitVec 64))

(assert (=> b!947931 (= lt!426683 (select (arr!27594 (_keys!10654 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426681 () Unit!31823)

(declare-fun addStillContains!563 (ListLongMap!12251 (_ BitVec 64) V!32567 (_ BitVec 64)) Unit!31823)

(assert (=> b!947931 (= lt!426681 (addStillContains!563 lt!426680 lt!426675 (zeroValue!5580 thiss!1141) lt!426683))))

(assert (=> b!947931 (contains!5166 (+!2874 lt!426680 (tuple2!13565 lt!426675 (zeroValue!5580 thiss!1141))) lt!426683)))

(declare-fun lt!426679 () Unit!31823)

(assert (=> b!947931 (= lt!426679 lt!426681)))

(declare-fun lt!426685 () ListLongMap!12251)

(assert (=> b!947931 (= lt!426685 (getCurrentListMapNoExtraKeys!3346 (_keys!10654 thiss!1141) (_values!5767 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141)))))

(declare-fun lt!426691 () (_ BitVec 64))

(assert (=> b!947931 (= lt!426691 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!426674 () (_ BitVec 64))

(assert (=> b!947931 (= lt!426674 (select (arr!27594 (_keys!10654 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426689 () Unit!31823)

(declare-fun addApplyDifferent!443 (ListLongMap!12251 (_ BitVec 64) V!32567 (_ BitVec 64)) Unit!31823)

(assert (=> b!947931 (= lt!426689 (addApplyDifferent!443 lt!426685 lt!426691 (minValue!5580 thiss!1141) lt!426674))))

(assert (=> b!947931 (= (apply!864 (+!2874 lt!426685 (tuple2!13565 lt!426691 (minValue!5580 thiss!1141))) lt!426674) (apply!864 lt!426685 lt!426674))))

(declare-fun lt!426692 () Unit!31823)

(assert (=> b!947931 (= lt!426692 lt!426689)))

(declare-fun lt!426694 () ListLongMap!12251)

(assert (=> b!947931 (= lt!426694 (getCurrentListMapNoExtraKeys!3346 (_keys!10654 thiss!1141) (_values!5767 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141)))))

(declare-fun lt!426676 () (_ BitVec 64))

(assert (=> b!947931 (= lt!426676 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!426687 () (_ BitVec 64))

(assert (=> b!947931 (= lt!426687 (select (arr!27594 (_keys!10654 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426677 () Unit!31823)

(assert (=> b!947931 (= lt!426677 (addApplyDifferent!443 lt!426694 lt!426676 (zeroValue!5580 thiss!1141) lt!426687))))

(assert (=> b!947931 (= (apply!864 (+!2874 lt!426694 (tuple2!13565 lt!426676 (zeroValue!5580 thiss!1141))) lt!426687) (apply!864 lt!426694 lt!426687))))

(declare-fun lt!426688 () Unit!31823)

(assert (=> b!947931 (= lt!426688 lt!426677)))

(declare-fun lt!426684 () ListLongMap!12251)

(assert (=> b!947931 (= lt!426684 (getCurrentListMapNoExtraKeys!3346 (_keys!10654 thiss!1141) (_values!5767 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141)))))

(declare-fun lt!426686 () (_ BitVec 64))

(assert (=> b!947931 (= lt!426686 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!426690 () (_ BitVec 64))

(assert (=> b!947931 (= lt!426690 (select (arr!27594 (_keys!10654 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!947931 (= lt!426678 (addApplyDifferent!443 lt!426684 lt!426686 (minValue!5580 thiss!1141) lt!426690))))

(assert (=> b!947931 (= (apply!864 (+!2874 lt!426684 (tuple2!13565 lt!426686 (minValue!5580 thiss!1141))) lt!426690) (apply!864 lt!426684 lt!426690))))

(declare-fun b!947932 () Bool)

(assert (=> b!947932 (= e!533586 call!41158)))

(declare-fun bm!41158 () Bool)

(assert (=> bm!41158 (= call!41155 (+!2874 (ite c!98739 call!41159 (ite c!98738 call!41160 call!41158)) (ite (or c!98739 c!98738) (tuple2!13565 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5580 thiss!1141)) (tuple2!13565 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141)))))))

(assert (= (and d!114565 c!98739) b!947921))

(assert (= (and d!114565 (not c!98739)) b!947913))

(assert (= (and b!947913 c!98738) b!947912))

(assert (= (and b!947913 (not c!98738)) b!947920))

(assert (= (and b!947920 c!98742) b!947922))

(assert (= (and b!947920 (not c!98742)) b!947932))

(assert (= (or b!947922 b!947932) bm!41152))

(assert (= (or b!947912 bm!41152) bm!41155))

(assert (= (or b!947912 b!947922) bm!41154))

(assert (= (or b!947921 bm!41155) bm!41156))

(assert (= (or b!947921 bm!41154) bm!41158))

(assert (= (and d!114565 res!636069) b!947929))

(assert (= (and d!114565 c!98743) b!947931))

(assert (= (and d!114565 (not c!98743)) b!947914))

(assert (= (and d!114565 res!636068) b!947919))

(assert (= (and b!947919 res!636070) b!947925))

(assert (= (and b!947919 (not res!636072)) b!947930))

(assert (= (and b!947930 res!636075) b!947924))

(assert (= (and b!947919 res!636067) b!947926))

(assert (= (and b!947926 c!98740) b!947915))

(assert (= (and b!947926 (not c!98740)) b!947927))

(assert (= (and b!947915 res!636074) b!947916))

(assert (= (or b!947915 b!947927) bm!41157))

(assert (= (and b!947926 res!636071) b!947928))

(assert (= (and b!947928 c!98741) b!947918))

(assert (= (and b!947928 (not c!98741)) b!947917))

(assert (= (and b!947918 res!636073) b!947923))

(assert (= (or b!947918 b!947917) bm!41153))

(declare-fun b_lambda!14289 () Bool)

(assert (=> (not b_lambda!14289) (not b!947924)))

(declare-fun t!27636 () Bool)

(declare-fun tb!6169 () Bool)

(assert (=> (and b!947774 (= (defaultEntry!5744 thiss!1141) (defaultEntry!5744 thiss!1141)) t!27636) tb!6169))

(declare-fun result!12245 () Bool)

(assert (=> tb!6169 (= result!12245 tp_is_empty!20701)))

(assert (=> b!947924 t!27636))

(declare-fun b_and!29599 () Bool)

(assert (= b_and!29593 (and (=> t!27636 result!12245) b_and!29599)))

(declare-fun m!880145 () Bool)

(assert (=> bm!41157 m!880145))

(declare-fun m!880147 () Bool)

(assert (=> b!947923 m!880147))

(declare-fun m!880149 () Bool)

(assert (=> b!947921 m!880149))

(assert (=> d!114565 m!880073))

(declare-fun m!880151 () Bool)

(assert (=> b!947924 m!880151))

(declare-fun m!880153 () Bool)

(assert (=> b!947924 m!880153))

(declare-fun m!880155 () Bool)

(assert (=> b!947924 m!880155))

(declare-fun m!880157 () Bool)

(assert (=> b!947924 m!880157))

(assert (=> b!947924 m!880151))

(assert (=> b!947924 m!880155))

(assert (=> b!947924 m!880157))

(declare-fun m!880159 () Bool)

(assert (=> b!947924 m!880159))

(declare-fun m!880161 () Bool)

(assert (=> bm!41158 m!880161))

(declare-fun m!880163 () Bool)

(assert (=> b!947916 m!880163))

(assert (=> b!947925 m!880151))

(assert (=> b!947925 m!880151))

(declare-fun m!880165 () Bool)

(assert (=> b!947925 m!880165))

(declare-fun m!880167 () Bool)

(assert (=> bm!41153 m!880167))

(assert (=> b!947929 m!880151))

(assert (=> b!947929 m!880151))

(assert (=> b!947929 m!880165))

(declare-fun m!880169 () Bool)

(assert (=> bm!41156 m!880169))

(assert (=> b!947930 m!880151))

(assert (=> b!947930 m!880151))

(declare-fun m!880171 () Bool)

(assert (=> b!947930 m!880171))

(declare-fun m!880173 () Bool)

(assert (=> b!947931 m!880173))

(declare-fun m!880175 () Bool)

(assert (=> b!947931 m!880175))

(declare-fun m!880177 () Bool)

(assert (=> b!947931 m!880177))

(declare-fun m!880179 () Bool)

(assert (=> b!947931 m!880179))

(declare-fun m!880181 () Bool)

(assert (=> b!947931 m!880181))

(assert (=> b!947931 m!880177))

(declare-fun m!880183 () Bool)

(assert (=> b!947931 m!880183))

(declare-fun m!880185 () Bool)

(assert (=> b!947931 m!880185))

(declare-fun m!880187 () Bool)

(assert (=> b!947931 m!880187))

(assert (=> b!947931 m!880183))

(declare-fun m!880189 () Bool)

(assert (=> b!947931 m!880189))

(declare-fun m!880191 () Bool)

(assert (=> b!947931 m!880191))

(assert (=> b!947931 m!880169))

(assert (=> b!947931 m!880151))

(declare-fun m!880193 () Bool)

(assert (=> b!947931 m!880193))

(assert (=> b!947931 m!880191))

(declare-fun m!880195 () Bool)

(assert (=> b!947931 m!880195))

(assert (=> b!947931 m!880189))

(declare-fun m!880197 () Bool)

(assert (=> b!947931 m!880197))

(declare-fun m!880199 () Bool)

(assert (=> b!947931 m!880199))

(declare-fun m!880201 () Bool)

(assert (=> b!947931 m!880201))

(assert (=> b!947773 d!114565))

(declare-fun condMapEmpty!32947 () Bool)

(declare-fun mapDefault!32947 () ValueCell!9869)

(assert (=> mapNonEmpty!32938 (= condMapEmpty!32947 (= mapRest!32938 ((as const (Array (_ BitVec 32) ValueCell!9869)) mapDefault!32947)))))

(declare-fun e!533600 () Bool)

(declare-fun mapRes!32947 () Bool)

(assert (=> mapNonEmpty!32938 (= tp!63150 (and e!533600 mapRes!32947))))

(declare-fun mapIsEmpty!32947 () Bool)

(assert (=> mapIsEmpty!32947 mapRes!32947))

(declare-fun mapNonEmpty!32947 () Bool)

(declare-fun tp!63166 () Bool)

(declare-fun e!533601 () Bool)

(assert (=> mapNonEmpty!32947 (= mapRes!32947 (and tp!63166 e!533601))))

(declare-fun mapKey!32947 () (_ BitVec 32))

(declare-fun mapValue!32947 () ValueCell!9869)

(declare-fun mapRest!32947 () (Array (_ BitVec 32) ValueCell!9869))

(assert (=> mapNonEmpty!32947 (= mapRest!32938 (store mapRest!32947 mapKey!32947 mapValue!32947))))

(declare-fun b!947941 () Bool)

(assert (=> b!947941 (= e!533601 tp_is_empty!20701)))

(declare-fun b!947942 () Bool)

(assert (=> b!947942 (= e!533600 tp_is_empty!20701)))

(assert (= (and mapNonEmpty!32938 condMapEmpty!32947) mapIsEmpty!32947))

(assert (= (and mapNonEmpty!32938 (not condMapEmpty!32947)) mapNonEmpty!32947))

(assert (= (and mapNonEmpty!32947 ((_ is ValueCellFull!9869) mapValue!32947)) b!947941))

(assert (= (and mapNonEmpty!32938 ((_ is ValueCellFull!9869) mapDefault!32947)) b!947942))

(declare-fun m!880203 () Bool)

(assert (=> mapNonEmpty!32947 m!880203))

(declare-fun b_lambda!14291 () Bool)

(assert (= b_lambda!14289 (or (and b!947774 b_free!18193) b_lambda!14291)))

(check-sat (not b!947867) (not b!947841) (not b!947860) (not bm!41158) (not bm!41153) (not b_lambda!14291) (not d!114561) (not b!947869) (not mapNonEmpty!32947) (not d!114565) (not bm!41156) (not b!947929) (not b!947916) (not b!947930) (not b!947840) b_and!29599 (not b!947925) (not b!947923) (not b!947931) (not d!114563) (not bm!41157) (not b_next!18193) (not b!947924) (not b!947921) tp_is_empty!20701 (not d!114553) (not b!947842))
(check-sat b_and!29599 (not b_next!18193))
(get-model)

(declare-fun d!114567 () Bool)

(assert (=> d!114567 (= (validKeyInArray!0 (select (arr!27594 (_keys!10654 thiss!1141)) #b00000000000000000000000000000000)) (and (not (= (select (arr!27594 (_keys!10654 thiss!1141)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27594 (_keys!10654 thiss!1141)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!947925 d!114567))

(assert (=> d!114565 d!114559))

(declare-fun d!114569 () Bool)

(declare-fun isEmpty!709 (Option!499) Bool)

(assert (=> d!114569 (= (isDefined!365 (getValueByKey!493 (toList!6141 (getCurrentListMap!3303 (_keys!10654 thiss!1141) (_values!5767 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141))) key!756)) (not (isEmpty!709 (getValueByKey!493 (toList!6141 (getCurrentListMap!3303 (_keys!10654 thiss!1141) (_values!5767 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141))) key!756))))))

(declare-fun bs!26611 () Bool)

(assert (= bs!26611 d!114569))

(assert (=> bs!26611 m!880141))

(declare-fun m!880205 () Bool)

(assert (=> bs!26611 m!880205))

(assert (=> b!947869 d!114569))

(declare-fun b!947952 () Bool)

(declare-fun e!533606 () Option!499)

(declare-fun e!533607 () Option!499)

(assert (=> b!947952 (= e!533606 e!533607)))

(declare-fun c!98749 () Bool)

(assert (=> b!947952 (= c!98749 (and ((_ is Cons!19313) (toList!6141 (getCurrentListMap!3303 (_keys!10654 thiss!1141) (_values!5767 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141)))) (not (= (_1!6793 (h!20469 (toList!6141 (getCurrentListMap!3303 (_keys!10654 thiss!1141) (_values!5767 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141))))) key!756))))))

(declare-fun b!947953 () Bool)

(assert (=> b!947953 (= e!533607 (getValueByKey!493 (t!27633 (toList!6141 (getCurrentListMap!3303 (_keys!10654 thiss!1141) (_values!5767 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141)))) key!756))))

(declare-fun b!947954 () Bool)

(assert (=> b!947954 (= e!533607 None!497)))

(declare-fun b!947951 () Bool)

(assert (=> b!947951 (= e!533606 (Some!498 (_2!6793 (h!20469 (toList!6141 (getCurrentListMap!3303 (_keys!10654 thiss!1141) (_values!5767 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141)))))))))

(declare-fun d!114571 () Bool)

(declare-fun c!98748 () Bool)

(assert (=> d!114571 (= c!98748 (and ((_ is Cons!19313) (toList!6141 (getCurrentListMap!3303 (_keys!10654 thiss!1141) (_values!5767 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141)))) (= (_1!6793 (h!20469 (toList!6141 (getCurrentListMap!3303 (_keys!10654 thiss!1141) (_values!5767 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141))))) key!756)))))

(assert (=> d!114571 (= (getValueByKey!493 (toList!6141 (getCurrentListMap!3303 (_keys!10654 thiss!1141) (_values!5767 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141))) key!756) e!533606)))

(assert (= (and d!114571 c!98748) b!947951))

(assert (= (and d!114571 (not c!98748)) b!947952))

(assert (= (and b!947952 c!98749) b!947953))

(assert (= (and b!947952 (not c!98749)) b!947954))

(declare-fun m!880207 () Bool)

(assert (=> b!947953 m!880207))

(assert (=> b!947869 d!114571))

(declare-fun b!947965 () Bool)

(declare-fun e!533616 () Bool)

(declare-fun call!41164 () Bool)

(assert (=> b!947965 (= e!533616 call!41164)))

(declare-fun b!947966 () Bool)

(declare-fun e!533619 () Bool)

(assert (=> b!947966 (= e!533619 e!533616)))

(declare-fun c!98752 () Bool)

(assert (=> b!947966 (= c!98752 (validKeyInArray!0 (select (arr!27594 (_keys!10654 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114573 () Bool)

(declare-fun res!636084 () Bool)

(declare-fun e!533617 () Bool)

(assert (=> d!114573 (=> res!636084 e!533617)))

(assert (=> d!114573 (= res!636084 (bvsge #b00000000000000000000000000000000 (size!28069 (_keys!10654 thiss!1141))))))

(assert (=> d!114573 (= (arrayNoDuplicates!0 (_keys!10654 thiss!1141) #b00000000000000000000000000000000 Nil!19316) e!533617)))

(declare-fun b!947967 () Bool)

(declare-fun e!533618 () Bool)

(declare-fun contains!5168 (List!19319 (_ BitVec 64)) Bool)

(assert (=> b!947967 (= e!533618 (contains!5168 Nil!19316 (select (arr!27594 (_keys!10654 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!947968 () Bool)

(assert (=> b!947968 (= e!533617 e!533619)))

(declare-fun res!636082 () Bool)

(assert (=> b!947968 (=> (not res!636082) (not e!533619))))

(assert (=> b!947968 (= res!636082 (not e!533618))))

(declare-fun res!636083 () Bool)

(assert (=> b!947968 (=> (not res!636083) (not e!533618))))

(assert (=> b!947968 (= res!636083 (validKeyInArray!0 (select (arr!27594 (_keys!10654 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41161 () Bool)

(assert (=> bm!41161 (= call!41164 (arrayNoDuplicates!0 (_keys!10654 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98752 (Cons!19315 (select (arr!27594 (_keys!10654 thiss!1141)) #b00000000000000000000000000000000) Nil!19316) Nil!19316)))))

(declare-fun b!947969 () Bool)

(assert (=> b!947969 (= e!533616 call!41164)))

(assert (= (and d!114573 (not res!636084)) b!947968))

(assert (= (and b!947968 res!636083) b!947967))

(assert (= (and b!947968 res!636082) b!947966))

(assert (= (and b!947966 c!98752) b!947965))

(assert (= (and b!947966 (not c!98752)) b!947969))

(assert (= (or b!947965 b!947969) bm!41161))

(assert (=> b!947966 m!880151))

(assert (=> b!947966 m!880151))

(assert (=> b!947966 m!880165))

(assert (=> b!947967 m!880151))

(assert (=> b!947967 m!880151))

(declare-fun m!880209 () Bool)

(assert (=> b!947967 m!880209))

(assert (=> b!947968 m!880151))

(assert (=> b!947968 m!880151))

(assert (=> b!947968 m!880165))

(assert (=> bm!41161 m!880151))

(declare-fun m!880211 () Bool)

(assert (=> bm!41161 m!880211))

(assert (=> b!947842 d!114573))

(declare-fun d!114575 () Bool)

(declare-fun e!533622 () Bool)

(assert (=> d!114575 e!533622))

(declare-fun res!636089 () Bool)

(assert (=> d!114575 (=> (not res!636089) (not e!533622))))

(declare-fun lt!426704 () ListLongMap!12251)

(assert (=> d!114575 (= res!636089 (contains!5166 lt!426704 (_1!6793 (tuple2!13565 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141)))))))

(declare-fun lt!426705 () List!19317)

(assert (=> d!114575 (= lt!426704 (ListLongMap!12252 lt!426705))))

(declare-fun lt!426706 () Unit!31823)

(declare-fun lt!426707 () Unit!31823)

(assert (=> d!114575 (= lt!426706 lt!426707)))

(assert (=> d!114575 (= (getValueByKey!493 lt!426705 (_1!6793 (tuple2!13565 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141)))) (Some!498 (_2!6793 (tuple2!13565 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!263 (List!19317 (_ BitVec 64) V!32567) Unit!31823)

(assert (=> d!114575 (= lt!426707 (lemmaContainsTupThenGetReturnValue!263 lt!426705 (_1!6793 (tuple2!13565 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141))) (_2!6793 (tuple2!13565 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141)))))))

(declare-fun insertStrictlySorted!320 (List!19317 (_ BitVec 64) V!32567) List!19317)

(assert (=> d!114575 (= lt!426705 (insertStrictlySorted!320 (toList!6141 call!41155) (_1!6793 (tuple2!13565 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141))) (_2!6793 (tuple2!13565 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141)))))))

(assert (=> d!114575 (= (+!2874 call!41155 (tuple2!13565 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141))) lt!426704)))

(declare-fun b!947974 () Bool)

(declare-fun res!636090 () Bool)

(assert (=> b!947974 (=> (not res!636090) (not e!533622))))

(assert (=> b!947974 (= res!636090 (= (getValueByKey!493 (toList!6141 lt!426704) (_1!6793 (tuple2!13565 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141)))) (Some!498 (_2!6793 (tuple2!13565 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141))))))))

(declare-fun b!947975 () Bool)

(declare-fun contains!5169 (List!19317 tuple2!13564) Bool)

(assert (=> b!947975 (= e!533622 (contains!5169 (toList!6141 lt!426704) (tuple2!13565 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141))))))

(assert (= (and d!114575 res!636089) b!947974))

(assert (= (and b!947974 res!636090) b!947975))

(declare-fun m!880213 () Bool)

(assert (=> d!114575 m!880213))

(declare-fun m!880215 () Bool)

(assert (=> d!114575 m!880215))

(declare-fun m!880217 () Bool)

(assert (=> d!114575 m!880217))

(declare-fun m!880219 () Bool)

(assert (=> d!114575 m!880219))

(declare-fun m!880221 () Bool)

(assert (=> b!947974 m!880221))

(declare-fun m!880223 () Bool)

(assert (=> b!947975 m!880223))

(assert (=> b!947921 d!114575))

(declare-fun d!114577 () Bool)

(declare-fun e!533624 () Bool)

(assert (=> d!114577 e!533624))

(declare-fun res!636091 () Bool)

(assert (=> d!114577 (=> res!636091 e!533624)))

(declare-fun lt!426711 () Bool)

(assert (=> d!114577 (= res!636091 (not lt!426711))))

(declare-fun lt!426710 () Bool)

(assert (=> d!114577 (= lt!426711 lt!426710)))

(declare-fun lt!426708 () Unit!31823)

(declare-fun e!533623 () Unit!31823)

(assert (=> d!114577 (= lt!426708 e!533623)))

(declare-fun c!98753 () Bool)

(assert (=> d!114577 (= c!98753 lt!426710)))

(assert (=> d!114577 (= lt!426710 (containsKey!457 (toList!6141 lt!426695) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!114577 (= (contains!5166 lt!426695 #b1000000000000000000000000000000000000000000000000000000000000000) lt!426711)))

(declare-fun b!947976 () Bool)

(declare-fun lt!426709 () Unit!31823)

(assert (=> b!947976 (= e!533623 lt!426709)))

(assert (=> b!947976 (= lt!426709 (lemmaContainsKeyImpliesGetValueByKeyDefined!352 (toList!6141 lt!426695) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!947976 (isDefined!365 (getValueByKey!493 (toList!6141 lt!426695) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!947977 () Bool)

(declare-fun Unit!31827 () Unit!31823)

(assert (=> b!947977 (= e!533623 Unit!31827)))

(declare-fun b!947978 () Bool)

(assert (=> b!947978 (= e!533624 (isDefined!365 (getValueByKey!493 (toList!6141 lt!426695) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!114577 c!98753) b!947976))

(assert (= (and d!114577 (not c!98753)) b!947977))

(assert (= (and d!114577 (not res!636091)) b!947978))

(declare-fun m!880225 () Bool)

(assert (=> d!114577 m!880225))

(declare-fun m!880227 () Bool)

(assert (=> b!947976 m!880227))

(declare-fun m!880229 () Bool)

(assert (=> b!947976 m!880229))

(assert (=> b!947976 m!880229))

(declare-fun m!880231 () Bool)

(assert (=> b!947976 m!880231))

(assert (=> b!947978 m!880229))

(assert (=> b!947978 m!880229))

(assert (=> b!947978 m!880231))

(assert (=> bm!41153 d!114577))

(declare-fun b!947997 () Bool)

(declare-fun e!533637 () Bool)

(declare-fun e!533638 () Bool)

(assert (=> b!947997 (= e!533637 e!533638)))

(declare-fun res!636098 () Bool)

(declare-fun lt!426716 () SeekEntryResult!9123)

(assert (=> b!947997 (= res!636098 (and ((_ is Intermediate!9123) lt!426716) (not (undefined!9935 lt!426716)) (bvslt (x!81570 lt!426716) #b01111111111111111111111111111110) (bvsge (x!81570 lt!426716) #b00000000000000000000000000000000) (bvsge (x!81570 lt!426716) #b00000000000000000000000000000000)))))

(assert (=> b!947997 (=> (not res!636098) (not e!533638))))

(declare-fun b!947998 () Bool)

(assert (=> b!947998 (and (bvsge (index!38865 lt!426716) #b00000000000000000000000000000000) (bvslt (index!38865 lt!426716) (size!28069 (_keys!10654 thiss!1141))))))

(declare-fun e!533636 () Bool)

(assert (=> b!947998 (= e!533636 (= (select (arr!27594 (_keys!10654 thiss!1141)) (index!38865 lt!426716)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!948000 () Bool)

(declare-fun e!533635 () SeekEntryResult!9123)

(assert (=> b!948000 (= e!533635 (Intermediate!9123 false (toIndex!0 key!756 (mask!27489 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!948001 () Bool)

(assert (=> b!948001 (and (bvsge (index!38865 lt!426716) #b00000000000000000000000000000000) (bvslt (index!38865 lt!426716) (size!28069 (_keys!10654 thiss!1141))))))

(declare-fun res!636099 () Bool)

(assert (=> b!948001 (= res!636099 (= (select (arr!27594 (_keys!10654 thiss!1141)) (index!38865 lt!426716)) key!756))))

(assert (=> b!948001 (=> res!636099 e!533636)))

(assert (=> b!948001 (= e!533638 e!533636)))

(declare-fun b!948002 () Bool)

(assert (=> b!948002 (= e!533637 (bvsge (x!81570 lt!426716) #b01111111111111111111111111111110))))

(declare-fun b!948003 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!948003 (= e!533635 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27489 thiss!1141)) #b00000000000000000000000000000000 (mask!27489 thiss!1141)) key!756 (_keys!10654 thiss!1141) (mask!27489 thiss!1141)))))

(declare-fun b!948004 () Bool)

(declare-fun e!533639 () SeekEntryResult!9123)

(assert (=> b!948004 (= e!533639 e!533635)))

(declare-fun c!98761 () Bool)

(declare-fun lt!426717 () (_ BitVec 64))

(assert (=> b!948004 (= c!98761 (or (= lt!426717 key!756) (= (bvadd lt!426717 lt!426717) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!948005 () Bool)

(assert (=> b!948005 (and (bvsge (index!38865 lt!426716) #b00000000000000000000000000000000) (bvslt (index!38865 lt!426716) (size!28069 (_keys!10654 thiss!1141))))))

(declare-fun res!636100 () Bool)

(assert (=> b!948005 (= res!636100 (= (select (arr!27594 (_keys!10654 thiss!1141)) (index!38865 lt!426716)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!948005 (=> res!636100 e!533636)))

(declare-fun d!114579 () Bool)

(assert (=> d!114579 e!533637))

(declare-fun c!98762 () Bool)

(assert (=> d!114579 (= c!98762 (and ((_ is Intermediate!9123) lt!426716) (undefined!9935 lt!426716)))))

(assert (=> d!114579 (= lt!426716 e!533639)))

(declare-fun c!98760 () Bool)

(assert (=> d!114579 (= c!98760 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!114579 (= lt!426717 (select (arr!27594 (_keys!10654 thiss!1141)) (toIndex!0 key!756 (mask!27489 thiss!1141))))))

(assert (=> d!114579 (validMask!0 (mask!27489 thiss!1141))))

(assert (=> d!114579 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27489 thiss!1141)) key!756 (_keys!10654 thiss!1141) (mask!27489 thiss!1141)) lt!426716)))

(declare-fun b!947999 () Bool)

(assert (=> b!947999 (= e!533639 (Intermediate!9123 true (toIndex!0 key!756 (mask!27489 thiss!1141)) #b00000000000000000000000000000000))))

(assert (= (and d!114579 c!98760) b!947999))

(assert (= (and d!114579 (not c!98760)) b!948004))

(assert (= (and b!948004 c!98761) b!948000))

(assert (= (and b!948004 (not c!98761)) b!948003))

(assert (= (and d!114579 c!98762) b!948002))

(assert (= (and d!114579 (not c!98762)) b!947997))

(assert (= (and b!947997 res!636098) b!948001))

(assert (= (and b!948001 (not res!636099)) b!948005))

(assert (= (and b!948005 (not res!636100)) b!947998))

(assert (=> b!948003 m!880133))

(declare-fun m!880233 () Bool)

(assert (=> b!948003 m!880233))

(assert (=> b!948003 m!880233))

(declare-fun m!880235 () Bool)

(assert (=> b!948003 m!880235))

(assert (=> d!114579 m!880133))

(declare-fun m!880237 () Bool)

(assert (=> d!114579 m!880237))

(assert (=> d!114579 m!880073))

(declare-fun m!880239 () Bool)

(assert (=> b!948001 m!880239))

(assert (=> b!948005 m!880239))

(assert (=> b!947998 m!880239))

(assert (=> d!114561 d!114579))

(declare-fun d!114581 () Bool)

(declare-fun lt!426723 () (_ BitVec 32))

(declare-fun lt!426722 () (_ BitVec 32))

(assert (=> d!114581 (= lt!426723 (bvmul (bvxor lt!426722 (bvlshr lt!426722 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!114581 (= lt!426722 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!114581 (and (bvsge (mask!27489 thiss!1141) #b00000000000000000000000000000000) (let ((res!636101 (let ((h!20472 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!81587 (bvmul (bvxor h!20472 (bvlshr h!20472 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!81587 (bvlshr x!81587 #b00000000000000000000000000001101)) (mask!27489 thiss!1141)))))) (and (bvslt res!636101 (bvadd (mask!27489 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!636101 #b00000000000000000000000000000000))))))

(assert (=> d!114581 (= (toIndex!0 key!756 (mask!27489 thiss!1141)) (bvand (bvxor lt!426723 (bvlshr lt!426723 #b00000000000000000000000000001101)) (mask!27489 thiss!1141)))))

(assert (=> d!114561 d!114581))

(assert (=> d!114561 d!114559))

(declare-fun d!114583 () Bool)

(declare-fun e!533641 () Bool)

(assert (=> d!114583 e!533641))

(declare-fun res!636102 () Bool)

(assert (=> d!114583 (=> res!636102 e!533641)))

(declare-fun lt!426727 () Bool)

(assert (=> d!114583 (= res!636102 (not lt!426727))))

(declare-fun lt!426726 () Bool)

(assert (=> d!114583 (= lt!426727 lt!426726)))

(declare-fun lt!426724 () Unit!31823)

(declare-fun e!533640 () Unit!31823)

(assert (=> d!114583 (= lt!426724 e!533640)))

(declare-fun c!98763 () Bool)

(assert (=> d!114583 (= c!98763 lt!426726)))

(assert (=> d!114583 (= lt!426726 (containsKey!457 (toList!6141 lt!426695) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!114583 (= (contains!5166 lt!426695 #b0000000000000000000000000000000000000000000000000000000000000000) lt!426727)))

(declare-fun b!948006 () Bool)

(declare-fun lt!426725 () Unit!31823)

(assert (=> b!948006 (= e!533640 lt!426725)))

(assert (=> b!948006 (= lt!426725 (lemmaContainsKeyImpliesGetValueByKeyDefined!352 (toList!6141 lt!426695) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!948006 (isDefined!365 (getValueByKey!493 (toList!6141 lt!426695) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!948007 () Bool)

(declare-fun Unit!31828 () Unit!31823)

(assert (=> b!948007 (= e!533640 Unit!31828)))

(declare-fun b!948008 () Bool)

(assert (=> b!948008 (= e!533641 (isDefined!365 (getValueByKey!493 (toList!6141 lt!426695) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!114583 c!98763) b!948006))

(assert (= (and d!114583 (not c!98763)) b!948007))

(assert (= (and d!114583 (not res!636102)) b!948008))

(declare-fun m!880241 () Bool)

(assert (=> d!114583 m!880241))

(declare-fun m!880243 () Bool)

(assert (=> b!948006 m!880243))

(declare-fun m!880245 () Bool)

(assert (=> b!948006 m!880245))

(assert (=> b!948006 m!880245))

(declare-fun m!880247 () Bool)

(assert (=> b!948006 m!880247))

(assert (=> b!948008 m!880245))

(assert (=> b!948008 m!880245))

(assert (=> b!948008 m!880247))

(assert (=> bm!41157 d!114583))

(assert (=> b!947929 d!114567))

(declare-fun b!948021 () Bool)

(declare-fun e!533649 () SeekEntryResult!9123)

(declare-fun e!533648 () SeekEntryResult!9123)

(assert (=> b!948021 (= e!533649 e!533648)))

(declare-fun c!98771 () Bool)

(declare-fun lt!426732 () (_ BitVec 64))

(assert (=> b!948021 (= c!98771 (= lt!426732 key!756))))

(declare-fun b!948022 () Bool)

(declare-fun e!533650 () SeekEntryResult!9123)

(assert (=> b!948022 (= e!533650 (seekKeyOrZeroReturnVacant!0 (bvadd (x!81570 lt!426615) #b00000000000000000000000000000001) (nextIndex!0 (index!38865 lt!426615) (x!81570 lt!426615) (mask!27489 thiss!1141)) (index!38865 lt!426615) key!756 (_keys!10654 thiss!1141) (mask!27489 thiss!1141)))))

(declare-fun b!948023 () Bool)

(declare-fun c!98770 () Bool)

(assert (=> b!948023 (= c!98770 (= lt!426732 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!948023 (= e!533648 e!533650)))

(declare-fun b!948024 () Bool)

(assert (=> b!948024 (= e!533648 (Found!9123 (index!38865 lt!426615)))))

(declare-fun lt!426733 () SeekEntryResult!9123)

(declare-fun d!114585 () Bool)

(assert (=> d!114585 (and (or ((_ is Undefined!9123) lt!426733) (not ((_ is Found!9123) lt!426733)) (and (bvsge (index!38864 lt!426733) #b00000000000000000000000000000000) (bvslt (index!38864 lt!426733) (size!28069 (_keys!10654 thiss!1141))))) (or ((_ is Undefined!9123) lt!426733) ((_ is Found!9123) lt!426733) (not ((_ is MissingVacant!9123) lt!426733)) (not (= (index!38866 lt!426733) (index!38865 lt!426615))) (and (bvsge (index!38866 lt!426733) #b00000000000000000000000000000000) (bvslt (index!38866 lt!426733) (size!28069 (_keys!10654 thiss!1141))))) (or ((_ is Undefined!9123) lt!426733) (ite ((_ is Found!9123) lt!426733) (= (select (arr!27594 (_keys!10654 thiss!1141)) (index!38864 lt!426733)) key!756) (and ((_ is MissingVacant!9123) lt!426733) (= (index!38866 lt!426733) (index!38865 lt!426615)) (= (select (arr!27594 (_keys!10654 thiss!1141)) (index!38866 lt!426733)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!114585 (= lt!426733 e!533649)))

(declare-fun c!98772 () Bool)

(assert (=> d!114585 (= c!98772 (bvsge (x!81570 lt!426615) #b01111111111111111111111111111110))))

(assert (=> d!114585 (= lt!426732 (select (arr!27594 (_keys!10654 thiss!1141)) (index!38865 lt!426615)))))

(assert (=> d!114585 (validMask!0 (mask!27489 thiss!1141))))

(assert (=> d!114585 (= (seekKeyOrZeroReturnVacant!0 (x!81570 lt!426615) (index!38865 lt!426615) (index!38865 lt!426615) key!756 (_keys!10654 thiss!1141) (mask!27489 thiss!1141)) lt!426733)))

(declare-fun b!948025 () Bool)

(assert (=> b!948025 (= e!533649 Undefined!9123)))

(declare-fun b!948026 () Bool)

(assert (=> b!948026 (= e!533650 (MissingVacant!9123 (index!38865 lt!426615)))))

(assert (= (and d!114585 c!98772) b!948025))

(assert (= (and d!114585 (not c!98772)) b!948021))

(assert (= (and b!948021 c!98771) b!948024))

(assert (= (and b!948021 (not c!98771)) b!948023))

(assert (= (and b!948023 c!98770) b!948026))

(assert (= (and b!948023 (not c!98770)) b!948022))

(declare-fun m!880249 () Bool)

(assert (=> b!948022 m!880249))

(assert (=> b!948022 m!880249))

(declare-fun m!880251 () Bool)

(assert (=> b!948022 m!880251))

(declare-fun m!880253 () Bool)

(assert (=> d!114585 m!880253))

(declare-fun m!880255 () Bool)

(assert (=> d!114585 m!880255))

(assert (=> d!114585 m!880127))

(assert (=> d!114585 m!880073))

(assert (=> b!947860 d!114585))

(declare-fun d!114587 () Bool)

(declare-fun res!636107 () Bool)

(declare-fun e!533655 () Bool)

(assert (=> d!114587 (=> res!636107 e!533655)))

(assert (=> d!114587 (= res!636107 (and ((_ is Cons!19313) (toList!6141 (getCurrentListMap!3303 (_keys!10654 thiss!1141) (_values!5767 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141)))) (= (_1!6793 (h!20469 (toList!6141 (getCurrentListMap!3303 (_keys!10654 thiss!1141) (_values!5767 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141))))) key!756)))))

(assert (=> d!114587 (= (containsKey!457 (toList!6141 (getCurrentListMap!3303 (_keys!10654 thiss!1141) (_values!5767 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141))) key!756) e!533655)))

(declare-fun b!948031 () Bool)

(declare-fun e!533656 () Bool)

(assert (=> b!948031 (= e!533655 e!533656)))

(declare-fun res!636108 () Bool)

(assert (=> b!948031 (=> (not res!636108) (not e!533656))))

(assert (=> b!948031 (= res!636108 (and (or (not ((_ is Cons!19313) (toList!6141 (getCurrentListMap!3303 (_keys!10654 thiss!1141) (_values!5767 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141))))) (bvsle (_1!6793 (h!20469 (toList!6141 (getCurrentListMap!3303 (_keys!10654 thiss!1141) (_values!5767 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141))))) key!756)) ((_ is Cons!19313) (toList!6141 (getCurrentListMap!3303 (_keys!10654 thiss!1141) (_values!5767 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141)))) (bvslt (_1!6793 (h!20469 (toList!6141 (getCurrentListMap!3303 (_keys!10654 thiss!1141) (_values!5767 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141))))) key!756)))))

(declare-fun b!948032 () Bool)

(assert (=> b!948032 (= e!533656 (containsKey!457 (t!27633 (toList!6141 (getCurrentListMap!3303 (_keys!10654 thiss!1141) (_values!5767 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141)))) key!756))))

(assert (= (and d!114587 (not res!636107)) b!948031))

(assert (= (and b!948031 res!636108) b!948032))

(declare-fun m!880257 () Bool)

(assert (=> b!948032 m!880257))

(assert (=> d!114563 d!114587))

(declare-fun d!114589 () Bool)

(declare-fun e!533658 () Bool)

(assert (=> d!114589 e!533658))

(declare-fun res!636109 () Bool)

(assert (=> d!114589 (=> res!636109 e!533658)))

(declare-fun lt!426737 () Bool)

(assert (=> d!114589 (= res!636109 (not lt!426737))))

(declare-fun lt!426736 () Bool)

(assert (=> d!114589 (= lt!426737 lt!426736)))

(declare-fun lt!426734 () Unit!31823)

(declare-fun e!533657 () Unit!31823)

(assert (=> d!114589 (= lt!426734 e!533657)))

(declare-fun c!98773 () Bool)

(assert (=> d!114589 (= c!98773 lt!426736)))

(assert (=> d!114589 (= lt!426736 (containsKey!457 (toList!6141 lt!426695) (select (arr!27594 (_keys!10654 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!114589 (= (contains!5166 lt!426695 (select (arr!27594 (_keys!10654 thiss!1141)) #b00000000000000000000000000000000)) lt!426737)))

(declare-fun b!948033 () Bool)

(declare-fun lt!426735 () Unit!31823)

(assert (=> b!948033 (= e!533657 lt!426735)))

(assert (=> b!948033 (= lt!426735 (lemmaContainsKeyImpliesGetValueByKeyDefined!352 (toList!6141 lt!426695) (select (arr!27594 (_keys!10654 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!948033 (isDefined!365 (getValueByKey!493 (toList!6141 lt!426695) (select (arr!27594 (_keys!10654 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!948034 () Bool)

(declare-fun Unit!31829 () Unit!31823)

(assert (=> b!948034 (= e!533657 Unit!31829)))

(declare-fun b!948035 () Bool)

(assert (=> b!948035 (= e!533658 (isDefined!365 (getValueByKey!493 (toList!6141 lt!426695) (select (arr!27594 (_keys!10654 thiss!1141)) #b00000000000000000000000000000000))))))

(assert (= (and d!114589 c!98773) b!948033))

(assert (= (and d!114589 (not c!98773)) b!948034))

(assert (= (and d!114589 (not res!636109)) b!948035))

(assert (=> d!114589 m!880151))

(declare-fun m!880259 () Bool)

(assert (=> d!114589 m!880259))

(assert (=> b!948033 m!880151))

(declare-fun m!880261 () Bool)

(assert (=> b!948033 m!880261))

(assert (=> b!948033 m!880151))

(declare-fun m!880263 () Bool)

(assert (=> b!948033 m!880263))

(assert (=> b!948033 m!880263))

(declare-fun m!880265 () Bool)

(assert (=> b!948033 m!880265))

(assert (=> b!948035 m!880151))

(assert (=> b!948035 m!880263))

(assert (=> b!948035 m!880263))

(assert (=> b!948035 m!880265))

(assert (=> b!947930 d!114589))

(declare-fun d!114591 () Bool)

(assert (=> d!114591 (= (apply!864 (+!2874 lt!426684 (tuple2!13565 lt!426686 (minValue!5580 thiss!1141))) lt!426690) (apply!864 lt!426684 lt!426690))))

(declare-fun lt!426740 () Unit!31823)

(declare-fun choose!1581 (ListLongMap!12251 (_ BitVec 64) V!32567 (_ BitVec 64)) Unit!31823)

(assert (=> d!114591 (= lt!426740 (choose!1581 lt!426684 lt!426686 (minValue!5580 thiss!1141) lt!426690))))

(declare-fun e!533661 () Bool)

(assert (=> d!114591 e!533661))

(declare-fun res!636112 () Bool)

(assert (=> d!114591 (=> (not res!636112) (not e!533661))))

(assert (=> d!114591 (= res!636112 (contains!5166 lt!426684 lt!426690))))

(assert (=> d!114591 (= (addApplyDifferent!443 lt!426684 lt!426686 (minValue!5580 thiss!1141) lt!426690) lt!426740)))

(declare-fun b!948039 () Bool)

(assert (=> b!948039 (= e!533661 (not (= lt!426690 lt!426686)))))

(assert (= (and d!114591 res!636112) b!948039))

(declare-fun m!880267 () Bool)

(assert (=> d!114591 m!880267))

(assert (=> d!114591 m!880177))

(assert (=> d!114591 m!880179))

(assert (=> d!114591 m!880177))

(declare-fun m!880269 () Bool)

(assert (=> d!114591 m!880269))

(assert (=> d!114591 m!880181))

(assert (=> b!947931 d!114591))

(declare-fun d!114593 () Bool)

(declare-fun get!14492 (Option!499) V!32567)

(assert (=> d!114593 (= (apply!864 (+!2874 lt!426694 (tuple2!13565 lt!426676 (zeroValue!5580 thiss!1141))) lt!426687) (get!14492 (getValueByKey!493 (toList!6141 (+!2874 lt!426694 (tuple2!13565 lt!426676 (zeroValue!5580 thiss!1141)))) lt!426687)))))

(declare-fun bs!26612 () Bool)

(assert (= bs!26612 d!114593))

(declare-fun m!880271 () Bool)

(assert (=> bs!26612 m!880271))

(assert (=> bs!26612 m!880271))

(declare-fun m!880273 () Bool)

(assert (=> bs!26612 m!880273))

(assert (=> b!947931 d!114593))

(declare-fun d!114595 () Bool)

(declare-fun e!533662 () Bool)

(assert (=> d!114595 e!533662))

(declare-fun res!636113 () Bool)

(assert (=> d!114595 (=> (not res!636113) (not e!533662))))

(declare-fun lt!426741 () ListLongMap!12251)

(assert (=> d!114595 (= res!636113 (contains!5166 lt!426741 (_1!6793 (tuple2!13565 lt!426675 (zeroValue!5580 thiss!1141)))))))

(declare-fun lt!426742 () List!19317)

(assert (=> d!114595 (= lt!426741 (ListLongMap!12252 lt!426742))))

(declare-fun lt!426743 () Unit!31823)

(declare-fun lt!426744 () Unit!31823)

(assert (=> d!114595 (= lt!426743 lt!426744)))

(assert (=> d!114595 (= (getValueByKey!493 lt!426742 (_1!6793 (tuple2!13565 lt!426675 (zeroValue!5580 thiss!1141)))) (Some!498 (_2!6793 (tuple2!13565 lt!426675 (zeroValue!5580 thiss!1141)))))))

(assert (=> d!114595 (= lt!426744 (lemmaContainsTupThenGetReturnValue!263 lt!426742 (_1!6793 (tuple2!13565 lt!426675 (zeroValue!5580 thiss!1141))) (_2!6793 (tuple2!13565 lt!426675 (zeroValue!5580 thiss!1141)))))))

(assert (=> d!114595 (= lt!426742 (insertStrictlySorted!320 (toList!6141 lt!426680) (_1!6793 (tuple2!13565 lt!426675 (zeroValue!5580 thiss!1141))) (_2!6793 (tuple2!13565 lt!426675 (zeroValue!5580 thiss!1141)))))))

(assert (=> d!114595 (= (+!2874 lt!426680 (tuple2!13565 lt!426675 (zeroValue!5580 thiss!1141))) lt!426741)))

(declare-fun b!948040 () Bool)

(declare-fun res!636114 () Bool)

(assert (=> b!948040 (=> (not res!636114) (not e!533662))))

(assert (=> b!948040 (= res!636114 (= (getValueByKey!493 (toList!6141 lt!426741) (_1!6793 (tuple2!13565 lt!426675 (zeroValue!5580 thiss!1141)))) (Some!498 (_2!6793 (tuple2!13565 lt!426675 (zeroValue!5580 thiss!1141))))))))

(declare-fun b!948041 () Bool)

(assert (=> b!948041 (= e!533662 (contains!5169 (toList!6141 lt!426741) (tuple2!13565 lt!426675 (zeroValue!5580 thiss!1141))))))

(assert (= (and d!114595 res!636113) b!948040))

(assert (= (and b!948040 res!636114) b!948041))

(declare-fun m!880275 () Bool)

(assert (=> d!114595 m!880275))

(declare-fun m!880277 () Bool)

(assert (=> d!114595 m!880277))

(declare-fun m!880279 () Bool)

(assert (=> d!114595 m!880279))

(declare-fun m!880281 () Bool)

(assert (=> d!114595 m!880281))

(declare-fun m!880283 () Bool)

(assert (=> b!948040 m!880283))

(declare-fun m!880285 () Bool)

(assert (=> b!948041 m!880285))

(assert (=> b!947931 d!114595))

(declare-fun d!114597 () Bool)

(assert (=> d!114597 (= (apply!864 lt!426685 lt!426674) (get!14492 (getValueByKey!493 (toList!6141 lt!426685) lt!426674)))))

(declare-fun bs!26613 () Bool)

(assert (= bs!26613 d!114597))

(declare-fun m!880287 () Bool)

(assert (=> bs!26613 m!880287))

(assert (=> bs!26613 m!880287))

(declare-fun m!880289 () Bool)

(assert (=> bs!26613 m!880289))

(assert (=> b!947931 d!114597))

(declare-fun d!114599 () Bool)

(assert (=> d!114599 (= (apply!864 (+!2874 lt!426685 (tuple2!13565 lt!426691 (minValue!5580 thiss!1141))) lt!426674) (apply!864 lt!426685 lt!426674))))

(declare-fun lt!426745 () Unit!31823)

(assert (=> d!114599 (= lt!426745 (choose!1581 lt!426685 lt!426691 (minValue!5580 thiss!1141) lt!426674))))

(declare-fun e!533663 () Bool)

(assert (=> d!114599 e!533663))

(declare-fun res!636115 () Bool)

(assert (=> d!114599 (=> (not res!636115) (not e!533663))))

(assert (=> d!114599 (= res!636115 (contains!5166 lt!426685 lt!426674))))

(assert (=> d!114599 (= (addApplyDifferent!443 lt!426685 lt!426691 (minValue!5580 thiss!1141) lt!426674) lt!426745)))

(declare-fun b!948042 () Bool)

(assert (=> b!948042 (= e!533663 (not (= lt!426674 lt!426691)))))

(assert (= (and d!114599 res!636115) b!948042))

(declare-fun m!880291 () Bool)

(assert (=> d!114599 m!880291))

(assert (=> d!114599 m!880183))

(assert (=> d!114599 m!880185))

(assert (=> d!114599 m!880183))

(declare-fun m!880293 () Bool)

(assert (=> d!114599 m!880293))

(assert (=> d!114599 m!880199))

(assert (=> b!947931 d!114599))

(declare-fun d!114601 () Bool)

(assert (=> d!114601 (= (apply!864 lt!426684 lt!426690) (get!14492 (getValueByKey!493 (toList!6141 lt!426684) lt!426690)))))

(declare-fun bs!26614 () Bool)

(assert (= bs!26614 d!114601))

(declare-fun m!880295 () Bool)

(assert (=> bs!26614 m!880295))

(assert (=> bs!26614 m!880295))

(declare-fun m!880297 () Bool)

(assert (=> bs!26614 m!880297))

(assert (=> b!947931 d!114601))

(declare-fun d!114603 () Bool)

(assert (=> d!114603 (= (apply!864 (+!2874 lt!426694 (tuple2!13565 lt!426676 (zeroValue!5580 thiss!1141))) lt!426687) (apply!864 lt!426694 lt!426687))))

(declare-fun lt!426746 () Unit!31823)

(assert (=> d!114603 (= lt!426746 (choose!1581 lt!426694 lt!426676 (zeroValue!5580 thiss!1141) lt!426687))))

(declare-fun e!533664 () Bool)

(assert (=> d!114603 e!533664))

(declare-fun res!636116 () Bool)

(assert (=> d!114603 (=> (not res!636116) (not e!533664))))

(assert (=> d!114603 (= res!636116 (contains!5166 lt!426694 lt!426687))))

(assert (=> d!114603 (= (addApplyDifferent!443 lt!426694 lt!426676 (zeroValue!5580 thiss!1141) lt!426687) lt!426746)))

(declare-fun b!948043 () Bool)

(assert (=> b!948043 (= e!533664 (not (= lt!426687 lt!426676)))))

(assert (= (and d!114603 res!636116) b!948043))

(declare-fun m!880299 () Bool)

(assert (=> d!114603 m!880299))

(assert (=> d!114603 m!880189))

(assert (=> d!114603 m!880197))

(assert (=> d!114603 m!880189))

(declare-fun m!880301 () Bool)

(assert (=> d!114603 m!880301))

(assert (=> d!114603 m!880173))

(assert (=> b!947931 d!114603))

(declare-fun d!114605 () Bool)

(declare-fun e!533665 () Bool)

(assert (=> d!114605 e!533665))

(declare-fun res!636117 () Bool)

(assert (=> d!114605 (=> (not res!636117) (not e!533665))))

(declare-fun lt!426747 () ListLongMap!12251)

(assert (=> d!114605 (= res!636117 (contains!5166 lt!426747 (_1!6793 (tuple2!13565 lt!426691 (minValue!5580 thiss!1141)))))))

(declare-fun lt!426748 () List!19317)

(assert (=> d!114605 (= lt!426747 (ListLongMap!12252 lt!426748))))

(declare-fun lt!426749 () Unit!31823)

(declare-fun lt!426750 () Unit!31823)

(assert (=> d!114605 (= lt!426749 lt!426750)))

(assert (=> d!114605 (= (getValueByKey!493 lt!426748 (_1!6793 (tuple2!13565 lt!426691 (minValue!5580 thiss!1141)))) (Some!498 (_2!6793 (tuple2!13565 lt!426691 (minValue!5580 thiss!1141)))))))

(assert (=> d!114605 (= lt!426750 (lemmaContainsTupThenGetReturnValue!263 lt!426748 (_1!6793 (tuple2!13565 lt!426691 (minValue!5580 thiss!1141))) (_2!6793 (tuple2!13565 lt!426691 (minValue!5580 thiss!1141)))))))

(assert (=> d!114605 (= lt!426748 (insertStrictlySorted!320 (toList!6141 lt!426685) (_1!6793 (tuple2!13565 lt!426691 (minValue!5580 thiss!1141))) (_2!6793 (tuple2!13565 lt!426691 (minValue!5580 thiss!1141)))))))

(assert (=> d!114605 (= (+!2874 lt!426685 (tuple2!13565 lt!426691 (minValue!5580 thiss!1141))) lt!426747)))

(declare-fun b!948044 () Bool)

(declare-fun res!636118 () Bool)

(assert (=> b!948044 (=> (not res!636118) (not e!533665))))

(assert (=> b!948044 (= res!636118 (= (getValueByKey!493 (toList!6141 lt!426747) (_1!6793 (tuple2!13565 lt!426691 (minValue!5580 thiss!1141)))) (Some!498 (_2!6793 (tuple2!13565 lt!426691 (minValue!5580 thiss!1141))))))))

(declare-fun b!948045 () Bool)

(assert (=> b!948045 (= e!533665 (contains!5169 (toList!6141 lt!426747) (tuple2!13565 lt!426691 (minValue!5580 thiss!1141))))))

(assert (= (and d!114605 res!636117) b!948044))

(assert (= (and b!948044 res!636118) b!948045))

(declare-fun m!880303 () Bool)

(assert (=> d!114605 m!880303))

(declare-fun m!880305 () Bool)

(assert (=> d!114605 m!880305))

(declare-fun m!880307 () Bool)

(assert (=> d!114605 m!880307))

(declare-fun m!880309 () Bool)

(assert (=> d!114605 m!880309))

(declare-fun m!880311 () Bool)

(assert (=> b!948044 m!880311))

(declare-fun m!880313 () Bool)

(assert (=> b!948045 m!880313))

(assert (=> b!947931 d!114605))

(declare-fun d!114607 () Bool)

(assert (=> d!114607 (= (apply!864 (+!2874 lt!426685 (tuple2!13565 lt!426691 (minValue!5580 thiss!1141))) lt!426674) (get!14492 (getValueByKey!493 (toList!6141 (+!2874 lt!426685 (tuple2!13565 lt!426691 (minValue!5580 thiss!1141)))) lt!426674)))))

(declare-fun bs!26615 () Bool)

(assert (= bs!26615 d!114607))

(declare-fun m!880315 () Bool)

(assert (=> bs!26615 m!880315))

(assert (=> bs!26615 m!880315))

(declare-fun m!880317 () Bool)

(assert (=> bs!26615 m!880317))

(assert (=> b!947931 d!114607))

(declare-fun d!114609 () Bool)

(assert (=> d!114609 (= (apply!864 lt!426694 lt!426687) (get!14492 (getValueByKey!493 (toList!6141 lt!426694) lt!426687)))))

(declare-fun bs!26616 () Bool)

(assert (= bs!26616 d!114609))

(declare-fun m!880319 () Bool)

(assert (=> bs!26616 m!880319))

(assert (=> bs!26616 m!880319))

(declare-fun m!880321 () Bool)

(assert (=> bs!26616 m!880321))

(assert (=> b!947931 d!114609))

(declare-fun d!114611 () Bool)

(assert (=> d!114611 (contains!5166 (+!2874 lt!426680 (tuple2!13565 lt!426675 (zeroValue!5580 thiss!1141))) lt!426683)))

(declare-fun lt!426753 () Unit!31823)

(declare-fun choose!1582 (ListLongMap!12251 (_ BitVec 64) V!32567 (_ BitVec 64)) Unit!31823)

(assert (=> d!114611 (= lt!426753 (choose!1582 lt!426680 lt!426675 (zeroValue!5580 thiss!1141) lt!426683))))

(assert (=> d!114611 (contains!5166 lt!426680 lt!426683)))

(assert (=> d!114611 (= (addStillContains!563 lt!426680 lt!426675 (zeroValue!5580 thiss!1141) lt!426683) lt!426753)))

(declare-fun bs!26617 () Bool)

(assert (= bs!26617 d!114611))

(assert (=> bs!26617 m!880191))

(assert (=> bs!26617 m!880191))

(assert (=> bs!26617 m!880195))

(declare-fun m!880323 () Bool)

(assert (=> bs!26617 m!880323))

(declare-fun m!880325 () Bool)

(assert (=> bs!26617 m!880325))

(assert (=> b!947931 d!114611))

(declare-fun d!114613 () Bool)

(declare-fun e!533667 () Bool)

(assert (=> d!114613 e!533667))

(declare-fun res!636119 () Bool)

(assert (=> d!114613 (=> res!636119 e!533667)))

(declare-fun lt!426757 () Bool)

(assert (=> d!114613 (= res!636119 (not lt!426757))))

(declare-fun lt!426756 () Bool)

(assert (=> d!114613 (= lt!426757 lt!426756)))

(declare-fun lt!426754 () Unit!31823)

(declare-fun e!533666 () Unit!31823)

(assert (=> d!114613 (= lt!426754 e!533666)))

(declare-fun c!98774 () Bool)

(assert (=> d!114613 (= c!98774 lt!426756)))

(assert (=> d!114613 (= lt!426756 (containsKey!457 (toList!6141 (+!2874 lt!426680 (tuple2!13565 lt!426675 (zeroValue!5580 thiss!1141)))) lt!426683))))

(assert (=> d!114613 (= (contains!5166 (+!2874 lt!426680 (tuple2!13565 lt!426675 (zeroValue!5580 thiss!1141))) lt!426683) lt!426757)))

(declare-fun b!948047 () Bool)

(declare-fun lt!426755 () Unit!31823)

(assert (=> b!948047 (= e!533666 lt!426755)))

(assert (=> b!948047 (= lt!426755 (lemmaContainsKeyImpliesGetValueByKeyDefined!352 (toList!6141 (+!2874 lt!426680 (tuple2!13565 lt!426675 (zeroValue!5580 thiss!1141)))) lt!426683))))

(assert (=> b!948047 (isDefined!365 (getValueByKey!493 (toList!6141 (+!2874 lt!426680 (tuple2!13565 lt!426675 (zeroValue!5580 thiss!1141)))) lt!426683))))

(declare-fun b!948048 () Bool)

(declare-fun Unit!31830 () Unit!31823)

(assert (=> b!948048 (= e!533666 Unit!31830)))

(declare-fun b!948049 () Bool)

(assert (=> b!948049 (= e!533667 (isDefined!365 (getValueByKey!493 (toList!6141 (+!2874 lt!426680 (tuple2!13565 lt!426675 (zeroValue!5580 thiss!1141)))) lt!426683)))))

(assert (= (and d!114613 c!98774) b!948047))

(assert (= (and d!114613 (not c!98774)) b!948048))

(assert (= (and d!114613 (not res!636119)) b!948049))

(declare-fun m!880327 () Bool)

(assert (=> d!114613 m!880327))

(declare-fun m!880329 () Bool)

(assert (=> b!948047 m!880329))

(declare-fun m!880331 () Bool)

(assert (=> b!948047 m!880331))

(assert (=> b!948047 m!880331))

(declare-fun m!880333 () Bool)

(assert (=> b!948047 m!880333))

(assert (=> b!948049 m!880331))

(assert (=> b!948049 m!880331))

(assert (=> b!948049 m!880333))

(assert (=> b!947931 d!114613))

(declare-fun d!114615 () Bool)

(declare-fun e!533668 () Bool)

(assert (=> d!114615 e!533668))

(declare-fun res!636120 () Bool)

(assert (=> d!114615 (=> (not res!636120) (not e!533668))))

(declare-fun lt!426758 () ListLongMap!12251)

(assert (=> d!114615 (= res!636120 (contains!5166 lt!426758 (_1!6793 (tuple2!13565 lt!426676 (zeroValue!5580 thiss!1141)))))))

(declare-fun lt!426759 () List!19317)

(assert (=> d!114615 (= lt!426758 (ListLongMap!12252 lt!426759))))

(declare-fun lt!426760 () Unit!31823)

(declare-fun lt!426761 () Unit!31823)

(assert (=> d!114615 (= lt!426760 lt!426761)))

(assert (=> d!114615 (= (getValueByKey!493 lt!426759 (_1!6793 (tuple2!13565 lt!426676 (zeroValue!5580 thiss!1141)))) (Some!498 (_2!6793 (tuple2!13565 lt!426676 (zeroValue!5580 thiss!1141)))))))

(assert (=> d!114615 (= lt!426761 (lemmaContainsTupThenGetReturnValue!263 lt!426759 (_1!6793 (tuple2!13565 lt!426676 (zeroValue!5580 thiss!1141))) (_2!6793 (tuple2!13565 lt!426676 (zeroValue!5580 thiss!1141)))))))

(assert (=> d!114615 (= lt!426759 (insertStrictlySorted!320 (toList!6141 lt!426694) (_1!6793 (tuple2!13565 lt!426676 (zeroValue!5580 thiss!1141))) (_2!6793 (tuple2!13565 lt!426676 (zeroValue!5580 thiss!1141)))))))

(assert (=> d!114615 (= (+!2874 lt!426694 (tuple2!13565 lt!426676 (zeroValue!5580 thiss!1141))) lt!426758)))

(declare-fun b!948050 () Bool)

(declare-fun res!636121 () Bool)

(assert (=> b!948050 (=> (not res!636121) (not e!533668))))

(assert (=> b!948050 (= res!636121 (= (getValueByKey!493 (toList!6141 lt!426758) (_1!6793 (tuple2!13565 lt!426676 (zeroValue!5580 thiss!1141)))) (Some!498 (_2!6793 (tuple2!13565 lt!426676 (zeroValue!5580 thiss!1141))))))))

(declare-fun b!948051 () Bool)

(assert (=> b!948051 (= e!533668 (contains!5169 (toList!6141 lt!426758) (tuple2!13565 lt!426676 (zeroValue!5580 thiss!1141))))))

(assert (= (and d!114615 res!636120) b!948050))

(assert (= (and b!948050 res!636121) b!948051))

(declare-fun m!880335 () Bool)

(assert (=> d!114615 m!880335))

(declare-fun m!880337 () Bool)

(assert (=> d!114615 m!880337))

(declare-fun m!880339 () Bool)

(assert (=> d!114615 m!880339))

(declare-fun m!880341 () Bool)

(assert (=> d!114615 m!880341))

(declare-fun m!880343 () Bool)

(assert (=> b!948050 m!880343))

(declare-fun m!880345 () Bool)

(assert (=> b!948051 m!880345))

(assert (=> b!947931 d!114615))

(declare-fun b!948076 () Bool)

(declare-fun e!533685 () Bool)

(assert (=> b!948076 (= e!533685 (validKeyInArray!0 (select (arr!27594 (_keys!10654 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!948076 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!948077 () Bool)

(declare-fun e!533683 () Bool)

(declare-fun lt!426781 () ListLongMap!12251)

(declare-fun isEmpty!710 (ListLongMap!12251) Bool)

(assert (=> b!948077 (= e!533683 (isEmpty!710 lt!426781))))

(declare-fun b!948078 () Bool)

(declare-fun e!533689 () ListLongMap!12251)

(declare-fun e!533687 () ListLongMap!12251)

(assert (=> b!948078 (= e!533689 e!533687)))

(declare-fun c!98786 () Bool)

(assert (=> b!948078 (= c!98786 (validKeyInArray!0 (select (arr!27594 (_keys!10654 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!948079 () Bool)

(declare-fun e!533686 () Bool)

(declare-fun e!533688 () Bool)

(assert (=> b!948079 (= e!533686 e!533688)))

(assert (=> b!948079 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28069 (_keys!10654 thiss!1141))))))

(declare-fun res!636132 () Bool)

(assert (=> b!948079 (= res!636132 (contains!5166 lt!426781 (select (arr!27594 (_keys!10654 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!948079 (=> (not res!636132) (not e!533688))))

(declare-fun b!948080 () Bool)

(assert (=> b!948080 (= e!533686 e!533683)))

(declare-fun c!98784 () Bool)

(assert (=> b!948080 (= c!98784 (bvslt #b00000000000000000000000000000000 (size!28069 (_keys!10654 thiss!1141))))))

(declare-fun bm!41164 () Bool)

(declare-fun call!41167 () ListLongMap!12251)

(assert (=> bm!41164 (= call!41167 (getCurrentListMapNoExtraKeys!3346 (_keys!10654 thiss!1141) (_values!5767 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5744 thiss!1141)))))

(declare-fun b!948082 () Bool)

(assert (=> b!948082 (= e!533687 call!41167)))

(declare-fun b!948083 () Bool)

(declare-fun res!636133 () Bool)

(declare-fun e!533684 () Bool)

(assert (=> b!948083 (=> (not res!636133) (not e!533684))))

(assert (=> b!948083 (= res!636133 (not (contains!5166 lt!426781 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!948084 () Bool)

(declare-fun lt!426782 () Unit!31823)

(declare-fun lt!426777 () Unit!31823)

(assert (=> b!948084 (= lt!426782 lt!426777)))

(declare-fun lt!426778 () ListLongMap!12251)

(declare-fun lt!426780 () V!32567)

(declare-fun lt!426776 () (_ BitVec 64))

(declare-fun lt!426779 () (_ BitVec 64))

(assert (=> b!948084 (not (contains!5166 (+!2874 lt!426778 (tuple2!13565 lt!426779 lt!426780)) lt!426776))))

(declare-fun addStillNotContains!224 (ListLongMap!12251 (_ BitVec 64) V!32567 (_ BitVec 64)) Unit!31823)

(assert (=> b!948084 (= lt!426777 (addStillNotContains!224 lt!426778 lt!426779 lt!426780 lt!426776))))

(assert (=> b!948084 (= lt!426776 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!948084 (= lt!426780 (get!14491 (select (arr!27593 (_values!5767 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1630 (defaultEntry!5744 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!948084 (= lt!426779 (select (arr!27594 (_keys!10654 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!948084 (= lt!426778 call!41167)))

(assert (=> b!948084 (= e!533687 (+!2874 call!41167 (tuple2!13565 (select (arr!27594 (_keys!10654 thiss!1141)) #b00000000000000000000000000000000) (get!14491 (select (arr!27593 (_values!5767 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1630 (defaultEntry!5744 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!948085 () Bool)

(assert (=> b!948085 (= e!533684 e!533686)))

(declare-fun c!98785 () Bool)

(assert (=> b!948085 (= c!98785 e!533685)))

(declare-fun res!636131 () Bool)

(assert (=> b!948085 (=> (not res!636131) (not e!533685))))

(assert (=> b!948085 (= res!636131 (bvslt #b00000000000000000000000000000000 (size!28069 (_keys!10654 thiss!1141))))))

(declare-fun b!948081 () Bool)

(assert (=> b!948081 (= e!533689 (ListLongMap!12252 Nil!19314))))

(declare-fun d!114617 () Bool)

(assert (=> d!114617 e!533684))

(declare-fun res!636130 () Bool)

(assert (=> d!114617 (=> (not res!636130) (not e!533684))))

(assert (=> d!114617 (= res!636130 (not (contains!5166 lt!426781 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!114617 (= lt!426781 e!533689)))

(declare-fun c!98783 () Bool)

(assert (=> d!114617 (= c!98783 (bvsge #b00000000000000000000000000000000 (size!28069 (_keys!10654 thiss!1141))))))

(assert (=> d!114617 (validMask!0 (mask!27489 thiss!1141))))

(assert (=> d!114617 (= (getCurrentListMapNoExtraKeys!3346 (_keys!10654 thiss!1141) (_values!5767 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141)) lt!426781)))

(declare-fun b!948086 () Bool)

(assert (=> b!948086 (= e!533683 (= lt!426781 (getCurrentListMapNoExtraKeys!3346 (_keys!10654 thiss!1141) (_values!5767 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5744 thiss!1141))))))

(declare-fun b!948087 () Bool)

(assert (=> b!948087 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28069 (_keys!10654 thiss!1141))))))

(assert (=> b!948087 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28068 (_values!5767 thiss!1141))))))

(assert (=> b!948087 (= e!533688 (= (apply!864 lt!426781 (select (arr!27594 (_keys!10654 thiss!1141)) #b00000000000000000000000000000000)) (get!14491 (select (arr!27593 (_values!5767 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1630 (defaultEntry!5744 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!114617 c!98783) b!948081))

(assert (= (and d!114617 (not c!98783)) b!948078))

(assert (= (and b!948078 c!98786) b!948084))

(assert (= (and b!948078 (not c!98786)) b!948082))

(assert (= (or b!948084 b!948082) bm!41164))

(assert (= (and d!114617 res!636130) b!948083))

(assert (= (and b!948083 res!636133) b!948085))

(assert (= (and b!948085 res!636131) b!948076))

(assert (= (and b!948085 c!98785) b!948079))

(assert (= (and b!948085 (not c!98785)) b!948080))

(assert (= (and b!948079 res!636132) b!948087))

(assert (= (and b!948080 c!98784) b!948086))

(assert (= (and b!948080 (not c!98784)) b!948077))

(declare-fun b_lambda!14293 () Bool)

(assert (=> (not b_lambda!14293) (not b!948084)))

(assert (=> b!948084 t!27636))

(declare-fun b_and!29601 () Bool)

(assert (= b_and!29599 (and (=> t!27636 result!12245) b_and!29601)))

(declare-fun b_lambda!14295 () Bool)

(assert (=> (not b_lambda!14295) (not b!948087)))

(assert (=> b!948087 t!27636))

(declare-fun b_and!29603 () Bool)

(assert (= b_and!29601 (and (=> t!27636 result!12245) b_and!29603)))

(assert (=> b!948076 m!880151))

(assert (=> b!948076 m!880151))

(assert (=> b!948076 m!880165))

(declare-fun m!880347 () Bool)

(assert (=> b!948083 m!880347))

(declare-fun m!880349 () Bool)

(assert (=> b!948086 m!880349))

(declare-fun m!880351 () Bool)

(assert (=> b!948084 m!880351))

(declare-fun m!880353 () Bool)

(assert (=> b!948084 m!880353))

(assert (=> b!948084 m!880155))

(assert (=> b!948084 m!880157))

(assert (=> b!948084 m!880351))

(declare-fun m!880355 () Bool)

(assert (=> b!948084 m!880355))

(assert (=> b!948084 m!880155))

(assert (=> b!948084 m!880157))

(assert (=> b!948084 m!880159))

(declare-fun m!880357 () Bool)

(assert (=> b!948084 m!880357))

(assert (=> b!948084 m!880151))

(assert (=> b!948079 m!880151))

(assert (=> b!948079 m!880151))

(declare-fun m!880359 () Bool)

(assert (=> b!948079 m!880359))

(assert (=> b!948078 m!880151))

(assert (=> b!948078 m!880151))

(assert (=> b!948078 m!880165))

(assert (=> bm!41164 m!880349))

(assert (=> b!948087 m!880151))

(declare-fun m!880361 () Bool)

(assert (=> b!948087 m!880361))

(assert (=> b!948087 m!880151))

(assert (=> b!948087 m!880155))

(assert (=> b!948087 m!880157))

(assert (=> b!948087 m!880155))

(assert (=> b!948087 m!880157))

(assert (=> b!948087 m!880159))

(declare-fun m!880363 () Bool)

(assert (=> d!114617 m!880363))

(assert (=> d!114617 m!880073))

(declare-fun m!880365 () Bool)

(assert (=> b!948077 m!880365))

(assert (=> b!947931 d!114617))

(declare-fun d!114619 () Bool)

(assert (=> d!114619 (= (apply!864 (+!2874 lt!426684 (tuple2!13565 lt!426686 (minValue!5580 thiss!1141))) lt!426690) (get!14492 (getValueByKey!493 (toList!6141 (+!2874 lt!426684 (tuple2!13565 lt!426686 (minValue!5580 thiss!1141)))) lt!426690)))))

(declare-fun bs!26618 () Bool)

(assert (= bs!26618 d!114619))

(declare-fun m!880367 () Bool)

(assert (=> bs!26618 m!880367))

(assert (=> bs!26618 m!880367))

(declare-fun m!880369 () Bool)

(assert (=> bs!26618 m!880369))

(assert (=> b!947931 d!114619))

(declare-fun d!114621 () Bool)

(declare-fun e!533690 () Bool)

(assert (=> d!114621 e!533690))

(declare-fun res!636134 () Bool)

(assert (=> d!114621 (=> (not res!636134) (not e!533690))))

(declare-fun lt!426783 () ListLongMap!12251)

(assert (=> d!114621 (= res!636134 (contains!5166 lt!426783 (_1!6793 (tuple2!13565 lt!426686 (minValue!5580 thiss!1141)))))))

(declare-fun lt!426784 () List!19317)

(assert (=> d!114621 (= lt!426783 (ListLongMap!12252 lt!426784))))

(declare-fun lt!426785 () Unit!31823)

(declare-fun lt!426786 () Unit!31823)

(assert (=> d!114621 (= lt!426785 lt!426786)))

(assert (=> d!114621 (= (getValueByKey!493 lt!426784 (_1!6793 (tuple2!13565 lt!426686 (minValue!5580 thiss!1141)))) (Some!498 (_2!6793 (tuple2!13565 lt!426686 (minValue!5580 thiss!1141)))))))

(assert (=> d!114621 (= lt!426786 (lemmaContainsTupThenGetReturnValue!263 lt!426784 (_1!6793 (tuple2!13565 lt!426686 (minValue!5580 thiss!1141))) (_2!6793 (tuple2!13565 lt!426686 (minValue!5580 thiss!1141)))))))

(assert (=> d!114621 (= lt!426784 (insertStrictlySorted!320 (toList!6141 lt!426684) (_1!6793 (tuple2!13565 lt!426686 (minValue!5580 thiss!1141))) (_2!6793 (tuple2!13565 lt!426686 (minValue!5580 thiss!1141)))))))

(assert (=> d!114621 (= (+!2874 lt!426684 (tuple2!13565 lt!426686 (minValue!5580 thiss!1141))) lt!426783)))

(declare-fun b!948088 () Bool)

(declare-fun res!636135 () Bool)

(assert (=> b!948088 (=> (not res!636135) (not e!533690))))

(assert (=> b!948088 (= res!636135 (= (getValueByKey!493 (toList!6141 lt!426783) (_1!6793 (tuple2!13565 lt!426686 (minValue!5580 thiss!1141)))) (Some!498 (_2!6793 (tuple2!13565 lt!426686 (minValue!5580 thiss!1141))))))))

(declare-fun b!948089 () Bool)

(assert (=> b!948089 (= e!533690 (contains!5169 (toList!6141 lt!426783) (tuple2!13565 lt!426686 (minValue!5580 thiss!1141))))))

(assert (= (and d!114621 res!636134) b!948088))

(assert (= (and b!948088 res!636135) b!948089))

(declare-fun m!880371 () Bool)

(assert (=> d!114621 m!880371))

(declare-fun m!880373 () Bool)

(assert (=> d!114621 m!880373))

(declare-fun m!880375 () Bool)

(assert (=> d!114621 m!880375))

(declare-fun m!880377 () Bool)

(assert (=> d!114621 m!880377))

(declare-fun m!880379 () Bool)

(assert (=> b!948088 m!880379))

(declare-fun m!880381 () Bool)

(assert (=> b!948089 m!880381))

(assert (=> b!947931 d!114621))

(declare-fun d!114623 () Bool)

(assert (=> d!114623 (= (apply!864 lt!426695 #b1000000000000000000000000000000000000000000000000000000000000000) (get!14492 (getValueByKey!493 (toList!6141 lt!426695) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26619 () Bool)

(assert (= bs!26619 d!114623))

(assert (=> bs!26619 m!880229))

(assert (=> bs!26619 m!880229))

(declare-fun m!880383 () Bool)

(assert (=> bs!26619 m!880383))

(assert (=> b!947923 d!114623))

(declare-fun d!114625 () Bool)

(assert (=> d!114625 (= (apply!864 lt!426695 #b0000000000000000000000000000000000000000000000000000000000000000) (get!14492 (getValueByKey!493 (toList!6141 lt!426695) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26620 () Bool)

(assert (= bs!26620 d!114625))

(assert (=> bs!26620 m!880245))

(assert (=> bs!26620 m!880245))

(declare-fun m!880385 () Bool)

(assert (=> bs!26620 m!880385))

(assert (=> b!947916 d!114625))

(declare-fun d!114627 () Bool)

(declare-fun e!533691 () Bool)

(assert (=> d!114627 e!533691))

(declare-fun res!636136 () Bool)

(assert (=> d!114627 (=> (not res!636136) (not e!533691))))

(declare-fun lt!426787 () ListLongMap!12251)

(assert (=> d!114627 (= res!636136 (contains!5166 lt!426787 (_1!6793 (ite (or c!98739 c!98738) (tuple2!13565 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5580 thiss!1141)) (tuple2!13565 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141))))))))

(declare-fun lt!426788 () List!19317)

(assert (=> d!114627 (= lt!426787 (ListLongMap!12252 lt!426788))))

(declare-fun lt!426789 () Unit!31823)

(declare-fun lt!426790 () Unit!31823)

(assert (=> d!114627 (= lt!426789 lt!426790)))

(assert (=> d!114627 (= (getValueByKey!493 lt!426788 (_1!6793 (ite (or c!98739 c!98738) (tuple2!13565 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5580 thiss!1141)) (tuple2!13565 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141))))) (Some!498 (_2!6793 (ite (or c!98739 c!98738) (tuple2!13565 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5580 thiss!1141)) (tuple2!13565 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141))))))))

(assert (=> d!114627 (= lt!426790 (lemmaContainsTupThenGetReturnValue!263 lt!426788 (_1!6793 (ite (or c!98739 c!98738) (tuple2!13565 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5580 thiss!1141)) (tuple2!13565 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141)))) (_2!6793 (ite (or c!98739 c!98738) (tuple2!13565 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5580 thiss!1141)) (tuple2!13565 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141))))))))

(assert (=> d!114627 (= lt!426788 (insertStrictlySorted!320 (toList!6141 (ite c!98739 call!41159 (ite c!98738 call!41160 call!41158))) (_1!6793 (ite (or c!98739 c!98738) (tuple2!13565 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5580 thiss!1141)) (tuple2!13565 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141)))) (_2!6793 (ite (or c!98739 c!98738) (tuple2!13565 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5580 thiss!1141)) (tuple2!13565 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141))))))))

(assert (=> d!114627 (= (+!2874 (ite c!98739 call!41159 (ite c!98738 call!41160 call!41158)) (ite (or c!98739 c!98738) (tuple2!13565 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5580 thiss!1141)) (tuple2!13565 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141)))) lt!426787)))

(declare-fun b!948090 () Bool)

(declare-fun res!636137 () Bool)

(assert (=> b!948090 (=> (not res!636137) (not e!533691))))

(assert (=> b!948090 (= res!636137 (= (getValueByKey!493 (toList!6141 lt!426787) (_1!6793 (ite (or c!98739 c!98738) (tuple2!13565 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5580 thiss!1141)) (tuple2!13565 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141))))) (Some!498 (_2!6793 (ite (or c!98739 c!98738) (tuple2!13565 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5580 thiss!1141)) (tuple2!13565 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141)))))))))

(declare-fun b!948091 () Bool)

(assert (=> b!948091 (= e!533691 (contains!5169 (toList!6141 lt!426787) (ite (or c!98739 c!98738) (tuple2!13565 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5580 thiss!1141)) (tuple2!13565 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141)))))))

(assert (= (and d!114627 res!636136) b!948090))

(assert (= (and b!948090 res!636137) b!948091))

(declare-fun m!880387 () Bool)

(assert (=> d!114627 m!880387))

(declare-fun m!880389 () Bool)

(assert (=> d!114627 m!880389))

(declare-fun m!880391 () Bool)

(assert (=> d!114627 m!880391))

(declare-fun m!880393 () Bool)

(assert (=> d!114627 m!880393))

(declare-fun m!880395 () Bool)

(assert (=> b!948090 m!880395))

(declare-fun m!880397 () Bool)

(assert (=> b!948091 m!880397))

(assert (=> bm!41158 d!114627))

(declare-fun d!114629 () Bool)

(assert (=> d!114629 (= (apply!864 lt!426695 (select (arr!27594 (_keys!10654 thiss!1141)) #b00000000000000000000000000000000)) (get!14492 (getValueByKey!493 (toList!6141 lt!426695) (select (arr!27594 (_keys!10654 thiss!1141)) #b00000000000000000000000000000000))))))

(declare-fun bs!26621 () Bool)

(assert (= bs!26621 d!114629))

(assert (=> bs!26621 m!880151))

(assert (=> bs!26621 m!880263))

(assert (=> bs!26621 m!880263))

(declare-fun m!880399 () Bool)

(assert (=> bs!26621 m!880399))

(assert (=> b!947924 d!114629))

(declare-fun d!114631 () Bool)

(declare-fun c!98789 () Bool)

(assert (=> d!114631 (= c!98789 ((_ is ValueCellFull!9869) (select (arr!27593 (_values!5767 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun e!533694 () V!32567)

(assert (=> d!114631 (= (get!14491 (select (arr!27593 (_values!5767 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1630 (defaultEntry!5744 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)) e!533694)))

(declare-fun b!948096 () Bool)

(declare-fun get!14493 (ValueCell!9869 V!32567) V!32567)

(assert (=> b!948096 (= e!533694 (get!14493 (select (arr!27593 (_values!5767 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1630 (defaultEntry!5744 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!948097 () Bool)

(declare-fun get!14494 (ValueCell!9869 V!32567) V!32567)

(assert (=> b!948097 (= e!533694 (get!14494 (select (arr!27593 (_values!5767 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1630 (defaultEntry!5744 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!114631 c!98789) b!948096))

(assert (= (and d!114631 (not c!98789)) b!948097))

(assert (=> b!948096 m!880155))

(assert (=> b!948096 m!880157))

(declare-fun m!880401 () Bool)

(assert (=> b!948096 m!880401))

(assert (=> b!948097 m!880155))

(assert (=> b!948097 m!880157))

(declare-fun m!880403 () Bool)

(assert (=> b!948097 m!880403))

(assert (=> b!947924 d!114631))

(declare-fun b!948109 () Bool)

(declare-fun e!533697 () Bool)

(assert (=> b!948109 (= e!533697 (and (bvsge (extraKeys!5476 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5476 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2499 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun b!948106 () Bool)

(declare-fun res!636147 () Bool)

(assert (=> b!948106 (=> (not res!636147) (not e!533697))))

(assert (=> b!948106 (= res!636147 (and (= (size!28068 (_values!5767 thiss!1141)) (bvadd (mask!27489 thiss!1141) #b00000000000000000000000000000001)) (= (size!28069 (_keys!10654 thiss!1141)) (size!28068 (_values!5767 thiss!1141))) (bvsge (_size!2499 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2499 thiss!1141) (bvadd (mask!27489 thiss!1141) #b00000000000000000000000000000001))))))

(declare-fun b!948107 () Bool)

(declare-fun res!636148 () Bool)

(assert (=> b!948107 (=> (not res!636148) (not e!533697))))

(declare-fun size!28074 (LongMapFixedSize!4888) (_ BitVec 32))

(assert (=> b!948107 (= res!636148 (bvsge (size!28074 thiss!1141) (_size!2499 thiss!1141)))))

(declare-fun d!114633 () Bool)

(declare-fun res!636146 () Bool)

(assert (=> d!114633 (=> (not res!636146) (not e!533697))))

(assert (=> d!114633 (= res!636146 (validMask!0 (mask!27489 thiss!1141)))))

(assert (=> d!114633 (= (simpleValid!367 thiss!1141) e!533697)))

(declare-fun b!948108 () Bool)

(declare-fun res!636149 () Bool)

(assert (=> b!948108 (=> (not res!636149) (not e!533697))))

(assert (=> b!948108 (= res!636149 (= (size!28074 thiss!1141) (bvadd (_size!2499 thiss!1141) (bvsdiv (bvadd (extraKeys!5476 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!114633 res!636146) b!948106))

(assert (= (and b!948106 res!636147) b!948107))

(assert (= (and b!948107 res!636148) b!948108))

(assert (= (and b!948108 res!636149) b!948109))

(declare-fun m!880405 () Bool)

(assert (=> b!948107 m!880405))

(assert (=> d!114633 m!880073))

(assert (=> b!948108 m!880405))

(assert (=> d!114553 d!114633))

(assert (=> bm!41156 d!114617))

(declare-fun d!114635 () Bool)

(assert (=> d!114635 (isDefined!365 (getValueByKey!493 (toList!6141 (getCurrentListMap!3303 (_keys!10654 thiss!1141) (_values!5767 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141))) key!756))))

(declare-fun lt!426793 () Unit!31823)

(declare-fun choose!1583 (List!19317 (_ BitVec 64)) Unit!31823)

(assert (=> d!114635 (= lt!426793 (choose!1583 (toList!6141 (getCurrentListMap!3303 (_keys!10654 thiss!1141) (_values!5767 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141))) key!756))))

(declare-fun e!533700 () Bool)

(assert (=> d!114635 e!533700))

(declare-fun res!636152 () Bool)

(assert (=> d!114635 (=> (not res!636152) (not e!533700))))

(declare-fun isStrictlySorted!504 (List!19317) Bool)

(assert (=> d!114635 (= res!636152 (isStrictlySorted!504 (toList!6141 (getCurrentListMap!3303 (_keys!10654 thiss!1141) (_values!5767 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141)))))))

(assert (=> d!114635 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!352 (toList!6141 (getCurrentListMap!3303 (_keys!10654 thiss!1141) (_values!5767 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141))) key!756) lt!426793)))

(declare-fun b!948112 () Bool)

(assert (=> b!948112 (= e!533700 (containsKey!457 (toList!6141 (getCurrentListMap!3303 (_keys!10654 thiss!1141) (_values!5767 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141))) key!756))))

(assert (= (and d!114635 res!636152) b!948112))

(assert (=> d!114635 m!880141))

(assert (=> d!114635 m!880141))

(assert (=> d!114635 m!880143))

(declare-fun m!880407 () Bool)

(assert (=> d!114635 m!880407))

(declare-fun m!880409 () Bool)

(assert (=> d!114635 m!880409))

(assert (=> b!948112 m!880137))

(assert (=> b!947867 d!114635))

(assert (=> b!947867 d!114569))

(assert (=> b!947867 d!114571))

(declare-fun d!114637 () Bool)

(declare-fun lt!426796 () (_ BitVec 32))

(assert (=> d!114637 (and (bvsge lt!426796 #b00000000000000000000000000000000) (bvsle lt!426796 (bvsub (size!28069 (_keys!10654 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun e!533705 () (_ BitVec 32))

(assert (=> d!114637 (= lt!426796 e!533705)))

(declare-fun c!98794 () Bool)

(assert (=> d!114637 (= c!98794 (bvsge #b00000000000000000000000000000000 (size!28069 (_keys!10654 thiss!1141))))))

(assert (=> d!114637 (and (bvsle #b00000000000000000000000000000000 (size!28069 (_keys!10654 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!28069 (_keys!10654 thiss!1141)) (size!28069 (_keys!10654 thiss!1141))))))

(assert (=> d!114637 (= (arrayCountValidKeys!0 (_keys!10654 thiss!1141) #b00000000000000000000000000000000 (size!28069 (_keys!10654 thiss!1141))) lt!426796)))

(declare-fun bm!41167 () Bool)

(declare-fun call!41170 () (_ BitVec 32))

(assert (=> bm!41167 (= call!41170 (arrayCountValidKeys!0 (_keys!10654 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28069 (_keys!10654 thiss!1141))))))

(declare-fun b!948121 () Bool)

(assert (=> b!948121 (= e!533705 #b00000000000000000000000000000000)))

(declare-fun b!948122 () Bool)

(declare-fun e!533706 () (_ BitVec 32))

(assert (=> b!948122 (= e!533706 (bvadd #b00000000000000000000000000000001 call!41170))))

(declare-fun b!948123 () Bool)

(assert (=> b!948123 (= e!533706 call!41170)))

(declare-fun b!948124 () Bool)

(assert (=> b!948124 (= e!533705 e!533706)))

(declare-fun c!98795 () Bool)

(assert (=> b!948124 (= c!98795 (validKeyInArray!0 (select (arr!27594 (_keys!10654 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!114637 c!98794) b!948121))

(assert (= (and d!114637 (not c!98794)) b!948124))

(assert (= (and b!948124 c!98795) b!948122))

(assert (= (and b!948124 (not c!98795)) b!948123))

(assert (= (or b!948122 b!948123) bm!41167))

(declare-fun m!880411 () Bool)

(assert (=> bm!41167 m!880411))

(assert (=> b!948124 m!880151))

(assert (=> b!948124 m!880151))

(assert (=> b!948124 m!880165))

(assert (=> b!947840 d!114637))

(declare-fun b!948133 () Bool)

(declare-fun e!533714 () Bool)

(declare-fun e!533715 () Bool)

(assert (=> b!948133 (= e!533714 e!533715)))

(declare-fun lt!426803 () (_ BitVec 64))

(assert (=> b!948133 (= lt!426803 (select (arr!27594 (_keys!10654 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426804 () Unit!31823)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57373 (_ BitVec 64) (_ BitVec 32)) Unit!31823)

(assert (=> b!948133 (= lt!426804 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10654 thiss!1141) lt!426803 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57373 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!948133 (arrayContainsKey!0 (_keys!10654 thiss!1141) lt!426803 #b00000000000000000000000000000000)))

(declare-fun lt!426805 () Unit!31823)

(assert (=> b!948133 (= lt!426805 lt!426804)))

(declare-fun res!636157 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57373 (_ BitVec 32)) SeekEntryResult!9123)

(assert (=> b!948133 (= res!636157 (= (seekEntryOrOpen!0 (select (arr!27594 (_keys!10654 thiss!1141)) #b00000000000000000000000000000000) (_keys!10654 thiss!1141) (mask!27489 thiss!1141)) (Found!9123 #b00000000000000000000000000000000)))))

(assert (=> b!948133 (=> (not res!636157) (not e!533715))))

(declare-fun b!948134 () Bool)

(declare-fun call!41173 () Bool)

(assert (=> b!948134 (= e!533714 call!41173)))

(declare-fun b!948135 () Bool)

(assert (=> b!948135 (= e!533715 call!41173)))

(declare-fun bm!41170 () Bool)

(assert (=> bm!41170 (= call!41173 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10654 thiss!1141) (mask!27489 thiss!1141)))))

(declare-fun d!114639 () Bool)

(declare-fun res!636158 () Bool)

(declare-fun e!533713 () Bool)

(assert (=> d!114639 (=> res!636158 e!533713)))

(assert (=> d!114639 (= res!636158 (bvsge #b00000000000000000000000000000000 (size!28069 (_keys!10654 thiss!1141))))))

(assert (=> d!114639 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10654 thiss!1141) (mask!27489 thiss!1141)) e!533713)))

(declare-fun b!948136 () Bool)

(assert (=> b!948136 (= e!533713 e!533714)))

(declare-fun c!98798 () Bool)

(assert (=> b!948136 (= c!98798 (validKeyInArray!0 (select (arr!27594 (_keys!10654 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!114639 (not res!636158)) b!948136))

(assert (= (and b!948136 c!98798) b!948133))

(assert (= (and b!948136 (not c!98798)) b!948134))

(assert (= (and b!948133 res!636157) b!948135))

(assert (= (or b!948135 b!948134) bm!41170))

(assert (=> b!948133 m!880151))

(declare-fun m!880413 () Bool)

(assert (=> b!948133 m!880413))

(declare-fun m!880415 () Bool)

(assert (=> b!948133 m!880415))

(assert (=> b!948133 m!880151))

(declare-fun m!880417 () Bool)

(assert (=> b!948133 m!880417))

(declare-fun m!880419 () Bool)

(assert (=> bm!41170 m!880419))

(assert (=> b!948136 m!880151))

(assert (=> b!948136 m!880151))

(assert (=> b!948136 m!880165))

(assert (=> b!947841 d!114639))

(declare-fun condMapEmpty!32948 () Bool)

(declare-fun mapDefault!32948 () ValueCell!9869)

(assert (=> mapNonEmpty!32947 (= condMapEmpty!32948 (= mapRest!32947 ((as const (Array (_ BitVec 32) ValueCell!9869)) mapDefault!32948)))))

(declare-fun e!533716 () Bool)

(declare-fun mapRes!32948 () Bool)

(assert (=> mapNonEmpty!32947 (= tp!63166 (and e!533716 mapRes!32948))))

(declare-fun mapIsEmpty!32948 () Bool)

(assert (=> mapIsEmpty!32948 mapRes!32948))

(declare-fun mapNonEmpty!32948 () Bool)

(declare-fun tp!63167 () Bool)

(declare-fun e!533717 () Bool)

(assert (=> mapNonEmpty!32948 (= mapRes!32948 (and tp!63167 e!533717))))

(declare-fun mapValue!32948 () ValueCell!9869)

(declare-fun mapRest!32948 () (Array (_ BitVec 32) ValueCell!9869))

(declare-fun mapKey!32948 () (_ BitVec 32))

(assert (=> mapNonEmpty!32948 (= mapRest!32947 (store mapRest!32948 mapKey!32948 mapValue!32948))))

(declare-fun b!948137 () Bool)

(assert (=> b!948137 (= e!533717 tp_is_empty!20701)))

(declare-fun b!948138 () Bool)

(assert (=> b!948138 (= e!533716 tp_is_empty!20701)))

(assert (= (and mapNonEmpty!32947 condMapEmpty!32948) mapIsEmpty!32948))

(assert (= (and mapNonEmpty!32947 (not condMapEmpty!32948)) mapNonEmpty!32948))

(assert (= (and mapNonEmpty!32948 ((_ is ValueCellFull!9869) mapValue!32948)) b!948137))

(assert (= (and mapNonEmpty!32947 ((_ is ValueCellFull!9869) mapDefault!32948)) b!948138))

(declare-fun m!880421 () Bool)

(assert (=> mapNonEmpty!32948 m!880421))

(declare-fun b_lambda!14297 () Bool)

(assert (= b_lambda!14295 (or (and b!947774 b_free!18193) b_lambda!14297)))

(declare-fun b_lambda!14299 () Bool)

(assert (= b_lambda!14293 (or (and b!947774 b_free!18193) b_lambda!14299)))

(check-sat (not b_lambda!14299) (not d!114619) (not d!114629) (not bm!41170) (not b!948084) (not d!114599) (not d!114575) (not d!114609) (not b!948076) (not b!947978) (not d!114615) (not b!948045) (not b!948124) (not d!114611) (not d!114585) (not b!948107) (not b!947966) (not b!947974) (not b!948108) (not b!948087) (not b!948136) (not d!114569) (not d!114607) (not b!948040) (not d!114577) (not d!114627) (not d!114633) (not b!948032) (not b!948047) b_and!29603 (not d!114603) (not b!948049) (not d!114589) (not d!114595) (not bm!41164) (not d!114583) (not b!948022) (not b!948035) (not b_lambda!14291) (not b!948086) (not d!114605) (not b!947953) (not b!948033) (not b!948050) (not d!114625) (not d!114623) (not b_lambda!14297) (not b!948077) (not b!948088) (not b!948096) (not b!948133) (not mapNonEmpty!32948) (not b!948090) (not b!947976) (not d!114591) (not d!114635) (not d!114597) (not b!948003) (not d!114621) (not b!948112) (not bm!41167) (not b_next!18193) (not b!948078) (not b!947967) tp_is_empty!20701 (not b!948041) (not d!114601) (not d!114579) (not b!948083) (not b!948044) (not b!948097) (not d!114617) (not b!948089) (not b!948051) (not bm!41161) (not b!947968) (not b!947975) (not d!114593) (not b!948091) (not b!948006) (not b!948079) (not d!114613) (not b!948008))
(check-sat b_and!29603 (not b_next!18193))
