; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85060 () Bool)

(assert start!85060)

(declare-fun b!992934 () Bool)

(declare-fun res!663407 () Bool)

(declare-fun e!560160 () Bool)

(assert (=> b!992934 (=> (not res!663407) (not e!560160))))

(declare-fun k0!1425 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!992934 (= res!663407 (validKeyInArray!0 k0!1425))))

(declare-fun b!992935 () Bool)

(declare-fun res!663406 () Bool)

(assert (=> b!992935 (=> (not res!663406) (not e!560160))))

(declare-fun extraKeys!1472 () (_ BitVec 32))

(declare-datatypes ((V!36145 0))(
  ( (V!36146 (val!11736 Int)) )
))
(declare-datatypes ((ValueCell!11204 0))(
  ( (ValueCellFull!11204 (v!14310 V!36145)) (EmptyCell!11204) )
))
(declare-datatypes ((array!62754 0))(
  ( (array!62755 (arr!30217 (Array (_ BitVec 32) ValueCell!11204)) (size!30697 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62754)

(declare-fun mask!2471 () (_ BitVec 32))

(declare-datatypes ((array!62756 0))(
  ( (array!62757 (arr!30218 (Array (_ BitVec 32) (_ BitVec 64))) (size!30698 (_ BitVec 32))) )
))
(declare-fun _keys!1945 () array!62756)

(assert (=> b!992935 (= res!663406 (and (= (size!30697 _values!1551) (bvadd #b00000000000000000000000000000001 mask!2471)) (= (size!30698 _keys!1945) (size!30697 _values!1551)) (bvsge mask!2471 #b00000000000000000000000000000000) (bvsge extraKeys!1472 #b00000000000000000000000000000000) (bvsle extraKeys!1472 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!37128 () Bool)

(declare-fun mapRes!37128 () Bool)

(declare-fun tp!70200 () Bool)

(declare-fun e!560162 () Bool)

(assert (=> mapNonEmpty!37128 (= mapRes!37128 (and tp!70200 e!560162))))

(declare-fun mapValue!37128 () ValueCell!11204)

(declare-fun mapKey!37128 () (_ BitVec 32))

(declare-fun mapRest!37128 () (Array (_ BitVec 32) ValueCell!11204))

(assert (=> mapNonEmpty!37128 (= (arr!30217 _values!1551) (store mapRest!37128 mapKey!37128 mapValue!37128))))

(declare-fun res!663409 () Bool)

(assert (=> start!85060 (=> (not res!663409) (not e!560160))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85060 (= res!663409 (validMask!0 mask!2471))))

(assert (=> start!85060 e!560160))

(assert (=> start!85060 true))

(declare-fun e!560161 () Bool)

(declare-fun array_inv!23355 (array!62754) Bool)

(assert (=> start!85060 (and (array_inv!23355 _values!1551) e!560161)))

(declare-fun array_inv!23356 (array!62756) Bool)

(assert (=> start!85060 (array_inv!23356 _keys!1945)))

(declare-fun b!992936 () Bool)

(declare-fun e!560159 () Bool)

(assert (=> b!992936 (= e!560160 e!560159)))

(declare-fun res!663410 () Bool)

(assert (=> b!992936 (=> (not res!663410) (not e!560159))))

(declare-datatypes ((SeekEntryResult!9173 0))(
  ( (MissingZero!9173 (index!39063 (_ BitVec 32))) (Found!9173 (index!39064 (_ BitVec 32))) (Intermediate!9173 (undefined!9985 Bool) (index!39065 (_ BitVec 32)) (x!86300 (_ BitVec 32))) (Undefined!9173) (MissingVacant!9173 (index!39066 (_ BitVec 32))) )
))
(declare-fun lt!440405 () SeekEntryResult!9173)

(get-info :version)

(assert (=> b!992936 (= res!663410 ((_ is Found!9173) lt!440405))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!62756 (_ BitVec 32)) SeekEntryResult!9173)

(assert (=> b!992936 (= lt!440405 (seekEntry!0 k0!1425 _keys!1945 mask!2471))))

(declare-fun b!992937 () Bool)

(declare-fun e!560163 () Bool)

(declare-fun tp_is_empty!23371 () Bool)

(assert (=> b!992937 (= e!560163 tp_is_empty!23371)))

(declare-fun b!992938 () Bool)

(declare-fun res!663408 () Bool)

(assert (=> b!992938 (=> (not res!663408) (not e!560160))))

(declare-datatypes ((List!20859 0))(
  ( (Nil!20856) (Cons!20855 (h!22023 (_ BitVec 64)) (t!29834 List!20859)) )
))
(declare-fun arrayNoDuplicates!0 (array!62756 (_ BitVec 32) List!20859) Bool)

(assert (=> b!992938 (= res!663408 (arrayNoDuplicates!0 _keys!1945 #b00000000000000000000000000000000 Nil!20856))))

(declare-fun b!992939 () Bool)

(declare-fun res!663405 () Bool)

(assert (=> b!992939 (=> (not res!663405) (not e!560160))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62756 (_ BitVec 32)) Bool)

(assert (=> b!992939 (= res!663405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471))))

(declare-fun b!992940 () Bool)

(assert (=> b!992940 (= e!560161 (and e!560163 mapRes!37128))))

(declare-fun condMapEmpty!37128 () Bool)

(declare-fun mapDefault!37128 () ValueCell!11204)

(assert (=> b!992940 (= condMapEmpty!37128 (= (arr!30217 _values!1551) ((as const (Array (_ BitVec 32) ValueCell!11204)) mapDefault!37128)))))

(declare-fun b!992941 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!992941 (= e!560159 (not (inRange!0 (index!39064 lt!440405) mask!2471)))))

(declare-fun b!992942 () Bool)

(assert (=> b!992942 (= e!560162 tp_is_empty!23371)))

(declare-fun mapIsEmpty!37128 () Bool)

(assert (=> mapIsEmpty!37128 mapRes!37128))

(assert (= (and start!85060 res!663409) b!992935))

(assert (= (and b!992935 res!663406) b!992939))

(assert (= (and b!992939 res!663405) b!992938))

(assert (= (and b!992938 res!663408) b!992934))

(assert (= (and b!992934 res!663407) b!992936))

(assert (= (and b!992936 res!663410) b!992941))

(assert (= (and b!992940 condMapEmpty!37128) mapIsEmpty!37128))

(assert (= (and b!992940 (not condMapEmpty!37128)) mapNonEmpty!37128))

(assert (= (and mapNonEmpty!37128 ((_ is ValueCellFull!11204) mapValue!37128)) b!992942))

(assert (= (and b!992940 ((_ is ValueCellFull!11204) mapDefault!37128)) b!992937))

(assert (= start!85060 b!992940))

(declare-fun m!921049 () Bool)

(assert (=> b!992934 m!921049))

(declare-fun m!921051 () Bool)

(assert (=> b!992939 m!921051))

(declare-fun m!921053 () Bool)

(assert (=> mapNonEmpty!37128 m!921053))

(declare-fun m!921055 () Bool)

(assert (=> b!992936 m!921055))

(declare-fun m!921057 () Bool)

(assert (=> b!992938 m!921057))

(declare-fun m!921059 () Bool)

(assert (=> start!85060 m!921059))

(declare-fun m!921061 () Bool)

(assert (=> start!85060 m!921061))

(declare-fun m!921063 () Bool)

(assert (=> start!85060 m!921063))

(declare-fun m!921065 () Bool)

(assert (=> b!992941 m!921065))

(check-sat tp_is_empty!23371 (not b!992936) (not mapNonEmpty!37128) (not b!992934) (not start!85060) (not b!992939) (not b!992938) (not b!992941))
(check-sat)
(get-model)

(declare-fun d!118323 () Bool)

(assert (=> d!118323 (= (validMask!0 mask!2471) (and (or (= mask!2471 #b00000000000000000000000000000111) (= mask!2471 #b00000000000000000000000000001111) (= mask!2471 #b00000000000000000000000000011111) (= mask!2471 #b00000000000000000000000000111111) (= mask!2471 #b00000000000000000000000001111111) (= mask!2471 #b00000000000000000000000011111111) (= mask!2471 #b00000000000000000000000111111111) (= mask!2471 #b00000000000000000000001111111111) (= mask!2471 #b00000000000000000000011111111111) (= mask!2471 #b00000000000000000000111111111111) (= mask!2471 #b00000000000000000001111111111111) (= mask!2471 #b00000000000000000011111111111111) (= mask!2471 #b00000000000000000111111111111111) (= mask!2471 #b00000000000000001111111111111111) (= mask!2471 #b00000000000000011111111111111111) (= mask!2471 #b00000000000000111111111111111111) (= mask!2471 #b00000000000001111111111111111111) (= mask!2471 #b00000000000011111111111111111111) (= mask!2471 #b00000000000111111111111111111111) (= mask!2471 #b00000000001111111111111111111111) (= mask!2471 #b00000000011111111111111111111111) (= mask!2471 #b00000000111111111111111111111111) (= mask!2471 #b00000001111111111111111111111111) (= mask!2471 #b00000011111111111111111111111111) (= mask!2471 #b00000111111111111111111111111111) (= mask!2471 #b00001111111111111111111111111111) (= mask!2471 #b00011111111111111111111111111111) (= mask!2471 #b00111111111111111111111111111111)) (bvsle mask!2471 #b00111111111111111111111111111111)))))

(assert (=> start!85060 d!118323))

(declare-fun d!118325 () Bool)

(assert (=> d!118325 (= (array_inv!23355 _values!1551) (bvsge (size!30697 _values!1551) #b00000000000000000000000000000000))))

(assert (=> start!85060 d!118325))

(declare-fun d!118327 () Bool)

(assert (=> d!118327 (= (array_inv!23356 _keys!1945) (bvsge (size!30698 _keys!1945) #b00000000000000000000000000000000))))

(assert (=> start!85060 d!118327))

(declare-fun d!118329 () Bool)

(assert (=> d!118329 (= (validKeyInArray!0 k0!1425) (and (not (= k0!1425 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1425 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!992934 d!118329))

(declare-fun b!993007 () Bool)

(declare-fun e!560210 () Bool)

(declare-fun e!560209 () Bool)

(assert (=> b!993007 (= e!560210 e!560209)))

(declare-fun res!663454 () Bool)

(assert (=> b!993007 (=> (not res!663454) (not e!560209))))

(declare-fun e!560211 () Bool)

(assert (=> b!993007 (= res!663454 (not e!560211))))

(declare-fun res!663455 () Bool)

(assert (=> b!993007 (=> (not res!663455) (not e!560211))))

(assert (=> b!993007 (= res!663455 (validKeyInArray!0 (select (arr!30218 _keys!1945) #b00000000000000000000000000000000)))))

(declare-fun bm!42130 () Bool)

(declare-fun call!42133 () Bool)

(declare-fun c!100921 () Bool)

(assert (=> bm!42130 (= call!42133 (arrayNoDuplicates!0 _keys!1945 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!100921 (Cons!20855 (select (arr!30218 _keys!1945) #b00000000000000000000000000000000) Nil!20856) Nil!20856)))))

(declare-fun b!993008 () Bool)

(declare-fun contains!5754 (List!20859 (_ BitVec 64)) Bool)

(assert (=> b!993008 (= e!560211 (contains!5754 Nil!20856 (select (arr!30218 _keys!1945) #b00000000000000000000000000000000)))))

(declare-fun b!993009 () Bool)

(declare-fun e!560208 () Bool)

(assert (=> b!993009 (= e!560208 call!42133)))

(declare-fun d!118331 () Bool)

(declare-fun res!663453 () Bool)

(assert (=> d!118331 (=> res!663453 e!560210)))

(assert (=> d!118331 (= res!663453 (bvsge #b00000000000000000000000000000000 (size!30698 _keys!1945)))))

(assert (=> d!118331 (= (arrayNoDuplicates!0 _keys!1945 #b00000000000000000000000000000000 Nil!20856) e!560210)))

(declare-fun b!993010 () Bool)

(assert (=> b!993010 (= e!560208 call!42133)))

(declare-fun b!993011 () Bool)

(assert (=> b!993011 (= e!560209 e!560208)))

(assert (=> b!993011 (= c!100921 (validKeyInArray!0 (select (arr!30218 _keys!1945) #b00000000000000000000000000000000)))))

(assert (= (and d!118331 (not res!663453)) b!993007))

(assert (= (and b!993007 res!663455) b!993008))

(assert (= (and b!993007 res!663454) b!993011))

(assert (= (and b!993011 c!100921) b!993010))

(assert (= (and b!993011 (not c!100921)) b!993009))

(assert (= (or b!993010 b!993009) bm!42130))

(declare-fun m!921103 () Bool)

(assert (=> b!993007 m!921103))

(assert (=> b!993007 m!921103))

(declare-fun m!921105 () Bool)

(assert (=> b!993007 m!921105))

(assert (=> bm!42130 m!921103))

(declare-fun m!921107 () Bool)

(assert (=> bm!42130 m!921107))

(assert (=> b!993008 m!921103))

(assert (=> b!993008 m!921103))

(declare-fun m!921109 () Bool)

(assert (=> b!993008 m!921109))

(assert (=> b!993011 m!921103))

(assert (=> b!993011 m!921103))

(assert (=> b!993011 m!921105))

(assert (=> b!992938 d!118331))

(declare-fun d!118333 () Bool)

(declare-fun res!663461 () Bool)

(declare-fun e!560219 () Bool)

(assert (=> d!118333 (=> res!663461 e!560219)))

(assert (=> d!118333 (= res!663461 (bvsge #b00000000000000000000000000000000 (size!30698 _keys!1945)))))

(assert (=> d!118333 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471) e!560219)))

(declare-fun bm!42133 () Bool)

(declare-fun call!42136 () Bool)

(assert (=> bm!42133 (= call!42136 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1945 mask!2471))))

(declare-fun b!993020 () Bool)

(declare-fun e!560218 () Bool)

(assert (=> b!993020 (= e!560218 call!42136)))

(declare-fun b!993021 () Bool)

(declare-fun e!560220 () Bool)

(assert (=> b!993021 (= e!560220 call!42136)))

(declare-fun b!993022 () Bool)

(assert (=> b!993022 (= e!560220 e!560218)))

(declare-fun lt!440419 () (_ BitVec 64))

(assert (=> b!993022 (= lt!440419 (select (arr!30218 _keys!1945) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32891 0))(
  ( (Unit!32892) )
))
(declare-fun lt!440418 () Unit!32891)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62756 (_ BitVec 64) (_ BitVec 32)) Unit!32891)

(assert (=> b!993022 (= lt!440418 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1945 lt!440419 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!62756 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!993022 (arrayContainsKey!0 _keys!1945 lt!440419 #b00000000000000000000000000000000)))

(declare-fun lt!440420 () Unit!32891)

(assert (=> b!993022 (= lt!440420 lt!440418)))

(declare-fun res!663460 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62756 (_ BitVec 32)) SeekEntryResult!9173)

(assert (=> b!993022 (= res!663460 (= (seekEntryOrOpen!0 (select (arr!30218 _keys!1945) #b00000000000000000000000000000000) _keys!1945 mask!2471) (Found!9173 #b00000000000000000000000000000000)))))

(assert (=> b!993022 (=> (not res!663460) (not e!560218))))

(declare-fun b!993023 () Bool)

(assert (=> b!993023 (= e!560219 e!560220)))

(declare-fun c!100924 () Bool)

(assert (=> b!993023 (= c!100924 (validKeyInArray!0 (select (arr!30218 _keys!1945) #b00000000000000000000000000000000)))))

(assert (= (and d!118333 (not res!663461)) b!993023))

(assert (= (and b!993023 c!100924) b!993022))

(assert (= (and b!993023 (not c!100924)) b!993021))

(assert (= (and b!993022 res!663460) b!993020))

(assert (= (or b!993020 b!993021) bm!42133))

(declare-fun m!921111 () Bool)

(assert (=> bm!42133 m!921111))

(assert (=> b!993022 m!921103))

(declare-fun m!921113 () Bool)

(assert (=> b!993022 m!921113))

(declare-fun m!921115 () Bool)

(assert (=> b!993022 m!921115))

(assert (=> b!993022 m!921103))

(declare-fun m!921117 () Bool)

(assert (=> b!993022 m!921117))

(assert (=> b!993023 m!921103))

(assert (=> b!993023 m!921103))

(assert (=> b!993023 m!921105))

(assert (=> b!992939 d!118333))

(declare-fun d!118335 () Bool)

(assert (=> d!118335 (= (inRange!0 (index!39064 lt!440405) mask!2471) (and (bvsge (index!39064 lt!440405) #b00000000000000000000000000000000) (bvslt (index!39064 lt!440405) (bvadd mask!2471 #b00000000000000000000000000000001))))))

(assert (=> b!992941 d!118335))

(declare-fun b!993036 () Bool)

(declare-fun e!560228 () SeekEntryResult!9173)

(declare-fun lt!440429 () SeekEntryResult!9173)

(assert (=> b!993036 (= e!560228 (Found!9173 (index!39065 lt!440429)))))

(declare-fun b!993037 () Bool)

(declare-fun e!560227 () SeekEntryResult!9173)

(assert (=> b!993037 (= e!560227 (MissingZero!9173 (index!39065 lt!440429)))))

(declare-fun d!118337 () Bool)

(declare-fun lt!440430 () SeekEntryResult!9173)

(assert (=> d!118337 (and (or ((_ is MissingVacant!9173) lt!440430) (not ((_ is Found!9173) lt!440430)) (and (bvsge (index!39064 lt!440430) #b00000000000000000000000000000000) (bvslt (index!39064 lt!440430) (size!30698 _keys!1945)))) (not ((_ is MissingVacant!9173) lt!440430)) (or (not ((_ is Found!9173) lt!440430)) (= (select (arr!30218 _keys!1945) (index!39064 lt!440430)) k0!1425)))))

(declare-fun e!560229 () SeekEntryResult!9173)

(assert (=> d!118337 (= lt!440430 e!560229)))

(declare-fun c!100932 () Bool)

(assert (=> d!118337 (= c!100932 (and ((_ is Intermediate!9173) lt!440429) (undefined!9985 lt!440429)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62756 (_ BitVec 32)) SeekEntryResult!9173)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!118337 (= lt!440429 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1425 mask!2471) k0!1425 _keys!1945 mask!2471))))

(assert (=> d!118337 (validMask!0 mask!2471)))

(assert (=> d!118337 (= (seekEntry!0 k0!1425 _keys!1945 mask!2471) lt!440430)))

(declare-fun b!993038 () Bool)

(assert (=> b!993038 (= e!560229 e!560228)))

(declare-fun lt!440431 () (_ BitVec 64))

(assert (=> b!993038 (= lt!440431 (select (arr!30218 _keys!1945) (index!39065 lt!440429)))))

(declare-fun c!100933 () Bool)

(assert (=> b!993038 (= c!100933 (= lt!440431 k0!1425))))

(declare-fun b!993039 () Bool)

(declare-fun c!100931 () Bool)

(assert (=> b!993039 (= c!100931 (= lt!440431 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!993039 (= e!560228 e!560227)))

(declare-fun b!993040 () Bool)

(declare-fun lt!440432 () SeekEntryResult!9173)

(assert (=> b!993040 (= e!560227 (ite ((_ is MissingVacant!9173) lt!440432) (MissingZero!9173 (index!39066 lt!440432)) lt!440432))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62756 (_ BitVec 32)) SeekEntryResult!9173)

(assert (=> b!993040 (= lt!440432 (seekKeyOrZeroReturnVacant!0 (x!86300 lt!440429) (index!39065 lt!440429) (index!39065 lt!440429) k0!1425 _keys!1945 mask!2471))))

(declare-fun b!993041 () Bool)

(assert (=> b!993041 (= e!560229 Undefined!9173)))

(assert (= (and d!118337 c!100932) b!993041))

(assert (= (and d!118337 (not c!100932)) b!993038))

(assert (= (and b!993038 c!100933) b!993036))

(assert (= (and b!993038 (not c!100933)) b!993039))

(assert (= (and b!993039 c!100931) b!993037))

(assert (= (and b!993039 (not c!100931)) b!993040))

(declare-fun m!921119 () Bool)

(assert (=> d!118337 m!921119))

(declare-fun m!921121 () Bool)

(assert (=> d!118337 m!921121))

(assert (=> d!118337 m!921121))

(declare-fun m!921123 () Bool)

(assert (=> d!118337 m!921123))

(assert (=> d!118337 m!921059))

(declare-fun m!921125 () Bool)

(assert (=> b!993038 m!921125))

(declare-fun m!921127 () Bool)

(assert (=> b!993040 m!921127))

(assert (=> b!992936 d!118337))

(declare-fun b!993048 () Bool)

(declare-fun e!560234 () Bool)

(assert (=> b!993048 (= e!560234 tp_is_empty!23371)))

(declare-fun mapIsEmpty!37137 () Bool)

(declare-fun mapRes!37137 () Bool)

(assert (=> mapIsEmpty!37137 mapRes!37137))

(declare-fun condMapEmpty!37137 () Bool)

(declare-fun mapDefault!37137 () ValueCell!11204)

(assert (=> mapNonEmpty!37128 (= condMapEmpty!37137 (= mapRest!37128 ((as const (Array (_ BitVec 32) ValueCell!11204)) mapDefault!37137)))))

(declare-fun e!560235 () Bool)

(assert (=> mapNonEmpty!37128 (= tp!70200 (and e!560235 mapRes!37137))))

(declare-fun mapNonEmpty!37137 () Bool)

(declare-fun tp!70209 () Bool)

(assert (=> mapNonEmpty!37137 (= mapRes!37137 (and tp!70209 e!560234))))

(declare-fun mapRest!37137 () (Array (_ BitVec 32) ValueCell!11204))

(declare-fun mapKey!37137 () (_ BitVec 32))

(declare-fun mapValue!37137 () ValueCell!11204)

(assert (=> mapNonEmpty!37137 (= mapRest!37128 (store mapRest!37137 mapKey!37137 mapValue!37137))))

(declare-fun b!993049 () Bool)

(assert (=> b!993049 (= e!560235 tp_is_empty!23371)))

(assert (= (and mapNonEmpty!37128 condMapEmpty!37137) mapIsEmpty!37137))

(assert (= (and mapNonEmpty!37128 (not condMapEmpty!37137)) mapNonEmpty!37137))

(assert (= (and mapNonEmpty!37137 ((_ is ValueCellFull!11204) mapValue!37137)) b!993048))

(assert (= (and mapNonEmpty!37128 ((_ is ValueCellFull!11204) mapDefault!37137)) b!993049))

(declare-fun m!921129 () Bool)

(assert (=> mapNonEmpty!37137 m!921129))

(check-sat tp_is_empty!23371 (not d!118337) (not b!993011) (not b!993007) (not b!993023) (not b!993040) (not bm!42130) (not b!993008) (not b!993022) (not bm!42133) (not mapNonEmpty!37137))
(check-sat)
