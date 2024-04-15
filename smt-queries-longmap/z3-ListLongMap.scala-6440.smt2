; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82450 () Bool)

(assert start!82450)

(declare-fun b!961004 () Bool)

(declare-fun res!643253 () Bool)

(declare-fun e!541800 () Bool)

(assert (=> b!961004 (=> (not res!643253) (not e!541800))))

(declare-datatypes ((array!58860 0))(
  ( (array!58861 (arr!28300 (Array (_ BitVec 32) (_ BitVec 64))) (size!28781 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58860)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58860 (_ BitVec 32)) Bool)

(assert (=> b!961004 (= res!643253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!961005 () Bool)

(declare-fun e!541802 () Bool)

(declare-fun tp_is_empty!21415 () Bool)

(assert (=> b!961005 (= e!541802 tp_is_empty!21415)))

(declare-fun b!961006 () Bool)

(declare-fun e!541797 () Bool)

(assert (=> b!961006 (= e!541797 tp_is_empty!21415)))

(declare-fun res!643254 () Bool)

(assert (=> start!82450 (=> (not res!643254) (not e!541800))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82450 (= res!643254 (validMask!0 mask!2110))))

(assert (=> start!82450 e!541800))

(assert (=> start!82450 true))

(declare-datatypes ((V!33537 0))(
  ( (V!33538 (val!10758 Int)) )
))
(declare-datatypes ((ValueCell!10226 0))(
  ( (ValueCellFull!10226 (v!13314 V!33537)) (EmptyCell!10226) )
))
(declare-datatypes ((array!58862 0))(
  ( (array!58863 (arr!28301 (Array (_ BitVec 32) ValueCell!10226)) (size!28782 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58862)

(declare-fun e!541799 () Bool)

(declare-fun array_inv!21983 (array!58862) Bool)

(assert (=> start!82450 (and (array_inv!21983 _values!1400) e!541799)))

(declare-fun array_inv!21984 (array!58860) Bool)

(assert (=> start!82450 (array_inv!21984 _keys!1686)))

(declare-fun b!961007 () Bool)

(declare-fun res!643252 () Bool)

(assert (=> b!961007 (=> (not res!643252) (not e!541800))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!961007 (= res!643252 (and (= (size!28782 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28781 _keys!1686) (size!28782 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!961008 () Bool)

(declare-fun res!643257 () Bool)

(assert (=> b!961008 (=> (not res!643257) (not e!541800))))

(declare-datatypes ((List!19697 0))(
  ( (Nil!19694) (Cons!19693 (h!20855 (_ BitVec 64)) (t!28051 List!19697)) )
))
(declare-fun noDuplicate!1377 (List!19697) Bool)

(assert (=> b!961008 (= res!643257 (noDuplicate!1377 Nil!19694))))

(declare-fun b!961009 () Bool)

(declare-fun e!541798 () Bool)

(assert (=> b!961009 (= e!541800 e!541798)))

(declare-fun res!643255 () Bool)

(assert (=> b!961009 (=> res!643255 e!541798)))

(declare-fun contains!5359 (List!19697 (_ BitVec 64)) Bool)

(assert (=> b!961009 (= res!643255 (contains!5359 Nil!19694 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!34114 () Bool)

(declare-fun mapRes!34114 () Bool)

(assert (=> mapIsEmpty!34114 mapRes!34114))

(declare-fun b!961010 () Bool)

(declare-fun res!643256 () Bool)

(assert (=> b!961010 (=> (not res!643256) (not e!541800))))

(assert (=> b!961010 (= res!643256 (and (bvsle #b00000000000000000000000000000000 (size!28781 _keys!1686)) (bvslt (size!28781 _keys!1686) #b01111111111111111111111111111111)))))

(declare-fun b!961011 () Bool)

(assert (=> b!961011 (= e!541799 (and e!541797 mapRes!34114))))

(declare-fun condMapEmpty!34114 () Bool)

(declare-fun mapDefault!34114 () ValueCell!10226)

(assert (=> b!961011 (= condMapEmpty!34114 (= (arr!28301 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10226)) mapDefault!34114)))))

(declare-fun b!961012 () Bool)

(assert (=> b!961012 (= e!541798 (contains!5359 Nil!19694 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!34114 () Bool)

(declare-fun tp!65044 () Bool)

(assert (=> mapNonEmpty!34114 (= mapRes!34114 (and tp!65044 e!541802))))

(declare-fun mapRest!34114 () (Array (_ BitVec 32) ValueCell!10226))

(declare-fun mapKey!34114 () (_ BitVec 32))

(declare-fun mapValue!34114 () ValueCell!10226)

(assert (=> mapNonEmpty!34114 (= (arr!28301 _values!1400) (store mapRest!34114 mapKey!34114 mapValue!34114))))

(assert (= (and start!82450 res!643254) b!961007))

(assert (= (and b!961007 res!643252) b!961004))

(assert (= (and b!961004 res!643253) b!961010))

(assert (= (and b!961010 res!643256) b!961008))

(assert (= (and b!961008 res!643257) b!961009))

(assert (= (and b!961009 (not res!643255)) b!961012))

(assert (= (and b!961011 condMapEmpty!34114) mapIsEmpty!34114))

(assert (= (and b!961011 (not condMapEmpty!34114)) mapNonEmpty!34114))

(get-info :version)

(assert (= (and mapNonEmpty!34114 ((_ is ValueCellFull!10226) mapValue!34114)) b!961005))

(assert (= (and b!961011 ((_ is ValueCellFull!10226) mapDefault!34114)) b!961006))

(assert (= start!82450 b!961011))

(declare-fun m!890499 () Bool)

(assert (=> b!961009 m!890499))

(declare-fun m!890501 () Bool)

(assert (=> start!82450 m!890501))

(declare-fun m!890503 () Bool)

(assert (=> start!82450 m!890503))

(declare-fun m!890505 () Bool)

(assert (=> start!82450 m!890505))

(declare-fun m!890507 () Bool)

(assert (=> b!961004 m!890507))

(declare-fun m!890509 () Bool)

(assert (=> b!961012 m!890509))

(declare-fun m!890511 () Bool)

(assert (=> b!961008 m!890511))

(declare-fun m!890513 () Bool)

(assert (=> mapNonEmpty!34114 m!890513))

(check-sat (not b!961008) (not start!82450) (not b!961009) (not b!961012) (not b!961004) (not mapNonEmpty!34114) tp_is_empty!21415)
(check-sat)
(get-model)

(declare-fun d!115855 () Bool)

(declare-fun res!643298 () Bool)

(declare-fun e!541843 () Bool)

(assert (=> d!115855 (=> res!643298 e!541843)))

(assert (=> d!115855 (= res!643298 ((_ is Nil!19694) Nil!19694))))

(assert (=> d!115855 (= (noDuplicate!1377 Nil!19694) e!541843)))

(declare-fun b!961071 () Bool)

(declare-fun e!541844 () Bool)

(assert (=> b!961071 (= e!541843 e!541844)))

(declare-fun res!643299 () Bool)

(assert (=> b!961071 (=> (not res!643299) (not e!541844))))

(assert (=> b!961071 (= res!643299 (not (contains!5359 (t!28051 Nil!19694) (h!20855 Nil!19694))))))

(declare-fun b!961072 () Bool)

(assert (=> b!961072 (= e!541844 (noDuplicate!1377 (t!28051 Nil!19694)))))

(assert (= (and d!115855 (not res!643298)) b!961071))

(assert (= (and b!961071 res!643299) b!961072))

(declare-fun m!890547 () Bool)

(assert (=> b!961071 m!890547))

(declare-fun m!890549 () Bool)

(assert (=> b!961072 m!890549))

(assert (=> b!961008 d!115855))

(declare-fun d!115857 () Bool)

(declare-fun lt!430492 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!412 (List!19697) (InoxSet (_ BitVec 64)))

(assert (=> d!115857 (= lt!430492 (select (content!412 Nil!19694) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!541850 () Bool)

(assert (=> d!115857 (= lt!430492 e!541850)))

(declare-fun res!643305 () Bool)

(assert (=> d!115857 (=> (not res!643305) (not e!541850))))

(assert (=> d!115857 (= res!643305 ((_ is Cons!19693) Nil!19694))))

(assert (=> d!115857 (= (contains!5359 Nil!19694 #b1000000000000000000000000000000000000000000000000000000000000000) lt!430492)))

(declare-fun b!961077 () Bool)

(declare-fun e!541849 () Bool)

(assert (=> b!961077 (= e!541850 e!541849)))

(declare-fun res!643304 () Bool)

(assert (=> b!961077 (=> res!643304 e!541849)))

(assert (=> b!961077 (= res!643304 (= (h!20855 Nil!19694) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!961078 () Bool)

(assert (=> b!961078 (= e!541849 (contains!5359 (t!28051 Nil!19694) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!115857 res!643305) b!961077))

(assert (= (and b!961077 (not res!643304)) b!961078))

(declare-fun m!890551 () Bool)

(assert (=> d!115857 m!890551))

(declare-fun m!890553 () Bool)

(assert (=> d!115857 m!890553))

(declare-fun m!890555 () Bool)

(assert (=> b!961078 m!890555))

(assert (=> b!961012 d!115857))

(declare-fun d!115859 () Bool)

(declare-fun res!643310 () Bool)

(declare-fun e!541857 () Bool)

(assert (=> d!115859 (=> res!643310 e!541857)))

(assert (=> d!115859 (= res!643310 (bvsge #b00000000000000000000000000000000 (size!28781 _keys!1686)))))

(assert (=> d!115859 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110) e!541857)))

(declare-fun b!961087 () Bool)

(declare-fun e!541858 () Bool)

(declare-fun e!541859 () Bool)

(assert (=> b!961087 (= e!541858 e!541859)))

(declare-fun lt!430500 () (_ BitVec 64))

(assert (=> b!961087 (= lt!430500 (select (arr!28300 _keys!1686) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32068 0))(
  ( (Unit!32069) )
))
(declare-fun lt!430501 () Unit!32068)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!58860 (_ BitVec 64) (_ BitVec 32)) Unit!32068)

(assert (=> b!961087 (= lt!430501 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1686 lt!430500 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!58860 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!961087 (arrayContainsKey!0 _keys!1686 lt!430500 #b00000000000000000000000000000000)))

(declare-fun lt!430499 () Unit!32068)

(assert (=> b!961087 (= lt!430499 lt!430501)))

(declare-fun res!643311 () Bool)

(declare-datatypes ((SeekEntryResult!9191 0))(
  ( (MissingZero!9191 (index!39135 (_ BitVec 32))) (Found!9191 (index!39136 (_ BitVec 32))) (Intermediate!9191 (undefined!10003 Bool) (index!39137 (_ BitVec 32)) (x!82930 (_ BitVec 32))) (Undefined!9191) (MissingVacant!9191 (index!39138 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!58860 (_ BitVec 32)) SeekEntryResult!9191)

(assert (=> b!961087 (= res!643311 (= (seekEntryOrOpen!0 (select (arr!28300 _keys!1686) #b00000000000000000000000000000000) _keys!1686 mask!2110) (Found!9191 #b00000000000000000000000000000000)))))

(assert (=> b!961087 (=> (not res!643311) (not e!541859))))

(declare-fun b!961088 () Bool)

(assert (=> b!961088 (= e!541857 e!541858)))

(declare-fun c!99852 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!961088 (= c!99852 (validKeyInArray!0 (select (arr!28300 _keys!1686) #b00000000000000000000000000000000)))))

(declare-fun b!961089 () Bool)

(declare-fun call!41703 () Bool)

(assert (=> b!961089 (= e!541859 call!41703)))

(declare-fun bm!41700 () Bool)

(assert (=> bm!41700 (= call!41703 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1686 mask!2110))))

(declare-fun b!961090 () Bool)

(assert (=> b!961090 (= e!541858 call!41703)))

(assert (= (and d!115859 (not res!643310)) b!961088))

(assert (= (and b!961088 c!99852) b!961087))

(assert (= (and b!961088 (not c!99852)) b!961090))

(assert (= (and b!961087 res!643311) b!961089))

(assert (= (or b!961089 b!961090) bm!41700))

(declare-fun m!890557 () Bool)

(assert (=> b!961087 m!890557))

(declare-fun m!890559 () Bool)

(assert (=> b!961087 m!890559))

(declare-fun m!890561 () Bool)

(assert (=> b!961087 m!890561))

(assert (=> b!961087 m!890557))

(declare-fun m!890563 () Bool)

(assert (=> b!961087 m!890563))

(assert (=> b!961088 m!890557))

(assert (=> b!961088 m!890557))

(declare-fun m!890565 () Bool)

(assert (=> b!961088 m!890565))

(declare-fun m!890567 () Bool)

(assert (=> bm!41700 m!890567))

(assert (=> b!961004 d!115859))

(declare-fun d!115861 () Bool)

(declare-fun lt!430502 () Bool)

(assert (=> d!115861 (= lt!430502 (select (content!412 Nil!19694) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!541861 () Bool)

(assert (=> d!115861 (= lt!430502 e!541861)))

(declare-fun res!643313 () Bool)

(assert (=> d!115861 (=> (not res!643313) (not e!541861))))

(assert (=> d!115861 (= res!643313 ((_ is Cons!19693) Nil!19694))))

(assert (=> d!115861 (= (contains!5359 Nil!19694 #b0000000000000000000000000000000000000000000000000000000000000000) lt!430502)))

(declare-fun b!961091 () Bool)

(declare-fun e!541860 () Bool)

(assert (=> b!961091 (= e!541861 e!541860)))

(declare-fun res!643312 () Bool)

(assert (=> b!961091 (=> res!643312 e!541860)))

(assert (=> b!961091 (= res!643312 (= (h!20855 Nil!19694) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!961092 () Bool)

(assert (=> b!961092 (= e!541860 (contains!5359 (t!28051 Nil!19694) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!115861 res!643313) b!961091))

(assert (= (and b!961091 (not res!643312)) b!961092))

(assert (=> d!115861 m!890551))

(declare-fun m!890569 () Bool)

(assert (=> d!115861 m!890569))

(declare-fun m!890571 () Bool)

(assert (=> b!961092 m!890571))

(assert (=> b!961009 d!115861))

(declare-fun d!115863 () Bool)

(assert (=> d!115863 (= (validMask!0 mask!2110) (and (or (= mask!2110 #b00000000000000000000000000000111) (= mask!2110 #b00000000000000000000000000001111) (= mask!2110 #b00000000000000000000000000011111) (= mask!2110 #b00000000000000000000000000111111) (= mask!2110 #b00000000000000000000000001111111) (= mask!2110 #b00000000000000000000000011111111) (= mask!2110 #b00000000000000000000000111111111) (= mask!2110 #b00000000000000000000001111111111) (= mask!2110 #b00000000000000000000011111111111) (= mask!2110 #b00000000000000000000111111111111) (= mask!2110 #b00000000000000000001111111111111) (= mask!2110 #b00000000000000000011111111111111) (= mask!2110 #b00000000000000000111111111111111) (= mask!2110 #b00000000000000001111111111111111) (= mask!2110 #b00000000000000011111111111111111) (= mask!2110 #b00000000000000111111111111111111) (= mask!2110 #b00000000000001111111111111111111) (= mask!2110 #b00000000000011111111111111111111) (= mask!2110 #b00000000000111111111111111111111) (= mask!2110 #b00000000001111111111111111111111) (= mask!2110 #b00000000011111111111111111111111) (= mask!2110 #b00000000111111111111111111111111) (= mask!2110 #b00000001111111111111111111111111) (= mask!2110 #b00000011111111111111111111111111) (= mask!2110 #b00000111111111111111111111111111) (= mask!2110 #b00001111111111111111111111111111) (= mask!2110 #b00011111111111111111111111111111) (= mask!2110 #b00111111111111111111111111111111)) (bvsle mask!2110 #b00111111111111111111111111111111)))))

(assert (=> start!82450 d!115863))

(declare-fun d!115865 () Bool)

(assert (=> d!115865 (= (array_inv!21983 _values!1400) (bvsge (size!28782 _values!1400) #b00000000000000000000000000000000))))

(assert (=> start!82450 d!115865))

(declare-fun d!115867 () Bool)

(assert (=> d!115867 (= (array_inv!21984 _keys!1686) (bvsge (size!28781 _keys!1686) #b00000000000000000000000000000000))))

(assert (=> start!82450 d!115867))

(declare-fun mapNonEmpty!34123 () Bool)

(declare-fun mapRes!34123 () Bool)

(declare-fun tp!65053 () Bool)

(declare-fun e!541866 () Bool)

(assert (=> mapNonEmpty!34123 (= mapRes!34123 (and tp!65053 e!541866))))

(declare-fun mapKey!34123 () (_ BitVec 32))

(declare-fun mapValue!34123 () ValueCell!10226)

(declare-fun mapRest!34123 () (Array (_ BitVec 32) ValueCell!10226))

(assert (=> mapNonEmpty!34123 (= mapRest!34114 (store mapRest!34123 mapKey!34123 mapValue!34123))))

(declare-fun mapIsEmpty!34123 () Bool)

(assert (=> mapIsEmpty!34123 mapRes!34123))

(declare-fun condMapEmpty!34123 () Bool)

(declare-fun mapDefault!34123 () ValueCell!10226)

(assert (=> mapNonEmpty!34114 (= condMapEmpty!34123 (= mapRest!34114 ((as const (Array (_ BitVec 32) ValueCell!10226)) mapDefault!34123)))))

(declare-fun e!541867 () Bool)

(assert (=> mapNonEmpty!34114 (= tp!65044 (and e!541867 mapRes!34123))))

(declare-fun b!961100 () Bool)

(assert (=> b!961100 (= e!541867 tp_is_empty!21415)))

(declare-fun b!961099 () Bool)

(assert (=> b!961099 (= e!541866 tp_is_empty!21415)))

(assert (= (and mapNonEmpty!34114 condMapEmpty!34123) mapIsEmpty!34123))

(assert (= (and mapNonEmpty!34114 (not condMapEmpty!34123)) mapNonEmpty!34123))

(assert (= (and mapNonEmpty!34123 ((_ is ValueCellFull!10226) mapValue!34123)) b!961099))

(assert (= (and mapNonEmpty!34114 ((_ is ValueCellFull!10226) mapDefault!34123)) b!961100))

(declare-fun m!890573 () Bool)

(assert (=> mapNonEmpty!34123 m!890573))

(check-sat (not b!961072) (not d!115861) tp_is_empty!21415 (not b!961071) (not mapNonEmpty!34123) (not d!115857) (not b!961088) (not b!961092) (not b!961087) (not b!961078) (not bm!41700))
(check-sat)
