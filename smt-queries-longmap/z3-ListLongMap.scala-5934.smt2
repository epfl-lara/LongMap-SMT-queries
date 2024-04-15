; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77364 () Bool)

(assert start!77364)

(declare-fun b!901987 () Bool)

(declare-fun e!505097 () Bool)

(declare-fun tp_is_empty!18433 () Bool)

(assert (=> b!901987 (= e!505097 tp_is_empty!18433)))

(declare-fun b!901988 () Bool)

(declare-fun e!505098 () Bool)

(declare-datatypes ((array!52909 0))(
  ( (array!52910 (arr!25419 (Array (_ BitVec 32) (_ BitVec 64))) (size!25880 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!52909)

(assert (=> b!901988 (= e!505098 (bvsgt #b00000000000000000000000000000000 (size!25880 _keys!1386)))))

(declare-fun res!608788 () Bool)

(assert (=> start!77364 (=> (not res!608788) (not e!505098))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77364 (= res!608788 (validMask!0 mask!1756))))

(assert (=> start!77364 e!505098))

(assert (=> start!77364 true))

(declare-datatypes ((V!29543 0))(
  ( (V!29544 (val!9267 Int)) )
))
(declare-datatypes ((ValueCell!8735 0))(
  ( (ValueCellFull!8735 (v!11770 V!29543)) (EmptyCell!8735) )
))
(declare-datatypes ((array!52911 0))(
  ( (array!52912 (arr!25420 (Array (_ BitVec 32) ValueCell!8735)) (size!25881 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!52911)

(declare-fun e!505100 () Bool)

(declare-fun array_inv!19990 (array!52911) Bool)

(assert (=> start!77364 (and (array_inv!19990 _values!1152) e!505100)))

(declare-fun array_inv!19991 (array!52909) Bool)

(assert (=> start!77364 (array_inv!19991 _keys!1386)))

(declare-fun b!901989 () Bool)

(declare-fun mapRes!29347 () Bool)

(assert (=> b!901989 (= e!505100 (and e!505097 mapRes!29347))))

(declare-fun condMapEmpty!29347 () Bool)

(declare-fun mapDefault!29347 () ValueCell!8735)

(assert (=> b!901989 (= condMapEmpty!29347 (= (arr!25420 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8735)) mapDefault!29347)))))

(declare-fun b!901990 () Bool)

(declare-fun res!608786 () Bool)

(assert (=> b!901990 (=> (not res!608786) (not e!505098))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!901990 (= res!608786 (and (= (size!25881 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25880 _keys!1386) (size!25881 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!901991 () Bool)

(declare-fun e!505099 () Bool)

(assert (=> b!901991 (= e!505099 tp_is_empty!18433)))

(declare-fun b!901992 () Bool)

(declare-fun res!608787 () Bool)

(assert (=> b!901992 (=> (not res!608787) (not e!505098))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52909 (_ BitVec 32)) Bool)

(assert (=> b!901992 (= res!608787 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapIsEmpty!29347 () Bool)

(assert (=> mapIsEmpty!29347 mapRes!29347))

(declare-fun mapNonEmpty!29347 () Bool)

(declare-fun tp!56407 () Bool)

(assert (=> mapNonEmpty!29347 (= mapRes!29347 (and tp!56407 e!505099))))

(declare-fun mapValue!29347 () ValueCell!8735)

(declare-fun mapKey!29347 () (_ BitVec 32))

(declare-fun mapRest!29347 () (Array (_ BitVec 32) ValueCell!8735))

(assert (=> mapNonEmpty!29347 (= (arr!25420 _values!1152) (store mapRest!29347 mapKey!29347 mapValue!29347))))

(assert (= (and start!77364 res!608788) b!901990))

(assert (= (and b!901990 res!608786) b!901992))

(assert (= (and b!901992 res!608787) b!901988))

(assert (= (and b!901989 condMapEmpty!29347) mapIsEmpty!29347))

(assert (= (and b!901989 (not condMapEmpty!29347)) mapNonEmpty!29347))

(get-info :version)

(assert (= (and mapNonEmpty!29347 ((_ is ValueCellFull!8735) mapValue!29347)) b!901991))

(assert (= (and b!901989 ((_ is ValueCellFull!8735) mapDefault!29347)) b!901987))

(assert (= start!77364 b!901989))

(declare-fun m!837555 () Bool)

(assert (=> start!77364 m!837555))

(declare-fun m!837557 () Bool)

(assert (=> start!77364 m!837557))

(declare-fun m!837559 () Bool)

(assert (=> start!77364 m!837559))

(declare-fun m!837561 () Bool)

(assert (=> b!901992 m!837561))

(declare-fun m!837563 () Bool)

(assert (=> mapNonEmpty!29347 m!837563))

(check-sat (not b!901992) (not start!77364) (not mapNonEmpty!29347) tp_is_empty!18433)
(check-sat)
(get-model)

(declare-fun b!902037 () Bool)

(declare-fun e!505140 () Bool)

(declare-fun call!40211 () Bool)

(assert (=> b!902037 (= e!505140 call!40211)))

(declare-fun b!902038 () Bool)

(declare-fun e!505139 () Bool)

(declare-fun e!505138 () Bool)

(assert (=> b!902038 (= e!505139 e!505138)))

(declare-fun c!95568 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!902038 (= c!95568 (validKeyInArray!0 (select (arr!25419 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun bm!40208 () Bool)

(assert (=> bm!40208 (= call!40211 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(declare-fun d!111731 () Bool)

(declare-fun res!608812 () Bool)

(assert (=> d!111731 (=> res!608812 e!505139)))

(assert (=> d!111731 (= res!608812 (bvsge #b00000000000000000000000000000000 (size!25880 _keys!1386)))))

(assert (=> d!111731 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756) e!505139)))

(declare-fun b!902039 () Bool)

(assert (=> b!902039 (= e!505138 e!505140)))

(declare-fun lt!407608 () (_ BitVec 64))

(assert (=> b!902039 (= lt!407608 (select (arr!25419 _keys!1386) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30574 0))(
  ( (Unit!30575) )
))
(declare-fun lt!407610 () Unit!30574)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52909 (_ BitVec 64) (_ BitVec 32)) Unit!30574)

(assert (=> b!902039 (= lt!407610 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!407608 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!52909 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!902039 (arrayContainsKey!0 _keys!1386 lt!407608 #b00000000000000000000000000000000)))

(declare-fun lt!407609 () Unit!30574)

(assert (=> b!902039 (= lt!407609 lt!407610)))

(declare-fun res!608811 () Bool)

(declare-datatypes ((SeekEntryResult!8958 0))(
  ( (MissingZero!8958 (index!38203 (_ BitVec 32))) (Found!8958 (index!38204 (_ BitVec 32))) (Intermediate!8958 (undefined!9770 Bool) (index!38205 (_ BitVec 32)) (x!76894 (_ BitVec 32))) (Undefined!8958) (MissingVacant!8958 (index!38206 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52909 (_ BitVec 32)) SeekEntryResult!8958)

(assert (=> b!902039 (= res!608811 (= (seekEntryOrOpen!0 (select (arr!25419 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) (Found!8958 #b00000000000000000000000000000000)))))

(assert (=> b!902039 (=> (not res!608811) (not e!505140))))

(declare-fun b!902040 () Bool)

(assert (=> b!902040 (= e!505138 call!40211)))

(assert (= (and d!111731 (not res!608812)) b!902038))

(assert (= (and b!902038 c!95568) b!902039))

(assert (= (and b!902038 (not c!95568)) b!902040))

(assert (= (and b!902039 res!608811) b!902037))

(assert (= (or b!902037 b!902040) bm!40208))

(declare-fun m!837585 () Bool)

(assert (=> b!902038 m!837585))

(assert (=> b!902038 m!837585))

(declare-fun m!837587 () Bool)

(assert (=> b!902038 m!837587))

(declare-fun m!837589 () Bool)

(assert (=> bm!40208 m!837589))

(assert (=> b!902039 m!837585))

(declare-fun m!837591 () Bool)

(assert (=> b!902039 m!837591))

(declare-fun m!837593 () Bool)

(assert (=> b!902039 m!837593))

(assert (=> b!902039 m!837585))

(declare-fun m!837595 () Bool)

(assert (=> b!902039 m!837595))

(assert (=> b!901992 d!111731))

(declare-fun d!111733 () Bool)

(assert (=> d!111733 (= (validMask!0 mask!1756) (and (or (= mask!1756 #b00000000000000000000000000000111) (= mask!1756 #b00000000000000000000000000001111) (= mask!1756 #b00000000000000000000000000011111) (= mask!1756 #b00000000000000000000000000111111) (= mask!1756 #b00000000000000000000000001111111) (= mask!1756 #b00000000000000000000000011111111) (= mask!1756 #b00000000000000000000000111111111) (= mask!1756 #b00000000000000000000001111111111) (= mask!1756 #b00000000000000000000011111111111) (= mask!1756 #b00000000000000000000111111111111) (= mask!1756 #b00000000000000000001111111111111) (= mask!1756 #b00000000000000000011111111111111) (= mask!1756 #b00000000000000000111111111111111) (= mask!1756 #b00000000000000001111111111111111) (= mask!1756 #b00000000000000011111111111111111) (= mask!1756 #b00000000000000111111111111111111) (= mask!1756 #b00000000000001111111111111111111) (= mask!1756 #b00000000000011111111111111111111) (= mask!1756 #b00000000000111111111111111111111) (= mask!1756 #b00000000001111111111111111111111) (= mask!1756 #b00000000011111111111111111111111) (= mask!1756 #b00000000111111111111111111111111) (= mask!1756 #b00000001111111111111111111111111) (= mask!1756 #b00000011111111111111111111111111) (= mask!1756 #b00000111111111111111111111111111) (= mask!1756 #b00001111111111111111111111111111) (= mask!1756 #b00011111111111111111111111111111) (= mask!1756 #b00111111111111111111111111111111)) (bvsle mask!1756 #b00111111111111111111111111111111)))))

(assert (=> start!77364 d!111733))

(declare-fun d!111735 () Bool)

(assert (=> d!111735 (= (array_inv!19990 _values!1152) (bvsge (size!25881 _values!1152) #b00000000000000000000000000000000))))

(assert (=> start!77364 d!111735))

(declare-fun d!111737 () Bool)

(assert (=> d!111737 (= (array_inv!19991 _keys!1386) (bvsge (size!25880 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> start!77364 d!111737))

(declare-fun b!902047 () Bool)

(declare-fun e!505146 () Bool)

(assert (=> b!902047 (= e!505146 tp_is_empty!18433)))

(declare-fun condMapEmpty!29356 () Bool)

(declare-fun mapDefault!29356 () ValueCell!8735)

(assert (=> mapNonEmpty!29347 (= condMapEmpty!29356 (= mapRest!29347 ((as const (Array (_ BitVec 32) ValueCell!8735)) mapDefault!29356)))))

(declare-fun e!505145 () Bool)

(declare-fun mapRes!29356 () Bool)

(assert (=> mapNonEmpty!29347 (= tp!56407 (and e!505145 mapRes!29356))))

(declare-fun mapIsEmpty!29356 () Bool)

(assert (=> mapIsEmpty!29356 mapRes!29356))

(declare-fun mapNonEmpty!29356 () Bool)

(declare-fun tp!56416 () Bool)

(assert (=> mapNonEmpty!29356 (= mapRes!29356 (and tp!56416 e!505146))))

(declare-fun mapRest!29356 () (Array (_ BitVec 32) ValueCell!8735))

(declare-fun mapValue!29356 () ValueCell!8735)

(declare-fun mapKey!29356 () (_ BitVec 32))

(assert (=> mapNonEmpty!29356 (= mapRest!29347 (store mapRest!29356 mapKey!29356 mapValue!29356))))

(declare-fun b!902048 () Bool)

(assert (=> b!902048 (= e!505145 tp_is_empty!18433)))

(assert (= (and mapNonEmpty!29347 condMapEmpty!29356) mapIsEmpty!29356))

(assert (= (and mapNonEmpty!29347 (not condMapEmpty!29356)) mapNonEmpty!29356))

(assert (= (and mapNonEmpty!29356 ((_ is ValueCellFull!8735) mapValue!29356)) b!902047))

(assert (= (and mapNonEmpty!29347 ((_ is ValueCellFull!8735) mapDefault!29356)) b!902048))

(declare-fun m!837597 () Bool)

(assert (=> mapNonEmpty!29356 m!837597))

(check-sat tp_is_empty!18433 (not mapNonEmpty!29356) (not b!902039) (not bm!40208) (not b!902038))
(check-sat)
