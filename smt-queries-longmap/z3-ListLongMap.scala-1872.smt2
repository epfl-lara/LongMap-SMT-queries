; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33652 () Bool)

(assert start!33652)

(declare-fun b_free!6901 () Bool)

(declare-fun b_next!6901 () Bool)

(assert (=> start!33652 (= b_free!6901 (not b_next!6901))))

(declare-fun tp!24207 () Bool)

(declare-fun b_and!14095 () Bool)

(assert (=> start!33652 (= tp!24207 b_and!14095)))

(declare-fun b!334318 () Bool)

(declare-fun res!184321 () Bool)

(declare-fun e!205226 () Bool)

(assert (=> b!334318 (=> (not res!184321) (not e!205226))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!334318 (= res!184321 (validKeyInArray!0 k0!1348))))

(declare-fun b!334319 () Bool)

(declare-fun e!205227 () Bool)

(declare-fun tp_is_empty!6853 () Bool)

(assert (=> b!334319 (= e!205227 tp_is_empty!6853)))

(declare-fun b!334320 () Bool)

(declare-fun res!184325 () Bool)

(assert (=> b!334320 (=> (not res!184325) (not e!205226))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10115 0))(
  ( (V!10116 (val!3471 Int)) )
))
(declare-fun zeroValue!1467 () V!10115)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3083 0))(
  ( (ValueCellFull!3083 (v!5634 V!10115)) (EmptyCell!3083) )
))
(declare-datatypes ((array!17292 0))(
  ( (array!17293 (arr!8176 (Array (_ BitVec 32) ValueCell!3083)) (size!8528 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17292)

(declare-datatypes ((array!17294 0))(
  ( (array!17295 (arr!8177 (Array (_ BitVec 32) (_ BitVec 64))) (size!8529 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17294)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10115)

(declare-datatypes ((tuple2!4962 0))(
  ( (tuple2!4963 (_1!2492 (_ BitVec 64)) (_2!2492 V!10115)) )
))
(declare-datatypes ((List!4578 0))(
  ( (Nil!4575) (Cons!4574 (h!5430 tuple2!4962) (t!9658 List!4578)) )
))
(declare-datatypes ((ListLongMap!3877 0))(
  ( (ListLongMap!3878 (toList!1954 List!4578)) )
))
(declare-fun contains!2017 (ListLongMap!3877 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1486 (array!17294 array!17292 (_ BitVec 32) (_ BitVec 32) V!10115 V!10115 (_ BitVec 32) Int) ListLongMap!3877)

(assert (=> b!334320 (= res!184325 (not (contains!2017 (getCurrentListMap!1486 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!334321 () Bool)

(declare-fun res!184323 () Bool)

(assert (=> b!334321 (=> (not res!184323) (not e!205226))))

(assert (=> b!334321 (= res!184323 (and (= (size!8528 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8529 _keys!1895) (size!8528 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!334322 () Bool)

(declare-fun res!184322 () Bool)

(assert (=> b!334322 (=> (not res!184322) (not e!205226))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17294 (_ BitVec 32)) Bool)

(assert (=> b!334322 (= res!184322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!334323 () Bool)

(declare-fun e!205228 () Bool)

(assert (=> b!334323 (= e!205228 tp_is_empty!6853)))

(declare-fun res!184324 () Bool)

(assert (=> start!33652 (=> (not res!184324) (not e!205226))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33652 (= res!184324 (validMask!0 mask!2385))))

(assert (=> start!33652 e!205226))

(assert (=> start!33652 true))

(assert (=> start!33652 tp_is_empty!6853))

(assert (=> start!33652 tp!24207))

(declare-fun e!205229 () Bool)

(declare-fun array_inv!6082 (array!17292) Bool)

(assert (=> start!33652 (and (array_inv!6082 _values!1525) e!205229)))

(declare-fun array_inv!6083 (array!17294) Bool)

(assert (=> start!33652 (array_inv!6083 _keys!1895)))

(declare-fun mapIsEmpty!11676 () Bool)

(declare-fun mapRes!11676 () Bool)

(assert (=> mapIsEmpty!11676 mapRes!11676))

(declare-fun b!334324 () Bool)

(declare-fun res!184328 () Bool)

(assert (=> b!334324 (=> (not res!184328) (not e!205226))))

(declare-datatypes ((List!4579 0))(
  ( (Nil!4576) (Cons!4575 (h!5431 (_ BitVec 64)) (t!9659 List!4579)) )
))
(declare-fun arrayNoDuplicates!0 (array!17294 (_ BitVec 32) List!4579) Bool)

(assert (=> b!334324 (= res!184328 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4576))))

(declare-fun mapNonEmpty!11676 () Bool)

(declare-fun tp!24206 () Bool)

(assert (=> mapNonEmpty!11676 (= mapRes!11676 (and tp!24206 e!205228))))

(declare-fun mapValue!11676 () ValueCell!3083)

(declare-fun mapKey!11676 () (_ BitVec 32))

(declare-fun mapRest!11676 () (Array (_ BitVec 32) ValueCell!3083))

(assert (=> mapNonEmpty!11676 (= (arr!8176 _values!1525) (store mapRest!11676 mapKey!11676 mapValue!11676))))

(declare-fun b!334325 () Bool)

(declare-fun e!205224 () Bool)

(assert (=> b!334325 (= e!205224 (not true))))

(declare-fun arrayContainsKey!0 (array!17294 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!334325 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((SeekEntryResult!3124 0))(
  ( (MissingZero!3124 (index!14675 (_ BitVec 32))) (Found!3124 (index!14676 (_ BitVec 32))) (Intermediate!3124 (undefined!3936 Bool) (index!14677 (_ BitVec 32)) (x!33279 (_ BitVec 32))) (Undefined!3124) (MissingVacant!3124 (index!14678 (_ BitVec 32))) )
))
(declare-fun lt!159528 () SeekEntryResult!3124)

(declare-datatypes ((Unit!10373 0))(
  ( (Unit!10374) )
))
(declare-fun lt!159529 () Unit!10373)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17294 (_ BitVec 64) (_ BitVec 32)) Unit!10373)

(assert (=> b!334325 (= lt!159529 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14676 lt!159528)))))

(declare-fun b!334326 () Bool)

(declare-fun res!184326 () Bool)

(assert (=> b!334326 (=> (not res!184326) (not e!205224))))

(assert (=> b!334326 (= res!184326 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14676 lt!159528)))))

(declare-fun b!334327 () Bool)

(assert (=> b!334327 (= e!205226 e!205224)))

(declare-fun res!184327 () Bool)

(assert (=> b!334327 (=> (not res!184327) (not e!205224))))

(get-info :version)

(assert (=> b!334327 (= res!184327 (and ((_ is Found!3124) lt!159528) (= (select (arr!8177 _keys!1895) (index!14676 lt!159528)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17294 (_ BitVec 32)) SeekEntryResult!3124)

(assert (=> b!334327 (= lt!159528 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!334328 () Bool)

(assert (=> b!334328 (= e!205229 (and e!205227 mapRes!11676))))

(declare-fun condMapEmpty!11676 () Bool)

(declare-fun mapDefault!11676 () ValueCell!3083)

(assert (=> b!334328 (= condMapEmpty!11676 (= (arr!8176 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3083)) mapDefault!11676)))))

(assert (= (and start!33652 res!184324) b!334321))

(assert (= (and b!334321 res!184323) b!334322))

(assert (= (and b!334322 res!184322) b!334324))

(assert (= (and b!334324 res!184328) b!334318))

(assert (= (and b!334318 res!184321) b!334320))

(assert (= (and b!334320 res!184325) b!334327))

(assert (= (and b!334327 res!184327) b!334326))

(assert (= (and b!334326 res!184326) b!334325))

(assert (= (and b!334328 condMapEmpty!11676) mapIsEmpty!11676))

(assert (= (and b!334328 (not condMapEmpty!11676)) mapNonEmpty!11676))

(assert (= (and mapNonEmpty!11676 ((_ is ValueCellFull!3083) mapValue!11676)) b!334323))

(assert (= (and b!334328 ((_ is ValueCellFull!3083) mapDefault!11676)) b!334319))

(assert (= start!33652 b!334328))

(declare-fun m!338669 () Bool)

(assert (=> b!334318 m!338669))

(declare-fun m!338671 () Bool)

(assert (=> b!334324 m!338671))

(declare-fun m!338673 () Bool)

(assert (=> b!334320 m!338673))

(assert (=> b!334320 m!338673))

(declare-fun m!338675 () Bool)

(assert (=> b!334320 m!338675))

(declare-fun m!338677 () Bool)

(assert (=> mapNonEmpty!11676 m!338677))

(declare-fun m!338679 () Bool)

(assert (=> b!334325 m!338679))

(declare-fun m!338681 () Bool)

(assert (=> b!334325 m!338681))

(declare-fun m!338683 () Bool)

(assert (=> b!334326 m!338683))

(declare-fun m!338685 () Bool)

(assert (=> b!334322 m!338685))

(declare-fun m!338687 () Bool)

(assert (=> b!334327 m!338687))

(declare-fun m!338689 () Bool)

(assert (=> b!334327 m!338689))

(declare-fun m!338691 () Bool)

(assert (=> start!33652 m!338691))

(declare-fun m!338693 () Bool)

(assert (=> start!33652 m!338693))

(declare-fun m!338695 () Bool)

(assert (=> start!33652 m!338695))

(check-sat (not b!334320) (not b!334324) (not b_next!6901) (not mapNonEmpty!11676) (not b!334318) (not start!33652) (not b!334326) (not b!334325) tp_is_empty!6853 (not b!334322) (not b!334327) b_and!14095)
(check-sat b_and!14095 (not b_next!6901))
