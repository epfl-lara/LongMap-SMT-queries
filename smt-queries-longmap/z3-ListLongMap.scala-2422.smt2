; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38246 () Bool)

(assert start!38246)

(declare-fun b!394492 () Bool)

(declare-fun res!226151 () Bool)

(declare-fun e!238813 () Bool)

(assert (=> b!394492 (=> (not res!226151) (not e!238813))))

(declare-datatypes ((array!23431 0))(
  ( (array!23432 (arr!11172 (Array (_ BitVec 32) (_ BitVec 64))) (size!11525 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23431)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23431 (_ BitVec 32)) Bool)

(assert (=> b!394492 (= res!226151 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!226153 () Bool)

(assert (=> start!38246 (=> (not res!226153) (not e!238813))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38246 (= res!226153 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11525 _keys!709))))))

(assert (=> start!38246 e!238813))

(assert (=> start!38246 true))

(declare-datatypes ((V!14131 0))(
  ( (V!14132 (val!4929 Int)) )
))
(declare-datatypes ((ValueCell!4541 0))(
  ( (ValueCellFull!4541 (v!7168 V!14131)) (EmptyCell!4541) )
))
(declare-datatypes ((array!23433 0))(
  ( (array!23434 (arr!11173 (Array (_ BitVec 32) ValueCell!4541)) (size!11526 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23433)

(declare-fun e!238816 () Bool)

(declare-fun array_inv!8202 (array!23433) Bool)

(assert (=> start!38246 (and (array_inv!8202 _values!549) e!238816)))

(declare-fun array_inv!8203 (array!23431) Bool)

(assert (=> start!38246 (array_inv!8203 _keys!709)))

(declare-fun b!394493 () Bool)

(declare-fun e!238817 () Bool)

(declare-fun mapRes!16254 () Bool)

(assert (=> b!394493 (= e!238816 (and e!238817 mapRes!16254))))

(declare-fun condMapEmpty!16254 () Bool)

(declare-fun mapDefault!16254 () ValueCell!4541)

(assert (=> b!394493 (= condMapEmpty!16254 (= (arr!11173 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4541)) mapDefault!16254)))))

(declare-fun b!394494 () Bool)

(declare-fun res!226152 () Bool)

(assert (=> b!394494 (=> (not res!226152) (not e!238813))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!394494 (= res!226152 (and (= (size!11526 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11525 _keys!709) (size!11526 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!16254 () Bool)

(declare-fun tp!32049 () Bool)

(declare-fun e!238815 () Bool)

(assert (=> mapNonEmpty!16254 (= mapRes!16254 (and tp!32049 e!238815))))

(declare-fun mapKey!16254 () (_ BitVec 32))

(declare-fun mapValue!16254 () ValueCell!4541)

(declare-fun mapRest!16254 () (Array (_ BitVec 32) ValueCell!4541))

(assert (=> mapNonEmpty!16254 (= (arr!11173 _values!549) (store mapRest!16254 mapKey!16254 mapValue!16254))))

(declare-fun mapIsEmpty!16254 () Bool)

(assert (=> mapIsEmpty!16254 mapRes!16254))

(declare-fun b!394495 () Bool)

(declare-fun tp_is_empty!9769 () Bool)

(assert (=> b!394495 (= e!238817 tp_is_empty!9769)))

(declare-fun b!394496 () Bool)

(assert (=> b!394496 (= e!238813 (and (bvsle #b00000000000000000000000000000000 (size!11525 _keys!709)) (bvsge (size!11525 _keys!709) #b01111111111111111111111111111111)))))

(declare-fun b!394497 () Bool)

(assert (=> b!394497 (= e!238815 tp_is_empty!9769)))

(declare-fun b!394498 () Bool)

(declare-fun res!226154 () Bool)

(assert (=> b!394498 (=> (not res!226154) (not e!238813))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!394498 (= res!226154 (validMask!0 mask!1025))))

(assert (= (and start!38246 res!226153) b!394498))

(assert (= (and b!394498 res!226154) b!394494))

(assert (= (and b!394494 res!226152) b!394492))

(assert (= (and b!394492 res!226151) b!394496))

(assert (= (and b!394493 condMapEmpty!16254) mapIsEmpty!16254))

(assert (= (and b!394493 (not condMapEmpty!16254)) mapNonEmpty!16254))

(get-info :version)

(assert (= (and mapNonEmpty!16254 ((_ is ValueCellFull!4541) mapValue!16254)) b!394497))

(assert (= (and b!394493 ((_ is ValueCellFull!4541) mapDefault!16254)) b!394495))

(assert (= start!38246 b!394493))

(declare-fun m!390393 () Bool)

(assert (=> b!394492 m!390393))

(declare-fun m!390395 () Bool)

(assert (=> start!38246 m!390395))

(declare-fun m!390397 () Bool)

(assert (=> start!38246 m!390397))

(declare-fun m!390399 () Bool)

(assert (=> mapNonEmpty!16254 m!390399))

(declare-fun m!390401 () Bool)

(assert (=> b!394498 m!390401))

(check-sat (not mapNonEmpty!16254) (not start!38246) (not b!394492) (not b!394498) tp_is_empty!9769)
(check-sat)
(get-model)

(declare-fun b!394549 () Bool)

(declare-fun e!238854 () Bool)

(declare-fun e!238856 () Bool)

(assert (=> b!394549 (= e!238854 e!238856)))

(declare-fun c!54468 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!394549 (= c!54468 (validKeyInArray!0 (select (arr!11172 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun bm!27835 () Bool)

(declare-fun call!27838 () Bool)

(assert (=> bm!27835 (= call!27838 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(declare-fun d!73087 () Bool)

(declare-fun res!226184 () Bool)

(assert (=> d!73087 (=> res!226184 e!238854)))

(assert (=> d!73087 (= res!226184 (bvsge #b00000000000000000000000000000000 (size!11525 _keys!709)))))

(assert (=> d!73087 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!238854)))

(declare-fun b!394550 () Bool)

(assert (=> b!394550 (= e!238856 call!27838)))

(declare-fun b!394551 () Bool)

(declare-fun e!238855 () Bool)

(assert (=> b!394551 (= e!238856 e!238855)))

(declare-fun lt!186799 () (_ BitVec 64))

(assert (=> b!394551 (= lt!186799 (select (arr!11172 _keys!709) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!12034 0))(
  ( (Unit!12035) )
))
(declare-fun lt!186801 () Unit!12034)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23431 (_ BitVec 64) (_ BitVec 32)) Unit!12034)

(assert (=> b!394551 (= lt!186801 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!186799 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!23431 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!394551 (arrayContainsKey!0 _keys!709 lt!186799 #b00000000000000000000000000000000)))

(declare-fun lt!186800 () Unit!12034)

(assert (=> b!394551 (= lt!186800 lt!186801)))

(declare-fun res!226183 () Bool)

(declare-datatypes ((SeekEntryResult!3515 0))(
  ( (MissingZero!3515 (index!16239 (_ BitVec 32))) (Found!3515 (index!16240 (_ BitVec 32))) (Intermediate!3515 (undefined!4327 Bool) (index!16241 (_ BitVec 32)) (x!38562 (_ BitVec 32))) (Undefined!3515) (MissingVacant!3515 (index!16242 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23431 (_ BitVec 32)) SeekEntryResult!3515)

(assert (=> b!394551 (= res!226183 (= (seekEntryOrOpen!0 (select (arr!11172 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3515 #b00000000000000000000000000000000)))))

(assert (=> b!394551 (=> (not res!226183) (not e!238855))))

(declare-fun b!394552 () Bool)

(assert (=> b!394552 (= e!238855 call!27838)))

(assert (= (and d!73087 (not res!226184)) b!394549))

(assert (= (and b!394549 c!54468) b!394551))

(assert (= (and b!394549 (not c!54468)) b!394550))

(assert (= (and b!394551 res!226183) b!394552))

(assert (= (or b!394552 b!394550) bm!27835))

(declare-fun m!390423 () Bool)

(assert (=> b!394549 m!390423))

(assert (=> b!394549 m!390423))

(declare-fun m!390425 () Bool)

(assert (=> b!394549 m!390425))

(declare-fun m!390427 () Bool)

(assert (=> bm!27835 m!390427))

(assert (=> b!394551 m!390423))

(declare-fun m!390429 () Bool)

(assert (=> b!394551 m!390429))

(declare-fun m!390431 () Bool)

(assert (=> b!394551 m!390431))

(assert (=> b!394551 m!390423))

(declare-fun m!390433 () Bool)

(assert (=> b!394551 m!390433))

(assert (=> b!394492 d!73087))

(declare-fun d!73089 () Bool)

(assert (=> d!73089 (= (array_inv!8202 _values!549) (bvsge (size!11526 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!38246 d!73089))

(declare-fun d!73091 () Bool)

(assert (=> d!73091 (= (array_inv!8203 _keys!709) (bvsge (size!11525 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!38246 d!73091))

(declare-fun d!73093 () Bool)

(assert (=> d!73093 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!394498 d!73093))

(declare-fun mapIsEmpty!16263 () Bool)

(declare-fun mapRes!16263 () Bool)

(assert (=> mapIsEmpty!16263 mapRes!16263))

(declare-fun mapNonEmpty!16263 () Bool)

(declare-fun tp!32058 () Bool)

(declare-fun e!238862 () Bool)

(assert (=> mapNonEmpty!16263 (= mapRes!16263 (and tp!32058 e!238862))))

(declare-fun mapRest!16263 () (Array (_ BitVec 32) ValueCell!4541))

(declare-fun mapValue!16263 () ValueCell!4541)

(declare-fun mapKey!16263 () (_ BitVec 32))

(assert (=> mapNonEmpty!16263 (= mapRest!16254 (store mapRest!16263 mapKey!16263 mapValue!16263))))

(declare-fun b!394559 () Bool)

(assert (=> b!394559 (= e!238862 tp_is_empty!9769)))

(declare-fun condMapEmpty!16263 () Bool)

(declare-fun mapDefault!16263 () ValueCell!4541)

(assert (=> mapNonEmpty!16254 (= condMapEmpty!16263 (= mapRest!16254 ((as const (Array (_ BitVec 32) ValueCell!4541)) mapDefault!16263)))))

(declare-fun e!238861 () Bool)

(assert (=> mapNonEmpty!16254 (= tp!32049 (and e!238861 mapRes!16263))))

(declare-fun b!394560 () Bool)

(assert (=> b!394560 (= e!238861 tp_is_empty!9769)))

(assert (= (and mapNonEmpty!16254 condMapEmpty!16263) mapIsEmpty!16263))

(assert (= (and mapNonEmpty!16254 (not condMapEmpty!16263)) mapNonEmpty!16263))

(assert (= (and mapNonEmpty!16263 ((_ is ValueCellFull!4541) mapValue!16263)) b!394559))

(assert (= (and mapNonEmpty!16254 ((_ is ValueCellFull!4541) mapDefault!16263)) b!394560))

(declare-fun m!390435 () Bool)

(assert (=> mapNonEmpty!16263 m!390435))

(check-sat tp_is_empty!9769 (not bm!27835) (not mapNonEmpty!16263) (not b!394549) (not b!394551))
(check-sat)
