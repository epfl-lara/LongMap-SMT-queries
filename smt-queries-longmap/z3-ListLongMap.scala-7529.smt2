; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95698 () Bool)

(assert start!95698)

(declare-fun b!1079407 () Bool)

(declare-fun e!617273 () Bool)

(declare-fun e!617271 () Bool)

(assert (=> b!1079407 (= e!617273 e!617271)))

(declare-fun res!718876 () Bool)

(assert (=> b!1079407 (=> res!718876 e!617271)))

(declare-datatypes ((List!23242 0))(
  ( (Nil!23239) (Cons!23238 (h!24456 (_ BitVec 64)) (t!32593 List!23242)) )
))
(declare-fun contains!6397 (List!23242 (_ BitVec 64)) Bool)

(assert (=> b!1079407 (= res!718876 (contains!6397 Nil!23239 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!40972 () Bool)

(declare-fun mapRes!40972 () Bool)

(declare-fun tp!78434 () Bool)

(declare-fun e!617272 () Bool)

(assert (=> mapNonEmpty!40972 (= mapRes!40972 (and tp!78434 e!617272))))

(declare-datatypes ((V!39993 0))(
  ( (V!39994 (val!13131 Int)) )
))
(declare-datatypes ((ValueCell!12365 0))(
  ( (ValueCellFull!12365 (v!15747 V!39993)) (EmptyCell!12365) )
))
(declare-datatypes ((array!69289 0))(
  ( (array!69290 (arr!33314 (Array (_ BitVec 32) ValueCell!12365)) (size!33851 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69289)

(declare-fun mapValue!40972 () ValueCell!12365)

(declare-fun mapKey!40972 () (_ BitVec 32))

(declare-fun mapRest!40972 () (Array (_ BitVec 32) ValueCell!12365))

(assert (=> mapNonEmpty!40972 (= (arr!33314 _values!874) (store mapRest!40972 mapKey!40972 mapValue!40972))))

(declare-fun b!1079408 () Bool)

(declare-fun res!718878 () Bool)

(assert (=> b!1079408 (=> (not res!718878) (not e!617273))))

(declare-datatypes ((array!69291 0))(
  ( (array!69292 (arr!33315 (Array (_ BitVec 32) (_ BitVec 64))) (size!33852 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69291)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun i!650 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69291 (_ BitVec 32)) Bool)

(assert (=> b!1079408 (= res!718878 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!69292 (store (arr!33315 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33852 _keys!1070)) mask!1414))))

(declare-fun b!1079409 () Bool)

(declare-fun res!718873 () Bool)

(assert (=> b!1079409 (=> (not res!718873) (not e!617273))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1079409 (= res!718873 (and (= (size!33851 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33852 _keys!1070) (size!33851 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1079410 () Bool)

(declare-fun e!617276 () Bool)

(declare-fun e!617274 () Bool)

(assert (=> b!1079410 (= e!617276 (and e!617274 mapRes!40972))))

(declare-fun condMapEmpty!40972 () Bool)

(declare-fun mapDefault!40972 () ValueCell!12365)

(assert (=> b!1079410 (= condMapEmpty!40972 (= (arr!33314 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12365)) mapDefault!40972)))))

(declare-fun b!1079411 () Bool)

(assert (=> b!1079411 (= e!617271 (contains!6397 Nil!23239 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!40972 () Bool)

(assert (=> mapIsEmpty!40972 mapRes!40972))

(declare-fun b!1079412 () Bool)

(declare-fun res!718869 () Bool)

(assert (=> b!1079412 (=> (not res!718869) (not e!617273))))

(assert (=> b!1079412 (= res!718869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1079413 () Bool)

(declare-fun res!718872 () Bool)

(assert (=> b!1079413 (=> (not res!718872) (not e!617273))))

(declare-fun arrayNoDuplicates!0 (array!69291 (_ BitVec 32) List!23242) Bool)

(assert (=> b!1079413 (= res!718872 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23239))))

(declare-fun b!1079414 () Bool)

(declare-fun res!718868 () Bool)

(assert (=> b!1079414 (=> (not res!718868) (not e!617273))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1079414 (= res!718868 (= (select (arr!33315 _keys!1070) i!650) k0!904))))

(declare-fun res!718875 () Bool)

(assert (=> start!95698 (=> (not res!718875) (not e!617273))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95698 (= res!718875 (validMask!0 mask!1414))))

(assert (=> start!95698 e!617273))

(assert (=> start!95698 true))

(declare-fun array_inv!25774 (array!69291) Bool)

(assert (=> start!95698 (array_inv!25774 _keys!1070)))

(declare-fun array_inv!25775 (array!69289) Bool)

(assert (=> start!95698 (and (array_inv!25775 _values!874) e!617276)))

(declare-fun b!1079415 () Bool)

(declare-fun res!718871 () Bool)

(assert (=> b!1079415 (=> (not res!718871) (not e!617273))))

(assert (=> b!1079415 (= res!718871 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33852 _keys!1070))))))

(declare-fun b!1079416 () Bool)

(declare-fun res!718870 () Bool)

(assert (=> b!1079416 (=> (not res!718870) (not e!617273))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1079416 (= res!718870 (validKeyInArray!0 k0!904))))

(declare-fun b!1079417 () Bool)

(declare-fun tp_is_empty!26149 () Bool)

(assert (=> b!1079417 (= e!617272 tp_is_empty!26149)))

(declare-fun b!1079418 () Bool)

(declare-fun res!718877 () Bool)

(assert (=> b!1079418 (=> (not res!718877) (not e!617273))))

(declare-fun noDuplicate!1593 (List!23242) Bool)

(assert (=> b!1079418 (= res!718877 (noDuplicate!1593 Nil!23239))))

(declare-fun b!1079419 () Bool)

(declare-fun res!718874 () Bool)

(assert (=> b!1079419 (=> (not res!718874) (not e!617273))))

(assert (=> b!1079419 (= res!718874 (and (bvsle #b00000000000000000000000000000000 (size!33852 _keys!1070)) (bvslt (size!33852 _keys!1070) #b01111111111111111111111111111111)))))

(declare-fun b!1079420 () Bool)

(assert (=> b!1079420 (= e!617274 tp_is_empty!26149)))

(assert (= (and start!95698 res!718875) b!1079409))

(assert (= (and b!1079409 res!718873) b!1079412))

(assert (= (and b!1079412 res!718869) b!1079413))

(assert (= (and b!1079413 res!718872) b!1079415))

(assert (= (and b!1079415 res!718871) b!1079416))

(assert (= (and b!1079416 res!718870) b!1079414))

(assert (= (and b!1079414 res!718868) b!1079408))

(assert (= (and b!1079408 res!718878) b!1079419))

(assert (= (and b!1079419 res!718874) b!1079418))

(assert (= (and b!1079418 res!718877) b!1079407))

(assert (= (and b!1079407 (not res!718876)) b!1079411))

(assert (= (and b!1079410 condMapEmpty!40972) mapIsEmpty!40972))

(assert (= (and b!1079410 (not condMapEmpty!40972)) mapNonEmpty!40972))

(get-info :version)

(assert (= (and mapNonEmpty!40972 ((_ is ValueCellFull!12365) mapValue!40972)) b!1079417))

(assert (= (and b!1079410 ((_ is ValueCellFull!12365) mapDefault!40972)) b!1079420))

(assert (= start!95698 b!1079410))

(declare-fun m!998365 () Bool)

(assert (=> b!1079414 m!998365))

(declare-fun m!998367 () Bool)

(assert (=> mapNonEmpty!40972 m!998367))

(declare-fun m!998369 () Bool)

(assert (=> start!95698 m!998369))

(declare-fun m!998371 () Bool)

(assert (=> start!95698 m!998371))

(declare-fun m!998373 () Bool)

(assert (=> start!95698 m!998373))

(declare-fun m!998375 () Bool)

(assert (=> b!1079412 m!998375))

(declare-fun m!998377 () Bool)

(assert (=> b!1079411 m!998377))

(declare-fun m!998379 () Bool)

(assert (=> b!1079408 m!998379))

(declare-fun m!998381 () Bool)

(assert (=> b!1079408 m!998381))

(declare-fun m!998383 () Bool)

(assert (=> b!1079416 m!998383))

(declare-fun m!998385 () Bool)

(assert (=> b!1079407 m!998385))

(declare-fun m!998387 () Bool)

(assert (=> b!1079418 m!998387))

(declare-fun m!998389 () Bool)

(assert (=> b!1079413 m!998389))

(check-sat (not b!1079413) (not b!1079411) (not b!1079418) (not mapNonEmpty!40972) (not b!1079407) (not b!1079416) tp_is_empty!26149 (not start!95698) (not b!1079412) (not b!1079408))
(check-sat)
(get-model)

(declare-fun b!1079515 () Bool)

(declare-fun e!617322 () Bool)

(declare-fun call!45803 () Bool)

(assert (=> b!1079515 (= e!617322 call!45803)))

(declare-fun b!1079516 () Bool)

(declare-fun e!617321 () Bool)

(declare-fun e!617323 () Bool)

(assert (=> b!1079516 (= e!617321 e!617323)))

(declare-fun res!718953 () Bool)

(assert (=> b!1079516 (=> (not res!718953) (not e!617323))))

(declare-fun e!617324 () Bool)

(assert (=> b!1079516 (= res!718953 (not e!617324))))

(declare-fun res!718951 () Bool)

(assert (=> b!1079516 (=> (not res!718951) (not e!617324))))

(assert (=> b!1079516 (= res!718951 (validKeyInArray!0 (select (arr!33315 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1079517 () Bool)

(assert (=> b!1079517 (= e!617323 e!617322)))

(declare-fun c!108740 () Bool)

(assert (=> b!1079517 (= c!108740 (validKeyInArray!0 (select (arr!33315 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun d!130361 () Bool)

(declare-fun res!718952 () Bool)

(assert (=> d!130361 (=> res!718952 e!617321)))

(assert (=> d!130361 (= res!718952 (bvsge #b00000000000000000000000000000000 (size!33852 _keys!1070)))))

(assert (=> d!130361 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23239) e!617321)))

(declare-fun b!1079518 () Bool)

(assert (=> b!1079518 (= e!617324 (contains!6397 Nil!23239 (select (arr!33315 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun bm!45800 () Bool)

(assert (=> bm!45800 (= call!45803 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108740 (Cons!23238 (select (arr!33315 _keys!1070) #b00000000000000000000000000000000) Nil!23239) Nil!23239)))))

(declare-fun b!1079519 () Bool)

(assert (=> b!1079519 (= e!617322 call!45803)))

(assert (= (and d!130361 (not res!718952)) b!1079516))

(assert (= (and b!1079516 res!718951) b!1079518))

(assert (= (and b!1079516 res!718953) b!1079517))

(assert (= (and b!1079517 c!108740) b!1079519))

(assert (= (and b!1079517 (not c!108740)) b!1079515))

(assert (= (or b!1079519 b!1079515) bm!45800))

(declare-fun m!998443 () Bool)

(assert (=> b!1079516 m!998443))

(assert (=> b!1079516 m!998443))

(declare-fun m!998445 () Bool)

(assert (=> b!1079516 m!998445))

(assert (=> b!1079517 m!998443))

(assert (=> b!1079517 m!998443))

(assert (=> b!1079517 m!998445))

(assert (=> b!1079518 m!998443))

(assert (=> b!1079518 m!998443))

(declare-fun m!998447 () Bool)

(assert (=> b!1079518 m!998447))

(assert (=> bm!45800 m!998443))

(declare-fun m!998449 () Bool)

(assert (=> bm!45800 m!998449))

(assert (=> b!1079413 d!130361))

(declare-fun b!1079528 () Bool)

(declare-fun e!617332 () Bool)

(declare-fun call!45806 () Bool)

(assert (=> b!1079528 (= e!617332 call!45806)))

(declare-fun b!1079529 () Bool)

(declare-fun e!617333 () Bool)

(assert (=> b!1079529 (= e!617333 call!45806)))

(declare-fun d!130363 () Bool)

(declare-fun res!718959 () Bool)

(declare-fun e!617331 () Bool)

(assert (=> d!130363 (=> res!718959 e!617331)))

(assert (=> d!130363 (= res!718959 (bvsge #b00000000000000000000000000000000 (size!33852 _keys!1070)))))

(assert (=> d!130363 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!617331)))

(declare-fun b!1079530 () Bool)

(assert (=> b!1079530 (= e!617331 e!617333)))

(declare-fun c!108743 () Bool)

(assert (=> b!1079530 (= c!108743 (validKeyInArray!0 (select (arr!33315 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun bm!45803 () Bool)

(assert (=> bm!45803 (= call!45806 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun b!1079531 () Bool)

(assert (=> b!1079531 (= e!617333 e!617332)))

(declare-fun lt!479105 () (_ BitVec 64))

(assert (=> b!1079531 (= lt!479105 (select (arr!33315 _keys!1070) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!35437 0))(
  ( (Unit!35438) )
))
(declare-fun lt!479104 () Unit!35437)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69291 (_ BitVec 64) (_ BitVec 32)) Unit!35437)

(assert (=> b!1079531 (= lt!479104 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!479105 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!69291 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1079531 (arrayContainsKey!0 _keys!1070 lt!479105 #b00000000000000000000000000000000)))

(declare-fun lt!479103 () Unit!35437)

(assert (=> b!1079531 (= lt!479103 lt!479104)))

(declare-fun res!718958 () Bool)

(declare-datatypes ((SeekEntryResult!9858 0))(
  ( (MissingZero!9858 (index!41803 (_ BitVec 32))) (Found!9858 (index!41804 (_ BitVec 32))) (Intermediate!9858 (undefined!10670 Bool) (index!41805 (_ BitVec 32)) (x!96623 (_ BitVec 32))) (Undefined!9858) (MissingVacant!9858 (index!41806 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!69291 (_ BitVec 32)) SeekEntryResult!9858)

(assert (=> b!1079531 (= res!718958 (= (seekEntryOrOpen!0 (select (arr!33315 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9858 #b00000000000000000000000000000000)))))

(assert (=> b!1079531 (=> (not res!718958) (not e!617332))))

(assert (= (and d!130363 (not res!718959)) b!1079530))

(assert (= (and b!1079530 c!108743) b!1079531))

(assert (= (and b!1079530 (not c!108743)) b!1079529))

(assert (= (and b!1079531 res!718958) b!1079528))

(assert (= (or b!1079528 b!1079529) bm!45803))

(assert (=> b!1079530 m!998443))

(assert (=> b!1079530 m!998443))

(assert (=> b!1079530 m!998445))

(declare-fun m!998451 () Bool)

(assert (=> bm!45803 m!998451))

(assert (=> b!1079531 m!998443))

(declare-fun m!998453 () Bool)

(assert (=> b!1079531 m!998453))

(declare-fun m!998455 () Bool)

(assert (=> b!1079531 m!998455))

(assert (=> b!1079531 m!998443))

(declare-fun m!998457 () Bool)

(assert (=> b!1079531 m!998457))

(assert (=> b!1079412 d!130363))

(declare-fun d!130365 () Bool)

(declare-fun res!718964 () Bool)

(declare-fun e!617338 () Bool)

(assert (=> d!130365 (=> res!718964 e!617338)))

(assert (=> d!130365 (= res!718964 ((_ is Nil!23239) Nil!23239))))

(assert (=> d!130365 (= (noDuplicate!1593 Nil!23239) e!617338)))

(declare-fun b!1079536 () Bool)

(declare-fun e!617339 () Bool)

(assert (=> b!1079536 (= e!617338 e!617339)))

(declare-fun res!718965 () Bool)

(assert (=> b!1079536 (=> (not res!718965) (not e!617339))))

(assert (=> b!1079536 (= res!718965 (not (contains!6397 (t!32593 Nil!23239) (h!24456 Nil!23239))))))

(declare-fun b!1079537 () Bool)

(assert (=> b!1079537 (= e!617339 (noDuplicate!1593 (t!32593 Nil!23239)))))

(assert (= (and d!130365 (not res!718964)) b!1079536))

(assert (= (and b!1079536 res!718965) b!1079537))

(declare-fun m!998459 () Bool)

(assert (=> b!1079536 m!998459))

(declare-fun m!998461 () Bool)

(assert (=> b!1079537 m!998461))

(assert (=> b!1079418 d!130365))

(declare-fun b!1079538 () Bool)

(declare-fun e!617341 () Bool)

(declare-fun call!45807 () Bool)

(assert (=> b!1079538 (= e!617341 call!45807)))

(declare-fun b!1079539 () Bool)

(declare-fun e!617342 () Bool)

(assert (=> b!1079539 (= e!617342 call!45807)))

(declare-fun d!130367 () Bool)

(declare-fun res!718967 () Bool)

(declare-fun e!617340 () Bool)

(assert (=> d!130367 (=> res!718967 e!617340)))

(assert (=> d!130367 (= res!718967 (bvsge #b00000000000000000000000000000000 (size!33852 (array!69292 (store (arr!33315 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33852 _keys!1070)))))))

(assert (=> d!130367 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!69292 (store (arr!33315 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33852 _keys!1070)) mask!1414) e!617340)))

(declare-fun b!1079540 () Bool)

(assert (=> b!1079540 (= e!617340 e!617342)))

(declare-fun c!108744 () Bool)

(assert (=> b!1079540 (= c!108744 (validKeyInArray!0 (select (arr!33315 (array!69292 (store (arr!33315 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33852 _keys!1070))) #b00000000000000000000000000000000)))))

(declare-fun bm!45804 () Bool)

(assert (=> bm!45804 (= call!45807 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!69292 (store (arr!33315 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33852 _keys!1070)) mask!1414))))

(declare-fun b!1079541 () Bool)

(assert (=> b!1079541 (= e!617342 e!617341)))

(declare-fun lt!479108 () (_ BitVec 64))

(assert (=> b!1079541 (= lt!479108 (select (arr!33315 (array!69292 (store (arr!33315 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33852 _keys!1070))) #b00000000000000000000000000000000))))

(declare-fun lt!479107 () Unit!35437)

(assert (=> b!1079541 (= lt!479107 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69292 (store (arr!33315 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33852 _keys!1070)) lt!479108 #b00000000000000000000000000000000))))

(assert (=> b!1079541 (arrayContainsKey!0 (array!69292 (store (arr!33315 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33852 _keys!1070)) lt!479108 #b00000000000000000000000000000000)))

(declare-fun lt!479106 () Unit!35437)

(assert (=> b!1079541 (= lt!479106 lt!479107)))

(declare-fun res!718966 () Bool)

(assert (=> b!1079541 (= res!718966 (= (seekEntryOrOpen!0 (select (arr!33315 (array!69292 (store (arr!33315 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33852 _keys!1070))) #b00000000000000000000000000000000) (array!69292 (store (arr!33315 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33852 _keys!1070)) mask!1414) (Found!9858 #b00000000000000000000000000000000)))))

(assert (=> b!1079541 (=> (not res!718966) (not e!617341))))

(assert (= (and d!130367 (not res!718967)) b!1079540))

(assert (= (and b!1079540 c!108744) b!1079541))

(assert (= (and b!1079540 (not c!108744)) b!1079539))

(assert (= (and b!1079541 res!718966) b!1079538))

(assert (= (or b!1079538 b!1079539) bm!45804))

(declare-fun m!998463 () Bool)

(assert (=> b!1079540 m!998463))

(assert (=> b!1079540 m!998463))

(declare-fun m!998465 () Bool)

(assert (=> b!1079540 m!998465))

(declare-fun m!998467 () Bool)

(assert (=> bm!45804 m!998467))

(assert (=> b!1079541 m!998463))

(declare-fun m!998469 () Bool)

(assert (=> b!1079541 m!998469))

(declare-fun m!998471 () Bool)

(assert (=> b!1079541 m!998471))

(assert (=> b!1079541 m!998463))

(declare-fun m!998473 () Bool)

(assert (=> b!1079541 m!998473))

(assert (=> b!1079408 d!130367))

(declare-fun d!130369 () Bool)

(assert (=> d!130369 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1079416 d!130369))

(declare-fun d!130371 () Bool)

(declare-fun lt!479111 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!539 (List!23242) (InoxSet (_ BitVec 64)))

(assert (=> d!130371 (= lt!479111 (select (content!539 Nil!23239) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!617348 () Bool)

(assert (=> d!130371 (= lt!479111 e!617348)))

(declare-fun res!718972 () Bool)

(assert (=> d!130371 (=> (not res!718972) (not e!617348))))

(assert (=> d!130371 (= res!718972 ((_ is Cons!23238) Nil!23239))))

(assert (=> d!130371 (= (contains!6397 Nil!23239 #b0000000000000000000000000000000000000000000000000000000000000000) lt!479111)))

(declare-fun b!1079546 () Bool)

(declare-fun e!617347 () Bool)

(assert (=> b!1079546 (= e!617348 e!617347)))

(declare-fun res!718973 () Bool)

(assert (=> b!1079546 (=> res!718973 e!617347)))

(assert (=> b!1079546 (= res!718973 (= (h!24456 Nil!23239) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1079547 () Bool)

(assert (=> b!1079547 (= e!617347 (contains!6397 (t!32593 Nil!23239) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!130371 res!718972) b!1079546))

(assert (= (and b!1079546 (not res!718973)) b!1079547))

(declare-fun m!998475 () Bool)

(assert (=> d!130371 m!998475))

(declare-fun m!998477 () Bool)

(assert (=> d!130371 m!998477))

(declare-fun m!998479 () Bool)

(assert (=> b!1079547 m!998479))

(assert (=> b!1079407 d!130371))

(declare-fun d!130373 () Bool)

(assert (=> d!130373 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!95698 d!130373))

(declare-fun d!130375 () Bool)

(assert (=> d!130375 (= (array_inv!25774 _keys!1070) (bvsge (size!33852 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!95698 d!130375))

(declare-fun d!130377 () Bool)

(assert (=> d!130377 (= (array_inv!25775 _values!874) (bvsge (size!33851 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!95698 d!130377))

(declare-fun d!130379 () Bool)

(declare-fun lt!479112 () Bool)

(assert (=> d!130379 (= lt!479112 (select (content!539 Nil!23239) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!617350 () Bool)

(assert (=> d!130379 (= lt!479112 e!617350)))

(declare-fun res!718974 () Bool)

(assert (=> d!130379 (=> (not res!718974) (not e!617350))))

(assert (=> d!130379 (= res!718974 ((_ is Cons!23238) Nil!23239))))

(assert (=> d!130379 (= (contains!6397 Nil!23239 #b1000000000000000000000000000000000000000000000000000000000000000) lt!479112)))

(declare-fun b!1079548 () Bool)

(declare-fun e!617349 () Bool)

(assert (=> b!1079548 (= e!617350 e!617349)))

(declare-fun res!718975 () Bool)

(assert (=> b!1079548 (=> res!718975 e!617349)))

(assert (=> b!1079548 (= res!718975 (= (h!24456 Nil!23239) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1079549 () Bool)

(assert (=> b!1079549 (= e!617349 (contains!6397 (t!32593 Nil!23239) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!130379 res!718974) b!1079548))

(assert (= (and b!1079548 (not res!718975)) b!1079549))

(assert (=> d!130379 m!998475))

(declare-fun m!998481 () Bool)

(assert (=> d!130379 m!998481))

(declare-fun m!998483 () Bool)

(assert (=> b!1079549 m!998483))

(assert (=> b!1079411 d!130379))

(declare-fun b!1079557 () Bool)

(declare-fun e!617355 () Bool)

(assert (=> b!1079557 (= e!617355 tp_is_empty!26149)))

(declare-fun b!1079556 () Bool)

(declare-fun e!617356 () Bool)

(assert (=> b!1079556 (= e!617356 tp_is_empty!26149)))

(declare-fun mapNonEmpty!40981 () Bool)

(declare-fun mapRes!40981 () Bool)

(declare-fun tp!78443 () Bool)

(assert (=> mapNonEmpty!40981 (= mapRes!40981 (and tp!78443 e!617356))))

(declare-fun mapKey!40981 () (_ BitVec 32))

(declare-fun mapValue!40981 () ValueCell!12365)

(declare-fun mapRest!40981 () (Array (_ BitVec 32) ValueCell!12365))

(assert (=> mapNonEmpty!40981 (= mapRest!40972 (store mapRest!40981 mapKey!40981 mapValue!40981))))

(declare-fun mapIsEmpty!40981 () Bool)

(assert (=> mapIsEmpty!40981 mapRes!40981))

(declare-fun condMapEmpty!40981 () Bool)

(declare-fun mapDefault!40981 () ValueCell!12365)

(assert (=> mapNonEmpty!40972 (= condMapEmpty!40981 (= mapRest!40972 ((as const (Array (_ BitVec 32) ValueCell!12365)) mapDefault!40981)))))

(assert (=> mapNonEmpty!40972 (= tp!78434 (and e!617355 mapRes!40981))))

(assert (= (and mapNonEmpty!40972 condMapEmpty!40981) mapIsEmpty!40981))

(assert (= (and mapNonEmpty!40972 (not condMapEmpty!40981)) mapNonEmpty!40981))

(assert (= (and mapNonEmpty!40981 ((_ is ValueCellFull!12365) mapValue!40981)) b!1079556))

(assert (= (and mapNonEmpty!40972 ((_ is ValueCellFull!12365) mapDefault!40981)) b!1079557))

(declare-fun m!998485 () Bool)

(assert (=> mapNonEmpty!40981 m!998485))

(check-sat (not bm!45804) (not d!130371) (not mapNonEmpty!40981) (not b!1079549) (not bm!45803) (not b!1079530) tp_is_empty!26149 (not b!1079540) (not b!1079518) (not b!1079537) (not b!1079517) (not b!1079536) (not b!1079516) (not bm!45800) (not b!1079531) (not b!1079547) (not b!1079541) (not d!130379))
(check-sat)
