; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37218 () Bool)

(assert start!37218)

(declare-fun b_free!8359 () Bool)

(declare-fun b_next!8359 () Bool)

(assert (=> start!37218 (= b_free!8359 (not b_next!8359))))

(declare-fun tp!29793 () Bool)

(declare-fun b_and!15575 () Bool)

(assert (=> start!37218 (= tp!29793 b_and!15575)))

(declare-fun mapIsEmpty!15075 () Bool)

(declare-fun mapRes!15075 () Bool)

(assert (=> mapIsEmpty!15075 mapRes!15075))

(declare-fun b!376250 () Bool)

(declare-fun res!212693 () Bool)

(declare-fun e!229135 () Bool)

(assert (=> b!376250 (=> (not res!212693) (not e!229135))))

(declare-datatypes ((array!21927 0))(
  ( (array!21928 (arr!10432 (Array (_ BitVec 32) (_ BitVec 64))) (size!10785 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21927)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21927 (_ BitVec 32)) Bool)

(assert (=> b!376250 (= res!212693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!376251 () Bool)

(declare-fun e!229134 () Bool)

(assert (=> b!376251 (= e!229135 e!229134)))

(declare-fun res!212687 () Bool)

(assert (=> b!376251 (=> (not res!212687) (not e!229134))))

(declare-fun lt!174472 () array!21927)

(assert (=> b!376251 (= res!212687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!174472 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!376251 (= lt!174472 (array!21928 (store (arr!10432 _keys!658) i!548 k0!778) (size!10785 _keys!658)))))

(declare-fun b!376252 () Bool)

(declare-fun e!229129 () Bool)

(assert (=> b!376252 (= e!229129 true)))

(declare-datatypes ((V!13115 0))(
  ( (V!13116 (val!4548 Int)) )
))
(declare-datatypes ((tuple2!6040 0))(
  ( (tuple2!6041 (_1!3031 (_ BitVec 64)) (_2!3031 V!13115)) )
))
(declare-datatypes ((List!5869 0))(
  ( (Nil!5866) (Cons!5865 (h!6721 tuple2!6040) (t!11010 List!5869)) )
))
(declare-datatypes ((ListLongMap!4943 0))(
  ( (ListLongMap!4944 (toList!2487 List!5869)) )
))
(declare-fun lt!174467 () ListLongMap!4943)

(declare-fun lt!174477 () ListLongMap!4943)

(declare-fun lt!174473 () tuple2!6040)

(declare-fun +!855 (ListLongMap!4943 tuple2!6040) ListLongMap!4943)

(assert (=> b!376252 (= lt!174467 (+!855 lt!174477 lt!174473))))

(declare-fun lt!174470 () ListLongMap!4943)

(declare-fun v!373 () V!13115)

(declare-datatypes ((Unit!11582 0))(
  ( (Unit!11583) )
))
(declare-fun lt!174466 () Unit!11582)

(declare-fun zeroValue!472 () V!13115)

(declare-fun addCommutativeForDiffKeys!265 (ListLongMap!4943 (_ BitVec 64) V!13115 (_ BitVec 64) V!13115) Unit!11582)

(assert (=> b!376252 (= lt!174466 (addCommutativeForDiffKeys!265 lt!174470 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!376253 () Bool)

(declare-fun res!212684 () Bool)

(assert (=> b!376253 (=> (not res!212684) (not e!229135))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!376253 (= res!212684 (validKeyInArray!0 k0!778))))

(declare-fun b!376254 () Bool)

(declare-fun res!212689 () Bool)

(assert (=> b!376254 (=> (not res!212689) (not e!229135))))

(declare-fun arrayContainsKey!0 (array!21927 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!376254 (= res!212689 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!376256 () Bool)

(declare-fun e!229131 () Bool)

(declare-fun e!229133 () Bool)

(assert (=> b!376256 (= e!229131 (and e!229133 mapRes!15075))))

(declare-fun condMapEmpty!15075 () Bool)

(declare-datatypes ((ValueCell!4160 0))(
  ( (ValueCellFull!4160 (v!6739 V!13115)) (EmptyCell!4160) )
))
(declare-datatypes ((array!21929 0))(
  ( (array!21930 (arr!10433 (Array (_ BitVec 32) ValueCell!4160)) (size!10786 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21929)

(declare-fun mapDefault!15075 () ValueCell!4160)

(assert (=> b!376256 (= condMapEmpty!15075 (= (arr!10433 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4160)) mapDefault!15075)))))

(declare-fun mapNonEmpty!15075 () Bool)

(declare-fun tp!29792 () Bool)

(declare-fun e!229132 () Bool)

(assert (=> mapNonEmpty!15075 (= mapRes!15075 (and tp!29792 e!229132))))

(declare-fun mapValue!15075 () ValueCell!4160)

(declare-fun mapKey!15075 () (_ BitVec 32))

(declare-fun mapRest!15075 () (Array (_ BitVec 32) ValueCell!4160))

(assert (=> mapNonEmpty!15075 (= (arr!10433 _values!506) (store mapRest!15075 mapKey!15075 mapValue!15075))))

(declare-fun b!376257 () Bool)

(declare-fun tp_is_empty!9007 () Bool)

(assert (=> b!376257 (= e!229132 tp_is_empty!9007)))

(declare-fun b!376258 () Bool)

(assert (=> b!376258 (= e!229133 tp_is_empty!9007)))

(declare-fun b!376259 () Bool)

(declare-fun res!212690 () Bool)

(assert (=> b!376259 (=> (not res!212690) (not e!229134))))

(declare-datatypes ((List!5870 0))(
  ( (Nil!5867) (Cons!5866 (h!6722 (_ BitVec 64)) (t!11011 List!5870)) )
))
(declare-fun arrayNoDuplicates!0 (array!21927 (_ BitVec 32) List!5870) Bool)

(assert (=> b!376259 (= res!212690 (arrayNoDuplicates!0 lt!174472 #b00000000000000000000000000000000 Nil!5867))))

(declare-fun res!212692 () Bool)

(assert (=> start!37218 (=> (not res!212692) (not e!229135))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37218 (= res!212692 (validMask!0 mask!970))))

(assert (=> start!37218 e!229135))

(declare-fun array_inv!7694 (array!21929) Bool)

(assert (=> start!37218 (and (array_inv!7694 _values!506) e!229131)))

(assert (=> start!37218 tp!29793))

(assert (=> start!37218 true))

(assert (=> start!37218 tp_is_empty!9007))

(declare-fun array_inv!7695 (array!21927) Bool)

(assert (=> start!37218 (array_inv!7695 _keys!658)))

(declare-fun b!376255 () Bool)

(declare-fun e!229136 () Bool)

(assert (=> b!376255 (= e!229134 (not e!229136))))

(declare-fun res!212683 () Bool)

(assert (=> b!376255 (=> res!212683 e!229136)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!376255 (= res!212683 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!174476 () ListLongMap!4943)

(declare-fun minValue!472 () V!13115)

(declare-fun getCurrentListMap!1898 (array!21927 array!21929 (_ BitVec 32) (_ BitVec 32) V!13115 V!13115 (_ BitVec 32) Int) ListLongMap!4943)

(assert (=> b!376255 (= lt!174476 (getCurrentListMap!1898 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174469 () array!21929)

(declare-fun lt!174468 () ListLongMap!4943)

(assert (=> b!376255 (= lt!174468 (getCurrentListMap!1898 lt!174472 lt!174469 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174465 () ListLongMap!4943)

(declare-fun lt!174471 () ListLongMap!4943)

(assert (=> b!376255 (and (= lt!174465 lt!174471) (= lt!174471 lt!174465))))

(assert (=> b!376255 (= lt!174471 (+!855 lt!174470 lt!174473))))

(assert (=> b!376255 (= lt!174473 (tuple2!6041 k0!778 v!373))))

(declare-fun lt!174475 () Unit!11582)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!91 (array!21927 array!21929 (_ BitVec 32) (_ BitVec 32) V!13115 V!13115 (_ BitVec 32) (_ BitVec 64) V!13115 (_ BitVec 32) Int) Unit!11582)

(assert (=> b!376255 (= lt!174475 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!91 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!763 (array!21927 array!21929 (_ BitVec 32) (_ BitVec 32) V!13115 V!13115 (_ BitVec 32) Int) ListLongMap!4943)

(assert (=> b!376255 (= lt!174465 (getCurrentListMapNoExtraKeys!763 lt!174472 lt!174469 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!376255 (= lt!174469 (array!21930 (store (arr!10433 _values!506) i!548 (ValueCellFull!4160 v!373)) (size!10786 _values!506)))))

(assert (=> b!376255 (= lt!174470 (getCurrentListMapNoExtraKeys!763 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!376260 () Bool)

(declare-fun res!212688 () Bool)

(assert (=> b!376260 (=> (not res!212688) (not e!229135))))

(assert (=> b!376260 (= res!212688 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5867))))

(declare-fun b!376261 () Bool)

(declare-fun res!212682 () Bool)

(assert (=> b!376261 (=> (not res!212682) (not e!229135))))

(assert (=> b!376261 (= res!212682 (or (= (select (arr!10432 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10432 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!376262 () Bool)

(declare-fun res!212686 () Bool)

(assert (=> b!376262 (=> (not res!212686) (not e!229135))))

(assert (=> b!376262 (= res!212686 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10785 _keys!658))))))

(declare-fun b!376263 () Bool)

(declare-fun res!212685 () Bool)

(assert (=> b!376263 (=> (not res!212685) (not e!229135))))

(assert (=> b!376263 (= res!212685 (and (= (size!10786 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10785 _keys!658) (size!10786 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!376264 () Bool)

(assert (=> b!376264 (= e!229136 e!229129)))

(declare-fun res!212691 () Bool)

(assert (=> b!376264 (=> res!212691 e!229129)))

(assert (=> b!376264 (= res!212691 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!376264 (= lt!174468 lt!174467)))

(declare-fun lt!174474 () tuple2!6040)

(assert (=> b!376264 (= lt!174467 (+!855 lt!174471 lt!174474))))

(assert (=> b!376264 (= lt!174476 lt!174477)))

(assert (=> b!376264 (= lt!174477 (+!855 lt!174470 lt!174474))))

(assert (=> b!376264 (= lt!174468 (+!855 lt!174465 lt!174474))))

(assert (=> b!376264 (= lt!174474 (tuple2!6041 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (= (and start!37218 res!212692) b!376263))

(assert (= (and b!376263 res!212685) b!376250))

(assert (= (and b!376250 res!212693) b!376260))

(assert (= (and b!376260 res!212688) b!376262))

(assert (= (and b!376262 res!212686) b!376253))

(assert (= (and b!376253 res!212684) b!376261))

(assert (= (and b!376261 res!212682) b!376254))

(assert (= (and b!376254 res!212689) b!376251))

(assert (= (and b!376251 res!212687) b!376259))

(assert (= (and b!376259 res!212690) b!376255))

(assert (= (and b!376255 (not res!212683)) b!376264))

(assert (= (and b!376264 (not res!212691)) b!376252))

(assert (= (and b!376256 condMapEmpty!15075) mapIsEmpty!15075))

(assert (= (and b!376256 (not condMapEmpty!15075)) mapNonEmpty!15075))

(get-info :version)

(assert (= (and mapNonEmpty!15075 ((_ is ValueCellFull!4160) mapValue!15075)) b!376257))

(assert (= (and b!376256 ((_ is ValueCellFull!4160) mapDefault!15075)) b!376258))

(assert (= start!37218 b!376256))

(declare-fun m!372503 () Bool)

(assert (=> b!376251 m!372503))

(declare-fun m!372505 () Bool)

(assert (=> b!376251 m!372505))

(declare-fun m!372507 () Bool)

(assert (=> b!376261 m!372507))

(declare-fun m!372509 () Bool)

(assert (=> b!376252 m!372509))

(declare-fun m!372511 () Bool)

(assert (=> b!376252 m!372511))

(declare-fun m!372513 () Bool)

(assert (=> b!376260 m!372513))

(declare-fun m!372515 () Bool)

(assert (=> b!376255 m!372515))

(declare-fun m!372517 () Bool)

(assert (=> b!376255 m!372517))

(declare-fun m!372519 () Bool)

(assert (=> b!376255 m!372519))

(declare-fun m!372521 () Bool)

(assert (=> b!376255 m!372521))

(declare-fun m!372523 () Bool)

(assert (=> b!376255 m!372523))

(declare-fun m!372525 () Bool)

(assert (=> b!376255 m!372525))

(declare-fun m!372527 () Bool)

(assert (=> b!376255 m!372527))

(declare-fun m!372529 () Bool)

(assert (=> b!376250 m!372529))

(declare-fun m!372531 () Bool)

(assert (=> b!376254 m!372531))

(declare-fun m!372533 () Bool)

(assert (=> b!376253 m!372533))

(declare-fun m!372535 () Bool)

(assert (=> b!376264 m!372535))

(declare-fun m!372537 () Bool)

(assert (=> b!376264 m!372537))

(declare-fun m!372539 () Bool)

(assert (=> b!376264 m!372539))

(declare-fun m!372541 () Bool)

(assert (=> mapNonEmpty!15075 m!372541))

(declare-fun m!372543 () Bool)

(assert (=> b!376259 m!372543))

(declare-fun m!372545 () Bool)

(assert (=> start!37218 m!372545))

(declare-fun m!372547 () Bool)

(assert (=> start!37218 m!372547))

(declare-fun m!372549 () Bool)

(assert (=> start!37218 m!372549))

(check-sat (not b!376254) tp_is_empty!9007 (not b!376264) (not b!376252) b_and!15575 (not b!376253) (not b!376260) (not b!376250) (not b_next!8359) (not b!376255) (not start!37218) (not b!376251) (not b!376259) (not mapNonEmpty!15075))
(check-sat b_and!15575 (not b_next!8359))
