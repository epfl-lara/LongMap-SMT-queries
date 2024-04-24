; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3716 () Bool)

(assert start!3716)

(declare-fun b!25906 () Bool)

(declare-fun res!15408 () Bool)

(declare-fun e!16806 () Bool)

(assert (=> b!25906 (=> (not res!15408) (not e!16806))))

(declare-datatypes ((V!1243 0))(
  ( (V!1244 (val!558 Int)) )
))
(declare-datatypes ((ValueCell!332 0))(
  ( (ValueCellFull!332 (v!1643 V!1243)) (EmptyCell!332) )
))
(declare-datatypes ((array!1355 0))(
  ( (array!1356 (arr!637 (Array (_ BitVec 32) ValueCell!332)) (size!738 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1355)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1357 0))(
  ( (array!1358 (arr!638 (Array (_ BitVec 32) (_ BitVec 64))) (size!739 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1357)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!25906 (= res!15408 (and (= (size!738 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!739 _keys!1833) (size!738 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!25907 () Bool)

(declare-fun e!16807 () Bool)

(declare-fun e!16808 () Bool)

(declare-fun mapRes!1105 () Bool)

(assert (=> b!25907 (= e!16807 (and e!16808 mapRes!1105))))

(declare-fun condMapEmpty!1105 () Bool)

(declare-fun mapDefault!1105 () ValueCell!332)

(assert (=> b!25907 (= condMapEmpty!1105 (= (arr!637 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!332)) mapDefault!1105)))))

(declare-fun b!25908 () Bool)

(declare-fun e!16804 () Bool)

(declare-fun tp_is_empty!1063 () Bool)

(assert (=> b!25908 (= e!16804 tp_is_empty!1063)))

(declare-fun b!25909 () Bool)

(declare-fun res!15406 () Bool)

(assert (=> b!25909 (=> (not res!15406) (not e!16806))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1357 (_ BitVec 32)) Bool)

(assert (=> b!25909 (= res!15406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapIsEmpty!1105 () Bool)

(assert (=> mapIsEmpty!1105 mapRes!1105))

(declare-fun b!25910 () Bool)

(declare-datatypes ((List!570 0))(
  ( (Nil!567) (Cons!566 (h!1133 (_ BitVec 64)) (t!3251 List!570)) )
))
(declare-fun noDuplicate!8 (List!570) Bool)

(assert (=> b!25910 (= e!16806 (not (noDuplicate!8 Nil!567)))))

(declare-fun b!25911 () Bool)

(assert (=> b!25911 (= e!16808 tp_is_empty!1063)))

(declare-fun mapNonEmpty!1105 () Bool)

(declare-fun tp!3625 () Bool)

(assert (=> mapNonEmpty!1105 (= mapRes!1105 (and tp!3625 e!16804))))

(declare-fun mapKey!1105 () (_ BitVec 32))

(declare-fun mapRest!1105 () (Array (_ BitVec 32) ValueCell!332))

(declare-fun mapValue!1105 () ValueCell!332)

(assert (=> mapNonEmpty!1105 (= (arr!637 _values!1501) (store mapRest!1105 mapKey!1105 mapValue!1105))))

(declare-fun res!15407 () Bool)

(assert (=> start!3716 (=> (not res!15407) (not e!16806))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3716 (= res!15407 (validMask!0 mask!2294))))

(assert (=> start!3716 e!16806))

(assert (=> start!3716 true))

(declare-fun array_inv!449 (array!1355) Bool)

(assert (=> start!3716 (and (array_inv!449 _values!1501) e!16807)))

(declare-fun array_inv!450 (array!1357) Bool)

(assert (=> start!3716 (array_inv!450 _keys!1833)))

(declare-fun b!25912 () Bool)

(declare-fun res!15405 () Bool)

(assert (=> b!25912 (=> (not res!15405) (not e!16806))))

(assert (=> b!25912 (= res!15405 (and (bvsle #b00000000000000000000000000000000 (size!739 _keys!1833)) (bvslt (size!739 _keys!1833) #b01111111111111111111111111111111)))))

(assert (= (and start!3716 res!15407) b!25906))

(assert (= (and b!25906 res!15408) b!25909))

(assert (= (and b!25909 res!15406) b!25912))

(assert (= (and b!25912 res!15405) b!25910))

(assert (= (and b!25907 condMapEmpty!1105) mapIsEmpty!1105))

(assert (= (and b!25907 (not condMapEmpty!1105)) mapNonEmpty!1105))

(get-info :version)

(assert (= (and mapNonEmpty!1105 ((_ is ValueCellFull!332) mapValue!1105)) b!25908))

(assert (= (and b!25907 ((_ is ValueCellFull!332) mapDefault!1105)) b!25911))

(assert (= start!3716 b!25907))

(declare-fun m!20759 () Bool)

(assert (=> b!25909 m!20759))

(declare-fun m!20761 () Bool)

(assert (=> b!25910 m!20761))

(declare-fun m!20763 () Bool)

(assert (=> mapNonEmpty!1105 m!20763))

(declare-fun m!20765 () Bool)

(assert (=> start!3716 m!20765))

(declare-fun m!20767 () Bool)

(assert (=> start!3716 m!20767))

(declare-fun m!20769 () Bool)

(assert (=> start!3716 m!20769))

(check-sat (not b!25910) (not start!3716) (not mapNonEmpty!1105) tp_is_empty!1063 (not b!25909))
(check-sat)
(get-model)

(declare-fun d!4815 () Bool)

(declare-fun res!15437 () Bool)

(declare-fun e!16843 () Bool)

(assert (=> d!4815 (=> res!15437 e!16843)))

(assert (=> d!4815 (= res!15437 ((_ is Nil!567) Nil!567))))

(assert (=> d!4815 (= (noDuplicate!8 Nil!567) e!16843)))

(declare-fun b!25959 () Bool)

(declare-fun e!16844 () Bool)

(assert (=> b!25959 (= e!16843 e!16844)))

(declare-fun res!15438 () Bool)

(assert (=> b!25959 (=> (not res!15438) (not e!16844))))

(declare-fun contains!234 (List!570 (_ BitVec 64)) Bool)

(assert (=> b!25959 (= res!15438 (not (contains!234 (t!3251 Nil!567) (h!1133 Nil!567))))))

(declare-fun b!25960 () Bool)

(assert (=> b!25960 (= e!16844 (noDuplicate!8 (t!3251 Nil!567)))))

(assert (= (and d!4815 (not res!15437)) b!25959))

(assert (= (and b!25959 res!15438) b!25960))

(declare-fun m!20795 () Bool)

(assert (=> b!25959 m!20795))

(declare-fun m!20797 () Bool)

(assert (=> b!25960 m!20797))

(assert (=> b!25910 d!4815))

(declare-fun d!4817 () Bool)

(assert (=> d!4817 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!3716 d!4817))

(declare-fun d!4819 () Bool)

(assert (=> d!4819 (= (array_inv!449 _values!1501) (bvsge (size!738 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!3716 d!4819))

(declare-fun d!4821 () Bool)

(assert (=> d!4821 (= (array_inv!450 _keys!1833) (bvsge (size!739 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!3716 d!4821))

(declare-fun d!4823 () Bool)

(declare-fun res!15444 () Bool)

(declare-fun e!16851 () Bool)

(assert (=> d!4823 (=> res!15444 e!16851)))

(assert (=> d!4823 (= res!15444 (bvsge #b00000000000000000000000000000000 (size!739 _keys!1833)))))

(assert (=> d!4823 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!16851)))

(declare-fun b!25969 () Bool)

(declare-fun e!16852 () Bool)

(declare-fun call!2484 () Bool)

(assert (=> b!25969 (= e!16852 call!2484)))

(declare-fun bm!2481 () Bool)

(assert (=> bm!2481 (= call!2484 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun b!25970 () Bool)

(declare-fun e!16853 () Bool)

(assert (=> b!25970 (= e!16853 call!2484)))

(declare-fun b!25971 () Bool)

(assert (=> b!25971 (= e!16853 e!16852)))

(declare-fun lt!10261 () (_ BitVec 64))

(assert (=> b!25971 (= lt!10261 (select (arr!638 _keys!1833) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!629 0))(
  ( (Unit!630) )
))
(declare-fun lt!10262 () Unit!629)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!1357 (_ BitVec 64) (_ BitVec 32)) Unit!629)

(assert (=> b!25971 (= lt!10262 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!10261 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!1357 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!25971 (arrayContainsKey!0 _keys!1833 lt!10261 #b00000000000000000000000000000000)))

(declare-fun lt!10260 () Unit!629)

(assert (=> b!25971 (= lt!10260 lt!10262)))

(declare-fun res!15443 () Bool)

(declare-datatypes ((SeekEntryResult!59 0))(
  ( (MissingZero!59 (index!2358 (_ BitVec 32))) (Found!59 (index!2359 (_ BitVec 32))) (Intermediate!59 (undefined!871 Bool) (index!2360 (_ BitVec 32)) (x!6063 (_ BitVec 32))) (Undefined!59) (MissingVacant!59 (index!2361 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1357 (_ BitVec 32)) SeekEntryResult!59)

(assert (=> b!25971 (= res!15443 (= (seekEntryOrOpen!0 (select (arr!638 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!59 #b00000000000000000000000000000000)))))

(assert (=> b!25971 (=> (not res!15443) (not e!16852))))

(declare-fun b!25972 () Bool)

(assert (=> b!25972 (= e!16851 e!16853)))

(declare-fun c!3631 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!25972 (= c!3631 (validKeyInArray!0 (select (arr!638 _keys!1833) #b00000000000000000000000000000000)))))

(assert (= (and d!4823 (not res!15444)) b!25972))

(assert (= (and b!25972 c!3631) b!25971))

(assert (= (and b!25972 (not c!3631)) b!25970))

(assert (= (and b!25971 res!15443) b!25969))

(assert (= (or b!25969 b!25970) bm!2481))

(declare-fun m!20799 () Bool)

(assert (=> bm!2481 m!20799))

(declare-fun m!20801 () Bool)

(assert (=> b!25971 m!20801))

(declare-fun m!20803 () Bool)

(assert (=> b!25971 m!20803))

(declare-fun m!20805 () Bool)

(assert (=> b!25971 m!20805))

(assert (=> b!25971 m!20801))

(declare-fun m!20807 () Bool)

(assert (=> b!25971 m!20807))

(assert (=> b!25972 m!20801))

(assert (=> b!25972 m!20801))

(declare-fun m!20809 () Bool)

(assert (=> b!25972 m!20809))

(assert (=> b!25909 d!4823))

(declare-fun mapIsEmpty!1114 () Bool)

(declare-fun mapRes!1114 () Bool)

(assert (=> mapIsEmpty!1114 mapRes!1114))

(declare-fun mapNonEmpty!1114 () Bool)

(declare-fun tp!3634 () Bool)

(declare-fun e!16858 () Bool)

(assert (=> mapNonEmpty!1114 (= mapRes!1114 (and tp!3634 e!16858))))

(declare-fun mapKey!1114 () (_ BitVec 32))

(declare-fun mapRest!1114 () (Array (_ BitVec 32) ValueCell!332))

(declare-fun mapValue!1114 () ValueCell!332)

(assert (=> mapNonEmpty!1114 (= mapRest!1105 (store mapRest!1114 mapKey!1114 mapValue!1114))))

(declare-fun b!25980 () Bool)

(declare-fun e!16859 () Bool)

(assert (=> b!25980 (= e!16859 tp_is_empty!1063)))

(declare-fun b!25979 () Bool)

(assert (=> b!25979 (= e!16858 tp_is_empty!1063)))

(declare-fun condMapEmpty!1114 () Bool)

(declare-fun mapDefault!1114 () ValueCell!332)

(assert (=> mapNonEmpty!1105 (= condMapEmpty!1114 (= mapRest!1105 ((as const (Array (_ BitVec 32) ValueCell!332)) mapDefault!1114)))))

(assert (=> mapNonEmpty!1105 (= tp!3625 (and e!16859 mapRes!1114))))

(assert (= (and mapNonEmpty!1105 condMapEmpty!1114) mapIsEmpty!1114))

(assert (= (and mapNonEmpty!1105 (not condMapEmpty!1114)) mapNonEmpty!1114))

(assert (= (and mapNonEmpty!1114 ((_ is ValueCellFull!332) mapValue!1114)) b!25979))

(assert (= (and mapNonEmpty!1105 ((_ is ValueCellFull!332) mapDefault!1114)) b!25980))

(declare-fun m!20811 () Bool)

(assert (=> mapNonEmpty!1114 m!20811))

(check-sat (not b!25959) tp_is_empty!1063 (not bm!2481) (not b!25960) (not b!25972) (not mapNonEmpty!1114) (not b!25971))
(check-sat)
