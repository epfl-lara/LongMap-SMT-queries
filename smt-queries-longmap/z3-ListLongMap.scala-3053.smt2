; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43108 () Bool)

(assert start!43108)

(declare-fun b!478019 () Bool)

(declare-fun e!281002 () Bool)

(declare-datatypes ((array!30763 0))(
  ( (array!30764 (arr!14793 (Array (_ BitVec 32) (_ BitVec 64))) (size!15152 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30763)

(assert (=> b!478019 (= e!281002 (bvsgt #b00000000000000000000000000000000 (size!15152 _keys!1874)))))

(declare-fun b!478020 () Bool)

(declare-fun e!281001 () Bool)

(declare-fun tp_is_empty!13549 () Bool)

(assert (=> b!478020 (= e!281001 tp_is_empty!13549)))

(declare-fun mapIsEmpty!22006 () Bool)

(declare-fun mapRes!22006 () Bool)

(assert (=> mapIsEmpty!22006 mapRes!22006))

(declare-fun res!285252 () Bool)

(assert (=> start!43108 (=> (not res!285252) (not e!281002))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43108 (= res!285252 (validMask!0 mask!2352))))

(assert (=> start!43108 e!281002))

(assert (=> start!43108 true))

(declare-datatypes ((V!19137 0))(
  ( (V!19138 (val!6822 Int)) )
))
(declare-datatypes ((ValueCell!6413 0))(
  ( (ValueCellFull!6413 (v!9104 V!19137)) (EmptyCell!6413) )
))
(declare-datatypes ((array!30765 0))(
  ( (array!30766 (arr!14794 (Array (_ BitVec 32) ValueCell!6413)) (size!15153 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30765)

(declare-fun e!281003 () Bool)

(declare-fun array_inv!10760 (array!30765) Bool)

(assert (=> start!43108 (and (array_inv!10760 _values!1516) e!281003)))

(declare-fun array_inv!10761 (array!30763) Bool)

(assert (=> start!43108 (array_inv!10761 _keys!1874)))

(declare-fun b!478021 () Bool)

(declare-fun res!285251 () Bool)

(assert (=> b!478021 (=> (not res!285251) (not e!281002))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!478021 (= res!285251 (and (= (size!15153 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15152 _keys!1874) (size!15153 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!478022 () Bool)

(declare-fun e!281005 () Bool)

(assert (=> b!478022 (= e!281005 tp_is_empty!13549)))

(declare-fun mapNonEmpty!22006 () Bool)

(declare-fun tp!42481 () Bool)

(assert (=> mapNonEmpty!22006 (= mapRes!22006 (and tp!42481 e!281001))))

(declare-fun mapKey!22006 () (_ BitVec 32))

(declare-fun mapRest!22006 () (Array (_ BitVec 32) ValueCell!6413))

(declare-fun mapValue!22006 () ValueCell!6413)

(assert (=> mapNonEmpty!22006 (= (arr!14794 _values!1516) (store mapRest!22006 mapKey!22006 mapValue!22006))))

(declare-fun b!478023 () Bool)

(declare-fun res!285253 () Bool)

(assert (=> b!478023 (=> (not res!285253) (not e!281002))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30763 (_ BitVec 32)) Bool)

(assert (=> b!478023 (= res!285253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!478024 () Bool)

(assert (=> b!478024 (= e!281003 (and e!281005 mapRes!22006))))

(declare-fun condMapEmpty!22006 () Bool)

(declare-fun mapDefault!22006 () ValueCell!6413)

(assert (=> b!478024 (= condMapEmpty!22006 (= (arr!14794 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6413)) mapDefault!22006)))))

(assert (= (and start!43108 res!285252) b!478021))

(assert (= (and b!478021 res!285251) b!478023))

(assert (= (and b!478023 res!285253) b!478019))

(assert (= (and b!478024 condMapEmpty!22006) mapIsEmpty!22006))

(assert (= (and b!478024 (not condMapEmpty!22006)) mapNonEmpty!22006))

(get-info :version)

(assert (= (and mapNonEmpty!22006 ((_ is ValueCellFull!6413) mapValue!22006)) b!478020))

(assert (= (and b!478024 ((_ is ValueCellFull!6413) mapDefault!22006)) b!478022))

(assert (= start!43108 b!478024))

(declare-fun m!459889 () Bool)

(assert (=> start!43108 m!459889))

(declare-fun m!459891 () Bool)

(assert (=> start!43108 m!459891))

(declare-fun m!459893 () Bool)

(assert (=> start!43108 m!459893))

(declare-fun m!459895 () Bool)

(assert (=> mapNonEmpty!22006 m!459895))

(declare-fun m!459897 () Bool)

(assert (=> b!478023 m!459897))

(check-sat (not start!43108) (not b!478023) (not mapNonEmpty!22006) tp_is_empty!13549)
(check-sat)
(get-model)

(declare-fun d!76385 () Bool)

(assert (=> d!76385 (= (validMask!0 mask!2352) (and (or (= mask!2352 #b00000000000000000000000000000111) (= mask!2352 #b00000000000000000000000000001111) (= mask!2352 #b00000000000000000000000000011111) (= mask!2352 #b00000000000000000000000000111111) (= mask!2352 #b00000000000000000000000001111111) (= mask!2352 #b00000000000000000000000011111111) (= mask!2352 #b00000000000000000000000111111111) (= mask!2352 #b00000000000000000000001111111111) (= mask!2352 #b00000000000000000000011111111111) (= mask!2352 #b00000000000000000000111111111111) (= mask!2352 #b00000000000000000001111111111111) (= mask!2352 #b00000000000000000011111111111111) (= mask!2352 #b00000000000000000111111111111111) (= mask!2352 #b00000000000000001111111111111111) (= mask!2352 #b00000000000000011111111111111111) (= mask!2352 #b00000000000000111111111111111111) (= mask!2352 #b00000000000001111111111111111111) (= mask!2352 #b00000000000011111111111111111111) (= mask!2352 #b00000000000111111111111111111111) (= mask!2352 #b00000000001111111111111111111111) (= mask!2352 #b00000000011111111111111111111111) (= mask!2352 #b00000000111111111111111111111111) (= mask!2352 #b00000001111111111111111111111111) (= mask!2352 #b00000011111111111111111111111111) (= mask!2352 #b00000111111111111111111111111111) (= mask!2352 #b00001111111111111111111111111111) (= mask!2352 #b00011111111111111111111111111111) (= mask!2352 #b00111111111111111111111111111111)) (bvsle mask!2352 #b00111111111111111111111111111111)))))

(assert (=> start!43108 d!76385))

(declare-fun d!76387 () Bool)

(assert (=> d!76387 (= (array_inv!10760 _values!1516) (bvsge (size!15153 _values!1516) #b00000000000000000000000000000000))))

(assert (=> start!43108 d!76387))

(declare-fun d!76389 () Bool)

(assert (=> d!76389 (= (array_inv!10761 _keys!1874) (bvsge (size!15152 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> start!43108 d!76389))

(declare-fun b!478069 () Bool)

(declare-fun e!281043 () Bool)

(declare-fun call!30807 () Bool)

(assert (=> b!478069 (= e!281043 call!30807)))

(declare-fun bm!30804 () Bool)

(assert (=> bm!30804 (= call!30807 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(declare-fun b!478070 () Bool)

(declare-fun e!281044 () Bool)

(assert (=> b!478070 (= e!281044 call!30807)))

(declare-fun d!76391 () Bool)

(declare-fun res!285277 () Bool)

(declare-fun e!281042 () Bool)

(assert (=> d!76391 (=> res!285277 e!281042)))

(assert (=> d!76391 (= res!285277 (bvsge #b00000000000000000000000000000000 (size!15152 _keys!1874)))))

(assert (=> d!76391 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352) e!281042)))

(declare-fun b!478071 () Bool)

(assert (=> b!478071 (= e!281042 e!281044)))

(declare-fun c!57590 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!478071 (= c!57590 (validKeyInArray!0 (select (arr!14793 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!478072 () Bool)

(assert (=> b!478072 (= e!281044 e!281043)))

(declare-fun lt!217474 () (_ BitVec 64))

(assert (=> b!478072 (= lt!217474 (select (arr!14793 _keys!1874) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!14038 0))(
  ( (Unit!14039) )
))
(declare-fun lt!217476 () Unit!14038)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!30763 (_ BitVec 64) (_ BitVec 32)) Unit!14038)

(assert (=> b!478072 (= lt!217476 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!217474 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!30763 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!478072 (arrayContainsKey!0 _keys!1874 lt!217474 #b00000000000000000000000000000000)))

(declare-fun lt!217475 () Unit!14038)

(assert (=> b!478072 (= lt!217475 lt!217476)))

(declare-fun res!285276 () Bool)

(declare-datatypes ((SeekEntryResult!3558 0))(
  ( (MissingZero!3558 (index!16411 (_ BitVec 32))) (Found!3558 (index!16412 (_ BitVec 32))) (Intermediate!3558 (undefined!4370 Bool) (index!16413 (_ BitVec 32)) (x!44873 (_ BitVec 32))) (Undefined!3558) (MissingVacant!3558 (index!16414 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!30763 (_ BitVec 32)) SeekEntryResult!3558)

(assert (=> b!478072 (= res!285276 (= (seekEntryOrOpen!0 (select (arr!14793 _keys!1874) #b00000000000000000000000000000000) _keys!1874 mask!2352) (Found!3558 #b00000000000000000000000000000000)))))

(assert (=> b!478072 (=> (not res!285276) (not e!281043))))

(assert (= (and d!76391 (not res!285277)) b!478071))

(assert (= (and b!478071 c!57590) b!478072))

(assert (= (and b!478071 (not c!57590)) b!478070))

(assert (= (and b!478072 res!285276) b!478069))

(assert (= (or b!478069 b!478070) bm!30804))

(declare-fun m!459919 () Bool)

(assert (=> bm!30804 m!459919))

(declare-fun m!459921 () Bool)

(assert (=> b!478071 m!459921))

(assert (=> b!478071 m!459921))

(declare-fun m!459923 () Bool)

(assert (=> b!478071 m!459923))

(assert (=> b!478072 m!459921))

(declare-fun m!459925 () Bool)

(assert (=> b!478072 m!459925))

(declare-fun m!459927 () Bool)

(assert (=> b!478072 m!459927))

(assert (=> b!478072 m!459921))

(declare-fun m!459929 () Bool)

(assert (=> b!478072 m!459929))

(assert (=> b!478023 d!76391))

(declare-fun mapNonEmpty!22015 () Bool)

(declare-fun mapRes!22015 () Bool)

(declare-fun tp!42490 () Bool)

(declare-fun e!281050 () Bool)

(assert (=> mapNonEmpty!22015 (= mapRes!22015 (and tp!42490 e!281050))))

(declare-fun mapValue!22015 () ValueCell!6413)

(declare-fun mapRest!22015 () (Array (_ BitVec 32) ValueCell!6413))

(declare-fun mapKey!22015 () (_ BitVec 32))

(assert (=> mapNonEmpty!22015 (= mapRest!22006 (store mapRest!22015 mapKey!22015 mapValue!22015))))

(declare-fun condMapEmpty!22015 () Bool)

(declare-fun mapDefault!22015 () ValueCell!6413)

(assert (=> mapNonEmpty!22006 (= condMapEmpty!22015 (= mapRest!22006 ((as const (Array (_ BitVec 32) ValueCell!6413)) mapDefault!22015)))))

(declare-fun e!281049 () Bool)

(assert (=> mapNonEmpty!22006 (= tp!42481 (and e!281049 mapRes!22015))))

(declare-fun b!478080 () Bool)

(assert (=> b!478080 (= e!281049 tp_is_empty!13549)))

(declare-fun mapIsEmpty!22015 () Bool)

(assert (=> mapIsEmpty!22015 mapRes!22015))

(declare-fun b!478079 () Bool)

(assert (=> b!478079 (= e!281050 tp_is_empty!13549)))

(assert (= (and mapNonEmpty!22006 condMapEmpty!22015) mapIsEmpty!22015))

(assert (= (and mapNonEmpty!22006 (not condMapEmpty!22015)) mapNonEmpty!22015))

(assert (= (and mapNonEmpty!22015 ((_ is ValueCellFull!6413) mapValue!22015)) b!478079))

(assert (= (and mapNonEmpty!22006 ((_ is ValueCellFull!6413) mapDefault!22015)) b!478080))

(declare-fun m!459931 () Bool)

(assert (=> mapNonEmpty!22015 m!459931))

(check-sat (not mapNonEmpty!22015) (not b!478071) (not b!478072) tp_is_empty!13549 (not bm!30804))
(check-sat)
