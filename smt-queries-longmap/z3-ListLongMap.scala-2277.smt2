; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37110 () Bool)

(assert start!37110)

(declare-fun b_free!8251 () Bool)

(declare-fun b_next!8251 () Bool)

(assert (=> start!37110 (= b_free!8251 (not b_next!8251))))

(declare-fun tp!29469 () Bool)

(declare-fun b_and!15467 () Bool)

(assert (=> start!37110 (= tp!29469 b_and!15467)))

(declare-fun b!373811 () Bool)

(declare-fun e!227835 () Bool)

(assert (=> b!373811 (= e!227835 true)))

(declare-datatypes ((V!12971 0))(
  ( (V!12972 (val!4494 Int)) )
))
(declare-datatypes ((tuple2!5942 0))(
  ( (tuple2!5943 (_1!2982 (_ BitVec 64)) (_2!2982 V!12971)) )
))
(declare-datatypes ((List!5777 0))(
  ( (Nil!5774) (Cons!5773 (h!6629 tuple2!5942) (t!10918 List!5777)) )
))
(declare-datatypes ((ListLongMap!4845 0))(
  ( (ListLongMap!4846 (toList!2438 List!5777)) )
))
(declare-fun lt!171974 () ListLongMap!4845)

(declare-fun lt!171983 () ListLongMap!4845)

(declare-fun lt!171972 () tuple2!5942)

(declare-fun lt!171982 () tuple2!5942)

(declare-fun +!806 (ListLongMap!4845 tuple2!5942) ListLongMap!4845)

(assert (=> b!373811 (= (+!806 lt!171983 lt!171972) (+!806 lt!171974 lt!171982))))

(declare-fun v!373 () V!12971)

(declare-datatypes ((Unit!11484 0))(
  ( (Unit!11485) )
))
(declare-fun lt!171976 () Unit!11484)

(declare-fun minValue!472 () V!12971)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun lt!171980 () ListLongMap!4845)

(declare-fun addCommutativeForDiffKeys!223 (ListLongMap!4845 (_ BitVec 64) V!12971 (_ BitVec 64) V!12971) Unit!11484)

