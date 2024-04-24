; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108412 () Bool)

(assert start!108412)

(declare-fun b_free!27883 () Bool)

(declare-fun b_next!27883 () Bool)

(assert (=> start!108412 (= b_free!27883 (not b_next!27883))))

(declare-fun tp!98605 () Bool)

(declare-fun b_and!45943 () Bool)

(assert (=> start!108412 (= tp!98605 b_and!45943)))

(declare-fun b!1278876 () Bool)

(declare-fun res!849426 () Bool)

(declare-fun e!730483 () Bool)

(assert (=> b!1278876 (=> (not res!849426) (not e!730483))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((array!83987 0))(
  ( (array!83988 (arr!40499 (Array (_ BitVec 32) (_ BitVec 64))) (size!41050 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83987)

(declare-datatypes ((V!49681 0))(
  ( (V!49682 (val!16791 Int)) )
))
(declare-datatypes ((ValueCell!15818 0))(
  ( (ValueCellFull!15818 (v!19384 V!49681)) (EmptyCell!15818) )
))
(declare-datatypes ((array!83989 0))(
  ( (array!83990 (arr!40500 (Array (_ BitVec 32) ValueCell!15818)) (size!41051 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83989)

(assert (=> b!1278876 (= res!849426 (and (= (size!41051 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!41050 _keys!1427) (size!41051 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1278877 () Bool)

(declare-fun res!849427 () Bool)

(assert (=> b!1278877 (=> (not res!849427) (not e!730483))))

(declare-datatypes ((List!28744 0))(
  ( (Nil!28741) (Cons!28740 (h!29958 (_ BitVec 64)) (t!42274 List!28744)) )
))
(declare-fun arrayNoDuplicates!0 (array!83987 (_ BitVec 32) List!28744) Bool)

(assert (=> b!1278877 (= res!849427 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28741))))

(declare-fun mapNonEmpty!51683 () Bool)

(declare-fun mapRes!51683 () Bool)

(declare-fun tp!98606 () Bool)

(declare-fun e!730485 () Bool)

(assert (=> mapNonEmpty!51683 (= mapRes!51683 (and tp!98606 e!730485))))

(declare-fun mapValue!51683 () ValueCell!15818)

(declare-fun mapRest!51683 () (Array (_ BitVec 32) ValueCell!15818))

(declare-fun mapKey!51683 () (_ BitVec 32))

(assert (=> mapNonEmpty!51683 (= (arr!40500 _values!1187) (store mapRest!51683 mapKey!51683 mapValue!51683))))

(declare-fun b!1278878 () Bool)

(declare-fun e!730486 () Bool)

(declare-fun tp_is_empty!33433 () Bool)

(assert (=> b!1278878 (= e!730486 tp_is_empty!33433)))

(declare-fun mapIsEmpty!51683 () Bool)

(assert (=> mapIsEmpty!51683 mapRes!51683))

(declare-fun b!1278879 () Bool)

(declare-fun e!730482 () Bool)

(assert (=> b!1278879 (= e!730482 (and e!730486 mapRes!51683))))

(declare-fun condMapEmpty!51683 () Bool)

(declare-fun mapDefault!51683 () ValueCell!15818)

(assert (=> b!1278879 (= condMapEmpty!51683 (= (arr!40500 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15818)) mapDefault!51683)))))

(declare-fun res!849425 () Bool)

(assert (=> start!108412 (=> (not res!849425) (not e!730483))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108412 (= res!849425 (validMask!0 mask!1805))))

(assert (=> start!108412 e!730483))

(assert (=> start!108412 true))

(assert (=> start!108412 tp!98605))

(assert (=> start!108412 tp_is_empty!33433))

(declare-fun array_inv!30955 (array!83989) Bool)

(assert (=> start!108412 (and (array_inv!30955 _values!1187) e!730482)))

(declare-fun array_inv!30956 (array!83987) Bool)

(assert (=> start!108412 (array_inv!30956 _keys!1427)))

(declare-fun b!1278880 () Bool)

(assert (=> b!1278880 (= e!730483 false)))

(declare-fun lt!576200 () Bool)

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49681)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49681)

(declare-datatypes ((tuple2!21554 0))(
  ( (tuple2!21555 (_1!10788 (_ BitVec 64)) (_2!10788 V!49681)) )
))
(declare-datatypes ((List!28745 0))(
  ( (Nil!28742) (Cons!28741 (h!29959 tuple2!21554) (t!42275 List!28745)) )
))
(declare-datatypes ((ListLongMap!19219 0))(
  ( (ListLongMap!19220 (toList!9625 List!28745)) )
))
(declare-fun contains!7750 (ListLongMap!19219 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4694 (array!83987 array!83989 (_ BitVec 32) (_ BitVec 32) V!49681 V!49681 (_ BitVec 32) Int) ListLongMap!19219)

(assert (=> b!1278880 (= lt!576200 (contains!7750 (getCurrentListMap!4694 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun b!1278881 () Bool)

(assert (=> b!1278881 (= e!730485 tp_is_empty!33433)))

(declare-fun b!1278882 () Bool)

(declare-fun res!849424 () Bool)

(assert (=> b!1278882 (=> (not res!849424) (not e!730483))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83987 (_ BitVec 32)) Bool)

(assert (=> b!1278882 (= res!849424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(assert (= (and start!108412 res!849425) b!1278876))

(assert (= (and b!1278876 res!849426) b!1278882))

(assert (= (and b!1278882 res!849424) b!1278877))

(assert (= (and b!1278877 res!849427) b!1278880))

(assert (= (and b!1278879 condMapEmpty!51683) mapIsEmpty!51683))

(assert (= (and b!1278879 (not condMapEmpty!51683)) mapNonEmpty!51683))

(get-info :version)

(assert (= (and mapNonEmpty!51683 ((_ is ValueCellFull!15818) mapValue!51683)) b!1278881))

(assert (= (and b!1278879 ((_ is ValueCellFull!15818) mapDefault!51683)) b!1278878))

(assert (= start!108412 b!1278879))

(declare-fun m!1174773 () Bool)

(assert (=> b!1278880 m!1174773))

(assert (=> b!1278880 m!1174773))

(declare-fun m!1174775 () Bool)

(assert (=> b!1278880 m!1174775))

(declare-fun m!1174777 () Bool)

(assert (=> mapNonEmpty!51683 m!1174777))

(declare-fun m!1174779 () Bool)

(assert (=> start!108412 m!1174779))

(declare-fun m!1174781 () Bool)

(assert (=> start!108412 m!1174781))

(declare-fun m!1174783 () Bool)

(assert (=> start!108412 m!1174783))

(declare-fun m!1174785 () Bool)

(assert (=> b!1278882 m!1174785))

(declare-fun m!1174787 () Bool)

(assert (=> b!1278877 m!1174787))

(check-sat (not start!108412) (not b_next!27883) (not b!1278880) tp_is_empty!33433 (not mapNonEmpty!51683) (not b!1278882) (not b!1278877) b_and!45943)
(check-sat b_and!45943 (not b_next!27883))
