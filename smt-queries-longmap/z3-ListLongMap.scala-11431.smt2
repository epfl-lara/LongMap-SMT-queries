; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133348 () Bool)

(assert start!133348)

(declare-fun res!1066289 () Bool)

(declare-fun e!868756 () Bool)

(assert (=> start!133348 (=> (not res!1066289) (not e!868756))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133348 (= res!1066289 (validMask!0 mask!947))))

(assert (=> start!133348 e!868756))

(assert (=> start!133348 true))

(declare-datatypes ((V!59499 0))(
  ( (V!59500 (val!19318 Int)) )
))
(declare-datatypes ((ValueCell!18204 0))(
  ( (ValueCellFull!18204 (v!22069 V!59499)) (EmptyCell!18204) )
))
(declare-datatypes ((array!103658 0))(
  ( (array!103659 (arr!50025 (Array (_ BitVec 32) ValueCell!18204)) (size!50575 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103658)

(declare-fun e!868757 () Bool)

(declare-fun array_inv!38887 (array!103658) Bool)

(assert (=> start!133348 (and (array_inv!38887 _values!487) e!868757)))

(declare-datatypes ((array!103660 0))(
  ( (array!103661 (arr!50026 (Array (_ BitVec 32) (_ BitVec 64))) (size!50576 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103660)

(declare-fun array_inv!38888 (array!103660) Bool)

(assert (=> start!133348 (array_inv!38888 _keys!637)))

(declare-fun b!1559234 () Bool)

(declare-fun e!868758 () Bool)

(declare-fun mapRes!59067 () Bool)

(assert (=> b!1559234 (= e!868757 (and e!868758 mapRes!59067))))

(declare-fun condMapEmpty!59067 () Bool)

(declare-fun mapDefault!59067 () ValueCell!18204)

(assert (=> b!1559234 (= condMapEmpty!59067 (= (arr!50025 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18204)) mapDefault!59067)))))

(declare-fun b!1559235 () Bool)

(declare-fun res!1066290 () Bool)

(assert (=> b!1559235 (=> (not res!1066290) (not e!868756))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103660 (_ BitVec 32)) Bool)

(assert (=> b!1559235 (= res!1066290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1559236 () Bool)

(declare-fun e!868759 () Bool)

(declare-fun tp_is_empty!38469 () Bool)

(assert (=> b!1559236 (= e!868759 tp_is_empty!38469)))

(declare-fun b!1559237 () Bool)

(assert (=> b!1559237 (= e!868756 (bvsgt #b00000000000000000000000000000000 (size!50576 _keys!637)))))

(declare-fun mapIsEmpty!59067 () Bool)

(assert (=> mapIsEmpty!59067 mapRes!59067))

(declare-fun b!1559238 () Bool)

(declare-fun res!1066291 () Bool)

(assert (=> b!1559238 (=> (not res!1066291) (not e!868756))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1559238 (= res!1066291 (and (= (size!50575 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50576 _keys!637) (size!50575 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1559239 () Bool)

(assert (=> b!1559239 (= e!868758 tp_is_empty!38469)))

(declare-fun mapNonEmpty!59067 () Bool)

(declare-fun tp!112722 () Bool)

(assert (=> mapNonEmpty!59067 (= mapRes!59067 (and tp!112722 e!868759))))

(declare-fun mapValue!59067 () ValueCell!18204)

(declare-fun mapKey!59067 () (_ BitVec 32))

(declare-fun mapRest!59067 () (Array (_ BitVec 32) ValueCell!18204))

(assert (=> mapNonEmpty!59067 (= (arr!50025 _values!487) (store mapRest!59067 mapKey!59067 mapValue!59067))))

(assert (= (and start!133348 res!1066289) b!1559238))

(assert (= (and b!1559238 res!1066291) b!1559235))

(assert (= (and b!1559235 res!1066290) b!1559237))

(assert (= (and b!1559234 condMapEmpty!59067) mapIsEmpty!59067))

(assert (= (and b!1559234 (not condMapEmpty!59067)) mapNonEmpty!59067))

(get-info :version)

(assert (= (and mapNonEmpty!59067 ((_ is ValueCellFull!18204) mapValue!59067)) b!1559236))

(assert (= (and b!1559234 ((_ is ValueCellFull!18204) mapDefault!59067)) b!1559239))

(assert (= start!133348 b!1559234))

(declare-fun m!1435557 () Bool)

(assert (=> start!133348 m!1435557))

(declare-fun m!1435559 () Bool)

(assert (=> start!133348 m!1435559))

(declare-fun m!1435561 () Bool)

(assert (=> start!133348 m!1435561))

(declare-fun m!1435563 () Bool)

(assert (=> b!1559235 m!1435563))

(declare-fun m!1435565 () Bool)

(assert (=> mapNonEmpty!59067 m!1435565))

(check-sat (not b!1559235) (not start!133348) (not mapNonEmpty!59067) tp_is_empty!38469)
(check-sat)
(get-model)

(declare-fun b!1559266 () Bool)

(declare-fun e!868784 () Bool)

(declare-fun call!71835 () Bool)

(assert (=> b!1559266 (= e!868784 call!71835)))

(declare-fun b!1559267 () Bool)

(declare-fun e!868782 () Bool)

(assert (=> b!1559267 (= e!868782 e!868784)))

(declare-fun c!144215 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1559267 (= c!144215 (validKeyInArray!0 (select (arr!50026 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun bm!71832 () Bool)

(assert (=> bm!71832 (= call!71835 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!637 mask!947))))

(declare-fun b!1559268 () Bool)

(declare-fun e!868783 () Bool)

(assert (=> b!1559268 (= e!868784 e!868783)))

(declare-fun lt!670857 () (_ BitVec 64))

(assert (=> b!1559268 (= lt!670857 (select (arr!50026 _keys!637) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51894 0))(
  ( (Unit!51895) )
))
(declare-fun lt!670858 () Unit!51894)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!103660 (_ BitVec 64) (_ BitVec 32)) Unit!51894)

(assert (=> b!1559268 (= lt!670858 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!670857 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!103660 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1559268 (arrayContainsKey!0 _keys!637 lt!670857 #b00000000000000000000000000000000)))

(declare-fun lt!670859 () Unit!51894)

(assert (=> b!1559268 (= lt!670859 lt!670858)))

(declare-fun res!1066305 () Bool)

(declare-datatypes ((SeekEntryResult!13517 0))(
  ( (MissingZero!13517 (index!56466 (_ BitVec 32))) (Found!13517 (index!56467 (_ BitVec 32))) (Intermediate!13517 (undefined!14329 Bool) (index!56468 (_ BitVec 32)) (x!139753 (_ BitVec 32))) (Undefined!13517) (MissingVacant!13517 (index!56469 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!103660 (_ BitVec 32)) SeekEntryResult!13517)

(assert (=> b!1559268 (= res!1066305 (= (seekEntryOrOpen!0 (select (arr!50026 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) (Found!13517 #b00000000000000000000000000000000)))))

(assert (=> b!1559268 (=> (not res!1066305) (not e!868783))))

(declare-fun b!1559269 () Bool)

(assert (=> b!1559269 (= e!868783 call!71835)))

(declare-fun d!162903 () Bool)

(declare-fun res!1066306 () Bool)

(assert (=> d!162903 (=> res!1066306 e!868782)))

(assert (=> d!162903 (= res!1066306 (bvsge #b00000000000000000000000000000000 (size!50576 _keys!637)))))

(assert (=> d!162903 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947) e!868782)))

(assert (= (and d!162903 (not res!1066306)) b!1559267))

(assert (= (and b!1559267 c!144215) b!1559268))

(assert (= (and b!1559267 (not c!144215)) b!1559266))

(assert (= (and b!1559268 res!1066305) b!1559269))

(assert (= (or b!1559269 b!1559266) bm!71832))

(declare-fun m!1435577 () Bool)

(assert (=> b!1559267 m!1435577))

(assert (=> b!1559267 m!1435577))

(declare-fun m!1435579 () Bool)

(assert (=> b!1559267 m!1435579))

(declare-fun m!1435581 () Bool)

(assert (=> bm!71832 m!1435581))

(assert (=> b!1559268 m!1435577))

(declare-fun m!1435583 () Bool)

(assert (=> b!1559268 m!1435583))

(declare-fun m!1435585 () Bool)

(assert (=> b!1559268 m!1435585))

(assert (=> b!1559268 m!1435577))

(declare-fun m!1435587 () Bool)

(assert (=> b!1559268 m!1435587))

(assert (=> b!1559235 d!162903))

(declare-fun d!162905 () Bool)

(assert (=> d!162905 (= (validMask!0 mask!947) (and (or (= mask!947 #b00000000000000000000000000000111) (= mask!947 #b00000000000000000000000000001111) (= mask!947 #b00000000000000000000000000011111) (= mask!947 #b00000000000000000000000000111111) (= mask!947 #b00000000000000000000000001111111) (= mask!947 #b00000000000000000000000011111111) (= mask!947 #b00000000000000000000000111111111) (= mask!947 #b00000000000000000000001111111111) (= mask!947 #b00000000000000000000011111111111) (= mask!947 #b00000000000000000000111111111111) (= mask!947 #b00000000000000000001111111111111) (= mask!947 #b00000000000000000011111111111111) (= mask!947 #b00000000000000000111111111111111) (= mask!947 #b00000000000000001111111111111111) (= mask!947 #b00000000000000011111111111111111) (= mask!947 #b00000000000000111111111111111111) (= mask!947 #b00000000000001111111111111111111) (= mask!947 #b00000000000011111111111111111111) (= mask!947 #b00000000000111111111111111111111) (= mask!947 #b00000000001111111111111111111111) (= mask!947 #b00000000011111111111111111111111) (= mask!947 #b00000000111111111111111111111111) (= mask!947 #b00000001111111111111111111111111) (= mask!947 #b00000011111111111111111111111111) (= mask!947 #b00000111111111111111111111111111) (= mask!947 #b00001111111111111111111111111111) (= mask!947 #b00011111111111111111111111111111) (= mask!947 #b00111111111111111111111111111111)) (bvsle mask!947 #b00111111111111111111111111111111)))))

(assert (=> start!133348 d!162905))

(declare-fun d!162907 () Bool)

(assert (=> d!162907 (= (array_inv!38887 _values!487) (bvsge (size!50575 _values!487) #b00000000000000000000000000000000))))

(assert (=> start!133348 d!162907))

(declare-fun d!162909 () Bool)

(assert (=> d!162909 (= (array_inv!38888 _keys!637) (bvsge (size!50576 _keys!637) #b00000000000000000000000000000000))))

(assert (=> start!133348 d!162909))

(declare-fun b!1559276 () Bool)

(declare-fun e!868790 () Bool)

(assert (=> b!1559276 (= e!868790 tp_is_empty!38469)))

(declare-fun mapNonEmpty!59073 () Bool)

(declare-fun mapRes!59073 () Bool)

(declare-fun tp!112728 () Bool)

(assert (=> mapNonEmpty!59073 (= mapRes!59073 (and tp!112728 e!868790))))

(declare-fun mapRest!59073 () (Array (_ BitVec 32) ValueCell!18204))

(declare-fun mapKey!59073 () (_ BitVec 32))

(declare-fun mapValue!59073 () ValueCell!18204)

(assert (=> mapNonEmpty!59073 (= mapRest!59067 (store mapRest!59073 mapKey!59073 mapValue!59073))))

(declare-fun mapIsEmpty!59073 () Bool)

(assert (=> mapIsEmpty!59073 mapRes!59073))

(declare-fun condMapEmpty!59073 () Bool)

(declare-fun mapDefault!59073 () ValueCell!18204)

(assert (=> mapNonEmpty!59067 (= condMapEmpty!59073 (= mapRest!59067 ((as const (Array (_ BitVec 32) ValueCell!18204)) mapDefault!59073)))))

(declare-fun e!868789 () Bool)

(assert (=> mapNonEmpty!59067 (= tp!112722 (and e!868789 mapRes!59073))))

(declare-fun b!1559277 () Bool)

(assert (=> b!1559277 (= e!868789 tp_is_empty!38469)))

(assert (= (and mapNonEmpty!59067 condMapEmpty!59073) mapIsEmpty!59073))

(assert (= (and mapNonEmpty!59067 (not condMapEmpty!59073)) mapNonEmpty!59073))

(assert (= (and mapNonEmpty!59073 ((_ is ValueCellFull!18204) mapValue!59073)) b!1559276))

(assert (= (and mapNonEmpty!59067 ((_ is ValueCellFull!18204) mapDefault!59073)) b!1559277))

(declare-fun m!1435589 () Bool)

(assert (=> mapNonEmpty!59073 m!1435589))

(check-sat (not b!1559268) (not bm!71832) (not mapNonEmpty!59073) (not b!1559267) tp_is_empty!38469)
(check-sat)
