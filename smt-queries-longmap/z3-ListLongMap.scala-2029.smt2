; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35320 () Bool)

(assert start!35320)

(declare-fun b!353783 () Bool)

(declare-fun res!196137 () Bool)

(declare-fun e!216712 () Bool)

(assert (=> b!353783 (=> (not res!196137) (not e!216712))))

(declare-datatypes ((array!19187 0))(
  ( (array!19188 (arr!9089 (Array (_ BitVec 32) (_ BitVec 64))) (size!9441 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19187)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19187 (_ BitVec 32)) Bool)

(assert (=> b!353783 (= res!196137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!353784 () Bool)

(declare-fun res!196138 () Bool)

(assert (=> b!353784 (=> (not res!196138) (not e!216712))))

(declare-datatypes ((List!5281 0))(
  ( (Nil!5278) (Cons!5277 (h!6133 (_ BitVec 64)) (t!10431 List!5281)) )
))
(declare-fun noDuplicate!178 (List!5281) Bool)

(assert (=> b!353784 (= res!196138 (noDuplicate!178 Nil!5278))))

(declare-fun b!353785 () Bool)

(declare-fun e!216713 () Bool)

(declare-fun tp_is_empty!7797 () Bool)

(assert (=> b!353785 (= e!216713 tp_is_empty!7797)))

(declare-fun b!353786 () Bool)

(declare-fun e!216716 () Bool)

(assert (=> b!353786 (= e!216712 e!216716)))

(declare-fun res!196134 () Bool)

(assert (=> b!353786 (=> res!196134 e!216716)))

(declare-fun contains!2379 (List!5281 (_ BitVec 64)) Bool)

(assert (=> b!353786 (= res!196134 (contains!2379 Nil!5278 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!353787 () Bool)

(assert (=> b!353787 (= e!216716 (contains!2379 Nil!5278 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!353788 () Bool)

(declare-fun res!196135 () Bool)

(assert (=> b!353788 (=> (not res!196135) (not e!216712))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-datatypes ((V!11373 0))(
  ( (V!11374 (val!3943 Int)) )
))
(declare-datatypes ((ValueCell!3555 0))(
  ( (ValueCellFull!3555 (v!6136 V!11373)) (EmptyCell!3555) )
))
(declare-datatypes ((array!19189 0))(
  ( (array!19190 (arr!9090 (Array (_ BitVec 32) ValueCell!3555)) (size!9442 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19189)

(assert (=> b!353788 (= res!196135 (and (= (size!9442 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9441 _keys!1456) (size!9442 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun res!196139 () Bool)

(assert (=> start!35320 (=> (not res!196139) (not e!216712))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35320 (= res!196139 (validMask!0 mask!1842))))

(assert (=> start!35320 e!216712))

(assert (=> start!35320 true))

(declare-fun e!216714 () Bool)

(declare-fun array_inv!6694 (array!19189) Bool)

(assert (=> start!35320 (and (array_inv!6694 _values!1208) e!216714)))

(declare-fun array_inv!6695 (array!19187) Bool)

(assert (=> start!35320 (array_inv!6695 _keys!1456)))

(declare-fun mapIsEmpty!13197 () Bool)

(declare-fun mapRes!13197 () Bool)

(assert (=> mapIsEmpty!13197 mapRes!13197))

(declare-fun b!353789 () Bool)

(declare-fun e!216717 () Bool)

(assert (=> b!353789 (= e!216714 (and e!216717 mapRes!13197))))

(declare-fun condMapEmpty!13197 () Bool)

(declare-fun mapDefault!13197 () ValueCell!3555)

(assert (=> b!353789 (= condMapEmpty!13197 (= (arr!9090 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3555)) mapDefault!13197)))))

(declare-fun b!353790 () Bool)

(assert (=> b!353790 (= e!216717 tp_is_empty!7797)))

(declare-fun b!353791 () Bool)

(declare-fun res!196136 () Bool)

(assert (=> b!353791 (=> (not res!196136) (not e!216712))))

(assert (=> b!353791 (= res!196136 (and (bvsle #b00000000000000000000000000000000 (size!9441 _keys!1456)) (bvslt (size!9441 _keys!1456) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!13197 () Bool)

(declare-fun tp!27093 () Bool)

(assert (=> mapNonEmpty!13197 (= mapRes!13197 (and tp!27093 e!216713))))

(declare-fun mapValue!13197 () ValueCell!3555)

(declare-fun mapRest!13197 () (Array (_ BitVec 32) ValueCell!3555))

(declare-fun mapKey!13197 () (_ BitVec 32))

(assert (=> mapNonEmpty!13197 (= (arr!9090 _values!1208) (store mapRest!13197 mapKey!13197 mapValue!13197))))

(assert (= (and start!35320 res!196139) b!353788))

(assert (= (and b!353788 res!196135) b!353783))

(assert (= (and b!353783 res!196137) b!353791))

(assert (= (and b!353791 res!196136) b!353784))

(assert (= (and b!353784 res!196138) b!353786))

(assert (= (and b!353786 (not res!196134)) b!353787))

(assert (= (and b!353789 condMapEmpty!13197) mapIsEmpty!13197))

(assert (= (and b!353789 (not condMapEmpty!13197)) mapNonEmpty!13197))

(get-info :version)

(assert (= (and mapNonEmpty!13197 ((_ is ValueCellFull!3555) mapValue!13197)) b!353785))

(assert (= (and b!353789 ((_ is ValueCellFull!3555) mapDefault!13197)) b!353790))

(assert (= start!35320 b!353789))

(declare-fun m!353023 () Bool)

(assert (=> start!35320 m!353023))

(declare-fun m!353025 () Bool)

(assert (=> start!35320 m!353025))

(declare-fun m!353027 () Bool)

(assert (=> start!35320 m!353027))

(declare-fun m!353029 () Bool)

(assert (=> b!353783 m!353029))

(declare-fun m!353031 () Bool)

(assert (=> mapNonEmpty!13197 m!353031))

(declare-fun m!353033 () Bool)

(assert (=> b!353787 m!353033))

(declare-fun m!353035 () Bool)

(assert (=> b!353786 m!353035))

(declare-fun m!353037 () Bool)

(assert (=> b!353784 m!353037))

(check-sat (not b!353783) (not start!35320) (not mapNonEmpty!13197) (not b!353786) (not b!353787) (not b!353784) tp_is_empty!7797)
(check-sat)
(get-model)

(declare-fun d!71653 () Bool)

(declare-fun res!196162 () Bool)

(declare-fun e!216740 () Bool)

(assert (=> d!71653 (=> res!196162 e!216740)))

(assert (=> d!71653 (= res!196162 ((_ is Nil!5278) Nil!5278))))

(assert (=> d!71653 (= (noDuplicate!178 Nil!5278) e!216740)))

(declare-fun b!353823 () Bool)

(declare-fun e!216741 () Bool)

(assert (=> b!353823 (= e!216740 e!216741)))

(declare-fun res!196163 () Bool)

(assert (=> b!353823 (=> (not res!196163) (not e!216741))))

(assert (=> b!353823 (= res!196163 (not (contains!2379 (t!10431 Nil!5278) (h!6133 Nil!5278))))))

(declare-fun b!353824 () Bool)

(assert (=> b!353824 (= e!216741 (noDuplicate!178 (t!10431 Nil!5278)))))

(assert (= (and d!71653 (not res!196162)) b!353823))

(assert (= (and b!353823 res!196163) b!353824))

(declare-fun m!353055 () Bool)

(assert (=> b!353823 m!353055))

(declare-fun m!353057 () Bool)

(assert (=> b!353824 m!353057))

(assert (=> b!353784 d!71653))

(declare-fun b!353833 () Bool)

(declare-fun e!216749 () Bool)

(declare-fun call!27154 () Bool)

(assert (=> b!353833 (= e!216749 call!27154)))

(declare-fun bm!27151 () Bool)

(assert (=> bm!27151 (= call!27154 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1456 mask!1842))))

(declare-fun b!353834 () Bool)

(declare-fun e!216750 () Bool)

(declare-fun e!216748 () Bool)

(assert (=> b!353834 (= e!216750 e!216748)))

(declare-fun c!53703 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!353834 (= c!53703 (validKeyInArray!0 (select (arr!9089 _keys!1456) #b00000000000000000000000000000000)))))

(declare-fun b!353836 () Bool)

(assert (=> b!353836 (= e!216748 e!216749)))

(declare-fun lt!165610 () (_ BitVec 64))

(assert (=> b!353836 (= lt!165610 (select (arr!9089 _keys!1456) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10922 0))(
  ( (Unit!10923) )
))
(declare-fun lt!165609 () Unit!10922)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!19187 (_ BitVec 64) (_ BitVec 32)) Unit!10922)

(assert (=> b!353836 (= lt!165609 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1456 lt!165610 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!19187 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!353836 (arrayContainsKey!0 _keys!1456 lt!165610 #b00000000000000000000000000000000)))

(declare-fun lt!165608 () Unit!10922)

(assert (=> b!353836 (= lt!165608 lt!165609)))

(declare-fun res!196169 () Bool)

(declare-datatypes ((SeekEntryResult!3489 0))(
  ( (MissingZero!3489 (index!16135 (_ BitVec 32))) (Found!3489 (index!16136 (_ BitVec 32))) (Intermediate!3489 (undefined!4301 Bool) (index!16137 (_ BitVec 32)) (x!35223 (_ BitVec 32))) (Undefined!3489) (MissingVacant!3489 (index!16138 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19187 (_ BitVec 32)) SeekEntryResult!3489)

(assert (=> b!353836 (= res!196169 (= (seekEntryOrOpen!0 (select (arr!9089 _keys!1456) #b00000000000000000000000000000000) _keys!1456 mask!1842) (Found!3489 #b00000000000000000000000000000000)))))

(assert (=> b!353836 (=> (not res!196169) (not e!216749))))

(declare-fun b!353835 () Bool)

(assert (=> b!353835 (= e!216748 call!27154)))

(declare-fun d!71655 () Bool)

(declare-fun res!196168 () Bool)

(assert (=> d!71655 (=> res!196168 e!216750)))

(assert (=> d!71655 (= res!196168 (bvsge #b00000000000000000000000000000000 (size!9441 _keys!1456)))))

(assert (=> d!71655 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842) e!216750)))

(assert (= (and d!71655 (not res!196168)) b!353834))

(assert (= (and b!353834 c!53703) b!353836))

(assert (= (and b!353834 (not c!53703)) b!353835))

(assert (= (and b!353836 res!196169) b!353833))

(assert (= (or b!353833 b!353835) bm!27151))

(declare-fun m!353059 () Bool)

(assert (=> bm!27151 m!353059))

(declare-fun m!353061 () Bool)

(assert (=> b!353834 m!353061))

(assert (=> b!353834 m!353061))

(declare-fun m!353063 () Bool)

(assert (=> b!353834 m!353063))

(assert (=> b!353836 m!353061))

(declare-fun m!353065 () Bool)

(assert (=> b!353836 m!353065))

(declare-fun m!353067 () Bool)

(assert (=> b!353836 m!353067))

(assert (=> b!353836 m!353061))

(declare-fun m!353069 () Bool)

(assert (=> b!353836 m!353069))

(assert (=> b!353783 d!71655))

(declare-fun d!71657 () Bool)

(declare-fun lt!165613 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!197 (List!5281) (InoxSet (_ BitVec 64)))

(assert (=> d!71657 (= lt!165613 (select (content!197 Nil!5278) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!216756 () Bool)

(assert (=> d!71657 (= lt!165613 e!216756)))

(declare-fun res!196175 () Bool)

(assert (=> d!71657 (=> (not res!196175) (not e!216756))))

(assert (=> d!71657 (= res!196175 ((_ is Cons!5277) Nil!5278))))

(assert (=> d!71657 (= (contains!2379 Nil!5278 #b1000000000000000000000000000000000000000000000000000000000000000) lt!165613)))

(declare-fun b!353841 () Bool)

(declare-fun e!216755 () Bool)

(assert (=> b!353841 (= e!216756 e!216755)))

(declare-fun res!196174 () Bool)

(assert (=> b!353841 (=> res!196174 e!216755)))

(assert (=> b!353841 (= res!196174 (= (h!6133 Nil!5278) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!353842 () Bool)

(assert (=> b!353842 (= e!216755 (contains!2379 (t!10431 Nil!5278) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!71657 res!196175) b!353841))

(assert (= (and b!353841 (not res!196174)) b!353842))

(declare-fun m!353071 () Bool)

(assert (=> d!71657 m!353071))

(declare-fun m!353073 () Bool)

(assert (=> d!71657 m!353073))

(declare-fun m!353075 () Bool)

(assert (=> b!353842 m!353075))

(assert (=> b!353787 d!71657))

(declare-fun d!71659 () Bool)

(assert (=> d!71659 (= (validMask!0 mask!1842) (and (or (= mask!1842 #b00000000000000000000000000000111) (= mask!1842 #b00000000000000000000000000001111) (= mask!1842 #b00000000000000000000000000011111) (= mask!1842 #b00000000000000000000000000111111) (= mask!1842 #b00000000000000000000000001111111) (= mask!1842 #b00000000000000000000000011111111) (= mask!1842 #b00000000000000000000000111111111) (= mask!1842 #b00000000000000000000001111111111) (= mask!1842 #b00000000000000000000011111111111) (= mask!1842 #b00000000000000000000111111111111) (= mask!1842 #b00000000000000000001111111111111) (= mask!1842 #b00000000000000000011111111111111) (= mask!1842 #b00000000000000000111111111111111) (= mask!1842 #b00000000000000001111111111111111) (= mask!1842 #b00000000000000011111111111111111) (= mask!1842 #b00000000000000111111111111111111) (= mask!1842 #b00000000000001111111111111111111) (= mask!1842 #b00000000000011111111111111111111) (= mask!1842 #b00000000000111111111111111111111) (= mask!1842 #b00000000001111111111111111111111) (= mask!1842 #b00000000011111111111111111111111) (= mask!1842 #b00000000111111111111111111111111) (= mask!1842 #b00000001111111111111111111111111) (= mask!1842 #b00000011111111111111111111111111) (= mask!1842 #b00000111111111111111111111111111) (= mask!1842 #b00001111111111111111111111111111) (= mask!1842 #b00011111111111111111111111111111) (= mask!1842 #b00111111111111111111111111111111)) (bvsle mask!1842 #b00111111111111111111111111111111)))))

(assert (=> start!35320 d!71659))

(declare-fun d!71661 () Bool)

(assert (=> d!71661 (= (array_inv!6694 _values!1208) (bvsge (size!9442 _values!1208) #b00000000000000000000000000000000))))

(assert (=> start!35320 d!71661))

(declare-fun d!71663 () Bool)

(assert (=> d!71663 (= (array_inv!6695 _keys!1456) (bvsge (size!9441 _keys!1456) #b00000000000000000000000000000000))))

(assert (=> start!35320 d!71663))

(declare-fun d!71665 () Bool)

(declare-fun lt!165614 () Bool)

(assert (=> d!71665 (= lt!165614 (select (content!197 Nil!5278) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!216758 () Bool)

(assert (=> d!71665 (= lt!165614 e!216758)))

(declare-fun res!196177 () Bool)

(assert (=> d!71665 (=> (not res!196177) (not e!216758))))

(assert (=> d!71665 (= res!196177 ((_ is Cons!5277) Nil!5278))))

(assert (=> d!71665 (= (contains!2379 Nil!5278 #b0000000000000000000000000000000000000000000000000000000000000000) lt!165614)))

(declare-fun b!353843 () Bool)

(declare-fun e!216757 () Bool)

(assert (=> b!353843 (= e!216758 e!216757)))

(declare-fun res!196176 () Bool)

(assert (=> b!353843 (=> res!196176 e!216757)))

(assert (=> b!353843 (= res!196176 (= (h!6133 Nil!5278) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!353844 () Bool)

(assert (=> b!353844 (= e!216757 (contains!2379 (t!10431 Nil!5278) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!71665 res!196177) b!353843))

(assert (= (and b!353843 (not res!196176)) b!353844))

(assert (=> d!71665 m!353071))

(declare-fun m!353077 () Bool)

(assert (=> d!71665 m!353077))

(declare-fun m!353079 () Bool)

(assert (=> b!353844 m!353079))

(assert (=> b!353786 d!71665))

(declare-fun condMapEmpty!13203 () Bool)

(declare-fun mapDefault!13203 () ValueCell!3555)

(assert (=> mapNonEmpty!13197 (= condMapEmpty!13203 (= mapRest!13197 ((as const (Array (_ BitVec 32) ValueCell!3555)) mapDefault!13203)))))

(declare-fun e!216764 () Bool)

(declare-fun mapRes!13203 () Bool)

(assert (=> mapNonEmpty!13197 (= tp!27093 (and e!216764 mapRes!13203))))

(declare-fun b!353852 () Bool)

(assert (=> b!353852 (= e!216764 tp_is_empty!7797)))

(declare-fun mapNonEmpty!13203 () Bool)

(declare-fun tp!27099 () Bool)

(declare-fun e!216763 () Bool)

(assert (=> mapNonEmpty!13203 (= mapRes!13203 (and tp!27099 e!216763))))

(declare-fun mapKey!13203 () (_ BitVec 32))

(declare-fun mapRest!13203 () (Array (_ BitVec 32) ValueCell!3555))

(declare-fun mapValue!13203 () ValueCell!3555)

(assert (=> mapNonEmpty!13203 (= mapRest!13197 (store mapRest!13203 mapKey!13203 mapValue!13203))))

(declare-fun b!353851 () Bool)

(assert (=> b!353851 (= e!216763 tp_is_empty!7797)))

(declare-fun mapIsEmpty!13203 () Bool)

(assert (=> mapIsEmpty!13203 mapRes!13203))

(assert (= (and mapNonEmpty!13197 condMapEmpty!13203) mapIsEmpty!13203))

(assert (= (and mapNonEmpty!13197 (not condMapEmpty!13203)) mapNonEmpty!13203))

(assert (= (and mapNonEmpty!13203 ((_ is ValueCellFull!3555) mapValue!13203)) b!353851))

(assert (= (and mapNonEmpty!13197 ((_ is ValueCellFull!3555) mapDefault!13203)) b!353852))

(declare-fun m!353081 () Bool)

(assert (=> mapNonEmpty!13203 m!353081))

(check-sat (not b!353842) (not d!71665) (not d!71657) (not b!353824) (not b!353836) (not b!353844) tp_is_empty!7797 (not b!353823) (not mapNonEmpty!13203) (not bm!27151) (not b!353834))
(check-sat)
