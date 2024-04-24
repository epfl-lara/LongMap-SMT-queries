; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36004 () Bool)

(assert start!36004)

(declare-fun b!361689 () Bool)

(declare-fun e!221515 () Bool)

(declare-fun tp_is_empty!8401 () Bool)

(assert (=> b!361689 (= e!221515 tp_is_empty!8401)))

(declare-fun b!361690 () Bool)

(declare-fun e!221519 () Bool)

(assert (=> b!361690 (= e!221519 tp_is_empty!8401)))

(declare-fun from!1924 () (_ BitVec 32))

(declare-fun b!361691 () Bool)

(declare-datatypes ((array!20342 0))(
  ( (array!20343 (arr!9657 (Array (_ BitVec 32) (_ BitVec 64))) (size!10009 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20342)

(declare-fun e!221516 () Bool)

(declare-fun k0!1134 () (_ BitVec 64))

(assert (=> b!361691 (= e!221516 (and (not (= (select (arr!9657 _keys!1541) from!1924) k0!1134)) (bvsge (bvadd #b00000000000000000000000000000001 from!1924) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1924) (size!10009 _keys!1541))))))

(declare-fun b!361692 () Bool)

(declare-fun res!201234 () Bool)

(assert (=> b!361692 (=> (not res!201234) (not e!221516))))

(declare-fun arrayContainsKey!0 (array!20342 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!361692 (= res!201234 (arrayContainsKey!0 _keys!1541 k0!1134 from!1924))))

(declare-fun mapIsEmpty!14130 () Bool)

(declare-fun mapRes!14130 () Bool)

(assert (=> mapIsEmpty!14130 mapRes!14130))

(declare-fun b!361693 () Bool)

(declare-fun res!201239 () Bool)

(assert (=> b!361693 (=> (not res!201239) (not e!221516))))

(declare-fun mask!1943 () (_ BitVec 32))

(declare-datatypes ((V!12179 0))(
  ( (V!12180 (val!4245 Int)) )
))
(declare-datatypes ((ValueCell!3857 0))(
  ( (ValueCellFull!3857 (v!6441 V!12179)) (EmptyCell!3857) )
))
(declare-datatypes ((array!20344 0))(
  ( (array!20345 (arr!9658 (Array (_ BitVec 32) ValueCell!3857)) (size!10010 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20344)

(declare-fun extraKeys!1198 () (_ BitVec 32))

(assert (=> b!361693 (= res!201239 (and (= (size!10010 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!10009 _keys!1541) (size!10010 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun b!361694 () Bool)

(declare-fun res!201237 () Bool)

(assert (=> b!361694 (=> (not res!201237) (not e!221516))))

(declare-datatypes ((List!5427 0))(
  ( (Nil!5424) (Cons!5423 (h!6279 (_ BitVec 64)) (t!10569 List!5427)) )
))
(declare-fun arrayNoDuplicates!0 (array!20342 (_ BitVec 32) List!5427) Bool)

(assert (=> b!361694 (= res!201237 (arrayNoDuplicates!0 _keys!1541 #b00000000000000000000000000000000 Nil!5424))))

(declare-fun res!201235 () Bool)

(assert (=> start!36004 (=> (not res!201235) (not e!221516))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36004 (= res!201235 (validMask!0 mask!1943))))

(assert (=> start!36004 e!221516))

(assert (=> start!36004 true))

(declare-fun array_inv!7134 (array!20342) Bool)

(assert (=> start!36004 (array_inv!7134 _keys!1541)))

(declare-fun e!221517 () Bool)

(declare-fun array_inv!7135 (array!20344) Bool)

(assert (=> start!36004 (and (array_inv!7135 _values!1277) e!221517)))

(declare-fun b!361695 () Bool)

(declare-fun res!201236 () Bool)

(assert (=> b!361695 (=> (not res!201236) (not e!221516))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20342 (_ BitVec 32)) Bool)

(assert (=> b!361695 (= res!201236 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(declare-fun b!361696 () Bool)

(assert (=> b!361696 (= e!221517 (and e!221515 mapRes!14130))))

(declare-fun condMapEmpty!14130 () Bool)

(declare-fun mapDefault!14130 () ValueCell!3857)

(assert (=> b!361696 (= condMapEmpty!14130 (= (arr!9658 _values!1277) ((as const (Array (_ BitVec 32) ValueCell!3857)) mapDefault!14130)))))

(declare-fun mapNonEmpty!14130 () Bool)

(declare-fun tp!28206 () Bool)

(assert (=> mapNonEmpty!14130 (= mapRes!14130 (and tp!28206 e!221519))))

(declare-fun mapValue!14130 () ValueCell!3857)

(declare-fun mapKey!14130 () (_ BitVec 32))

(declare-fun mapRest!14130 () (Array (_ BitVec 32) ValueCell!3857))

(assert (=> mapNonEmpty!14130 (= (arr!9658 _values!1277) (store mapRest!14130 mapKey!14130 mapValue!14130))))

(declare-fun b!361697 () Bool)

(declare-fun res!201238 () Bool)

(assert (=> b!361697 (=> (not res!201238) (not e!221516))))

(assert (=> b!361697 (= res!201238 (and (bvsge from!1924 #b00000000000000000000000000000000) (bvslt from!1924 (size!10009 _keys!1541))))))

(assert (= (and start!36004 res!201235) b!361693))

(assert (= (and b!361693 res!201239) b!361695))

(assert (= (and b!361695 res!201236) b!361694))

(assert (= (and b!361694 res!201237) b!361697))

(assert (= (and b!361697 res!201238) b!361692))

(assert (= (and b!361692 res!201234) b!361691))

(assert (= (and b!361696 condMapEmpty!14130) mapIsEmpty!14130))

(assert (= (and b!361696 (not condMapEmpty!14130)) mapNonEmpty!14130))

(get-info :version)

(assert (= (and mapNonEmpty!14130 ((_ is ValueCellFull!3857) mapValue!14130)) b!361690))

(assert (= (and b!361696 ((_ is ValueCellFull!3857) mapDefault!14130)) b!361689))

(assert (= start!36004 b!361696))

(declare-fun m!358671 () Bool)

(assert (=> b!361691 m!358671))

(declare-fun m!358673 () Bool)

(assert (=> b!361692 m!358673))

(declare-fun m!358675 () Bool)

(assert (=> b!361694 m!358675))

(declare-fun m!358677 () Bool)

(assert (=> b!361695 m!358677))

(declare-fun m!358679 () Bool)

(assert (=> mapNonEmpty!14130 m!358679))

(declare-fun m!358681 () Bool)

(assert (=> start!36004 m!358681))

(declare-fun m!358683 () Bool)

(assert (=> start!36004 m!358683))

(declare-fun m!358685 () Bool)

(assert (=> start!36004 m!358685))

(check-sat (not b!361695) (not start!36004) (not mapNonEmpty!14130) (not b!361692) (not b!361694) tp_is_empty!8401)
(check-sat)
(get-model)

(declare-fun d!71983 () Bool)

(declare-fun res!201280 () Bool)

(declare-fun e!221554 () Bool)

(assert (=> d!71983 (=> res!201280 e!221554)))

(assert (=> d!71983 (= res!201280 (= (select (arr!9657 _keys!1541) from!1924) k0!1134))))

(assert (=> d!71983 (= (arrayContainsKey!0 _keys!1541 k0!1134 from!1924) e!221554)))

(declare-fun b!361756 () Bool)

(declare-fun e!221555 () Bool)

(assert (=> b!361756 (= e!221554 e!221555)))

(declare-fun res!201281 () Bool)

(assert (=> b!361756 (=> (not res!201281) (not e!221555))))

(assert (=> b!361756 (= res!201281 (bvslt (bvadd from!1924 #b00000000000000000000000000000001) (size!10009 _keys!1541)))))

(declare-fun b!361757 () Bool)

(assert (=> b!361757 (= e!221555 (arrayContainsKey!0 _keys!1541 k0!1134 (bvadd from!1924 #b00000000000000000000000000000001)))))

(assert (= (and d!71983 (not res!201280)) b!361756))

(assert (= (and b!361756 res!201281) b!361757))

(assert (=> d!71983 m!358671))

(declare-fun m!358719 () Bool)

(assert (=> b!361757 m!358719))

(assert (=> b!361692 d!71983))

(declare-fun b!361766 () Bool)

(declare-fun e!221564 () Bool)

(declare-fun e!221563 () Bool)

(assert (=> b!361766 (= e!221564 e!221563)))

(declare-fun lt!166611 () (_ BitVec 64))

(assert (=> b!361766 (= lt!166611 (select (arr!9657 _keys!1541) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11107 0))(
  ( (Unit!11108) )
))
(declare-fun lt!166610 () Unit!11107)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20342 (_ BitVec 64) (_ BitVec 32)) Unit!11107)

(assert (=> b!361766 (= lt!166610 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1541 lt!166611 #b00000000000000000000000000000000))))

(assert (=> b!361766 (arrayContainsKey!0 _keys!1541 lt!166611 #b00000000000000000000000000000000)))

(declare-fun lt!166609 () Unit!11107)

(assert (=> b!361766 (= lt!166609 lt!166610)))

(declare-fun res!201287 () Bool)

(declare-datatypes ((SeekEntryResult!3446 0))(
  ( (MissingZero!3446 (index!15963 (_ BitVec 32))) (Found!3446 (index!15964 (_ BitVec 32))) (Intermediate!3446 (undefined!4258 Bool) (index!15965 (_ BitVec 32)) (x!36003 (_ BitVec 32))) (Undefined!3446) (MissingVacant!3446 (index!15966 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20342 (_ BitVec 32)) SeekEntryResult!3446)

(assert (=> b!361766 (= res!201287 (= (seekEntryOrOpen!0 (select (arr!9657 _keys!1541) #b00000000000000000000000000000000) _keys!1541 mask!1943) (Found!3446 #b00000000000000000000000000000000)))))

(assert (=> b!361766 (=> (not res!201287) (not e!221563))))

(declare-fun b!361767 () Bool)

(declare-fun e!221562 () Bool)

(assert (=> b!361767 (= e!221562 e!221564)))

(declare-fun c!53711 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!361767 (= c!53711 (validKeyInArray!0 (select (arr!9657 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun d!71985 () Bool)

(declare-fun res!201286 () Bool)

(assert (=> d!71985 (=> res!201286 e!221562)))

(assert (=> d!71985 (= res!201286 (bvsge #b00000000000000000000000000000000 (size!10009 _keys!1541)))))

(assert (=> d!71985 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943) e!221562)))

(declare-fun b!361768 () Bool)

(declare-fun call!27173 () Bool)

(assert (=> b!361768 (= e!221563 call!27173)))

(declare-fun bm!27170 () Bool)

(assert (=> bm!27170 (= call!27173 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1541 mask!1943))))

(declare-fun b!361769 () Bool)

(assert (=> b!361769 (= e!221564 call!27173)))

(assert (= (and d!71985 (not res!201286)) b!361767))

(assert (= (and b!361767 c!53711) b!361766))

(assert (= (and b!361767 (not c!53711)) b!361769))

(assert (= (and b!361766 res!201287) b!361768))

(assert (= (or b!361768 b!361769) bm!27170))

(declare-fun m!358721 () Bool)

(assert (=> b!361766 m!358721))

(declare-fun m!358723 () Bool)

(assert (=> b!361766 m!358723))

(declare-fun m!358725 () Bool)

(assert (=> b!361766 m!358725))

(assert (=> b!361766 m!358721))

(declare-fun m!358727 () Bool)

(assert (=> b!361766 m!358727))

(assert (=> b!361767 m!358721))

(assert (=> b!361767 m!358721))

(declare-fun m!358729 () Bool)

(assert (=> b!361767 m!358729))

(declare-fun m!358731 () Bool)

(assert (=> bm!27170 m!358731))

(assert (=> b!361695 d!71985))

(declare-fun d!71987 () Bool)

(declare-fun res!201295 () Bool)

(declare-fun e!221573 () Bool)

(assert (=> d!71987 (=> res!201295 e!221573)))

(assert (=> d!71987 (= res!201295 (bvsge #b00000000000000000000000000000000 (size!10009 _keys!1541)))))

(assert (=> d!71987 (= (arrayNoDuplicates!0 _keys!1541 #b00000000000000000000000000000000 Nil!5424) e!221573)))

(declare-fun b!361780 () Bool)

(declare-fun e!221574 () Bool)

(declare-fun call!27176 () Bool)

(assert (=> b!361780 (= e!221574 call!27176)))

(declare-fun b!361781 () Bool)

(declare-fun e!221576 () Bool)

(declare-fun contains!2409 (List!5427 (_ BitVec 64)) Bool)

(assert (=> b!361781 (= e!221576 (contains!2409 Nil!5424 (select (arr!9657 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun b!361782 () Bool)

(assert (=> b!361782 (= e!221574 call!27176)))

(declare-fun b!361783 () Bool)

(declare-fun e!221575 () Bool)

(assert (=> b!361783 (= e!221573 e!221575)))

(declare-fun res!201296 () Bool)

(assert (=> b!361783 (=> (not res!201296) (not e!221575))))

(assert (=> b!361783 (= res!201296 (not e!221576))))

(declare-fun res!201294 () Bool)

(assert (=> b!361783 (=> (not res!201294) (not e!221576))))

(assert (=> b!361783 (= res!201294 (validKeyInArray!0 (select (arr!9657 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun bm!27173 () Bool)

(declare-fun c!53714 () Bool)

(assert (=> bm!27173 (= call!27176 (arrayNoDuplicates!0 _keys!1541 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53714 (Cons!5423 (select (arr!9657 _keys!1541) #b00000000000000000000000000000000) Nil!5424) Nil!5424)))))

(declare-fun b!361784 () Bool)

(assert (=> b!361784 (= e!221575 e!221574)))

(assert (=> b!361784 (= c!53714 (validKeyInArray!0 (select (arr!9657 _keys!1541) #b00000000000000000000000000000000)))))

(assert (= (and d!71987 (not res!201295)) b!361783))

(assert (= (and b!361783 res!201294) b!361781))

(assert (= (and b!361783 res!201296) b!361784))

(assert (= (and b!361784 c!53714) b!361782))

(assert (= (and b!361784 (not c!53714)) b!361780))

(assert (= (or b!361782 b!361780) bm!27173))

(assert (=> b!361781 m!358721))

(assert (=> b!361781 m!358721))

(declare-fun m!358733 () Bool)

(assert (=> b!361781 m!358733))

(assert (=> b!361783 m!358721))

(assert (=> b!361783 m!358721))

(assert (=> b!361783 m!358729))

(assert (=> bm!27173 m!358721))

(declare-fun m!358735 () Bool)

(assert (=> bm!27173 m!358735))

(assert (=> b!361784 m!358721))

(assert (=> b!361784 m!358721))

(assert (=> b!361784 m!358729))

(assert (=> b!361694 d!71987))

(declare-fun d!71989 () Bool)

(assert (=> d!71989 (= (validMask!0 mask!1943) (and (or (= mask!1943 #b00000000000000000000000000000111) (= mask!1943 #b00000000000000000000000000001111) (= mask!1943 #b00000000000000000000000000011111) (= mask!1943 #b00000000000000000000000000111111) (= mask!1943 #b00000000000000000000000001111111) (= mask!1943 #b00000000000000000000000011111111) (= mask!1943 #b00000000000000000000000111111111) (= mask!1943 #b00000000000000000000001111111111) (= mask!1943 #b00000000000000000000011111111111) (= mask!1943 #b00000000000000000000111111111111) (= mask!1943 #b00000000000000000001111111111111) (= mask!1943 #b00000000000000000011111111111111) (= mask!1943 #b00000000000000000111111111111111) (= mask!1943 #b00000000000000001111111111111111) (= mask!1943 #b00000000000000011111111111111111) (= mask!1943 #b00000000000000111111111111111111) (= mask!1943 #b00000000000001111111111111111111) (= mask!1943 #b00000000000011111111111111111111) (= mask!1943 #b00000000000111111111111111111111) (= mask!1943 #b00000000001111111111111111111111) (= mask!1943 #b00000000011111111111111111111111) (= mask!1943 #b00000000111111111111111111111111) (= mask!1943 #b00000001111111111111111111111111) (= mask!1943 #b00000011111111111111111111111111) (= mask!1943 #b00000111111111111111111111111111) (= mask!1943 #b00001111111111111111111111111111) (= mask!1943 #b00011111111111111111111111111111) (= mask!1943 #b00111111111111111111111111111111)) (bvsle mask!1943 #b00111111111111111111111111111111)))))

(assert (=> start!36004 d!71989))

(declare-fun d!71991 () Bool)

(assert (=> d!71991 (= (array_inv!7134 _keys!1541) (bvsge (size!10009 _keys!1541) #b00000000000000000000000000000000))))

(assert (=> start!36004 d!71991))

(declare-fun d!71993 () Bool)

(assert (=> d!71993 (= (array_inv!7135 _values!1277) (bvsge (size!10010 _values!1277) #b00000000000000000000000000000000))))

(assert (=> start!36004 d!71993))

(declare-fun mapIsEmpty!14139 () Bool)

(declare-fun mapRes!14139 () Bool)

(assert (=> mapIsEmpty!14139 mapRes!14139))

(declare-fun mapNonEmpty!14139 () Bool)

(declare-fun tp!28215 () Bool)

(declare-fun e!221581 () Bool)

(assert (=> mapNonEmpty!14139 (= mapRes!14139 (and tp!28215 e!221581))))

(declare-fun mapRest!14139 () (Array (_ BitVec 32) ValueCell!3857))

(declare-fun mapValue!14139 () ValueCell!3857)

(declare-fun mapKey!14139 () (_ BitVec 32))

(assert (=> mapNonEmpty!14139 (= mapRest!14130 (store mapRest!14139 mapKey!14139 mapValue!14139))))

(declare-fun b!361791 () Bool)

(assert (=> b!361791 (= e!221581 tp_is_empty!8401)))

(declare-fun condMapEmpty!14139 () Bool)

(declare-fun mapDefault!14139 () ValueCell!3857)

(assert (=> mapNonEmpty!14130 (= condMapEmpty!14139 (= mapRest!14130 ((as const (Array (_ BitVec 32) ValueCell!3857)) mapDefault!14139)))))

(declare-fun e!221582 () Bool)

(assert (=> mapNonEmpty!14130 (= tp!28206 (and e!221582 mapRes!14139))))

(declare-fun b!361792 () Bool)

(assert (=> b!361792 (= e!221582 tp_is_empty!8401)))

(assert (= (and mapNonEmpty!14130 condMapEmpty!14139) mapIsEmpty!14139))

(assert (= (and mapNonEmpty!14130 (not condMapEmpty!14139)) mapNonEmpty!14139))

(assert (= (and mapNonEmpty!14139 ((_ is ValueCellFull!3857) mapValue!14139)) b!361791))

(assert (= (and mapNonEmpty!14130 ((_ is ValueCellFull!3857) mapDefault!14139)) b!361792))

(declare-fun m!358737 () Bool)

(assert (=> mapNonEmpty!14139 m!358737))

(check-sat (not b!361767) (not mapNonEmpty!14139) (not b!361781) (not bm!27170) (not b!361757) (not b!361784) (not b!361783) (not bm!27173) (not b!361766) tp_is_empty!8401)
(check-sat)
