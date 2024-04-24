; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37488 () Bool)

(assert start!37488)

(declare-fun b_free!8629 () Bool)

(declare-fun b_next!8629 () Bool)

(assert (=> start!37488 (= b_free!8629 (not b_next!8629))))

(declare-fun tp!30602 () Bool)

(declare-fun b_and!15885 () Bool)

(assert (=> start!37488 (= tp!30602 b_and!15885)))

(declare-fun b!382437 () Bool)

(declare-fun res!217559 () Bool)

(declare-fun e!232398 () Bool)

(assert (=> b!382437 (=> (not res!217559) (not e!232398))))

(declare-datatypes ((array!22452 0))(
  ( (array!22453 (arr!10694 (Array (_ BitVec 32) (_ BitVec 64))) (size!11046 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22452)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22452 (_ BitVec 32)) Bool)

(assert (=> b!382437 (= res!217559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!382438 () Bool)

(declare-fun res!217558 () Bool)

(assert (=> b!382438 (=> (not res!217558) (not e!232398))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!382438 (= res!217558 (validKeyInArray!0 k0!778))))

(declare-fun res!217564 () Bool)

(assert (=> start!37488 (=> (not res!217564) (not e!232398))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37488 (= res!217564 (validMask!0 mask!970))))

(assert (=> start!37488 e!232398))

(declare-datatypes ((V!13475 0))(
  ( (V!13476 (val!4683 Int)) )
))
(declare-datatypes ((ValueCell!4295 0))(
  ( (ValueCellFull!4295 (v!6881 V!13475)) (EmptyCell!4295) )
))
(declare-datatypes ((array!22454 0))(
  ( (array!22455 (arr!10695 (Array (_ BitVec 32) ValueCell!4295)) (size!11047 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22454)

(declare-fun e!232396 () Bool)

(declare-fun array_inv!7918 (array!22454) Bool)

(assert (=> start!37488 (and (array_inv!7918 _values!506) e!232396)))

(assert (=> start!37488 tp!30602))

(assert (=> start!37488 true))

(declare-fun tp_is_empty!9277 () Bool)

(assert (=> start!37488 tp_is_empty!9277))

(declare-fun array_inv!7919 (array!22452) Bool)

(assert (=> start!37488 (array_inv!7919 _keys!658)))

(declare-fun b!382439 () Bool)

(declare-fun res!217563 () Bool)

(declare-fun e!232392 () Bool)

(assert (=> b!382439 (=> (not res!217563) (not e!232392))))

(declare-fun lt!179473 () array!22452)

(declare-datatypes ((List!6009 0))(
  ( (Nil!6006) (Cons!6005 (h!6861 (_ BitVec 64)) (t!11151 List!6009)) )
))
(declare-fun arrayNoDuplicates!0 (array!22452 (_ BitVec 32) List!6009) Bool)

(assert (=> b!382439 (= res!217563 (arrayNoDuplicates!0 lt!179473 #b00000000000000000000000000000000 Nil!6006))))

(declare-fun b!382440 () Bool)

(declare-fun res!217565 () Bool)

(assert (=> b!382440 (=> (not res!217565) (not e!232398))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!382440 (= res!217565 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11046 _keys!658))))))

(declare-fun b!382441 () Bool)

(declare-fun e!232397 () Bool)

(assert (=> b!382441 (= e!232397 tp_is_empty!9277)))

(declare-fun b!382442 () Bool)

(declare-fun res!217566 () Bool)

(assert (=> b!382442 (=> (not res!217566) (not e!232398))))

(assert (=> b!382442 (= res!217566 (or (= (select (arr!10694 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10694 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!382443 () Bool)

(assert (=> b!382443 (= e!232398 e!232392)))

(declare-fun res!217560 () Bool)

(assert (=> b!382443 (=> (not res!217560) (not e!232392))))

(assert (=> b!382443 (= res!217560 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!179473 mask!970))))

(assert (=> b!382443 (= lt!179473 (array!22453 (store (arr!10694 _keys!658) i!548 k0!778) (size!11046 _keys!658)))))

(declare-fun b!382444 () Bool)

(declare-fun e!232395 () Bool)

(assert (=> b!382444 (= e!232395 tp_is_empty!9277)))

(declare-fun mapIsEmpty!15480 () Bool)

(declare-fun mapRes!15480 () Bool)

(assert (=> mapIsEmpty!15480 mapRes!15480))

(declare-fun b!382445 () Bool)

(declare-fun res!217568 () Bool)

(assert (=> b!382445 (=> (not res!217568) (not e!232398))))

(declare-fun arrayContainsKey!0 (array!22452 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!382445 (= res!217568 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!382446 () Bool)

(declare-fun res!217561 () Bool)

(assert (=> b!382446 (=> (not res!217561) (not e!232398))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!382446 (= res!217561 (and (= (size!11047 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11046 _keys!658) (size!11047 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!382447 () Bool)

(declare-fun res!217567 () Bool)

(assert (=> b!382447 (=> (not res!217567) (not e!232398))))

(assert (=> b!382447 (= res!217567 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6006))))

(declare-fun b!382448 () Bool)

(declare-fun e!232394 () Bool)

(assert (=> b!382448 (= e!232392 (not e!232394))))

(declare-fun res!217562 () Bool)

(assert (=> b!382448 (=> res!217562 e!232394)))

(declare-fun lt!179475 () Bool)

(assert (=> b!382448 (= res!217562 (or (and (not lt!179475) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179475) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179475)))))

(assert (=> b!382448 (= lt!179475 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((tuple2!6174 0))(
  ( (tuple2!6175 (_1!3098 (_ BitVec 64)) (_2!3098 V!13475)) )
))
(declare-datatypes ((List!6010 0))(
  ( (Nil!6007) (Cons!6006 (h!6862 tuple2!6174) (t!11152 List!6010)) )
))
(declare-datatypes ((ListLongMap!5089 0))(
  ( (ListLongMap!5090 (toList!2560 List!6010)) )
))
(declare-fun lt!179477 () ListLongMap!5089)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13475)

(declare-fun minValue!472 () V!13475)

(declare-fun getCurrentListMap!1995 (array!22452 array!22454 (_ BitVec 32) (_ BitVec 32) V!13475 V!13475 (_ BitVec 32) Int) ListLongMap!5089)

(assert (=> b!382448 (= lt!179477 (getCurrentListMap!1995 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179474 () array!22454)

(declare-fun lt!179478 () ListLongMap!5089)

(assert (=> b!382448 (= lt!179478 (getCurrentListMap!1995 lt!179473 lt!179474 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179479 () ListLongMap!5089)

(declare-fun lt!179472 () ListLongMap!5089)

(assert (=> b!382448 (and (= lt!179479 lt!179472) (= lt!179472 lt!179479))))

(declare-fun v!373 () V!13475)

(declare-fun lt!179476 () ListLongMap!5089)

(declare-fun +!953 (ListLongMap!5089 tuple2!6174) ListLongMap!5089)

(assert (=> b!382448 (= lt!179472 (+!953 lt!179476 (tuple2!6175 k0!778 v!373)))))

(declare-datatypes ((Unit!11785 0))(
  ( (Unit!11786) )
))
(declare-fun lt!179471 () Unit!11785)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!182 (array!22452 array!22454 (_ BitVec 32) (_ BitVec 32) V!13475 V!13475 (_ BitVec 32) (_ BitVec 64) V!13475 (_ BitVec 32) Int) Unit!11785)

(assert (=> b!382448 (= lt!179471 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!182 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!842 (array!22452 array!22454 (_ BitVec 32) (_ BitVec 32) V!13475 V!13475 (_ BitVec 32) Int) ListLongMap!5089)

(assert (=> b!382448 (= lt!179479 (getCurrentListMapNoExtraKeys!842 lt!179473 lt!179474 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!382448 (= lt!179474 (array!22455 (store (arr!10695 _values!506) i!548 (ValueCellFull!4295 v!373)) (size!11047 _values!506)))))

(assert (=> b!382448 (= lt!179476 (getCurrentListMapNoExtraKeys!842 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!382449 () Bool)

(assert (=> b!382449 (= e!232394 true)))

(assert (=> b!382449 (= lt!179478 lt!179479)))

(declare-fun b!382450 () Bool)

(assert (=> b!382450 (= e!232396 (and e!232395 mapRes!15480))))

(declare-fun condMapEmpty!15480 () Bool)

(declare-fun mapDefault!15480 () ValueCell!4295)

(assert (=> b!382450 (= condMapEmpty!15480 (= (arr!10695 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4295)) mapDefault!15480)))))

(declare-fun mapNonEmpty!15480 () Bool)

(declare-fun tp!30603 () Bool)

(assert (=> mapNonEmpty!15480 (= mapRes!15480 (and tp!30603 e!232397))))

(declare-fun mapRest!15480 () (Array (_ BitVec 32) ValueCell!4295))

(declare-fun mapValue!15480 () ValueCell!4295)

(declare-fun mapKey!15480 () (_ BitVec 32))

(assert (=> mapNonEmpty!15480 (= (arr!10695 _values!506) (store mapRest!15480 mapKey!15480 mapValue!15480))))

(assert (= (and start!37488 res!217564) b!382446))

(assert (= (and b!382446 res!217561) b!382437))

(assert (= (and b!382437 res!217559) b!382447))

(assert (= (and b!382447 res!217567) b!382440))

(assert (= (and b!382440 res!217565) b!382438))

(assert (= (and b!382438 res!217558) b!382442))

(assert (= (and b!382442 res!217566) b!382445))

(assert (= (and b!382445 res!217568) b!382443))

(assert (= (and b!382443 res!217560) b!382439))

(assert (= (and b!382439 res!217563) b!382448))

(assert (= (and b!382448 (not res!217562)) b!382449))

(assert (= (and b!382450 condMapEmpty!15480) mapIsEmpty!15480))

(assert (= (and b!382450 (not condMapEmpty!15480)) mapNonEmpty!15480))

(get-info :version)

(assert (= (and mapNonEmpty!15480 ((_ is ValueCellFull!4295) mapValue!15480)) b!382441))

(assert (= (and b!382450 ((_ is ValueCellFull!4295) mapDefault!15480)) b!382444))

(assert (= start!37488 b!382450))

(declare-fun m!379535 () Bool)

(assert (=> mapNonEmpty!15480 m!379535))

(declare-fun m!379537 () Bool)

(assert (=> b!382443 m!379537))

(declare-fun m!379539 () Bool)

(assert (=> b!382443 m!379539))

(declare-fun m!379541 () Bool)

(assert (=> start!37488 m!379541))

(declare-fun m!379543 () Bool)

(assert (=> start!37488 m!379543))

(declare-fun m!379545 () Bool)

(assert (=> start!37488 m!379545))

(declare-fun m!379547 () Bool)

(assert (=> b!382442 m!379547))

(declare-fun m!379549 () Bool)

(assert (=> b!382448 m!379549))

(declare-fun m!379551 () Bool)

(assert (=> b!382448 m!379551))

(declare-fun m!379553 () Bool)

(assert (=> b!382448 m!379553))

(declare-fun m!379555 () Bool)

(assert (=> b!382448 m!379555))

(declare-fun m!379557 () Bool)

(assert (=> b!382448 m!379557))

(declare-fun m!379559 () Bool)

(assert (=> b!382448 m!379559))

(declare-fun m!379561 () Bool)

(assert (=> b!382448 m!379561))

(declare-fun m!379563 () Bool)

(assert (=> b!382438 m!379563))

(declare-fun m!379565 () Bool)

(assert (=> b!382447 m!379565))

(declare-fun m!379567 () Bool)

(assert (=> b!382437 m!379567))

(declare-fun m!379569 () Bool)

(assert (=> b!382445 m!379569))

(declare-fun m!379571 () Bool)

(assert (=> b!382439 m!379571))

(check-sat (not b!382443) (not b!382448) b_and!15885 (not mapNonEmpty!15480) (not b_next!8629) (not b!382447) (not b!382445) (not b!382437) (not b!382439) (not b!382438) tp_is_empty!9277 (not start!37488))
(check-sat b_and!15885 (not b_next!8629))
