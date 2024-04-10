; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33662 () Bool)

(assert start!33662)

(declare-fun b_free!6897 () Bool)

(declare-fun b_next!6897 () Bool)

(assert (=> start!33662 (= b_free!6897 (not b_next!6897))))

(declare-fun tp!24195 () Bool)

(declare-fun b_and!14077 () Bool)

(assert (=> start!33662 (= tp!24195 b_and!14077)))

(declare-fun b!334305 () Bool)

(declare-fun res!184277 () Bool)

(declare-fun e!205224 () Bool)

(assert (=> b!334305 (=> (not res!184277) (not e!205224))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!334305 (= res!184277 (validKeyInArray!0 k0!1348))))

(declare-fun b!334306 () Bool)

(declare-fun res!184281 () Bool)

(assert (=> b!334306 (=> (not res!184281) (not e!205224))))

(declare-datatypes ((array!17291 0))(
  ( (array!17292 (arr!8176 (Array (_ BitVec 32) (_ BitVec 64))) (size!8528 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17291)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17291 (_ BitVec 32)) Bool)

(assert (=> b!334306 (= res!184281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!334307 () Bool)

(declare-fun e!205222 () Bool)

(declare-fun tp_is_empty!6849 () Bool)

(assert (=> b!334307 (= e!205222 tp_is_empty!6849)))

(declare-fun b!334308 () Bool)

(declare-fun res!184280 () Bool)

(assert (=> b!334308 (=> (not res!184280) (not e!205224))))

(declare-datatypes ((List!4660 0))(
  ( (Nil!4657) (Cons!4656 (h!5512 (_ BitVec 64)) (t!9748 List!4660)) )
))
(declare-fun arrayNoDuplicates!0 (array!17291 (_ BitVec 32) List!4660) Bool)

(assert (=> b!334308 (= res!184280 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4657))))

(declare-fun b!334309 () Bool)

(declare-fun e!205225 () Bool)

(declare-fun e!205227 () Bool)

(declare-fun mapRes!11670 () Bool)

(assert (=> b!334309 (= e!205225 (and e!205227 mapRes!11670))))

(declare-fun condMapEmpty!11670 () Bool)

(declare-datatypes ((V!10109 0))(
  ( (V!10110 (val!3469 Int)) )
))
(declare-datatypes ((ValueCell!3081 0))(
  ( (ValueCellFull!3081 (v!5631 V!10109)) (EmptyCell!3081) )
))
(declare-datatypes ((array!17293 0))(
  ( (array!17294 (arr!8177 (Array (_ BitVec 32) ValueCell!3081)) (size!8529 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17293)

(declare-fun mapDefault!11670 () ValueCell!3081)

(assert (=> b!334309 (= condMapEmpty!11670 (= (arr!8177 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3081)) mapDefault!11670)))))

(declare-fun res!184276 () Bool)

(assert (=> start!33662 (=> (not res!184276) (not e!205224))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33662 (= res!184276 (validMask!0 mask!2385))))

(assert (=> start!33662 e!205224))

(assert (=> start!33662 true))

(assert (=> start!33662 tp_is_empty!6849))

(assert (=> start!33662 tp!24195))

(declare-fun array_inv!6080 (array!17293) Bool)

(assert (=> start!33662 (and (array_inv!6080 _values!1525) e!205225)))

(declare-fun array_inv!6081 (array!17291) Bool)

(assert (=> start!33662 (array_inv!6081 _keys!1895)))

(declare-fun b!334310 () Bool)

(declare-fun e!205226 () Bool)

(assert (=> b!334310 (= e!205224 e!205226)))

(declare-fun res!184282 () Bool)

(assert (=> b!334310 (=> (not res!184282) (not e!205226))))

(declare-datatypes ((SeekEntryResult!3160 0))(
  ( (MissingZero!3160 (index!14819 (_ BitVec 32))) (Found!3160 (index!14820 (_ BitVec 32))) (Intermediate!3160 (undefined!3972 Bool) (index!14821 (_ BitVec 32)) (x!33310 (_ BitVec 32))) (Undefined!3160) (MissingVacant!3160 (index!14822 (_ BitVec 32))) )
))
(declare-fun lt!159499 () SeekEntryResult!3160)

(get-info :version)

(assert (=> b!334310 (= res!184282 (and ((_ is Found!3160) lt!159499) (= (select (arr!8176 _keys!1895) (index!14820 lt!159499)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17291 (_ BitVec 32)) SeekEntryResult!3160)

(assert (=> b!334310 (= lt!159499 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!334311 () Bool)

(declare-fun res!184279 () Bool)

(assert (=> b!334311 (=> (not res!184279) (not e!205226))))

(declare-fun arrayContainsKey!0 (array!17291 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!334311 (= res!184279 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14820 lt!159499)))))

(declare-fun mapIsEmpty!11670 () Bool)

(assert (=> mapIsEmpty!11670 mapRes!11670))

(declare-fun b!334312 () Bool)

(assert (=> b!334312 (= e!205227 tp_is_empty!6849)))

(declare-fun b!334313 () Bool)

(declare-fun res!184283 () Bool)

(assert (=> b!334313 (=> (not res!184283) (not e!205224))))

(declare-fun zeroValue!1467 () V!10109)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10109)

(declare-datatypes ((tuple2!5038 0))(
  ( (tuple2!5039 (_1!2530 (_ BitVec 64)) (_2!2530 V!10109)) )
))
(declare-datatypes ((List!4661 0))(
  ( (Nil!4658) (Cons!4657 (h!5513 tuple2!5038) (t!9749 List!4661)) )
))
(declare-datatypes ((ListLongMap!3951 0))(
  ( (ListLongMap!3952 (toList!1991 List!4661)) )
))
(declare-fun contains!2035 (ListLongMap!3951 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1519 (array!17291 array!17293 (_ BitVec 32) (_ BitVec 32) V!10109 V!10109 (_ BitVec 32) Int) ListLongMap!3951)

(assert (=> b!334313 (= res!184283 (not (contains!2035 (getCurrentListMap!1519 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapNonEmpty!11670 () Bool)

(declare-fun tp!24194 () Bool)

(assert (=> mapNonEmpty!11670 (= mapRes!11670 (and tp!24194 e!205222))))

(declare-fun mapValue!11670 () ValueCell!3081)

(declare-fun mapKey!11670 () (_ BitVec 32))

(declare-fun mapRest!11670 () (Array (_ BitVec 32) ValueCell!3081))

(assert (=> mapNonEmpty!11670 (= (arr!8177 _values!1525) (store mapRest!11670 mapKey!11670 mapValue!11670))))

(declare-fun b!334314 () Bool)

(assert (=> b!334314 (= e!205226 (not true))))

(assert (=> b!334314 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10397 0))(
  ( (Unit!10398) )
))
(declare-fun lt!159498 () Unit!10397)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17291 (_ BitVec 64) (_ BitVec 32)) Unit!10397)

(assert (=> b!334314 (= lt!159498 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14820 lt!159499)))))

(declare-fun b!334315 () Bool)

(declare-fun res!184278 () Bool)

(assert (=> b!334315 (=> (not res!184278) (not e!205224))))

(assert (=> b!334315 (= res!184278 (and (= (size!8529 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8528 _keys!1895) (size!8529 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(assert (= (and start!33662 res!184276) b!334315))

(assert (= (and b!334315 res!184278) b!334306))

(assert (= (and b!334306 res!184281) b!334308))

(assert (= (and b!334308 res!184280) b!334305))

(assert (= (and b!334305 res!184277) b!334313))

(assert (= (and b!334313 res!184283) b!334310))

(assert (= (and b!334310 res!184282) b!334311))

(assert (= (and b!334311 res!184279) b!334314))

(assert (= (and b!334309 condMapEmpty!11670) mapIsEmpty!11670))

(assert (= (and b!334309 (not condMapEmpty!11670)) mapNonEmpty!11670))

(assert (= (and mapNonEmpty!11670 ((_ is ValueCellFull!3081) mapValue!11670)) b!334307))

(assert (= (and b!334309 ((_ is ValueCellFull!3081) mapDefault!11670)) b!334312))

(assert (= start!33662 b!334309))

(declare-fun m!338389 () Bool)

(assert (=> start!33662 m!338389))

(declare-fun m!338391 () Bool)

(assert (=> start!33662 m!338391))

(declare-fun m!338393 () Bool)

(assert (=> start!33662 m!338393))

(declare-fun m!338395 () Bool)

(assert (=> b!334311 m!338395))

(declare-fun m!338397 () Bool)

(assert (=> b!334308 m!338397))

(declare-fun m!338399 () Bool)

(assert (=> b!334306 m!338399))

(declare-fun m!338401 () Bool)

(assert (=> b!334305 m!338401))

(declare-fun m!338403 () Bool)

(assert (=> mapNonEmpty!11670 m!338403))

(declare-fun m!338405 () Bool)

(assert (=> b!334310 m!338405))

(declare-fun m!338407 () Bool)

(assert (=> b!334310 m!338407))

(declare-fun m!338409 () Bool)

(assert (=> b!334313 m!338409))

(assert (=> b!334313 m!338409))

(declare-fun m!338411 () Bool)

(assert (=> b!334313 m!338411))

(declare-fun m!338413 () Bool)

(assert (=> b!334314 m!338413))

(declare-fun m!338415 () Bool)

(assert (=> b!334314 m!338415))

(check-sat (not b!334310) (not start!33662) b_and!14077 (not b!334311) (not mapNonEmpty!11670) (not b_next!6897) (not b!334314) (not b!334305) (not b!334313) tp_is_empty!6849 (not b!334306) (not b!334308))
(check-sat b_and!14077 (not b_next!6897))
