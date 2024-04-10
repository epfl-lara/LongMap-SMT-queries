; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35304 () Bool)

(assert start!35304)

(declare-fun mapIsEmpty!13185 () Bool)

(declare-fun mapRes!13185 () Bool)

(assert (=> mapIsEmpty!13185 mapRes!13185))

(declare-fun b!353684 () Bool)

(declare-fun res!196076 () Bool)

(declare-fun e!216645 () Bool)

(assert (=> b!353684 (=> (not res!196076) (not e!216645))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19173 0))(
  ( (array!19174 (arr!9083 (Array (_ BitVec 32) (_ BitVec 64))) (size!9435 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19173)

(declare-datatypes ((V!11365 0))(
  ( (V!11366 (val!3940 Int)) )
))
(declare-datatypes ((ValueCell!3552 0))(
  ( (ValueCellFull!3552 (v!6133 V!11365)) (EmptyCell!3552) )
))
(declare-datatypes ((array!19175 0))(
  ( (array!19176 (arr!9084 (Array (_ BitVec 32) ValueCell!3552)) (size!9436 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19175)

(assert (=> b!353684 (= res!196076 (and (= (size!9436 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9435 _keys!1456) (size!9436 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13185 () Bool)

(declare-fun tp!27081 () Bool)

(declare-fun e!216643 () Bool)

(assert (=> mapNonEmpty!13185 (= mapRes!13185 (and tp!27081 e!216643))))

(declare-fun mapValue!13185 () ValueCell!3552)

(declare-fun mapKey!13185 () (_ BitVec 32))

(declare-fun mapRest!13185 () (Array (_ BitVec 32) ValueCell!3552))

(assert (=> mapNonEmpty!13185 (= (arr!9084 _values!1208) (store mapRest!13185 mapKey!13185 mapValue!13185))))

(declare-fun b!353686 () Bool)

(declare-fun e!216642 () Bool)

(declare-fun e!216641 () Bool)

(assert (=> b!353686 (= e!216642 (and e!216641 mapRes!13185))))

(declare-fun condMapEmpty!13185 () Bool)

(declare-fun mapDefault!13185 () ValueCell!3552)

(assert (=> b!353686 (= condMapEmpty!13185 (= (arr!9084 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3552)) mapDefault!13185)))))

(declare-fun b!353687 () Bool)

(declare-fun res!196077 () Bool)

(assert (=> b!353687 (=> (not res!196077) (not e!216645))))

(assert (=> b!353687 (= res!196077 (and (bvsle #b00000000000000000000000000000000 (size!9435 _keys!1456)) (bvslt (size!9435 _keys!1456) #b01111111111111111111111111111111)))))

(declare-fun b!353688 () Bool)

(declare-fun res!196079 () Bool)

(assert (=> b!353688 (=> (not res!196079) (not e!216645))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19173 (_ BitVec 32)) Bool)

(assert (=> b!353688 (= res!196079 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!353689 () Bool)

(declare-datatypes ((List!5279 0))(
  ( (Nil!5276) (Cons!5275 (h!6131 (_ BitVec 64)) (t!10429 List!5279)) )
))
(declare-fun noDuplicate!177 (List!5279) Bool)

(assert (=> b!353689 (= e!216645 (not (noDuplicate!177 Nil!5276)))))

(declare-fun b!353690 () Bool)

(declare-fun tp_is_empty!7791 () Bool)

(assert (=> b!353690 (= e!216643 tp_is_empty!7791)))

(declare-fun b!353685 () Bool)

(assert (=> b!353685 (= e!216641 tp_is_empty!7791)))

(declare-fun res!196078 () Bool)

(assert (=> start!35304 (=> (not res!196078) (not e!216645))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35304 (= res!196078 (validMask!0 mask!1842))))

(assert (=> start!35304 e!216645))

(assert (=> start!35304 true))

(declare-fun array_inv!6692 (array!19175) Bool)

(assert (=> start!35304 (and (array_inv!6692 _values!1208) e!216642)))

(declare-fun array_inv!6693 (array!19173) Bool)

(assert (=> start!35304 (array_inv!6693 _keys!1456)))

(assert (= (and start!35304 res!196078) b!353684))

(assert (= (and b!353684 res!196076) b!353688))

(assert (= (and b!353688 res!196079) b!353687))

(assert (= (and b!353687 res!196077) b!353689))

(assert (= (and b!353686 condMapEmpty!13185) mapIsEmpty!13185))

(assert (= (and b!353686 (not condMapEmpty!13185)) mapNonEmpty!13185))

(get-info :version)

(assert (= (and mapNonEmpty!13185 ((_ is ValueCellFull!3552) mapValue!13185)) b!353690))

(assert (= (and b!353686 ((_ is ValueCellFull!3552) mapDefault!13185)) b!353685))

(assert (= start!35304 b!353686))

(declare-fun m!352965 () Bool)

(assert (=> mapNonEmpty!13185 m!352965))

(declare-fun m!352967 () Bool)

(assert (=> b!353688 m!352967))

(declare-fun m!352969 () Bool)

(assert (=> b!353689 m!352969))

(declare-fun m!352971 () Bool)

(assert (=> start!35304 m!352971))

(declare-fun m!352973 () Bool)

(assert (=> start!35304 m!352973))

(declare-fun m!352975 () Bool)

(assert (=> start!35304 m!352975))

(check-sat tp_is_empty!7791 (not mapNonEmpty!13185) (not start!35304) (not b!353688) (not b!353689))
(check-sat)
(get-model)

(declare-fun d!71641 () Bool)

(assert (=> d!71641 (= (validMask!0 mask!1842) (and (or (= mask!1842 #b00000000000000000000000000000111) (= mask!1842 #b00000000000000000000000000001111) (= mask!1842 #b00000000000000000000000000011111) (= mask!1842 #b00000000000000000000000000111111) (= mask!1842 #b00000000000000000000000001111111) (= mask!1842 #b00000000000000000000000011111111) (= mask!1842 #b00000000000000000000000111111111) (= mask!1842 #b00000000000000000000001111111111) (= mask!1842 #b00000000000000000000011111111111) (= mask!1842 #b00000000000000000000111111111111) (= mask!1842 #b00000000000000000001111111111111) (= mask!1842 #b00000000000000000011111111111111) (= mask!1842 #b00000000000000000111111111111111) (= mask!1842 #b00000000000000001111111111111111) (= mask!1842 #b00000000000000011111111111111111) (= mask!1842 #b00000000000000111111111111111111) (= mask!1842 #b00000000000001111111111111111111) (= mask!1842 #b00000000000011111111111111111111) (= mask!1842 #b00000000000111111111111111111111) (= mask!1842 #b00000000001111111111111111111111) (= mask!1842 #b00000000011111111111111111111111) (= mask!1842 #b00000000111111111111111111111111) (= mask!1842 #b00000001111111111111111111111111) (= mask!1842 #b00000011111111111111111111111111) (= mask!1842 #b00000111111111111111111111111111) (= mask!1842 #b00001111111111111111111111111111) (= mask!1842 #b00011111111111111111111111111111) (= mask!1842 #b00111111111111111111111111111111)) (bvsle mask!1842 #b00111111111111111111111111111111)))))

(assert (=> start!35304 d!71641))

(declare-fun d!71643 () Bool)

(assert (=> d!71643 (= (array_inv!6692 _values!1208) (bvsge (size!9436 _values!1208) #b00000000000000000000000000000000))))

(assert (=> start!35304 d!71643))

(declare-fun d!71645 () Bool)

(assert (=> d!71645 (= (array_inv!6693 _keys!1456) (bvsge (size!9435 _keys!1456) #b00000000000000000000000000000000))))

(assert (=> start!35304 d!71645))

(declare-fun d!71647 () Bool)

(declare-fun res!196096 () Bool)

(declare-fun e!216665 () Bool)

(assert (=> d!71647 (=> res!196096 e!216665)))

(assert (=> d!71647 (= res!196096 ((_ is Nil!5276) Nil!5276))))

(assert (=> d!71647 (= (noDuplicate!177 Nil!5276) e!216665)))

(declare-fun b!353716 () Bool)

(declare-fun e!216666 () Bool)

(assert (=> b!353716 (= e!216665 e!216666)))

(declare-fun res!196097 () Bool)

(assert (=> b!353716 (=> (not res!196097) (not e!216666))))

(declare-fun contains!2377 (List!5279 (_ BitVec 64)) Bool)

(assert (=> b!353716 (= res!196097 (not (contains!2377 (t!10429 Nil!5276) (h!6131 Nil!5276))))))

(declare-fun b!353717 () Bool)

(assert (=> b!353717 (= e!216666 (noDuplicate!177 (t!10429 Nil!5276)))))

(assert (= (and d!71647 (not res!196096)) b!353716))

(assert (= (and b!353716 res!196097) b!353717))

(declare-fun m!352989 () Bool)

(assert (=> b!353716 m!352989))

(declare-fun m!352991 () Bool)

(assert (=> b!353717 m!352991))

(assert (=> b!353689 d!71647))

(declare-fun b!353726 () Bool)

(declare-fun e!216673 () Bool)

(declare-fun call!27151 () Bool)

(assert (=> b!353726 (= e!216673 call!27151)))

(declare-fun bm!27148 () Bool)

(assert (=> bm!27148 (= call!27151 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1456 mask!1842))))

(declare-fun b!353727 () Bool)

(declare-fun e!216674 () Bool)

(assert (=> b!353727 (= e!216674 e!216673)))

(declare-fun lt!165599 () (_ BitVec 64))

(assert (=> b!353727 (= lt!165599 (select (arr!9083 _keys!1456) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10920 0))(
  ( (Unit!10921) )
))
(declare-fun lt!165601 () Unit!10920)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!19173 (_ BitVec 64) (_ BitVec 32)) Unit!10920)

(assert (=> b!353727 (= lt!165601 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1456 lt!165599 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!19173 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!353727 (arrayContainsKey!0 _keys!1456 lt!165599 #b00000000000000000000000000000000)))

(declare-fun lt!165600 () Unit!10920)

(assert (=> b!353727 (= lt!165600 lt!165601)))

(declare-fun res!196102 () Bool)

(declare-datatypes ((SeekEntryResult!3488 0))(
  ( (MissingZero!3488 (index!16131 (_ BitVec 32))) (Found!3488 (index!16132 (_ BitVec 32))) (Intermediate!3488 (undefined!4300 Bool) (index!16133 (_ BitVec 32)) (x!35212 (_ BitVec 32))) (Undefined!3488) (MissingVacant!3488 (index!16134 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19173 (_ BitVec 32)) SeekEntryResult!3488)

(assert (=> b!353727 (= res!196102 (= (seekEntryOrOpen!0 (select (arr!9083 _keys!1456) #b00000000000000000000000000000000) _keys!1456 mask!1842) (Found!3488 #b00000000000000000000000000000000)))))

(assert (=> b!353727 (=> (not res!196102) (not e!216673))))

(declare-fun d!71649 () Bool)

(declare-fun res!196103 () Bool)

(declare-fun e!216675 () Bool)

(assert (=> d!71649 (=> res!196103 e!216675)))

(assert (=> d!71649 (= res!196103 (bvsge #b00000000000000000000000000000000 (size!9435 _keys!1456)))))

(assert (=> d!71649 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842) e!216675)))

(declare-fun b!353728 () Bool)

(assert (=> b!353728 (= e!216675 e!216674)))

(declare-fun c!53700 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!353728 (= c!53700 (validKeyInArray!0 (select (arr!9083 _keys!1456) #b00000000000000000000000000000000)))))

(declare-fun b!353729 () Bool)

(assert (=> b!353729 (= e!216674 call!27151)))

(assert (= (and d!71649 (not res!196103)) b!353728))

(assert (= (and b!353728 c!53700) b!353727))

(assert (= (and b!353728 (not c!53700)) b!353729))

(assert (= (and b!353727 res!196102) b!353726))

(assert (= (or b!353726 b!353729) bm!27148))

(declare-fun m!352993 () Bool)

(assert (=> bm!27148 m!352993))

(declare-fun m!352995 () Bool)

(assert (=> b!353727 m!352995))

(declare-fun m!352997 () Bool)

(assert (=> b!353727 m!352997))

(declare-fun m!352999 () Bool)

(assert (=> b!353727 m!352999))

(assert (=> b!353727 m!352995))

(declare-fun m!353001 () Bool)

(assert (=> b!353727 m!353001))

(assert (=> b!353728 m!352995))

(assert (=> b!353728 m!352995))

(declare-fun m!353003 () Bool)

(assert (=> b!353728 m!353003))

(assert (=> b!353688 d!71649))

(declare-fun b!353737 () Bool)

(declare-fun e!216680 () Bool)

(assert (=> b!353737 (= e!216680 tp_is_empty!7791)))

(declare-fun mapNonEmpty!13191 () Bool)

(declare-fun mapRes!13191 () Bool)

(declare-fun tp!27087 () Bool)

(declare-fun e!216681 () Bool)

(assert (=> mapNonEmpty!13191 (= mapRes!13191 (and tp!27087 e!216681))))

(declare-fun mapKey!13191 () (_ BitVec 32))

(declare-fun mapValue!13191 () ValueCell!3552)

(declare-fun mapRest!13191 () (Array (_ BitVec 32) ValueCell!3552))

(assert (=> mapNonEmpty!13191 (= mapRest!13185 (store mapRest!13191 mapKey!13191 mapValue!13191))))

(declare-fun b!353736 () Bool)

(assert (=> b!353736 (= e!216681 tp_is_empty!7791)))

(declare-fun mapIsEmpty!13191 () Bool)

(assert (=> mapIsEmpty!13191 mapRes!13191))

(declare-fun condMapEmpty!13191 () Bool)

(declare-fun mapDefault!13191 () ValueCell!3552)

(assert (=> mapNonEmpty!13185 (= condMapEmpty!13191 (= mapRest!13185 ((as const (Array (_ BitVec 32) ValueCell!3552)) mapDefault!13191)))))

(assert (=> mapNonEmpty!13185 (= tp!27081 (and e!216680 mapRes!13191))))

(assert (= (and mapNonEmpty!13185 condMapEmpty!13191) mapIsEmpty!13191))

(assert (= (and mapNonEmpty!13185 (not condMapEmpty!13191)) mapNonEmpty!13191))

(assert (= (and mapNonEmpty!13191 ((_ is ValueCellFull!3552) mapValue!13191)) b!353736))

(assert (= (and mapNonEmpty!13185 ((_ is ValueCellFull!3552) mapDefault!13191)) b!353737))

(declare-fun m!353005 () Bool)

(assert (=> mapNonEmpty!13191 m!353005))

(check-sat tp_is_empty!7791 (not b!353728) (not b!353727) (not b!353717) (not mapNonEmpty!13191) (not b!353716) (not bm!27148))
(check-sat)
