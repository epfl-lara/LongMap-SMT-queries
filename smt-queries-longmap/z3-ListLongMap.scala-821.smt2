; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20014 () Bool)

(assert start!20014)

(declare-fun b!195887 () Bool)

(declare-fun e!128951 () Bool)

(declare-fun tp_is_empty!4537 () Bool)

(assert (=> b!195887 (= e!128951 tp_is_empty!4537)))

(declare-fun b!195888 () Bool)

(declare-fun res!92405 () Bool)

(declare-fun e!128952 () Bool)

(assert (=> b!195888 (=> (not res!92405) (not e!128952))))

(declare-datatypes ((array!8315 0))(
  ( (array!8316 (arr!3908 (Array (_ BitVec 32) (_ BitVec 64))) (size!4234 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8315)

(assert (=> b!195888 (= res!92405 (and (bvsle #b00000000000000000000000000000000 (size!4234 _keys!825)) (bvslt (size!4234 _keys!825) #b01111111111111111111111111111111)))))

(declare-fun b!195889 () Bool)

(declare-fun e!128948 () Bool)

(assert (=> b!195889 (= e!128948 tp_is_empty!4537)))

(declare-fun b!195890 () Bool)

(declare-fun e!128950 () Bool)

(declare-datatypes ((List!2436 0))(
  ( (Nil!2433) (Cons!2432 (h!3074 (_ BitVec 64)) (t!7358 List!2436)) )
))
(declare-fun contains!1364 (List!2436 (_ BitVec 64)) Bool)

(assert (=> b!195890 (= e!128950 (contains!1364 Nil!2433 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!7871 () Bool)

(declare-fun mapRes!7871 () Bool)

(assert (=> mapIsEmpty!7871 mapRes!7871))

(declare-fun b!195892 () Bool)

(declare-fun res!92406 () Bool)

(assert (=> b!195892 (=> (not res!92406) (not e!128952))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8315 (_ BitVec 32)) Bool)

(assert (=> b!195892 (= res!92406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!195893 () Bool)

(declare-fun res!92409 () Bool)

(assert (=> b!195893 (=> (not res!92409) (not e!128952))))

(declare-fun noDuplicate!60 (List!2436) Bool)

(assert (=> b!195893 (= res!92409 (noDuplicate!60 Nil!2433))))

(declare-fun b!195894 () Bool)

(assert (=> b!195894 (= e!128952 e!128950)))

(declare-fun res!92408 () Bool)

(assert (=> b!195894 (=> res!92408 e!128950)))

(assert (=> b!195894 (= res!92408 (contains!1364 Nil!2433 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!195895 () Bool)

(declare-fun e!128949 () Bool)

(assert (=> b!195895 (= e!128949 (and e!128951 mapRes!7871))))

(declare-fun condMapEmpty!7871 () Bool)

(declare-datatypes ((V!5697 0))(
  ( (V!5698 (val!2313 Int)) )
))
(declare-datatypes ((ValueCell!1925 0))(
  ( (ValueCellFull!1925 (v!4276 V!5697)) (EmptyCell!1925) )
))
(declare-datatypes ((array!8317 0))(
  ( (array!8318 (arr!3909 (Array (_ BitVec 32) ValueCell!1925)) (size!4235 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8317)

(declare-fun mapDefault!7871 () ValueCell!1925)

(assert (=> b!195895 (= condMapEmpty!7871 (= (arr!3909 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1925)) mapDefault!7871)))))

(declare-fun mapNonEmpty!7871 () Bool)

(declare-fun tp!17159 () Bool)

(assert (=> mapNonEmpty!7871 (= mapRes!7871 (and tp!17159 e!128948))))

(declare-fun mapValue!7871 () ValueCell!1925)

(declare-fun mapKey!7871 () (_ BitVec 32))

(declare-fun mapRest!7871 () (Array (_ BitVec 32) ValueCell!1925))

(assert (=> mapNonEmpty!7871 (= (arr!3909 _values!649) (store mapRest!7871 mapKey!7871 mapValue!7871))))

(declare-fun b!195891 () Bool)

(declare-fun res!92404 () Bool)

(assert (=> b!195891 (=> (not res!92404) (not e!128952))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!195891 (= res!92404 (and (= (size!4235 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4234 _keys!825) (size!4235 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!92407 () Bool)

(assert (=> start!20014 (=> (not res!92407) (not e!128952))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20014 (= res!92407 (validMask!0 mask!1149))))

(assert (=> start!20014 e!128952))

(assert (=> start!20014 true))

(declare-fun array_inv!2533 (array!8317) Bool)

(assert (=> start!20014 (and (array_inv!2533 _values!649) e!128949)))

(declare-fun array_inv!2534 (array!8315) Bool)

(assert (=> start!20014 (array_inv!2534 _keys!825)))

(assert (= (and start!20014 res!92407) b!195891))

(assert (= (and b!195891 res!92404) b!195892))

(assert (= (and b!195892 res!92406) b!195888))

(assert (= (and b!195888 res!92405) b!195893))

(assert (= (and b!195893 res!92409) b!195894))

(assert (= (and b!195894 (not res!92408)) b!195890))

(assert (= (and b!195895 condMapEmpty!7871) mapIsEmpty!7871))

(assert (= (and b!195895 (not condMapEmpty!7871)) mapNonEmpty!7871))

(get-info :version)

(assert (= (and mapNonEmpty!7871 ((_ is ValueCellFull!1925) mapValue!7871)) b!195889))

(assert (= (and b!195895 ((_ is ValueCellFull!1925) mapDefault!7871)) b!195887))

(assert (= start!20014 b!195895))

(declare-fun m!222827 () Bool)

(assert (=> start!20014 m!222827))

(declare-fun m!222829 () Bool)

(assert (=> start!20014 m!222829))

(declare-fun m!222831 () Bool)

(assert (=> start!20014 m!222831))

(declare-fun m!222833 () Bool)

(assert (=> b!195892 m!222833))

(declare-fun m!222835 () Bool)

(assert (=> b!195893 m!222835))

(declare-fun m!222837 () Bool)

(assert (=> b!195890 m!222837))

(declare-fun m!222839 () Bool)

(assert (=> mapNonEmpty!7871 m!222839))

(declare-fun m!222841 () Bool)

(assert (=> b!195894 m!222841))

(check-sat (not mapNonEmpty!7871) (not b!195892) (not b!195890) (not b!195894) tp_is_empty!4537 (not start!20014) (not b!195893))
(check-sat)
(get-model)

(declare-fun d!57417 () Bool)

(assert (=> d!57417 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!20014 d!57417))

(declare-fun d!57419 () Bool)

(assert (=> d!57419 (= (array_inv!2533 _values!649) (bvsge (size!4235 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!20014 d!57419))

(declare-fun d!57421 () Bool)

(assert (=> d!57421 (= (array_inv!2534 _keys!825) (bvsge (size!4234 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!20014 d!57421))

(declare-fun d!57423 () Bool)

(declare-fun lt!97375 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!157 (List!2436) (InoxSet (_ BitVec 64)))

(assert (=> d!57423 (= lt!97375 (select (content!157 Nil!2433) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!128994 () Bool)

(assert (=> d!57423 (= lt!97375 e!128994)))

(declare-fun res!92451 () Bool)

(assert (=> d!57423 (=> (not res!92451) (not e!128994))))

(assert (=> d!57423 (= res!92451 ((_ is Cons!2432) Nil!2433))))

(assert (=> d!57423 (= (contains!1364 Nil!2433 #b1000000000000000000000000000000000000000000000000000000000000000) lt!97375)))

(declare-fun b!195954 () Bool)

(declare-fun e!128995 () Bool)

(assert (=> b!195954 (= e!128994 e!128995)))

(declare-fun res!92450 () Bool)

(assert (=> b!195954 (=> res!92450 e!128995)))

(assert (=> b!195954 (= res!92450 (= (h!3074 Nil!2433) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!195955 () Bool)

(assert (=> b!195955 (= e!128995 (contains!1364 (t!7358 Nil!2433) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!57423 res!92451) b!195954))

(assert (= (and b!195954 (not res!92450)) b!195955))

(declare-fun m!222875 () Bool)

(assert (=> d!57423 m!222875))

(declare-fun m!222877 () Bool)

(assert (=> d!57423 m!222877))

(declare-fun m!222879 () Bool)

(assert (=> b!195955 m!222879))

(assert (=> b!195890 d!57423))

(declare-fun d!57425 () Bool)

(declare-fun res!92457 () Bool)

(declare-fun e!129004 () Bool)

(assert (=> d!57425 (=> res!92457 e!129004)))

(assert (=> d!57425 (= res!92457 (bvsge #b00000000000000000000000000000000 (size!4234 _keys!825)))))

(assert (=> d!57425 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!129004)))

(declare-fun b!195964 () Bool)

(declare-fun e!129003 () Bool)

(declare-fun call!19752 () Bool)

(assert (=> b!195964 (= e!129003 call!19752)))

(declare-fun b!195965 () Bool)

(declare-fun e!129002 () Bool)

(assert (=> b!195965 (= e!129004 e!129002)))

(declare-fun c!35409 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!195965 (= c!35409 (validKeyInArray!0 (select (arr!3908 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!195966 () Bool)

(assert (=> b!195966 (= e!129002 e!129003)))

(declare-fun lt!97384 () (_ BitVec 64))

(assert (=> b!195966 (= lt!97384 (select (arr!3908 _keys!825) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5892 0))(
  ( (Unit!5893) )
))
(declare-fun lt!97382 () Unit!5892)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8315 (_ BitVec 64) (_ BitVec 32)) Unit!5892)

(assert (=> b!195966 (= lt!97382 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!97384 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!8315 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!195966 (arrayContainsKey!0 _keys!825 lt!97384 #b00000000000000000000000000000000)))

(declare-fun lt!97383 () Unit!5892)

(assert (=> b!195966 (= lt!97383 lt!97382)))

(declare-fun res!92456 () Bool)

(declare-datatypes ((SeekEntryResult!704 0))(
  ( (MissingZero!704 (index!4986 (_ BitVec 32))) (Found!704 (index!4987 (_ BitVec 32))) (Intermediate!704 (undefined!1516 Bool) (index!4988 (_ BitVec 32)) (x!20834 (_ BitVec 32))) (Undefined!704) (MissingVacant!704 (index!4989 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8315 (_ BitVec 32)) SeekEntryResult!704)

(assert (=> b!195966 (= res!92456 (= (seekEntryOrOpen!0 (select (arr!3908 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!704 #b00000000000000000000000000000000)))))

(assert (=> b!195966 (=> (not res!92456) (not e!129003))))

(declare-fun b!195967 () Bool)

(assert (=> b!195967 (= e!129002 call!19752)))

(declare-fun bm!19749 () Bool)

(assert (=> bm!19749 (= call!19752 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(assert (= (and d!57425 (not res!92457)) b!195965))

(assert (= (and b!195965 c!35409) b!195966))

(assert (= (and b!195965 (not c!35409)) b!195967))

(assert (= (and b!195966 res!92456) b!195964))

(assert (= (or b!195964 b!195967) bm!19749))

(declare-fun m!222881 () Bool)

(assert (=> b!195965 m!222881))

(assert (=> b!195965 m!222881))

(declare-fun m!222883 () Bool)

(assert (=> b!195965 m!222883))

(assert (=> b!195966 m!222881))

(declare-fun m!222885 () Bool)

(assert (=> b!195966 m!222885))

(declare-fun m!222887 () Bool)

(assert (=> b!195966 m!222887))

(assert (=> b!195966 m!222881))

(declare-fun m!222889 () Bool)

(assert (=> b!195966 m!222889))

(declare-fun m!222891 () Bool)

(assert (=> bm!19749 m!222891))

(assert (=> b!195892 d!57425))

(declare-fun d!57427 () Bool)

(declare-fun res!92462 () Bool)

(declare-fun e!129009 () Bool)

(assert (=> d!57427 (=> res!92462 e!129009)))

(assert (=> d!57427 (= res!92462 ((_ is Nil!2433) Nil!2433))))

(assert (=> d!57427 (= (noDuplicate!60 Nil!2433) e!129009)))

(declare-fun b!195972 () Bool)

(declare-fun e!129010 () Bool)

(assert (=> b!195972 (= e!129009 e!129010)))

(declare-fun res!92463 () Bool)

(assert (=> b!195972 (=> (not res!92463) (not e!129010))))

(assert (=> b!195972 (= res!92463 (not (contains!1364 (t!7358 Nil!2433) (h!3074 Nil!2433))))))

(declare-fun b!195973 () Bool)

(assert (=> b!195973 (= e!129010 (noDuplicate!60 (t!7358 Nil!2433)))))

(assert (= (and d!57427 (not res!92462)) b!195972))

(assert (= (and b!195972 res!92463) b!195973))

(declare-fun m!222893 () Bool)

(assert (=> b!195972 m!222893))

(declare-fun m!222895 () Bool)

(assert (=> b!195973 m!222895))

(assert (=> b!195893 d!57427))

(declare-fun d!57429 () Bool)

(declare-fun lt!97385 () Bool)

(assert (=> d!57429 (= lt!97385 (select (content!157 Nil!2433) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!129011 () Bool)

(assert (=> d!57429 (= lt!97385 e!129011)))

(declare-fun res!92465 () Bool)

(assert (=> d!57429 (=> (not res!92465) (not e!129011))))

(assert (=> d!57429 (= res!92465 ((_ is Cons!2432) Nil!2433))))

(assert (=> d!57429 (= (contains!1364 Nil!2433 #b0000000000000000000000000000000000000000000000000000000000000000) lt!97385)))

(declare-fun b!195974 () Bool)

(declare-fun e!129012 () Bool)

(assert (=> b!195974 (= e!129011 e!129012)))

(declare-fun res!92464 () Bool)

(assert (=> b!195974 (=> res!92464 e!129012)))

(assert (=> b!195974 (= res!92464 (= (h!3074 Nil!2433) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!195975 () Bool)

(assert (=> b!195975 (= e!129012 (contains!1364 (t!7358 Nil!2433) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!57429 res!92465) b!195974))

(assert (= (and b!195974 (not res!92464)) b!195975))

(assert (=> d!57429 m!222875))

(declare-fun m!222897 () Bool)

(assert (=> d!57429 m!222897))

(declare-fun m!222899 () Bool)

(assert (=> b!195975 m!222899))

(assert (=> b!195894 d!57429))

(declare-fun condMapEmpty!7880 () Bool)

(declare-fun mapDefault!7880 () ValueCell!1925)

(assert (=> mapNonEmpty!7871 (= condMapEmpty!7880 (= mapRest!7871 ((as const (Array (_ BitVec 32) ValueCell!1925)) mapDefault!7880)))))

(declare-fun e!129018 () Bool)

(declare-fun mapRes!7880 () Bool)

(assert (=> mapNonEmpty!7871 (= tp!17159 (and e!129018 mapRes!7880))))

(declare-fun mapIsEmpty!7880 () Bool)

(assert (=> mapIsEmpty!7880 mapRes!7880))

(declare-fun b!195983 () Bool)

(assert (=> b!195983 (= e!129018 tp_is_empty!4537)))

(declare-fun b!195982 () Bool)

(declare-fun e!129017 () Bool)

(assert (=> b!195982 (= e!129017 tp_is_empty!4537)))

(declare-fun mapNonEmpty!7880 () Bool)

(declare-fun tp!17168 () Bool)

(assert (=> mapNonEmpty!7880 (= mapRes!7880 (and tp!17168 e!129017))))

(declare-fun mapRest!7880 () (Array (_ BitVec 32) ValueCell!1925))

(declare-fun mapValue!7880 () ValueCell!1925)

(declare-fun mapKey!7880 () (_ BitVec 32))

(assert (=> mapNonEmpty!7880 (= mapRest!7871 (store mapRest!7880 mapKey!7880 mapValue!7880))))

(assert (= (and mapNonEmpty!7871 condMapEmpty!7880) mapIsEmpty!7880))

(assert (= (and mapNonEmpty!7871 (not condMapEmpty!7880)) mapNonEmpty!7880))

(assert (= (and mapNonEmpty!7880 ((_ is ValueCellFull!1925) mapValue!7880)) b!195982))

(assert (= (and mapNonEmpty!7871 ((_ is ValueCellFull!1925) mapDefault!7880)) b!195983))

(declare-fun m!222901 () Bool)

(assert (=> mapNonEmpty!7880 m!222901))

(check-sat (not b!195973) (not mapNonEmpty!7880) tp_is_empty!4537 (not b!195966) (not b!195955) (not bm!19749) (not d!57423) (not b!195965) (not b!195975) (not d!57429) (not b!195972))
(check-sat)
