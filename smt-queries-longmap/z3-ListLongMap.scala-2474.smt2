; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38664 () Bool)

(assert start!38664)

(declare-fun b_free!9201 () Bool)

(declare-fun b_next!9201 () Bool)

(assert (=> start!38664 (= b_free!9201 (not b_next!9201))))

(declare-fun tp!32726 () Bool)

(declare-fun b_and!16587 () Bool)

(assert (=> start!38664 (= tp!32726 b_and!16587)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun b!401584 () Bool)

(declare-datatypes ((V!14549 0))(
  ( (V!14550 (val!5086 Int)) )
))
(declare-fun v!412 () V!14549)

(declare-datatypes ((tuple2!6750 0))(
  ( (tuple2!6751 (_1!3386 (_ BitVec 64)) (_2!3386 V!14549)) )
))
(declare-datatypes ((List!6674 0))(
  ( (Nil!6671) (Cons!6670 (h!7526 tuple2!6750) (t!11848 List!6674)) )
))
(declare-datatypes ((ListLongMap!5663 0))(
  ( (ListLongMap!5664 (toList!2847 List!6674)) )
))
(declare-fun call!28268 () ListLongMap!5663)

(declare-fun e!242115 () Bool)

(declare-fun call!28267 () ListLongMap!5663)

(declare-fun +!1130 (ListLongMap!5663 tuple2!6750) ListLongMap!5663)

(assert (=> b!401584 (= e!242115 (= call!28267 (+!1130 call!28268 (tuple2!6751 k0!794 v!412))))))

(declare-fun b!401585 () Bool)

(declare-fun e!242118 () Bool)

(declare-fun tp_is_empty!10083 () Bool)

(assert (=> b!401585 (= e!242118 tp_is_empty!10083)))

(declare-fun b!401587 () Bool)

(declare-fun res!231196 () Bool)

(declare-fun e!242116 () Bool)

(assert (=> b!401587 (=> (not res!231196) (not e!242116))))

(declare-datatypes ((array!24073 0))(
  ( (array!24074 (arr!11486 (Array (_ BitVec 32) (_ BitVec 64))) (size!11838 (_ BitVec 32))) )
))
(declare-fun lt!187828 () array!24073)

(declare-datatypes ((List!6675 0))(
  ( (Nil!6672) (Cons!6671 (h!7527 (_ BitVec 64)) (t!11849 List!6675)) )
))
(declare-fun arrayNoDuplicates!0 (array!24073 (_ BitVec 32) List!6675) Bool)

(assert (=> b!401587 (= res!231196 (arrayNoDuplicates!0 lt!187828 #b00000000000000000000000000000000 Nil!6672))))

(declare-fun b!401588 () Bool)

(declare-fun e!242117 () Bool)

(assert (=> b!401588 (= e!242117 tp_is_empty!10083)))

(declare-fun b!401589 () Bool)

(declare-fun res!231194 () Bool)

(declare-fun e!242113 () Bool)

(assert (=> b!401589 (=> (not res!231194) (not e!242113))))

(declare-fun _keys!709 () array!24073)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4698 0))(
  ( (ValueCellFull!4698 (v!7333 V!14549)) (EmptyCell!4698) )
))
(declare-datatypes ((array!24075 0))(
  ( (array!24076 (arr!11487 (Array (_ BitVec 32) ValueCell!4698)) (size!11839 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24075)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!401589 (= res!231194 (and (= (size!11839 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11838 _keys!709) (size!11839 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!401590 () Bool)

(declare-fun res!231199 () Bool)

(assert (=> b!401590 (=> (not res!231199) (not e!242116))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!401590 (= res!231199 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11838 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!515 () V!14549)

(declare-fun bm!28264 () Bool)

(declare-fun minValue!515 () V!14549)

(declare-fun c!54758 () Bool)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1059 (array!24073 array!24075 (_ BitVec 32) (_ BitVec 32) V!14549 V!14549 (_ BitVec 32) Int) ListLongMap!5663)

(assert (=> bm!28264 (= call!28267 (getCurrentListMapNoExtraKeys!1059 (ite c!54758 lt!187828 _keys!709) (ite c!54758 (array!24076 (store (arr!11487 _values!549) i!563 (ValueCellFull!4698 v!412)) (size!11839 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401591 () Bool)

(declare-fun res!231195 () Bool)

(assert (=> b!401591 (=> (not res!231195) (not e!242113))))

(declare-fun arrayContainsKey!0 (array!24073 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!401591 (= res!231195 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!401592 () Bool)

(assert (=> b!401592 (= e!242116 (not true))))

(assert (=> b!401592 e!242115))

(assert (=> b!401592 (= c!54758 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12162 0))(
  ( (Unit!12163) )
))
(declare-fun lt!187829 () Unit!12162)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!339 (array!24073 array!24075 (_ BitVec 32) (_ BitVec 32) V!14549 V!14549 (_ BitVec 32) (_ BitVec 64) V!14549 (_ BitVec 32) Int) Unit!12162)

(assert (=> b!401592 (= lt!187829 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!339 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!16746 () Bool)

(declare-fun mapRes!16746 () Bool)

(assert (=> mapIsEmpty!16746 mapRes!16746))

(declare-fun b!401593 () Bool)

(declare-fun res!231191 () Bool)

(assert (=> b!401593 (=> (not res!231191) (not e!242113))))

(assert (=> b!401593 (= res!231191 (or (= (select (arr!11486 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11486 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16746 () Bool)

(declare-fun tp!32727 () Bool)

(assert (=> mapNonEmpty!16746 (= mapRes!16746 (and tp!32727 e!242118))))

(declare-fun mapRest!16746 () (Array (_ BitVec 32) ValueCell!4698))

(declare-fun mapValue!16746 () ValueCell!4698)

(declare-fun mapKey!16746 () (_ BitVec 32))

(assert (=> mapNonEmpty!16746 (= (arr!11487 _values!549) (store mapRest!16746 mapKey!16746 mapValue!16746))))

(declare-fun b!401586 () Bool)

(declare-fun res!231193 () Bool)

(assert (=> b!401586 (=> (not res!231193) (not e!242113))))

(assert (=> b!401586 (= res!231193 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6672))))

(declare-fun res!231197 () Bool)

(assert (=> start!38664 (=> (not res!231197) (not e!242113))))

(assert (=> start!38664 (= res!231197 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11838 _keys!709))))))

(assert (=> start!38664 e!242113))

(assert (=> start!38664 tp_is_empty!10083))

(assert (=> start!38664 tp!32726))

(assert (=> start!38664 true))

(declare-fun e!242114 () Bool)

(declare-fun array_inv!8408 (array!24075) Bool)

(assert (=> start!38664 (and (array_inv!8408 _values!549) e!242114)))

(declare-fun array_inv!8409 (array!24073) Bool)

(assert (=> start!38664 (array_inv!8409 _keys!709)))

(declare-fun b!401594 () Bool)

(assert (=> b!401594 (= e!242114 (and e!242117 mapRes!16746))))

(declare-fun condMapEmpty!16746 () Bool)

(declare-fun mapDefault!16746 () ValueCell!4698)

(assert (=> b!401594 (= condMapEmpty!16746 (= (arr!11487 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4698)) mapDefault!16746)))))

(declare-fun b!401595 () Bool)

(declare-fun res!231201 () Bool)

(assert (=> b!401595 (=> (not res!231201) (not e!242113))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!401595 (= res!231201 (validKeyInArray!0 k0!794))))

(declare-fun b!401596 () Bool)

(assert (=> b!401596 (= e!242115 (= call!28268 call!28267))))

(declare-fun b!401597 () Bool)

(declare-fun res!231192 () Bool)

(assert (=> b!401597 (=> (not res!231192) (not e!242113))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!401597 (= res!231192 (validMask!0 mask!1025))))

(declare-fun b!401598 () Bool)

(declare-fun res!231198 () Bool)

(assert (=> b!401598 (=> (not res!231198) (not e!242113))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24073 (_ BitVec 32)) Bool)

(assert (=> b!401598 (= res!231198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!401599 () Bool)

(assert (=> b!401599 (= e!242113 e!242116)))

(declare-fun res!231190 () Bool)

(assert (=> b!401599 (=> (not res!231190) (not e!242116))))

(assert (=> b!401599 (= res!231190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187828 mask!1025))))

(assert (=> b!401599 (= lt!187828 (array!24074 (store (arr!11486 _keys!709) i!563 k0!794) (size!11838 _keys!709)))))

(declare-fun bm!28265 () Bool)

(assert (=> bm!28265 (= call!28268 (getCurrentListMapNoExtraKeys!1059 (ite c!54758 _keys!709 lt!187828) (ite c!54758 _values!549 (array!24076 (store (arr!11487 _values!549) i!563 (ValueCellFull!4698 v!412)) (size!11839 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401600 () Bool)

(declare-fun res!231200 () Bool)

(assert (=> b!401600 (=> (not res!231200) (not e!242113))))

(assert (=> b!401600 (= res!231200 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11838 _keys!709))))))

(assert (= (and start!38664 res!231197) b!401597))

(assert (= (and b!401597 res!231192) b!401589))

(assert (= (and b!401589 res!231194) b!401598))

(assert (= (and b!401598 res!231198) b!401586))

(assert (= (and b!401586 res!231193) b!401600))

(assert (= (and b!401600 res!231200) b!401595))

(assert (= (and b!401595 res!231201) b!401593))

(assert (= (and b!401593 res!231191) b!401591))

(assert (= (and b!401591 res!231195) b!401599))

(assert (= (and b!401599 res!231190) b!401587))

(assert (= (and b!401587 res!231196) b!401590))

(assert (= (and b!401590 res!231199) b!401592))

(assert (= (and b!401592 c!54758) b!401584))

(assert (= (and b!401592 (not c!54758)) b!401596))

(assert (= (or b!401584 b!401596) bm!28264))

(assert (= (or b!401584 b!401596) bm!28265))

(assert (= (and b!401594 condMapEmpty!16746) mapIsEmpty!16746))

(assert (= (and b!401594 (not condMapEmpty!16746)) mapNonEmpty!16746))

(get-info :version)

(assert (= (and mapNonEmpty!16746 ((_ is ValueCellFull!4698) mapValue!16746)) b!401585))

(assert (= (and b!401594 ((_ is ValueCellFull!4698) mapDefault!16746)) b!401588))

(assert (= start!38664 b!401594))

(declare-fun m!395393 () Bool)

(assert (=> bm!28265 m!395393))

(declare-fun m!395395 () Bool)

(assert (=> bm!28265 m!395395))

(declare-fun m!395397 () Bool)

(assert (=> b!401592 m!395397))

(declare-fun m!395399 () Bool)

(assert (=> b!401591 m!395399))

(declare-fun m!395401 () Bool)

(assert (=> b!401595 m!395401))

(declare-fun m!395403 () Bool)

(assert (=> b!401587 m!395403))

(declare-fun m!395405 () Bool)

(assert (=> mapNonEmpty!16746 m!395405))

(declare-fun m!395407 () Bool)

(assert (=> b!401599 m!395407))

(declare-fun m!395409 () Bool)

(assert (=> b!401599 m!395409))

(declare-fun m!395411 () Bool)

(assert (=> b!401586 m!395411))

(declare-fun m!395413 () Bool)

(assert (=> b!401598 m!395413))

(declare-fun m!395415 () Bool)

(assert (=> start!38664 m!395415))

(declare-fun m!395417 () Bool)

(assert (=> start!38664 m!395417))

(declare-fun m!395419 () Bool)

(assert (=> b!401597 m!395419))

(declare-fun m!395421 () Bool)

(assert (=> b!401593 m!395421))

(declare-fun m!395423 () Bool)

(assert (=> b!401584 m!395423))

(assert (=> bm!28264 m!395393))

(declare-fun m!395425 () Bool)

(assert (=> bm!28264 m!395425))

(check-sat (not bm!28264) (not mapNonEmpty!16746) (not b!401587) (not b!401598) (not b!401597) (not b!401595) tp_is_empty!10083 (not b!401592) (not bm!28265) (not b!401586) (not b!401584) b_and!16587 (not b_next!9201) (not b!401591) (not b!401599) (not start!38664))
(check-sat b_and!16587 (not b_next!9201))
