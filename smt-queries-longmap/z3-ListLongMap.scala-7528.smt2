; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95444 () Bool)

(assert start!95444)

(declare-fun b!1077959 () Bool)

(declare-fun e!616352 () Bool)

(declare-fun tp_is_empty!26145 () Bool)

(assert (=> b!1077959 (= e!616352 tp_is_empty!26145)))

(declare-fun res!718265 () Bool)

(declare-fun e!616348 () Bool)

(assert (=> start!95444 (=> (not res!718265) (not e!616348))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95444 (= res!718265 (validMask!0 mask!1414))))

(assert (=> start!95444 e!616348))

(assert (=> start!95444 true))

(declare-datatypes ((array!69241 0))(
  ( (array!69242 (arr!33297 (Array (_ BitVec 32) (_ BitVec 64))) (size!33833 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69241)

(declare-fun array_inv!25722 (array!69241) Bool)

(assert (=> start!95444 (array_inv!25722 _keys!1070)))

(declare-datatypes ((V!39987 0))(
  ( (V!39988 (val!13129 Int)) )
))
(declare-datatypes ((ValueCell!12363 0))(
  ( (ValueCellFull!12363 (v!15749 V!39987)) (EmptyCell!12363) )
))
(declare-datatypes ((array!69243 0))(
  ( (array!69244 (arr!33298 (Array (_ BitVec 32) ValueCell!12363)) (size!33834 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69243)

(declare-fun e!616349 () Bool)

(declare-fun array_inv!25723 (array!69243) Bool)

(assert (=> start!95444 (and (array_inv!25723 _values!874) e!616349)))

(declare-fun b!1077960 () Bool)

(declare-fun res!718267 () Bool)

(assert (=> b!1077960 (=> (not res!718267) (not e!616348))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69241 (_ BitVec 32)) Bool)

(assert (=> b!1077960 (= res!718267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1077961 () Bool)

(declare-fun e!616350 () Bool)

(assert (=> b!1077961 (= e!616350 tp_is_empty!26145)))

(declare-fun b!1077962 () Bool)

(declare-fun res!718273 () Bool)

(assert (=> b!1077962 (=> (not res!718273) (not e!616348))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1077962 (= res!718273 (validKeyInArray!0 k0!904))))

(declare-fun b!1077963 () Bool)

(declare-fun res!718269 () Bool)

(assert (=> b!1077963 (=> (not res!718269) (not e!616348))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1077963 (= res!718269 (= (select (arr!33297 _keys!1070) i!650) k0!904))))

(declare-fun mapIsEmpty!40963 () Bool)

(declare-fun mapRes!40963 () Bool)

(assert (=> mapIsEmpty!40963 mapRes!40963))

(declare-fun b!1077964 () Bool)

(assert (=> b!1077964 (= e!616349 (and e!616352 mapRes!40963))))

(declare-fun condMapEmpty!40963 () Bool)

(declare-fun mapDefault!40963 () ValueCell!12363)

(assert (=> b!1077964 (= condMapEmpty!40963 (= (arr!33298 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12363)) mapDefault!40963)))))

(declare-fun b!1077965 () Bool)

(declare-datatypes ((List!23228 0))(
  ( (Nil!23225) (Cons!23224 (h!24433 (_ BitVec 64)) (t!32587 List!23228)) )
))
(declare-fun noDuplicate!1577 (List!23228) Bool)

(assert (=> b!1077965 (= e!616348 (not (noDuplicate!1577 Nil!23225)))))

(declare-fun b!1077966 () Bool)

(declare-fun res!718268 () Bool)

(assert (=> b!1077966 (=> (not res!718268) (not e!616348))))

(assert (=> b!1077966 (= res!718268 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33833 _keys!1070))))))

(declare-fun b!1077967 () Bool)

(declare-fun res!718266 () Bool)

(assert (=> b!1077967 (=> (not res!718266) (not e!616348))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1077967 (= res!718266 (and (= (size!33834 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33833 _keys!1070) (size!33834 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1077968 () Bool)

(declare-fun res!718272 () Bool)

(assert (=> b!1077968 (=> (not res!718272) (not e!616348))))

(assert (=> b!1077968 (= res!718272 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!69242 (store (arr!33297 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33833 _keys!1070)) mask!1414))))

(declare-fun mapNonEmpty!40963 () Bool)

(declare-fun tp!78425 () Bool)

(assert (=> mapNonEmpty!40963 (= mapRes!40963 (and tp!78425 e!616350))))

(declare-fun mapKey!40963 () (_ BitVec 32))

(declare-fun mapValue!40963 () ValueCell!12363)

(declare-fun mapRest!40963 () (Array (_ BitVec 32) ValueCell!12363))

(assert (=> mapNonEmpty!40963 (= (arr!33298 _values!874) (store mapRest!40963 mapKey!40963 mapValue!40963))))

(declare-fun b!1077969 () Bool)

(declare-fun res!718270 () Bool)

(assert (=> b!1077969 (=> (not res!718270) (not e!616348))))

(declare-fun arrayNoDuplicates!0 (array!69241 (_ BitVec 32) List!23228) Bool)

(assert (=> b!1077969 (= res!718270 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23225))))

(declare-fun b!1077970 () Bool)

(declare-fun res!718271 () Bool)

(assert (=> b!1077970 (=> (not res!718271) (not e!616348))))

(assert (=> b!1077970 (= res!718271 (and (bvsle #b00000000000000000000000000000000 (size!33833 _keys!1070)) (bvslt (size!33833 _keys!1070) #b01111111111111111111111111111111)))))

(assert (= (and start!95444 res!718265) b!1077967))

(assert (= (and b!1077967 res!718266) b!1077960))

(assert (= (and b!1077960 res!718267) b!1077969))

(assert (= (and b!1077969 res!718270) b!1077966))

(assert (= (and b!1077966 res!718268) b!1077962))

(assert (= (and b!1077962 res!718273) b!1077963))

(assert (= (and b!1077963 res!718269) b!1077968))

(assert (= (and b!1077968 res!718272) b!1077970))

(assert (= (and b!1077970 res!718271) b!1077965))

(assert (= (and b!1077964 condMapEmpty!40963) mapIsEmpty!40963))

(assert (= (and b!1077964 (not condMapEmpty!40963)) mapNonEmpty!40963))

(get-info :version)

(assert (= (and mapNonEmpty!40963 ((_ is ValueCellFull!12363) mapValue!40963)) b!1077961))

(assert (= (and b!1077964 ((_ is ValueCellFull!12363) mapDefault!40963)) b!1077959))

(assert (= start!95444 b!1077964))

(declare-fun m!996615 () Bool)

(assert (=> b!1077962 m!996615))

(declare-fun m!996617 () Bool)

(assert (=> b!1077965 m!996617))

(declare-fun m!996619 () Bool)

(assert (=> start!95444 m!996619))

(declare-fun m!996621 () Bool)

(assert (=> start!95444 m!996621))

(declare-fun m!996623 () Bool)

(assert (=> start!95444 m!996623))

(declare-fun m!996625 () Bool)

(assert (=> b!1077963 m!996625))

(declare-fun m!996627 () Bool)

(assert (=> b!1077968 m!996627))

(declare-fun m!996629 () Bool)

(assert (=> b!1077968 m!996629))

(declare-fun m!996631 () Bool)

(assert (=> mapNonEmpty!40963 m!996631))

(declare-fun m!996633 () Bool)

(assert (=> b!1077960 m!996633))

(declare-fun m!996635 () Bool)

(assert (=> b!1077969 m!996635))

(check-sat (not b!1077962) (not b!1077968) (not mapNonEmpty!40963) tp_is_empty!26145 (not start!95444) (not b!1077965) (not b!1077969) (not b!1077960))
(check-sat)
(get-model)

(declare-fun b!1078015 () Bool)

(declare-fun e!616375 () Bool)

(declare-fun call!45729 () Bool)

(assert (=> b!1078015 (= e!616375 call!45729)))

(declare-fun b!1078016 () Bool)

(declare-fun e!616374 () Bool)

(assert (=> b!1078016 (= e!616374 call!45729)))

(declare-fun d!129879 () Bool)

(declare-fun res!718305 () Bool)

(declare-fun e!616376 () Bool)

(assert (=> d!129879 (=> res!718305 e!616376)))

(assert (=> d!129879 (= res!718305 (bvsge #b00000000000000000000000000000000 (size!33833 (array!69242 (store (arr!33297 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33833 _keys!1070)))))))

(assert (=> d!129879 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!69242 (store (arr!33297 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33833 _keys!1070)) mask!1414) e!616376)))

(declare-fun b!1078017 () Bool)

(assert (=> b!1078017 (= e!616374 e!616375)))

(declare-fun lt!478577 () (_ BitVec 64))

(assert (=> b!1078017 (= lt!478577 (select (arr!33297 (array!69242 (store (arr!33297 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33833 _keys!1070))) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!35462 0))(
  ( (Unit!35463) )
))
(declare-fun lt!478576 () Unit!35462)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69241 (_ BitVec 64) (_ BitVec 32)) Unit!35462)

(assert (=> b!1078017 (= lt!478576 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69242 (store (arr!33297 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33833 _keys!1070)) lt!478577 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!69241 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1078017 (arrayContainsKey!0 (array!69242 (store (arr!33297 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33833 _keys!1070)) lt!478577 #b00000000000000000000000000000000)))

(declare-fun lt!478578 () Unit!35462)

(assert (=> b!1078017 (= lt!478578 lt!478576)))

(declare-fun res!718306 () Bool)

(declare-datatypes ((SeekEntryResult!9901 0))(
  ( (MissingZero!9901 (index!41975 (_ BitVec 32))) (Found!9901 (index!41976 (_ BitVec 32))) (Intermediate!9901 (undefined!10713 Bool) (index!41977 (_ BitVec 32)) (x!96634 (_ BitVec 32))) (Undefined!9901) (MissingVacant!9901 (index!41978 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!69241 (_ BitVec 32)) SeekEntryResult!9901)

(assert (=> b!1078017 (= res!718306 (= (seekEntryOrOpen!0 (select (arr!33297 (array!69242 (store (arr!33297 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33833 _keys!1070))) #b00000000000000000000000000000000) (array!69242 (store (arr!33297 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33833 _keys!1070)) mask!1414) (Found!9901 #b00000000000000000000000000000000)))))

(assert (=> b!1078017 (=> (not res!718306) (not e!616375))))

(declare-fun b!1078018 () Bool)

(assert (=> b!1078018 (= e!616376 e!616374)))

(declare-fun c!108323 () Bool)

(assert (=> b!1078018 (= c!108323 (validKeyInArray!0 (select (arr!33297 (array!69242 (store (arr!33297 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33833 _keys!1070))) #b00000000000000000000000000000000)))))

(declare-fun bm!45726 () Bool)

(assert (=> bm!45726 (= call!45729 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!69242 (store (arr!33297 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33833 _keys!1070)) mask!1414))))

(assert (= (and d!129879 (not res!718305)) b!1078018))

(assert (= (and b!1078018 c!108323) b!1078017))

(assert (= (and b!1078018 (not c!108323)) b!1078016))

(assert (= (and b!1078017 res!718306) b!1078015))

(assert (= (or b!1078015 b!1078016) bm!45726))

(declare-fun m!996659 () Bool)

(assert (=> b!1078017 m!996659))

(declare-fun m!996661 () Bool)

(assert (=> b!1078017 m!996661))

(declare-fun m!996663 () Bool)

(assert (=> b!1078017 m!996663))

(assert (=> b!1078017 m!996659))

(declare-fun m!996665 () Bool)

(assert (=> b!1078017 m!996665))

(assert (=> b!1078018 m!996659))

(assert (=> b!1078018 m!996659))

(declare-fun m!996667 () Bool)

(assert (=> b!1078018 m!996667))

(declare-fun m!996669 () Bool)

(assert (=> bm!45726 m!996669))

(assert (=> b!1077968 d!129879))

(declare-fun b!1078019 () Bool)

(declare-fun e!616378 () Bool)

(declare-fun call!45730 () Bool)

(assert (=> b!1078019 (= e!616378 call!45730)))

(declare-fun b!1078020 () Bool)

(declare-fun e!616377 () Bool)

(assert (=> b!1078020 (= e!616377 call!45730)))

(declare-fun d!129881 () Bool)

(declare-fun res!718307 () Bool)

(declare-fun e!616379 () Bool)

(assert (=> d!129881 (=> res!718307 e!616379)))

(assert (=> d!129881 (= res!718307 (bvsge #b00000000000000000000000000000000 (size!33833 _keys!1070)))))

(assert (=> d!129881 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!616379)))

(declare-fun b!1078021 () Bool)

(assert (=> b!1078021 (= e!616377 e!616378)))

(declare-fun lt!478580 () (_ BitVec 64))

(assert (=> b!1078021 (= lt!478580 (select (arr!33297 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!478579 () Unit!35462)

(assert (=> b!1078021 (= lt!478579 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!478580 #b00000000000000000000000000000000))))

(assert (=> b!1078021 (arrayContainsKey!0 _keys!1070 lt!478580 #b00000000000000000000000000000000)))

(declare-fun lt!478581 () Unit!35462)

(assert (=> b!1078021 (= lt!478581 lt!478579)))

(declare-fun res!718308 () Bool)

(assert (=> b!1078021 (= res!718308 (= (seekEntryOrOpen!0 (select (arr!33297 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9901 #b00000000000000000000000000000000)))))

(assert (=> b!1078021 (=> (not res!718308) (not e!616378))))

(declare-fun b!1078022 () Bool)

(assert (=> b!1078022 (= e!616379 e!616377)))

(declare-fun c!108324 () Bool)

(assert (=> b!1078022 (= c!108324 (validKeyInArray!0 (select (arr!33297 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun bm!45727 () Bool)

(assert (=> bm!45727 (= call!45730 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(assert (= (and d!129881 (not res!718307)) b!1078022))

(assert (= (and b!1078022 c!108324) b!1078021))

(assert (= (and b!1078022 (not c!108324)) b!1078020))

(assert (= (and b!1078021 res!718308) b!1078019))

(assert (= (or b!1078019 b!1078020) bm!45727))

(declare-fun m!996671 () Bool)

(assert (=> b!1078021 m!996671))

(declare-fun m!996673 () Bool)

(assert (=> b!1078021 m!996673))

(declare-fun m!996675 () Bool)

(assert (=> b!1078021 m!996675))

(assert (=> b!1078021 m!996671))

(declare-fun m!996677 () Bool)

(assert (=> b!1078021 m!996677))

(assert (=> b!1078022 m!996671))

(assert (=> b!1078022 m!996671))

(declare-fun m!996679 () Bool)

(assert (=> b!1078022 m!996679))

(declare-fun m!996681 () Bool)

(assert (=> bm!45727 m!996681))

(assert (=> b!1077960 d!129881))

(declare-fun d!129883 () Bool)

(assert (=> d!129883 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!95444 d!129883))

(declare-fun d!129885 () Bool)

(assert (=> d!129885 (= (array_inv!25722 _keys!1070) (bvsge (size!33833 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!95444 d!129885))

(declare-fun d!129887 () Bool)

(assert (=> d!129887 (= (array_inv!25723 _values!874) (bvsge (size!33834 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!95444 d!129887))

(declare-fun d!129889 () Bool)

(declare-fun res!718313 () Bool)

(declare-fun e!616384 () Bool)

(assert (=> d!129889 (=> res!718313 e!616384)))

(assert (=> d!129889 (= res!718313 ((_ is Nil!23225) Nil!23225))))

(assert (=> d!129889 (= (noDuplicate!1577 Nil!23225) e!616384)))

(declare-fun b!1078027 () Bool)

(declare-fun e!616385 () Bool)

(assert (=> b!1078027 (= e!616384 e!616385)))

(declare-fun res!718314 () Bool)

(assert (=> b!1078027 (=> (not res!718314) (not e!616385))))

(declare-fun contains!6370 (List!23228 (_ BitVec 64)) Bool)

(assert (=> b!1078027 (= res!718314 (not (contains!6370 (t!32587 Nil!23225) (h!24433 Nil!23225))))))

(declare-fun b!1078028 () Bool)

(assert (=> b!1078028 (= e!616385 (noDuplicate!1577 (t!32587 Nil!23225)))))

(assert (= (and d!129889 (not res!718313)) b!1078027))

(assert (= (and b!1078027 res!718314) b!1078028))

(declare-fun m!996683 () Bool)

(assert (=> b!1078027 m!996683))

(declare-fun m!996685 () Bool)

(assert (=> b!1078028 m!996685))

(assert (=> b!1077965 d!129889))

(declare-fun b!1078039 () Bool)

(declare-fun e!616395 () Bool)

(declare-fun e!616396 () Bool)

(assert (=> b!1078039 (= e!616395 e!616396)))

(declare-fun c!108327 () Bool)

(assert (=> b!1078039 (= c!108327 (validKeyInArray!0 (select (arr!33297 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun bm!45730 () Bool)

(declare-fun call!45733 () Bool)

(assert (=> bm!45730 (= call!45733 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108327 (Cons!23224 (select (arr!33297 _keys!1070) #b00000000000000000000000000000000) Nil!23225) Nil!23225)))))

(declare-fun d!129891 () Bool)

(declare-fun res!718323 () Bool)

(declare-fun e!616394 () Bool)

(assert (=> d!129891 (=> res!718323 e!616394)))

(assert (=> d!129891 (= res!718323 (bvsge #b00000000000000000000000000000000 (size!33833 _keys!1070)))))

(assert (=> d!129891 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23225) e!616394)))

(declare-fun b!1078040 () Bool)

(assert (=> b!1078040 (= e!616396 call!45733)))

(declare-fun b!1078041 () Bool)

(declare-fun e!616397 () Bool)

(assert (=> b!1078041 (= e!616397 (contains!6370 Nil!23225 (select (arr!33297 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1078042 () Bool)

(assert (=> b!1078042 (= e!616396 call!45733)))

(declare-fun b!1078043 () Bool)

(assert (=> b!1078043 (= e!616394 e!616395)))

(declare-fun res!718322 () Bool)

(assert (=> b!1078043 (=> (not res!718322) (not e!616395))))

(assert (=> b!1078043 (= res!718322 (not e!616397))))

(declare-fun res!718321 () Bool)

(assert (=> b!1078043 (=> (not res!718321) (not e!616397))))

(assert (=> b!1078043 (= res!718321 (validKeyInArray!0 (select (arr!33297 _keys!1070) #b00000000000000000000000000000000)))))

(assert (= (and d!129891 (not res!718323)) b!1078043))

(assert (= (and b!1078043 res!718321) b!1078041))

(assert (= (and b!1078043 res!718322) b!1078039))

(assert (= (and b!1078039 c!108327) b!1078042))

(assert (= (and b!1078039 (not c!108327)) b!1078040))

(assert (= (or b!1078042 b!1078040) bm!45730))

(assert (=> b!1078039 m!996671))

(assert (=> b!1078039 m!996671))

(assert (=> b!1078039 m!996679))

(assert (=> bm!45730 m!996671))

(declare-fun m!996687 () Bool)

(assert (=> bm!45730 m!996687))

(assert (=> b!1078041 m!996671))

(assert (=> b!1078041 m!996671))

(declare-fun m!996689 () Bool)

(assert (=> b!1078041 m!996689))

(assert (=> b!1078043 m!996671))

(assert (=> b!1078043 m!996671))

(assert (=> b!1078043 m!996679))

(assert (=> b!1077969 d!129891))

(declare-fun d!129893 () Bool)

(assert (=> d!129893 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1077962 d!129893))

(declare-fun mapNonEmpty!40969 () Bool)

(declare-fun mapRes!40969 () Bool)

(declare-fun tp!78431 () Bool)

(declare-fun e!616403 () Bool)

(assert (=> mapNonEmpty!40969 (= mapRes!40969 (and tp!78431 e!616403))))

(declare-fun mapRest!40969 () (Array (_ BitVec 32) ValueCell!12363))

(declare-fun mapKey!40969 () (_ BitVec 32))

(declare-fun mapValue!40969 () ValueCell!12363)

(assert (=> mapNonEmpty!40969 (= mapRest!40963 (store mapRest!40969 mapKey!40969 mapValue!40969))))

(declare-fun b!1078051 () Bool)

(declare-fun e!616402 () Bool)

(assert (=> b!1078051 (= e!616402 tp_is_empty!26145)))

(declare-fun condMapEmpty!40969 () Bool)

(declare-fun mapDefault!40969 () ValueCell!12363)

(assert (=> mapNonEmpty!40963 (= condMapEmpty!40969 (= mapRest!40963 ((as const (Array (_ BitVec 32) ValueCell!12363)) mapDefault!40969)))))

(assert (=> mapNonEmpty!40963 (= tp!78425 (and e!616402 mapRes!40969))))

(declare-fun mapIsEmpty!40969 () Bool)

(assert (=> mapIsEmpty!40969 mapRes!40969))

(declare-fun b!1078050 () Bool)

(assert (=> b!1078050 (= e!616403 tp_is_empty!26145)))

(assert (= (and mapNonEmpty!40963 condMapEmpty!40969) mapIsEmpty!40969))

(assert (= (and mapNonEmpty!40963 (not condMapEmpty!40969)) mapNonEmpty!40969))

(assert (= (and mapNonEmpty!40969 ((_ is ValueCellFull!12363) mapValue!40969)) b!1078050))

(assert (= (and mapNonEmpty!40963 ((_ is ValueCellFull!12363) mapDefault!40969)) b!1078051))

(declare-fun m!996691 () Bool)

(assert (=> mapNonEmpty!40969 m!996691))

(check-sat (not bm!45727) (not b!1078043) (not b!1078039) (not b!1078027) (not b!1078041) (not b!1078022) tp_is_empty!26145 (not bm!45730) (not b!1078028) (not b!1078017) (not bm!45726) (not mapNonEmpty!40969) (not b!1078021) (not b!1078018))
(check-sat)
