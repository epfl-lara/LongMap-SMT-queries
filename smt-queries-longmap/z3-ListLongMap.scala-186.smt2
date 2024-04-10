; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3708 () Bool)

(assert start!3708)

(declare-fun b!25920 () Bool)

(declare-fun e!16813 () Bool)

(declare-fun tp_is_empty!1059 () Bool)

(assert (=> b!25920 (= e!16813 tp_is_empty!1059)))

(declare-fun mapIsEmpty!1096 () Bool)

(declare-fun mapRes!1096 () Bool)

(assert (=> mapIsEmpty!1096 mapRes!1096))

(declare-fun b!25921 () Bool)

(declare-fun e!16811 () Bool)

(declare-fun e!16814 () Bool)

(assert (=> b!25921 (= e!16811 (and e!16814 mapRes!1096))))

(declare-fun condMapEmpty!1096 () Bool)

(declare-datatypes ((V!1237 0))(
  ( (V!1238 (val!556 Int)) )
))
(declare-datatypes ((ValueCell!330 0))(
  ( (ValueCellFull!330 (v!1641 V!1237)) (EmptyCell!330) )
))
(declare-datatypes ((array!1359 0))(
  ( (array!1360 (arr!640 (Array (_ BitVec 32) ValueCell!330)) (size!741 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1359)

(declare-fun mapDefault!1096 () ValueCell!330)

(assert (=> b!25921 (= condMapEmpty!1096 (= (arr!640 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!330)) mapDefault!1096)))))

(declare-fun b!25922 () Bool)

(declare-fun res!15420 () Bool)

(declare-fun e!16812 () Bool)

(assert (=> b!25922 (=> (not res!15420) (not e!16812))))

(declare-datatypes ((array!1361 0))(
  ( (array!1362 (arr!641 (Array (_ BitVec 32) (_ BitVec 64))) (size!742 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1361)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1361 (_ BitVec 32)) Bool)

(assert (=> b!25922 (= res!15420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!25923 () Bool)

(assert (=> b!25923 (= e!16814 tp_is_empty!1059)))

(declare-fun mapNonEmpty!1096 () Bool)

(declare-fun tp!3616 () Bool)

(assert (=> mapNonEmpty!1096 (= mapRes!1096 (and tp!3616 e!16813))))

(declare-fun mapKey!1096 () (_ BitVec 32))

(declare-fun mapValue!1096 () ValueCell!330)

(declare-fun mapRest!1096 () (Array (_ BitVec 32) ValueCell!330))

(assert (=> mapNonEmpty!1096 (= (arr!640 _values!1501) (store mapRest!1096 mapKey!1096 mapValue!1096))))

(declare-fun res!15419 () Bool)

(assert (=> start!3708 (=> (not res!15419) (not e!16812))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3708 (= res!15419 (validMask!0 mask!2294))))

(assert (=> start!3708 e!16812))

(assert (=> start!3708 true))

(declare-fun array_inv!431 (array!1359) Bool)

(assert (=> start!3708 (and (array_inv!431 _values!1501) e!16811)))

(declare-fun array_inv!432 (array!1361) Bool)

(assert (=> start!3708 (array_inv!432 _keys!1833)))

(declare-fun b!25924 () Bool)

(declare-fun res!15421 () Bool)

(assert (=> b!25924 (=> (not res!15421) (not e!16812))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!25924 (= res!15421 (and (= (size!741 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!742 _keys!1833) (size!741 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!25925 () Bool)

(assert (=> b!25925 (= e!16812 (and (bvsle #b00000000000000000000000000000000 (size!742 _keys!1833)) (bvsge (size!742 _keys!1833) #b01111111111111111111111111111111)))))

(assert (= (and start!3708 res!15419) b!25924))

(assert (= (and b!25924 res!15421) b!25922))

(assert (= (and b!25922 res!15420) b!25925))

(assert (= (and b!25921 condMapEmpty!1096) mapIsEmpty!1096))

(assert (= (and b!25921 (not condMapEmpty!1096)) mapNonEmpty!1096))

(get-info :version)

(assert (= (and mapNonEmpty!1096 ((_ is ValueCellFull!330) mapValue!1096)) b!25920))

(assert (= (and b!25921 ((_ is ValueCellFull!330) mapDefault!1096)) b!25923))

(assert (= start!3708 b!25921))

(declare-fun m!20877 () Bool)

(assert (=> b!25922 m!20877))

(declare-fun m!20879 () Bool)

(assert (=> mapNonEmpty!1096 m!20879))

(declare-fun m!20881 () Bool)

(assert (=> start!3708 m!20881))

(declare-fun m!20883 () Bool)

(assert (=> start!3708 m!20883))

(declare-fun m!20885 () Bool)

(assert (=> start!3708 m!20885))

(check-sat (not b!25922) (not start!3708) (not mapNonEmpty!1096) tp_is_empty!1059)
(check-sat)
(get-model)

(declare-fun b!25952 () Bool)

(declare-fun e!16838 () Bool)

(declare-fun call!2495 () Bool)

(assert (=> b!25952 (= e!16838 call!2495)))

(declare-fun b!25953 () Bool)

(declare-fun e!16837 () Bool)

(assert (=> b!25953 (= e!16837 e!16838)))

(declare-fun lt!10296 () (_ BitVec 64))

(assert (=> b!25953 (= lt!10296 (select (arr!641 _keys!1833) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!619 0))(
  ( (Unit!620) )
))
(declare-fun lt!10295 () Unit!619)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!1361 (_ BitVec 64) (_ BitVec 32)) Unit!619)

(assert (=> b!25953 (= lt!10295 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!10296 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!1361 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!25953 (arrayContainsKey!0 _keys!1833 lt!10296 #b00000000000000000000000000000000)))

(declare-fun lt!10297 () Unit!619)

(assert (=> b!25953 (= lt!10297 lt!10295)))

(declare-fun res!15436 () Bool)

(declare-datatypes ((SeekEntryResult!58 0))(
  ( (MissingZero!58 (index!2354 (_ BitVec 32))) (Found!58 (index!2355 (_ BitVec 32))) (Intermediate!58 (undefined!870 Bool) (index!2356 (_ BitVec 32)) (x!6052 (_ BitVec 32))) (Undefined!58) (MissingVacant!58 (index!2357 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1361 (_ BitVec 32)) SeekEntryResult!58)

(assert (=> b!25953 (= res!15436 (= (seekEntryOrOpen!0 (select (arr!641 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!58 #b00000000000000000000000000000000)))))

(assert (=> b!25953 (=> (not res!15436) (not e!16838))))

(declare-fun b!25954 () Bool)

(declare-fun e!16839 () Bool)

(assert (=> b!25954 (= e!16839 e!16837)))

(declare-fun c!3644 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!25954 (= c!3644 (validKeyInArray!0 (select (arr!641 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun bm!2492 () Bool)

(assert (=> bm!2492 (= call!2495 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun b!25955 () Bool)

(assert (=> b!25955 (= e!16837 call!2495)))

(declare-fun d!4841 () Bool)

(declare-fun res!15435 () Bool)

(assert (=> d!4841 (=> res!15435 e!16839)))

(assert (=> d!4841 (= res!15435 (bvsge #b00000000000000000000000000000000 (size!742 _keys!1833)))))

(assert (=> d!4841 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!16839)))

(assert (= (and d!4841 (not res!15435)) b!25954))

(assert (= (and b!25954 c!3644) b!25953))

(assert (= (and b!25954 (not c!3644)) b!25955))

(assert (= (and b!25953 res!15436) b!25952))

(assert (= (or b!25952 b!25955) bm!2492))

(declare-fun m!20897 () Bool)

(assert (=> b!25953 m!20897))

(declare-fun m!20899 () Bool)

(assert (=> b!25953 m!20899))

(declare-fun m!20901 () Bool)

(assert (=> b!25953 m!20901))

(assert (=> b!25953 m!20897))

(declare-fun m!20903 () Bool)

(assert (=> b!25953 m!20903))

(assert (=> b!25954 m!20897))

(assert (=> b!25954 m!20897))

(declare-fun m!20905 () Bool)

(assert (=> b!25954 m!20905))

(declare-fun m!20907 () Bool)

(assert (=> bm!2492 m!20907))

(assert (=> b!25922 d!4841))

(declare-fun d!4843 () Bool)

(assert (=> d!4843 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!3708 d!4843))

(declare-fun d!4845 () Bool)

(assert (=> d!4845 (= (array_inv!431 _values!1501) (bvsge (size!741 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!3708 d!4845))

(declare-fun d!4847 () Bool)

(assert (=> d!4847 (= (array_inv!432 _keys!1833) (bvsge (size!742 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!3708 d!4847))

(declare-fun mapIsEmpty!1102 () Bool)

(declare-fun mapRes!1102 () Bool)

(assert (=> mapIsEmpty!1102 mapRes!1102))

(declare-fun mapNonEmpty!1102 () Bool)

(declare-fun tp!3622 () Bool)

(declare-fun e!16845 () Bool)

(assert (=> mapNonEmpty!1102 (= mapRes!1102 (and tp!3622 e!16845))))

(declare-fun mapKey!1102 () (_ BitVec 32))

(declare-fun mapValue!1102 () ValueCell!330)

(declare-fun mapRest!1102 () (Array (_ BitVec 32) ValueCell!330))

(assert (=> mapNonEmpty!1102 (= mapRest!1096 (store mapRest!1102 mapKey!1102 mapValue!1102))))

(declare-fun condMapEmpty!1102 () Bool)

(declare-fun mapDefault!1102 () ValueCell!330)

(assert (=> mapNonEmpty!1096 (= condMapEmpty!1102 (= mapRest!1096 ((as const (Array (_ BitVec 32) ValueCell!330)) mapDefault!1102)))))

(declare-fun e!16844 () Bool)

(assert (=> mapNonEmpty!1096 (= tp!3616 (and e!16844 mapRes!1102))))

(declare-fun b!25963 () Bool)

(assert (=> b!25963 (= e!16844 tp_is_empty!1059)))

(declare-fun b!25962 () Bool)

(assert (=> b!25962 (= e!16845 tp_is_empty!1059)))

(assert (= (and mapNonEmpty!1096 condMapEmpty!1102) mapIsEmpty!1102))

(assert (= (and mapNonEmpty!1096 (not condMapEmpty!1102)) mapNonEmpty!1102))

(assert (= (and mapNonEmpty!1102 ((_ is ValueCellFull!330) mapValue!1102)) b!25962))

(assert (= (and mapNonEmpty!1096 ((_ is ValueCellFull!330) mapDefault!1102)) b!25963))

(declare-fun m!20909 () Bool)

(assert (=> mapNonEmpty!1102 m!20909))

(check-sat (not b!25954) (not bm!2492) (not mapNonEmpty!1102) (not b!25953) tp_is_empty!1059)
(check-sat)
