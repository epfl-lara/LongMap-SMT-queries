; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37336 () Bool)

(assert start!37336)

(declare-fun b_free!8463 () Bool)

(declare-fun b_next!8463 () Bool)

(assert (=> start!37336 (= b_free!8463 (not b_next!8463))))

(declare-fun tp!30104 () Bool)

(declare-fun b_and!15705 () Bool)

(assert (=> start!37336 (= tp!30104 b_and!15705)))

(declare-fun mapNonEmpty!15231 () Bool)

(declare-fun mapRes!15231 () Bool)

(declare-fun tp!30105 () Bool)

(declare-fun e!230556 () Bool)

(assert (=> mapNonEmpty!15231 (= mapRes!15231 (and tp!30105 e!230556))))

(declare-datatypes ((V!13253 0))(
  ( (V!13254 (val!4600 Int)) )
))
(declare-datatypes ((ValueCell!4212 0))(
  ( (ValueCellFull!4212 (v!6797 V!13253)) (EmptyCell!4212) )
))
(declare-datatypes ((array!22147 0))(
  ( (array!22148 (arr!10542 (Array (_ BitVec 32) ValueCell!4212)) (size!10894 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22147)

(declare-fun mapValue!15231 () ValueCell!4212)

(declare-fun mapKey!15231 () (_ BitVec 32))

(declare-fun mapRest!15231 () (Array (_ BitVec 32) ValueCell!4212))

(assert (=> mapNonEmpty!15231 (= (arr!10542 _values!506) (store mapRest!15231 mapKey!15231 mapValue!15231))))

(declare-fun b!378870 () Bool)

(declare-fun e!230557 () Bool)

(declare-fun e!230554 () Bool)

(assert (=> b!378870 (= e!230557 (and e!230554 mapRes!15231))))

(declare-fun condMapEmpty!15231 () Bool)

(declare-fun mapDefault!15231 () ValueCell!4212)

(assert (=> b!378870 (= condMapEmpty!15231 (= (arr!10542 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4212)) mapDefault!15231)))))

(declare-fun res!214695 () Bool)

(declare-fun e!230551 () Bool)

(assert (=> start!37336 (=> (not res!214695) (not e!230551))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37336 (= res!214695 (validMask!0 mask!970))))

(assert (=> start!37336 e!230551))

(declare-fun array_inv!7766 (array!22147) Bool)

(assert (=> start!37336 (and (array_inv!7766 _values!506) e!230557)))

(assert (=> start!37336 tp!30104))

(assert (=> start!37336 true))

(declare-fun tp_is_empty!9111 () Bool)

(assert (=> start!37336 tp_is_empty!9111))

(declare-datatypes ((array!22149 0))(
  ( (array!22150 (arr!10543 (Array (_ BitVec 32) (_ BitVec 64))) (size!10895 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22149)

(declare-fun array_inv!7767 (array!22149) Bool)

(assert (=> start!37336 (array_inv!7767 _keys!658)))

(declare-fun b!378871 () Bool)

(declare-fun e!230558 () Bool)

(declare-fun e!230552 () Bool)

(assert (=> b!378871 (= e!230558 (not e!230552))))

(declare-fun res!214703 () Bool)

(assert (=> b!378871 (=> res!214703 e!230552)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!378871 (= res!214703 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6148 0))(
  ( (tuple2!6149 (_1!3085 (_ BitVec 64)) (_2!3085 V!13253)) )
))
(declare-datatypes ((List!5985 0))(
  ( (Nil!5982) (Cons!5981 (h!6837 tuple2!6148) (t!11135 List!5985)) )
))
(declare-datatypes ((ListLongMap!5061 0))(
  ( (ListLongMap!5062 (toList!2546 List!5985)) )
))
(declare-fun lt!176693 () ListLongMap!5061)

(declare-fun zeroValue!472 () V!13253)

(declare-fun minValue!472 () V!13253)

(declare-fun getCurrentListMap!1970 (array!22149 array!22147 (_ BitVec 32) (_ BitVec 32) V!13253 V!13253 (_ BitVec 32) Int) ListLongMap!5061)

(assert (=> b!378871 (= lt!176693 (getCurrentListMap!1970 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176703 () ListLongMap!5061)

(declare-fun lt!176696 () array!22147)

(declare-fun lt!176691 () array!22149)

(assert (=> b!378871 (= lt!176703 (getCurrentListMap!1970 lt!176691 lt!176696 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176699 () ListLongMap!5061)

(declare-fun lt!176695 () ListLongMap!5061)

(assert (=> b!378871 (and (= lt!176699 lt!176695) (= lt!176695 lt!176699))))

(declare-fun lt!176701 () ListLongMap!5061)

(declare-fun lt!176700 () tuple2!6148)

(declare-fun +!892 (ListLongMap!5061 tuple2!6148) ListLongMap!5061)

(assert (=> b!378871 (= lt!176695 (+!892 lt!176701 lt!176700))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!13253)

(assert (=> b!378871 (= lt!176700 (tuple2!6149 k0!778 v!373))))

(declare-datatypes ((Unit!11684 0))(
  ( (Unit!11685) )
))
(declare-fun lt!176694 () Unit!11684)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!128 (array!22149 array!22147 (_ BitVec 32) (_ BitVec 32) V!13253 V!13253 (_ BitVec 32) (_ BitVec 64) V!13253 (_ BitVec 32) Int) Unit!11684)

(assert (=> b!378871 (= lt!176694 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!128 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!804 (array!22149 array!22147 (_ BitVec 32) (_ BitVec 32) V!13253 V!13253 (_ BitVec 32) Int) ListLongMap!5061)

(assert (=> b!378871 (= lt!176699 (getCurrentListMapNoExtraKeys!804 lt!176691 lt!176696 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378871 (= lt!176696 (array!22148 (store (arr!10542 _values!506) i!548 (ValueCellFull!4212 v!373)) (size!10894 _values!506)))))

(assert (=> b!378871 (= lt!176701 (getCurrentListMapNoExtraKeys!804 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!378872 () Bool)

(declare-fun res!214702 () Bool)

(assert (=> b!378872 (=> (not res!214702) (not e!230551))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!378872 (= res!214702 (validKeyInArray!0 k0!778))))

(declare-fun mapIsEmpty!15231 () Bool)

(assert (=> mapIsEmpty!15231 mapRes!15231))

(declare-fun b!378873 () Bool)

(declare-fun res!214701 () Bool)

(assert (=> b!378873 (=> (not res!214701) (not e!230558))))

(declare-datatypes ((List!5986 0))(
  ( (Nil!5983) (Cons!5982 (h!6838 (_ BitVec 64)) (t!11136 List!5986)) )
))
(declare-fun arrayNoDuplicates!0 (array!22149 (_ BitVec 32) List!5986) Bool)

(assert (=> b!378873 (= res!214701 (arrayNoDuplicates!0 lt!176691 #b00000000000000000000000000000000 Nil!5983))))

(declare-fun b!378874 () Bool)

(declare-fun e!230555 () Bool)

(assert (=> b!378874 (= e!230552 e!230555)))

(declare-fun res!214699 () Bool)

(assert (=> b!378874 (=> res!214699 e!230555)))

(assert (=> b!378874 (= res!214699 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!176692 () ListLongMap!5061)

(assert (=> b!378874 (= lt!176693 lt!176692)))

(declare-fun lt!176698 () tuple2!6148)

(assert (=> b!378874 (= lt!176692 (+!892 lt!176701 lt!176698))))

(declare-fun lt!176697 () ListLongMap!5061)

(assert (=> b!378874 (= lt!176703 lt!176697)))

(assert (=> b!378874 (= lt!176697 (+!892 lt!176695 lt!176698))))

(assert (=> b!378874 (= lt!176703 (+!892 lt!176699 lt!176698))))

(assert (=> b!378874 (= lt!176698 (tuple2!6149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!378875 () Bool)

(assert (=> b!378875 (= e!230556 tp_is_empty!9111)))

(declare-fun b!378876 () Bool)

(declare-fun res!214696 () Bool)

(assert (=> b!378876 (=> (not res!214696) (not e!230551))))

(assert (=> b!378876 (= res!214696 (and (= (size!10894 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10895 _keys!658) (size!10894 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!378877 () Bool)

(declare-fun res!214693 () Bool)

(assert (=> b!378877 (=> (not res!214693) (not e!230551))))

(assert (=> b!378877 (= res!214693 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5983))))

(declare-fun b!378878 () Bool)

(declare-fun res!214700 () Bool)

(assert (=> b!378878 (=> (not res!214700) (not e!230551))))

(assert (=> b!378878 (= res!214700 (or (= (select (arr!10543 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10543 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!378879 () Bool)

(assert (=> b!378879 (= e!230555 true)))

(assert (=> b!378879 (= lt!176697 (+!892 lt!176692 lt!176700))))

(declare-fun lt!176702 () Unit!11684)

(declare-fun addCommutativeForDiffKeys!294 (ListLongMap!5061 (_ BitVec 64) V!13253 (_ BitVec 64) V!13253) Unit!11684)

(assert (=> b!378879 (= lt!176702 (addCommutativeForDiffKeys!294 lt!176701 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!378880 () Bool)

(declare-fun res!214692 () Bool)

(assert (=> b!378880 (=> (not res!214692) (not e!230551))))

(assert (=> b!378880 (= res!214692 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10895 _keys!658))))))

(declare-fun b!378881 () Bool)

(assert (=> b!378881 (= e!230554 tp_is_empty!9111)))

(declare-fun b!378882 () Bool)

(declare-fun res!214698 () Bool)

(assert (=> b!378882 (=> (not res!214698) (not e!230551))))

(declare-fun arrayContainsKey!0 (array!22149 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!378882 (= res!214698 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!378883 () Bool)

(assert (=> b!378883 (= e!230551 e!230558)))

(declare-fun res!214697 () Bool)

(assert (=> b!378883 (=> (not res!214697) (not e!230558))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22149 (_ BitVec 32)) Bool)

(assert (=> b!378883 (= res!214697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!176691 mask!970))))

(assert (=> b!378883 (= lt!176691 (array!22150 (store (arr!10543 _keys!658) i!548 k0!778) (size!10895 _keys!658)))))

(declare-fun b!378884 () Bool)

(declare-fun res!214694 () Bool)

(assert (=> b!378884 (=> (not res!214694) (not e!230551))))

(assert (=> b!378884 (= res!214694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(assert (= (and start!37336 res!214695) b!378876))

(assert (= (and b!378876 res!214696) b!378884))

(assert (= (and b!378884 res!214694) b!378877))

(assert (= (and b!378877 res!214693) b!378880))

(assert (= (and b!378880 res!214692) b!378872))

(assert (= (and b!378872 res!214702) b!378878))

(assert (= (and b!378878 res!214700) b!378882))

(assert (= (and b!378882 res!214698) b!378883))

(assert (= (and b!378883 res!214697) b!378873))

(assert (= (and b!378873 res!214701) b!378871))

(assert (= (and b!378871 (not res!214703)) b!378874))

(assert (= (and b!378874 (not res!214699)) b!378879))

(assert (= (and b!378870 condMapEmpty!15231) mapIsEmpty!15231))

(assert (= (and b!378870 (not condMapEmpty!15231)) mapNonEmpty!15231))

(get-info :version)

(assert (= (and mapNonEmpty!15231 ((_ is ValueCellFull!4212) mapValue!15231)) b!378875))

(assert (= (and b!378870 ((_ is ValueCellFull!4212) mapDefault!15231)) b!378881))

(assert (= start!37336 b!378870))

(declare-fun m!375711 () Bool)

(assert (=> b!378873 m!375711))

(declare-fun m!375713 () Bool)

(assert (=> b!378871 m!375713))

(declare-fun m!375715 () Bool)

(assert (=> b!378871 m!375715))

(declare-fun m!375717 () Bool)

(assert (=> b!378871 m!375717))

(declare-fun m!375719 () Bool)

(assert (=> b!378871 m!375719))

(declare-fun m!375721 () Bool)

(assert (=> b!378871 m!375721))

(declare-fun m!375723 () Bool)

(assert (=> b!378871 m!375723))

(declare-fun m!375725 () Bool)

(assert (=> b!378871 m!375725))

(declare-fun m!375727 () Bool)

(assert (=> b!378883 m!375727))

(declare-fun m!375729 () Bool)

(assert (=> b!378883 m!375729))

(declare-fun m!375731 () Bool)

(assert (=> b!378878 m!375731))

(declare-fun m!375733 () Bool)

(assert (=> b!378882 m!375733))

(declare-fun m!375735 () Bool)

(assert (=> b!378879 m!375735))

(declare-fun m!375737 () Bool)

(assert (=> b!378879 m!375737))

(declare-fun m!375739 () Bool)

(assert (=> start!37336 m!375739))

(declare-fun m!375741 () Bool)

(assert (=> start!37336 m!375741))

(declare-fun m!375743 () Bool)

(assert (=> start!37336 m!375743))

(declare-fun m!375745 () Bool)

(assert (=> b!378884 m!375745))

(declare-fun m!375747 () Bool)

(assert (=> mapNonEmpty!15231 m!375747))

(declare-fun m!375749 () Bool)

(assert (=> b!378877 m!375749))

(declare-fun m!375751 () Bool)

(assert (=> b!378872 m!375751))

(declare-fun m!375753 () Bool)

(assert (=> b!378874 m!375753))

(declare-fun m!375755 () Bool)

(assert (=> b!378874 m!375755))

(declare-fun m!375757 () Bool)

(assert (=> b!378874 m!375757))

(check-sat tp_is_empty!9111 (not b!378877) (not b!378873) (not b!378884) (not b!378872) (not b!378879) (not start!37336) (not b!378883) (not b!378871) (not mapNonEmpty!15231) b_and!15705 (not b!378874) (not b!378882) (not b_next!8463))
(check-sat b_and!15705 (not b_next!8463))
