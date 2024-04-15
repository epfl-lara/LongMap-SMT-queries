; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39908 () Bool)

(assert start!39908)

(declare-fun b_free!10189 () Bool)

(declare-fun b_next!10189 () Bool)

(assert (=> start!39908 (= b_free!10189 (not b_next!10189))))

(declare-fun tp!36096 () Bool)

(declare-fun b_and!18011 () Bool)

(assert (=> start!39908 (= tp!36096 b_and!18011)))

(declare-fun b!432789 () Bool)

(declare-fun res!254703 () Bool)

(declare-fun e!255927 () Bool)

(assert (=> b!432789 (=> (not res!254703) (not e!255927))))

(declare-datatypes ((array!26509 0))(
  ( (array!26510 (arr!12704 (Array (_ BitVec 32) (_ BitVec 64))) (size!13057 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26509)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!432789 (= res!254703 (or (= (select (arr!12704 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12704 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!432790 () Bool)

(declare-fun res!254699 () Bool)

(assert (=> b!432790 (=> (not res!254699) (not e!255927))))

(declare-datatypes ((List!7551 0))(
  ( (Nil!7548) (Cons!7547 (h!8403 (_ BitVec 64)) (t!13180 List!7551)) )
))
(declare-fun arrayNoDuplicates!0 (array!26509 (_ BitVec 32) List!7551) Bool)

(assert (=> b!432790 (= res!254699 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7548))))

(declare-fun b!432791 () Bool)

(declare-fun res!254696 () Bool)

(declare-fun e!255926 () Bool)

(assert (=> b!432791 (=> (not res!254696) (not e!255926))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!432791 (= res!254696 (bvsle from!863 i!563))))

(declare-fun b!432792 () Bool)

(declare-fun e!255919 () Bool)

(declare-fun e!255924 () Bool)

(assert (=> b!432792 (= e!255919 (not e!255924))))

(declare-fun res!254701 () Bool)

(assert (=> b!432792 (=> res!254701 e!255924)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!432792 (= res!254701 (not (validKeyInArray!0 (select (arr!12704 _keys!709) from!863))))))

(declare-datatypes ((V!16227 0))(
  ( (V!16228 (val!5715 Int)) )
))
(declare-datatypes ((tuple2!7558 0))(
  ( (tuple2!7559 (_1!3790 (_ BitVec 64)) (_2!3790 V!16227)) )
))
(declare-datatypes ((List!7552 0))(
  ( (Nil!7549) (Cons!7548 (h!8404 tuple2!7558) (t!13181 List!7552)) )
))
(declare-datatypes ((ListLongMap!6461 0))(
  ( (ListLongMap!6462 (toList!3246 List!7552)) )
))
(declare-fun lt!198524 () ListLongMap!6461)

(declare-fun lt!198525 () ListLongMap!6461)

(assert (=> b!432792 (= lt!198524 lt!198525)))

(declare-fun lt!198531 () ListLongMap!6461)

(declare-fun lt!198523 () tuple2!7558)

(declare-fun +!1421 (ListLongMap!6461 tuple2!7558) ListLongMap!6461)

(assert (=> b!432792 (= lt!198525 (+!1421 lt!198531 lt!198523))))

(declare-fun lt!198534 () array!26509)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16227)

(declare-datatypes ((ValueCell!5327 0))(
  ( (ValueCellFull!5327 (v!7956 V!16227)) (EmptyCell!5327) )
))
(declare-datatypes ((array!26511 0))(
  ( (array!26512 (arr!12705 (Array (_ BitVec 32) ValueCell!5327)) (size!13058 (_ BitVec 32))) )
))
(declare-fun lt!198522 () array!26511)

(declare-fun minValue!515 () V!16227)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1449 (array!26509 array!26511 (_ BitVec 32) (_ BitVec 32) V!16227 V!16227 (_ BitVec 32) Int) ListLongMap!6461)

(assert (=> b!432792 (= lt!198524 (getCurrentListMapNoExtraKeys!1449 lt!198534 lt!198522 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!16227)

(assert (=> b!432792 (= lt!198523 (tuple2!7559 k0!794 v!412))))

(declare-fun _values!549 () array!26511)

(assert (=> b!432792 (= lt!198531 (getCurrentListMapNoExtraKeys!1449 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12779 0))(
  ( (Unit!12780) )
))
(declare-fun lt!198527 () Unit!12779)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!574 (array!26509 array!26511 (_ BitVec 32) (_ BitVec 32) V!16227 V!16227 (_ BitVec 32) (_ BitVec 64) V!16227 (_ BitVec 32) Int) Unit!12779)

(assert (=> b!432792 (= lt!198527 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!574 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!18633 () Bool)

(declare-fun mapRes!18633 () Bool)

(declare-fun tp!36095 () Bool)

(declare-fun e!255923 () Bool)

(assert (=> mapNonEmpty!18633 (= mapRes!18633 (and tp!36095 e!255923))))

(declare-fun mapValue!18633 () ValueCell!5327)

(declare-fun mapRest!18633 () (Array (_ BitVec 32) ValueCell!5327))

(declare-fun mapKey!18633 () (_ BitVec 32))

(assert (=> mapNonEmpty!18633 (= (arr!12705 _values!549) (store mapRest!18633 mapKey!18633 mapValue!18633))))

(declare-fun b!432793 () Bool)

(declare-fun tp_is_empty!11341 () Bool)

(assert (=> b!432793 (= e!255923 tp_is_empty!11341)))

(declare-fun b!432794 () Bool)

(declare-fun res!254700 () Bool)

(assert (=> b!432794 (=> (not res!254700) (not e!255927))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!432794 (= res!254700 (validMask!0 mask!1025))))

(declare-fun b!432795 () Bool)

(declare-fun e!255920 () Bool)

(declare-fun e!255921 () Bool)

(assert (=> b!432795 (= e!255920 (and e!255921 mapRes!18633))))

(declare-fun condMapEmpty!18633 () Bool)

(declare-fun mapDefault!18633 () ValueCell!5327)

(assert (=> b!432795 (= condMapEmpty!18633 (= (arr!12705 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5327)) mapDefault!18633)))))

(declare-fun b!432796 () Bool)

(declare-fun res!254692 () Bool)

(assert (=> b!432796 (=> (not res!254692) (not e!255927))))

(assert (=> b!432796 (= res!254692 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13057 _keys!709))))))

(declare-fun mapIsEmpty!18633 () Bool)

(assert (=> mapIsEmpty!18633 mapRes!18633))

(declare-fun b!432797 () Bool)

(declare-fun e!255922 () Bool)

(assert (=> b!432797 (= e!255924 e!255922)))

(declare-fun res!254706 () Bool)

(assert (=> b!432797 (=> res!254706 e!255922)))

(assert (=> b!432797 (= res!254706 (= k0!794 (select (arr!12704 _keys!709) from!863)))))

(assert (=> b!432797 (not (= (select (arr!12704 _keys!709) from!863) k0!794))))

(declare-fun lt!198532 () Unit!12779)

(declare-fun e!255925 () Unit!12779)

(assert (=> b!432797 (= lt!198532 e!255925)))

(declare-fun c!55548 () Bool)

(assert (=> b!432797 (= c!55548 (= (select (arr!12704 _keys!709) from!863) k0!794))))

(declare-fun lt!198526 () ListLongMap!6461)

(declare-fun lt!198528 () ListLongMap!6461)

(assert (=> b!432797 (= lt!198526 lt!198528)))

(declare-fun lt!198536 () tuple2!7558)

(assert (=> b!432797 (= lt!198528 (+!1421 lt!198525 lt!198536))))

(declare-fun lt!198530 () V!16227)

(assert (=> b!432797 (= lt!198536 (tuple2!7559 (select (arr!12704 _keys!709) from!863) lt!198530))))

(declare-fun get!6320 (ValueCell!5327 V!16227) V!16227)

(declare-fun dynLambda!806 (Int (_ BitVec 64)) V!16227)

(assert (=> b!432797 (= lt!198530 (get!6320 (select (arr!12705 _values!549) from!863) (dynLambda!806 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!254702 () Bool)

(assert (=> start!39908 (=> (not res!254702) (not e!255927))))

(assert (=> start!39908 (= res!254702 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13057 _keys!709))))))

(assert (=> start!39908 e!255927))

(assert (=> start!39908 tp_is_empty!11341))

(assert (=> start!39908 tp!36096))

(assert (=> start!39908 true))

(declare-fun array_inv!9278 (array!26511) Bool)

(assert (=> start!39908 (and (array_inv!9278 _values!549) e!255920)))

(declare-fun array_inv!9279 (array!26509) Bool)

(assert (=> start!39908 (array_inv!9279 _keys!709)))

(declare-fun b!432798 () Bool)

(declare-fun Unit!12781 () Unit!12779)

(assert (=> b!432798 (= e!255925 Unit!12781)))

(declare-fun b!432799 () Bool)

(declare-fun res!254697 () Bool)

(assert (=> b!432799 (=> (not res!254697) (not e!255927))))

(assert (=> b!432799 (= res!254697 (and (= (size!13058 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13057 _keys!709) (size!13058 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!432800 () Bool)

(assert (=> b!432800 (= e!255921 tp_is_empty!11341)))

(declare-fun b!432801 () Bool)

(assert (=> b!432801 (= e!255922 true)))

(assert (=> b!432801 (= lt!198528 (+!1421 (+!1421 lt!198531 lt!198536) lt!198523))))

(declare-fun lt!198535 () Unit!12779)

(declare-fun addCommutativeForDiffKeys!379 (ListLongMap!6461 (_ BitVec 64) V!16227 (_ BitVec 64) V!16227) Unit!12779)

(assert (=> b!432801 (= lt!198535 (addCommutativeForDiffKeys!379 lt!198531 k0!794 v!412 (select (arr!12704 _keys!709) from!863) lt!198530))))

(declare-fun b!432802 () Bool)

(assert (=> b!432802 (= e!255926 e!255919)))

(declare-fun res!254694 () Bool)

(assert (=> b!432802 (=> (not res!254694) (not e!255919))))

(assert (=> b!432802 (= res!254694 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!432802 (= lt!198526 (getCurrentListMapNoExtraKeys!1449 lt!198534 lt!198522 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!432802 (= lt!198522 (array!26512 (store (arr!12705 _values!549) i!563 (ValueCellFull!5327 v!412)) (size!13058 _values!549)))))

(declare-fun lt!198529 () ListLongMap!6461)

(assert (=> b!432802 (= lt!198529 (getCurrentListMapNoExtraKeys!1449 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!432803 () Bool)

(declare-fun res!254705 () Bool)

(assert (=> b!432803 (=> (not res!254705) (not e!255927))))

(assert (=> b!432803 (= res!254705 (validKeyInArray!0 k0!794))))

(declare-fun b!432804 () Bool)

(assert (=> b!432804 (= e!255927 e!255926)))

(declare-fun res!254693 () Bool)

(assert (=> b!432804 (=> (not res!254693) (not e!255926))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26509 (_ BitVec 32)) Bool)

(assert (=> b!432804 (= res!254693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!198534 mask!1025))))

(assert (=> b!432804 (= lt!198534 (array!26510 (store (arr!12704 _keys!709) i!563 k0!794) (size!13057 _keys!709)))))

(declare-fun b!432805 () Bool)

(declare-fun res!254698 () Bool)

(assert (=> b!432805 (=> (not res!254698) (not e!255926))))

(assert (=> b!432805 (= res!254698 (arrayNoDuplicates!0 lt!198534 #b00000000000000000000000000000000 Nil!7548))))

(declare-fun b!432806 () Bool)

(declare-fun res!254704 () Bool)

(assert (=> b!432806 (=> (not res!254704) (not e!255927))))

(assert (=> b!432806 (= res!254704 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!432807 () Bool)

(declare-fun res!254695 () Bool)

(assert (=> b!432807 (=> (not res!254695) (not e!255927))))

(declare-fun arrayContainsKey!0 (array!26509 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!432807 (= res!254695 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!432808 () Bool)

(declare-fun Unit!12782 () Unit!12779)

(assert (=> b!432808 (= e!255925 Unit!12782)))

(declare-fun lt!198533 () Unit!12779)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26509 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12779)

(assert (=> b!432808 (= lt!198533 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!432808 false))

(assert (= (and start!39908 res!254702) b!432794))

(assert (= (and b!432794 res!254700) b!432799))

(assert (= (and b!432799 res!254697) b!432806))

(assert (= (and b!432806 res!254704) b!432790))

(assert (= (and b!432790 res!254699) b!432796))

(assert (= (and b!432796 res!254692) b!432803))

(assert (= (and b!432803 res!254705) b!432789))

(assert (= (and b!432789 res!254703) b!432807))

(assert (= (and b!432807 res!254695) b!432804))

(assert (= (and b!432804 res!254693) b!432805))

(assert (= (and b!432805 res!254698) b!432791))

(assert (= (and b!432791 res!254696) b!432802))

(assert (= (and b!432802 res!254694) b!432792))

(assert (= (and b!432792 (not res!254701)) b!432797))

(assert (= (and b!432797 c!55548) b!432808))

(assert (= (and b!432797 (not c!55548)) b!432798))

(assert (= (and b!432797 (not res!254706)) b!432801))

(assert (= (and b!432795 condMapEmpty!18633) mapIsEmpty!18633))

(assert (= (and b!432795 (not condMapEmpty!18633)) mapNonEmpty!18633))

(get-info :version)

(assert (= (and mapNonEmpty!18633 ((_ is ValueCellFull!5327) mapValue!18633)) b!432793))

(assert (= (and b!432795 ((_ is ValueCellFull!5327) mapDefault!18633)) b!432800))

(assert (= start!39908 b!432795))

(declare-fun b_lambda!9259 () Bool)

(assert (=> (not b_lambda!9259) (not b!432797)))

(declare-fun t!13179 () Bool)

(declare-fun tb!3587 () Bool)

(assert (=> (and start!39908 (= defaultEntry!557 defaultEntry!557) t!13179) tb!3587))

(declare-fun result!6709 () Bool)

(assert (=> tb!3587 (= result!6709 tp_is_empty!11341)))

(assert (=> b!432797 t!13179))

(declare-fun b_and!18013 () Bool)

(assert (= b_and!18011 (and (=> t!13179 result!6709) b_and!18013)))

(declare-fun m!420369 () Bool)

(assert (=> b!432792 m!420369))

(declare-fun m!420371 () Bool)

(assert (=> b!432792 m!420371))

(declare-fun m!420373 () Bool)

(assert (=> b!432792 m!420373))

(assert (=> b!432792 m!420369))

(declare-fun m!420375 () Bool)

(assert (=> b!432792 m!420375))

(declare-fun m!420377 () Bool)

(assert (=> b!432792 m!420377))

(declare-fun m!420379 () Bool)

(assert (=> b!432792 m!420379))

(declare-fun m!420381 () Bool)

(assert (=> b!432794 m!420381))

(declare-fun m!420383 () Bool)

(assert (=> b!432802 m!420383))

(declare-fun m!420385 () Bool)

(assert (=> b!432802 m!420385))

(declare-fun m!420387 () Bool)

(assert (=> b!432802 m!420387))

(declare-fun m!420389 () Bool)

(assert (=> b!432806 m!420389))

(assert (=> b!432797 m!420369))

(declare-fun m!420391 () Bool)

(assert (=> b!432797 m!420391))

(declare-fun m!420393 () Bool)

(assert (=> b!432797 m!420393))

(declare-fun m!420395 () Bool)

(assert (=> b!432797 m!420395))

(assert (=> b!432797 m!420393))

(assert (=> b!432797 m!420391))

(declare-fun m!420397 () Bool)

(assert (=> b!432797 m!420397))

(declare-fun m!420399 () Bool)

(assert (=> start!39908 m!420399))

(declare-fun m!420401 () Bool)

(assert (=> start!39908 m!420401))

(declare-fun m!420403 () Bool)

(assert (=> b!432790 m!420403))

(declare-fun m!420405 () Bool)

(assert (=> b!432807 m!420405))

(declare-fun m!420407 () Bool)

(assert (=> b!432808 m!420407))

(declare-fun m!420409 () Bool)

(assert (=> b!432801 m!420409))

(assert (=> b!432801 m!420409))

(declare-fun m!420411 () Bool)

(assert (=> b!432801 m!420411))

(assert (=> b!432801 m!420369))

(assert (=> b!432801 m!420369))

(declare-fun m!420413 () Bool)

(assert (=> b!432801 m!420413))

(declare-fun m!420415 () Bool)

(assert (=> mapNonEmpty!18633 m!420415))

(declare-fun m!420417 () Bool)

(assert (=> b!432804 m!420417))

(declare-fun m!420419 () Bool)

(assert (=> b!432804 m!420419))

(declare-fun m!420421 () Bool)

(assert (=> b!432805 m!420421))

(declare-fun m!420423 () Bool)

(assert (=> b!432803 m!420423))

(declare-fun m!420425 () Bool)

(assert (=> b!432789 m!420425))

(check-sat tp_is_empty!11341 (not b!432802) (not b!432794) (not b!432797) (not b_next!10189) (not b!432804) (not b!432806) (not b!432807) (not b!432792) (not b!432808) (not start!39908) (not b!432805) (not b!432790) b_and!18013 (not mapNonEmpty!18633) (not b!432803) (not b_lambda!9259) (not b!432801))
(check-sat b_and!18013 (not b_next!10189))
