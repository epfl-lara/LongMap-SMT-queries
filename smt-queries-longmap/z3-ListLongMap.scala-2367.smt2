; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37650 () Bool)

(assert start!37650)

(declare-fun b_free!8767 () Bool)

(declare-fun b_next!8767 () Bool)

(assert (=> start!37650 (= b_free!8767 (not b_next!8767))))

(declare-fun tp!31053 () Bool)

(declare-fun b_and!16023 () Bool)

(assert (=> start!37650 (= tp!31053 b_and!16023)))

(declare-fun b!385612 () Bool)

(declare-fun res!220009 () Bool)

(declare-fun e!234039 () Bool)

(assert (=> b!385612 (=> (not res!220009) (not e!234039))))

(declare-datatypes ((array!22768 0))(
  ( (array!22769 (arr!10852 (Array (_ BitVec 32) (_ BitVec 64))) (size!11204 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22768)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!385612 (= res!220009 (or (= (select (arr!10852 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10852 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15723 () Bool)

(declare-fun mapRes!15723 () Bool)

(assert (=> mapIsEmpty!15723 mapRes!15723))

(declare-fun b!385613 () Bool)

(declare-fun res!220012 () Bool)

(assert (=> b!385613 (=> (not res!220012) (not e!234039))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22768 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!385613 (= res!220012 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!385614 () Bool)

(declare-fun e!234037 () Bool)

(assert (=> b!385614 (= e!234037 false)))

(declare-datatypes ((V!13691 0))(
  ( (V!13692 (val!4764 Int)) )
))
(declare-datatypes ((tuple2!6274 0))(
  ( (tuple2!6275 (_1!3148 (_ BitVec 64)) (_2!3148 V!13691)) )
))
(declare-datatypes ((List!6119 0))(
  ( (Nil!6116) (Cons!6115 (h!6971 tuple2!6274) (t!11261 List!6119)) )
))
(declare-datatypes ((ListLongMap!5189 0))(
  ( (ListLongMap!5190 (toList!2610 List!6119)) )
))
(declare-fun lt!181663 () ListLongMap!5189)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4376 0))(
  ( (ValueCellFull!4376 (v!6962 V!13691)) (EmptyCell!4376) )
))
(declare-datatypes ((array!22770 0))(
  ( (array!22771 (arr!10853 (Array (_ BitVec 32) ValueCell!4376)) (size!11205 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22770)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13691)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13691)

(declare-fun getCurrentListMapNoExtraKeys!885 (array!22768 array!22770 (_ BitVec 32) (_ BitVec 32) V!13691 V!13691 (_ BitVec 32) Int) ListLongMap!5189)

(assert (=> b!385614 (= lt!181663 (getCurrentListMapNoExtraKeys!885 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!385615 () Bool)

(declare-fun res!220004 () Bool)

(assert (=> b!385615 (=> (not res!220004) (not e!234039))))

(assert (=> b!385615 (= res!220004 (and (= (size!11205 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11204 _keys!658) (size!11205 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!385616 () Bool)

(assert (=> b!385616 (= e!234039 e!234037)))

(declare-fun res!220005 () Bool)

(assert (=> b!385616 (=> (not res!220005) (not e!234037))))

(declare-fun lt!181662 () array!22768)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22768 (_ BitVec 32)) Bool)

(assert (=> b!385616 (= res!220005 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181662 mask!970))))

(assert (=> b!385616 (= lt!181662 (array!22769 (store (arr!10852 _keys!658) i!548 k0!778) (size!11204 _keys!658)))))

(declare-fun b!385617 () Bool)

(declare-fun res!220008 () Bool)

(assert (=> b!385617 (=> (not res!220008) (not e!234039))))

(assert (=> b!385617 (= res!220008 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11204 _keys!658))))))

(declare-fun res!220006 () Bool)

(assert (=> start!37650 (=> (not res!220006) (not e!234039))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37650 (= res!220006 (validMask!0 mask!970))))

(assert (=> start!37650 e!234039))

(assert (=> start!37650 true))

(declare-fun e!234040 () Bool)

(declare-fun array_inv!8024 (array!22770) Bool)

(assert (=> start!37650 (and (array_inv!8024 _values!506) e!234040)))

(assert (=> start!37650 tp!31053))

(declare-fun tp_is_empty!9439 () Bool)

(assert (=> start!37650 tp_is_empty!9439))

(declare-fun array_inv!8025 (array!22768) Bool)

(assert (=> start!37650 (array_inv!8025 _keys!658)))

(declare-fun mapNonEmpty!15723 () Bool)

(declare-fun tp!31052 () Bool)

(declare-fun e!234041 () Bool)

(assert (=> mapNonEmpty!15723 (= mapRes!15723 (and tp!31052 e!234041))))

(declare-fun mapValue!15723 () ValueCell!4376)

(declare-fun mapRest!15723 () (Array (_ BitVec 32) ValueCell!4376))

(declare-fun mapKey!15723 () (_ BitVec 32))

(assert (=> mapNonEmpty!15723 (= (arr!10853 _values!506) (store mapRest!15723 mapKey!15723 mapValue!15723))))

(declare-fun b!385618 () Bool)

(declare-fun e!234038 () Bool)

(assert (=> b!385618 (= e!234038 tp_is_empty!9439)))

(declare-fun b!385619 () Bool)

(declare-fun res!220013 () Bool)

(assert (=> b!385619 (=> (not res!220013) (not e!234037))))

(declare-datatypes ((List!6120 0))(
  ( (Nil!6117) (Cons!6116 (h!6972 (_ BitVec 64)) (t!11262 List!6120)) )
))
(declare-fun arrayNoDuplicates!0 (array!22768 (_ BitVec 32) List!6120) Bool)

(assert (=> b!385619 (= res!220013 (arrayNoDuplicates!0 lt!181662 #b00000000000000000000000000000000 Nil!6117))))

(declare-fun b!385620 () Bool)

(assert (=> b!385620 (= e!234040 (and e!234038 mapRes!15723))))

(declare-fun condMapEmpty!15723 () Bool)

(declare-fun mapDefault!15723 () ValueCell!4376)

(assert (=> b!385620 (= condMapEmpty!15723 (= (arr!10853 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4376)) mapDefault!15723)))))

(declare-fun b!385621 () Bool)

(assert (=> b!385621 (= e!234041 tp_is_empty!9439)))

(declare-fun b!385622 () Bool)

(declare-fun res!220010 () Bool)

(assert (=> b!385622 (=> (not res!220010) (not e!234039))))

(assert (=> b!385622 (= res!220010 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!385623 () Bool)

(declare-fun res!220007 () Bool)

(assert (=> b!385623 (=> (not res!220007) (not e!234039))))

(assert (=> b!385623 (= res!220007 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6117))))

(declare-fun b!385624 () Bool)

(declare-fun res!220011 () Bool)

(assert (=> b!385624 (=> (not res!220011) (not e!234039))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!385624 (= res!220011 (validKeyInArray!0 k0!778))))

(assert (= (and start!37650 res!220006) b!385615))

(assert (= (and b!385615 res!220004) b!385622))

(assert (= (and b!385622 res!220010) b!385623))

(assert (= (and b!385623 res!220007) b!385617))

(assert (= (and b!385617 res!220008) b!385624))

(assert (= (and b!385624 res!220011) b!385612))

(assert (= (and b!385612 res!220009) b!385613))

(assert (= (and b!385613 res!220012) b!385616))

(assert (= (and b!385616 res!220005) b!385619))

(assert (= (and b!385619 res!220013) b!385614))

(assert (= (and b!385620 condMapEmpty!15723) mapIsEmpty!15723))

(assert (= (and b!385620 (not condMapEmpty!15723)) mapNonEmpty!15723))

(get-info :version)

(assert (= (and mapNonEmpty!15723 ((_ is ValueCellFull!4376) mapValue!15723)) b!385621))

(assert (= (and b!385620 ((_ is ValueCellFull!4376) mapDefault!15723)) b!385618))

(assert (= start!37650 b!385620))

(declare-fun m!382439 () Bool)

(assert (=> b!385622 m!382439))

(declare-fun m!382441 () Bool)

(assert (=> b!385619 m!382441))

(declare-fun m!382443 () Bool)

(assert (=> start!37650 m!382443))

(declare-fun m!382445 () Bool)

(assert (=> start!37650 m!382445))

(declare-fun m!382447 () Bool)

(assert (=> start!37650 m!382447))

(declare-fun m!382449 () Bool)

(assert (=> mapNonEmpty!15723 m!382449))

(declare-fun m!382451 () Bool)

(assert (=> b!385623 m!382451))

(declare-fun m!382453 () Bool)

(assert (=> b!385616 m!382453))

(declare-fun m!382455 () Bool)

(assert (=> b!385616 m!382455))

(declare-fun m!382457 () Bool)

(assert (=> b!385612 m!382457))

(declare-fun m!382459 () Bool)

(assert (=> b!385614 m!382459))

(declare-fun m!382461 () Bool)

(assert (=> b!385613 m!382461))

(declare-fun m!382463 () Bool)

(assert (=> b!385624 m!382463))

(check-sat (not b!385624) (not b_next!8767) (not b!385616) (not b!385614) (not b!385622) (not mapNonEmpty!15723) (not b!385623) (not b!385619) tp_is_empty!9439 (not b!385613) b_and!16023 (not start!37650))
(check-sat b_and!16023 (not b_next!8767))
