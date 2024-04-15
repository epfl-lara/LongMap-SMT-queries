; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33712 () Bool)

(assert start!33712)

(declare-fun b_free!6961 () Bool)

(declare-fun b_next!6961 () Bool)

(assert (=> start!33712 (= b_free!6961 (not b_next!6961))))

(declare-fun tp!24387 () Bool)

(declare-fun b_and!14115 () Bool)

(assert (=> start!33712 (= tp!24387 b_and!14115)))

(declare-fun b!335086 () Bool)

(declare-fun res!184915 () Bool)

(declare-fun e!205682 () Bool)

(assert (=> b!335086 (=> (not res!184915) (not e!205682))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10195 0))(
  ( (V!10196 (val!3501 Int)) )
))
(declare-datatypes ((ValueCell!3113 0))(
  ( (ValueCellFull!3113 (v!5657 V!10195)) (EmptyCell!3113) )
))
(declare-datatypes ((array!17399 0))(
  ( (array!17400 (arr!8230 (Array (_ BitVec 32) ValueCell!3113)) (size!8583 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17399)

(declare-datatypes ((array!17401 0))(
  ( (array!17402 (arr!8231 (Array (_ BitVec 32) (_ BitVec 64))) (size!8584 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17401)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!335086 (= res!184915 (and (= (size!8583 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8584 _keys!1895) (size!8583 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!335087 () Bool)

(declare-fun res!184922 () Bool)

(assert (=> b!335087 (=> (not res!184922) (not e!205682))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17401 (_ BitVec 32)) Bool)

(assert (=> b!335087 (= res!184922 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!335088 () Bool)

(declare-fun res!184920 () Bool)

(assert (=> b!335088 (=> (not res!184920) (not e!205682))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!335088 (= res!184920 (validKeyInArray!0 k0!1348))))

(declare-fun b!335089 () Bool)

(declare-fun e!205684 () Bool)

(declare-fun e!205681 () Bool)

(declare-fun mapRes!11766 () Bool)

(assert (=> b!335089 (= e!205684 (and e!205681 mapRes!11766))))

(declare-fun condMapEmpty!11766 () Bool)

(declare-fun mapDefault!11766 () ValueCell!3113)

(assert (=> b!335089 (= condMapEmpty!11766 (= (arr!8230 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3113)) mapDefault!11766)))))

(declare-fun mapNonEmpty!11766 () Bool)

(declare-fun tp!24386 () Bool)

(declare-fun e!205679 () Bool)

(assert (=> mapNonEmpty!11766 (= mapRes!11766 (and tp!24386 e!205679))))

(declare-fun mapValue!11766 () ValueCell!3113)

(declare-fun mapKey!11766 () (_ BitVec 32))

(declare-fun mapRest!11766 () (Array (_ BitVec 32) ValueCell!3113))

(assert (=> mapNonEmpty!11766 (= (arr!8230 _values!1525) (store mapRest!11766 mapKey!11766 mapValue!11766))))

(declare-fun res!184918 () Bool)

(assert (=> start!33712 (=> (not res!184918) (not e!205682))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33712 (= res!184918 (validMask!0 mask!2385))))

(assert (=> start!33712 e!205682))

(assert (=> start!33712 true))

(declare-fun tp_is_empty!6913 () Bool)

(assert (=> start!33712 tp_is_empty!6913))

(assert (=> start!33712 tp!24387))

(declare-fun array_inv!6140 (array!17399) Bool)

(assert (=> start!33712 (and (array_inv!6140 _values!1525) e!205684)))

(declare-fun array_inv!6141 (array!17401) Bool)

(assert (=> start!33712 (array_inv!6141 _keys!1895)))

(declare-fun b!335090 () Bool)

(declare-fun e!205683 () Bool)

(assert (=> b!335090 (= e!205682 e!205683)))

(declare-fun res!184917 () Bool)

(assert (=> b!335090 (=> (not res!184917) (not e!205683))))

(declare-datatypes ((tuple2!5032 0))(
  ( (tuple2!5033 (_1!2527 (_ BitVec 64)) (_2!2527 V!10195)) )
))
(declare-datatypes ((List!4671 0))(
  ( (Nil!4668) (Cons!4667 (h!5523 tuple2!5032) (t!9750 List!4671)) )
))
(declare-datatypes ((ListLongMap!3935 0))(
  ( (ListLongMap!3936 (toList!1983 List!4671)) )
))
(declare-fun lt!159569 () ListLongMap!3935)

(declare-fun contains!2038 (ListLongMap!3935 (_ BitVec 64)) Bool)

(assert (=> b!335090 (= res!184917 (not (contains!2038 lt!159569 k0!1348)))))

(declare-fun zeroValue!1467 () V!10195)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10195)

(declare-fun getCurrentListMap!1491 (array!17401 array!17399 (_ BitVec 32) (_ BitVec 32) V!10195 V!10195 (_ BitVec 32) Int) ListLongMap!3935)

(assert (=> b!335090 (= lt!159569 (getCurrentListMap!1491 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!335091 () Bool)

(declare-fun res!184919 () Bool)

(assert (=> b!335091 (=> (not res!184919) (not e!205682))))

(declare-datatypes ((List!4672 0))(
  ( (Nil!4669) (Cons!4668 (h!5524 (_ BitVec 64)) (t!9751 List!4672)) )
))
(declare-fun arrayNoDuplicates!0 (array!17401 (_ BitVec 32) List!4672) Bool)

(assert (=> b!335091 (= res!184919 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4669))))

(declare-fun b!335092 () Bool)

(assert (=> b!335092 (= e!205679 tp_is_empty!6913)))

(declare-fun b!335093 () Bool)

(declare-fun res!184916 () Bool)

(declare-fun e!205680 () Bool)

(assert (=> b!335093 (=> (not res!184916) (not e!205680))))

(declare-datatypes ((SeekEntryResult!3185 0))(
  ( (MissingZero!3185 (index!14919 (_ BitVec 32))) (Found!3185 (index!14920 (_ BitVec 32))) (Intermediate!3185 (undefined!3997 Bool) (index!14921 (_ BitVec 32)) (x!33418 (_ BitVec 32))) (Undefined!3185) (MissingVacant!3185 (index!14922 (_ BitVec 32))) )
))
(declare-fun lt!159567 () SeekEntryResult!3185)

(declare-fun arrayContainsKey!0 (array!17401 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!335093 (= res!184916 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14920 lt!159567)))))

(declare-fun b!335094 () Bool)

(assert (=> b!335094 (= e!205683 e!205680)))

(declare-fun res!184921 () Bool)

(assert (=> b!335094 (=> (not res!184921) (not e!205680))))

(get-info :version)

(assert (=> b!335094 (= res!184921 (and ((_ is Found!3185) lt!159567) (= (select (arr!8231 _keys!1895) (index!14920 lt!159567)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17401 (_ BitVec 32)) SeekEntryResult!3185)

(assert (=> b!335094 (= lt!159567 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!335095 () Bool)

(assert (=> b!335095 (= e!205681 tp_is_empty!6913)))

(declare-fun b!335096 () Bool)

(assert (=> b!335096 (= e!205680 (not true))))

(assert (=> b!335096 (contains!2038 lt!159569 (select (arr!8231 _keys!1895) (index!14920 lt!159567)))))

(declare-datatypes ((Unit!10416 0))(
  ( (Unit!10417) )
))
(declare-fun lt!159570 () Unit!10416)

(declare-fun lemmaValidKeyInArrayIsInListMap!165 (array!17401 array!17399 (_ BitVec 32) (_ BitVec 32) V!10195 V!10195 (_ BitVec 32) Int) Unit!10416)

(assert (=> b!335096 (= lt!159570 (lemmaValidKeyInArrayIsInListMap!165 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!14920 lt!159567) defaultEntry!1528))))

(assert (=> b!335096 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-fun lt!159568 () Unit!10416)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17401 (_ BitVec 64) (_ BitVec 32)) Unit!10416)

(assert (=> b!335096 (= lt!159568 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14920 lt!159567)))))

(declare-fun mapIsEmpty!11766 () Bool)

(assert (=> mapIsEmpty!11766 mapRes!11766))

(assert (= (and start!33712 res!184918) b!335086))

(assert (= (and b!335086 res!184915) b!335087))

(assert (= (and b!335087 res!184922) b!335091))

(assert (= (and b!335091 res!184919) b!335088))

(assert (= (and b!335088 res!184920) b!335090))

(assert (= (and b!335090 res!184917) b!335094))

(assert (= (and b!335094 res!184921) b!335093))

(assert (= (and b!335093 res!184916) b!335096))

(assert (= (and b!335089 condMapEmpty!11766) mapIsEmpty!11766))

(assert (= (and b!335089 (not condMapEmpty!11766)) mapNonEmpty!11766))

(assert (= (and mapNonEmpty!11766 ((_ is ValueCellFull!3113) mapValue!11766)) b!335092))

(assert (= (and b!335089 ((_ is ValueCellFull!3113) mapDefault!11766)) b!335095))

(assert (= start!33712 b!335089))

(declare-fun m!338627 () Bool)

(assert (=> b!335091 m!338627))

(declare-fun m!338629 () Bool)

(assert (=> start!33712 m!338629))

(declare-fun m!338631 () Bool)

(assert (=> start!33712 m!338631))

(declare-fun m!338633 () Bool)

(assert (=> start!33712 m!338633))

(declare-fun m!338635 () Bool)

(assert (=> b!335094 m!338635))

(declare-fun m!338637 () Bool)

(assert (=> b!335094 m!338637))

(declare-fun m!338639 () Bool)

(assert (=> b!335093 m!338639))

(declare-fun m!338641 () Bool)

(assert (=> b!335088 m!338641))

(declare-fun m!338643 () Bool)

(assert (=> b!335090 m!338643))

(declare-fun m!338645 () Bool)

(assert (=> b!335090 m!338645))

(declare-fun m!338647 () Bool)

(assert (=> b!335096 m!338647))

(declare-fun m!338649 () Bool)

(assert (=> b!335096 m!338649))

(assert (=> b!335096 m!338635))

(assert (=> b!335096 m!338635))

(declare-fun m!338651 () Bool)

(assert (=> b!335096 m!338651))

(declare-fun m!338653 () Bool)

(assert (=> b!335096 m!338653))

(declare-fun m!338655 () Bool)

(assert (=> b!335087 m!338655))

(declare-fun m!338657 () Bool)

(assert (=> mapNonEmpty!11766 m!338657))

(check-sat (not b!335088) (not b!335087) tp_is_empty!6913 (not mapNonEmpty!11766) (not b!335093) (not b!335091) (not b!335096) (not start!33712) (not b!335090) (not b_next!6961) b_and!14115 (not b!335094))
(check-sat b_and!14115 (not b_next!6961))
