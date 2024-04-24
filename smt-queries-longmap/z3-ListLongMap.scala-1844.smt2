; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33396 () Bool)

(assert start!33396)

(declare-fun b!331729 () Bool)

(declare-fun res!182782 () Bool)

(declare-fun e!203580 () Bool)

(assert (=> b!331729 (=> (not res!182782) (not e!203580))))

(declare-datatypes ((array!16968 0))(
  ( (array!16969 (arr!8020 (Array (_ BitVec 32) (_ BitVec 64))) (size!8372 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!16968)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16968 (_ BitVec 32)) Bool)

(assert (=> b!331729 (= res!182782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!331730 () Bool)

(declare-fun res!182781 () Bool)

(assert (=> b!331730 (=> (not res!182781) (not e!203580))))

(assert (=> b!331730 (= res!182781 (and (bvsle #b00000000000000000000000000000000 (size!8372 _keys!1895)) (bvslt (size!8372 _keys!1895) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!11406 () Bool)

(declare-fun mapRes!11406 () Bool)

(declare-fun tp!23781 () Bool)

(declare-fun e!203579 () Bool)

(assert (=> mapNonEmpty!11406 (= mapRes!11406 (and tp!23781 e!203579))))

(declare-datatypes ((V!9891 0))(
  ( (V!9892 (val!3387 Int)) )
))
(declare-datatypes ((ValueCell!2999 0))(
  ( (ValueCellFull!2999 (v!5546 V!9891)) (EmptyCell!2999) )
))
(declare-fun mapValue!11406 () ValueCell!2999)

(declare-fun mapRest!11406 () (Array (_ BitVec 32) ValueCell!2999))

(declare-datatypes ((array!16970 0))(
  ( (array!16971 (arr!8021 (Array (_ BitVec 32) ValueCell!2999)) (size!8373 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!16970)

(declare-fun mapKey!11406 () (_ BitVec 32))

(assert (=> mapNonEmpty!11406 (= (arr!8021 _values!1525) (store mapRest!11406 mapKey!11406 mapValue!11406))))

(declare-fun b!331731 () Bool)

(declare-fun e!203581 () Bool)

(declare-fun tp_is_empty!6685 () Bool)

(assert (=> b!331731 (= e!203581 tp_is_empty!6685)))

(declare-fun b!331732 () Bool)

(declare-fun e!203583 () Bool)

(assert (=> b!331732 (= e!203583 (and e!203581 mapRes!11406))))

(declare-fun condMapEmpty!11406 () Bool)

(declare-fun mapDefault!11406 () ValueCell!2999)

(assert (=> b!331732 (= condMapEmpty!11406 (= (arr!8021 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!2999)) mapDefault!11406)))))

(declare-fun b!331733 () Bool)

(declare-fun res!182783 () Bool)

(assert (=> b!331733 (=> (not res!182783) (not e!203580))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!331733 (= res!182783 (and (= (size!8373 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8372 _keys!1895) (size!8373 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!182784 () Bool)

(assert (=> start!33396 (=> (not res!182784) (not e!203580))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33396 (= res!182784 (validMask!0 mask!2385))))

(assert (=> start!33396 e!203580))

(assert (=> start!33396 true))

(declare-fun array_inv!5966 (array!16970) Bool)

(assert (=> start!33396 (and (array_inv!5966 _values!1525) e!203583)))

(declare-fun array_inv!5967 (array!16968) Bool)

(assert (=> start!33396 (array_inv!5967 _keys!1895)))

(declare-fun b!331728 () Bool)

(assert (=> b!331728 (= e!203579 tp_is_empty!6685)))

(declare-fun b!331734 () Bool)

(declare-datatypes ((List!4487 0))(
  ( (Nil!4484) (Cons!4483 (h!5339 (_ BitVec 64)) (t!9561 List!4487)) )
))
(declare-fun noDuplicate!176 (List!4487) Bool)

(assert (=> b!331734 (= e!203580 (not (noDuplicate!176 Nil!4484)))))

(declare-fun mapIsEmpty!11406 () Bool)

(assert (=> mapIsEmpty!11406 mapRes!11406))

(assert (= (and start!33396 res!182784) b!331733))

(assert (= (and b!331733 res!182783) b!331729))

(assert (= (and b!331729 res!182782) b!331730))

(assert (= (and b!331730 res!182781) b!331734))

(assert (= (and b!331732 condMapEmpty!11406) mapIsEmpty!11406))

(assert (= (and b!331732 (not condMapEmpty!11406)) mapNonEmpty!11406))

(get-info :version)

(assert (= (and mapNonEmpty!11406 ((_ is ValueCellFull!2999) mapValue!11406)) b!331728))

(assert (= (and b!331732 ((_ is ValueCellFull!2999) mapDefault!11406)) b!331731))

(assert (= start!33396 b!331732))

(declare-fun m!336751 () Bool)

(assert (=> b!331729 m!336751))

(declare-fun m!336753 () Bool)

(assert (=> mapNonEmpty!11406 m!336753))

(declare-fun m!336755 () Bool)

(assert (=> start!33396 m!336755))

(declare-fun m!336757 () Bool)

(assert (=> start!33396 m!336757))

(declare-fun m!336759 () Bool)

(assert (=> start!33396 m!336759))

(declare-fun m!336761 () Bool)

(assert (=> b!331734 m!336761))

(check-sat tp_is_empty!6685 (not b!331734) (not mapNonEmpty!11406) (not b!331729) (not start!33396))
(check-sat)
(get-model)

(declare-fun b!331785 () Bool)

(declare-fun e!203620 () Bool)

(declare-fun e!203621 () Bool)

(assert (=> b!331785 (= e!203620 e!203621)))

(declare-fun c!52052 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!331785 (= c!52052 (validKeyInArray!0 (select (arr!8020 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!70505 () Bool)

(declare-fun res!182814 () Bool)

(assert (=> d!70505 (=> res!182814 e!203620)))

(assert (=> d!70505 (= res!182814 (bvsge #b00000000000000000000000000000000 (size!8372 _keys!1895)))))

(assert (=> d!70505 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!203620)))

(declare-fun b!331786 () Bool)

(declare-fun call!26192 () Bool)

(assert (=> b!331786 (= e!203621 call!26192)))

(declare-fun bm!26189 () Bool)

(assert (=> bm!26189 (= call!26192 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!331787 () Bool)

(declare-fun e!203622 () Bool)

(assert (=> b!331787 (= e!203622 call!26192)))

(declare-fun b!331788 () Bool)

(assert (=> b!331788 (= e!203621 e!203622)))

(declare-fun lt!158941 () (_ BitVec 64))

(assert (=> b!331788 (= lt!158941 (select (arr!8020 _keys!1895) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10331 0))(
  ( (Unit!10332) )
))
(declare-fun lt!158943 () Unit!10331)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16968 (_ BitVec 64) (_ BitVec 32)) Unit!10331)

(assert (=> b!331788 (= lt!158943 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!158941 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!16968 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!331788 (arrayContainsKey!0 _keys!1895 lt!158941 #b00000000000000000000000000000000)))

(declare-fun lt!158942 () Unit!10331)

(assert (=> b!331788 (= lt!158942 lt!158943)))

(declare-fun res!182813 () Bool)

(declare-datatypes ((SeekEntryResult!3094 0))(
  ( (MissingZero!3094 (index!14555 (_ BitVec 32))) (Found!3094 (index!14556 (_ BitVec 32))) (Intermediate!3094 (undefined!3906 Bool) (index!14557 (_ BitVec 32)) (x!32991 (_ BitVec 32))) (Undefined!3094) (MissingVacant!3094 (index!14558 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16968 (_ BitVec 32)) SeekEntryResult!3094)

(assert (=> b!331788 (= res!182813 (= (seekEntryOrOpen!0 (select (arr!8020 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3094 #b00000000000000000000000000000000)))))

(assert (=> b!331788 (=> (not res!182813) (not e!203622))))

(assert (= (and d!70505 (not res!182814)) b!331785))

(assert (= (and b!331785 c!52052) b!331788))

(assert (= (and b!331785 (not c!52052)) b!331786))

(assert (= (and b!331788 res!182813) b!331787))

(assert (= (or b!331787 b!331786) bm!26189))

(declare-fun m!336787 () Bool)

(assert (=> b!331785 m!336787))

(assert (=> b!331785 m!336787))

(declare-fun m!336789 () Bool)

(assert (=> b!331785 m!336789))

(declare-fun m!336791 () Bool)

(assert (=> bm!26189 m!336791))

(assert (=> b!331788 m!336787))

(declare-fun m!336793 () Bool)

(assert (=> b!331788 m!336793))

(declare-fun m!336795 () Bool)

(assert (=> b!331788 m!336795))

(assert (=> b!331788 m!336787))

(declare-fun m!336797 () Bool)

(assert (=> b!331788 m!336797))

(assert (=> b!331729 d!70505))

(declare-fun d!70507 () Bool)

(assert (=> d!70507 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!33396 d!70507))

(declare-fun d!70509 () Bool)

(assert (=> d!70509 (= (array_inv!5966 _values!1525) (bvsge (size!8373 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!33396 d!70509))

(declare-fun d!70511 () Bool)

(assert (=> d!70511 (= (array_inv!5967 _keys!1895) (bvsge (size!8372 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!33396 d!70511))

(declare-fun d!70513 () Bool)

(declare-fun res!182819 () Bool)

(declare-fun e!203627 () Bool)

(assert (=> d!70513 (=> res!182819 e!203627)))

(assert (=> d!70513 (= res!182819 ((_ is Nil!4484) Nil!4484))))

(assert (=> d!70513 (= (noDuplicate!176 Nil!4484) e!203627)))

(declare-fun b!331793 () Bool)

(declare-fun e!203628 () Bool)

(assert (=> b!331793 (= e!203627 e!203628)))

(declare-fun res!182820 () Bool)

(assert (=> b!331793 (=> (not res!182820) (not e!203628))))

(declare-fun contains!1975 (List!4487 (_ BitVec 64)) Bool)

(assert (=> b!331793 (= res!182820 (not (contains!1975 (t!9561 Nil!4484) (h!5339 Nil!4484))))))

(declare-fun b!331794 () Bool)

(assert (=> b!331794 (= e!203628 (noDuplicate!176 (t!9561 Nil!4484)))))

(assert (= (and d!70513 (not res!182819)) b!331793))

(assert (= (and b!331793 res!182820) b!331794))

(declare-fun m!336799 () Bool)

(assert (=> b!331793 m!336799))

(declare-fun m!336801 () Bool)

(assert (=> b!331794 m!336801))

(assert (=> b!331734 d!70513))

(declare-fun mapNonEmpty!11415 () Bool)

(declare-fun mapRes!11415 () Bool)

(declare-fun tp!23790 () Bool)

(declare-fun e!203633 () Bool)

(assert (=> mapNonEmpty!11415 (= mapRes!11415 (and tp!23790 e!203633))))

(declare-fun mapRest!11415 () (Array (_ BitVec 32) ValueCell!2999))

(declare-fun mapKey!11415 () (_ BitVec 32))

(declare-fun mapValue!11415 () ValueCell!2999)

(assert (=> mapNonEmpty!11415 (= mapRest!11406 (store mapRest!11415 mapKey!11415 mapValue!11415))))

(declare-fun condMapEmpty!11415 () Bool)

(declare-fun mapDefault!11415 () ValueCell!2999)

(assert (=> mapNonEmpty!11406 (= condMapEmpty!11415 (= mapRest!11406 ((as const (Array (_ BitVec 32) ValueCell!2999)) mapDefault!11415)))))

(declare-fun e!203634 () Bool)

(assert (=> mapNonEmpty!11406 (= tp!23781 (and e!203634 mapRes!11415))))

(declare-fun b!331802 () Bool)

(assert (=> b!331802 (= e!203634 tp_is_empty!6685)))

(declare-fun b!331801 () Bool)

(assert (=> b!331801 (= e!203633 tp_is_empty!6685)))

(declare-fun mapIsEmpty!11415 () Bool)

(assert (=> mapIsEmpty!11415 mapRes!11415))

(assert (= (and mapNonEmpty!11406 condMapEmpty!11415) mapIsEmpty!11415))

(assert (= (and mapNonEmpty!11406 (not condMapEmpty!11415)) mapNonEmpty!11415))

(assert (= (and mapNonEmpty!11415 ((_ is ValueCellFull!2999) mapValue!11415)) b!331801))

(assert (= (and mapNonEmpty!11406 ((_ is ValueCellFull!2999) mapDefault!11415)) b!331802))

(declare-fun m!336803 () Bool)

(assert (=> mapNonEmpty!11415 m!336803))

(check-sat tp_is_empty!6685 (not b!331794) (not mapNonEmpty!11415) (not b!331793) (not bm!26189) (not b!331788) (not b!331785))
(check-sat)