(assert (=> b!373811 (= lt!171976 (addCommutativeForDiffKeys!223 lt!171980 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!373812 () Bool)

(declare-fun res!210730 () Bool)

(declare-fun e!227834 () Bool)

(assert (=> b!373812 (=> (not res!210730) (not e!227834))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!21715 0))(
  ( (array!21716 (arr!10326 (Array (_ BitVec 32) (_ BitVec 64))) (size!10679 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21715)

(assert (=> b!373812 (= res!210730 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10679 _keys!658))))))

(declare-fun b!373813 () Bool)

(declare-fun e!227837 () Bool)

(assert (=> b!373813 (= e!227837 e!227835)))

(declare-fun res!210735 () Bool)

(assert (=> b!373813 (=> res!210735 e!227835)))

(assert (=> b!373813 (= res!210735 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!171971 () ListLongMap!4845)

(assert (=> b!373813 (= lt!171971 lt!171983)))

(assert (=> b!373813 (= lt!171983 (+!806 lt!171980 lt!171982))))

(declare-fun lt!171985 () ListLongMap!4845)

(declare-fun lt!171984 () Unit!11484)

(declare-fun zeroValue!472 () V!12971)

(assert (=> b!373813 (= lt!171984 (addCommutativeForDiffKeys!223 lt!171985 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!171978 () ListLongMap!4845)

(assert (=> b!373813 (= lt!171978 (+!806 lt!171971 lt!171972))))

(declare-fun lt!171986 () ListLongMap!4845)

(declare-fun lt!171981 () tuple2!5942)

(assert (=> b!373813 (= lt!171971 (+!806 lt!171986 lt!171981))))

(declare-fun lt!171987 () ListLongMap!4845)

(assert (=> b!373813 (= lt!171987 lt!171974)))

(assert (=> b!373813 (= lt!171974 (+!806 lt!171980 lt!171972))))

(assert (=> b!373813 (= lt!171980 (+!806 lt!171985 lt!171981))))

(declare-fun lt!171977 () ListLongMap!4845)

(assert (=> b!373813 (= lt!171978 (+!806 (+!806 lt!171977 lt!171981) lt!171972))))

(assert (=> b!373813 (= lt!171972 (tuple2!5943 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!373813 (= lt!171981 (tuple2!5943 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!373814 () Bool)

(declare-fun res!210737 () Bool)

(assert (=> b!373814 (=> (not res!210737) (not e!227834))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21715 (_ BitVec 32)) Bool)

(assert (=> b!373814 (= res!210737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!373815 () Bool)

(declare-fun res!210739 () Bool)

(declare-fun e!227840 () Bool)

(assert (=> b!373815 (=> (not res!210739) (not e!227840))))

(declare-fun lt!171979 () array!21715)

(declare-datatypes ((List!5778 0))(
  ( (Nil!5775) (Cons!5774 (h!6630 (_ BitVec 64)) (t!10919 List!5778)) )
))
(declare-fun arrayNoDuplicates!0 (array!21715 (_ BitVec 32) List!5778) Bool)

(assert (=> b!373815 (= res!210739 (arrayNoDuplicates!0 lt!171979 #b00000000000000000000000000000000 Nil!5775))))

(declare-fun b!373816 () Bool)

(assert (=> b!373816 (= e!227840 (not e!227837))))

(declare-fun res!210733 () Bool)

(assert (=> b!373816 (=> res!210733 e!227837)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!373816 (= res!210733 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((ValueCell!4106 0))(
  ( (ValueCellFull!4106 (v!6685 V!12971)) (EmptyCell!4106) )
))
(declare-datatypes ((array!21717 0))(
  ( (array!21718 (arr!10327 (Array (_ BitVec 32) ValueCell!4106)) (size!10680 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21717)

(declare-fun defaultEntry!514 () Int)

(declare-fun getCurrentListMap!1860 (array!21715 array!21717 (_ BitVec 32) (_ BitVec 32) V!12971 V!12971 (_ BitVec 32) Int) ListLongMap!4845)

(assert (=> b!373816 (= lt!171987 (getCurrentListMap!1860 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171973 () array!21717)

(assert (=> b!373816 (= lt!171978 (getCurrentListMap!1860 lt!171979 lt!171973 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!373816 (and (= lt!171977 lt!171986) (= lt!171986 lt!171977))))

(assert (=> b!373816 (= lt!171986 (+!806 lt!171985 lt!171982))))

(assert (=> b!373816 (= lt!171982 (tuple2!5943 k0!778 v!373))))

(declare-fun lt!171975 () Unit!11484)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!53 (array!21715 array!21717 (_ BitVec 32) (_ BitVec 32) V!12971 V!12971 (_ BitVec 32) (_ BitVec 64) V!12971 (_ BitVec 32) Int) Unit!11484)

(assert (=> b!373816 (= lt!171975 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!53 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!725 (array!21715 array!21717 (_ BitVec 32) (_ BitVec 32) V!12971 V!12971 (_ BitVec 32) Int) ListLongMap!4845)

(assert (=> b!373816 (= lt!171977 (getCurrentListMapNoExtraKeys!725 lt!171979 lt!171973 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!373816 (= lt!171973 (array!21718 (store (arr!10327 _values!506) i!548 (ValueCellFull!4106 v!373)) (size!10680 _values!506)))))

(assert (=> b!373816 (= lt!171985 (getCurrentListMapNoExtraKeys!725 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun res!210734 () Bool)

(assert (=> start!37110 (=> (not res!210734) (not e!227834))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37110 (= res!210734 (validMask!0 mask!970))))

(assert (=> start!37110 e!227834))

(declare-fun e!227838 () Bool)

(declare-fun array_inv!7620 (array!21717) Bool)

(assert (=> start!37110 (and (array_inv!7620 _values!506) e!227838)))

(assert (=> start!37110 tp!29469))

(assert (=> start!37110 true))

(declare-fun tp_is_empty!8899 () Bool)

(assert (=> start!37110 tp_is_empty!8899))

(declare-fun array_inv!7621 (array!21715) Bool)

(assert (=> start!37110 (array_inv!7621 _keys!658)))

(declare-fun b!373817 () Bool)

(declare-fun res!210740 () Bool)

(assert (=> b!373817 (=> (not res!210740) (not e!227834))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!373817 (= res!210740 (validKeyInArray!0 k0!778))))

(declare-fun b!373818 () Bool)

(declare-fun e!227839 () Bool)

(declare-fun mapRes!14913 () Bool)

(assert (=> b!373818 (= e!227838 (and e!227839 mapRes!14913))))

(declare-fun condMapEmpty!14913 () Bool)

(declare-fun mapDefault!14913 () ValueCell!4106)

(assert (=> b!373818 (= condMapEmpty!14913 (= (arr!10327 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4106)) mapDefault!14913)))))

(declare-fun b!373819 () Bool)

(assert (=> b!373819 (= e!227839 tp_is_empty!8899)))

(declare-fun b!373820 () Bool)

(declare-fun res!210736 () Bool)

(assert (=> b!373820 (=> (not res!210736) (not e!227834))))

(assert (=> b!373820 (= res!210736 (and (= (size!10680 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10679 _keys!658) (size!10680 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!373821 () Bool)

(assert (=> b!373821 (= e!227834 e!227840)))

(declare-fun res!210738 () Bool)

(assert (=> b!373821 (=> (not res!210738) (not e!227840))))

(assert (=> b!373821 (= res!210738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!171979 mask!970))))

(assert (=> b!373821 (= lt!171979 (array!21716 (store (arr!10326 _keys!658) i!548 k0!778) (size!10679 _keys!658)))))

(declare-fun b!373822 () Bool)

(declare-fun res!210731 () Bool)

(assert (=> b!373822 (=> (not res!210731) (not e!227834))))

(assert (=> b!373822 (= res!210731 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5775))))

(declare-fun mapNonEmpty!14913 () Bool)

(declare-fun tp!29468 () Bool)

(declare-fun e!227833 () Bool)

(assert (=> mapNonEmpty!14913 (= mapRes!14913 (and tp!29468 e!227833))))

(declare-fun mapValue!14913 () ValueCell!4106)

(declare-fun mapRest!14913 () (Array (_ BitVec 32) ValueCell!4106))

(declare-fun mapKey!14913 () (_ BitVec 32))

(assert (=> mapNonEmpty!14913 (= (arr!10327 _values!506) (store mapRest!14913 mapKey!14913 mapValue!14913))))

(declare-fun b!373823 () Bool)

(declare-fun res!210732 () Bool)

(assert (=> b!373823 (=> (not res!210732) (not e!227834))))

(assert (=> b!373823 (= res!210732 (or (= (select (arr!10326 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10326 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!373824 () Bool)

(declare-fun res!210729 () Bool)

(assert (=> b!373824 (=> (not res!210729) (not e!227834))))

(declare-fun arrayContainsKey!0 (array!21715 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!373824 (= res!210729 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!373825 () Bool)

(assert (=> b!373825 (= e!227833 tp_is_empty!8899)))

(declare-fun mapIsEmpty!14913 () Bool)

(assert (=> mapIsEmpty!14913 mapRes!14913))

(assert (= (and start!37110 res!210734) b!373820))

(assert (= (and b!373820 res!210736) b!373814))

(assert (= (and b!373814 res!210737) b!373822))

(assert (= (and b!373822 res!210731) b!373812))

(assert (= (and b!373812 res!210730) b!373817))

(assert (= (and b!373817 res!210740) b!373823))

(assert (= (and b!373823 res!210732) b!373824))

(assert (= (and b!373824 res!210729) b!373821))

(assert (= (and b!373821 res!210738) b!373815))

(assert (= (and b!373815 res!210739) b!373816))

(assert (= (and b!373816 (not res!210733)) b!373813))

(assert (= (and b!373813 (not res!210735)) b!373811))

(assert (= (and b!373818 condMapEmpty!14913) mapIsEmpty!14913))

(assert (= (and b!373818 (not condMapEmpty!14913)) mapNonEmpty!14913))

(get-info :version)

(assert (= (and mapNonEmpty!14913 ((_ is ValueCellFull!4106) mapValue!14913)) b!373825))

(assert (= (and b!373818 ((_ is ValueCellFull!4106) mapDefault!14913)) b!373819))

(assert (= start!37110 b!373818))

(declare-fun m!369491 () Bool)

(assert (=> b!373823 m!369491))

(declare-fun m!369493 () Bool)

(assert (=> b!373816 m!369493))

(declare-fun m!369495 () Bool)

(assert (=> b!373816 m!369495))

(declare-fun m!369497 () Bool)

(assert (=> b!373816 m!369497))

(declare-fun m!369499 () Bool)

(assert (=> b!373816 m!369499))

(declare-fun m!369501 () Bool)

(assert (=> b!373816 m!369501))

(declare-fun m!369503 () Bool)

(assert (=> b!373816 m!369503))

(declare-fun m!369505 () Bool)

(assert (=> b!373816 m!369505))

(declare-fun m!369507 () Bool)

(assert (=> b!373822 m!369507))

(declare-fun m!369509 () Bool)

(assert (=> b!373813 m!369509))

(declare-fun m!369511 () Bool)

(assert (=> b!373813 m!369511))

(declare-fun m!369513 () Bool)

(assert (=> b!373813 m!369513))

(declare-fun m!369515 () Bool)

(assert (=> b!373813 m!369515))

(assert (=> b!373813 m!369515))

(declare-fun m!369517 () Bool)

(assert (=> b!373813 m!369517))

(declare-fun m!369519 () Bool)

(assert (=> b!373813 m!369519))

(declare-fun m!369521 () Bool)

(assert (=> b!373813 m!369521))

(declare-fun m!369523 () Bool)

(assert (=> b!373813 m!369523))

(declare-fun m!369525 () Bool)

(assert (=> b!373814 m!369525))

(declare-fun m!369527 () Bool)

(assert (=> start!37110 m!369527))

(declare-fun m!369529 () Bool)

(assert (=> start!37110 m!369529))

(declare-fun m!369531 () Bool)

(assert (=> start!37110 m!369531))

(declare-fun m!369533 () Bool)

(assert (=> mapNonEmpty!14913 m!369533))

(declare-fun m!369535 () Bool)

(assert (=> b!373824 m!369535))

(declare-fun m!369537 () Bool)

(assert (=> b!373817 m!369537))

(declare-fun m!369539 () Bool)

(assert (=> b!373815 m!369539))

(declare-fun m!369541 () Bool)

(assert (=> b!373821 m!369541))

(declare-fun m!369543 () Bool)

(assert (=> b!373821 m!369543))

(declare-fun m!369545 () Bool)

(assert (=> b!373811 m!369545))

(declare-fun m!369547 () Bool)

(assert (=> b!373811 m!369547))

(declare-fun m!369549 () Bool)

(assert (=> b!373811 m!369549))

(check-sat (not b!373822) (not start!37110) (not b!373816) b_and!15467 (not b!373824) (not mapNonEmpty!14913) (not b!373814) (not b!373815) (not b!373821) tp_is_empty!8899 (not b!373813) (not b_next!8251) (not b!373811) (not b!373817))
(check-sat b_and!15467 (not b_next!8251))
