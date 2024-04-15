; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33396 () Bool)

(assert start!33396)

(declare-fun b!331506 () Bool)

(declare-fun res!182658 () Bool)

(declare-fun e!203439 () Bool)

(assert (=> b!331506 (=> (not res!182658) (not e!203439))))

(declare-datatypes ((array!16957 0))(
  ( (array!16958 (arr!8015 (Array (_ BitVec 32) (_ BitVec 64))) (size!8368 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!16957)

(assert (=> b!331506 (= res!182658 (and (bvsle #b00000000000000000000000000000000 (size!8368 _keys!1895)) (bvslt (size!8368 _keys!1895) #b01111111111111111111111111111111)))))

(declare-fun b!331507 () Bool)

(declare-fun res!182655 () Bool)

(assert (=> b!331507 (=> (not res!182655) (not e!203439))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16957 (_ BitVec 32)) Bool)

(assert (=> b!331507 (= res!182655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!331508 () Bool)

(declare-fun e!203440 () Bool)

(declare-fun e!203438 () Bool)

(declare-fun mapRes!11406 () Bool)

(assert (=> b!331508 (= e!203440 (and e!203438 mapRes!11406))))

(declare-fun condMapEmpty!11406 () Bool)

(declare-datatypes ((V!9891 0))(
  ( (V!9892 (val!3387 Int)) )
))
(declare-datatypes ((ValueCell!2999 0))(
  ( (ValueCellFull!2999 (v!5539 V!9891)) (EmptyCell!2999) )
))
(declare-datatypes ((array!16959 0))(
  ( (array!16960 (arr!8016 (Array (_ BitVec 32) ValueCell!2999)) (size!8369 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!16959)

(declare-fun mapDefault!11406 () ValueCell!2999)

(assert (=> b!331508 (= condMapEmpty!11406 (= (arr!8016 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!2999)) mapDefault!11406)))))

(declare-fun b!331509 () Bool)

(declare-fun tp_is_empty!6685 () Bool)

(assert (=> b!331509 (= e!203438 tp_is_empty!6685)))

(declare-fun res!182656 () Bool)

(assert (=> start!33396 (=> (not res!182656) (not e!203439))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33396 (= res!182656 (validMask!0 mask!2385))))

(assert (=> start!33396 e!203439))

(assert (=> start!33396 true))

(declare-fun array_inv!5984 (array!16959) Bool)

(assert (=> start!33396 (and (array_inv!5984 _values!1525) e!203440)))

(declare-fun array_inv!5985 (array!16957) Bool)

(assert (=> start!33396 (array_inv!5985 _keys!1895)))

(declare-fun b!331510 () Bool)

(declare-datatypes ((List!4543 0))(
  ( (Nil!4540) (Cons!4539 (h!5395 (_ BitVec 64)) (t!9616 List!4543)) )
))
(declare-fun noDuplicate!175 (List!4543) Bool)

(assert (=> b!331510 (= e!203439 (not (noDuplicate!175 Nil!4540)))))

(declare-fun b!331511 () Bool)

(declare-fun res!182657 () Bool)

(assert (=> b!331511 (=> (not res!182657) (not e!203439))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!331511 (= res!182657 (and (= (size!8369 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8368 _keys!1895) (size!8369 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!331512 () Bool)

(declare-fun e!203437 () Bool)

(assert (=> b!331512 (= e!203437 tp_is_empty!6685)))

(declare-fun mapIsEmpty!11406 () Bool)

(assert (=> mapIsEmpty!11406 mapRes!11406))

(declare-fun mapNonEmpty!11406 () Bool)

(declare-fun tp!23781 () Bool)

(assert (=> mapNonEmpty!11406 (= mapRes!11406 (and tp!23781 e!203437))))

(declare-fun mapKey!11406 () (_ BitVec 32))

(declare-fun mapValue!11406 () ValueCell!2999)

(declare-fun mapRest!11406 () (Array (_ BitVec 32) ValueCell!2999))

(assert (=> mapNonEmpty!11406 (= (arr!8016 _values!1525) (store mapRest!11406 mapKey!11406 mapValue!11406))))

(assert (= (and start!33396 res!182656) b!331511))

(assert (= (and b!331511 res!182657) b!331507))

(assert (= (and b!331507 res!182655) b!331506))

(assert (= (and b!331506 res!182658) b!331510))

(assert (= (and b!331508 condMapEmpty!11406) mapIsEmpty!11406))

(assert (= (and b!331508 (not condMapEmpty!11406)) mapNonEmpty!11406))

(get-info :version)

(assert (= (and mapNonEmpty!11406 ((_ is ValueCellFull!2999) mapValue!11406)) b!331512))

(assert (= (and b!331508 ((_ is ValueCellFull!2999) mapDefault!11406)) b!331509))

(assert (= start!33396 b!331508))

(declare-fun m!335797 () Bool)

(assert (=> b!331507 m!335797))

(declare-fun m!335799 () Bool)

(assert (=> start!33396 m!335799))

(declare-fun m!335801 () Bool)

(assert (=> start!33396 m!335801))

(declare-fun m!335803 () Bool)

(assert (=> start!33396 m!335803))

(declare-fun m!335805 () Bool)

(assert (=> b!331510 m!335805))

(declare-fun m!335807 () Bool)

(assert (=> mapNonEmpty!11406 m!335807))

(check-sat (not start!33396) tp_is_empty!6685 (not b!331510) (not mapNonEmpty!11406) (not b!331507))
(check-sat)
(get-model)

(declare-fun d!70271 () Bool)

(declare-fun res!182687 () Bool)

(declare-fun e!203476 () Bool)

(assert (=> d!70271 (=> res!182687 e!203476)))

(assert (=> d!70271 (= res!182687 ((_ is Nil!4540) Nil!4540))))

(assert (=> d!70271 (= (noDuplicate!175 Nil!4540) e!203476)))

(declare-fun b!331559 () Bool)

(declare-fun e!203477 () Bool)

(assert (=> b!331559 (= e!203476 e!203477)))

(declare-fun res!182688 () Bool)

(assert (=> b!331559 (=> (not res!182688) (not e!203477))))

(declare-fun contains!1978 (List!4543 (_ BitVec 64)) Bool)

(assert (=> b!331559 (= res!182688 (not (contains!1978 (t!9616 Nil!4540) (h!5395 Nil!4540))))))

(declare-fun b!331560 () Bool)

(assert (=> b!331560 (= e!203477 (noDuplicate!175 (t!9616 Nil!4540)))))

(assert (= (and d!70271 (not res!182687)) b!331559))

(assert (= (and b!331559 res!182688) b!331560))

(declare-fun m!335833 () Bool)

(assert (=> b!331559 m!335833))

(declare-fun m!335835 () Bool)

(assert (=> b!331560 m!335835))

(assert (=> b!331510 d!70271))

(declare-fun b!331569 () Bool)

(declare-fun e!203485 () Bool)

(declare-fun e!203486 () Bool)

(assert (=> b!331569 (= e!203485 e!203486)))

(declare-fun lt!158689 () (_ BitVec 64))

(assert (=> b!331569 (= lt!158689 (select (arr!8015 _keys!1895) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10332 0))(
  ( (Unit!10333) )
))
(declare-fun lt!158690 () Unit!10332)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16957 (_ BitVec 64) (_ BitVec 32)) Unit!10332)

(assert (=> b!331569 (= lt!158690 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!158689 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!16957 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!331569 (arrayContainsKey!0 _keys!1895 lt!158689 #b00000000000000000000000000000000)))

(declare-fun lt!158688 () Unit!10332)

(assert (=> b!331569 (= lt!158688 lt!158690)))

(declare-fun res!182693 () Bool)

(declare-datatypes ((SeekEntryResult!3124 0))(
  ( (MissingZero!3124 (index!14675 (_ BitVec 32))) (Found!3124 (index!14676 (_ BitVec 32))) (Intermediate!3124 (undefined!3936 Bool) (index!14677 (_ BitVec 32)) (x!33019 (_ BitVec 32))) (Undefined!3124) (MissingVacant!3124 (index!14678 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16957 (_ BitVec 32)) SeekEntryResult!3124)

(assert (=> b!331569 (= res!182693 (= (seekEntryOrOpen!0 (select (arr!8015 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3124 #b00000000000000000000000000000000)))))

(assert (=> b!331569 (=> (not res!182693) (not e!203486))))

(declare-fun bm!26177 () Bool)

(declare-fun call!26180 () Bool)

(assert (=> bm!26177 (= call!26180 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!331570 () Bool)

(assert (=> b!331570 (= e!203485 call!26180)))

(declare-fun b!331572 () Bool)

(declare-fun e!203484 () Bool)

(assert (=> b!331572 (= e!203484 e!203485)))

(declare-fun c!52004 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!331572 (= c!52004 (validKeyInArray!0 (select (arr!8015 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!331571 () Bool)

(assert (=> b!331571 (= e!203486 call!26180)))

(declare-fun d!70273 () Bool)

(declare-fun res!182694 () Bool)

(assert (=> d!70273 (=> res!182694 e!203484)))

(assert (=> d!70273 (= res!182694 (bvsge #b00000000000000000000000000000000 (size!8368 _keys!1895)))))

(assert (=> d!70273 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!203484)))

(assert (= (and d!70273 (not res!182694)) b!331572))

(assert (= (and b!331572 c!52004) b!331569))

(assert (= (and b!331572 (not c!52004)) b!331570))

(assert (= (and b!331569 res!182693) b!331571))

(assert (= (or b!331571 b!331570) bm!26177))

(declare-fun m!335837 () Bool)

(assert (=> b!331569 m!335837))

(declare-fun m!335839 () Bool)

(assert (=> b!331569 m!335839))

(declare-fun m!335841 () Bool)

(assert (=> b!331569 m!335841))

(assert (=> b!331569 m!335837))

(declare-fun m!335843 () Bool)

(assert (=> b!331569 m!335843))

(declare-fun m!335845 () Bool)

(assert (=> bm!26177 m!335845))

(assert (=> b!331572 m!335837))

(assert (=> b!331572 m!335837))

(declare-fun m!335847 () Bool)

(assert (=> b!331572 m!335847))

(assert (=> b!331507 d!70273))

(declare-fun d!70275 () Bool)

(assert (=> d!70275 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!33396 d!70275))

(declare-fun d!70277 () Bool)

(assert (=> d!70277 (= (array_inv!5984 _values!1525) (bvsge (size!8369 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!33396 d!70277))

(declare-fun d!70279 () Bool)

(assert (=> d!70279 (= (array_inv!5985 _keys!1895) (bvsge (size!8368 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!33396 d!70279))

(declare-fun condMapEmpty!11415 () Bool)

(declare-fun mapDefault!11415 () ValueCell!2999)

(assert (=> mapNonEmpty!11406 (= condMapEmpty!11415 (= mapRest!11406 ((as const (Array (_ BitVec 32) ValueCell!2999)) mapDefault!11415)))))

(declare-fun e!203491 () Bool)

(declare-fun mapRes!11415 () Bool)

(assert (=> mapNonEmpty!11406 (= tp!23781 (and e!203491 mapRes!11415))))

(declare-fun mapNonEmpty!11415 () Bool)

(declare-fun tp!23790 () Bool)

(declare-fun e!203492 () Bool)

(assert (=> mapNonEmpty!11415 (= mapRes!11415 (and tp!23790 e!203492))))

(declare-fun mapValue!11415 () ValueCell!2999)

(declare-fun mapRest!11415 () (Array (_ BitVec 32) ValueCell!2999))

(declare-fun mapKey!11415 () (_ BitVec 32))

(assert (=> mapNonEmpty!11415 (= mapRest!11406 (store mapRest!11415 mapKey!11415 mapValue!11415))))

(declare-fun mapIsEmpty!11415 () Bool)

(assert (=> mapIsEmpty!11415 mapRes!11415))

(declare-fun b!331579 () Bool)

(assert (=> b!331579 (= e!203492 tp_is_empty!6685)))

(declare-fun b!331580 () Bool)

(assert (=> b!331580 (= e!203491 tp_is_empty!6685)))

(assert (= (and mapNonEmpty!11406 condMapEmpty!11415) mapIsEmpty!11415))

(assert (= (and mapNonEmpty!11406 (not condMapEmpty!11415)) mapNonEmpty!11415))

(assert (= (and mapNonEmpty!11415 ((_ is ValueCellFull!2999) mapValue!11415)) b!331579))

(assert (= (and mapNonEmpty!11406 ((_ is ValueCellFull!2999) mapDefault!11415)) b!331580))

(declare-fun m!335849 () Bool)

(assert (=> mapNonEmpty!11415 m!335849))

(check-sat (not b!331572) tp_is_empty!6685 (not mapNonEmpty!11415) (not b!331560) (not b!331569) (not b!331559) (not bm!26177))
(check-sat)
