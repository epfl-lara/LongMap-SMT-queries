; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37066 () Bool)

(assert start!37066)

(declare-fun b_free!8193 () Bool)

(declare-fun b_next!8193 () Bool)

(assert (=> start!37066 (= b_free!8193 (not b_next!8193))))

(declare-fun tp!29294 () Bool)

(declare-fun b_and!15435 () Bool)

(assert (=> start!37066 (= tp!29294 b_and!15435)))

(declare-fun b!372803 () Bool)

(declare-fun res!209844 () Bool)

(declare-fun e!227348 () Bool)

(assert (=> b!372803 (=> (not res!209844) (not e!227348))))

(declare-datatypes ((array!21623 0))(
  ( (array!21624 (arr!10280 (Array (_ BitVec 32) (_ BitVec 64))) (size!10632 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21623)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21623 (_ BitVec 32)) Bool)

(assert (=> b!372803 (= res!209844 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!372804 () Bool)

(declare-fun res!209843 () Bool)

(assert (=> b!372804 (=> (not res!209843) (not e!227348))))

(declare-datatypes ((List!5764 0))(
  ( (Nil!5761) (Cons!5760 (h!6616 (_ BitVec 64)) (t!10914 List!5764)) )
))
(declare-fun arrayNoDuplicates!0 (array!21623 (_ BitVec 32) List!5764) Bool)

(assert (=> b!372804 (= res!209843 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5761))))

(declare-fun mapNonEmpty!14826 () Bool)

(declare-fun mapRes!14826 () Bool)

(declare-fun tp!29295 () Bool)

(declare-fun e!227349 () Bool)

(assert (=> mapNonEmpty!14826 (= mapRes!14826 (and tp!29295 e!227349))))

(declare-fun mapKey!14826 () (_ BitVec 32))

(declare-datatypes ((V!12893 0))(
  ( (V!12894 (val!4465 Int)) )
))
(declare-datatypes ((ValueCell!4077 0))(
  ( (ValueCellFull!4077 (v!6662 V!12893)) (EmptyCell!4077) )
))
(declare-datatypes ((array!21625 0))(
  ( (array!21626 (arr!10281 (Array (_ BitVec 32) ValueCell!4077)) (size!10633 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21625)

(declare-fun mapValue!14826 () ValueCell!4077)

(declare-fun mapRest!14826 () (Array (_ BitVec 32) ValueCell!4077))

(assert (=> mapNonEmpty!14826 (= (arr!10281 _values!506) (store mapRest!14826 mapKey!14826 mapValue!14826))))

(declare-fun b!372805 () Bool)

(declare-fun e!227347 () Bool)

(assert (=> b!372805 (= e!227347 (not true))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!170952 () array!21625)

(declare-fun zeroValue!472 () V!12893)

(declare-fun lt!170946 () array!21623)

(declare-datatypes ((tuple2!5918 0))(
  ( (tuple2!5919 (_1!2970 (_ BitVec 64)) (_2!2970 V!12893)) )
))
(declare-datatypes ((List!5765 0))(
  ( (Nil!5762) (Cons!5761 (h!6617 tuple2!5918) (t!10915 List!5765)) )
))
(declare-datatypes ((ListLongMap!4831 0))(
  ( (ListLongMap!4832 (toList!2431 List!5765)) )
))
(declare-fun lt!170947 () ListLongMap!4831)

(declare-fun minValue!472 () V!12893)

(declare-fun getCurrentListMap!1874 (array!21623 array!21625 (_ BitVec 32) (_ BitVec 32) V!12893 V!12893 (_ BitVec 32) Int) ListLongMap!4831)

(assert (=> b!372805 (= lt!170947 (getCurrentListMap!1874 lt!170946 lt!170952 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170948 () ListLongMap!4831)

(declare-fun lt!170950 () ListLongMap!4831)

(assert (=> b!372805 (and (= lt!170948 lt!170950) (= lt!170950 lt!170948))))

(declare-fun v!373 () V!12893)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun lt!170951 () ListLongMap!4831)

(declare-fun +!777 (ListLongMap!4831 tuple2!5918) ListLongMap!4831)

(assert (=> b!372805 (= lt!170950 (+!777 lt!170951 (tuple2!5919 k0!778 v!373)))))

(declare-datatypes ((Unit!11460 0))(
  ( (Unit!11461) )
))
(declare-fun lt!170949 () Unit!11460)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!32 (array!21623 array!21625 (_ BitVec 32) (_ BitVec 32) V!12893 V!12893 (_ BitVec 32) (_ BitVec 64) V!12893 (_ BitVec 32) Int) Unit!11460)

(assert (=> b!372805 (= lt!170949 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!32 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!708 (array!21623 array!21625 (_ BitVec 32) (_ BitVec 32) V!12893 V!12893 (_ BitVec 32) Int) ListLongMap!4831)

(assert (=> b!372805 (= lt!170948 (getCurrentListMapNoExtraKeys!708 lt!170946 lt!170952 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!372805 (= lt!170952 (array!21626 (store (arr!10281 _values!506) i!548 (ValueCellFull!4077 v!373)) (size!10633 _values!506)))))

(assert (=> b!372805 (= lt!170951 (getCurrentListMapNoExtraKeys!708 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!372806 () Bool)

(declare-fun res!209841 () Bool)

(assert (=> b!372806 (=> (not res!209841) (not e!227348))))

(assert (=> b!372806 (= res!209841 (or (= (select (arr!10280 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10280 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!372807 () Bool)

(declare-fun res!209848 () Bool)

(assert (=> b!372807 (=> (not res!209848) (not e!227347))))

(assert (=> b!372807 (= res!209848 (arrayNoDuplicates!0 lt!170946 #b00000000000000000000000000000000 Nil!5761))))

(declare-fun b!372808 () Bool)

(declare-fun tp_is_empty!8841 () Bool)

(assert (=> b!372808 (= e!227349 tp_is_empty!8841)))

(declare-fun b!372809 () Bool)

(declare-fun res!209845 () Bool)

(assert (=> b!372809 (=> (not res!209845) (not e!227348))))

(assert (=> b!372809 (= res!209845 (and (= (size!10633 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10632 _keys!658) (size!10633 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!372810 () Bool)

(declare-fun res!209840 () Bool)

(assert (=> b!372810 (=> (not res!209840) (not e!227348))))

(assert (=> b!372810 (= res!209840 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10632 _keys!658))))))

(declare-fun res!209842 () Bool)

(assert (=> start!37066 (=> (not res!209842) (not e!227348))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37066 (= res!209842 (validMask!0 mask!970))))

(assert (=> start!37066 e!227348))

(declare-fun e!227351 () Bool)

(declare-fun array_inv!7578 (array!21625) Bool)

(assert (=> start!37066 (and (array_inv!7578 _values!506) e!227351)))

(assert (=> start!37066 tp!29294))

(assert (=> start!37066 true))

(assert (=> start!37066 tp_is_empty!8841))

(declare-fun array_inv!7579 (array!21623) Bool)

(assert (=> start!37066 (array_inv!7579 _keys!658)))

(declare-fun b!372811 () Bool)

(assert (=> b!372811 (= e!227348 e!227347)))

(declare-fun res!209847 () Bool)

(assert (=> b!372811 (=> (not res!209847) (not e!227347))))

(assert (=> b!372811 (= res!209847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170946 mask!970))))

(assert (=> b!372811 (= lt!170946 (array!21624 (store (arr!10280 _keys!658) i!548 k0!778) (size!10632 _keys!658)))))

(declare-fun b!372812 () Bool)

(declare-fun res!209849 () Bool)

(assert (=> b!372812 (=> (not res!209849) (not e!227348))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!372812 (= res!209849 (validKeyInArray!0 k0!778))))

(declare-fun mapIsEmpty!14826 () Bool)

(assert (=> mapIsEmpty!14826 mapRes!14826))

(declare-fun b!372813 () Bool)

(declare-fun e!227350 () Bool)

(assert (=> b!372813 (= e!227351 (and e!227350 mapRes!14826))))

(declare-fun condMapEmpty!14826 () Bool)

(declare-fun mapDefault!14826 () ValueCell!4077)

(assert (=> b!372813 (= condMapEmpty!14826 (= (arr!10281 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4077)) mapDefault!14826)))))

(declare-fun b!372814 () Bool)

(assert (=> b!372814 (= e!227350 tp_is_empty!8841)))

(declare-fun b!372815 () Bool)

(declare-fun res!209846 () Bool)

(assert (=> b!372815 (=> (not res!209846) (not e!227348))))

(declare-fun arrayContainsKey!0 (array!21623 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!372815 (= res!209846 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(assert (= (and start!37066 res!209842) b!372809))

(assert (= (and b!372809 res!209845) b!372803))

(assert (= (and b!372803 res!209844) b!372804))

(assert (= (and b!372804 res!209843) b!372810))

(assert (= (and b!372810 res!209840) b!372812))

(assert (= (and b!372812 res!209849) b!372806))

(assert (= (and b!372806 res!209841) b!372815))

(assert (= (and b!372815 res!209846) b!372811))

(assert (= (and b!372811 res!209847) b!372807))

(assert (= (and b!372807 res!209848) b!372805))

(assert (= (and b!372813 condMapEmpty!14826) mapIsEmpty!14826))

(assert (= (and b!372813 (not condMapEmpty!14826)) mapNonEmpty!14826))

(get-info :version)

(assert (= (and mapNonEmpty!14826 ((_ is ValueCellFull!4077) mapValue!14826)) b!372808))

(assert (= (and b!372813 ((_ is ValueCellFull!4077) mapDefault!14826)) b!372814))

(assert (= start!37066 b!372813))

(declare-fun m!368643 () Bool)

(assert (=> b!372803 m!368643))

(declare-fun m!368645 () Bool)

(assert (=> b!372815 m!368645))

(declare-fun m!368647 () Bool)

(assert (=> b!372805 m!368647))

(declare-fun m!368649 () Bool)

(assert (=> b!372805 m!368649))

(declare-fun m!368651 () Bool)

(assert (=> b!372805 m!368651))

(declare-fun m!368653 () Bool)

(assert (=> b!372805 m!368653))

(declare-fun m!368655 () Bool)

(assert (=> b!372805 m!368655))

(declare-fun m!368657 () Bool)

(assert (=> b!372805 m!368657))

(declare-fun m!368659 () Bool)

(assert (=> start!37066 m!368659))

(declare-fun m!368661 () Bool)

(assert (=> start!37066 m!368661))

(declare-fun m!368663 () Bool)

(assert (=> start!37066 m!368663))

(declare-fun m!368665 () Bool)

(assert (=> b!372812 m!368665))

(declare-fun m!368667 () Bool)

(assert (=> mapNonEmpty!14826 m!368667))

(declare-fun m!368669 () Bool)

(assert (=> b!372807 m!368669))

(declare-fun m!368671 () Bool)

(assert (=> b!372804 m!368671))

(declare-fun m!368673 () Bool)

(assert (=> b!372811 m!368673))

(declare-fun m!368675 () Bool)

(assert (=> b!372811 m!368675))

(declare-fun m!368677 () Bool)

(assert (=> b!372806 m!368677))

(check-sat (not b!372811) (not mapNonEmpty!14826) (not b!372807) (not b_next!8193) b_and!15435 (not b!372804) tp_is_empty!8841 (not b!372805) (not b!372803) (not b!372815) (not start!37066) (not b!372812))
(check-sat b_and!15435 (not b_next!8193))
