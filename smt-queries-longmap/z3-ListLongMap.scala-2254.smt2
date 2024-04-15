; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36972 () Bool)

(assert start!36972)

(declare-fun b_free!8113 () Bool)

(declare-fun b_next!8113 () Bool)

(assert (=> start!36972 (= b_free!8113 (not b_next!8113))))

(declare-fun tp!29055 () Bool)

(declare-fun b_and!15329 () Bool)

(assert (=> start!36972 (= tp!29055 b_and!15329)))

(declare-fun b!370972 () Bool)

(declare-fun res!208511 () Bool)

(declare-fun e!226457 () Bool)

(assert (=> b!370972 (=> (not res!208511) (not e!226457))))

(declare-datatypes ((array!21447 0))(
  ( (array!21448 (arr!10192 (Array (_ BitVec 32) (_ BitVec 64))) (size!10545 (_ BitVec 32))) )
))
(declare-fun lt!169978 () array!21447)

(declare-datatypes ((List!5677 0))(
  ( (Nil!5674) (Cons!5673 (h!6529 (_ BitVec 64)) (t!10818 List!5677)) )
))
(declare-fun arrayNoDuplicates!0 (array!21447 (_ BitVec 32) List!5677) Bool)

(assert (=> b!370972 (= res!208511 (arrayNoDuplicates!0 lt!169978 #b00000000000000000000000000000000 Nil!5674))))

(declare-fun b!370973 () Bool)

(declare-fun res!208518 () Bool)

(declare-fun e!226455 () Bool)

(assert (=> b!370973 (=> (not res!208518) (not e!226455))))

(declare-fun _keys!658 () array!21447)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21447 (_ BitVec 32)) Bool)

(assert (=> b!370973 (= res!208518 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!14706 () Bool)

(declare-fun mapRes!14706 () Bool)

(declare-fun tp!29054 () Bool)

(declare-fun e!226453 () Bool)

(assert (=> mapNonEmpty!14706 (= mapRes!14706 (and tp!29054 e!226453))))

(declare-datatypes ((V!12787 0))(
  ( (V!12788 (val!4425 Int)) )
))
(declare-datatypes ((ValueCell!4037 0))(
  ( (ValueCellFull!4037 (v!6616 V!12787)) (EmptyCell!4037) )
))
(declare-fun mapValue!14706 () ValueCell!4037)

(declare-datatypes ((array!21449 0))(
  ( (array!21450 (arr!10193 (Array (_ BitVec 32) ValueCell!4037)) (size!10546 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21449)

(declare-fun mapKey!14706 () (_ BitVec 32))

(declare-fun mapRest!14706 () (Array (_ BitVec 32) ValueCell!4037))

(assert (=> mapNonEmpty!14706 (= (arr!10193 _values!506) (store mapRest!14706 mapKey!14706 mapValue!14706))))

(declare-fun b!370974 () Bool)

(declare-fun res!208517 () Bool)

(assert (=> b!370974 (=> (not res!208517) (not e!226455))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!370974 (= res!208517 (validKeyInArray!0 k0!778))))

(declare-fun b!370975 () Bool)

(assert (=> b!370975 (= e!226455 e!226457)))

(declare-fun res!208519 () Bool)

(assert (=> b!370975 (=> (not res!208519) (not e!226457))))

(assert (=> b!370975 (= res!208519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169978 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!370975 (= lt!169978 (array!21448 (store (arr!10192 _keys!658) i!548 k0!778) (size!10545 _keys!658)))))

(declare-fun b!370976 () Bool)

(assert (=> b!370976 (= e!226457 (not true))))

(declare-datatypes ((tuple2!5844 0))(
  ( (tuple2!5845 (_1!2933 (_ BitVec 64)) (_2!2933 V!12787)) )
))
(declare-datatypes ((List!5678 0))(
  ( (Nil!5675) (Cons!5674 (h!6530 tuple2!5844) (t!10819 List!5678)) )
))
(declare-datatypes ((ListLongMap!4747 0))(
  ( (ListLongMap!4748 (toList!2389 List!5678)) )
))
(declare-fun lt!169979 () ListLongMap!4747)

(declare-fun lt!169976 () ListLongMap!4747)

(assert (=> b!370976 (and (= lt!169979 lt!169976) (= lt!169976 lt!169979))))

(declare-fun v!373 () V!12787)

(declare-fun lt!169977 () ListLongMap!4747)

(declare-fun +!757 (ListLongMap!4747 tuple2!5844) ListLongMap!4747)

(assert (=> b!370976 (= lt!169976 (+!757 lt!169977 (tuple2!5845 k0!778 v!373)))))

(declare-fun zeroValue!472 () V!12787)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((Unit!11390 0))(
  ( (Unit!11391) )
))
(declare-fun lt!169980 () Unit!11390)

(declare-fun minValue!472 () V!12787)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!8 (array!21447 array!21449 (_ BitVec 32) (_ BitVec 32) V!12787 V!12787 (_ BitVec 32) (_ BitVec 64) V!12787 (_ BitVec 32) Int) Unit!11390)

(assert (=> b!370976 (= lt!169980 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!8 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!680 (array!21447 array!21449 (_ BitVec 32) (_ BitVec 32) V!12787 V!12787 (_ BitVec 32) Int) ListLongMap!4747)

(assert (=> b!370976 (= lt!169979 (getCurrentListMapNoExtraKeys!680 lt!169978 (array!21450 (store (arr!10193 _values!506) i!548 (ValueCellFull!4037 v!373)) (size!10546 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!370976 (= lt!169977 (getCurrentListMapNoExtraKeys!680 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapIsEmpty!14706 () Bool)

(assert (=> mapIsEmpty!14706 mapRes!14706))

(declare-fun b!370977 () Bool)

(declare-fun tp_is_empty!8761 () Bool)

(assert (=> b!370977 (= e!226453 tp_is_empty!8761)))

(declare-fun b!370978 () Bool)

(declare-fun res!208520 () Bool)

(assert (=> b!370978 (=> (not res!208520) (not e!226455))))

(assert (=> b!370978 (= res!208520 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5674))))

(declare-fun b!370979 () Bool)

(declare-fun res!208516 () Bool)

(assert (=> b!370979 (=> (not res!208516) (not e!226455))))

(assert (=> b!370979 (= res!208516 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10545 _keys!658))))))

(declare-fun b!370980 () Bool)

(declare-fun res!208514 () Bool)

(assert (=> b!370980 (=> (not res!208514) (not e!226455))))

(assert (=> b!370980 (= res!208514 (and (= (size!10546 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10545 _keys!658) (size!10546 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!370981 () Bool)

(declare-fun res!208512 () Bool)

(assert (=> b!370981 (=> (not res!208512) (not e!226455))))

(assert (=> b!370981 (= res!208512 (or (= (select (arr!10192 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10192 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!208515 () Bool)

(assert (=> start!36972 (=> (not res!208515) (not e!226455))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36972 (= res!208515 (validMask!0 mask!970))))

(assert (=> start!36972 e!226455))

(declare-fun e!226454 () Bool)

(declare-fun array_inv!7538 (array!21449) Bool)

(assert (=> start!36972 (and (array_inv!7538 _values!506) e!226454)))

(assert (=> start!36972 tp!29055))

(assert (=> start!36972 true))

(assert (=> start!36972 tp_is_empty!8761))

(declare-fun array_inv!7539 (array!21447) Bool)

(assert (=> start!36972 (array_inv!7539 _keys!658)))

(declare-fun b!370982 () Bool)

(declare-fun res!208513 () Bool)

(assert (=> b!370982 (=> (not res!208513) (not e!226455))))

(declare-fun arrayContainsKey!0 (array!21447 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!370982 (= res!208513 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!370983 () Bool)

(declare-fun e!226456 () Bool)

(assert (=> b!370983 (= e!226456 tp_is_empty!8761)))

(declare-fun b!370984 () Bool)

(assert (=> b!370984 (= e!226454 (and e!226456 mapRes!14706))))

(declare-fun condMapEmpty!14706 () Bool)

(declare-fun mapDefault!14706 () ValueCell!4037)

(assert (=> b!370984 (= condMapEmpty!14706 (= (arr!10193 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4037)) mapDefault!14706)))))

(assert (= (and start!36972 res!208515) b!370980))

(assert (= (and b!370980 res!208514) b!370973))

(assert (= (and b!370973 res!208518) b!370978))

(assert (= (and b!370978 res!208520) b!370979))

(assert (= (and b!370979 res!208516) b!370974))

(assert (= (and b!370974 res!208517) b!370981))

(assert (= (and b!370981 res!208512) b!370982))

(assert (= (and b!370982 res!208513) b!370975))

(assert (= (and b!370975 res!208519) b!370972))

(assert (= (and b!370972 res!208511) b!370976))

(assert (= (and b!370984 condMapEmpty!14706) mapIsEmpty!14706))

(assert (= (and b!370984 (not condMapEmpty!14706)) mapNonEmpty!14706))

(get-info :version)

(assert (= (and mapNonEmpty!14706 ((_ is ValueCellFull!4037) mapValue!14706)) b!370977))

(assert (= (and b!370984 ((_ is ValueCellFull!4037) mapDefault!14706)) b!370983))

(assert (= start!36972 b!370984))

(declare-fun m!366515 () Bool)

(assert (=> b!370982 m!366515))

(declare-fun m!366517 () Bool)

(assert (=> b!370973 m!366517))

(declare-fun m!366519 () Bool)

(assert (=> start!36972 m!366519))

(declare-fun m!366521 () Bool)

(assert (=> start!36972 m!366521))

(declare-fun m!366523 () Bool)

(assert (=> start!36972 m!366523))

(declare-fun m!366525 () Bool)

(assert (=> b!370981 m!366525))

(declare-fun m!366527 () Bool)

(assert (=> b!370976 m!366527))

(declare-fun m!366529 () Bool)

(assert (=> b!370976 m!366529))

(declare-fun m!366531 () Bool)

(assert (=> b!370976 m!366531))

(declare-fun m!366533 () Bool)

(assert (=> b!370976 m!366533))

(declare-fun m!366535 () Bool)

(assert (=> b!370976 m!366535))

(declare-fun m!366537 () Bool)

(assert (=> b!370972 m!366537))

(declare-fun m!366539 () Bool)

(assert (=> b!370974 m!366539))

(declare-fun m!366541 () Bool)

(assert (=> b!370975 m!366541))

(declare-fun m!366543 () Bool)

(assert (=> b!370975 m!366543))

(declare-fun m!366545 () Bool)

(assert (=> mapNonEmpty!14706 m!366545))

(declare-fun m!366547 () Bool)

(assert (=> b!370978 m!366547))

(check-sat (not b!370972) (not b!370975) (not mapNonEmpty!14706) b_and!15329 (not start!36972) (not b_next!8113) (not b!370974) (not b!370973) (not b!370978) (not b!370976) (not b!370982) tp_is_empty!8761)
(check-sat b_and!15329 (not b_next!8113))
