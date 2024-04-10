; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76220 () Bool)

(assert start!76220)

(declare-fun b!894997 () Bool)

(declare-fun b_free!15891 () Bool)

(declare-fun b_next!15891 () Bool)

(assert (=> b!894997 (= b_free!15891 (not b_next!15891))))

(declare-fun tp!55671 () Bool)

(declare-fun b_and!26183 () Bool)

(assert (=> b!894997 (= tp!55671 b_and!26183)))

(declare-fun b!894996 () Bool)

(declare-fun e!499990 () Bool)

(declare-fun tp_is_empty!18219 () Bool)

(assert (=> b!894996 (= e!499990 tp_is_empty!18219)))

(declare-fun e!499993 () Bool)

(declare-datatypes ((array!52434 0))(
  ( (array!52435 (arr!25215 (Array (_ BitVec 32) (_ BitVec 64))) (size!25663 (_ BitVec 32))) )
))
(declare-datatypes ((V!29257 0))(
  ( (V!29258 (val!9160 Int)) )
))
(declare-datatypes ((ValueCell!8628 0))(
  ( (ValueCellFull!8628 (v!11650 V!29257)) (EmptyCell!8628) )
))
(declare-datatypes ((array!52436 0))(
  ( (array!52437 (arr!25216 (Array (_ BitVec 32) ValueCell!8628)) (size!25664 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4272 0))(
  ( (LongMapFixedSize!4273 (defaultEntry!5348 Int) (mask!25927 (_ BitVec 32)) (extraKeys!5044 (_ BitVec 32)) (zeroValue!5148 V!29257) (minValue!5148 V!29257) (_size!2191 (_ BitVec 32)) (_keys!10054 array!52434) (_values!5335 array!52436) (_vacant!2191 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4272)

(declare-fun e!499994 () Bool)

(declare-fun array_inv!19798 (array!52434) Bool)

(declare-fun array_inv!19799 (array!52436) Bool)

(assert (=> b!894997 (= e!499994 (and tp!55671 tp_is_empty!18219 (array_inv!19798 (_keys!10054 thiss!1181)) (array_inv!19799 (_values!5335 thiss!1181)) e!499993))))

(declare-fun res!605545 () Bool)

(declare-fun e!499996 () Bool)

(assert (=> start!76220 (=> (not res!605545) (not e!499996))))

(declare-fun valid!1648 (LongMapFixedSize!4272) Bool)

(assert (=> start!76220 (= res!605545 (valid!1648 thiss!1181))))

(assert (=> start!76220 e!499996))

(assert (=> start!76220 e!499994))

(assert (=> start!76220 true))

(declare-fun b!894998 () Bool)

(declare-fun res!605547 () Bool)

(assert (=> b!894998 (=> (not res!605547) (not e!499996))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!894998 (= res!605547 (not (= key!785 (bvneg key!785))))))

(declare-fun b!894999 () Bool)

(declare-fun e!499992 () Bool)

(assert (=> b!894999 (= e!499992 tp_is_empty!18219)))

(declare-fun mapNonEmpty!28913 () Bool)

(declare-fun mapRes!28913 () Bool)

(declare-fun tp!55672 () Bool)

(assert (=> mapNonEmpty!28913 (= mapRes!28913 (and tp!55672 e!499990))))

(declare-fun mapValue!28913 () ValueCell!8628)

(declare-fun mapRest!28913 () (Array (_ BitVec 32) ValueCell!8628))

(declare-fun mapKey!28913 () (_ BitVec 32))

(assert (=> mapNonEmpty!28913 (= (arr!25216 (_values!5335 thiss!1181)) (store mapRest!28913 mapKey!28913 mapValue!28913))))

(declare-fun b!895000 () Bool)

(declare-fun e!499995 () Bool)

(assert (=> b!895000 (= e!499996 e!499995)))

(declare-fun res!605546 () Bool)

(assert (=> b!895000 (=> (not res!605546) (not e!499995))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!895000 (= res!605546 (validMask!0 (mask!25927 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8873 0))(
  ( (MissingZero!8873 (index!37863 (_ BitVec 32))) (Found!8873 (index!37864 (_ BitVec 32))) (Intermediate!8873 (undefined!9685 Bool) (index!37865 (_ BitVec 32)) (x!76119 (_ BitVec 32))) (Undefined!8873) (MissingVacant!8873 (index!37866 (_ BitVec 32))) )
))
(declare-fun lt!404413 () SeekEntryResult!8873)

(declare-fun seekEntry!0 ((_ BitVec 64) array!52434 (_ BitVec 32)) SeekEntryResult!8873)

(assert (=> b!895000 (= lt!404413 (seekEntry!0 key!785 (_keys!10054 thiss!1181) (mask!25927 thiss!1181)))))

(declare-fun b!895001 () Bool)

(assert (=> b!895001 (= e!499993 (and e!499992 mapRes!28913))))

(declare-fun condMapEmpty!28913 () Bool)

(declare-fun mapDefault!28913 () ValueCell!8628)

(assert (=> b!895001 (= condMapEmpty!28913 (= (arr!25216 (_values!5335 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8628)) mapDefault!28913)))))

(declare-fun b!895002 () Bool)

(assert (=> b!895002 (= e!499995 (and (= (size!25664 (_values!5335 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25927 thiss!1181))) (= (size!25663 (_keys!10054 thiss!1181)) (size!25664 (_values!5335 thiss!1181))) (bvslt (mask!25927 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!28913 () Bool)

(assert (=> mapIsEmpty!28913 mapRes!28913))

(assert (= (and start!76220 res!605545) b!894998))

(assert (= (and b!894998 res!605547) b!895000))

(assert (= (and b!895000 res!605546) b!895002))

(assert (= (and b!895001 condMapEmpty!28913) mapIsEmpty!28913))

(assert (= (and b!895001 (not condMapEmpty!28913)) mapNonEmpty!28913))

(get-info :version)

(assert (= (and mapNonEmpty!28913 ((_ is ValueCellFull!8628) mapValue!28913)) b!894996))

(assert (= (and b!895001 ((_ is ValueCellFull!8628) mapDefault!28913)) b!894999))

(assert (= b!894997 b!895001))

(assert (= start!76220 b!894997))

(declare-fun m!832797 () Bool)

(assert (=> b!894997 m!832797))

(declare-fun m!832799 () Bool)

(assert (=> b!894997 m!832799))

(declare-fun m!832801 () Bool)

(assert (=> start!76220 m!832801))

(declare-fun m!832803 () Bool)

(assert (=> mapNonEmpty!28913 m!832803))

(declare-fun m!832805 () Bool)

(assert (=> b!895000 m!832805))

(declare-fun m!832807 () Bool)

(assert (=> b!895000 m!832807))

(check-sat (not mapNonEmpty!28913) (not b!895000) (not b_next!15891) (not start!76220) (not b!894997) b_and!26183 tp_is_empty!18219)
(check-sat b_and!26183 (not b_next!15891))
(get-model)

(declare-fun d!110719 () Bool)

(declare-fun res!605563 () Bool)

(declare-fun e!500020 () Bool)

(assert (=> d!110719 (=> (not res!605563) (not e!500020))))

(declare-fun simpleValid!303 (LongMapFixedSize!4272) Bool)

(assert (=> d!110719 (= res!605563 (simpleValid!303 thiss!1181))))

(assert (=> d!110719 (= (valid!1648 thiss!1181) e!500020)))

(declare-fun b!895030 () Bool)

(declare-fun res!605564 () Bool)

(assert (=> b!895030 (=> (not res!605564) (not e!500020))))

(declare-fun arrayCountValidKeys!0 (array!52434 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!895030 (= res!605564 (= (arrayCountValidKeys!0 (_keys!10054 thiss!1181) #b00000000000000000000000000000000 (size!25663 (_keys!10054 thiss!1181))) (_size!2191 thiss!1181)))))

(declare-fun b!895031 () Bool)

(declare-fun res!605565 () Bool)

(assert (=> b!895031 (=> (not res!605565) (not e!500020))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52434 (_ BitVec 32)) Bool)

(assert (=> b!895031 (= res!605565 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10054 thiss!1181) (mask!25927 thiss!1181)))))

(declare-fun b!895032 () Bool)

(declare-datatypes ((List!17810 0))(
  ( (Nil!17807) (Cons!17806 (h!18941 (_ BitVec 64)) (t!25149 List!17810)) )
))
(declare-fun arrayNoDuplicates!0 (array!52434 (_ BitVec 32) List!17810) Bool)

(assert (=> b!895032 (= e!500020 (arrayNoDuplicates!0 (_keys!10054 thiss!1181) #b00000000000000000000000000000000 Nil!17807))))

(assert (= (and d!110719 res!605563) b!895030))

(assert (= (and b!895030 res!605564) b!895031))

(assert (= (and b!895031 res!605565) b!895032))

(declare-fun m!832821 () Bool)

(assert (=> d!110719 m!832821))

(declare-fun m!832823 () Bool)

(assert (=> b!895030 m!832823))

(declare-fun m!832825 () Bool)

(assert (=> b!895031 m!832825))

(declare-fun m!832827 () Bool)

(assert (=> b!895032 m!832827))

(assert (=> start!76220 d!110719))

(declare-fun d!110721 () Bool)

(assert (=> d!110721 (= (array_inv!19798 (_keys!10054 thiss!1181)) (bvsge (size!25663 (_keys!10054 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!894997 d!110721))

(declare-fun d!110723 () Bool)

(assert (=> d!110723 (= (array_inv!19799 (_values!5335 thiss!1181)) (bvsge (size!25664 (_values!5335 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!894997 d!110723))

(declare-fun d!110725 () Bool)

(assert (=> d!110725 (= (validMask!0 (mask!25927 thiss!1181)) (and (or (= (mask!25927 thiss!1181) #b00000000000000000000000000000111) (= (mask!25927 thiss!1181) #b00000000000000000000000000001111) (= (mask!25927 thiss!1181) #b00000000000000000000000000011111) (= (mask!25927 thiss!1181) #b00000000000000000000000000111111) (= (mask!25927 thiss!1181) #b00000000000000000000000001111111) (= (mask!25927 thiss!1181) #b00000000000000000000000011111111) (= (mask!25927 thiss!1181) #b00000000000000000000000111111111) (= (mask!25927 thiss!1181) #b00000000000000000000001111111111) (= (mask!25927 thiss!1181) #b00000000000000000000011111111111) (= (mask!25927 thiss!1181) #b00000000000000000000111111111111) (= (mask!25927 thiss!1181) #b00000000000000000001111111111111) (= (mask!25927 thiss!1181) #b00000000000000000011111111111111) (= (mask!25927 thiss!1181) #b00000000000000000111111111111111) (= (mask!25927 thiss!1181) #b00000000000000001111111111111111) (= (mask!25927 thiss!1181) #b00000000000000011111111111111111) (= (mask!25927 thiss!1181) #b00000000000000111111111111111111) (= (mask!25927 thiss!1181) #b00000000000001111111111111111111) (= (mask!25927 thiss!1181) #b00000000000011111111111111111111) (= (mask!25927 thiss!1181) #b00000000000111111111111111111111) (= (mask!25927 thiss!1181) #b00000000001111111111111111111111) (= (mask!25927 thiss!1181) #b00000000011111111111111111111111) (= (mask!25927 thiss!1181) #b00000000111111111111111111111111) (= (mask!25927 thiss!1181) #b00000001111111111111111111111111) (= (mask!25927 thiss!1181) #b00000011111111111111111111111111) (= (mask!25927 thiss!1181) #b00000111111111111111111111111111) (= (mask!25927 thiss!1181) #b00001111111111111111111111111111) (= (mask!25927 thiss!1181) #b00011111111111111111111111111111) (= (mask!25927 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!25927 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!895000 d!110725))

(declare-fun d!110727 () Bool)

(declare-fun lt!404426 () SeekEntryResult!8873)

(assert (=> d!110727 (and (or ((_ is MissingVacant!8873) lt!404426) (not ((_ is Found!8873) lt!404426)) (and (bvsge (index!37864 lt!404426) #b00000000000000000000000000000000) (bvslt (index!37864 lt!404426) (size!25663 (_keys!10054 thiss!1181))))) (not ((_ is MissingVacant!8873) lt!404426)) (or (not ((_ is Found!8873) lt!404426)) (= (select (arr!25215 (_keys!10054 thiss!1181)) (index!37864 lt!404426)) key!785)))))

(declare-fun e!500027 () SeekEntryResult!8873)

(assert (=> d!110727 (= lt!404426 e!500027)))

(declare-fun c!94494 () Bool)

(declare-fun lt!404425 () SeekEntryResult!8873)

(assert (=> d!110727 (= c!94494 (and ((_ is Intermediate!8873) lt!404425) (undefined!9685 lt!404425)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52434 (_ BitVec 32)) SeekEntryResult!8873)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110727 (= lt!404425 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25927 thiss!1181)) key!785 (_keys!10054 thiss!1181) (mask!25927 thiss!1181)))))

(assert (=> d!110727 (validMask!0 (mask!25927 thiss!1181))))

(assert (=> d!110727 (= (seekEntry!0 key!785 (_keys!10054 thiss!1181) (mask!25927 thiss!1181)) lt!404426)))

(declare-fun b!895045 () Bool)

(declare-fun e!500029 () SeekEntryResult!8873)

(assert (=> b!895045 (= e!500029 (Found!8873 (index!37865 lt!404425)))))

(declare-fun b!895046 () Bool)

(declare-fun e!500028 () SeekEntryResult!8873)

(declare-fun lt!404427 () SeekEntryResult!8873)

(assert (=> b!895046 (= e!500028 (ite ((_ is MissingVacant!8873) lt!404427) (MissingZero!8873 (index!37866 lt!404427)) lt!404427))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52434 (_ BitVec 32)) SeekEntryResult!8873)

(assert (=> b!895046 (= lt!404427 (seekKeyOrZeroReturnVacant!0 (x!76119 lt!404425) (index!37865 lt!404425) (index!37865 lt!404425) key!785 (_keys!10054 thiss!1181) (mask!25927 thiss!1181)))))

(declare-fun b!895047 () Bool)

(declare-fun c!94495 () Bool)

(declare-fun lt!404428 () (_ BitVec 64))

(assert (=> b!895047 (= c!94495 (= lt!404428 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!895047 (= e!500029 e!500028)))

(declare-fun b!895048 () Bool)

(assert (=> b!895048 (= e!500028 (MissingZero!8873 (index!37865 lt!404425)))))

(declare-fun b!895049 () Bool)

(assert (=> b!895049 (= e!500027 e!500029)))

(assert (=> b!895049 (= lt!404428 (select (arr!25215 (_keys!10054 thiss!1181)) (index!37865 lt!404425)))))

(declare-fun c!94496 () Bool)

(assert (=> b!895049 (= c!94496 (= lt!404428 key!785))))

(declare-fun b!895050 () Bool)

(assert (=> b!895050 (= e!500027 Undefined!8873)))

(assert (= (and d!110727 c!94494) b!895050))

(assert (= (and d!110727 (not c!94494)) b!895049))

(assert (= (and b!895049 c!94496) b!895045))

(assert (= (and b!895049 (not c!94496)) b!895047))

(assert (= (and b!895047 c!94495) b!895048))

(assert (= (and b!895047 (not c!94495)) b!895046))

(declare-fun m!832829 () Bool)

(assert (=> d!110727 m!832829))

(declare-fun m!832831 () Bool)

(assert (=> d!110727 m!832831))

(assert (=> d!110727 m!832831))

(declare-fun m!832833 () Bool)

(assert (=> d!110727 m!832833))

(assert (=> d!110727 m!832805))

(declare-fun m!832835 () Bool)

(assert (=> b!895046 m!832835))

(declare-fun m!832837 () Bool)

(assert (=> b!895049 m!832837))

(assert (=> b!895000 d!110727))

(declare-fun mapNonEmpty!28919 () Bool)

(declare-fun mapRes!28919 () Bool)

(declare-fun tp!55681 () Bool)

(declare-fun e!500035 () Bool)

(assert (=> mapNonEmpty!28919 (= mapRes!28919 (and tp!55681 e!500035))))

(declare-fun mapKey!28919 () (_ BitVec 32))

(declare-fun mapRest!28919 () (Array (_ BitVec 32) ValueCell!8628))

(declare-fun mapValue!28919 () ValueCell!8628)

(assert (=> mapNonEmpty!28919 (= mapRest!28913 (store mapRest!28919 mapKey!28919 mapValue!28919))))

(declare-fun mapIsEmpty!28919 () Bool)

(assert (=> mapIsEmpty!28919 mapRes!28919))

(declare-fun condMapEmpty!28919 () Bool)

(declare-fun mapDefault!28919 () ValueCell!8628)

(assert (=> mapNonEmpty!28913 (= condMapEmpty!28919 (= mapRest!28913 ((as const (Array (_ BitVec 32) ValueCell!8628)) mapDefault!28919)))))

(declare-fun e!500034 () Bool)

(assert (=> mapNonEmpty!28913 (= tp!55672 (and e!500034 mapRes!28919))))

(declare-fun b!895057 () Bool)

(assert (=> b!895057 (= e!500035 tp_is_empty!18219)))

(declare-fun b!895058 () Bool)

(assert (=> b!895058 (= e!500034 tp_is_empty!18219)))

(assert (= (and mapNonEmpty!28913 condMapEmpty!28919) mapIsEmpty!28919))

(assert (= (and mapNonEmpty!28913 (not condMapEmpty!28919)) mapNonEmpty!28919))

(assert (= (and mapNonEmpty!28919 ((_ is ValueCellFull!8628) mapValue!28919)) b!895057))

(assert (= (and mapNonEmpty!28913 ((_ is ValueCellFull!8628) mapDefault!28919)) b!895058))

(declare-fun m!832839 () Bool)

(assert (=> mapNonEmpty!28919 m!832839))

(check-sat (not b!895031) (not d!110719) (not b_next!15891) (not d!110727) b_and!26183 (not b!895032) tp_is_empty!18219 (not b!895030) (not mapNonEmpty!28919) (not b!895046))
(check-sat b_and!26183 (not b_next!15891))
