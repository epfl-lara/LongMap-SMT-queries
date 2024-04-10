; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19968 () Bool)

(assert start!19968)

(declare-fun res!92389 () Bool)

(declare-fun e!128879 () Bool)

(assert (=> start!19968 (=> (not res!92389) (not e!128879))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!19968 (= res!92389 (validMask!0 mask!1149))))

(assert (=> start!19968 e!128879))

(assert (=> start!19968 true))

(declare-datatypes ((V!5675 0))(
  ( (V!5676 (val!2305 Int)) )
))
(declare-datatypes ((ValueCell!1917 0))(
  ( (ValueCellFull!1917 (v!4274 V!5675)) (EmptyCell!1917) )
))
(declare-datatypes ((array!8299 0))(
  ( (array!8300 (arr!3904 (Array (_ BitVec 32) ValueCell!1917)) (size!4229 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8299)

(declare-fun e!128880 () Bool)

(declare-fun array_inv!2537 (array!8299) Bool)

(assert (=> start!19968 (and (array_inv!2537 _values!649) e!128880)))

(declare-datatypes ((array!8301 0))(
  ( (array!8302 (arr!3905 (Array (_ BitVec 32) (_ BitVec 64))) (size!4230 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8301)

(declare-fun array_inv!2538 (array!8301) Bool)

(assert (=> start!19968 (array_inv!2538 _keys!825)))

(declare-fun b!195809 () Bool)

(declare-fun res!92388 () Bool)

(assert (=> b!195809 (=> (not res!92388) (not e!128879))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8301 (_ BitVec 32)) Bool)

(assert (=> b!195809 (= res!92388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!195810 () Bool)

(declare-fun res!92390 () Bool)

(assert (=> b!195810 (=> (not res!92390) (not e!128879))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!195810 (= res!92390 (and (= (size!4229 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4230 _keys!825) (size!4229 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!195811 () Bool)

(assert (=> b!195811 (= e!128879 (bvsgt #b00000000000000000000000000000000 (size!4230 _keys!825)))))

(declare-fun b!195812 () Bool)

(declare-fun e!128877 () Bool)

(declare-fun mapRes!7838 () Bool)

(assert (=> b!195812 (= e!128880 (and e!128877 mapRes!7838))))

(declare-fun condMapEmpty!7838 () Bool)

(declare-fun mapDefault!7838 () ValueCell!1917)

(assert (=> b!195812 (= condMapEmpty!7838 (= (arr!3904 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1917)) mapDefault!7838)))))

(declare-fun mapNonEmpty!7838 () Bool)

(declare-fun tp!17126 () Bool)

(declare-fun e!128878 () Bool)

(assert (=> mapNonEmpty!7838 (= mapRes!7838 (and tp!17126 e!128878))))

(declare-fun mapValue!7838 () ValueCell!1917)

(declare-fun mapRest!7838 () (Array (_ BitVec 32) ValueCell!1917))

(declare-fun mapKey!7838 () (_ BitVec 32))

(assert (=> mapNonEmpty!7838 (= (arr!3904 _values!649) (store mapRest!7838 mapKey!7838 mapValue!7838))))

(declare-fun mapIsEmpty!7838 () Bool)

(assert (=> mapIsEmpty!7838 mapRes!7838))

(declare-fun b!195813 () Bool)

(declare-fun tp_is_empty!4521 () Bool)

(assert (=> b!195813 (= e!128878 tp_is_empty!4521)))

(declare-fun b!195814 () Bool)

(assert (=> b!195814 (= e!128877 tp_is_empty!4521)))

(assert (= (and start!19968 res!92389) b!195810))

(assert (= (and b!195810 res!92390) b!195809))

(assert (= (and b!195809 res!92388) b!195811))

(assert (= (and b!195812 condMapEmpty!7838) mapIsEmpty!7838))

(assert (= (and b!195812 (not condMapEmpty!7838)) mapNonEmpty!7838))

(get-info :version)

(assert (= (and mapNonEmpty!7838 ((_ is ValueCellFull!1917) mapValue!7838)) b!195813))

(assert (= (and b!195812 ((_ is ValueCellFull!1917) mapDefault!7838)) b!195814))

(assert (= start!19968 b!195812))

(declare-fun m!223311 () Bool)

(assert (=> start!19968 m!223311))

(declare-fun m!223313 () Bool)

(assert (=> start!19968 m!223313))

(declare-fun m!223315 () Bool)

(assert (=> start!19968 m!223315))

(declare-fun m!223317 () Bool)

(assert (=> b!195809 m!223317))

(declare-fun m!223319 () Bool)

(assert (=> mapNonEmpty!7838 m!223319))

(check-sat (not b!195809) (not start!19968) (not mapNonEmpty!7838) tp_is_empty!4521)
(check-sat)
(get-model)

(declare-fun d!57533 () Bool)

(declare-fun res!92404 () Bool)

(declare-fun e!128903 () Bool)

(assert (=> d!57533 (=> res!92404 e!128903)))

(assert (=> d!57533 (= res!92404 (bvsge #b00000000000000000000000000000000 (size!4230 _keys!825)))))

(assert (=> d!57533 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!128903)))

(declare-fun b!195841 () Bool)

(declare-fun e!128904 () Bool)

(declare-fun e!128902 () Bool)

(assert (=> b!195841 (= e!128904 e!128902)))

(declare-fun lt!97533 () (_ BitVec 64))

(assert (=> b!195841 (= lt!97533 (select (arr!3905 _keys!825) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5942 0))(
  ( (Unit!5943) )
))
(declare-fun lt!97535 () Unit!5942)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8301 (_ BitVec 64) (_ BitVec 32)) Unit!5942)

(assert (=> b!195841 (= lt!97535 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!97533 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!8301 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!195841 (arrayContainsKey!0 _keys!825 lt!97533 #b00000000000000000000000000000000)))

(declare-fun lt!97534 () Unit!5942)

(assert (=> b!195841 (= lt!97534 lt!97535)))

(declare-fun res!92405 () Bool)

(declare-datatypes ((SeekEntryResult!700 0))(
  ( (MissingZero!700 (index!4970 (_ BitVec 32))) (Found!700 (index!4971 (_ BitVec 32))) (Intermediate!700 (undefined!1512 Bool) (index!4972 (_ BitVec 32)) (x!20801 (_ BitVec 32))) (Undefined!700) (MissingVacant!700 (index!4973 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8301 (_ BitVec 32)) SeekEntryResult!700)

(assert (=> b!195841 (= res!92405 (= (seekEntryOrOpen!0 (select (arr!3905 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!700 #b00000000000000000000000000000000)))))

(assert (=> b!195841 (=> (not res!92405) (not e!128902))))

(declare-fun b!195842 () Bool)

(declare-fun call!19767 () Bool)

(assert (=> b!195842 (= e!128904 call!19767)))

(declare-fun bm!19764 () Bool)

(assert (=> bm!19764 (= call!19767 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(declare-fun b!195843 () Bool)

(assert (=> b!195843 (= e!128903 e!128904)))

(declare-fun c!35426 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!195843 (= c!35426 (validKeyInArray!0 (select (arr!3905 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!195844 () Bool)

(assert (=> b!195844 (= e!128902 call!19767)))

(assert (= (and d!57533 (not res!92404)) b!195843))

(assert (= (and b!195843 c!35426) b!195841))

(assert (= (and b!195843 (not c!35426)) b!195842))

(assert (= (and b!195841 res!92405) b!195844))

(assert (= (or b!195844 b!195842) bm!19764))

(declare-fun m!223331 () Bool)

(assert (=> b!195841 m!223331))

(declare-fun m!223333 () Bool)

(assert (=> b!195841 m!223333))

(declare-fun m!223335 () Bool)

(assert (=> b!195841 m!223335))

(assert (=> b!195841 m!223331))

(declare-fun m!223337 () Bool)

(assert (=> b!195841 m!223337))

(declare-fun m!223339 () Bool)

(assert (=> bm!19764 m!223339))

(assert (=> b!195843 m!223331))

(assert (=> b!195843 m!223331))

(declare-fun m!223341 () Bool)

(assert (=> b!195843 m!223341))

(assert (=> b!195809 d!57533))

(declare-fun d!57535 () Bool)

(assert (=> d!57535 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!19968 d!57535))

(declare-fun d!57537 () Bool)

(assert (=> d!57537 (= (array_inv!2537 _values!649) (bvsge (size!4229 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!19968 d!57537))

(declare-fun d!57539 () Bool)

(assert (=> d!57539 (= (array_inv!2538 _keys!825) (bvsge (size!4230 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!19968 d!57539))

(declare-fun mapNonEmpty!7844 () Bool)

(declare-fun mapRes!7844 () Bool)

(declare-fun tp!17132 () Bool)

(declare-fun e!128910 () Bool)

(assert (=> mapNonEmpty!7844 (= mapRes!7844 (and tp!17132 e!128910))))

(declare-fun mapValue!7844 () ValueCell!1917)

(declare-fun mapRest!7844 () (Array (_ BitVec 32) ValueCell!1917))

(declare-fun mapKey!7844 () (_ BitVec 32))

(assert (=> mapNonEmpty!7844 (= mapRest!7838 (store mapRest!7844 mapKey!7844 mapValue!7844))))

(declare-fun b!195852 () Bool)

(declare-fun e!128909 () Bool)

(assert (=> b!195852 (= e!128909 tp_is_empty!4521)))

(declare-fun condMapEmpty!7844 () Bool)

(declare-fun mapDefault!7844 () ValueCell!1917)

(assert (=> mapNonEmpty!7838 (= condMapEmpty!7844 (= mapRest!7838 ((as const (Array (_ BitVec 32) ValueCell!1917)) mapDefault!7844)))))

(assert (=> mapNonEmpty!7838 (= tp!17126 (and e!128909 mapRes!7844))))

(declare-fun mapIsEmpty!7844 () Bool)

(assert (=> mapIsEmpty!7844 mapRes!7844))

(declare-fun b!195851 () Bool)

(assert (=> b!195851 (= e!128910 tp_is_empty!4521)))

(assert (= (and mapNonEmpty!7838 condMapEmpty!7844) mapIsEmpty!7844))

(assert (= (and mapNonEmpty!7838 (not condMapEmpty!7844)) mapNonEmpty!7844))

(assert (= (and mapNonEmpty!7844 ((_ is ValueCellFull!1917) mapValue!7844)) b!195851))

(assert (= (and mapNonEmpty!7838 ((_ is ValueCellFull!1917) mapDefault!7844)) b!195852))

(declare-fun m!223343 () Bool)

(assert (=> mapNonEmpty!7844 m!223343))

(check-sat tp_is_empty!4521 (not bm!19764) (not mapNonEmpty!7844) (not b!195843) (not b!195841))
(check-sat)
