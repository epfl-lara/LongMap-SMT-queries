; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36976 () Bool)

(assert start!36976)

(declare-fun b_free!8103 () Bool)

(declare-fun b_next!8103 () Bool)

(assert (=> start!36976 (= b_free!8103 (not b_next!8103))))

(declare-fun tp!29024 () Bool)

(declare-fun b_and!15345 () Bool)

(assert (=> start!36976 (= tp!29024 b_and!15345)))

(declare-fun b!371048 () Bool)

(declare-fun res!208496 () Bool)

(declare-fun e!226538 () Bool)

(assert (=> b!371048 (=> (not res!208496) (not e!226538))))

(declare-datatypes ((array!21445 0))(
  ( (array!21446 (arr!10191 (Array (_ BitVec 32) (_ BitVec 64))) (size!10543 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21445)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21445 (_ BitVec 32)) Bool)

(assert (=> b!371048 (= res!208496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!371049 () Bool)

(declare-fun e!226541 () Bool)

(declare-fun e!226540 () Bool)

(declare-fun mapRes!14691 () Bool)

(assert (=> b!371049 (= e!226541 (and e!226540 mapRes!14691))))

(declare-fun condMapEmpty!14691 () Bool)

(declare-datatypes ((V!12773 0))(
  ( (V!12774 (val!4420 Int)) )
))
(declare-datatypes ((ValueCell!4032 0))(
  ( (ValueCellFull!4032 (v!6617 V!12773)) (EmptyCell!4032) )
))
(declare-datatypes ((array!21447 0))(
  ( (array!21448 (arr!10192 (Array (_ BitVec 32) ValueCell!4032)) (size!10544 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21447)

(declare-fun mapDefault!14691 () ValueCell!4032)

(assert (=> b!371049 (= condMapEmpty!14691 (= (arr!10192 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4032)) mapDefault!14691)))))

(declare-fun b!371050 () Bool)

(declare-fun res!208493 () Bool)

(assert (=> b!371050 (=> (not res!208493) (not e!226538))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!371050 (= res!208493 (validKeyInArray!0 k0!778))))

(declare-fun b!371051 () Bool)

(declare-fun tp_is_empty!8751 () Bool)

(assert (=> b!371051 (= e!226540 tp_is_empty!8751)))

(declare-fun b!371052 () Bool)

(declare-fun e!226539 () Bool)

(assert (=> b!371052 (= e!226538 e!226539)))

(declare-fun res!208491 () Bool)

(assert (=> b!371052 (=> (not res!208491) (not e!226539))))

(declare-fun lt!170135 () array!21445)

(assert (=> b!371052 (= res!208491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170135 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!371052 (= lt!170135 (array!21446 (store (arr!10191 _keys!658) i!548 k0!778) (size!10543 _keys!658)))))

(declare-fun b!371053 () Bool)

(declare-fun res!208494 () Bool)

(assert (=> b!371053 (=> (not res!208494) (not e!226538))))

(assert (=> b!371053 (= res!208494 (or (= (select (arr!10191 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10191 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!371054 () Bool)

(assert (=> b!371054 (= e!226539 (not true))))

(declare-datatypes ((tuple2!5862 0))(
  ( (tuple2!5863 (_1!2942 (_ BitVec 64)) (_2!2942 V!12773)) )
))
(declare-datatypes ((List!5701 0))(
  ( (Nil!5698) (Cons!5697 (h!6553 tuple2!5862) (t!10851 List!5701)) )
))
(declare-datatypes ((ListLongMap!4775 0))(
  ( (ListLongMap!4776 (toList!2403 List!5701)) )
))
(declare-fun lt!170138 () ListLongMap!4775)

(declare-fun lt!170137 () ListLongMap!4775)

(assert (=> b!371054 (and (= lt!170138 lt!170137) (= lt!170137 lt!170138))))

(declare-fun lt!170139 () ListLongMap!4775)

(declare-fun v!373 () V!12773)

(declare-fun +!749 (ListLongMap!4775 tuple2!5862) ListLongMap!4775)

(assert (=> b!371054 (= lt!170137 (+!749 lt!170139 (tuple2!5863 k0!778 v!373)))))

(declare-datatypes ((Unit!11404 0))(
  ( (Unit!11405) )
))
(declare-fun lt!170136 () Unit!11404)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12773)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun minValue!472 () V!12773)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!4 (array!21445 array!21447 (_ BitVec 32) (_ BitVec 32) V!12773 V!12773 (_ BitVec 32) (_ BitVec 64) V!12773 (_ BitVec 32) Int) Unit!11404)

(assert (=> b!371054 (= lt!170136 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!4 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!680 (array!21445 array!21447 (_ BitVec 32) (_ BitVec 32) V!12773 V!12773 (_ BitVec 32) Int) ListLongMap!4775)

(assert (=> b!371054 (= lt!170138 (getCurrentListMapNoExtraKeys!680 lt!170135 (array!21448 (store (arr!10192 _values!506) i!548 (ValueCellFull!4032 v!373)) (size!10544 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!371054 (= lt!170139 (getCurrentListMapNoExtraKeys!680 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!371055 () Bool)

(declare-fun res!208492 () Bool)

(assert (=> b!371055 (=> (not res!208492) (not e!226538))))

(assert (=> b!371055 (= res!208492 (and (= (size!10544 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10543 _keys!658) (size!10544 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!208498 () Bool)

(assert (=> start!36976 (=> (not res!208498) (not e!226538))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36976 (= res!208498 (validMask!0 mask!970))))

(assert (=> start!36976 e!226538))

(declare-fun array_inv!7526 (array!21447) Bool)

(assert (=> start!36976 (and (array_inv!7526 _values!506) e!226541)))

(assert (=> start!36976 tp!29024))

(assert (=> start!36976 true))

(assert (=> start!36976 tp_is_empty!8751))

(declare-fun array_inv!7527 (array!21445) Bool)

(assert (=> start!36976 (array_inv!7527 _keys!658)))

(declare-fun mapNonEmpty!14691 () Bool)

(declare-fun tp!29025 () Bool)

(declare-fun e!226537 () Bool)

(assert (=> mapNonEmpty!14691 (= mapRes!14691 (and tp!29025 e!226537))))

(declare-fun mapKey!14691 () (_ BitVec 32))

(declare-fun mapValue!14691 () ValueCell!4032)

(declare-fun mapRest!14691 () (Array (_ BitVec 32) ValueCell!4032))

(assert (=> mapNonEmpty!14691 (= (arr!10192 _values!506) (store mapRest!14691 mapKey!14691 mapValue!14691))))

(declare-fun b!371056 () Bool)

(declare-fun res!208499 () Bool)

(assert (=> b!371056 (=> (not res!208499) (not e!226539))))

(declare-datatypes ((List!5702 0))(
  ( (Nil!5699) (Cons!5698 (h!6554 (_ BitVec 64)) (t!10852 List!5702)) )
))
(declare-fun arrayNoDuplicates!0 (array!21445 (_ BitVec 32) List!5702) Bool)

(assert (=> b!371056 (= res!208499 (arrayNoDuplicates!0 lt!170135 #b00000000000000000000000000000000 Nil!5699))))

(declare-fun b!371057 () Bool)

(declare-fun res!208490 () Bool)

(assert (=> b!371057 (=> (not res!208490) (not e!226538))))

(assert (=> b!371057 (= res!208490 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5699))))

(declare-fun mapIsEmpty!14691 () Bool)

(assert (=> mapIsEmpty!14691 mapRes!14691))

(declare-fun b!371058 () Bool)

(assert (=> b!371058 (= e!226537 tp_is_empty!8751)))

(declare-fun b!371059 () Bool)

(declare-fun res!208495 () Bool)

(assert (=> b!371059 (=> (not res!208495) (not e!226538))))

(declare-fun arrayContainsKey!0 (array!21445 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!371059 (= res!208495 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!371060 () Bool)

(declare-fun res!208497 () Bool)

(assert (=> b!371060 (=> (not res!208497) (not e!226538))))

(assert (=> b!371060 (= res!208497 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10543 _keys!658))))))

(assert (= (and start!36976 res!208498) b!371055))

(assert (= (and b!371055 res!208492) b!371048))

(assert (= (and b!371048 res!208496) b!371057))

(assert (= (and b!371057 res!208490) b!371060))

(assert (= (and b!371060 res!208497) b!371050))

(assert (= (and b!371050 res!208493) b!371053))

(assert (= (and b!371053 res!208494) b!371059))

(assert (= (and b!371059 res!208495) b!371052))

(assert (= (and b!371052 res!208491) b!371056))

(assert (= (and b!371056 res!208499) b!371054))

(assert (= (and b!371049 condMapEmpty!14691) mapIsEmpty!14691))

(assert (= (and b!371049 (not condMapEmpty!14691)) mapNonEmpty!14691))

(get-info :version)

(assert (= (and mapNonEmpty!14691 ((_ is ValueCellFull!4032) mapValue!14691)) b!371058))

(assert (= (and b!371049 ((_ is ValueCellFull!4032) mapDefault!14691)) b!371051))

(assert (= start!36976 b!371049))

(declare-fun m!367069 () Bool)

(assert (=> b!371057 m!367069))

(declare-fun m!367071 () Bool)

(assert (=> b!371048 m!367071))

(declare-fun m!367073 () Bool)

(assert (=> b!371059 m!367073))

(declare-fun m!367075 () Bool)

(assert (=> b!371053 m!367075))

(declare-fun m!367077 () Bool)

(assert (=> b!371050 m!367077))

(declare-fun m!367079 () Bool)

(assert (=> b!371054 m!367079))

(declare-fun m!367081 () Bool)

(assert (=> b!371054 m!367081))

(declare-fun m!367083 () Bool)

(assert (=> b!371054 m!367083))

(declare-fun m!367085 () Bool)

(assert (=> b!371054 m!367085))

(declare-fun m!367087 () Bool)

(assert (=> b!371054 m!367087))

(declare-fun m!367089 () Bool)

(assert (=> start!36976 m!367089))

(declare-fun m!367091 () Bool)

(assert (=> start!36976 m!367091))

(declare-fun m!367093 () Bool)

(assert (=> start!36976 m!367093))

(declare-fun m!367095 () Bool)

(assert (=> b!371052 m!367095))

(declare-fun m!367097 () Bool)

(assert (=> b!371052 m!367097))

(declare-fun m!367099 () Bool)

(assert (=> mapNonEmpty!14691 m!367099))

(declare-fun m!367101 () Bool)

(assert (=> b!371056 m!367101))

(check-sat (not b!371057) (not b!371056) (not b!371059) (not b!371052) b_and!15345 tp_is_empty!8751 (not b!371050) (not b_next!8103) (not start!36976) (not b!371048) (not mapNonEmpty!14691) (not b!371054))
(check-sat b_and!15345 (not b_next!8103))
