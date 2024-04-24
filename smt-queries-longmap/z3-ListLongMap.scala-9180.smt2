; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110640 () Bool)

(assert start!110640)

(declare-fun b!1307706 () Bool)

(declare-fun e!746141 () Bool)

(declare-fun e!746145 () Bool)

(assert (=> b!1307706 (= e!746141 e!746145)))

(declare-fun res!867803 () Bool)

(assert (=> b!1307706 (=> res!867803 e!746145)))

(declare-datatypes ((List!29834 0))(
  ( (Nil!29831) (Cons!29830 (h!31048 (_ BitVec 64)) (t!43432 List!29834)) )
))
(declare-fun contains!8353 (List!29834 (_ BitVec 64)) Bool)

(assert (=> b!1307706 (= res!867803 (contains!8353 Nil!29831 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!867800 () Bool)

(assert (=> start!110640 (=> (not res!867800) (not e!746141))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110640 (= res!867800 (validMask!0 mask!2040))))

(assert (=> start!110640 e!746141))

(assert (=> start!110640 true))

(declare-datatypes ((V!51761 0))(
  ( (V!51762 (val!17571 Int)) )
))
(declare-datatypes ((ValueCell!16598 0))(
  ( (ValueCellFull!16598 (v!20192 V!51761)) (EmptyCell!16598) )
))
(declare-datatypes ((array!87055 0))(
  ( (array!87056 (arr!42004 (Array (_ BitVec 32) ValueCell!16598)) (size!42555 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87055)

(declare-fun e!746143 () Bool)

(declare-fun array_inv!32013 (array!87055) Bool)

(assert (=> start!110640 (and (array_inv!32013 _values!1354) e!746143)))

(declare-datatypes ((array!87057 0))(
  ( (array!87058 (arr!42005 (Array (_ BitVec 32) (_ BitVec 64))) (size!42556 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87057)

(declare-fun array_inv!32014 (array!87057) Bool)

(assert (=> start!110640 (array_inv!32014 _keys!1628)))

(declare-fun b!1307707 () Bool)

(declare-fun e!746142 () Bool)

(declare-fun tp_is_empty!34993 () Bool)

(assert (=> b!1307707 (= e!746142 tp_is_empty!34993)))

(declare-fun mapIsEmpty!54115 () Bool)

(declare-fun mapRes!54115 () Bool)

(assert (=> mapIsEmpty!54115 mapRes!54115))

(declare-fun b!1307708 () Bool)

(declare-fun res!867801 () Bool)

(assert (=> b!1307708 (=> (not res!867801) (not e!746141))))

(declare-fun noDuplicate!2074 (List!29834) Bool)

(assert (=> b!1307708 (= res!867801 (noDuplicate!2074 Nil!29831))))

(declare-fun b!1307709 () Bool)

(declare-fun e!746144 () Bool)

(assert (=> b!1307709 (= e!746144 tp_is_empty!34993)))

(declare-fun b!1307710 () Bool)

(declare-fun res!867799 () Bool)

(assert (=> b!1307710 (=> (not res!867799) (not e!746141))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87057 (_ BitVec 32)) Bool)

(assert (=> b!1307710 (= res!867799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1307711 () Bool)

(assert (=> b!1307711 (= e!746145 (contains!8353 Nil!29831 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1307712 () Bool)

(declare-fun res!867804 () Bool)

(assert (=> b!1307712 (=> (not res!867804) (not e!746141))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1307712 (= res!867804 (and (= (size!42555 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42556 _keys!1628) (size!42555 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1307713 () Bool)

(assert (=> b!1307713 (= e!746143 (and e!746142 mapRes!54115))))

(declare-fun condMapEmpty!54115 () Bool)

(declare-fun mapDefault!54115 () ValueCell!16598)

(assert (=> b!1307713 (= condMapEmpty!54115 (= (arr!42004 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16598)) mapDefault!54115)))))

(declare-fun mapNonEmpty!54115 () Bool)

(declare-fun tp!103195 () Bool)

(assert (=> mapNonEmpty!54115 (= mapRes!54115 (and tp!103195 e!746144))))

(declare-fun mapRest!54115 () (Array (_ BitVec 32) ValueCell!16598))

(declare-fun mapKey!54115 () (_ BitVec 32))

(declare-fun mapValue!54115 () ValueCell!16598)

(assert (=> mapNonEmpty!54115 (= (arr!42004 _values!1354) (store mapRest!54115 mapKey!54115 mapValue!54115))))

(declare-fun b!1307714 () Bool)

(declare-fun res!867802 () Bool)

(assert (=> b!1307714 (=> (not res!867802) (not e!746141))))

(assert (=> b!1307714 (= res!867802 (and (bvsle #b00000000000000000000000000000000 (size!42556 _keys!1628)) (bvslt (size!42556 _keys!1628) #b01111111111111111111111111111111)))))

(assert (= (and start!110640 res!867800) b!1307712))

(assert (= (and b!1307712 res!867804) b!1307710))

(assert (= (and b!1307710 res!867799) b!1307714))

(assert (= (and b!1307714 res!867802) b!1307708))

(assert (= (and b!1307708 res!867801) b!1307706))

(assert (= (and b!1307706 (not res!867803)) b!1307711))

(assert (= (and b!1307713 condMapEmpty!54115) mapIsEmpty!54115))

(assert (= (and b!1307713 (not condMapEmpty!54115)) mapNonEmpty!54115))

(get-info :version)

(assert (= (and mapNonEmpty!54115 ((_ is ValueCellFull!16598) mapValue!54115)) b!1307709))

(assert (= (and b!1307713 ((_ is ValueCellFull!16598) mapDefault!54115)) b!1307707))

(assert (= start!110640 b!1307713))

(declare-fun m!1199047 () Bool)

(assert (=> b!1307710 m!1199047))

(declare-fun m!1199049 () Bool)

(assert (=> b!1307706 m!1199049))

(declare-fun m!1199051 () Bool)

(assert (=> mapNonEmpty!54115 m!1199051))

(declare-fun m!1199053 () Bool)

(assert (=> b!1307711 m!1199053))

(declare-fun m!1199055 () Bool)

(assert (=> start!110640 m!1199055))

(declare-fun m!1199057 () Bool)

(assert (=> start!110640 m!1199057))

(declare-fun m!1199059 () Bool)

(assert (=> start!110640 m!1199059))

(declare-fun m!1199061 () Bool)

(assert (=> b!1307708 m!1199061))

(check-sat (not b!1307711) (not b!1307710) (not start!110640) (not b!1307708) tp_is_empty!34993 (not mapNonEmpty!54115) (not b!1307706))
(check-sat)
(get-model)

(declare-fun d!142699 () Bool)

(declare-fun res!867845 () Bool)

(declare-fun e!746186 () Bool)

(assert (=> d!142699 (=> res!867845 e!746186)))

(assert (=> d!142699 (= res!867845 ((_ is Nil!29831) Nil!29831))))

(assert (=> d!142699 (= (noDuplicate!2074 Nil!29831) e!746186)))

(declare-fun b!1307773 () Bool)

(declare-fun e!746187 () Bool)

(assert (=> b!1307773 (= e!746186 e!746187)))

(declare-fun res!867846 () Bool)

(assert (=> b!1307773 (=> (not res!867846) (not e!746187))))

(assert (=> b!1307773 (= res!867846 (not (contains!8353 (t!43432 Nil!29831) (h!31048 Nil!29831))))))

(declare-fun b!1307774 () Bool)

(assert (=> b!1307774 (= e!746187 (noDuplicate!2074 (t!43432 Nil!29831)))))

(assert (= (and d!142699 (not res!867845)) b!1307773))

(assert (= (and b!1307773 res!867846) b!1307774))

(declare-fun m!1199095 () Bool)

(assert (=> b!1307773 m!1199095))

(declare-fun m!1199097 () Bool)

(assert (=> b!1307774 m!1199097))

(assert (=> b!1307708 d!142699))

(declare-fun d!142701 () Bool)

(assert (=> d!142701 (= (validMask!0 mask!2040) (and (or (= mask!2040 #b00000000000000000000000000000111) (= mask!2040 #b00000000000000000000000000001111) (= mask!2040 #b00000000000000000000000000011111) (= mask!2040 #b00000000000000000000000000111111) (= mask!2040 #b00000000000000000000000001111111) (= mask!2040 #b00000000000000000000000011111111) (= mask!2040 #b00000000000000000000000111111111) (= mask!2040 #b00000000000000000000001111111111) (= mask!2040 #b00000000000000000000011111111111) (= mask!2040 #b00000000000000000000111111111111) (= mask!2040 #b00000000000000000001111111111111) (= mask!2040 #b00000000000000000011111111111111) (= mask!2040 #b00000000000000000111111111111111) (= mask!2040 #b00000000000000001111111111111111) (= mask!2040 #b00000000000000011111111111111111) (= mask!2040 #b00000000000000111111111111111111) (= mask!2040 #b00000000000001111111111111111111) (= mask!2040 #b00000000000011111111111111111111) (= mask!2040 #b00000000000111111111111111111111) (= mask!2040 #b00000000001111111111111111111111) (= mask!2040 #b00000000011111111111111111111111) (= mask!2040 #b00000000111111111111111111111111) (= mask!2040 #b00000001111111111111111111111111) (= mask!2040 #b00000011111111111111111111111111) (= mask!2040 #b00000111111111111111111111111111) (= mask!2040 #b00001111111111111111111111111111) (= mask!2040 #b00011111111111111111111111111111) (= mask!2040 #b00111111111111111111111111111111)) (bvsle mask!2040 #b00111111111111111111111111111111)))))

(assert (=> start!110640 d!142701))

(declare-fun d!142703 () Bool)

(assert (=> d!142703 (= (array_inv!32013 _values!1354) (bvsge (size!42555 _values!1354) #b00000000000000000000000000000000))))

(assert (=> start!110640 d!142703))

(declare-fun d!142705 () Bool)

(assert (=> d!142705 (= (array_inv!32014 _keys!1628) (bvsge (size!42556 _keys!1628) #b00000000000000000000000000000000))))

(assert (=> start!110640 d!142705))

(declare-fun bm!64694 () Bool)

(declare-fun call!64697 () Bool)

(assert (=> bm!64694 (= call!64697 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1628 mask!2040))))

(declare-fun b!1307783 () Bool)

(declare-fun e!746196 () Bool)

(assert (=> b!1307783 (= e!746196 call!64697)))

(declare-fun b!1307784 () Bool)

(declare-fun e!746194 () Bool)

(declare-fun e!746195 () Bool)

(assert (=> b!1307784 (= e!746194 e!746195)))

(declare-fun c!125945 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1307784 (= c!125945 (validKeyInArray!0 (select (arr!42005 _keys!1628) #b00000000000000000000000000000000)))))

(declare-fun d!142707 () Bool)

(declare-fun res!867852 () Bool)

(assert (=> d!142707 (=> res!867852 e!746194)))

(assert (=> d!142707 (= res!867852 (bvsge #b00000000000000000000000000000000 (size!42556 _keys!1628)))))

(assert (=> d!142707 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040) e!746194)))

(declare-fun b!1307785 () Bool)

(assert (=> b!1307785 (= e!746195 e!746196)))

(declare-fun lt!585399 () (_ BitVec 64))

(assert (=> b!1307785 (= lt!585399 (select (arr!42005 _keys!1628) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43239 0))(
  ( (Unit!43240) )
))
(declare-fun lt!585398 () Unit!43239)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!87057 (_ BitVec 64) (_ BitVec 32)) Unit!43239)

(assert (=> b!1307785 (= lt!585398 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1628 lt!585399 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!87057 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1307785 (arrayContainsKey!0 _keys!1628 lt!585399 #b00000000000000000000000000000000)))

(declare-fun lt!585400 () Unit!43239)

(assert (=> b!1307785 (= lt!585400 lt!585398)))

(declare-fun res!867851 () Bool)

(declare-datatypes ((SeekEntryResult!9990 0))(
  ( (MissingZero!9990 (index!42331 (_ BitVec 32))) (Found!9990 (index!42332 (_ BitVec 32))) (Intermediate!9990 (undefined!10802 Bool) (index!42333 (_ BitVec 32)) (x!116008 (_ BitVec 32))) (Undefined!9990) (MissingVacant!9990 (index!42334 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!87057 (_ BitVec 32)) SeekEntryResult!9990)

(assert (=> b!1307785 (= res!867851 (= (seekEntryOrOpen!0 (select (arr!42005 _keys!1628) #b00000000000000000000000000000000) _keys!1628 mask!2040) (Found!9990 #b00000000000000000000000000000000)))))

(assert (=> b!1307785 (=> (not res!867851) (not e!746196))))

(declare-fun b!1307786 () Bool)

(assert (=> b!1307786 (= e!746195 call!64697)))

(assert (= (and d!142707 (not res!867852)) b!1307784))

(assert (= (and b!1307784 c!125945) b!1307785))

(assert (= (and b!1307784 (not c!125945)) b!1307786))

(assert (= (and b!1307785 res!867851) b!1307783))

(assert (= (or b!1307783 b!1307786) bm!64694))

(declare-fun m!1199099 () Bool)

(assert (=> bm!64694 m!1199099))

(declare-fun m!1199101 () Bool)

(assert (=> b!1307784 m!1199101))

(assert (=> b!1307784 m!1199101))

(declare-fun m!1199103 () Bool)

(assert (=> b!1307784 m!1199103))

(assert (=> b!1307785 m!1199101))

(declare-fun m!1199105 () Bool)

(assert (=> b!1307785 m!1199105))

(declare-fun m!1199107 () Bool)

(assert (=> b!1307785 m!1199107))

(assert (=> b!1307785 m!1199101))

(declare-fun m!1199109 () Bool)

(assert (=> b!1307785 m!1199109))

(assert (=> b!1307710 d!142707))

(declare-fun d!142709 () Bool)

(declare-fun lt!585403 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!649 (List!29834) (InoxSet (_ BitVec 64)))

(assert (=> d!142709 (= lt!585403 (select (content!649 Nil!29831) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!746201 () Bool)

(assert (=> d!142709 (= lt!585403 e!746201)))

(declare-fun res!867858 () Bool)

(assert (=> d!142709 (=> (not res!867858) (not e!746201))))

(assert (=> d!142709 (= res!867858 ((_ is Cons!29830) Nil!29831))))

(assert (=> d!142709 (= (contains!8353 Nil!29831 #b0000000000000000000000000000000000000000000000000000000000000000) lt!585403)))

(declare-fun b!1307791 () Bool)

(declare-fun e!746202 () Bool)

(assert (=> b!1307791 (= e!746201 e!746202)))

(declare-fun res!867857 () Bool)

(assert (=> b!1307791 (=> res!867857 e!746202)))

(assert (=> b!1307791 (= res!867857 (= (h!31048 Nil!29831) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1307792 () Bool)

(assert (=> b!1307792 (= e!746202 (contains!8353 (t!43432 Nil!29831) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!142709 res!867858) b!1307791))

(assert (= (and b!1307791 (not res!867857)) b!1307792))

(declare-fun m!1199111 () Bool)

(assert (=> d!142709 m!1199111))

(declare-fun m!1199113 () Bool)

(assert (=> d!142709 m!1199113))

(declare-fun m!1199115 () Bool)

(assert (=> b!1307792 m!1199115))

(assert (=> b!1307706 d!142709))

(declare-fun d!142711 () Bool)

(declare-fun lt!585404 () Bool)

(assert (=> d!142711 (= lt!585404 (select (content!649 Nil!29831) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!746203 () Bool)

(assert (=> d!142711 (= lt!585404 e!746203)))

(declare-fun res!867860 () Bool)

(assert (=> d!142711 (=> (not res!867860) (not e!746203))))

(assert (=> d!142711 (= res!867860 ((_ is Cons!29830) Nil!29831))))

(assert (=> d!142711 (= (contains!8353 Nil!29831 #b1000000000000000000000000000000000000000000000000000000000000000) lt!585404)))

(declare-fun b!1307793 () Bool)

(declare-fun e!746204 () Bool)

(assert (=> b!1307793 (= e!746203 e!746204)))

(declare-fun res!867859 () Bool)

(assert (=> b!1307793 (=> res!867859 e!746204)))

(assert (=> b!1307793 (= res!867859 (= (h!31048 Nil!29831) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1307794 () Bool)

(assert (=> b!1307794 (= e!746204 (contains!8353 (t!43432 Nil!29831) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!142711 res!867860) b!1307793))

(assert (= (and b!1307793 (not res!867859)) b!1307794))

(assert (=> d!142711 m!1199111))

(declare-fun m!1199117 () Bool)

(assert (=> d!142711 m!1199117))

(declare-fun m!1199119 () Bool)

(assert (=> b!1307794 m!1199119))

(assert (=> b!1307711 d!142711))

(declare-fun b!1307802 () Bool)

(declare-fun e!746209 () Bool)

(assert (=> b!1307802 (= e!746209 tp_is_empty!34993)))

(declare-fun mapIsEmpty!54124 () Bool)

(declare-fun mapRes!54124 () Bool)

(assert (=> mapIsEmpty!54124 mapRes!54124))

(declare-fun mapNonEmpty!54124 () Bool)

(declare-fun tp!103204 () Bool)

(declare-fun e!746210 () Bool)

(assert (=> mapNonEmpty!54124 (= mapRes!54124 (and tp!103204 e!746210))))

(declare-fun mapRest!54124 () (Array (_ BitVec 32) ValueCell!16598))

(declare-fun mapKey!54124 () (_ BitVec 32))

(declare-fun mapValue!54124 () ValueCell!16598)

(assert (=> mapNonEmpty!54124 (= mapRest!54115 (store mapRest!54124 mapKey!54124 mapValue!54124))))

(declare-fun condMapEmpty!54124 () Bool)

(declare-fun mapDefault!54124 () ValueCell!16598)

(assert (=> mapNonEmpty!54115 (= condMapEmpty!54124 (= mapRest!54115 ((as const (Array (_ BitVec 32) ValueCell!16598)) mapDefault!54124)))))

(assert (=> mapNonEmpty!54115 (= tp!103195 (and e!746209 mapRes!54124))))

(declare-fun b!1307801 () Bool)

(assert (=> b!1307801 (= e!746210 tp_is_empty!34993)))

(assert (= (and mapNonEmpty!54115 condMapEmpty!54124) mapIsEmpty!54124))

(assert (= (and mapNonEmpty!54115 (not condMapEmpty!54124)) mapNonEmpty!54124))

(assert (= (and mapNonEmpty!54124 ((_ is ValueCellFull!16598) mapValue!54124)) b!1307801))

(assert (= (and mapNonEmpty!54115 ((_ is ValueCellFull!16598) mapDefault!54124)) b!1307802))

(declare-fun m!1199121 () Bool)

(assert (=> mapNonEmpty!54124 m!1199121))

(check-sat (not bm!64694) (not b!1307785) (not d!142709) (not b!1307773) (not d!142711) (not b!1307792) (not mapNonEmpty!54124) (not b!1307794) (not b!1307774) tp_is_empty!34993 (not b!1307784))
(check-sat)
