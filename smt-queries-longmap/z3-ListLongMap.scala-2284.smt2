; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37168 () Bool)

(assert start!37168)

(declare-fun b_free!8295 () Bool)

(declare-fun b_next!8295 () Bool)

(assert (=> start!37168 (= b_free!8295 (not b_next!8295))))

(declare-fun tp!29601 () Bool)

(declare-fun b_and!15537 () Bool)

(assert (=> start!37168 (= tp!29601 b_and!15537)))

(declare-fun b!375072 () Bool)

(declare-fun e!228535 () Bool)

(declare-fun tp_is_empty!8943 () Bool)

(assert (=> b!375072 (= e!228535 tp_is_empty!8943)))

(declare-fun b!375073 () Bool)

(declare-fun res!211658 () Bool)

(declare-fun e!228538 () Bool)

(assert (=> b!375073 (=> (not res!211658) (not e!228538))))

(declare-datatypes ((array!21823 0))(
  ( (array!21824 (arr!10380 (Array (_ BitVec 32) (_ BitVec 64))) (size!10732 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21823)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21823 (_ BitVec 32)) Bool)

(assert (=> b!375073 (= res!211658 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!375074 () Bool)

(declare-fun e!228541 () Bool)

(declare-fun e!228542 () Bool)

(assert (=> b!375074 (= e!228541 e!228542)))

(declare-fun res!211653 () Bool)

(assert (=> b!375074 (=> res!211653 e!228542)))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!375074 (= res!211653 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!13029 0))(
  ( (V!13030 (val!4516 Int)) )
))
(declare-datatypes ((tuple2!6008 0))(
  ( (tuple2!6009 (_1!3015 (_ BitVec 64)) (_2!3015 V!13029)) )
))
(declare-datatypes ((List!5851 0))(
  ( (Nil!5848) (Cons!5847 (h!6703 tuple2!6008) (t!11001 List!5851)) )
))
(declare-datatypes ((ListLongMap!4921 0))(
  ( (ListLongMap!4922 (toList!2476 List!5851)) )
))
(declare-fun lt!173333 () ListLongMap!4921)

(declare-fun lt!173341 () ListLongMap!4921)

(assert (=> b!375074 (= lt!173333 lt!173341)))

(declare-fun lt!173336 () ListLongMap!4921)

(declare-fun lt!173334 () tuple2!6008)

(declare-fun +!822 (ListLongMap!4921 tuple2!6008) ListLongMap!4921)

(assert (=> b!375074 (= lt!173341 (+!822 lt!173336 lt!173334))))

(declare-fun v!373 () V!13029)

(declare-datatypes ((Unit!11550 0))(
  ( (Unit!11551) )
))
(declare-fun lt!173332 () Unit!11550)

(declare-fun lt!173343 () ListLongMap!4921)

(declare-fun zeroValue!472 () V!13029)

(declare-fun addCommutativeForDiffKeys!243 (ListLongMap!4921 (_ BitVec 64) V!13029 (_ BitVec 64) V!13029) Unit!11550)

(assert (=> b!375074 (= lt!173332 (addCommutativeForDiffKeys!243 lt!173343 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!173331 () ListLongMap!4921)

(declare-fun lt!173328 () tuple2!6008)

(assert (=> b!375074 (= lt!173331 (+!822 lt!173333 lt!173328))))

(declare-fun lt!173335 () ListLongMap!4921)

(declare-fun lt!173330 () tuple2!6008)

(assert (=> b!375074 (= lt!173333 (+!822 lt!173335 lt!173330))))

(declare-fun lt!173329 () ListLongMap!4921)

(declare-fun lt!173338 () ListLongMap!4921)

(assert (=> b!375074 (= lt!173329 lt!173338)))

(assert (=> b!375074 (= lt!173338 (+!822 lt!173336 lt!173328))))

(assert (=> b!375074 (= lt!173336 (+!822 lt!173343 lt!173330))))

(declare-fun lt!173337 () ListLongMap!4921)

(assert (=> b!375074 (= lt!173331 (+!822 (+!822 lt!173337 lt!173330) lt!173328))))

(declare-fun minValue!472 () V!13029)

(assert (=> b!375074 (= lt!173328 (tuple2!6009 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!375074 (= lt!173330 (tuple2!6009 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun res!211654 () Bool)

(assert (=> start!37168 (=> (not res!211654) (not e!228538))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37168 (= res!211654 (validMask!0 mask!970))))

(assert (=> start!37168 e!228538))

(declare-datatypes ((ValueCell!4128 0))(
  ( (ValueCellFull!4128 (v!6713 V!13029)) (EmptyCell!4128) )
))
(declare-datatypes ((array!21825 0))(
  ( (array!21826 (arr!10381 (Array (_ BitVec 32) ValueCell!4128)) (size!10733 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21825)

(declare-fun e!228540 () Bool)

(declare-fun array_inv!7654 (array!21825) Bool)

(assert (=> start!37168 (and (array_inv!7654 _values!506) e!228540)))

(assert (=> start!37168 tp!29601))

(assert (=> start!37168 true))

(assert (=> start!37168 tp_is_empty!8943))

(declare-fun array_inv!7655 (array!21823) Bool)

(assert (=> start!37168 (array_inv!7655 _keys!658)))

(declare-fun b!375075 () Bool)

(declare-fun e!228539 () Bool)

(assert (=> b!375075 (= e!228539 (not e!228541))))

(declare-fun res!211656 () Bool)

(assert (=> b!375075 (=> res!211656 e!228541)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!375075 (= res!211656 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun getCurrentListMap!1912 (array!21823 array!21825 (_ BitVec 32) (_ BitVec 32) V!13029 V!13029 (_ BitVec 32) Int) ListLongMap!4921)

(assert (=> b!375075 (= lt!173329 (getCurrentListMap!1912 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!173339 () array!21823)

(declare-fun lt!173342 () array!21825)

(assert (=> b!375075 (= lt!173331 (getCurrentListMap!1912 lt!173339 lt!173342 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!375075 (and (= lt!173337 lt!173335) (= lt!173335 lt!173337))))

(assert (=> b!375075 (= lt!173335 (+!822 lt!173343 lt!173334))))

(assert (=> b!375075 (= lt!173334 (tuple2!6009 k0!778 v!373))))

(declare-fun lt!173340 () Unit!11550)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!70 (array!21823 array!21825 (_ BitVec 32) (_ BitVec 32) V!13029 V!13029 (_ BitVec 32) (_ BitVec 64) V!13029 (_ BitVec 32) Int) Unit!11550)

(assert (=> b!375075 (= lt!173340 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!70 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!746 (array!21823 array!21825 (_ BitVec 32) (_ BitVec 32) V!13029 V!13029 (_ BitVec 32) Int) ListLongMap!4921)

(assert (=> b!375075 (= lt!173337 (getCurrentListMapNoExtraKeys!746 lt!173339 lt!173342 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!375075 (= lt!173342 (array!21826 (store (arr!10381 _values!506) i!548 (ValueCellFull!4128 v!373)) (size!10733 _values!506)))))

(assert (=> b!375075 (= lt!173343 (getCurrentListMapNoExtraKeys!746 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!375076 () Bool)

(declare-fun e!228537 () Bool)

(declare-fun mapRes!14979 () Bool)

(assert (=> b!375076 (= e!228540 (and e!228537 mapRes!14979))))

(declare-fun condMapEmpty!14979 () Bool)

(declare-fun mapDefault!14979 () ValueCell!4128)

(assert (=> b!375076 (= condMapEmpty!14979 (= (arr!10381 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4128)) mapDefault!14979)))))

(declare-fun b!375077 () Bool)

(declare-fun res!211659 () Bool)

(assert (=> b!375077 (=> (not res!211659) (not e!228538))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!375077 (= res!211659 (validKeyInArray!0 k0!778))))

(declare-fun b!375078 () Bool)

(declare-fun res!211660 () Bool)

(assert (=> b!375078 (=> (not res!211660) (not e!228538))))

(declare-fun arrayContainsKey!0 (array!21823 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!375078 (= res!211660 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!375079 () Bool)

(declare-fun res!211657 () Bool)

(assert (=> b!375079 (=> (not res!211657) (not e!228539))))

(declare-datatypes ((List!5852 0))(
  ( (Nil!5849) (Cons!5848 (h!6704 (_ BitVec 64)) (t!11002 List!5852)) )
))
(declare-fun arrayNoDuplicates!0 (array!21823 (_ BitVec 32) List!5852) Bool)

(assert (=> b!375079 (= res!211657 (arrayNoDuplicates!0 lt!173339 #b00000000000000000000000000000000 Nil!5849))))

(declare-fun b!375080 () Bool)

(declare-fun res!211652 () Bool)

(assert (=> b!375080 (=> (not res!211652) (not e!228538))))

(assert (=> b!375080 (= res!211652 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10732 _keys!658))))))

(declare-fun b!375081 () Bool)

(declare-fun res!211650 () Bool)

(assert (=> b!375081 (=> (not res!211650) (not e!228538))))

(assert (=> b!375081 (= res!211650 (and (= (size!10733 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10732 _keys!658) (size!10733 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!14979 () Bool)

(declare-fun tp!29600 () Bool)

(assert (=> mapNonEmpty!14979 (= mapRes!14979 (and tp!29600 e!228535))))

(declare-fun mapKey!14979 () (_ BitVec 32))

(declare-fun mapValue!14979 () ValueCell!4128)

(declare-fun mapRest!14979 () (Array (_ BitVec 32) ValueCell!4128))

(assert (=> mapNonEmpty!14979 (= (arr!10381 _values!506) (store mapRest!14979 mapKey!14979 mapValue!14979))))

(declare-fun b!375082 () Bool)

(declare-fun res!211651 () Bool)

(assert (=> b!375082 (=> (not res!211651) (not e!228538))))

(assert (=> b!375082 (= res!211651 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5849))))

(declare-fun b!375083 () Bool)

(assert (=> b!375083 (= e!228542 true)))

(assert (=> b!375083 (= (+!822 lt!173341 lt!173328) (+!822 lt!173338 lt!173334))))

(declare-fun lt!173327 () Unit!11550)

(assert (=> b!375083 (= lt!173327 (addCommutativeForDiffKeys!243 lt!173336 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!375084 () Bool)

(assert (=> b!375084 (= e!228538 e!228539)))

(declare-fun res!211655 () Bool)

(assert (=> b!375084 (=> (not res!211655) (not e!228539))))

(assert (=> b!375084 (= res!211655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!173339 mask!970))))

(assert (=> b!375084 (= lt!173339 (array!21824 (store (arr!10380 _keys!658) i!548 k0!778) (size!10732 _keys!658)))))

(declare-fun b!375085 () Bool)

(declare-fun res!211661 () Bool)

(assert (=> b!375085 (=> (not res!211661) (not e!228538))))

(assert (=> b!375085 (= res!211661 (or (= (select (arr!10380 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10380 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14979 () Bool)

(assert (=> mapIsEmpty!14979 mapRes!14979))

(declare-fun b!375086 () Bool)

(assert (=> b!375086 (= e!228537 tp_is_empty!8943)))

(assert (= (and start!37168 res!211654) b!375081))

(assert (= (and b!375081 res!211650) b!375073))

(assert (= (and b!375073 res!211658) b!375082))

(assert (= (and b!375082 res!211651) b!375080))

(assert (= (and b!375080 res!211652) b!375077))

(assert (= (and b!375077 res!211659) b!375085))

(assert (= (and b!375085 res!211661) b!375078))

(assert (= (and b!375078 res!211660) b!375084))

(assert (= (and b!375084 res!211655) b!375079))

(assert (= (and b!375079 res!211657) b!375075))

(assert (= (and b!375075 (not res!211656)) b!375074))

(assert (= (and b!375074 (not res!211653)) b!375083))

(assert (= (and b!375076 condMapEmpty!14979) mapIsEmpty!14979))

(assert (= (and b!375076 (not condMapEmpty!14979)) mapNonEmpty!14979))

(get-info :version)

(assert (= (and mapNonEmpty!14979 ((_ is ValueCellFull!4128) mapValue!14979)) b!375072))

(assert (= (and b!375076 ((_ is ValueCellFull!4128) mapDefault!14979)) b!375086))

(assert (= start!37168 b!375076))

(declare-fun m!371535 () Bool)

(assert (=> b!375079 m!371535))

(declare-fun m!371537 () Bool)

(assert (=> b!375073 m!371537))

(declare-fun m!371539 () Bool)

(assert (=> b!375083 m!371539))

(declare-fun m!371541 () Bool)

(assert (=> b!375083 m!371541))

(declare-fun m!371543 () Bool)

(assert (=> b!375083 m!371543))

(declare-fun m!371545 () Bool)

(assert (=> b!375074 m!371545))

(declare-fun m!371547 () Bool)

(assert (=> b!375074 m!371547))

(declare-fun m!371549 () Bool)

(assert (=> b!375074 m!371549))

(declare-fun m!371551 () Bool)

(assert (=> b!375074 m!371551))

(declare-fun m!371553 () Bool)

(assert (=> b!375074 m!371553))

(assert (=> b!375074 m!371551))

(declare-fun m!371555 () Bool)

(assert (=> b!375074 m!371555))

(declare-fun m!371557 () Bool)

(assert (=> b!375074 m!371557))

(declare-fun m!371559 () Bool)

(assert (=> b!375074 m!371559))

(declare-fun m!371561 () Bool)

(assert (=> b!375084 m!371561))

(declare-fun m!371563 () Bool)

(assert (=> b!375084 m!371563))

(declare-fun m!371565 () Bool)

(assert (=> b!375075 m!371565))

(declare-fun m!371567 () Bool)

(assert (=> b!375075 m!371567))

(declare-fun m!371569 () Bool)

(assert (=> b!375075 m!371569))

(declare-fun m!371571 () Bool)

(assert (=> b!375075 m!371571))

(declare-fun m!371573 () Bool)

(assert (=> b!375075 m!371573))

(declare-fun m!371575 () Bool)

(assert (=> b!375075 m!371575))

(declare-fun m!371577 () Bool)

(assert (=> b!375075 m!371577))

(declare-fun m!371579 () Bool)

(assert (=> start!37168 m!371579))

(declare-fun m!371581 () Bool)

(assert (=> start!37168 m!371581))

(declare-fun m!371583 () Bool)

(assert (=> start!37168 m!371583))

(declare-fun m!371585 () Bool)

(assert (=> b!375085 m!371585))

(declare-fun m!371587 () Bool)

(assert (=> b!375078 m!371587))

(declare-fun m!371589 () Bool)

(assert (=> mapNonEmpty!14979 m!371589))

(declare-fun m!371591 () Bool)

(assert (=> b!375077 m!371591))

(declare-fun m!371593 () Bool)

(assert (=> b!375082 m!371593))

(check-sat (not b!375079) (not b!375082) (not b!375077) tp_is_empty!8943 (not start!37168) (not b!375083) (not mapNonEmpty!14979) (not b!375078) b_and!15537 (not b!375074) (not b!375084) (not b_next!8295) (not b!375075) (not b!375073))
(check-sat b_and!15537 (not b_next!8295))
