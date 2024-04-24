; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33664 () Bool)

(assert start!33664)

(declare-fun b_free!6913 () Bool)

(declare-fun b_next!6913 () Bool)

(assert (=> start!33664 (= b_free!6913 (not b_next!6913))))

(declare-fun tp!24242 () Bool)

(declare-fun b_and!14107 () Bool)

(assert (=> start!33664 (= tp!24242 b_and!14107)))

(declare-fun mapNonEmpty!11694 () Bool)

(declare-fun mapRes!11694 () Bool)

(declare-fun tp!24243 () Bool)

(declare-fun e!205335 () Bool)

(assert (=> mapNonEmpty!11694 (= mapRes!11694 (and tp!24243 e!205335))))

(declare-fun mapKey!11694 () (_ BitVec 32))

(declare-datatypes ((V!10131 0))(
  ( (V!10132 (val!3477 Int)) )
))
(declare-datatypes ((ValueCell!3089 0))(
  ( (ValueCellFull!3089 (v!5640 V!10131)) (EmptyCell!3089) )
))
(declare-fun mapRest!11694 () (Array (_ BitVec 32) ValueCell!3089))

(declare-fun mapValue!11694 () ValueCell!3089)

(declare-datatypes ((array!17316 0))(
  ( (array!17317 (arr!8188 (Array (_ BitVec 32) ValueCell!3089)) (size!8540 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17316)

(assert (=> mapNonEmpty!11694 (= (arr!8188 _values!1525) (store mapRest!11694 mapKey!11694 mapValue!11694))))

(declare-fun b!334516 () Bool)

(declare-fun e!205333 () Bool)

(declare-fun tp_is_empty!6865 () Bool)

(assert (=> b!334516 (= e!205333 tp_is_empty!6865)))

(declare-fun b!334517 () Bool)

(declare-fun res!184465 () Bool)

(declare-fun e!205337 () Bool)

(assert (=> b!334517 (=> (not res!184465) (not e!205337))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!334517 (= res!184465 (validKeyInArray!0 k0!1348))))

(declare-fun mapIsEmpty!11694 () Bool)

(assert (=> mapIsEmpty!11694 mapRes!11694))

(declare-fun b!334518 () Bool)

(declare-fun e!205332 () Bool)

(assert (=> b!334518 (= e!205332 (and e!205333 mapRes!11694))))

(declare-fun condMapEmpty!11694 () Bool)

(declare-fun mapDefault!11694 () ValueCell!3089)

(assert (=> b!334518 (= condMapEmpty!11694 (= (arr!8188 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3089)) mapDefault!11694)))))

(declare-fun b!334519 () Bool)

(declare-fun res!184467 () Bool)

(assert (=> b!334519 (=> (not res!184467) (not e!205337))))

(declare-datatypes ((array!17318 0))(
  ( (array!17319 (arr!8189 (Array (_ BitVec 32) (_ BitVec 64))) (size!8541 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17318)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17318 (_ BitVec 32)) Bool)

(assert (=> b!334519 (= res!184467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun res!184466 () Bool)

(assert (=> start!33664 (=> (not res!184466) (not e!205337))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33664 (= res!184466 (validMask!0 mask!2385))))

(assert (=> start!33664 e!205337))

(assert (=> start!33664 true))

(assert (=> start!33664 tp_is_empty!6865))

(assert (=> start!33664 tp!24242))

(declare-fun array_inv!6090 (array!17316) Bool)

(assert (=> start!33664 (and (array_inv!6090 _values!1525) e!205332)))

(declare-fun array_inv!6091 (array!17318) Bool)

(assert (=> start!33664 (array_inv!6091 _keys!1895)))

(declare-fun b!334520 () Bool)

(declare-fun e!205336 () Bool)

(assert (=> b!334520 (= e!205337 e!205336)))

(declare-fun res!184471 () Bool)

(assert (=> b!334520 (=> (not res!184471) (not e!205336))))

(declare-datatypes ((SeekEntryResult!3130 0))(
  ( (MissingZero!3130 (index!14699 (_ BitVec 32))) (Found!3130 (index!14700 (_ BitVec 32))) (Intermediate!3130 (undefined!3942 Bool) (index!14701 (_ BitVec 32)) (x!33301 (_ BitVec 32))) (Undefined!3130) (MissingVacant!3130 (index!14702 (_ BitVec 32))) )
))
(declare-fun lt!159564 () SeekEntryResult!3130)

(get-info :version)

(assert (=> b!334520 (= res!184471 (and ((_ is Found!3130) lt!159564) (= (select (arr!8189 _keys!1895) (index!14700 lt!159564)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17318 (_ BitVec 32)) SeekEntryResult!3130)

(assert (=> b!334520 (= lt!159564 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!334521 () Bool)

(declare-fun res!184468 () Bool)

(assert (=> b!334521 (=> (not res!184468) (not e!205337))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!334521 (= res!184468 (and (= (size!8540 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8541 _keys!1895) (size!8540 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!334522 () Bool)

(declare-fun res!184469 () Bool)

(assert (=> b!334522 (=> (not res!184469) (not e!205337))))

(declare-datatypes ((List!4586 0))(
  ( (Nil!4583) (Cons!4582 (h!5438 (_ BitVec 64)) (t!9666 List!4586)) )
))
(declare-fun arrayNoDuplicates!0 (array!17318 (_ BitVec 32) List!4586) Bool)

(assert (=> b!334522 (= res!184469 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4583))))

(declare-fun b!334523 () Bool)

(declare-fun res!184470 () Bool)

(assert (=> b!334523 (=> (not res!184470) (not e!205336))))

(declare-fun arrayContainsKey!0 (array!17318 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!334523 (= res!184470 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14700 lt!159564)))))

(declare-fun b!334524 () Bool)

(declare-fun res!184472 () Bool)

(assert (=> b!334524 (=> (not res!184472) (not e!205337))))

(declare-fun zeroValue!1467 () V!10131)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10131)

(declare-datatypes ((tuple2!4970 0))(
  ( (tuple2!4971 (_1!2496 (_ BitVec 64)) (_2!2496 V!10131)) )
))
(declare-datatypes ((List!4587 0))(
  ( (Nil!4584) (Cons!4583 (h!5439 tuple2!4970) (t!9667 List!4587)) )
))
(declare-datatypes ((ListLongMap!3885 0))(
  ( (ListLongMap!3886 (toList!1958 List!4587)) )
))
(declare-fun contains!2021 (ListLongMap!3885 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1490 (array!17318 array!17316 (_ BitVec 32) (_ BitVec 32) V!10131 V!10131 (_ BitVec 32) Int) ListLongMap!3885)

(assert (=> b!334524 (= res!184472 (not (contains!2021 (getCurrentListMap!1490 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!334525 () Bool)

(assert (=> b!334525 (= e!205335 tp_is_empty!6865)))

(declare-fun b!334526 () Bool)

(assert (=> b!334526 (= e!205336 (not true))))

(assert (=> b!334526 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10383 0))(
  ( (Unit!10384) )
))
(declare-fun lt!159565 () Unit!10383)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17318 (_ BitVec 64) (_ BitVec 32)) Unit!10383)

(assert (=> b!334526 (= lt!159565 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14700 lt!159564)))))

(assert (= (and start!33664 res!184466) b!334521))

(assert (= (and b!334521 res!184468) b!334519))

(assert (= (and b!334519 res!184467) b!334522))

(assert (= (and b!334522 res!184469) b!334517))

(assert (= (and b!334517 res!184465) b!334524))

(assert (= (and b!334524 res!184472) b!334520))

(assert (= (and b!334520 res!184471) b!334523))

(assert (= (and b!334523 res!184470) b!334526))

(assert (= (and b!334518 condMapEmpty!11694) mapIsEmpty!11694))

(assert (= (and b!334518 (not condMapEmpty!11694)) mapNonEmpty!11694))

(assert (= (and mapNonEmpty!11694 ((_ is ValueCellFull!3089) mapValue!11694)) b!334525))

(assert (= (and b!334518 ((_ is ValueCellFull!3089) mapDefault!11694)) b!334516))

(assert (= start!33664 b!334518))

(declare-fun m!338837 () Bool)

(assert (=> b!334526 m!338837))

(declare-fun m!338839 () Bool)

(assert (=> b!334526 m!338839))

(declare-fun m!338841 () Bool)

(assert (=> b!334520 m!338841))

(declare-fun m!338843 () Bool)

(assert (=> b!334520 m!338843))

(declare-fun m!338845 () Bool)

(assert (=> b!334523 m!338845))

(declare-fun m!338847 () Bool)

(assert (=> start!33664 m!338847))

(declare-fun m!338849 () Bool)

(assert (=> start!33664 m!338849))

(declare-fun m!338851 () Bool)

(assert (=> start!33664 m!338851))

(declare-fun m!338853 () Bool)

(assert (=> mapNonEmpty!11694 m!338853))

(declare-fun m!338855 () Bool)

(assert (=> b!334524 m!338855))

(assert (=> b!334524 m!338855))

(declare-fun m!338857 () Bool)

(assert (=> b!334524 m!338857))

(declare-fun m!338859 () Bool)

(assert (=> b!334519 m!338859))

(declare-fun m!338861 () Bool)

(assert (=> b!334522 m!338861))

(declare-fun m!338863 () Bool)

(assert (=> b!334517 m!338863))

(check-sat (not start!33664) (not b!334522) (not b!334520) (not b!334523) (not b!334524) (not b!334526) b_and!14107 (not b!334519) (not mapNonEmpty!11694) tp_is_empty!6865 (not b!334517) (not b_next!6913))
(check-sat b_and!14107 (not b_next!6913))
