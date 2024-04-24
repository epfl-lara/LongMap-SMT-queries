; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36906 () Bool)

(assert start!36906)

(declare-fun b_free!8047 () Bool)

(declare-fun b_next!8047 () Bool)

(assert (=> start!36906 (= b_free!8047 (not b_next!8047))))

(declare-fun tp!28856 () Bool)

(declare-fun b_and!15303 () Bool)

(assert (=> start!36906 (= tp!28856 b_and!15303)))

(declare-fun res!207656 () Bool)

(declare-fun e!226002 () Bool)

(assert (=> start!36906 (=> (not res!207656) (not e!226002))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36906 (= res!207656 (validMask!0 mask!970))))

(assert (=> start!36906 e!226002))

(declare-datatypes ((V!12699 0))(
  ( (V!12700 (val!4392 Int)) )
))
(declare-datatypes ((ValueCell!4004 0))(
  ( (ValueCellFull!4004 (v!6590 V!12699)) (EmptyCell!4004) )
))
(declare-datatypes ((array!21320 0))(
  ( (array!21321 (arr!10128 (Array (_ BitVec 32) ValueCell!4004)) (size!10480 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21320)

(declare-fun e!226004 () Bool)

(declare-fun array_inv!7518 (array!21320) Bool)

(assert (=> start!36906 (and (array_inv!7518 _values!506) e!226004)))

(assert (=> start!36906 tp!28856))

(assert (=> start!36906 true))

(declare-fun tp_is_empty!8695 () Bool)

(assert (=> start!36906 tp_is_empty!8695))

(declare-datatypes ((array!21322 0))(
  ( (array!21323 (arr!10129 (Array (_ BitVec 32) (_ BitVec 64))) (size!10481 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21322)

(declare-fun array_inv!7519 (array!21322) Bool)

(assert (=> start!36906 (array_inv!7519 _keys!658)))

(declare-fun b!369907 () Bool)

(declare-fun e!226000 () Bool)

(assert (=> b!369907 (= e!226000 false)))

(declare-datatypes ((tuple2!5734 0))(
  ( (tuple2!5735 (_1!2878 (_ BitVec 64)) (_2!2878 V!12699)) )
))
(declare-datatypes ((List!5561 0))(
  ( (Nil!5558) (Cons!5557 (h!6413 tuple2!5734) (t!10703 List!5561)) )
))
(declare-datatypes ((ListLongMap!4649 0))(
  ( (ListLongMap!4650 (toList!2340 List!5561)) )
))
(declare-fun lt!169874 () ListLongMap!4649)

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!169875 () array!21322)

(declare-fun zeroValue!472 () V!12699)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!12699)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!12699)

(declare-fun getCurrentListMapNoExtraKeys!649 (array!21322 array!21320 (_ BitVec 32) (_ BitVec 32) V!12699 V!12699 (_ BitVec 32) Int) ListLongMap!4649)

(assert (=> b!369907 (= lt!169874 (getCurrentListMapNoExtraKeys!649 lt!169875 (array!21321 (store (arr!10128 _values!506) i!548 (ValueCellFull!4004 v!373)) (size!10480 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169876 () ListLongMap!4649)

(assert (=> b!369907 (= lt!169876 (getCurrentListMapNoExtraKeys!649 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!369908 () Bool)

(declare-fun res!207647 () Bool)

(assert (=> b!369908 (=> (not res!207647) (not e!226000))))

(declare-datatypes ((List!5562 0))(
  ( (Nil!5559) (Cons!5558 (h!6414 (_ BitVec 64)) (t!10704 List!5562)) )
))
(declare-fun arrayNoDuplicates!0 (array!21322 (_ BitVec 32) List!5562) Bool)

(assert (=> b!369908 (= res!207647 (arrayNoDuplicates!0 lt!169875 #b00000000000000000000000000000000 Nil!5559))))

(declare-fun b!369909 () Bool)

(declare-fun res!207651 () Bool)

(assert (=> b!369909 (=> (not res!207651) (not e!226002))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!369909 (= res!207651 (validKeyInArray!0 k0!778))))

(declare-fun b!369910 () Bool)

(declare-fun res!207649 () Bool)

(assert (=> b!369910 (=> (not res!207649) (not e!226002))))

(assert (=> b!369910 (= res!207649 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10481 _keys!658))))))

(declare-fun b!369911 () Bool)

(declare-fun res!207655 () Bool)

(assert (=> b!369911 (=> (not res!207655) (not e!226002))))

(assert (=> b!369911 (= res!207655 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5559))))

(declare-fun mapIsEmpty!14607 () Bool)

(declare-fun mapRes!14607 () Bool)

(assert (=> mapIsEmpty!14607 mapRes!14607))

(declare-fun b!369912 () Bool)

(declare-fun res!207654 () Bool)

(assert (=> b!369912 (=> (not res!207654) (not e!226002))))

(declare-fun arrayContainsKey!0 (array!21322 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!369912 (= res!207654 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!369913 () Bool)

(declare-fun e!226001 () Bool)

(assert (=> b!369913 (= e!226004 (and e!226001 mapRes!14607))))

(declare-fun condMapEmpty!14607 () Bool)

(declare-fun mapDefault!14607 () ValueCell!4004)

(assert (=> b!369913 (= condMapEmpty!14607 (= (arr!10128 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4004)) mapDefault!14607)))))

(declare-fun b!369914 () Bool)

(declare-fun e!226003 () Bool)

(assert (=> b!369914 (= e!226003 tp_is_empty!8695)))

(declare-fun b!369915 () Bool)

(declare-fun res!207652 () Bool)

(assert (=> b!369915 (=> (not res!207652) (not e!226002))))

(assert (=> b!369915 (= res!207652 (or (= (select (arr!10129 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10129 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!369916 () Bool)

(declare-fun res!207648 () Bool)

(assert (=> b!369916 (=> (not res!207648) (not e!226002))))

(assert (=> b!369916 (= res!207648 (and (= (size!10480 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10481 _keys!658) (size!10480 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!369917 () Bool)

(assert (=> b!369917 (= e!226002 e!226000)))

(declare-fun res!207653 () Bool)

(assert (=> b!369917 (=> (not res!207653) (not e!226000))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21322 (_ BitVec 32)) Bool)

(assert (=> b!369917 (= res!207653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169875 mask!970))))

(assert (=> b!369917 (= lt!169875 (array!21323 (store (arr!10129 _keys!658) i!548 k0!778) (size!10481 _keys!658)))))

(declare-fun b!369918 () Bool)

(declare-fun res!207650 () Bool)

(assert (=> b!369918 (=> (not res!207650) (not e!226002))))

(assert (=> b!369918 (= res!207650 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!369919 () Bool)

(assert (=> b!369919 (= e!226001 tp_is_empty!8695)))

(declare-fun mapNonEmpty!14607 () Bool)

(declare-fun tp!28857 () Bool)

(assert (=> mapNonEmpty!14607 (= mapRes!14607 (and tp!28857 e!226003))))

(declare-fun mapRest!14607 () (Array (_ BitVec 32) ValueCell!4004))

(declare-fun mapValue!14607 () ValueCell!4004)

(declare-fun mapKey!14607 () (_ BitVec 32))

(assert (=> mapNonEmpty!14607 (= (arr!10128 _values!506) (store mapRest!14607 mapKey!14607 mapValue!14607))))

(assert (= (and start!36906 res!207656) b!369916))

(assert (= (and b!369916 res!207648) b!369918))

(assert (= (and b!369918 res!207650) b!369911))

(assert (= (and b!369911 res!207655) b!369910))

(assert (= (and b!369910 res!207649) b!369909))

(assert (= (and b!369909 res!207651) b!369915))

(assert (= (and b!369915 res!207652) b!369912))

(assert (= (and b!369912 res!207654) b!369917))

(assert (= (and b!369917 res!207653) b!369908))

(assert (= (and b!369908 res!207647) b!369907))

(assert (= (and b!369913 condMapEmpty!14607) mapIsEmpty!14607))

(assert (= (and b!369913 (not condMapEmpty!14607)) mapNonEmpty!14607))

(get-info :version)

(assert (= (and mapNonEmpty!14607 ((_ is ValueCellFull!4004) mapValue!14607)) b!369914))

(assert (= (and b!369913 ((_ is ValueCellFull!4004) mapDefault!14607)) b!369919))

(assert (= start!36906 b!369913))

(declare-fun m!366443 () Bool)

(assert (=> b!369909 m!366443))

(declare-fun m!366445 () Bool)

(assert (=> b!369908 m!366445))

(declare-fun m!366447 () Bool)

(assert (=> start!36906 m!366447))

(declare-fun m!366449 () Bool)

(assert (=> start!36906 m!366449))

(declare-fun m!366451 () Bool)

(assert (=> start!36906 m!366451))

(declare-fun m!366453 () Bool)

(assert (=> b!369911 m!366453))

(declare-fun m!366455 () Bool)

(assert (=> b!369918 m!366455))

(declare-fun m!366457 () Bool)

(assert (=> b!369917 m!366457))

(declare-fun m!366459 () Bool)

(assert (=> b!369917 m!366459))

(declare-fun m!366461 () Bool)

(assert (=> mapNonEmpty!14607 m!366461))

(declare-fun m!366463 () Bool)

(assert (=> b!369912 m!366463))

(declare-fun m!366465 () Bool)

(assert (=> b!369915 m!366465))

(declare-fun m!366467 () Bool)

(assert (=> b!369907 m!366467))

(declare-fun m!366469 () Bool)

(assert (=> b!369907 m!366469))

(declare-fun m!366471 () Bool)

(assert (=> b!369907 m!366471))

(check-sat b_and!15303 (not b!369911) (not start!36906) (not b!369909) (not b_next!8047) tp_is_empty!8695 (not b!369918) (not mapNonEmpty!14607) (not b!369912) (not b!369917) (not b!369907) (not b!369908))
(check-sat b_and!15303 (not b_next!8047))
