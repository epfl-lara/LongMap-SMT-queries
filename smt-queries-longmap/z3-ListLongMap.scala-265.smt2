; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4332 () Bool)

(assert start!4332)

(declare-fun b_free!1177 () Bool)

(declare-fun b_next!1177 () Bool)

(assert (=> start!4332 (= b_free!1177 (not b_next!1177))))

(declare-fun tp!4959 () Bool)

(declare-fun b_and!1983 () Bool)

(assert (=> start!4332 (= tp!4959 b_and!1983)))

(declare-fun b!33360 () Bool)

(declare-fun res!20287 () Bool)

(declare-fun e!21179 () Bool)

(assert (=> b!33360 (=> (not res!20287) (not e!21179))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!33360 (= res!20287 (validKeyInArray!0 k0!1304))))

(declare-fun b!33361 () Bool)

(declare-fun e!21183 () Bool)

(declare-datatypes ((array!2259 0))(
  ( (array!2260 (arr!1080 (Array (_ BitVec 32) (_ BitVec 64))) (size!1181 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2259)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!33361 (= e!21183 (not (or (not (= (size!1181 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))) (bvsle #b00000000000000000000000000000000 (size!1181 _keys!1833)))))))

(declare-datatypes ((SeekEntryResult!126 0))(
  ( (MissingZero!126 (index!2626 (_ BitVec 32))) (Found!126 (index!2627 (_ BitVec 32))) (Intermediate!126 (undefined!938 Bool) (index!2628 (_ BitVec 32)) (x!6818 (_ BitVec 32))) (Undefined!126) (MissingVacant!126 (index!2629 (_ BitVec 32))) )
))
(declare-fun lt!12140 () SeekEntryResult!126)

(declare-fun lt!12138 () (_ BitVec 32))

(get-info :version)

(assert (=> b!33361 (and ((_ is Found!126) lt!12140) (= (index!2627 lt!12140) lt!12138))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2259 (_ BitVec 32)) SeekEntryResult!126)

(assert (=> b!33361 (= lt!12140 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-datatypes ((Unit!752 0))(
  ( (Unit!753) )
))
(declare-fun lt!12139 () Unit!752)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!2259 (_ BitVec 32)) Unit!752)

(assert (=> b!33361 (= lt!12139 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!12138 _keys!1833 mask!2294))))

(declare-datatypes ((V!1867 0))(
  ( (V!1868 (val!792 Int)) )
))
(declare-datatypes ((tuple2!1272 0))(
  ( (tuple2!1273 (_1!647 (_ BitVec 64)) (_2!647 V!1867)) )
))
(declare-datatypes ((List!866 0))(
  ( (Nil!863) (Cons!862 (h!1429 tuple2!1272) (t!3559 List!866)) )
))
(declare-datatypes ((ListLongMap!843 0))(
  ( (ListLongMap!844 (toList!437 List!866)) )
))
(declare-fun lt!12141 () ListLongMap!843)

(declare-fun contains!382 (ListLongMap!843 (_ BitVec 64)) Bool)

(assert (=> b!33361 (contains!382 lt!12141 (select (arr!1080 _keys!1833) lt!12138))))

(declare-datatypes ((ValueCell!566 0))(
  ( (ValueCellFull!566 (v!1884 V!1867)) (EmptyCell!566) )
))
(declare-datatypes ((array!2261 0))(
  ( (array!2262 (arr!1081 (Array (_ BitVec 32) ValueCell!566)) (size!1182 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2261)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun lt!12142 () Unit!752)

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1867)

(declare-fun minValue!1443 () V!1867)

(declare-fun lemmaValidKeyInArrayIsInListMap!60 (array!2259 array!2261 (_ BitVec 32) (_ BitVec 32) V!1867 V!1867 (_ BitVec 32) Int) Unit!752)

(assert (=> b!33361 (= lt!12142 (lemmaValidKeyInArrayIsInListMap!60 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!12138 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!2259 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!33361 (= lt!12138 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!33362 () Bool)

(declare-fun e!21181 () Bool)

(declare-fun tp_is_empty!1531 () Bool)

(assert (=> b!33362 (= e!21181 tp_is_empty!1531)))

(declare-fun mapNonEmpty!1834 () Bool)

(declare-fun mapRes!1834 () Bool)

(declare-fun tp!4960 () Bool)

(assert (=> mapNonEmpty!1834 (= mapRes!1834 (and tp!4960 e!21181))))

(declare-fun mapValue!1834 () ValueCell!566)

(declare-fun mapKey!1834 () (_ BitVec 32))

(declare-fun mapRest!1834 () (Array (_ BitVec 32) ValueCell!566))

(assert (=> mapNonEmpty!1834 (= (arr!1081 _values!1501) (store mapRest!1834 mapKey!1834 mapValue!1834))))

(declare-fun mapIsEmpty!1834 () Bool)

(assert (=> mapIsEmpty!1834 mapRes!1834))

(declare-fun b!33363 () Bool)

(declare-fun res!20283 () Bool)

(assert (=> b!33363 (=> (not res!20283) (not e!21183))))

(declare-fun arrayContainsKey!0 (array!2259 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!33363 (= res!20283 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!33364 () Bool)

(declare-fun e!21178 () Bool)

(declare-fun e!21180 () Bool)

(assert (=> b!33364 (= e!21178 (and e!21180 mapRes!1834))))

(declare-fun condMapEmpty!1834 () Bool)

(declare-fun mapDefault!1834 () ValueCell!566)

(assert (=> b!33364 (= condMapEmpty!1834 (= (arr!1081 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!566)) mapDefault!1834)))))

(declare-fun res!20284 () Bool)

(assert (=> start!4332 (=> (not res!20284) (not e!21179))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4332 (= res!20284 (validMask!0 mask!2294))))

(assert (=> start!4332 e!21179))

(assert (=> start!4332 true))

(assert (=> start!4332 tp!4959))

(declare-fun array_inv!741 (array!2261) Bool)

(assert (=> start!4332 (and (array_inv!741 _values!1501) e!21178)))

(declare-fun array_inv!742 (array!2259) Bool)

(assert (=> start!4332 (array_inv!742 _keys!1833)))

(assert (=> start!4332 tp_is_empty!1531))

(declare-fun b!33365 () Bool)

(assert (=> b!33365 (= e!21180 tp_is_empty!1531)))

(declare-fun b!33366 () Bool)

(assert (=> b!33366 (= e!21179 e!21183)))

(declare-fun res!20285 () Bool)

(assert (=> b!33366 (=> (not res!20285) (not e!21183))))

(assert (=> b!33366 (= res!20285 (not (contains!382 lt!12141 k0!1304)))))

(declare-fun getCurrentListMap!260 (array!2259 array!2261 (_ BitVec 32) (_ BitVec 32) V!1867 V!1867 (_ BitVec 32) Int) ListLongMap!843)

(assert (=> b!33366 (= lt!12141 (getCurrentListMap!260 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!33367 () Bool)

(declare-fun res!20288 () Bool)

(assert (=> b!33367 (=> (not res!20288) (not e!21179))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2259 (_ BitVec 32)) Bool)

(assert (=> b!33367 (= res!20288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!33368 () Bool)

(declare-fun res!20289 () Bool)

(assert (=> b!33368 (=> (not res!20289) (not e!21179))))

(assert (=> b!33368 (= res!20289 (and (= (size!1182 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1181 _keys!1833) (size!1182 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!33369 () Bool)

(declare-fun res!20286 () Bool)

(assert (=> b!33369 (=> (not res!20286) (not e!21179))))

(declare-datatypes ((List!867 0))(
  ( (Nil!864) (Cons!863 (h!1430 (_ BitVec 64)) (t!3560 List!867)) )
))
(declare-fun arrayNoDuplicates!0 (array!2259 (_ BitVec 32) List!867) Bool)

(assert (=> b!33369 (= res!20286 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!864))))

(assert (= (and start!4332 res!20284) b!33368))

(assert (= (and b!33368 res!20289) b!33367))

(assert (= (and b!33367 res!20288) b!33369))

(assert (= (and b!33369 res!20286) b!33360))

(assert (= (and b!33360 res!20287) b!33366))

(assert (= (and b!33366 res!20285) b!33363))

(assert (= (and b!33363 res!20283) b!33361))

(assert (= (and b!33364 condMapEmpty!1834) mapIsEmpty!1834))

(assert (= (and b!33364 (not condMapEmpty!1834)) mapNonEmpty!1834))

(assert (= (and mapNonEmpty!1834 ((_ is ValueCellFull!566) mapValue!1834)) b!33362))

(assert (= (and b!33364 ((_ is ValueCellFull!566) mapDefault!1834)) b!33365))

(assert (= start!4332 b!33364))

(declare-fun m!26683 () Bool)

(assert (=> b!33360 m!26683))

(declare-fun m!26685 () Bool)

(assert (=> mapNonEmpty!1834 m!26685))

(declare-fun m!26687 () Bool)

(assert (=> b!33369 m!26687))

(declare-fun m!26689 () Bool)

(assert (=> b!33363 m!26689))

(declare-fun m!26691 () Bool)

(assert (=> b!33367 m!26691))

(declare-fun m!26693 () Bool)

(assert (=> b!33361 m!26693))

(declare-fun m!26695 () Bool)

(assert (=> b!33361 m!26695))

(declare-fun m!26697 () Bool)

(assert (=> b!33361 m!26697))

(declare-fun m!26699 () Bool)

(assert (=> b!33361 m!26699))

(assert (=> b!33361 m!26697))

(declare-fun m!26701 () Bool)

(assert (=> b!33361 m!26701))

(declare-fun m!26703 () Bool)

(assert (=> b!33361 m!26703))

(declare-fun m!26705 () Bool)

(assert (=> start!4332 m!26705))

(declare-fun m!26707 () Bool)

(assert (=> start!4332 m!26707))

(declare-fun m!26709 () Bool)

(assert (=> start!4332 m!26709))

(declare-fun m!26711 () Bool)

(assert (=> b!33366 m!26711))

(declare-fun m!26713 () Bool)

(assert (=> b!33366 m!26713))

(check-sat tp_is_empty!1531 (not mapNonEmpty!1834) (not b_next!1177) (not b!33369) b_and!1983 (not b!33367) (not b!33360) (not start!4332) (not b!33366) (not b!33363) (not b!33361))
(check-sat b_and!1983 (not b_next!1177))
(get-model)

(declare-fun d!5125 () Bool)

(declare-fun lt!12175 () (_ BitVec 32))

(assert (=> d!5125 (and (or (bvslt lt!12175 #b00000000000000000000000000000000) (bvsge lt!12175 (size!1181 _keys!1833)) (and (bvsge lt!12175 #b00000000000000000000000000000000) (bvslt lt!12175 (size!1181 _keys!1833)))) (bvsge lt!12175 #b00000000000000000000000000000000) (bvslt lt!12175 (size!1181 _keys!1833)) (= (select (arr!1080 _keys!1833) lt!12175) k0!1304))))

(declare-fun e!21222 () (_ BitVec 32))

(assert (=> d!5125 (= lt!12175 e!21222)))

(declare-fun c!3824 () Bool)

(assert (=> d!5125 (= c!3824 (= (select (arr!1080 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5125 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1181 _keys!1833)) (bvslt (size!1181 _keys!1833) #b01111111111111111111111111111111))))

(assert (=> d!5125 (= (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) lt!12175)))

(declare-fun b!33434 () Bool)

(assert (=> b!33434 (= e!21222 #b00000000000000000000000000000000)))

(declare-fun b!33435 () Bool)

(assert (=> b!33435 (= e!21222 (arrayScanForKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5125 c!3824) b!33434))

(assert (= (and d!5125 (not c!3824)) b!33435))

(declare-fun m!26779 () Bool)

(assert (=> d!5125 m!26779))

(declare-fun m!26781 () Bool)

(assert (=> d!5125 m!26781))

(declare-fun m!26783 () Bool)

(assert (=> b!33435 m!26783))

(assert (=> b!33361 d!5125))

(declare-fun d!5127 () Bool)

(declare-fun lt!12185 () SeekEntryResult!126)

(assert (=> d!5127 (and (or ((_ is MissingVacant!126) lt!12185) (not ((_ is Found!126) lt!12185)) (and (bvsge (index!2627 lt!12185) #b00000000000000000000000000000000) (bvslt (index!2627 lt!12185) (size!1181 _keys!1833)))) (not ((_ is MissingVacant!126) lt!12185)) (or (not ((_ is Found!126) lt!12185)) (= (select (arr!1080 _keys!1833) (index!2627 lt!12185)) k0!1304)))))

(declare-fun e!21229 () SeekEntryResult!126)

(assert (=> d!5127 (= lt!12185 e!21229)))

(declare-fun c!3832 () Bool)

(declare-fun lt!12186 () SeekEntryResult!126)

(assert (=> d!5127 (= c!3832 (and ((_ is Intermediate!126) lt!12186) (undefined!938 lt!12186)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2259 (_ BitVec 32)) SeekEntryResult!126)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!5127 (= lt!12186 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1304 mask!2294) k0!1304 _keys!1833 mask!2294))))

(assert (=> d!5127 (validMask!0 mask!2294)))

(assert (=> d!5127 (= (seekEntry!0 k0!1304 _keys!1833 mask!2294) lt!12185)))

(declare-fun b!33448 () Bool)

(assert (=> b!33448 (= e!21229 Undefined!126)))

(declare-fun b!33449 () Bool)

(declare-fun e!21230 () SeekEntryResult!126)

(assert (=> b!33449 (= e!21230 (Found!126 (index!2628 lt!12186)))))

(declare-fun b!33450 () Bool)

(assert (=> b!33450 (= e!21229 e!21230)))

(declare-fun lt!12184 () (_ BitVec 64))

(assert (=> b!33450 (= lt!12184 (select (arr!1080 _keys!1833) (index!2628 lt!12186)))))

(declare-fun c!3833 () Bool)

(assert (=> b!33450 (= c!3833 (= lt!12184 k0!1304))))

(declare-fun b!33451 () Bool)

(declare-fun e!21231 () SeekEntryResult!126)

(declare-fun lt!12187 () SeekEntryResult!126)

(assert (=> b!33451 (= e!21231 (ite ((_ is MissingVacant!126) lt!12187) (MissingZero!126 (index!2629 lt!12187)) lt!12187))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2259 (_ BitVec 32)) SeekEntryResult!126)

(assert (=> b!33451 (= lt!12187 (seekKeyOrZeroReturnVacant!0 (x!6818 lt!12186) (index!2628 lt!12186) (index!2628 lt!12186) k0!1304 _keys!1833 mask!2294))))

(declare-fun b!33452 () Bool)

(declare-fun c!3831 () Bool)

(assert (=> b!33452 (= c!3831 (= lt!12184 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!33452 (= e!21230 e!21231)))

(declare-fun b!33453 () Bool)

(assert (=> b!33453 (= e!21231 (MissingZero!126 (index!2628 lt!12186)))))

(assert (= (and d!5127 c!3832) b!33448))

(assert (= (and d!5127 (not c!3832)) b!33450))

(assert (= (and b!33450 c!3833) b!33449))

(assert (= (and b!33450 (not c!3833)) b!33452))

(assert (= (and b!33452 c!3831) b!33453))

(assert (= (and b!33452 (not c!3831)) b!33451))

(declare-fun m!26785 () Bool)

(assert (=> d!5127 m!26785))

(declare-fun m!26787 () Bool)

(assert (=> d!5127 m!26787))

(assert (=> d!5127 m!26787))

(declare-fun m!26789 () Bool)

(assert (=> d!5127 m!26789))

(assert (=> d!5127 m!26705))

(declare-fun m!26791 () Bool)

(assert (=> b!33450 m!26791))

(declare-fun m!26793 () Bool)

(assert (=> b!33451 m!26793))

(assert (=> b!33361 d!5127))

(declare-fun d!5129 () Bool)

(declare-fun e!21236 () Bool)

(assert (=> d!5129 e!21236))

(declare-fun res!20334 () Bool)

(assert (=> d!5129 (=> res!20334 e!21236)))

(declare-fun lt!12198 () Bool)

(assert (=> d!5129 (= res!20334 (not lt!12198))))

(declare-fun lt!12199 () Bool)

(assert (=> d!5129 (= lt!12198 lt!12199)))

(declare-fun lt!12197 () Unit!752)

(declare-fun e!21237 () Unit!752)

(assert (=> d!5129 (= lt!12197 e!21237)))

(declare-fun c!3836 () Bool)

(assert (=> d!5129 (= c!3836 lt!12199)))

(declare-fun containsKey!32 (List!866 (_ BitVec 64)) Bool)

(assert (=> d!5129 (= lt!12199 (containsKey!32 (toList!437 lt!12141) (select (arr!1080 _keys!1833) lt!12138)))))

(assert (=> d!5129 (= (contains!382 lt!12141 (select (arr!1080 _keys!1833) lt!12138)) lt!12198)))

(declare-fun b!33460 () Bool)

(declare-fun lt!12196 () Unit!752)

(assert (=> b!33460 (= e!21237 lt!12196)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!29 (List!866 (_ BitVec 64)) Unit!752)

(assert (=> b!33460 (= lt!12196 (lemmaContainsKeyImpliesGetValueByKeyDefined!29 (toList!437 lt!12141) (select (arr!1080 _keys!1833) lt!12138)))))

(declare-datatypes ((Option!74 0))(
  ( (Some!73 (v!1887 V!1867)) (None!72) )
))
(declare-fun isDefined!30 (Option!74) Bool)

(declare-fun getValueByKey!68 (List!866 (_ BitVec 64)) Option!74)

(assert (=> b!33460 (isDefined!30 (getValueByKey!68 (toList!437 lt!12141) (select (arr!1080 _keys!1833) lt!12138)))))

(declare-fun b!33461 () Bool)

(declare-fun Unit!754 () Unit!752)

(assert (=> b!33461 (= e!21237 Unit!754)))

(declare-fun b!33462 () Bool)

(assert (=> b!33462 (= e!21236 (isDefined!30 (getValueByKey!68 (toList!437 lt!12141) (select (arr!1080 _keys!1833) lt!12138))))))

(assert (= (and d!5129 c!3836) b!33460))

(assert (= (and d!5129 (not c!3836)) b!33461))

(assert (= (and d!5129 (not res!20334)) b!33462))

(assert (=> d!5129 m!26697))

(declare-fun m!26795 () Bool)

(assert (=> d!5129 m!26795))

(assert (=> b!33460 m!26697))

(declare-fun m!26797 () Bool)

(assert (=> b!33460 m!26797))

(assert (=> b!33460 m!26697))

(declare-fun m!26799 () Bool)

(assert (=> b!33460 m!26799))

(assert (=> b!33460 m!26799))

(declare-fun m!26801 () Bool)

(assert (=> b!33460 m!26801))

(assert (=> b!33462 m!26697))

(assert (=> b!33462 m!26799))

(assert (=> b!33462 m!26799))

(assert (=> b!33462 m!26801))

(assert (=> b!33361 d!5129))

(declare-fun d!5131 () Bool)

(declare-fun lt!12205 () SeekEntryResult!126)

(assert (=> d!5131 (and ((_ is Found!126) lt!12205) (= (index!2627 lt!12205) lt!12138))))

(assert (=> d!5131 (= lt!12205 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun lt!12204 () Unit!752)

(declare-fun choose!0 ((_ BitVec 64) (_ BitVec 32) array!2259 (_ BitVec 32)) Unit!752)

(assert (=> d!5131 (= lt!12204 (choose!0 k0!1304 lt!12138 _keys!1833 mask!2294))))

(assert (=> d!5131 (validMask!0 mask!2294)))

(assert (=> d!5131 (= (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!12138 _keys!1833 mask!2294) lt!12204)))

(declare-fun bs!1304 () Bool)

(assert (= bs!1304 d!5131))

(assert (=> bs!1304 m!26695))

(declare-fun m!26803 () Bool)

(assert (=> bs!1304 m!26803))

(assert (=> bs!1304 m!26705))

(assert (=> b!33361 d!5131))

(declare-fun d!5133 () Bool)

(declare-fun e!21240 () Bool)

(assert (=> d!5133 e!21240))

(declare-fun res!20337 () Bool)

(assert (=> d!5133 (=> (not res!20337) (not e!21240))))

(assert (=> d!5133 (= res!20337 (and (bvsge lt!12138 #b00000000000000000000000000000000) (bvslt lt!12138 (size!1181 _keys!1833))))))

(declare-fun lt!12208 () Unit!752)

(declare-fun choose!218 (array!2259 array!2261 (_ BitVec 32) (_ BitVec 32) V!1867 V!1867 (_ BitVec 32) Int) Unit!752)

(assert (=> d!5133 (= lt!12208 (choose!218 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!12138 defaultEntry!1504))))

(assert (=> d!5133 (validMask!0 mask!2294)))

(assert (=> d!5133 (= (lemmaValidKeyInArrayIsInListMap!60 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!12138 defaultEntry!1504) lt!12208)))

(declare-fun b!33465 () Bool)

(assert (=> b!33465 (= e!21240 (contains!382 (getCurrentListMap!260 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) (select (arr!1080 _keys!1833) lt!12138)))))

(assert (= (and d!5133 res!20337) b!33465))

(declare-fun m!26805 () Bool)

(assert (=> d!5133 m!26805))

(assert (=> d!5133 m!26705))

(assert (=> b!33465 m!26713))

(assert (=> b!33465 m!26697))

(assert (=> b!33465 m!26713))

(assert (=> b!33465 m!26697))

(declare-fun m!26807 () Bool)

(assert (=> b!33465 m!26807))

(assert (=> b!33361 d!5133))

(declare-fun b!33476 () Bool)

(declare-fun e!21249 () Bool)

(declare-fun contains!384 (List!867 (_ BitVec 64)) Bool)

(assert (=> b!33476 (= e!21249 (contains!384 Nil!864 (select (arr!1080 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!33477 () Bool)

(declare-fun e!21251 () Bool)

(declare-fun e!21250 () Bool)

(assert (=> b!33477 (= e!21251 e!21250)))

(declare-fun c!3839 () Bool)

(assert (=> b!33477 (= c!3839 (validKeyInArray!0 (select (arr!1080 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!33478 () Bool)

(declare-fun e!21252 () Bool)

(assert (=> b!33478 (= e!21252 e!21251)))

(declare-fun res!20344 () Bool)

(assert (=> b!33478 (=> (not res!20344) (not e!21251))))

(assert (=> b!33478 (= res!20344 (not e!21249))))

(declare-fun res!20345 () Bool)

(assert (=> b!33478 (=> (not res!20345) (not e!21249))))

(assert (=> b!33478 (= res!20345 (validKeyInArray!0 (select (arr!1080 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun d!5135 () Bool)

(declare-fun res!20346 () Bool)

(assert (=> d!5135 (=> res!20346 e!21252)))

(assert (=> d!5135 (= res!20346 (bvsge #b00000000000000000000000000000000 (size!1181 _keys!1833)))))

(assert (=> d!5135 (= (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!864) e!21252)))

(declare-fun b!33479 () Bool)

(declare-fun call!2658 () Bool)

(assert (=> b!33479 (= e!21250 call!2658)))

(declare-fun bm!2655 () Bool)

(assert (=> bm!2655 (= call!2658 (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!3839 (Cons!863 (select (arr!1080 _keys!1833) #b00000000000000000000000000000000) Nil!864) Nil!864)))))

(declare-fun b!33480 () Bool)

(assert (=> b!33480 (= e!21250 call!2658)))

(assert (= (and d!5135 (not res!20346)) b!33478))

(assert (= (and b!33478 res!20345) b!33476))

(assert (= (and b!33478 res!20344) b!33477))

(assert (= (and b!33477 c!3839) b!33480))

(assert (= (and b!33477 (not c!3839)) b!33479))

(assert (= (or b!33480 b!33479) bm!2655))

(assert (=> b!33476 m!26781))

(assert (=> b!33476 m!26781))

(declare-fun m!26809 () Bool)

(assert (=> b!33476 m!26809))

(assert (=> b!33477 m!26781))

(assert (=> b!33477 m!26781))

(declare-fun m!26811 () Bool)

(assert (=> b!33477 m!26811))

(assert (=> b!33478 m!26781))

(assert (=> b!33478 m!26781))

(assert (=> b!33478 m!26811))

(assert (=> bm!2655 m!26781))

(declare-fun m!26813 () Bool)

(assert (=> bm!2655 m!26813))

(assert (=> b!33369 d!5135))

(declare-fun d!5137 () Bool)

(assert (=> d!5137 (= (validKeyInArray!0 k0!1304) (and (not (= k0!1304 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1304 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!33360 d!5137))

(declare-fun d!5139 () Bool)

(declare-fun res!20351 () Bool)

(declare-fun e!21257 () Bool)

(assert (=> d!5139 (=> res!20351 e!21257)))

(assert (=> d!5139 (= res!20351 (= (select (arr!1080 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5139 (= (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) e!21257)))

(declare-fun b!33485 () Bool)

(declare-fun e!21258 () Bool)

(assert (=> b!33485 (= e!21257 e!21258)))

(declare-fun res!20352 () Bool)

(assert (=> b!33485 (=> (not res!20352) (not e!21258))))

(assert (=> b!33485 (= res!20352 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1181 _keys!1833)))))

(declare-fun b!33486 () Bool)

(assert (=> b!33486 (= e!21258 (arrayContainsKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5139 (not res!20351)) b!33485))

(assert (= (and b!33485 res!20352) b!33486))

(assert (=> d!5139 m!26781))

(declare-fun m!26815 () Bool)

(assert (=> b!33486 m!26815))

(assert (=> b!33363 d!5139))

(declare-fun b!33495 () Bool)

(declare-fun e!21267 () Bool)

(declare-fun e!21265 () Bool)

(assert (=> b!33495 (= e!21267 e!21265)))

(declare-fun c!3842 () Bool)

(assert (=> b!33495 (= c!3842 (validKeyInArray!0 (select (arr!1080 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!33496 () Bool)

(declare-fun e!21266 () Bool)

(declare-fun call!2661 () Bool)

(assert (=> b!33496 (= e!21266 call!2661)))

(declare-fun d!5141 () Bool)

(declare-fun res!20357 () Bool)

(assert (=> d!5141 (=> res!20357 e!21267)))

(assert (=> d!5141 (= res!20357 (bvsge #b00000000000000000000000000000000 (size!1181 _keys!1833)))))

(assert (=> d!5141 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!21267)))

(declare-fun bm!2658 () Bool)

(assert (=> bm!2658 (= call!2661 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun b!33497 () Bool)

(assert (=> b!33497 (= e!21265 e!21266)))

(declare-fun lt!12216 () (_ BitVec 64))

(assert (=> b!33497 (= lt!12216 (select (arr!1080 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12215 () Unit!752)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2259 (_ BitVec 64) (_ BitVec 32)) Unit!752)

(assert (=> b!33497 (= lt!12215 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!12216 #b00000000000000000000000000000000))))

(assert (=> b!33497 (arrayContainsKey!0 _keys!1833 lt!12216 #b00000000000000000000000000000000)))

(declare-fun lt!12217 () Unit!752)

(assert (=> b!33497 (= lt!12217 lt!12215)))

(declare-fun res!20358 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2259 (_ BitVec 32)) SeekEntryResult!126)

(assert (=> b!33497 (= res!20358 (= (seekEntryOrOpen!0 (select (arr!1080 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!126 #b00000000000000000000000000000000)))))

(assert (=> b!33497 (=> (not res!20358) (not e!21266))))

(declare-fun b!33498 () Bool)

(assert (=> b!33498 (= e!21265 call!2661)))

(assert (= (and d!5141 (not res!20357)) b!33495))

(assert (= (and b!33495 c!3842) b!33497))

(assert (= (and b!33495 (not c!3842)) b!33498))

(assert (= (and b!33497 res!20358) b!33496))

(assert (= (or b!33496 b!33498) bm!2658))

(assert (=> b!33495 m!26781))

(assert (=> b!33495 m!26781))

(assert (=> b!33495 m!26811))

(declare-fun m!26817 () Bool)

(assert (=> bm!2658 m!26817))

(assert (=> b!33497 m!26781))

(declare-fun m!26819 () Bool)

(assert (=> b!33497 m!26819))

(declare-fun m!26821 () Bool)

(assert (=> b!33497 m!26821))

(assert (=> b!33497 m!26781))

(declare-fun m!26823 () Bool)

(assert (=> b!33497 m!26823))

(assert (=> b!33367 d!5141))

(declare-fun d!5143 () Bool)

(declare-fun e!21268 () Bool)

(assert (=> d!5143 e!21268))

(declare-fun res!20359 () Bool)

(assert (=> d!5143 (=> res!20359 e!21268)))

(declare-fun lt!12220 () Bool)

(assert (=> d!5143 (= res!20359 (not lt!12220))))

(declare-fun lt!12221 () Bool)

(assert (=> d!5143 (= lt!12220 lt!12221)))

(declare-fun lt!12219 () Unit!752)

(declare-fun e!21269 () Unit!752)

(assert (=> d!5143 (= lt!12219 e!21269)))

(declare-fun c!3843 () Bool)

(assert (=> d!5143 (= c!3843 lt!12221)))

(assert (=> d!5143 (= lt!12221 (containsKey!32 (toList!437 lt!12141) k0!1304))))

(assert (=> d!5143 (= (contains!382 lt!12141 k0!1304) lt!12220)))

(declare-fun b!33499 () Bool)

(declare-fun lt!12218 () Unit!752)

(assert (=> b!33499 (= e!21269 lt!12218)))

(assert (=> b!33499 (= lt!12218 (lemmaContainsKeyImpliesGetValueByKeyDefined!29 (toList!437 lt!12141) k0!1304))))

(assert (=> b!33499 (isDefined!30 (getValueByKey!68 (toList!437 lt!12141) k0!1304))))

(declare-fun b!33500 () Bool)

(declare-fun Unit!755 () Unit!752)

(assert (=> b!33500 (= e!21269 Unit!755)))

(declare-fun b!33501 () Bool)

(assert (=> b!33501 (= e!21268 (isDefined!30 (getValueByKey!68 (toList!437 lt!12141) k0!1304)))))

(assert (= (and d!5143 c!3843) b!33499))

(assert (= (and d!5143 (not c!3843)) b!33500))

(assert (= (and d!5143 (not res!20359)) b!33501))

(declare-fun m!26825 () Bool)

(assert (=> d!5143 m!26825))

(declare-fun m!26827 () Bool)

(assert (=> b!33499 m!26827))

(declare-fun m!26829 () Bool)

(assert (=> b!33499 m!26829))

(assert (=> b!33499 m!26829))

(declare-fun m!26831 () Bool)

(assert (=> b!33499 m!26831))

(assert (=> b!33501 m!26829))

(assert (=> b!33501 m!26829))

(assert (=> b!33501 m!26831))

(assert (=> b!33366 d!5143))

(declare-fun b!33544 () Bool)

(declare-fun lt!12279 () ListLongMap!843)

(declare-fun e!21299 () Bool)

(declare-fun apply!36 (ListLongMap!843 (_ BitVec 64)) V!1867)

(declare-fun get!571 (ValueCell!566 V!1867) V!1867)

(declare-fun dynLambda!149 (Int (_ BitVec 64)) V!1867)

(assert (=> b!33544 (= e!21299 (= (apply!36 lt!12279 (select (arr!1080 _keys!1833) #b00000000000000000000000000000000)) (get!571 (select (arr!1081 _values!1501) #b00000000000000000000000000000000) (dynLambda!149 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!33544 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1182 _values!1501)))))

(assert (=> b!33544 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1181 _keys!1833)))))

(declare-fun b!33545 () Bool)

(declare-fun e!21307 () ListLongMap!843)

(declare-fun call!2676 () ListLongMap!843)

(assert (=> b!33545 (= e!21307 call!2676)))

(declare-fun bm!2673 () Bool)

(declare-fun call!2682 () ListLongMap!843)

(declare-fun call!2678 () ListLongMap!843)

(assert (=> bm!2673 (= call!2682 call!2678)))

(declare-fun b!33546 () Bool)

(declare-fun e!21302 () Bool)

(assert (=> b!33546 (= e!21302 (validKeyInArray!0 (select (arr!1080 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!33548 () Bool)

(declare-fun e!21301 () Unit!752)

(declare-fun lt!12281 () Unit!752)

(assert (=> b!33548 (= e!21301 lt!12281)))

(declare-fun lt!12285 () ListLongMap!843)

(declare-fun getCurrentListMapNoExtraKeys!23 (array!2259 array!2261 (_ BitVec 32) (_ BitVec 32) V!1867 V!1867 (_ BitVec 32) Int) ListLongMap!843)

(assert (=> b!33548 (= lt!12285 (getCurrentListMapNoExtraKeys!23 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12266 () (_ BitVec 64))

(assert (=> b!33548 (= lt!12266 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12274 () (_ BitVec 64))

(assert (=> b!33548 (= lt!12274 (select (arr!1080 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12270 () Unit!752)

(declare-fun addStillContains!21 (ListLongMap!843 (_ BitVec 64) V!1867 (_ BitVec 64)) Unit!752)

(assert (=> b!33548 (= lt!12270 (addStillContains!21 lt!12285 lt!12266 zeroValue!1443 lt!12274))))

(declare-fun +!53 (ListLongMap!843 tuple2!1272) ListLongMap!843)

(assert (=> b!33548 (contains!382 (+!53 lt!12285 (tuple2!1273 lt!12266 zeroValue!1443)) lt!12274)))

(declare-fun lt!12268 () Unit!752)

(assert (=> b!33548 (= lt!12268 lt!12270)))

(declare-fun lt!12286 () ListLongMap!843)

(assert (=> b!33548 (= lt!12286 (getCurrentListMapNoExtraKeys!23 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12284 () (_ BitVec 64))

(assert (=> b!33548 (= lt!12284 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12272 () (_ BitVec 64))

(assert (=> b!33548 (= lt!12272 (select (arr!1080 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12273 () Unit!752)

(declare-fun addApplyDifferent!21 (ListLongMap!843 (_ BitVec 64) V!1867 (_ BitVec 64)) Unit!752)

(assert (=> b!33548 (= lt!12273 (addApplyDifferent!21 lt!12286 lt!12284 minValue!1443 lt!12272))))

(assert (=> b!33548 (= (apply!36 (+!53 lt!12286 (tuple2!1273 lt!12284 minValue!1443)) lt!12272) (apply!36 lt!12286 lt!12272))))

(declare-fun lt!12287 () Unit!752)

(assert (=> b!33548 (= lt!12287 lt!12273)))

(declare-fun lt!12276 () ListLongMap!843)

(assert (=> b!33548 (= lt!12276 (getCurrentListMapNoExtraKeys!23 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12278 () (_ BitVec 64))

(assert (=> b!33548 (= lt!12278 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12269 () (_ BitVec 64))

(assert (=> b!33548 (= lt!12269 (select (arr!1080 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12277 () Unit!752)

(assert (=> b!33548 (= lt!12277 (addApplyDifferent!21 lt!12276 lt!12278 zeroValue!1443 lt!12269))))

(assert (=> b!33548 (= (apply!36 (+!53 lt!12276 (tuple2!1273 lt!12278 zeroValue!1443)) lt!12269) (apply!36 lt!12276 lt!12269))))

(declare-fun lt!12282 () Unit!752)

(assert (=> b!33548 (= lt!12282 lt!12277)))

(declare-fun lt!12280 () ListLongMap!843)

(assert (=> b!33548 (= lt!12280 (getCurrentListMapNoExtraKeys!23 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12275 () (_ BitVec 64))

(assert (=> b!33548 (= lt!12275 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12283 () (_ BitVec 64))

(assert (=> b!33548 (= lt!12283 (select (arr!1080 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> b!33548 (= lt!12281 (addApplyDifferent!21 lt!12280 lt!12275 minValue!1443 lt!12283))))

(assert (=> b!33548 (= (apply!36 (+!53 lt!12280 (tuple2!1273 lt!12275 minValue!1443)) lt!12283) (apply!36 lt!12280 lt!12283))))

(declare-fun b!33549 () Bool)

(declare-fun e!21306 () ListLongMap!843)

(declare-fun call!2677 () ListLongMap!843)

(assert (=> b!33549 (= e!21306 (+!53 call!2677 (tuple2!1273 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))

(declare-fun b!33550 () Bool)

(declare-fun e!21304 () Bool)

(declare-fun call!2680 () Bool)

(assert (=> b!33550 (= e!21304 (not call!2680))))

(declare-fun b!33551 () Bool)

(declare-fun e!21298 () ListLongMap!843)

(assert (=> b!33551 (= e!21298 call!2676)))

(declare-fun b!33552 () Bool)

(declare-fun res!20385 () Bool)

(declare-fun e!21305 () Bool)

(assert (=> b!33552 (=> (not res!20385) (not e!21305))))

(declare-fun e!21308 () Bool)

(assert (=> b!33552 (= res!20385 e!21308)))

(declare-fun res!20384 () Bool)

(assert (=> b!33552 (=> res!20384 e!21308)))

(assert (=> b!33552 (= res!20384 (not e!21302))))

(declare-fun res!20381 () Bool)

(assert (=> b!33552 (=> (not res!20381) (not e!21302))))

(assert (=> b!33552 (= res!20381 (bvslt #b00000000000000000000000000000000 (size!1181 _keys!1833)))))

(declare-fun bm!2674 () Bool)

(declare-fun call!2679 () ListLongMap!843)

(assert (=> bm!2674 (= call!2678 call!2679)))

(declare-fun bm!2675 () Bool)

(assert (=> bm!2675 (= call!2679 (getCurrentListMapNoExtraKeys!23 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun c!3858 () Bool)

(declare-fun bm!2676 () Bool)

(declare-fun c!3859 () Bool)

(assert (=> bm!2676 (= call!2677 (+!53 (ite c!3858 call!2679 (ite c!3859 call!2678 call!2682)) (ite (or c!3858 c!3859) (tuple2!1273 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1273 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(declare-fun b!33553 () Bool)

(declare-fun e!21297 () Bool)

(assert (=> b!33553 (= e!21297 (= (apply!36 lt!12279 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1443))))

(declare-fun b!33554 () Bool)

(declare-fun e!21303 () Bool)

(declare-fun call!2681 () Bool)

(assert (=> b!33554 (= e!21303 (not call!2681))))

(declare-fun b!33555 () Bool)

(declare-fun e!21300 () Bool)

(assert (=> b!33555 (= e!21300 (validKeyInArray!0 (select (arr!1080 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!33556 () Bool)

(assert (=> b!33556 (= e!21307 call!2682)))

(declare-fun b!33557 () Bool)

(assert (=> b!33557 (= e!21304 e!21297)))

(declare-fun res!20386 () Bool)

(assert (=> b!33557 (= res!20386 call!2680)))

(assert (=> b!33557 (=> (not res!20386) (not e!21297))))

(declare-fun d!5145 () Bool)

(assert (=> d!5145 e!21305))

(declare-fun res!20379 () Bool)

(assert (=> d!5145 (=> (not res!20379) (not e!21305))))

(assert (=> d!5145 (= res!20379 (or (bvsge #b00000000000000000000000000000000 (size!1181 _keys!1833)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1181 _keys!1833)))))))

(declare-fun lt!12271 () ListLongMap!843)

(assert (=> d!5145 (= lt!12279 lt!12271)))

(declare-fun lt!12267 () Unit!752)

(assert (=> d!5145 (= lt!12267 e!21301)))

(declare-fun c!3860 () Bool)

(assert (=> d!5145 (= c!3860 e!21300)))

(declare-fun res!20380 () Bool)

(assert (=> d!5145 (=> (not res!20380) (not e!21300))))

(assert (=> d!5145 (= res!20380 (bvslt #b00000000000000000000000000000000 (size!1181 _keys!1833)))))

(assert (=> d!5145 (= lt!12271 e!21306)))

(assert (=> d!5145 (= c!3858 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!5145 (validMask!0 mask!2294)))

(assert (=> d!5145 (= (getCurrentListMap!260 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) lt!12279)))

(declare-fun b!33547 () Bool)

(declare-fun e!21296 () Bool)

(assert (=> b!33547 (= e!21296 (= (apply!36 lt!12279 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1443))))

(declare-fun b!33558 () Bool)

(assert (=> b!33558 (= e!21303 e!21296)))

(declare-fun res!20378 () Bool)

(assert (=> b!33558 (= res!20378 call!2681)))

(assert (=> b!33558 (=> (not res!20378) (not e!21296))))

(declare-fun bm!2677 () Bool)

(assert (=> bm!2677 (= call!2680 (contains!382 lt!12279 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!33559 () Bool)

(assert (=> b!33559 (= e!21306 e!21298)))

(assert (=> b!33559 (= c!3859 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!33560 () Bool)

(declare-fun Unit!756 () Unit!752)

(assert (=> b!33560 (= e!21301 Unit!756)))

(declare-fun b!33561 () Bool)

(assert (=> b!33561 (= e!21308 e!21299)))

(declare-fun res!20383 () Bool)

(assert (=> b!33561 (=> (not res!20383) (not e!21299))))

(assert (=> b!33561 (= res!20383 (contains!382 lt!12279 (select (arr!1080 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!33561 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1181 _keys!1833)))))

(declare-fun bm!2678 () Bool)

(assert (=> bm!2678 (= call!2676 call!2677)))

(declare-fun b!33562 () Bool)

(declare-fun res!20382 () Bool)

(assert (=> b!33562 (=> (not res!20382) (not e!21305))))

(assert (=> b!33562 (= res!20382 e!21304)))

(declare-fun c!3856 () Bool)

(assert (=> b!33562 (= c!3856 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!33563 () Bool)

(assert (=> b!33563 (= e!21305 e!21303)))

(declare-fun c!3857 () Bool)

(assert (=> b!33563 (= c!3857 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!2679 () Bool)

(assert (=> bm!2679 (= call!2681 (contains!382 lt!12279 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!33564 () Bool)

(declare-fun c!3861 () Bool)

(assert (=> b!33564 (= c!3861 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!33564 (= e!21298 e!21307)))

(assert (= (and d!5145 c!3858) b!33549))

(assert (= (and d!5145 (not c!3858)) b!33559))

(assert (= (and b!33559 c!3859) b!33551))

(assert (= (and b!33559 (not c!3859)) b!33564))

(assert (= (and b!33564 c!3861) b!33545))

(assert (= (and b!33564 (not c!3861)) b!33556))

(assert (= (or b!33545 b!33556) bm!2673))

(assert (= (or b!33551 bm!2673) bm!2674))

(assert (= (or b!33551 b!33545) bm!2678))

(assert (= (or b!33549 bm!2674) bm!2675))

(assert (= (or b!33549 bm!2678) bm!2676))

(assert (= (and d!5145 res!20380) b!33555))

(assert (= (and d!5145 c!3860) b!33548))

(assert (= (and d!5145 (not c!3860)) b!33560))

(assert (= (and d!5145 res!20379) b!33552))

(assert (= (and b!33552 res!20381) b!33546))

(assert (= (and b!33552 (not res!20384)) b!33561))

(assert (= (and b!33561 res!20383) b!33544))

(assert (= (and b!33552 res!20385) b!33562))

(assert (= (and b!33562 c!3856) b!33557))

(assert (= (and b!33562 (not c!3856)) b!33550))

(assert (= (and b!33557 res!20386) b!33553))

(assert (= (or b!33557 b!33550) bm!2677))

(assert (= (and b!33562 res!20382) b!33563))

(assert (= (and b!33563 c!3857) b!33558))

(assert (= (and b!33563 (not c!3857)) b!33554))

(assert (= (and b!33558 res!20378) b!33547))

(assert (= (or b!33558 b!33554) bm!2679))

(declare-fun b_lambda!1691 () Bool)

(assert (=> (not b_lambda!1691) (not b!33544)))

(declare-fun t!3563 () Bool)

(declare-fun tb!681 () Bool)

(assert (=> (and start!4332 (= defaultEntry!1504 defaultEntry!1504) t!3563) tb!681))

(declare-fun result!1165 () Bool)

(assert (=> tb!681 (= result!1165 tp_is_empty!1531)))

(assert (=> b!33544 t!3563))

(declare-fun b_and!1989 () Bool)

(assert (= b_and!1983 (and (=> t!3563 result!1165) b_and!1989)))

(declare-fun m!26833 () Bool)

(assert (=> b!33548 m!26833))

(assert (=> b!33548 m!26781))

(declare-fun m!26835 () Bool)

(assert (=> b!33548 m!26835))

(declare-fun m!26837 () Bool)

(assert (=> b!33548 m!26837))

(assert (=> b!33548 m!26835))

(declare-fun m!26839 () Bool)

(assert (=> b!33548 m!26839))

(declare-fun m!26841 () Bool)

(assert (=> b!33548 m!26841))

(declare-fun m!26843 () Bool)

(assert (=> b!33548 m!26843))

(declare-fun m!26845 () Bool)

(assert (=> b!33548 m!26845))

(assert (=> b!33548 m!26843))

(declare-fun m!26847 () Bool)

(assert (=> b!33548 m!26847))

(declare-fun m!26849 () Bool)

(assert (=> b!33548 m!26849))

(declare-fun m!26851 () Bool)

(assert (=> b!33548 m!26851))

(declare-fun m!26853 () Bool)

(assert (=> b!33548 m!26853))

(assert (=> b!33548 m!26837))

(declare-fun m!26855 () Bool)

(assert (=> b!33548 m!26855))

(declare-fun m!26857 () Bool)

(assert (=> b!33548 m!26857))

(assert (=> b!33548 m!26841))

(declare-fun m!26859 () Bool)

(assert (=> b!33548 m!26859))

(declare-fun m!26861 () Bool)

(assert (=> b!33548 m!26861))

(declare-fun m!26863 () Bool)

(assert (=> b!33548 m!26863))

(declare-fun m!26865 () Bool)

(assert (=> b!33553 m!26865))

(assert (=> bm!2675 m!26857))

(assert (=> b!33544 m!26781))

(declare-fun m!26867 () Bool)

(assert (=> b!33544 m!26867))

(declare-fun m!26869 () Bool)

(assert (=> b!33544 m!26869))

(declare-fun m!26871 () Bool)

(assert (=> b!33544 m!26871))

(assert (=> b!33544 m!26869))

(assert (=> b!33544 m!26867))

(assert (=> b!33544 m!26781))

(declare-fun m!26873 () Bool)

(assert (=> b!33544 m!26873))

(declare-fun m!26875 () Bool)

(assert (=> b!33549 m!26875))

(assert (=> b!33546 m!26781))

(assert (=> b!33546 m!26781))

(assert (=> b!33546 m!26811))

(assert (=> b!33555 m!26781))

(assert (=> b!33555 m!26781))

(assert (=> b!33555 m!26811))

(declare-fun m!26877 () Bool)

(assert (=> b!33547 m!26877))

(declare-fun m!26879 () Bool)

(assert (=> bm!2677 m!26879))

(assert (=> b!33561 m!26781))

(assert (=> b!33561 m!26781))

(declare-fun m!26881 () Bool)

(assert (=> b!33561 m!26881))

(declare-fun m!26883 () Bool)

(assert (=> bm!2679 m!26883))

(declare-fun m!26885 () Bool)

(assert (=> bm!2676 m!26885))

(assert (=> d!5145 m!26705))

(assert (=> b!33366 d!5145))

(declare-fun d!5147 () Bool)

(assert (=> d!5147 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!4332 d!5147))

(declare-fun d!5149 () Bool)

(assert (=> d!5149 (= (array_inv!741 _values!1501) (bvsge (size!1182 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!4332 d!5149))

(declare-fun d!5151 () Bool)

(assert (=> d!5151 (= (array_inv!742 _keys!1833) (bvsge (size!1181 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!4332 d!5151))

(declare-fun b!33573 () Bool)

(declare-fun e!21313 () Bool)

(assert (=> b!33573 (= e!21313 tp_is_empty!1531)))

(declare-fun b!33574 () Bool)

(declare-fun e!21314 () Bool)

(assert (=> b!33574 (= e!21314 tp_is_empty!1531)))

(declare-fun mapNonEmpty!1843 () Bool)

(declare-fun mapRes!1843 () Bool)

(declare-fun tp!4975 () Bool)

(assert (=> mapNonEmpty!1843 (= mapRes!1843 (and tp!4975 e!21313))))

(declare-fun mapKey!1843 () (_ BitVec 32))

(declare-fun mapRest!1843 () (Array (_ BitVec 32) ValueCell!566))

(declare-fun mapValue!1843 () ValueCell!566)

(assert (=> mapNonEmpty!1843 (= mapRest!1834 (store mapRest!1843 mapKey!1843 mapValue!1843))))

(declare-fun condMapEmpty!1843 () Bool)

(declare-fun mapDefault!1843 () ValueCell!566)

(assert (=> mapNonEmpty!1834 (= condMapEmpty!1843 (= mapRest!1834 ((as const (Array (_ BitVec 32) ValueCell!566)) mapDefault!1843)))))

(assert (=> mapNonEmpty!1834 (= tp!4960 (and e!21314 mapRes!1843))))

(declare-fun mapIsEmpty!1843 () Bool)

(assert (=> mapIsEmpty!1843 mapRes!1843))

(assert (= (and mapNonEmpty!1834 condMapEmpty!1843) mapIsEmpty!1843))

(assert (= (and mapNonEmpty!1834 (not condMapEmpty!1843)) mapNonEmpty!1843))

(assert (= (and mapNonEmpty!1843 ((_ is ValueCellFull!566) mapValue!1843)) b!33573))

(assert (= (and mapNonEmpty!1834 ((_ is ValueCellFull!566) mapDefault!1843)) b!33574))

(declare-fun m!26887 () Bool)

(assert (=> mapNonEmpty!1843 m!26887))

(declare-fun b_lambda!1693 () Bool)

(assert (= b_lambda!1691 (or (and start!4332 b_free!1177) b_lambda!1693)))

(check-sat (not d!5143) (not bm!2677) (not bm!2679) (not b!33548) (not b!33501) (not mapNonEmpty!1843) (not b!33462) (not bm!2658) (not b!33460) (not b!33495) tp_is_empty!1531 (not b!33547) (not b!33486) (not b!33435) (not bm!2676) (not d!5131) (not b!33451) (not b!33553) (not b_lambda!1693) (not b_next!1177) (not b!33465) (not d!5145) (not bm!2675) (not b!33477) (not d!5133) (not b!33476) (not b!33546) (not b!33497) (not b!33499) (not bm!2655) (not d!5127) (not b!33555) (not b!33544) (not b!33549) (not b!33561) (not b!33478) (not d!5129) b_and!1989)
(check-sat b_and!1989 (not b_next!1177))
