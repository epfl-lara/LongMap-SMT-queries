; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93746 () Bool)

(assert start!93746)

(declare-fun b_free!21231 () Bool)

(declare-fun b_next!21231 () Bool)

(assert (=> start!93746 (= b_free!21231 (not b_next!21231))))

(declare-fun tp!75112 () Bool)

(declare-fun b_and!33941 () Bool)

(assert (=> start!93746 (= tp!75112 b_and!33941)))

(declare-fun mapIsEmpty!39229 () Bool)

(declare-fun mapRes!39229 () Bool)

(assert (=> mapIsEmpty!39229 mapRes!39229))

(declare-fun b!1060414 () Bool)

(declare-fun e!603720 () Bool)

(declare-datatypes ((array!67101 0))(
  ( (array!67102 (arr!32259 (Array (_ BitVec 32) (_ BitVec 64))) (size!32795 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67101)

(assert (=> b!1060414 (= e!603720 (bvsgt #b00000000000000000000000000000000 (size!32795 _keys!1163)))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38523 0))(
  ( (V!38524 (val!12571 Int)) )
))
(declare-datatypes ((ValueCell!11817 0))(
  ( (ValueCellFull!11817 (v!15181 V!38523)) (EmptyCell!11817) )
))
(declare-datatypes ((array!67103 0))(
  ( (array!67104 (arr!32260 (Array (_ BitVec 32) ValueCell!11817)) (size!32796 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67103)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38523)

(declare-fun zeroValueBefore!47 () V!38523)

(declare-datatypes ((tuple2!15888 0))(
  ( (tuple2!15889 (_1!7955 (_ BitVec 64)) (_2!7955 V!38523)) )
))
(declare-datatypes ((List!22474 0))(
  ( (Nil!22471) (Cons!22470 (h!23679 tuple2!15888) (t!31781 List!22474)) )
))
(declare-datatypes ((ListLongMap!13857 0))(
  ( (ListLongMap!13858 (toList!6944 List!22474)) )
))
(declare-fun lt!467266 () ListLongMap!13857)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3546 (array!67101 array!67103 (_ BitVec 32) (_ BitVec 32) V!38523 V!38523 (_ BitVec 32) Int) ListLongMap!13857)

(assert (=> b!1060414 (= lt!467266 (getCurrentListMapNoExtraKeys!3546 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1060415 () Bool)

(declare-fun e!603716 () Bool)

(declare-fun e!603719 () Bool)

(assert (=> b!1060415 (= e!603716 (and e!603719 mapRes!39229))))

(declare-fun condMapEmpty!39229 () Bool)

(declare-fun mapDefault!39229 () ValueCell!11817)

(assert (=> b!1060415 (= condMapEmpty!39229 (= (arr!32260 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11817)) mapDefault!39229)))))

(declare-fun b!1060416 () Bool)

(declare-fun res!708250 () Bool)

(assert (=> b!1060416 (=> (not res!708250) (not e!603720))))

(declare-datatypes ((List!22475 0))(
  ( (Nil!22472) (Cons!22471 (h!23680 (_ BitVec 64)) (t!31782 List!22475)) )
))
(declare-fun arrayNoDuplicates!0 (array!67101 (_ BitVec 32) List!22475) Bool)

(assert (=> b!1060416 (= res!708250 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22472))))

(declare-fun b!1060417 () Bool)

(declare-fun e!603718 () Bool)

(declare-fun tp_is_empty!25041 () Bool)

(assert (=> b!1060417 (= e!603718 tp_is_empty!25041)))

(declare-fun b!1060418 () Bool)

(assert (=> b!1060418 (= e!603719 tp_is_empty!25041)))

(declare-fun mapNonEmpty!39229 () Bool)

(declare-fun tp!75113 () Bool)

(assert (=> mapNonEmpty!39229 (= mapRes!39229 (and tp!75113 e!603718))))

(declare-fun mapKey!39229 () (_ BitVec 32))

(declare-fun mapValue!39229 () ValueCell!11817)

(declare-fun mapRest!39229 () (Array (_ BitVec 32) ValueCell!11817))

(assert (=> mapNonEmpty!39229 (= (arr!32260 _values!955) (store mapRest!39229 mapKey!39229 mapValue!39229))))

(declare-fun b!1060419 () Bool)

(declare-fun res!708253 () Bool)

(assert (=> b!1060419 (=> (not res!708253) (not e!603720))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67101 (_ BitVec 32)) Bool)

(assert (=> b!1060419 (= res!708253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1060420 () Bool)

(declare-fun res!708251 () Bool)

(assert (=> b!1060420 (=> (not res!708251) (not e!603720))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1060420 (= res!708251 (and (= (size!32796 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32795 _keys!1163) (size!32796 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!708252 () Bool)

(assert (=> start!93746 (=> (not res!708252) (not e!603720))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93746 (= res!708252 (validMask!0 mask!1515))))

(assert (=> start!93746 e!603720))

(assert (=> start!93746 true))

(assert (=> start!93746 tp_is_empty!25041))

(declare-fun array_inv!24998 (array!67103) Bool)

(assert (=> start!93746 (and (array_inv!24998 _values!955) e!603716)))

(assert (=> start!93746 tp!75112))

(declare-fun array_inv!24999 (array!67101) Bool)

(assert (=> start!93746 (array_inv!24999 _keys!1163)))

(assert (= (and start!93746 res!708252) b!1060420))

(assert (= (and b!1060420 res!708251) b!1060419))

(assert (= (and b!1060419 res!708253) b!1060416))

(assert (= (and b!1060416 res!708250) b!1060414))

(assert (= (and b!1060415 condMapEmpty!39229) mapIsEmpty!39229))

(assert (= (and b!1060415 (not condMapEmpty!39229)) mapNonEmpty!39229))

(get-info :version)

(assert (= (and mapNonEmpty!39229 ((_ is ValueCellFull!11817) mapValue!39229)) b!1060417))

(assert (= (and b!1060415 ((_ is ValueCellFull!11817) mapDefault!39229)) b!1060418))

(assert (= start!93746 b!1060415))

(declare-fun m!979503 () Bool)

(assert (=> start!93746 m!979503))

(declare-fun m!979505 () Bool)

(assert (=> start!93746 m!979505))

(declare-fun m!979507 () Bool)

(assert (=> start!93746 m!979507))

(declare-fun m!979509 () Bool)

(assert (=> b!1060416 m!979509))

(declare-fun m!979511 () Bool)

(assert (=> mapNonEmpty!39229 m!979511))

(declare-fun m!979513 () Bool)

(assert (=> b!1060414 m!979513))

(declare-fun m!979515 () Bool)

(assert (=> b!1060419 m!979515))

(check-sat (not b!1060414) (not b!1060419) (not b!1060416) b_and!33941 (not b_next!21231) tp_is_empty!25041 (not mapNonEmpty!39229) (not start!93746))
(check-sat b_and!33941 (not b_next!21231))
(get-model)

(declare-fun b!1060450 () Bool)

(declare-fun e!603742 () Bool)

(declare-fun call!44893 () Bool)

(assert (=> b!1060450 (= e!603742 call!44893)))

(declare-fun b!1060451 () Bool)

(declare-fun e!603743 () Bool)

(assert (=> b!1060451 (= e!603743 e!603742)))

(declare-fun c!107202 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1060451 (= c!107202 (validKeyInArray!0 (select (arr!32259 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1060452 () Bool)

(declare-fun e!603744 () Bool)

(assert (=> b!1060452 (= e!603744 call!44893)))

(declare-fun b!1060453 () Bool)

(assert (=> b!1060453 (= e!603742 e!603744)))

(declare-fun lt!467276 () (_ BitVec 64))

(assert (=> b!1060453 (= lt!467276 (select (arr!32259 _keys!1163) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!34728 0))(
  ( (Unit!34729) )
))
(declare-fun lt!467278 () Unit!34728)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!67101 (_ BitVec 64) (_ BitVec 32)) Unit!34728)

(assert (=> b!1060453 (= lt!467278 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!467276 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!67101 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1060453 (arrayContainsKey!0 _keys!1163 lt!467276 #b00000000000000000000000000000000)))

(declare-fun lt!467277 () Unit!34728)

(assert (=> b!1060453 (= lt!467277 lt!467278)))

(declare-fun res!708271 () Bool)

(declare-datatypes ((SeekEntryResult!9870 0))(
  ( (MissingZero!9870 (index!41851 (_ BitVec 32))) (Found!9870 (index!41852 (_ BitVec 32))) (Intermediate!9870 (undefined!10682 Bool) (index!41853 (_ BitVec 32)) (x!94814 (_ BitVec 32))) (Undefined!9870) (MissingVacant!9870 (index!41854 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!67101 (_ BitVec 32)) SeekEntryResult!9870)

(assert (=> b!1060453 (= res!708271 (= (seekEntryOrOpen!0 (select (arr!32259 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9870 #b00000000000000000000000000000000)))))

(assert (=> b!1060453 (=> (not res!708271) (not e!603744))))

(declare-fun d!128775 () Bool)

(declare-fun res!708270 () Bool)

(assert (=> d!128775 (=> res!708270 e!603743)))

(assert (=> d!128775 (= res!708270 (bvsge #b00000000000000000000000000000000 (size!32795 _keys!1163)))))

(assert (=> d!128775 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!603743)))

(declare-fun bm!44890 () Bool)

(assert (=> bm!44890 (= call!44893 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(assert (= (and d!128775 (not res!708270)) b!1060451))

(assert (= (and b!1060451 c!107202) b!1060453))

(assert (= (and b!1060451 (not c!107202)) b!1060450))

(assert (= (and b!1060453 res!708271) b!1060452))

(assert (= (or b!1060452 b!1060450) bm!44890))

(declare-fun m!979531 () Bool)

(assert (=> b!1060451 m!979531))

(assert (=> b!1060451 m!979531))

(declare-fun m!979533 () Bool)

(assert (=> b!1060451 m!979533))

(assert (=> b!1060453 m!979531))

(declare-fun m!979535 () Bool)

(assert (=> b!1060453 m!979535))

(declare-fun m!979537 () Bool)

(assert (=> b!1060453 m!979537))

(assert (=> b!1060453 m!979531))

(declare-fun m!979539 () Bool)

(assert (=> b!1060453 m!979539))

(declare-fun m!979541 () Bool)

(assert (=> bm!44890 m!979541))

(assert (=> b!1060419 d!128775))

(declare-fun b!1060464 () Bool)

(declare-fun e!603756 () Bool)

(declare-fun contains!6218 (List!22475 (_ BitVec 64)) Bool)

(assert (=> b!1060464 (= e!603756 (contains!6218 Nil!22472 (select (arr!32259 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!128777 () Bool)

(declare-fun res!708278 () Bool)

(declare-fun e!603754 () Bool)

(assert (=> d!128777 (=> res!708278 e!603754)))

(assert (=> d!128777 (= res!708278 (bvsge #b00000000000000000000000000000000 (size!32795 _keys!1163)))))

(assert (=> d!128777 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22472) e!603754)))

(declare-fun bm!44893 () Bool)

(declare-fun call!44896 () Bool)

(declare-fun c!107205 () Bool)

(assert (=> bm!44893 (= call!44896 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107205 (Cons!22471 (select (arr!32259 _keys!1163) #b00000000000000000000000000000000) Nil!22472) Nil!22472)))))

(declare-fun b!1060465 () Bool)

(declare-fun e!603753 () Bool)

(assert (=> b!1060465 (= e!603753 call!44896)))

(declare-fun b!1060466 () Bool)

(declare-fun e!603755 () Bool)

(assert (=> b!1060466 (= e!603754 e!603755)))

(declare-fun res!708279 () Bool)

(assert (=> b!1060466 (=> (not res!708279) (not e!603755))))

(assert (=> b!1060466 (= res!708279 (not e!603756))))

(declare-fun res!708280 () Bool)

(assert (=> b!1060466 (=> (not res!708280) (not e!603756))))

(assert (=> b!1060466 (= res!708280 (validKeyInArray!0 (select (arr!32259 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1060467 () Bool)

(assert (=> b!1060467 (= e!603755 e!603753)))

(assert (=> b!1060467 (= c!107205 (validKeyInArray!0 (select (arr!32259 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1060468 () Bool)

(assert (=> b!1060468 (= e!603753 call!44896)))

(assert (= (and d!128777 (not res!708278)) b!1060466))

(assert (= (and b!1060466 res!708280) b!1060464))

(assert (= (and b!1060466 res!708279) b!1060467))

(assert (= (and b!1060467 c!107205) b!1060465))

(assert (= (and b!1060467 (not c!107205)) b!1060468))

(assert (= (or b!1060465 b!1060468) bm!44893))

(assert (=> b!1060464 m!979531))

(assert (=> b!1060464 m!979531))

(declare-fun m!979543 () Bool)

(assert (=> b!1060464 m!979543))

(assert (=> bm!44893 m!979531))

(declare-fun m!979545 () Bool)

(assert (=> bm!44893 m!979545))

(assert (=> b!1060466 m!979531))

(assert (=> b!1060466 m!979531))

(assert (=> b!1060466 m!979533))

(assert (=> b!1060467 m!979531))

(assert (=> b!1060467 m!979531))

(assert (=> b!1060467 m!979533))

(assert (=> b!1060416 d!128777))

(declare-fun d!128779 () Bool)

(assert (=> d!128779 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!93746 d!128779))

(declare-fun d!128781 () Bool)

(assert (=> d!128781 (= (array_inv!24998 _values!955) (bvsge (size!32796 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!93746 d!128781))

(declare-fun d!128783 () Bool)

(assert (=> d!128783 (= (array_inv!24999 _keys!1163) (bvsge (size!32795 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!93746 d!128783))

(declare-fun b!1060493 () Bool)

(declare-fun e!603772 () Bool)

(assert (=> b!1060493 (= e!603772 (validKeyInArray!0 (select (arr!32259 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1060493 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1060494 () Bool)

(declare-fun e!603776 () Bool)

(declare-fun e!603773 () Bool)

(assert (=> b!1060494 (= e!603776 e!603773)))

(assert (=> b!1060494 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32795 _keys!1163)))))

(declare-fun res!708291 () Bool)

(declare-fun lt!467296 () ListLongMap!13857)

(declare-fun contains!6219 (ListLongMap!13857 (_ BitVec 64)) Bool)

(assert (=> b!1060494 (= res!708291 (contains!6219 lt!467296 (select (arr!32259 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1060494 (=> (not res!708291) (not e!603773))))

(declare-fun b!1060495 () Bool)

(declare-fun e!603775 () Bool)

(declare-fun isEmpty!935 (ListLongMap!13857) Bool)

(assert (=> b!1060495 (= e!603775 (isEmpty!935 lt!467296))))

(declare-fun b!1060496 () Bool)

(declare-fun e!603771 () Bool)

(assert (=> b!1060496 (= e!603771 e!603776)))

(declare-fun c!107216 () Bool)

(assert (=> b!1060496 (= c!107216 e!603772)))

(declare-fun res!708292 () Bool)

(assert (=> b!1060496 (=> (not res!708292) (not e!603772))))

(assert (=> b!1060496 (= res!708292 (bvslt #b00000000000000000000000000000000 (size!32795 _keys!1163)))))

(declare-fun b!1060497 () Bool)

(declare-fun e!603774 () ListLongMap!13857)

(declare-fun call!44899 () ListLongMap!13857)

(assert (=> b!1060497 (= e!603774 call!44899)))

(declare-fun b!1060498 () Bool)

(assert (=> b!1060498 (= e!603776 e!603775)))

(declare-fun c!107215 () Bool)

(assert (=> b!1060498 (= c!107215 (bvslt #b00000000000000000000000000000000 (size!32795 _keys!1163)))))

(declare-fun d!128785 () Bool)

(assert (=> d!128785 e!603771))

(declare-fun res!708289 () Bool)

(assert (=> d!128785 (=> (not res!708289) (not e!603771))))

(assert (=> d!128785 (= res!708289 (not (contains!6219 lt!467296 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!603777 () ListLongMap!13857)

(assert (=> d!128785 (= lt!467296 e!603777)))

(declare-fun c!107214 () Bool)

(assert (=> d!128785 (= c!107214 (bvsge #b00000000000000000000000000000000 (size!32795 _keys!1163)))))

(assert (=> d!128785 (validMask!0 mask!1515)))

(assert (=> d!128785 (= (getCurrentListMapNoExtraKeys!3546 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!467296)))

(declare-fun bm!44896 () Bool)

(assert (=> bm!44896 (= call!44899 (getCurrentListMapNoExtraKeys!3546 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1060499 () Bool)

(declare-fun res!708290 () Bool)

(assert (=> b!1060499 (=> (not res!708290) (not e!603771))))

(assert (=> b!1060499 (= res!708290 (not (contains!6219 lt!467296 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1060500 () Bool)

(declare-fun lt!467294 () Unit!34728)

(declare-fun lt!467295 () Unit!34728)

(assert (=> b!1060500 (= lt!467294 lt!467295)))

(declare-fun lt!467298 () (_ BitVec 64))

(declare-fun lt!467293 () ListLongMap!13857)

(declare-fun lt!467299 () (_ BitVec 64))

(declare-fun lt!467297 () V!38523)

(declare-fun +!3115 (ListLongMap!13857 tuple2!15888) ListLongMap!13857)

(assert (=> b!1060500 (not (contains!6219 (+!3115 lt!467293 (tuple2!15889 lt!467298 lt!467297)) lt!467299))))

(declare-fun addStillNotContains!245 (ListLongMap!13857 (_ BitVec 64) V!38523 (_ BitVec 64)) Unit!34728)

(assert (=> b!1060500 (= lt!467295 (addStillNotContains!245 lt!467293 lt!467298 lt!467297 lt!467299))))

(assert (=> b!1060500 (= lt!467299 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!16889 (ValueCell!11817 V!38523) V!38523)

(declare-fun dynLambda!2024 (Int (_ BitVec 64)) V!38523)

(assert (=> b!1060500 (= lt!467297 (get!16889 (select (arr!32260 _values!955) #b00000000000000000000000000000000) (dynLambda!2024 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1060500 (= lt!467298 (select (arr!32259 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1060500 (= lt!467293 call!44899)))

(assert (=> b!1060500 (= e!603774 (+!3115 call!44899 (tuple2!15889 (select (arr!32259 _keys!1163) #b00000000000000000000000000000000) (get!16889 (select (arr!32260 _values!955) #b00000000000000000000000000000000) (dynLambda!2024 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1060501 () Bool)

(assert (=> b!1060501 (= e!603775 (= lt!467296 (getCurrentListMapNoExtraKeys!3546 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1060502 () Bool)

(assert (=> b!1060502 (= e!603777 e!603774)))

(declare-fun c!107217 () Bool)

(assert (=> b!1060502 (= c!107217 (validKeyInArray!0 (select (arr!32259 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1060503 () Bool)

(assert (=> b!1060503 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32795 _keys!1163)))))

(assert (=> b!1060503 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32796 _values!955)))))

(declare-fun apply!917 (ListLongMap!13857 (_ BitVec 64)) V!38523)

(assert (=> b!1060503 (= e!603773 (= (apply!917 lt!467296 (select (arr!32259 _keys!1163) #b00000000000000000000000000000000)) (get!16889 (select (arr!32260 _values!955) #b00000000000000000000000000000000) (dynLambda!2024 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1060504 () Bool)

(assert (=> b!1060504 (= e!603777 (ListLongMap!13858 Nil!22471))))

(assert (= (and d!128785 c!107214) b!1060504))

(assert (= (and d!128785 (not c!107214)) b!1060502))

(assert (= (and b!1060502 c!107217) b!1060500))

(assert (= (and b!1060502 (not c!107217)) b!1060497))

(assert (= (or b!1060500 b!1060497) bm!44896))

(assert (= (and d!128785 res!708289) b!1060499))

(assert (= (and b!1060499 res!708290) b!1060496))

(assert (= (and b!1060496 res!708292) b!1060493))

(assert (= (and b!1060496 c!107216) b!1060494))

(assert (= (and b!1060496 (not c!107216)) b!1060498))

(assert (= (and b!1060494 res!708291) b!1060503))

(assert (= (and b!1060498 c!107215) b!1060501))

(assert (= (and b!1060498 (not c!107215)) b!1060495))

(declare-fun b_lambda!16437 () Bool)

(assert (=> (not b_lambda!16437) (not b!1060500)))

(declare-fun t!31786 () Bool)

(declare-fun tb!7129 () Bool)

(assert (=> (and start!93746 (= defaultEntry!963 defaultEntry!963) t!31786) tb!7129))

(declare-fun result!14695 () Bool)

(assert (=> tb!7129 (= result!14695 tp_is_empty!25041)))

(assert (=> b!1060500 t!31786))

(declare-fun b_and!33945 () Bool)

(assert (= b_and!33941 (and (=> t!31786 result!14695) b_and!33945)))

(declare-fun b_lambda!16439 () Bool)

(assert (=> (not b_lambda!16439) (not b!1060503)))

(assert (=> b!1060503 t!31786))

(declare-fun b_and!33947 () Bool)

(assert (= b_and!33945 (and (=> t!31786 result!14695) b_and!33947)))

(declare-fun m!979547 () Bool)

(assert (=> b!1060495 m!979547))

(assert (=> b!1060500 m!979531))

(declare-fun m!979549 () Bool)

(assert (=> b!1060500 m!979549))

(declare-fun m!979551 () Bool)

(assert (=> b!1060500 m!979551))

(declare-fun m!979553 () Bool)

(assert (=> b!1060500 m!979553))

(declare-fun m!979555 () Bool)

(assert (=> b!1060500 m!979555))

(declare-fun m!979557 () Bool)

(assert (=> b!1060500 m!979557))

(declare-fun m!979559 () Bool)

(assert (=> b!1060500 m!979559))

(assert (=> b!1060500 m!979553))

(assert (=> b!1060500 m!979559))

(assert (=> b!1060500 m!979549))

(declare-fun m!979561 () Bool)

(assert (=> b!1060500 m!979561))

(declare-fun m!979563 () Bool)

(assert (=> bm!44896 m!979563))

(declare-fun m!979565 () Bool)

(assert (=> b!1060499 m!979565))

(assert (=> b!1060503 m!979531))

(assert (=> b!1060503 m!979549))

(assert (=> b!1060503 m!979531))

(declare-fun m!979567 () Bool)

(assert (=> b!1060503 m!979567))

(assert (=> b!1060503 m!979559))

(assert (=> b!1060503 m!979559))

(assert (=> b!1060503 m!979549))

(assert (=> b!1060503 m!979561))

(assert (=> b!1060493 m!979531))

(assert (=> b!1060493 m!979531))

(assert (=> b!1060493 m!979533))

(assert (=> b!1060494 m!979531))

(assert (=> b!1060494 m!979531))

(declare-fun m!979569 () Bool)

(assert (=> b!1060494 m!979569))

(assert (=> b!1060502 m!979531))

(assert (=> b!1060502 m!979531))

(assert (=> b!1060502 m!979533))

(assert (=> b!1060501 m!979563))

(declare-fun m!979571 () Bool)

(assert (=> d!128785 m!979571))

(assert (=> d!128785 m!979503))

(assert (=> b!1060414 d!128785))

(declare-fun b!1060513 () Bool)

(declare-fun e!603782 () Bool)

(assert (=> b!1060513 (= e!603782 tp_is_empty!25041)))

(declare-fun b!1060514 () Bool)

(declare-fun e!603783 () Bool)

(assert (=> b!1060514 (= e!603783 tp_is_empty!25041)))

(declare-fun condMapEmpty!39235 () Bool)

(declare-fun mapDefault!39235 () ValueCell!11817)

(assert (=> mapNonEmpty!39229 (= condMapEmpty!39235 (= mapRest!39229 ((as const (Array (_ BitVec 32) ValueCell!11817)) mapDefault!39235)))))

(declare-fun mapRes!39235 () Bool)

(assert (=> mapNonEmpty!39229 (= tp!75113 (and e!603783 mapRes!39235))))

(declare-fun mapIsEmpty!39235 () Bool)

(assert (=> mapIsEmpty!39235 mapRes!39235))

(declare-fun mapNonEmpty!39235 () Bool)

(declare-fun tp!75122 () Bool)

(assert (=> mapNonEmpty!39235 (= mapRes!39235 (and tp!75122 e!603782))))

(declare-fun mapKey!39235 () (_ BitVec 32))

(declare-fun mapValue!39235 () ValueCell!11817)

(declare-fun mapRest!39235 () (Array (_ BitVec 32) ValueCell!11817))

(assert (=> mapNonEmpty!39235 (= mapRest!39229 (store mapRest!39235 mapKey!39235 mapValue!39235))))

(assert (= (and mapNonEmpty!39229 condMapEmpty!39235) mapIsEmpty!39235))

(assert (= (and mapNonEmpty!39229 (not condMapEmpty!39235)) mapNonEmpty!39235))

(assert (= (and mapNonEmpty!39235 ((_ is ValueCellFull!11817) mapValue!39235)) b!1060513))

(assert (= (and mapNonEmpty!39229 ((_ is ValueCellFull!11817) mapDefault!39235)) b!1060514))

(declare-fun m!979573 () Bool)

(assert (=> mapNonEmpty!39235 m!979573))

(declare-fun b_lambda!16441 () Bool)

(assert (= b_lambda!16437 (or (and start!93746 b_free!21231) b_lambda!16441)))

(declare-fun b_lambda!16443 () Bool)

(assert (= b_lambda!16439 (or (and start!93746 b_free!21231) b_lambda!16443)))

(check-sat (not bm!44896) (not b!1060494) b_and!33947 (not bm!44893) (not b!1060451) (not b!1060502) (not b!1060466) (not b!1060500) (not b_next!21231) (not b!1060453) (not b!1060493) (not b!1060495) (not mapNonEmpty!39235) (not b_lambda!16443) (not d!128785) (not b!1060467) (not b!1060503) (not b!1060499) (not bm!44890) tp_is_empty!25041 (not b_lambda!16441) (not b!1060501) (not b!1060464))
(check-sat b_and!33947 (not b_next!21231))
