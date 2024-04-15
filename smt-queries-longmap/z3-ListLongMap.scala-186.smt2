; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3696 () Bool)

(assert start!3696)

(declare-fun b!25848 () Bool)

(declare-fun e!16757 () Bool)

(declare-fun tp_is_empty!1057 () Bool)

(assert (=> b!25848 (= e!16757 tp_is_empty!1057)))

(declare-fun b!25849 () Bool)

(declare-fun res!15378 () Bool)

(declare-fun e!16754 () Bool)

(assert (=> b!25849 (=> (not res!15378) (not e!16754))))

(declare-datatypes ((V!1235 0))(
  ( (V!1236 (val!555 Int)) )
))
(declare-datatypes ((ValueCell!329 0))(
  ( (ValueCellFull!329 (v!1639 V!1235)) (EmptyCell!329) )
))
(declare-datatypes ((array!1339 0))(
  ( (array!1340 (arr!630 (Array (_ BitVec 32) ValueCell!329)) (size!731 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1339)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-datatypes ((array!1341 0))(
  ( (array!1342 (arr!631 (Array (_ BitVec 32) (_ BitVec 64))) (size!732 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1341)

(assert (=> b!25849 (= res!15378 (and (= (size!731 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!732 _keys!1833) (size!731 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!25850 () Bool)

(declare-fun e!16753 () Bool)

(declare-fun mapRes!1093 () Bool)

(assert (=> b!25850 (= e!16753 (and e!16757 mapRes!1093))))

(declare-fun condMapEmpty!1093 () Bool)

(declare-fun mapDefault!1093 () ValueCell!329)

(assert (=> b!25850 (= condMapEmpty!1093 (= (arr!630 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!329)) mapDefault!1093)))))

(declare-fun b!25851 () Bool)

(assert (=> b!25851 (= e!16754 (and (bvsle #b00000000000000000000000000000000 (size!732 _keys!1833)) (bvsge (size!732 _keys!1833) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!1093 () Bool)

(assert (=> mapIsEmpty!1093 mapRes!1093))

(declare-fun mapNonEmpty!1093 () Bool)

(declare-fun tp!3613 () Bool)

(declare-fun e!16755 () Bool)

(assert (=> mapNonEmpty!1093 (= mapRes!1093 (and tp!3613 e!16755))))

(declare-fun mapKey!1093 () (_ BitVec 32))

(declare-fun mapValue!1093 () ValueCell!329)

(declare-fun mapRest!1093 () (Array (_ BitVec 32) ValueCell!329))

(assert (=> mapNonEmpty!1093 (= (arr!630 _values!1501) (store mapRest!1093 mapKey!1093 mapValue!1093))))

(declare-fun res!15380 () Bool)

(assert (=> start!3696 (=> (not res!15380) (not e!16754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3696 (= res!15380 (validMask!0 mask!2294))))

(assert (=> start!3696 e!16754))

(assert (=> start!3696 true))

(declare-fun array_inv!445 (array!1339) Bool)

(assert (=> start!3696 (and (array_inv!445 _values!1501) e!16753)))

(declare-fun array_inv!446 (array!1341) Bool)

(assert (=> start!3696 (array_inv!446 _keys!1833)))

(declare-fun b!25852 () Bool)

(declare-fun res!15379 () Bool)

(assert (=> b!25852 (=> (not res!15379) (not e!16754))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1341 (_ BitVec 32)) Bool)

(assert (=> b!25852 (= res!15379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!25853 () Bool)

(assert (=> b!25853 (= e!16755 tp_is_empty!1057)))

(assert (= (and start!3696 res!15380) b!25849))

(assert (= (and b!25849 res!15378) b!25852))

(assert (= (and b!25852 res!15379) b!25851))

(assert (= (and b!25850 condMapEmpty!1093) mapIsEmpty!1093))

(assert (= (and b!25850 (not condMapEmpty!1093)) mapNonEmpty!1093))

(get-info :version)

(assert (= (and mapNonEmpty!1093 ((_ is ValueCellFull!329) mapValue!1093)) b!25853))

(assert (= (and b!25850 ((_ is ValueCellFull!329) mapDefault!1093)) b!25848))

(assert (= start!3696 b!25850))

(declare-fun m!20797 () Bool)

(assert (=> mapNonEmpty!1093 m!20797))

(declare-fun m!20799 () Bool)

(assert (=> start!3696 m!20799))

(declare-fun m!20801 () Bool)

(assert (=> start!3696 m!20801))

(declare-fun m!20803 () Bool)

(assert (=> start!3696 m!20803))

(declare-fun m!20805 () Bool)

(assert (=> b!25852 m!20805))

(check-sat (not start!3696) (not b!25852) (not mapNonEmpty!1093) tp_is_empty!1057)
(check-sat)
(get-model)

(declare-fun d!4803 () Bool)

(assert (=> d!4803 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!3696 d!4803))

(declare-fun d!4805 () Bool)

(assert (=> d!4805 (= (array_inv!445 _values!1501) (bvsge (size!731 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!3696 d!4805))

(declare-fun d!4807 () Bool)

(assert (=> d!4807 (= (array_inv!446 _keys!1833) (bvsge (size!732 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!3696 d!4807))

(declare-fun b!25898 () Bool)

(declare-fun e!16796 () Bool)

(declare-fun e!16795 () Bool)

(assert (=> b!25898 (= e!16796 e!16795)))

(declare-fun lt!10291 () (_ BitVec 64))

(assert (=> b!25898 (= lt!10291 (select (arr!631 _keys!1833) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!626 0))(
  ( (Unit!627) )
))
(declare-fun lt!10293 () Unit!626)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!1341 (_ BitVec 64) (_ BitVec 32)) Unit!626)

(assert (=> b!25898 (= lt!10293 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!10291 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!1341 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!25898 (arrayContainsKey!0 _keys!1833 lt!10291 #b00000000000000000000000000000000)))

(declare-fun lt!10292 () Unit!626)

(assert (=> b!25898 (= lt!10292 lt!10293)))

(declare-fun res!15403 () Bool)

(declare-datatypes ((SeekEntryResult!59 0))(
  ( (MissingZero!59 (index!2358 (_ BitVec 32))) (Found!59 (index!2359 (_ BitVec 32))) (Intermediate!59 (undefined!871 Bool) (index!2360 (_ BitVec 32)) (x!6053 (_ BitVec 32))) (Undefined!59) (MissingVacant!59 (index!2361 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1341 (_ BitVec 32)) SeekEntryResult!59)

(assert (=> b!25898 (= res!15403 (= (seekEntryOrOpen!0 (select (arr!631 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!59 #b00000000000000000000000000000000)))))

(assert (=> b!25898 (=> (not res!15403) (not e!16795))))

(declare-fun b!25899 () Bool)

(declare-fun call!2495 () Bool)

(assert (=> b!25899 (= e!16796 call!2495)))

(declare-fun b!25900 () Bool)

(assert (=> b!25900 (= e!16795 call!2495)))

(declare-fun b!25901 () Bool)

(declare-fun e!16794 () Bool)

(assert (=> b!25901 (= e!16794 e!16796)))

(declare-fun c!3633 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!25901 (= c!3633 (validKeyInArray!0 (select (arr!631 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun bm!2492 () Bool)

(assert (=> bm!2492 (= call!2495 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun d!4809 () Bool)

(declare-fun res!15404 () Bool)

(assert (=> d!4809 (=> res!15404 e!16794)))

(assert (=> d!4809 (= res!15404 (bvsge #b00000000000000000000000000000000 (size!732 _keys!1833)))))

(assert (=> d!4809 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!16794)))

(assert (= (and d!4809 (not res!15404)) b!25901))

(assert (= (and b!25901 c!3633) b!25898))

(assert (= (and b!25901 (not c!3633)) b!25899))

(assert (= (and b!25898 res!15403) b!25900))

(assert (= (or b!25900 b!25899) bm!2492))

(declare-fun m!20827 () Bool)

(assert (=> b!25898 m!20827))

(declare-fun m!20829 () Bool)

(assert (=> b!25898 m!20829))

(declare-fun m!20831 () Bool)

(assert (=> b!25898 m!20831))

(assert (=> b!25898 m!20827))

(declare-fun m!20833 () Bool)

(assert (=> b!25898 m!20833))

(assert (=> b!25901 m!20827))

(assert (=> b!25901 m!20827))

(declare-fun m!20835 () Bool)

(assert (=> b!25901 m!20835))

(declare-fun m!20837 () Bool)

(assert (=> bm!2492 m!20837))

(assert (=> b!25852 d!4809))

(declare-fun condMapEmpty!1102 () Bool)

(declare-fun mapDefault!1102 () ValueCell!329)

(assert (=> mapNonEmpty!1093 (= condMapEmpty!1102 (= mapRest!1093 ((as const (Array (_ BitVec 32) ValueCell!329)) mapDefault!1102)))))

(declare-fun e!16801 () Bool)

(declare-fun mapRes!1102 () Bool)

(assert (=> mapNonEmpty!1093 (= tp!3613 (and e!16801 mapRes!1102))))

(declare-fun mapIsEmpty!1102 () Bool)

(assert (=> mapIsEmpty!1102 mapRes!1102))

(declare-fun b!25908 () Bool)

(declare-fun e!16802 () Bool)

(assert (=> b!25908 (= e!16802 tp_is_empty!1057)))

(declare-fun mapNonEmpty!1102 () Bool)

(declare-fun tp!3622 () Bool)

(assert (=> mapNonEmpty!1102 (= mapRes!1102 (and tp!3622 e!16802))))

(declare-fun mapRest!1102 () (Array (_ BitVec 32) ValueCell!329))

(declare-fun mapKey!1102 () (_ BitVec 32))

(declare-fun mapValue!1102 () ValueCell!329)

(assert (=> mapNonEmpty!1102 (= mapRest!1093 (store mapRest!1102 mapKey!1102 mapValue!1102))))

(declare-fun b!25909 () Bool)

(assert (=> b!25909 (= e!16801 tp_is_empty!1057)))

(assert (= (and mapNonEmpty!1093 condMapEmpty!1102) mapIsEmpty!1102))

(assert (= (and mapNonEmpty!1093 (not condMapEmpty!1102)) mapNonEmpty!1102))

(assert (= (and mapNonEmpty!1102 ((_ is ValueCellFull!329) mapValue!1102)) b!25908))

(assert (= (and mapNonEmpty!1093 ((_ is ValueCellFull!329) mapDefault!1102)) b!25909))

(declare-fun m!20839 () Bool)

(assert (=> mapNonEmpty!1102 m!20839))

(check-sat (not b!25901) tp_is_empty!1057 (not b!25898) (not mapNonEmpty!1102) (not bm!2492))
(check-sat)
