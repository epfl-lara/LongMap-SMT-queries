; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77392 () Bool)

(assert start!77392)

(declare-fun mapIsEmpty!29371 () Bool)

(declare-fun mapRes!29371 () Bool)

(assert (=> mapIsEmpty!29371 mapRes!29371))

(declare-fun b!902138 () Bool)

(declare-fun res!608854 () Bool)

(declare-fun e!505217 () Bool)

(assert (=> b!902138 (=> (not res!608854) (not e!505217))))

(declare-datatypes ((V!29559 0))(
  ( (V!29560 (val!9273 Int)) )
))
(declare-datatypes ((ValueCell!8741 0))(
  ( (ValueCellFull!8741 (v!11776 V!29559)) (EmptyCell!8741) )
))
(declare-datatypes ((array!52933 0))(
  ( (array!52934 (arr!25429 (Array (_ BitVec 32) ValueCell!8741)) (size!25890 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!52933)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!52935 0))(
  ( (array!52936 (arr!25430 (Array (_ BitVec 32) (_ BitVec 64))) (size!25891 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!52935)

(assert (=> b!902138 (= res!608854 (and (= (size!25890 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25891 _keys!1386) (size!25890 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!902139 () Bool)

(declare-fun res!608856 () Bool)

(assert (=> b!902139 (=> (not res!608856) (not e!505217))))

(assert (=> b!902139 (= res!608856 (and (bvsle #b00000000000000000000000000000000 (size!25891 _keys!1386)) (bvslt (size!25891 _keys!1386) #b01111111111111111111111111111111)))))

(declare-fun b!902140 () Bool)

(declare-fun e!505221 () Bool)

(declare-fun e!505219 () Bool)

(assert (=> b!902140 (= e!505221 (and e!505219 mapRes!29371))))

(declare-fun condMapEmpty!29371 () Bool)

(declare-fun mapDefault!29371 () ValueCell!8741)

(assert (=> b!902140 (= condMapEmpty!29371 (= (arr!25429 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8741)) mapDefault!29371)))))

(declare-fun b!902137 () Bool)

(declare-fun tp_is_empty!18445 () Bool)

(assert (=> b!902137 (= e!505219 tp_is_empty!18445)))

(declare-fun res!608855 () Bool)

(assert (=> start!77392 (=> (not res!608855) (not e!505217))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77392 (= res!608855 (validMask!0 mask!1756))))

(assert (=> start!77392 e!505217))

(assert (=> start!77392 true))

(declare-fun array_inv!19998 (array!52933) Bool)

(assert (=> start!77392 (and (array_inv!19998 _values!1152) e!505221)))

(declare-fun array_inv!19999 (array!52935) Bool)

(assert (=> start!77392 (array_inv!19999 _keys!1386)))

(declare-fun b!902141 () Bool)

(declare-datatypes ((List!17895 0))(
  ( (Nil!17892) (Cons!17891 (h!19037 (_ BitVec 64)) (t!25269 List!17895)) )
))
(declare-fun noDuplicate!1329 (List!17895) Bool)

(assert (=> b!902141 (= e!505217 (not (noDuplicate!1329 Nil!17892)))))

(declare-fun b!902142 () Bool)

(declare-fun e!505220 () Bool)

(assert (=> b!902142 (= e!505220 tp_is_empty!18445)))

(declare-fun mapNonEmpty!29371 () Bool)

(declare-fun tp!56431 () Bool)

(assert (=> mapNonEmpty!29371 (= mapRes!29371 (and tp!56431 e!505220))))

(declare-fun mapValue!29371 () ValueCell!8741)

(declare-fun mapRest!29371 () (Array (_ BitVec 32) ValueCell!8741))

(declare-fun mapKey!29371 () (_ BitVec 32))

(assert (=> mapNonEmpty!29371 (= (arr!25429 _values!1152) (store mapRest!29371 mapKey!29371 mapValue!29371))))

(declare-fun b!902143 () Bool)

(declare-fun res!608857 () Bool)

(assert (=> b!902143 (=> (not res!608857) (not e!505217))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52935 (_ BitVec 32)) Bool)

(assert (=> b!902143 (= res!608857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(assert (= (and start!77392 res!608855) b!902138))

(assert (= (and b!902138 res!608854) b!902143))

(assert (= (and b!902143 res!608857) b!902139))

(assert (= (and b!902139 res!608856) b!902141))

(assert (= (and b!902140 condMapEmpty!29371) mapIsEmpty!29371))

(assert (= (and b!902140 (not condMapEmpty!29371)) mapNonEmpty!29371))

(get-info :version)

(assert (= (and mapNonEmpty!29371 ((_ is ValueCellFull!8741) mapValue!29371)) b!902142))

(assert (= (and b!902140 ((_ is ValueCellFull!8741) mapDefault!29371)) b!902137))

(assert (= start!77392 b!902140))

(declare-fun m!837643 () Bool)

(assert (=> start!77392 m!837643))

(declare-fun m!837645 () Bool)

(assert (=> start!77392 m!837645))

(declare-fun m!837647 () Bool)

(assert (=> start!77392 m!837647))

(declare-fun m!837649 () Bool)

(assert (=> b!902141 m!837649))

(declare-fun m!837651 () Bool)

(assert (=> mapNonEmpty!29371 m!837651))

(declare-fun m!837653 () Bool)

(assert (=> b!902143 m!837653))

(check-sat (not b!902143) (not mapNonEmpty!29371) (not b!902141) tp_is_empty!18445 (not start!77392))
(check-sat)
(get-model)

(declare-fun d!111751 () Bool)

(assert (=> d!111751 (= (validMask!0 mask!1756) (and (or (= mask!1756 #b00000000000000000000000000000111) (= mask!1756 #b00000000000000000000000000001111) (= mask!1756 #b00000000000000000000000000011111) (= mask!1756 #b00000000000000000000000000111111) (= mask!1756 #b00000000000000000000000001111111) (= mask!1756 #b00000000000000000000000011111111) (= mask!1756 #b00000000000000000000000111111111) (= mask!1756 #b00000000000000000000001111111111) (= mask!1756 #b00000000000000000000011111111111) (= mask!1756 #b00000000000000000000111111111111) (= mask!1756 #b00000000000000000001111111111111) (= mask!1756 #b00000000000000000011111111111111) (= mask!1756 #b00000000000000000111111111111111) (= mask!1756 #b00000000000000001111111111111111) (= mask!1756 #b00000000000000011111111111111111) (= mask!1756 #b00000000000000111111111111111111) (= mask!1756 #b00000000000001111111111111111111) (= mask!1756 #b00000000000011111111111111111111) (= mask!1756 #b00000000000111111111111111111111) (= mask!1756 #b00000000001111111111111111111111) (= mask!1756 #b00000000011111111111111111111111) (= mask!1756 #b00000000111111111111111111111111) (= mask!1756 #b00000001111111111111111111111111) (= mask!1756 #b00000011111111111111111111111111) (= mask!1756 #b00000111111111111111111111111111) (= mask!1756 #b00001111111111111111111111111111) (= mask!1756 #b00011111111111111111111111111111) (= mask!1756 #b00111111111111111111111111111111)) (bvsle mask!1756 #b00111111111111111111111111111111)))))

(assert (=> start!77392 d!111751))

(declare-fun d!111753 () Bool)

(assert (=> d!111753 (= (array_inv!19998 _values!1152) (bvsge (size!25890 _values!1152) #b00000000000000000000000000000000))))

(assert (=> start!77392 d!111753))

(declare-fun d!111755 () Bool)

(assert (=> d!111755 (= (array_inv!19999 _keys!1386) (bvsge (size!25891 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> start!77392 d!111755))

(declare-fun d!111757 () Bool)

(declare-fun res!608886 () Bool)

(declare-fun e!505256 () Bool)

(assert (=> d!111757 (=> res!608886 e!505256)))

(assert (=> d!111757 (= res!608886 ((_ is Nil!17892) Nil!17892))))

(assert (=> d!111757 (= (noDuplicate!1329 Nil!17892) e!505256)))

(declare-fun b!902190 () Bool)

(declare-fun e!505257 () Bool)

(assert (=> b!902190 (= e!505256 e!505257)))

(declare-fun res!608887 () Bool)

(assert (=> b!902190 (=> (not res!608887) (not e!505257))))

(declare-fun contains!4421 (List!17895 (_ BitVec 64)) Bool)

(assert (=> b!902190 (= res!608887 (not (contains!4421 (t!25269 Nil!17892) (h!19037 Nil!17892))))))

(declare-fun b!902191 () Bool)

(assert (=> b!902191 (= e!505257 (noDuplicate!1329 (t!25269 Nil!17892)))))

(assert (= (and d!111757 (not res!608886)) b!902190))

(assert (= (and b!902190 res!608887) b!902191))

(declare-fun m!837679 () Bool)

(assert (=> b!902190 m!837679))

(declare-fun m!837681 () Bool)

(assert (=> b!902191 m!837681))

(assert (=> b!902141 d!111757))

(declare-fun bm!40214 () Bool)

(declare-fun call!40217 () Bool)

(assert (=> bm!40214 (= call!40217 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(declare-fun b!902200 () Bool)

(declare-fun e!505266 () Bool)

(declare-fun e!505264 () Bool)

(assert (=> b!902200 (= e!505266 e!505264)))

(declare-fun lt!407627 () (_ BitVec 64))

(assert (=> b!902200 (= lt!407627 (select (arr!25430 _keys!1386) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30578 0))(
  ( (Unit!30579) )
))
(declare-fun lt!407626 () Unit!30578)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52935 (_ BitVec 64) (_ BitVec 32)) Unit!30578)

(assert (=> b!902200 (= lt!407626 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!407627 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!52935 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!902200 (arrayContainsKey!0 _keys!1386 lt!407627 #b00000000000000000000000000000000)))

(declare-fun lt!407628 () Unit!30578)

(assert (=> b!902200 (= lt!407628 lt!407626)))

(declare-fun res!608892 () Bool)

(declare-datatypes ((SeekEntryResult!8960 0))(
  ( (MissingZero!8960 (index!38211 (_ BitVec 32))) (Found!8960 (index!38212 (_ BitVec 32))) (Intermediate!8960 (undefined!9772 Bool) (index!38213 (_ BitVec 32)) (x!76916 (_ BitVec 32))) (Undefined!8960) (MissingVacant!8960 (index!38214 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52935 (_ BitVec 32)) SeekEntryResult!8960)

(assert (=> b!902200 (= res!608892 (= (seekEntryOrOpen!0 (select (arr!25430 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) (Found!8960 #b00000000000000000000000000000000)))))

(assert (=> b!902200 (=> (not res!608892) (not e!505264))))

(declare-fun d!111759 () Bool)

(declare-fun res!608893 () Bool)

(declare-fun e!505265 () Bool)

(assert (=> d!111759 (=> res!608893 e!505265)))

(assert (=> d!111759 (= res!608893 (bvsge #b00000000000000000000000000000000 (size!25891 _keys!1386)))))

(assert (=> d!111759 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756) e!505265)))

(declare-fun b!902201 () Bool)

(assert (=> b!902201 (= e!505265 e!505266)))

(declare-fun c!95574 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!902201 (= c!95574 (validKeyInArray!0 (select (arr!25430 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!902202 () Bool)

(assert (=> b!902202 (= e!505264 call!40217)))

(declare-fun b!902203 () Bool)

(assert (=> b!902203 (= e!505266 call!40217)))

(assert (= (and d!111759 (not res!608893)) b!902201))

(assert (= (and b!902201 c!95574) b!902200))

(assert (= (and b!902201 (not c!95574)) b!902203))

(assert (= (and b!902200 res!608892) b!902202))

(assert (= (or b!902202 b!902203) bm!40214))

(declare-fun m!837683 () Bool)

(assert (=> bm!40214 m!837683))

(declare-fun m!837685 () Bool)

(assert (=> b!902200 m!837685))

(declare-fun m!837687 () Bool)

(assert (=> b!902200 m!837687))

(declare-fun m!837689 () Bool)

(assert (=> b!902200 m!837689))

(assert (=> b!902200 m!837685))

(declare-fun m!837691 () Bool)

(assert (=> b!902200 m!837691))

(assert (=> b!902201 m!837685))

(assert (=> b!902201 m!837685))

(declare-fun m!837693 () Bool)

(assert (=> b!902201 m!837693))

(assert (=> b!902143 d!111759))

(declare-fun condMapEmpty!29380 () Bool)

(declare-fun mapDefault!29380 () ValueCell!8741)

(assert (=> mapNonEmpty!29371 (= condMapEmpty!29380 (= mapRest!29371 ((as const (Array (_ BitVec 32) ValueCell!8741)) mapDefault!29380)))))

(declare-fun e!505271 () Bool)

(declare-fun mapRes!29380 () Bool)

(assert (=> mapNonEmpty!29371 (= tp!56431 (and e!505271 mapRes!29380))))

(declare-fun b!902210 () Bool)

(declare-fun e!505272 () Bool)

(assert (=> b!902210 (= e!505272 tp_is_empty!18445)))

(declare-fun b!902211 () Bool)

(assert (=> b!902211 (= e!505271 tp_is_empty!18445)))

(declare-fun mapIsEmpty!29380 () Bool)

(assert (=> mapIsEmpty!29380 mapRes!29380))

(declare-fun mapNonEmpty!29380 () Bool)

(declare-fun tp!56440 () Bool)

(assert (=> mapNonEmpty!29380 (= mapRes!29380 (and tp!56440 e!505272))))

(declare-fun mapValue!29380 () ValueCell!8741)

(declare-fun mapRest!29380 () (Array (_ BitVec 32) ValueCell!8741))

(declare-fun mapKey!29380 () (_ BitVec 32))

(assert (=> mapNonEmpty!29380 (= mapRest!29371 (store mapRest!29380 mapKey!29380 mapValue!29380))))

(assert (= (and mapNonEmpty!29371 condMapEmpty!29380) mapIsEmpty!29380))

(assert (= (and mapNonEmpty!29371 (not condMapEmpty!29380)) mapNonEmpty!29380))

(assert (= (and mapNonEmpty!29380 ((_ is ValueCellFull!8741) mapValue!29380)) b!902210))

(assert (= (and mapNonEmpty!29371 ((_ is ValueCellFull!8741) mapDefault!29380)) b!902211))

(declare-fun m!837695 () Bool)

(assert (=> mapNonEmpty!29380 m!837695))

(check-sat (not b!902191) (not bm!40214) tp_is_empty!18445 (not b!902201) (not b!902190) (not mapNonEmpty!29380) (not b!902200))
(check-sat)
