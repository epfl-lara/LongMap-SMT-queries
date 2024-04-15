; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19970 () Bool)

(assert start!19970)

(declare-fun res!92285 () Bool)

(declare-fun e!128763 () Bool)

(assert (=> start!19970 (=> (not res!92285) (not e!128763))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!19970 (= res!92285 (validMask!0 mask!1149))))

(assert (=> start!19970 e!128763))

(assert (=> start!19970 true))

(declare-datatypes ((V!5673 0))(
  ( (V!5674 (val!2304 Int)) )
))
(declare-datatypes ((ValueCell!1916 0))(
  ( (ValueCellFull!1916 (v!4267 V!5673)) (EmptyCell!1916) )
))
(declare-datatypes ((array!8275 0))(
  ( (array!8276 (arr!3891 (Array (_ BitVec 32) ValueCell!1916)) (size!4217 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8275)

(declare-fun e!128761 () Bool)

(declare-fun array_inv!2523 (array!8275) Bool)

(assert (=> start!19970 (and (array_inv!2523 _values!649) e!128761)))

(declare-datatypes ((array!8277 0))(
  ( (array!8278 (arr!3892 (Array (_ BitVec 32) (_ BitVec 64))) (size!4218 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8277)

(declare-fun array_inv!2524 (array!8277) Bool)

(assert (=> start!19970 (array_inv!2524 _keys!825)))

(declare-fun b!195644 () Bool)

(assert (=> b!195644 (= e!128763 (bvsgt #b00000000000000000000000000000000 (size!4218 _keys!825)))))

(declare-fun b!195645 () Bool)

(declare-fun e!128764 () Bool)

(declare-fun tp_is_empty!4519 () Bool)

(assert (=> b!195645 (= e!128764 tp_is_empty!4519)))

(declare-fun b!195646 () Bool)

(declare-fun e!128760 () Bool)

(declare-fun mapRes!7835 () Bool)

(assert (=> b!195646 (= e!128761 (and e!128760 mapRes!7835))))

(declare-fun condMapEmpty!7835 () Bool)

(declare-fun mapDefault!7835 () ValueCell!1916)

(assert (=> b!195646 (= condMapEmpty!7835 (= (arr!3891 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1916)) mapDefault!7835)))))

(declare-fun b!195647 () Bool)

(declare-fun res!92286 () Bool)

(assert (=> b!195647 (=> (not res!92286) (not e!128763))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8277 (_ BitVec 32)) Bool)

(assert (=> b!195647 (= res!92286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapNonEmpty!7835 () Bool)

(declare-fun tp!17123 () Bool)

(assert (=> mapNonEmpty!7835 (= mapRes!7835 (and tp!17123 e!128764))))

(declare-fun mapValue!7835 () ValueCell!1916)

(declare-fun mapKey!7835 () (_ BitVec 32))

(declare-fun mapRest!7835 () (Array (_ BitVec 32) ValueCell!1916))

(assert (=> mapNonEmpty!7835 (= (arr!3891 _values!649) (store mapRest!7835 mapKey!7835 mapValue!7835))))

(declare-fun mapIsEmpty!7835 () Bool)

(assert (=> mapIsEmpty!7835 mapRes!7835))

(declare-fun b!195648 () Bool)

(declare-fun res!92284 () Bool)

(assert (=> b!195648 (=> (not res!92284) (not e!128763))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!195648 (= res!92284 (and (= (size!4217 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4218 _keys!825) (size!4217 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!195649 () Bool)

(assert (=> b!195649 (= e!128760 tp_is_empty!4519)))

(assert (= (and start!19970 res!92285) b!195648))

(assert (= (and b!195648 res!92284) b!195647))

(assert (= (and b!195647 res!92286) b!195644))

(assert (= (and b!195646 condMapEmpty!7835) mapIsEmpty!7835))

(assert (= (and b!195646 (not condMapEmpty!7835)) mapNonEmpty!7835))

(get-info :version)

(assert (= (and mapNonEmpty!7835 ((_ is ValueCellFull!1916) mapValue!7835)) b!195645))

(assert (= (and b!195646 ((_ is ValueCellFull!1916) mapDefault!7835)) b!195649))

(assert (= start!19970 b!195646))

(declare-fun m!222685 () Bool)

(assert (=> start!19970 m!222685))

(declare-fun m!222687 () Bool)

(assert (=> start!19970 m!222687))

(declare-fun m!222689 () Bool)

(assert (=> start!19970 m!222689))

(declare-fun m!222691 () Bool)

(assert (=> b!195647 m!222691))

(declare-fun m!222693 () Bool)

(assert (=> mapNonEmpty!7835 m!222693))

(check-sat (not start!19970) (not b!195647) (not mapNonEmpty!7835) tp_is_empty!4519)
(check-sat)
(get-model)

(declare-fun d!57385 () Bool)

(assert (=> d!57385 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!19970 d!57385))

(declare-fun d!57387 () Bool)

(assert (=> d!57387 (= (array_inv!2523 _values!649) (bvsge (size!4217 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!19970 d!57387))

(declare-fun d!57389 () Bool)

(assert (=> d!57389 (= (array_inv!2524 _keys!825) (bvsge (size!4218 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!19970 d!57389))

(declare-fun b!195694 () Bool)

(declare-fun e!128801 () Bool)

(declare-fun call!19743 () Bool)

(assert (=> b!195694 (= e!128801 call!19743)))

(declare-fun b!195695 () Bool)

(declare-fun e!128803 () Bool)

(declare-fun e!128802 () Bool)

(assert (=> b!195695 (= e!128803 e!128802)))

(declare-fun c!35400 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!195695 (= c!35400 (validKeyInArray!0 (select (arr!3892 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!195696 () Bool)

(assert (=> b!195696 (= e!128802 call!19743)))

(declare-fun bm!19740 () Bool)

(assert (=> bm!19740 (= call!19743 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(declare-fun b!195697 () Bool)

(assert (=> b!195697 (= e!128802 e!128801)))

(declare-fun lt!97354 () (_ BitVec 64))

(assert (=> b!195697 (= lt!97354 (select (arr!3892 _keys!825) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5886 0))(
  ( (Unit!5887) )
))
(declare-fun lt!97353 () Unit!5886)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8277 (_ BitVec 64) (_ BitVec 32)) Unit!5886)

(assert (=> b!195697 (= lt!97353 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!97354 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!8277 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!195697 (arrayContainsKey!0 _keys!825 lt!97354 #b00000000000000000000000000000000)))

(declare-fun lt!97352 () Unit!5886)

(assert (=> b!195697 (= lt!97352 lt!97353)))

(declare-fun res!92310 () Bool)

(declare-datatypes ((SeekEntryResult!701 0))(
  ( (MissingZero!701 (index!4974 (_ BitVec 32))) (Found!701 (index!4975 (_ BitVec 32))) (Intermediate!701 (undefined!1513 Bool) (index!4976 (_ BitVec 32)) (x!20801 (_ BitVec 32))) (Undefined!701) (MissingVacant!701 (index!4977 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8277 (_ BitVec 32)) SeekEntryResult!701)

(assert (=> b!195697 (= res!92310 (= (seekEntryOrOpen!0 (select (arr!3892 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!701 #b00000000000000000000000000000000)))))

(assert (=> b!195697 (=> (not res!92310) (not e!128801))))

(declare-fun d!57391 () Bool)

(declare-fun res!92309 () Bool)

(assert (=> d!57391 (=> res!92309 e!128803)))

(assert (=> d!57391 (= res!92309 (bvsge #b00000000000000000000000000000000 (size!4218 _keys!825)))))

(assert (=> d!57391 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!128803)))

(assert (= (and d!57391 (not res!92309)) b!195695))

(assert (= (and b!195695 c!35400) b!195697))

(assert (= (and b!195695 (not c!35400)) b!195696))

(assert (= (and b!195697 res!92310) b!195694))

(assert (= (or b!195694 b!195696) bm!19740))

(declare-fun m!222715 () Bool)

(assert (=> b!195695 m!222715))

(assert (=> b!195695 m!222715))

(declare-fun m!222717 () Bool)

(assert (=> b!195695 m!222717))

(declare-fun m!222719 () Bool)

(assert (=> bm!19740 m!222719))

(assert (=> b!195697 m!222715))

(declare-fun m!222721 () Bool)

(assert (=> b!195697 m!222721))

(declare-fun m!222723 () Bool)

(assert (=> b!195697 m!222723))

(assert (=> b!195697 m!222715))

(declare-fun m!222725 () Bool)

(assert (=> b!195697 m!222725))

(assert (=> b!195647 d!57391))

(declare-fun b!195705 () Bool)

(declare-fun e!128808 () Bool)

(assert (=> b!195705 (= e!128808 tp_is_empty!4519)))

(declare-fun condMapEmpty!7844 () Bool)

(declare-fun mapDefault!7844 () ValueCell!1916)

(assert (=> mapNonEmpty!7835 (= condMapEmpty!7844 (= mapRest!7835 ((as const (Array (_ BitVec 32) ValueCell!1916)) mapDefault!7844)))))

(declare-fun mapRes!7844 () Bool)

(assert (=> mapNonEmpty!7835 (= tp!17123 (and e!128808 mapRes!7844))))

(declare-fun mapIsEmpty!7844 () Bool)

(assert (=> mapIsEmpty!7844 mapRes!7844))

(declare-fun b!195704 () Bool)

(declare-fun e!128809 () Bool)

(assert (=> b!195704 (= e!128809 tp_is_empty!4519)))

(declare-fun mapNonEmpty!7844 () Bool)

(declare-fun tp!17132 () Bool)

(assert (=> mapNonEmpty!7844 (= mapRes!7844 (and tp!17132 e!128809))))

(declare-fun mapValue!7844 () ValueCell!1916)

(declare-fun mapKey!7844 () (_ BitVec 32))

(declare-fun mapRest!7844 () (Array (_ BitVec 32) ValueCell!1916))

(assert (=> mapNonEmpty!7844 (= mapRest!7835 (store mapRest!7844 mapKey!7844 mapValue!7844))))

(assert (= (and mapNonEmpty!7835 condMapEmpty!7844) mapIsEmpty!7844))

(assert (= (and mapNonEmpty!7835 (not condMapEmpty!7844)) mapNonEmpty!7844))

(assert (= (and mapNonEmpty!7844 ((_ is ValueCellFull!1916) mapValue!7844)) b!195704))

(assert (= (and mapNonEmpty!7835 ((_ is ValueCellFull!1916) mapDefault!7844)) b!195705))

(declare-fun m!222727 () Bool)

(assert (=> mapNonEmpty!7844 m!222727))

(check-sat tp_is_empty!4519 (not mapNonEmpty!7844) (not b!195697) (not bm!19740) (not b!195695))
(check-sat)
