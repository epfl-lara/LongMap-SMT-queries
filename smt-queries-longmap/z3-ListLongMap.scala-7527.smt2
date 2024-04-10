; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95426 () Bool)

(assert start!95426)

(declare-fun b!1077816 () Bool)

(declare-fun res!718174 () Bool)

(declare-fun e!616275 () Bool)

(assert (=> b!1077816 (=> (not res!718174) (not e!616275))))

(declare-datatypes ((array!69227 0))(
  ( (array!69228 (arr!33291 (Array (_ BitVec 32) (_ BitVec 64))) (size!33827 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69227)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69227 (_ BitVec 32)) Bool)

(assert (=> b!1077816 (= res!718174 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1077817 () Bool)

(declare-fun res!718178 () Bool)

(assert (=> b!1077817 (=> (not res!718178) (not e!616275))))

(declare-datatypes ((List!23227 0))(
  ( (Nil!23224) (Cons!23223 (h!24432 (_ BitVec 64)) (t!32586 List!23227)) )
))
(declare-fun arrayNoDuplicates!0 (array!69227 (_ BitVec 32) List!23227) Bool)

(assert (=> b!1077817 (= res!718178 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23224))))

(declare-fun mapNonEmpty!40951 () Bool)

(declare-fun mapRes!40951 () Bool)

(declare-fun tp!78413 () Bool)

(declare-fun e!616277 () Bool)

(assert (=> mapNonEmpty!40951 (= mapRes!40951 (and tp!78413 e!616277))))

(declare-fun mapKey!40951 () (_ BitVec 32))

(declare-datatypes ((V!39979 0))(
  ( (V!39980 (val!13126 Int)) )
))
(declare-datatypes ((ValueCell!12360 0))(
  ( (ValueCellFull!12360 (v!15746 V!39979)) (EmptyCell!12360) )
))
(declare-datatypes ((array!69229 0))(
  ( (array!69230 (arr!33292 (Array (_ BitVec 32) ValueCell!12360)) (size!33828 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69229)

(declare-fun mapRest!40951 () (Array (_ BitVec 32) ValueCell!12360))

(declare-fun mapValue!40951 () ValueCell!12360)

(assert (=> mapNonEmpty!40951 (= (arr!33292 _values!874) (store mapRest!40951 mapKey!40951 mapValue!40951))))

(declare-fun b!1077818 () Bool)

(declare-fun e!616273 () Bool)

(declare-fun tp_is_empty!26139 () Bool)

(assert (=> b!1077818 (= e!616273 tp_is_empty!26139)))

(declare-fun b!1077819 () Bool)

(assert (=> b!1077819 (= e!616277 tp_is_empty!26139)))

(declare-fun b!1077820 () Bool)

(declare-fun res!718177 () Bool)

(assert (=> b!1077820 (=> (not res!718177) (not e!616275))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1077820 (= res!718177 (validKeyInArray!0 k0!904))))

(declare-fun b!1077821 () Bool)

(declare-fun res!718172 () Bool)

(assert (=> b!1077821 (=> (not res!718172) (not e!616275))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1077821 (= res!718172 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!69228 (store (arr!33291 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33827 _keys!1070)) mask!1414))))

(declare-fun b!1077822 () Bool)

(declare-fun res!718173 () Bool)

(assert (=> b!1077822 (=> (not res!718173) (not e!616275))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1077822 (= res!718173 (and (= (size!33828 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33827 _keys!1070) (size!33828 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1077823 () Bool)

(assert (=> b!1077823 (= e!616275 (and (bvsle #b00000000000000000000000000000000 (size!33827 _keys!1070)) (bvsge (size!33827 _keys!1070) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!40951 () Bool)

(assert (=> mapIsEmpty!40951 mapRes!40951))

(declare-fun b!1077825 () Bool)

(declare-fun res!718171 () Bool)

(assert (=> b!1077825 (=> (not res!718171) (not e!616275))))

(assert (=> b!1077825 (= res!718171 (= (select (arr!33291 _keys!1070) i!650) k0!904))))

(declare-fun b!1077826 () Bool)

(declare-fun res!718175 () Bool)

(assert (=> b!1077826 (=> (not res!718175) (not e!616275))))

(assert (=> b!1077826 (= res!718175 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33827 _keys!1070))))))

(declare-fun b!1077824 () Bool)

(declare-fun e!616274 () Bool)

(assert (=> b!1077824 (= e!616274 (and e!616273 mapRes!40951))))

(declare-fun condMapEmpty!40951 () Bool)

(declare-fun mapDefault!40951 () ValueCell!12360)

(assert (=> b!1077824 (= condMapEmpty!40951 (= (arr!33292 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12360)) mapDefault!40951)))))

(declare-fun res!718176 () Bool)

(assert (=> start!95426 (=> (not res!718176) (not e!616275))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95426 (= res!718176 (validMask!0 mask!1414))))

(assert (=> start!95426 e!616275))

(assert (=> start!95426 true))

(declare-fun array_inv!25718 (array!69227) Bool)

(assert (=> start!95426 (array_inv!25718 _keys!1070)))

(declare-fun array_inv!25719 (array!69229) Bool)

(assert (=> start!95426 (and (array_inv!25719 _values!874) e!616274)))

(assert (= (and start!95426 res!718176) b!1077822))

(assert (= (and b!1077822 res!718173) b!1077816))

(assert (= (and b!1077816 res!718174) b!1077817))

(assert (= (and b!1077817 res!718178) b!1077826))

(assert (= (and b!1077826 res!718175) b!1077820))

(assert (= (and b!1077820 res!718177) b!1077825))

(assert (= (and b!1077825 res!718171) b!1077821))

(assert (= (and b!1077821 res!718172) b!1077823))

(assert (= (and b!1077824 condMapEmpty!40951) mapIsEmpty!40951))

(assert (= (and b!1077824 (not condMapEmpty!40951)) mapNonEmpty!40951))

(get-info :version)

(assert (= (and mapNonEmpty!40951 ((_ is ValueCellFull!12360) mapValue!40951)) b!1077819))

(assert (= (and b!1077824 ((_ is ValueCellFull!12360) mapDefault!40951)) b!1077818))

(assert (= start!95426 b!1077824))

(declare-fun m!996523 () Bool)

(assert (=> b!1077825 m!996523))

(declare-fun m!996525 () Bool)

(assert (=> b!1077817 m!996525))

(declare-fun m!996527 () Bool)

(assert (=> b!1077820 m!996527))

(declare-fun m!996529 () Bool)

(assert (=> start!95426 m!996529))

(declare-fun m!996531 () Bool)

(assert (=> start!95426 m!996531))

(declare-fun m!996533 () Bool)

(assert (=> start!95426 m!996533))

(declare-fun m!996535 () Bool)

(assert (=> b!1077816 m!996535))

(declare-fun m!996537 () Bool)

(assert (=> b!1077821 m!996537))

(declare-fun m!996539 () Bool)

(assert (=> b!1077821 m!996539))

(declare-fun m!996541 () Bool)

(assert (=> mapNonEmpty!40951 m!996541))

(check-sat (not b!1077816) tp_is_empty!26139 (not mapNonEmpty!40951) (not b!1077821) (not start!95426) (not b!1077820) (not b!1077817))
(check-sat)
(get-model)

(declare-fun d!129863 () Bool)

(assert (=> d!129863 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1077820 d!129863))

(declare-fun bm!45719 () Bool)

(declare-fun call!45722 () Bool)

(assert (=> bm!45719 (= call!45722 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun b!1077868 () Bool)

(declare-fun e!616301 () Bool)

(declare-fun e!616299 () Bool)

(assert (=> b!1077868 (= e!616301 e!616299)))

(declare-fun lt!478564 () (_ BitVec 64))

(assert (=> b!1077868 (= lt!478564 (select (arr!33291 _keys!1070) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!35460 0))(
  ( (Unit!35461) )
))
(declare-fun lt!478566 () Unit!35460)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69227 (_ BitVec 64) (_ BitVec 32)) Unit!35460)

(assert (=> b!1077868 (= lt!478566 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!478564 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!69227 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1077868 (arrayContainsKey!0 _keys!1070 lt!478564 #b00000000000000000000000000000000)))

(declare-fun lt!478565 () Unit!35460)

(assert (=> b!1077868 (= lt!478565 lt!478566)))

(declare-fun res!718208 () Bool)

(declare-datatypes ((SeekEntryResult!9900 0))(
  ( (MissingZero!9900 (index!41971 (_ BitVec 32))) (Found!9900 (index!41972 (_ BitVec 32))) (Intermediate!9900 (undefined!10712 Bool) (index!41973 (_ BitVec 32)) (x!96623 (_ BitVec 32))) (Undefined!9900) (MissingVacant!9900 (index!41974 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!69227 (_ BitVec 32)) SeekEntryResult!9900)

(assert (=> b!1077868 (= res!718208 (= (seekEntryOrOpen!0 (select (arr!33291 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9900 #b00000000000000000000000000000000)))))

(assert (=> b!1077868 (=> (not res!718208) (not e!616299))))

(declare-fun b!1077869 () Bool)

(assert (=> b!1077869 (= e!616299 call!45722)))

(declare-fun b!1077870 () Bool)

(declare-fun e!616300 () Bool)

(assert (=> b!1077870 (= e!616300 e!616301)))

(declare-fun c!108316 () Bool)

(assert (=> b!1077870 (= c!108316 (validKeyInArray!0 (select (arr!33291 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1077871 () Bool)

(assert (=> b!1077871 (= e!616301 call!45722)))

(declare-fun d!129865 () Bool)

(declare-fun res!718207 () Bool)

(assert (=> d!129865 (=> res!718207 e!616300)))

(assert (=> d!129865 (= res!718207 (bvsge #b00000000000000000000000000000000 (size!33827 _keys!1070)))))

(assert (=> d!129865 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!616300)))

(assert (= (and d!129865 (not res!718207)) b!1077870))

(assert (= (and b!1077870 c!108316) b!1077868))

(assert (= (and b!1077870 (not c!108316)) b!1077871))

(assert (= (and b!1077868 res!718208) b!1077869))

(assert (= (or b!1077869 b!1077871) bm!45719))

(declare-fun m!996563 () Bool)

(assert (=> bm!45719 m!996563))

(declare-fun m!996565 () Bool)

(assert (=> b!1077868 m!996565))

(declare-fun m!996567 () Bool)

(assert (=> b!1077868 m!996567))

(declare-fun m!996569 () Bool)

(assert (=> b!1077868 m!996569))

(assert (=> b!1077868 m!996565))

(declare-fun m!996571 () Bool)

(assert (=> b!1077868 m!996571))

(assert (=> b!1077870 m!996565))

(assert (=> b!1077870 m!996565))

(declare-fun m!996573 () Bool)

(assert (=> b!1077870 m!996573))

(assert (=> b!1077816 d!129865))

(declare-fun bm!45720 () Bool)

(declare-fun call!45723 () Bool)

(assert (=> bm!45720 (= call!45723 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!69228 (store (arr!33291 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33827 _keys!1070)) mask!1414))))

(declare-fun b!1077872 () Bool)

(declare-fun e!616304 () Bool)

(declare-fun e!616302 () Bool)

(assert (=> b!1077872 (= e!616304 e!616302)))

(declare-fun lt!478567 () (_ BitVec 64))

(assert (=> b!1077872 (= lt!478567 (select (arr!33291 (array!69228 (store (arr!33291 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33827 _keys!1070))) #b00000000000000000000000000000000))))

(declare-fun lt!478569 () Unit!35460)

(assert (=> b!1077872 (= lt!478569 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69228 (store (arr!33291 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33827 _keys!1070)) lt!478567 #b00000000000000000000000000000000))))

(assert (=> b!1077872 (arrayContainsKey!0 (array!69228 (store (arr!33291 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33827 _keys!1070)) lt!478567 #b00000000000000000000000000000000)))

(declare-fun lt!478568 () Unit!35460)

(assert (=> b!1077872 (= lt!478568 lt!478569)))

(declare-fun res!718210 () Bool)

(assert (=> b!1077872 (= res!718210 (= (seekEntryOrOpen!0 (select (arr!33291 (array!69228 (store (arr!33291 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33827 _keys!1070))) #b00000000000000000000000000000000) (array!69228 (store (arr!33291 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33827 _keys!1070)) mask!1414) (Found!9900 #b00000000000000000000000000000000)))))

(assert (=> b!1077872 (=> (not res!718210) (not e!616302))))

(declare-fun b!1077873 () Bool)

(assert (=> b!1077873 (= e!616302 call!45723)))

(declare-fun b!1077874 () Bool)

(declare-fun e!616303 () Bool)

(assert (=> b!1077874 (= e!616303 e!616304)))

(declare-fun c!108317 () Bool)

(assert (=> b!1077874 (= c!108317 (validKeyInArray!0 (select (arr!33291 (array!69228 (store (arr!33291 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33827 _keys!1070))) #b00000000000000000000000000000000)))))

(declare-fun b!1077875 () Bool)

(assert (=> b!1077875 (= e!616304 call!45723)))

(declare-fun d!129867 () Bool)

(declare-fun res!718209 () Bool)

(assert (=> d!129867 (=> res!718209 e!616303)))

(assert (=> d!129867 (= res!718209 (bvsge #b00000000000000000000000000000000 (size!33827 (array!69228 (store (arr!33291 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33827 _keys!1070)))))))

(assert (=> d!129867 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!69228 (store (arr!33291 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33827 _keys!1070)) mask!1414) e!616303)))

(assert (= (and d!129867 (not res!718209)) b!1077874))

(assert (= (and b!1077874 c!108317) b!1077872))

(assert (= (and b!1077874 (not c!108317)) b!1077875))

(assert (= (and b!1077872 res!718210) b!1077873))

(assert (= (or b!1077873 b!1077875) bm!45720))

(declare-fun m!996575 () Bool)

(assert (=> bm!45720 m!996575))

(declare-fun m!996577 () Bool)

(assert (=> b!1077872 m!996577))

(declare-fun m!996579 () Bool)

(assert (=> b!1077872 m!996579))

(declare-fun m!996581 () Bool)

(assert (=> b!1077872 m!996581))

(assert (=> b!1077872 m!996577))

(declare-fun m!996583 () Bool)

(assert (=> b!1077872 m!996583))

(assert (=> b!1077874 m!996577))

(assert (=> b!1077874 m!996577))

(declare-fun m!996585 () Bool)

(assert (=> b!1077874 m!996585))

(assert (=> b!1077821 d!129867))

(declare-fun bm!45723 () Bool)

(declare-fun call!45726 () Bool)

(declare-fun c!108320 () Bool)

(assert (=> bm!45723 (= call!45726 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108320 (Cons!23223 (select (arr!33291 _keys!1070) #b00000000000000000000000000000000) Nil!23224) Nil!23224)))))

(declare-fun b!1077886 () Bool)

(declare-fun e!616315 () Bool)

(declare-fun contains!6369 (List!23227 (_ BitVec 64)) Bool)

(assert (=> b!1077886 (= e!616315 (contains!6369 Nil!23224 (select (arr!33291 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1077887 () Bool)

(declare-fun e!616313 () Bool)

(assert (=> b!1077887 (= e!616313 call!45726)))

(declare-fun d!129869 () Bool)

(declare-fun res!718219 () Bool)

(declare-fun e!616314 () Bool)

(assert (=> d!129869 (=> res!718219 e!616314)))

(assert (=> d!129869 (= res!718219 (bvsge #b00000000000000000000000000000000 (size!33827 _keys!1070)))))

(assert (=> d!129869 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23224) e!616314)))

(declare-fun b!1077888 () Bool)

(declare-fun e!616316 () Bool)

(assert (=> b!1077888 (= e!616314 e!616316)))

(declare-fun res!718218 () Bool)

(assert (=> b!1077888 (=> (not res!718218) (not e!616316))))

(assert (=> b!1077888 (= res!718218 (not e!616315))))

(declare-fun res!718217 () Bool)

(assert (=> b!1077888 (=> (not res!718217) (not e!616315))))

(assert (=> b!1077888 (= res!718217 (validKeyInArray!0 (select (arr!33291 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1077889 () Bool)

(assert (=> b!1077889 (= e!616313 call!45726)))

(declare-fun b!1077890 () Bool)

(assert (=> b!1077890 (= e!616316 e!616313)))

(assert (=> b!1077890 (= c!108320 (validKeyInArray!0 (select (arr!33291 _keys!1070) #b00000000000000000000000000000000)))))

(assert (= (and d!129869 (not res!718219)) b!1077888))

(assert (= (and b!1077888 res!718217) b!1077886))

(assert (= (and b!1077888 res!718218) b!1077890))

(assert (= (and b!1077890 c!108320) b!1077887))

(assert (= (and b!1077890 (not c!108320)) b!1077889))

(assert (= (or b!1077887 b!1077889) bm!45723))

(assert (=> bm!45723 m!996565))

(declare-fun m!996587 () Bool)

(assert (=> bm!45723 m!996587))

(assert (=> b!1077886 m!996565))

(assert (=> b!1077886 m!996565))

(declare-fun m!996589 () Bool)

(assert (=> b!1077886 m!996589))

(assert (=> b!1077888 m!996565))

(assert (=> b!1077888 m!996565))

(assert (=> b!1077888 m!996573))

(assert (=> b!1077890 m!996565))

(assert (=> b!1077890 m!996565))

(assert (=> b!1077890 m!996573))

(assert (=> b!1077817 d!129869))

(declare-fun d!129871 () Bool)

(assert (=> d!129871 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!95426 d!129871))

(declare-fun d!129873 () Bool)

(assert (=> d!129873 (= (array_inv!25718 _keys!1070) (bvsge (size!33827 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!95426 d!129873))

(declare-fun d!129875 () Bool)

(assert (=> d!129875 (= (array_inv!25719 _values!874) (bvsge (size!33828 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!95426 d!129875))

(declare-fun b!1077897 () Bool)

(declare-fun e!616321 () Bool)

(assert (=> b!1077897 (= e!616321 tp_is_empty!26139)))

(declare-fun b!1077898 () Bool)

(declare-fun e!616322 () Bool)

(assert (=> b!1077898 (= e!616322 tp_is_empty!26139)))

(declare-fun mapNonEmpty!40957 () Bool)

(declare-fun mapRes!40957 () Bool)

(declare-fun tp!78419 () Bool)

(assert (=> mapNonEmpty!40957 (= mapRes!40957 (and tp!78419 e!616321))))

(declare-fun mapValue!40957 () ValueCell!12360)

(declare-fun mapKey!40957 () (_ BitVec 32))

(declare-fun mapRest!40957 () (Array (_ BitVec 32) ValueCell!12360))

(assert (=> mapNonEmpty!40957 (= mapRest!40951 (store mapRest!40957 mapKey!40957 mapValue!40957))))

(declare-fun condMapEmpty!40957 () Bool)

(declare-fun mapDefault!40957 () ValueCell!12360)

(assert (=> mapNonEmpty!40951 (= condMapEmpty!40957 (= mapRest!40951 ((as const (Array (_ BitVec 32) ValueCell!12360)) mapDefault!40957)))))

(assert (=> mapNonEmpty!40951 (= tp!78413 (and e!616322 mapRes!40957))))

(declare-fun mapIsEmpty!40957 () Bool)

(assert (=> mapIsEmpty!40957 mapRes!40957))

(assert (= (and mapNonEmpty!40951 condMapEmpty!40957) mapIsEmpty!40957))

(assert (= (and mapNonEmpty!40951 (not condMapEmpty!40957)) mapNonEmpty!40957))

(assert (= (and mapNonEmpty!40957 ((_ is ValueCellFull!12360) mapValue!40957)) b!1077897))

(assert (= (and mapNonEmpty!40951 ((_ is ValueCellFull!12360) mapDefault!40957)) b!1077898))

(declare-fun m!996591 () Bool)

(assert (=> mapNonEmpty!40957 m!996591))

(check-sat (not bm!45719) (not b!1077868) (not bm!45720) tp_is_empty!26139 (not b!1077872) (not bm!45723) (not b!1077888) (not b!1077890) (not b!1077886) (not b!1077870) (not b!1077874) (not mapNonEmpty!40957))
(check-sat)
