; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38534 () Bool)

(assert start!38534)

(declare-fun b_free!9085 () Bool)

(declare-fun b_next!9085 () Bool)

(assert (=> start!38534 (= b_free!9085 (not b_next!9085))))

(declare-fun tp!32379 () Bool)

(declare-fun b_and!16485 () Bool)

(assert (=> start!38534 (= tp!32379 b_and!16485)))

(declare-fun b!398577 () Bool)

(declare-fun e!240865 () Bool)

(assert (=> b!398577 (= e!240865 (not true))))

(declare-fun e!240866 () Bool)

(assert (=> b!398577 e!240866))

(declare-fun c!54561 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!398577 (= c!54561 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((V!14395 0))(
  ( (V!14396 (val!5028 Int)) )
))
(declare-fun minValue!515 () V!14395)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4640 0))(
  ( (ValueCellFull!4640 (v!7276 V!14395)) (EmptyCell!4640) )
))
(declare-datatypes ((array!23824 0))(
  ( (array!23825 (arr!11361 (Array (_ BitVec 32) ValueCell!4640)) (size!11713 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23824)

(declare-fun zeroValue!515 () V!14395)

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((Unit!12051 0))(
  ( (Unit!12052) )
))
(declare-fun lt!187499 () Unit!12051)

(declare-fun v!412 () V!14395)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!23826 0))(
  ( (array!23827 (arr!11362 (Array (_ BitVec 32) (_ BitVec 64))) (size!11714 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23826)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!293 (array!23826 array!23824 (_ BitVec 32) (_ BitVec 32) V!14395 V!14395 (_ BitVec 32) (_ BitVec 64) V!14395 (_ BitVec 32) Int) Unit!12051)

(assert (=> b!398577 (= lt!187499 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!293 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!16572 () Bool)

(declare-fun mapRes!16572 () Bool)

(declare-fun tp!32378 () Bool)

(declare-fun e!240868 () Bool)

(assert (=> mapNonEmpty!16572 (= mapRes!16572 (and tp!32378 e!240868))))

(declare-fun mapRest!16572 () (Array (_ BitVec 32) ValueCell!4640))

(declare-fun mapValue!16572 () ValueCell!4640)

(declare-fun mapKey!16572 () (_ BitVec 32))

(assert (=> mapNonEmpty!16572 (= (arr!11361 _values!549) (store mapRest!16572 mapKey!16572 mapValue!16572))))

(declare-fun b!398578 () Bool)

(declare-fun res!229110 () Bool)

(assert (=> b!398578 (=> (not res!229110) (not e!240865))))

(assert (=> b!398578 (= res!229110 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11714 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!398579 () Bool)

(declare-fun e!240864 () Bool)

(declare-fun tp_is_empty!9967 () Bool)

(assert (=> b!398579 (= e!240864 tp_is_empty!9967)))

(declare-fun b!398580 () Bool)

(declare-datatypes ((tuple2!6514 0))(
  ( (tuple2!6515 (_1!3268 (_ BitVec 64)) (_2!3268 V!14395)) )
))
(declare-datatypes ((List!6434 0))(
  ( (Nil!6431) (Cons!6430 (h!7286 tuple2!6514) (t!11600 List!6434)) )
))
(declare-datatypes ((ListLongMap!5429 0))(
  ( (ListLongMap!5430 (toList!2730 List!6434)) )
))
(declare-fun call!27906 () ListLongMap!5429)

(declare-fun call!27907 () ListLongMap!5429)

(declare-fun +!1083 (ListLongMap!5429 tuple2!6514) ListLongMap!5429)

(assert (=> b!398580 (= e!240866 (= call!27907 (+!1083 call!27906 (tuple2!6515 k0!794 v!412))))))

(declare-fun b!398581 () Bool)

(assert (=> b!398581 (= e!240868 tp_is_empty!9967)))

(declare-fun mapIsEmpty!16572 () Bool)

(assert (=> mapIsEmpty!16572 mapRes!16572))

(declare-fun b!398582 () Bool)

(assert (=> b!398582 (= e!240866 (= call!27906 call!27907))))

(declare-fun bm!27903 () Bool)

(declare-fun lt!187500 () array!23826)

(declare-fun getCurrentListMapNoExtraKeys!991 (array!23826 array!23824 (_ BitVec 32) (_ BitVec 32) V!14395 V!14395 (_ BitVec 32) Int) ListLongMap!5429)

(assert (=> bm!27903 (= call!27907 (getCurrentListMapNoExtraKeys!991 (ite c!54561 lt!187500 _keys!709) (ite c!54561 (array!23825 (store (arr!11361 _values!549) i!563 (ValueCellFull!4640 v!412)) (size!11713 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!27904 () Bool)

(assert (=> bm!27904 (= call!27906 (getCurrentListMapNoExtraKeys!991 (ite c!54561 _keys!709 lt!187500) (ite c!54561 _values!549 (array!23825 (store (arr!11361 _values!549) i!563 (ValueCellFull!4640 v!412)) (size!11713 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!398583 () Bool)

(declare-fun res!229101 () Bool)

(declare-fun e!240867 () Bool)

(assert (=> b!398583 (=> (not res!229101) (not e!240867))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!398583 (= res!229101 (validKeyInArray!0 k0!794))))

(declare-fun b!398584 () Bool)

(declare-fun res!229104 () Bool)

(assert (=> b!398584 (=> (not res!229104) (not e!240865))))

(declare-datatypes ((List!6435 0))(
  ( (Nil!6432) (Cons!6431 (h!7287 (_ BitVec 64)) (t!11601 List!6435)) )
))
(declare-fun arrayNoDuplicates!0 (array!23826 (_ BitVec 32) List!6435) Bool)

(assert (=> b!398584 (= res!229104 (arrayNoDuplicates!0 lt!187500 #b00000000000000000000000000000000 Nil!6432))))

(declare-fun b!398586 () Bool)

(declare-fun res!229108 () Bool)

(assert (=> b!398586 (=> (not res!229108) (not e!240867))))

(assert (=> b!398586 (= res!229108 (or (= (select (arr!11362 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11362 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!398587 () Bool)

(declare-fun res!229106 () Bool)

(assert (=> b!398587 (=> (not res!229106) (not e!240867))))

(assert (=> b!398587 (= res!229106 (and (= (size!11713 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11714 _keys!709) (size!11713 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!398588 () Bool)

(declare-fun res!229109 () Bool)

(assert (=> b!398588 (=> (not res!229109) (not e!240867))))

(declare-fun arrayContainsKey!0 (array!23826 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!398588 (= res!229109 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!229100 () Bool)

(assert (=> start!38534 (=> (not res!229100) (not e!240867))))

(assert (=> start!38534 (= res!229100 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11714 _keys!709))))))

(assert (=> start!38534 e!240867))

(assert (=> start!38534 tp_is_empty!9967))

(assert (=> start!38534 tp!32379))

(assert (=> start!38534 true))

(declare-fun e!240862 () Bool)

(declare-fun array_inv!8392 (array!23824) Bool)

(assert (=> start!38534 (and (array_inv!8392 _values!549) e!240862)))

(declare-fun array_inv!8393 (array!23826) Bool)

(assert (=> start!38534 (array_inv!8393 _keys!709)))

(declare-fun b!398585 () Bool)

(declare-fun res!229105 () Bool)

(assert (=> b!398585 (=> (not res!229105) (not e!240867))))

(assert (=> b!398585 (= res!229105 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11714 _keys!709))))))

(declare-fun b!398589 () Bool)

(declare-fun res!229102 () Bool)

(assert (=> b!398589 (=> (not res!229102) (not e!240867))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23826 (_ BitVec 32)) Bool)

(assert (=> b!398589 (= res!229102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!398590 () Bool)

(declare-fun res!229099 () Bool)

(assert (=> b!398590 (=> (not res!229099) (not e!240867))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!398590 (= res!229099 (validMask!0 mask!1025))))

(declare-fun b!398591 () Bool)

(assert (=> b!398591 (= e!240867 e!240865)))

(declare-fun res!229107 () Bool)

(assert (=> b!398591 (=> (not res!229107) (not e!240865))))

(assert (=> b!398591 (= res!229107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187500 mask!1025))))

(assert (=> b!398591 (= lt!187500 (array!23827 (store (arr!11362 _keys!709) i!563 k0!794) (size!11714 _keys!709)))))

(declare-fun b!398592 () Bool)

(declare-fun res!229103 () Bool)

(assert (=> b!398592 (=> (not res!229103) (not e!240867))))

(assert (=> b!398592 (= res!229103 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6432))))

(declare-fun b!398593 () Bool)

(assert (=> b!398593 (= e!240862 (and e!240864 mapRes!16572))))

(declare-fun condMapEmpty!16572 () Bool)

(declare-fun mapDefault!16572 () ValueCell!4640)

(assert (=> b!398593 (= condMapEmpty!16572 (= (arr!11361 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4640)) mapDefault!16572)))))

(assert (= (and start!38534 res!229100) b!398590))

(assert (= (and b!398590 res!229099) b!398587))

(assert (= (and b!398587 res!229106) b!398589))

(assert (= (and b!398589 res!229102) b!398592))

(assert (= (and b!398592 res!229103) b!398585))

(assert (= (and b!398585 res!229105) b!398583))

(assert (= (and b!398583 res!229101) b!398586))

(assert (= (and b!398586 res!229108) b!398588))

(assert (= (and b!398588 res!229109) b!398591))

(assert (= (and b!398591 res!229107) b!398584))

(assert (= (and b!398584 res!229104) b!398578))

(assert (= (and b!398578 res!229110) b!398577))

(assert (= (and b!398577 c!54561) b!398580))

(assert (= (and b!398577 (not c!54561)) b!398582))

(assert (= (or b!398580 b!398582) bm!27903))

(assert (= (or b!398580 b!398582) bm!27904))

(assert (= (and b!398593 condMapEmpty!16572) mapIsEmpty!16572))

(assert (= (and b!398593 (not condMapEmpty!16572)) mapNonEmpty!16572))

(get-info :version)

(assert (= (and mapNonEmpty!16572 ((_ is ValueCellFull!4640) mapValue!16572)) b!398581))

(assert (= (and b!398593 ((_ is ValueCellFull!4640) mapDefault!16572)) b!398579))

(assert (= start!38534 b!398593))

(declare-fun m!393651 () Bool)

(assert (=> mapNonEmpty!16572 m!393651))

(declare-fun m!393653 () Bool)

(assert (=> start!38534 m!393653))

(declare-fun m!393655 () Bool)

(assert (=> start!38534 m!393655))

(declare-fun m!393657 () Bool)

(assert (=> b!398584 m!393657))

(declare-fun m!393659 () Bool)

(assert (=> b!398591 m!393659))

(declare-fun m!393661 () Bool)

(assert (=> b!398591 m!393661))

(declare-fun m!393663 () Bool)

(assert (=> b!398580 m!393663))

(declare-fun m!393665 () Bool)

(assert (=> b!398583 m!393665))

(declare-fun m!393667 () Bool)

(assert (=> bm!27904 m!393667))

(declare-fun m!393669 () Bool)

(assert (=> bm!27904 m!393669))

(declare-fun m!393671 () Bool)

(assert (=> b!398590 m!393671))

(assert (=> bm!27903 m!393667))

(declare-fun m!393673 () Bool)

(assert (=> bm!27903 m!393673))

(declare-fun m!393675 () Bool)

(assert (=> b!398577 m!393675))

(declare-fun m!393677 () Bool)

(assert (=> b!398586 m!393677))

(declare-fun m!393679 () Bool)

(assert (=> b!398588 m!393679))

(declare-fun m!393681 () Bool)

(assert (=> b!398589 m!393681))

(declare-fun m!393683 () Bool)

(assert (=> b!398592 m!393683))

(check-sat (not start!38534) (not b!398592) (not b!398580) (not b_next!9085) (not b!398590) (not b!398588) (not b!398583) (not bm!27903) b_and!16485 (not b!398577) (not b!398584) (not bm!27904) (not mapNonEmpty!16572) (not b!398589) (not b!398591) tp_is_empty!9967)
(check-sat b_and!16485 (not b_next!9085))
