; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39906 () Bool)

(assert start!39906)

(declare-fun b_free!10173 () Bool)

(declare-fun b_next!10173 () Bool)

(assert (=> start!39906 (= b_free!10173 (not b_next!10173))))

(declare-fun tp!36048 () Bool)

(declare-fun b_and!18005 () Bool)

(assert (=> start!39906 (= tp!36048 b_and!18005)))

(declare-fun b!432564 () Bool)

(declare-fun e!255861 () Bool)

(declare-fun tp_is_empty!11325 () Bool)

(assert (=> b!432564 (= e!255861 tp_is_empty!11325)))

(declare-fun b!432565 () Bool)

(declare-fun res!254475 () Bool)

(declare-fun e!255854 () Bool)

(assert (=> b!432565 (=> (not res!254475) (not e!255854))))

(declare-datatypes ((array!26483 0))(
  ( (array!26484 (arr!12691 (Array (_ BitVec 32) (_ BitVec 64))) (size!13043 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26483)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26483 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!432565 (= res!254475 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!432566 () Bool)

(declare-datatypes ((Unit!12779 0))(
  ( (Unit!12780) )
))
(declare-fun e!255859 () Unit!12779)

(declare-fun Unit!12781 () Unit!12779)

(assert (=> b!432566 (= e!255859 Unit!12781)))

(declare-fun lt!198404 () Unit!12779)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26483 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12779)

(assert (=> b!432566 (= lt!198404 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!432566 false))

(declare-fun b!432567 () Bool)

(declare-fun e!255856 () Bool)

(declare-fun e!255855 () Bool)

(assert (=> b!432567 (= e!255856 e!255855)))

(declare-fun res!254461 () Bool)

(assert (=> b!432567 (=> (not res!254461) (not e!255855))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!432567 (= res!254461 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16205 0))(
  ( (V!16206 (val!5707 Int)) )
))
(declare-datatypes ((tuple2!7532 0))(
  ( (tuple2!7533 (_1!3777 (_ BitVec 64)) (_2!3777 V!16205)) )
))
(declare-datatypes ((List!7547 0))(
  ( (Nil!7544) (Cons!7543 (h!8399 tuple2!7532) (t!13169 List!7547)) )
))
(declare-datatypes ((ListLongMap!6445 0))(
  ( (ListLongMap!6446 (toList!3238 List!7547)) )
))
(declare-fun lt!198409 () ListLongMap!6445)

(declare-fun minValue!515 () V!16205)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16205)

(declare-datatypes ((ValueCell!5319 0))(
  ( (ValueCellFull!5319 (v!7954 V!16205)) (EmptyCell!5319) )
))
(declare-datatypes ((array!26485 0))(
  ( (array!26486 (arr!12692 (Array (_ BitVec 32) ValueCell!5319)) (size!13044 (_ BitVec 32))) )
))
(declare-fun lt!198401 () array!26485)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!198398 () array!26483)

(declare-fun getCurrentListMapNoExtraKeys!1436 (array!26483 array!26485 (_ BitVec 32) (_ BitVec 32) V!16205 V!16205 (_ BitVec 32) Int) ListLongMap!6445)

(assert (=> b!432567 (= lt!198409 (getCurrentListMapNoExtraKeys!1436 lt!198398 lt!198401 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26485)

(declare-fun v!412 () V!16205)

(assert (=> b!432567 (= lt!198401 (array!26486 (store (arr!12692 _values!549) i!563 (ValueCellFull!5319 v!412)) (size!13044 _values!549)))))

(declare-fun lt!198408 () ListLongMap!6445)

(assert (=> b!432567 (= lt!198408 (getCurrentListMapNoExtraKeys!1436 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!432568 () Bool)

(declare-fun res!254471 () Bool)

(assert (=> b!432568 (=> (not res!254471) (not e!255856))))

(declare-datatypes ((List!7548 0))(
  ( (Nil!7545) (Cons!7544 (h!8400 (_ BitVec 64)) (t!13170 List!7548)) )
))
(declare-fun arrayNoDuplicates!0 (array!26483 (_ BitVec 32) List!7548) Bool)

(assert (=> b!432568 (= res!254471 (arrayNoDuplicates!0 lt!198398 #b00000000000000000000000000000000 Nil!7545))))

(declare-fun b!432569 () Bool)

(declare-fun res!254462 () Bool)

(assert (=> b!432569 (=> (not res!254462) (not e!255854))))

(assert (=> b!432569 (= res!254462 (and (= (size!13044 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13043 _keys!709) (size!13044 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!432570 () Bool)

(declare-fun res!254468 () Bool)

(assert (=> b!432570 (=> (not res!254468) (not e!255856))))

(assert (=> b!432570 (= res!254468 (bvsle from!863 i!563))))

(declare-fun b!432571 () Bool)

(declare-fun e!255857 () Bool)

(assert (=> b!432571 (= e!255855 (not e!255857))))

(declare-fun res!254473 () Bool)

(assert (=> b!432571 (=> res!254473 e!255857)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!432571 (= res!254473 (not (validKeyInArray!0 (select (arr!12691 _keys!709) from!863))))))

(declare-fun lt!198396 () ListLongMap!6445)

(declare-fun lt!198397 () ListLongMap!6445)

(assert (=> b!432571 (= lt!198396 lt!198397)))

(declare-fun lt!198405 () ListLongMap!6445)

(declare-fun lt!198399 () tuple2!7532)

(declare-fun +!1386 (ListLongMap!6445 tuple2!7532) ListLongMap!6445)

(assert (=> b!432571 (= lt!198397 (+!1386 lt!198405 lt!198399))))

(assert (=> b!432571 (= lt!198396 (getCurrentListMapNoExtraKeys!1436 lt!198398 lt!198401 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!432571 (= lt!198399 (tuple2!7533 k0!794 v!412))))

(assert (=> b!432571 (= lt!198405 (getCurrentListMapNoExtraKeys!1436 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!198407 () Unit!12779)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!570 (array!26483 array!26485 (_ BitVec 32) (_ BitVec 32) V!16205 V!16205 (_ BitVec 32) (_ BitVec 64) V!16205 (_ BitVec 32) Int) Unit!12779)

(assert (=> b!432571 (= lt!198407 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!570 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!18609 () Bool)

(declare-fun mapRes!18609 () Bool)

(declare-fun tp!36047 () Bool)

(assert (=> mapNonEmpty!18609 (= mapRes!18609 (and tp!36047 e!255861))))

(declare-fun mapRest!18609 () (Array (_ BitVec 32) ValueCell!5319))

(declare-fun mapValue!18609 () ValueCell!5319)

(declare-fun mapKey!18609 () (_ BitVec 32))

(assert (=> mapNonEmpty!18609 (= (arr!12692 _values!549) (store mapRest!18609 mapKey!18609 mapValue!18609))))

(declare-fun b!432572 () Bool)

(declare-fun res!254467 () Bool)

(assert (=> b!432572 (=> (not res!254467) (not e!255854))))

(assert (=> b!432572 (= res!254467 (or (= (select (arr!12691 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12691 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!432573 () Bool)

(declare-fun e!255858 () Bool)

(assert (=> b!432573 (= e!255858 true)))

(declare-fun lt!198403 () ListLongMap!6445)

(declare-fun lt!198402 () tuple2!7532)

(assert (=> b!432573 (= lt!198403 (+!1386 (+!1386 lt!198405 lt!198402) lt!198399))))

(declare-fun lt!198406 () V!16205)

(declare-fun lt!198400 () Unit!12779)

(declare-fun addCommutativeForDiffKeys!376 (ListLongMap!6445 (_ BitVec 64) V!16205 (_ BitVec 64) V!16205) Unit!12779)

(assert (=> b!432573 (= lt!198400 (addCommutativeForDiffKeys!376 lt!198405 k0!794 v!412 (select (arr!12691 _keys!709) from!863) lt!198406))))

(declare-fun b!432574 () Bool)

(declare-fun res!254465 () Bool)

(assert (=> b!432574 (=> (not res!254465) (not e!255854))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26483 (_ BitVec 32)) Bool)

(assert (=> b!432574 (= res!254465 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!432575 () Bool)

(declare-fun e!255853 () Bool)

(declare-fun e!255852 () Bool)

(assert (=> b!432575 (= e!255853 (and e!255852 mapRes!18609))))

(declare-fun condMapEmpty!18609 () Bool)

(declare-fun mapDefault!18609 () ValueCell!5319)

(assert (=> b!432575 (= condMapEmpty!18609 (= (arr!12692 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5319)) mapDefault!18609)))))

(declare-fun b!432576 () Bool)

(declare-fun Unit!12782 () Unit!12779)

(assert (=> b!432576 (= e!255859 Unit!12782)))

(declare-fun b!432578 () Bool)

(assert (=> b!432578 (= e!255852 tp_is_empty!11325)))

(declare-fun b!432579 () Bool)

(declare-fun res!254470 () Bool)

(assert (=> b!432579 (=> (not res!254470) (not e!255854))))

(assert (=> b!432579 (= res!254470 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7545))))

(declare-fun b!432580 () Bool)

(declare-fun res!254463 () Bool)

(assert (=> b!432580 (=> (not res!254463) (not e!255854))))

(assert (=> b!432580 (= res!254463 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13043 _keys!709))))))

(declare-fun b!432581 () Bool)

(assert (=> b!432581 (= e!255857 e!255858)))

(declare-fun res!254464 () Bool)

(assert (=> b!432581 (=> res!254464 e!255858)))

(assert (=> b!432581 (= res!254464 (= k0!794 (select (arr!12691 _keys!709) from!863)))))

(assert (=> b!432581 (not (= (select (arr!12691 _keys!709) from!863) k0!794))))

(declare-fun lt!198410 () Unit!12779)

(assert (=> b!432581 (= lt!198410 e!255859)))

(declare-fun c!55595 () Bool)

(assert (=> b!432581 (= c!55595 (= (select (arr!12691 _keys!709) from!863) k0!794))))

(assert (=> b!432581 (= lt!198409 lt!198403)))

(assert (=> b!432581 (= lt!198403 (+!1386 lt!198397 lt!198402))))

(assert (=> b!432581 (= lt!198402 (tuple2!7533 (select (arr!12691 _keys!709) from!863) lt!198406))))

(declare-fun get!6309 (ValueCell!5319 V!16205) V!16205)

(declare-fun dynLambda!804 (Int (_ BitVec 64)) V!16205)

(assert (=> b!432581 (= lt!198406 (get!6309 (select (arr!12692 _values!549) from!863) (dynLambda!804 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!432582 () Bool)

(declare-fun res!254472 () Bool)

(assert (=> b!432582 (=> (not res!254472) (not e!255854))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!432582 (= res!254472 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!18609 () Bool)

(assert (=> mapIsEmpty!18609 mapRes!18609))

(declare-fun b!432583 () Bool)

(assert (=> b!432583 (= e!255854 e!255856)))

(declare-fun res!254469 () Bool)

(assert (=> b!432583 (=> (not res!254469) (not e!255856))))

(assert (=> b!432583 (= res!254469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!198398 mask!1025))))

(assert (=> b!432583 (= lt!198398 (array!26484 (store (arr!12691 _keys!709) i!563 k0!794) (size!13043 _keys!709)))))

(declare-fun res!254474 () Bool)

(assert (=> start!39906 (=> (not res!254474) (not e!255854))))

(assert (=> start!39906 (= res!254474 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13043 _keys!709))))))

(assert (=> start!39906 e!255854))

(assert (=> start!39906 tp_is_empty!11325))

(assert (=> start!39906 tp!36048))

(assert (=> start!39906 true))

(declare-fun array_inv!9232 (array!26485) Bool)

(assert (=> start!39906 (and (array_inv!9232 _values!549) e!255853)))

(declare-fun array_inv!9233 (array!26483) Bool)

(assert (=> start!39906 (array_inv!9233 _keys!709)))

(declare-fun b!432577 () Bool)

(declare-fun res!254466 () Bool)

(assert (=> b!432577 (=> (not res!254466) (not e!255854))))

(assert (=> b!432577 (= res!254466 (validKeyInArray!0 k0!794))))

(assert (= (and start!39906 res!254474) b!432582))

(assert (= (and b!432582 res!254472) b!432569))

(assert (= (and b!432569 res!254462) b!432574))

(assert (= (and b!432574 res!254465) b!432579))

(assert (= (and b!432579 res!254470) b!432580))

(assert (= (and b!432580 res!254463) b!432577))

(assert (= (and b!432577 res!254466) b!432572))

(assert (= (and b!432572 res!254467) b!432565))

(assert (= (and b!432565 res!254475) b!432583))

(assert (= (and b!432583 res!254469) b!432568))

(assert (= (and b!432568 res!254471) b!432570))

(assert (= (and b!432570 res!254468) b!432567))

(assert (= (and b!432567 res!254461) b!432571))

(assert (= (and b!432571 (not res!254473)) b!432581))

(assert (= (and b!432581 c!55595) b!432566))

(assert (= (and b!432581 (not c!55595)) b!432576))

(assert (= (and b!432581 (not res!254464)) b!432573))

(assert (= (and b!432575 condMapEmpty!18609) mapIsEmpty!18609))

(assert (= (and b!432575 (not condMapEmpty!18609)) mapNonEmpty!18609))

(get-info :version)

(assert (= (and mapNonEmpty!18609 ((_ is ValueCellFull!5319) mapValue!18609)) b!432564))

(assert (= (and b!432575 ((_ is ValueCellFull!5319) mapDefault!18609)) b!432578))

(assert (= start!39906 b!432575))

(declare-fun b_lambda!9261 () Bool)

(assert (=> (not b_lambda!9261) (not b!432581)))

(declare-fun t!13168 () Bool)

(declare-fun tb!3579 () Bool)

(assert (=> (and start!39906 (= defaultEntry!557 defaultEntry!557) t!13168) tb!3579))

(declare-fun result!6685 () Bool)

(assert (=> tb!3579 (= result!6685 tp_is_empty!11325)))

(assert (=> b!432581 t!13168))

(declare-fun b_and!18007 () Bool)

(assert (= b_and!18005 (and (=> t!13168 result!6685) b_and!18007)))

(declare-fun m!420637 () Bool)

(assert (=> b!432565 m!420637))

(declare-fun m!420639 () Bool)

(assert (=> b!432566 m!420639))

(declare-fun m!420641 () Bool)

(assert (=> b!432571 m!420641))

(declare-fun m!420643 () Bool)

(assert (=> b!432571 m!420643))

(declare-fun m!420645 () Bool)

(assert (=> b!432571 m!420645))

(assert (=> b!432571 m!420641))

(declare-fun m!420647 () Bool)

(assert (=> b!432571 m!420647))

(declare-fun m!420649 () Bool)

(assert (=> b!432571 m!420649))

(declare-fun m!420651 () Bool)

(assert (=> b!432571 m!420651))

(declare-fun m!420653 () Bool)

(assert (=> b!432574 m!420653))

(declare-fun m!420655 () Bool)

(assert (=> b!432583 m!420655))

(declare-fun m!420657 () Bool)

(assert (=> b!432583 m!420657))

(declare-fun m!420659 () Bool)

(assert (=> b!432579 m!420659))

(declare-fun m!420661 () Bool)

(assert (=> b!432582 m!420661))

(declare-fun m!420663 () Bool)

(assert (=> b!432573 m!420663))

(assert (=> b!432573 m!420663))

(declare-fun m!420665 () Bool)

(assert (=> b!432573 m!420665))

(assert (=> b!432573 m!420641))

(assert (=> b!432573 m!420641))

(declare-fun m!420667 () Bool)

(assert (=> b!432573 m!420667))

(declare-fun m!420669 () Bool)

(assert (=> start!39906 m!420669))

(declare-fun m!420671 () Bool)

(assert (=> start!39906 m!420671))

(declare-fun m!420673 () Bool)

(assert (=> b!432568 m!420673))

(declare-fun m!420675 () Bool)

(assert (=> b!432577 m!420675))

(declare-fun m!420677 () Bool)

(assert (=> b!432567 m!420677))

(declare-fun m!420679 () Bool)

(assert (=> b!432567 m!420679))

(declare-fun m!420681 () Bool)

(assert (=> b!432567 m!420681))

(assert (=> b!432581 m!420641))

(declare-fun m!420683 () Bool)

(assert (=> b!432581 m!420683))

(declare-fun m!420685 () Bool)

(assert (=> b!432581 m!420685))

(declare-fun m!420687 () Bool)

(assert (=> b!432581 m!420687))

(assert (=> b!432581 m!420685))

(assert (=> b!432581 m!420683))

(declare-fun m!420689 () Bool)

(assert (=> b!432581 m!420689))

(declare-fun m!420691 () Bool)

(assert (=> b!432572 m!420691))

(declare-fun m!420693 () Bool)

(assert (=> mapNonEmpty!18609 m!420693))

(check-sat (not b!432577) (not b!432579) (not b!432573) (not b!432581) (not b!432571) (not b!432582) (not b_next!10173) (not b!432566) (not b_lambda!9261) (not b!432574) (not b!432583) (not start!39906) (not b!432565) (not mapNonEmpty!18609) (not b!432568) (not b!432567) b_and!18007 tp_is_empty!11325)
(check-sat b_and!18007 (not b_next!10173))
