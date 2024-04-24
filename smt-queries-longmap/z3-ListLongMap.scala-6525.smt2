; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83172 () Bool)

(assert start!83172)

(declare-fun b!969537 () Bool)

(declare-fun res!648768 () Bool)

(declare-fun e!546508 () Bool)

(assert (=> b!969537 (=> (not res!648768) (not e!546508))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34217 0))(
  ( (V!34218 (val!11013 Int)) )
))
(declare-datatypes ((ValueCell!10481 0))(
  ( (ValueCellFull!10481 (v!13568 V!34217)) (EmptyCell!10481) )
))
(declare-datatypes ((array!59938 0))(
  ( (array!59939 (arr!28831 (Array (_ BitVec 32) ValueCell!10481)) (size!29311 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59938)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!59940 0))(
  ( (array!59941 (arr!28832 (Array (_ BitVec 32) (_ BitVec 64))) (size!29312 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59940)

(assert (=> b!969537 (= res!648768 (and (= (size!29311 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29312 _keys!1717) (size!29311 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun res!648766 () Bool)

(assert (=> start!83172 (=> (not res!648766) (not e!546508))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83172 (= res!648766 (validMask!0 mask!2147))))

(assert (=> start!83172 e!546508))

(assert (=> start!83172 true))

(declare-fun e!546512 () Bool)

(declare-fun array_inv!22379 (array!59938) Bool)

(assert (=> start!83172 (and (array_inv!22379 _values!1425) e!546512)))

(declare-fun array_inv!22380 (array!59940) Bool)

(assert (=> start!83172 (array_inv!22380 _keys!1717)))

(declare-fun b!969538 () Bool)

(declare-fun e!546510 () Bool)

(declare-fun tp_is_empty!21925 () Bool)

(assert (=> b!969538 (= e!546510 tp_is_empty!21925)))

(declare-fun mapNonEmpty!34888 () Bool)

(declare-fun mapRes!34888 () Bool)

(declare-fun tp!66457 () Bool)

(declare-fun e!546511 () Bool)

(assert (=> mapNonEmpty!34888 (= mapRes!34888 (and tp!66457 e!546511))))

(declare-fun mapValue!34888 () ValueCell!10481)

(declare-fun mapRest!34888 () (Array (_ BitVec 32) ValueCell!10481))

(declare-fun mapKey!34888 () (_ BitVec 32))

(assert (=> mapNonEmpty!34888 (= (arr!28831 _values!1425) (store mapRest!34888 mapKey!34888 mapValue!34888))))

(declare-fun b!969539 () Bool)

(assert (=> b!969539 (= e!546508 (and (bvsle #b00000000000000000000000000000000 (size!29312 _keys!1717)) (bvsge (size!29312 _keys!1717) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!34888 () Bool)

(assert (=> mapIsEmpty!34888 mapRes!34888))

(declare-fun b!969540 () Bool)

(declare-fun res!648767 () Bool)

(assert (=> b!969540 (=> (not res!648767) (not e!546508))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59940 (_ BitVec 32)) Bool)

(assert (=> b!969540 (= res!648767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!969541 () Bool)

(assert (=> b!969541 (= e!546512 (and e!546510 mapRes!34888))))

(declare-fun condMapEmpty!34888 () Bool)

(declare-fun mapDefault!34888 () ValueCell!10481)

(assert (=> b!969541 (= condMapEmpty!34888 (= (arr!28831 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10481)) mapDefault!34888)))))

(declare-fun b!969542 () Bool)

(assert (=> b!969542 (= e!546511 tp_is_empty!21925)))

(assert (= (and start!83172 res!648766) b!969537))

(assert (= (and b!969537 res!648768) b!969540))

(assert (= (and b!969540 res!648767) b!969539))

(assert (= (and b!969541 condMapEmpty!34888) mapIsEmpty!34888))

(assert (= (and b!969541 (not condMapEmpty!34888)) mapNonEmpty!34888))

(get-info :version)

(assert (= (and mapNonEmpty!34888 ((_ is ValueCellFull!10481) mapValue!34888)) b!969542))

(assert (= (and b!969541 ((_ is ValueCellFull!10481) mapDefault!34888)) b!969538))

(assert (= start!83172 b!969541))

(declare-fun m!898211 () Bool)

(assert (=> start!83172 m!898211))

(declare-fun m!898213 () Bool)

(assert (=> start!83172 m!898213))

(declare-fun m!898215 () Bool)

(assert (=> start!83172 m!898215))

(declare-fun m!898217 () Bool)

(assert (=> mapNonEmpty!34888 m!898217))

(declare-fun m!898219 () Bool)

(assert (=> b!969540 m!898219))

(check-sat (not start!83172) (not b!969540) (not mapNonEmpty!34888) tp_is_empty!21925)
(check-sat)
(get-model)

(declare-fun d!116573 () Bool)

(assert (=> d!116573 (= (validMask!0 mask!2147) (and (or (= mask!2147 #b00000000000000000000000000000111) (= mask!2147 #b00000000000000000000000000001111) (= mask!2147 #b00000000000000000000000000011111) (= mask!2147 #b00000000000000000000000000111111) (= mask!2147 #b00000000000000000000000001111111) (= mask!2147 #b00000000000000000000000011111111) (= mask!2147 #b00000000000000000000000111111111) (= mask!2147 #b00000000000000000000001111111111) (= mask!2147 #b00000000000000000000011111111111) (= mask!2147 #b00000000000000000000111111111111) (= mask!2147 #b00000000000000000001111111111111) (= mask!2147 #b00000000000000000011111111111111) (= mask!2147 #b00000000000000000111111111111111) (= mask!2147 #b00000000000000001111111111111111) (= mask!2147 #b00000000000000011111111111111111) (= mask!2147 #b00000000000000111111111111111111) (= mask!2147 #b00000000000001111111111111111111) (= mask!2147 #b00000000000011111111111111111111) (= mask!2147 #b00000000000111111111111111111111) (= mask!2147 #b00000000001111111111111111111111) (= mask!2147 #b00000000011111111111111111111111) (= mask!2147 #b00000000111111111111111111111111) (= mask!2147 #b00000001111111111111111111111111) (= mask!2147 #b00000011111111111111111111111111) (= mask!2147 #b00000111111111111111111111111111) (= mask!2147 #b00001111111111111111111111111111) (= mask!2147 #b00011111111111111111111111111111) (= mask!2147 #b00111111111111111111111111111111)) (bvsle mask!2147 #b00111111111111111111111111111111)))))

(assert (=> start!83172 d!116573))

(declare-fun d!116575 () Bool)

(assert (=> d!116575 (= (array_inv!22379 _values!1425) (bvsge (size!29311 _values!1425) #b00000000000000000000000000000000))))

(assert (=> start!83172 d!116575))

(declare-fun d!116577 () Bool)

(assert (=> d!116577 (= (array_inv!22380 _keys!1717) (bvsge (size!29312 _keys!1717) #b00000000000000000000000000000000))))

(assert (=> start!83172 d!116577))

(declare-fun b!969587 () Bool)

(declare-fun e!546549 () Bool)

(declare-fun e!546551 () Bool)

(assert (=> b!969587 (= e!546549 e!546551)))

(declare-fun c!100205 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!969587 (= c!100205 (validKeyInArray!0 (select (arr!28832 _keys!1717) #b00000000000000000000000000000000)))))

(declare-fun b!969588 () Bool)

(declare-fun e!546550 () Bool)

(assert (=> b!969588 (= e!546551 e!546550)))

(declare-fun lt!431899 () (_ BitVec 64))

(assert (=> b!969588 (= lt!431899 (select (arr!28832 _keys!1717) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32328 0))(
  ( (Unit!32329) )
))
(declare-fun lt!431898 () Unit!32328)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!59940 (_ BitVec 64) (_ BitVec 32)) Unit!32328)

(assert (=> b!969588 (= lt!431898 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1717 lt!431899 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!59940 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!969588 (arrayContainsKey!0 _keys!1717 lt!431899 #b00000000000000000000000000000000)))

(declare-fun lt!431900 () Unit!32328)

(assert (=> b!969588 (= lt!431900 lt!431898)))

(declare-fun res!648791 () Bool)

(declare-datatypes ((SeekEntryResult!9153 0))(
  ( (MissingZero!9153 (index!38983 (_ BitVec 32))) (Found!9153 (index!38984 (_ BitVec 32))) (Intermediate!9153 (undefined!9965 Bool) (index!38985 (_ BitVec 32)) (x!83597 (_ BitVec 32))) (Undefined!9153) (MissingVacant!9153 (index!38986 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!59940 (_ BitVec 32)) SeekEntryResult!9153)

(assert (=> b!969588 (= res!648791 (= (seekEntryOrOpen!0 (select (arr!28832 _keys!1717) #b00000000000000000000000000000000) _keys!1717 mask!2147) (Found!9153 #b00000000000000000000000000000000)))))

(assert (=> b!969588 (=> (not res!648791) (not e!546550))))

(declare-fun bm!41777 () Bool)

(declare-fun call!41780 () Bool)

(assert (=> bm!41777 (= call!41780 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1717 mask!2147))))

(declare-fun b!969589 () Bool)

(assert (=> b!969589 (= e!546551 call!41780)))

(declare-fun d!116579 () Bool)

(declare-fun res!648792 () Bool)

(assert (=> d!116579 (=> res!648792 e!546549)))

(assert (=> d!116579 (= res!648792 (bvsge #b00000000000000000000000000000000 (size!29312 _keys!1717)))))

(assert (=> d!116579 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147) e!546549)))

(declare-fun b!969590 () Bool)

(assert (=> b!969590 (= e!546550 call!41780)))

(assert (= (and d!116579 (not res!648792)) b!969587))

(assert (= (and b!969587 c!100205) b!969588))

(assert (= (and b!969587 (not c!100205)) b!969589))

(assert (= (and b!969588 res!648791) b!969590))

(assert (= (or b!969590 b!969589) bm!41777))

(declare-fun m!898241 () Bool)

(assert (=> b!969587 m!898241))

(assert (=> b!969587 m!898241))

(declare-fun m!898243 () Bool)

(assert (=> b!969587 m!898243))

(assert (=> b!969588 m!898241))

(declare-fun m!898245 () Bool)

(assert (=> b!969588 m!898245))

(declare-fun m!898247 () Bool)

(assert (=> b!969588 m!898247))

(assert (=> b!969588 m!898241))

(declare-fun m!898249 () Bool)

(assert (=> b!969588 m!898249))

(declare-fun m!898251 () Bool)

(assert (=> bm!41777 m!898251))

(assert (=> b!969540 d!116579))

(declare-fun b!969597 () Bool)

(declare-fun e!546556 () Bool)

(assert (=> b!969597 (= e!546556 tp_is_empty!21925)))

(declare-fun mapIsEmpty!34897 () Bool)

(declare-fun mapRes!34897 () Bool)

(assert (=> mapIsEmpty!34897 mapRes!34897))

(declare-fun condMapEmpty!34897 () Bool)

(declare-fun mapDefault!34897 () ValueCell!10481)

(assert (=> mapNonEmpty!34888 (= condMapEmpty!34897 (= mapRest!34888 ((as const (Array (_ BitVec 32) ValueCell!10481)) mapDefault!34897)))))

(declare-fun e!546557 () Bool)

(assert (=> mapNonEmpty!34888 (= tp!66457 (and e!546557 mapRes!34897))))

(declare-fun mapNonEmpty!34897 () Bool)

(declare-fun tp!66466 () Bool)

(assert (=> mapNonEmpty!34897 (= mapRes!34897 (and tp!66466 e!546556))))

(declare-fun mapValue!34897 () ValueCell!10481)

(declare-fun mapKey!34897 () (_ BitVec 32))

(declare-fun mapRest!34897 () (Array (_ BitVec 32) ValueCell!10481))

(assert (=> mapNonEmpty!34897 (= mapRest!34888 (store mapRest!34897 mapKey!34897 mapValue!34897))))

(declare-fun b!969598 () Bool)

(assert (=> b!969598 (= e!546557 tp_is_empty!21925)))

(assert (= (and mapNonEmpty!34888 condMapEmpty!34897) mapIsEmpty!34897))

(assert (= (and mapNonEmpty!34888 (not condMapEmpty!34897)) mapNonEmpty!34897))

(assert (= (and mapNonEmpty!34897 ((_ is ValueCellFull!10481) mapValue!34897)) b!969597))

(assert (= (and mapNonEmpty!34888 ((_ is ValueCellFull!10481) mapDefault!34897)) b!969598))

(declare-fun m!898253 () Bool)

(assert (=> mapNonEmpty!34897 m!898253))

(check-sat (not b!969587) tp_is_empty!21925 (not mapNonEmpty!34897) (not b!969588) (not bm!41777))
(check-sat)
