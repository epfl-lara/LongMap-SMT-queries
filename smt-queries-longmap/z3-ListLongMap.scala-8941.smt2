; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108372 () Bool)

(assert start!108372)

(declare-fun b_free!27919 () Bool)

(declare-fun b_next!27919 () Bool)

(assert (=> start!108372 (= b_free!27919 (not b_next!27919))))

(declare-fun tp!98868 () Bool)

(declare-fun b_and!45961 () Bool)

(assert (=> start!108372 (= tp!98868 b_and!45961)))

(declare-fun b!1278968 () Bool)

(declare-fun res!849625 () Bool)

(declare-fun e!730731 () Bool)

(assert (=> b!1278968 (=> (not res!849625) (not e!730731))))

(declare-datatypes ((array!84099 0))(
  ( (array!84100 (arr!40554 (Array (_ BitVec 32) (_ BitVec 64))) (size!41106 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84099)

(declare-datatypes ((List!28833 0))(
  ( (Nil!28830) (Cons!28829 (h!30038 (_ BitVec 64)) (t!42365 List!28833)) )
))
(declare-fun arrayNoDuplicates!0 (array!84099 (_ BitVec 32) List!28833) Bool)

(assert (=> b!1278968 (= res!849625 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28830))))

(declare-fun b!1278969 () Bool)

(declare-fun e!730728 () Bool)

(declare-fun e!730730 () Bool)

(declare-fun mapRes!51890 () Bool)

(assert (=> b!1278969 (= e!730728 (and e!730730 mapRes!51890))))

(declare-fun condMapEmpty!51890 () Bool)

(declare-datatypes ((V!49849 0))(
  ( (V!49850 (val!16854 Int)) )
))
(declare-datatypes ((ValueCell!15881 0))(
  ( (ValueCellFull!15881 (v!19453 V!49849)) (EmptyCell!15881) )
))
(declare-datatypes ((array!84101 0))(
  ( (array!84102 (arr!40555 (Array (_ BitVec 32) ValueCell!15881)) (size!41107 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84101)

(declare-fun mapDefault!51890 () ValueCell!15881)

(assert (=> b!1278969 (= condMapEmpty!51890 (= (arr!40555 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15881)) mapDefault!51890)))))

(declare-fun b!1278970 () Bool)

(declare-fun tp_is_empty!33559 () Bool)

(assert (=> b!1278970 (= e!730730 tp_is_empty!33559)))

(declare-fun b!1278971 () Bool)

(declare-fun e!730727 () Bool)

(assert (=> b!1278971 (= e!730727 tp_is_empty!33559)))

(declare-fun res!849629 () Bool)

(assert (=> start!108372 (=> (not res!849629) (not e!730731))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108372 (= res!849629 (validMask!0 mask!2175))))

(assert (=> start!108372 e!730731))

(assert (=> start!108372 tp_is_empty!33559))

(assert (=> start!108372 true))

(declare-fun array_inv!30955 (array!84101) Bool)

(assert (=> start!108372 (and (array_inv!30955 _values!1445) e!730728)))

(declare-fun array_inv!30956 (array!84099) Bool)

(assert (=> start!108372 (array_inv!30956 _keys!1741)))

(assert (=> start!108372 tp!98868))

(declare-fun b!1278972 () Bool)

(declare-fun res!849627 () Bool)

(assert (=> b!1278972 (=> (not res!849627) (not e!730731))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1278972 (= res!849627 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41106 _keys!1741))))))

(declare-fun b!1278973 () Bool)

(declare-fun res!849628 () Bool)

(assert (=> b!1278973 (=> (not res!849628) (not e!730731))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84099 (_ BitVec 32)) Bool)

(assert (=> b!1278973 (= res!849628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!51890 () Bool)

(assert (=> mapIsEmpty!51890 mapRes!51890))

(declare-fun b!1278974 () Bool)

(assert (=> b!1278974 (= e!730731 false)))

(declare-fun minValue!1387 () V!49849)

(declare-fun zeroValue!1387 () V!49849)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-fun lt!575782 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((tuple2!21642 0))(
  ( (tuple2!21643 (_1!10832 (_ BitVec 64)) (_2!10832 V!49849)) )
))
(declare-datatypes ((List!28834 0))(
  ( (Nil!28831) (Cons!28830 (h!30039 tuple2!21642) (t!42366 List!28834)) )
))
(declare-datatypes ((ListLongMap!19299 0))(
  ( (ListLongMap!19300 (toList!9665 List!28834)) )
))
(declare-fun contains!7710 (ListLongMap!19299 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4639 (array!84099 array!84101 (_ BitVec 32) (_ BitVec 32) V!49849 V!49849 (_ BitVec 32) Int) ListLongMap!19299)

(assert (=> b!1278974 (= lt!575782 (contains!7710 (getCurrentListMap!4639 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!51890 () Bool)

(declare-fun tp!98867 () Bool)

(assert (=> mapNonEmpty!51890 (= mapRes!51890 (and tp!98867 e!730727))))

(declare-fun mapValue!51890 () ValueCell!15881)

(declare-fun mapRest!51890 () (Array (_ BitVec 32) ValueCell!15881))

(declare-fun mapKey!51890 () (_ BitVec 32))

(assert (=> mapNonEmpty!51890 (= (arr!40555 _values!1445) (store mapRest!51890 mapKey!51890 mapValue!51890))))

(declare-fun b!1278975 () Bool)

(declare-fun res!849626 () Bool)

(assert (=> b!1278975 (=> (not res!849626) (not e!730731))))

(assert (=> b!1278975 (= res!849626 (and (= (size!41107 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41106 _keys!1741) (size!41107 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!108372 res!849629) b!1278975))

(assert (= (and b!1278975 res!849626) b!1278973))

(assert (= (and b!1278973 res!849628) b!1278968))

(assert (= (and b!1278968 res!849625) b!1278972))

(assert (= (and b!1278972 res!849627) b!1278974))

(assert (= (and b!1278969 condMapEmpty!51890) mapIsEmpty!51890))

(assert (= (and b!1278969 (not condMapEmpty!51890)) mapNonEmpty!51890))

(get-info :version)

(assert (= (and mapNonEmpty!51890 ((_ is ValueCellFull!15881) mapValue!51890)) b!1278971))

(assert (= (and b!1278969 ((_ is ValueCellFull!15881) mapDefault!51890)) b!1278970))

(assert (= start!108372 b!1278969))

(declare-fun m!1173633 () Bool)

(assert (=> mapNonEmpty!51890 m!1173633))

(declare-fun m!1173635 () Bool)

(assert (=> b!1278973 m!1173635))

(declare-fun m!1173637 () Bool)

(assert (=> b!1278968 m!1173637))

(declare-fun m!1173639 () Bool)

(assert (=> start!108372 m!1173639))

(declare-fun m!1173641 () Bool)

(assert (=> start!108372 m!1173641))

(declare-fun m!1173643 () Bool)

(assert (=> start!108372 m!1173643))

(declare-fun m!1173645 () Bool)

(assert (=> b!1278974 m!1173645))

(assert (=> b!1278974 m!1173645))

(declare-fun m!1173647 () Bool)

(assert (=> b!1278974 m!1173647))

(check-sat (not start!108372) (not b_next!27919) (not b!1278974) (not b!1278973) tp_is_empty!33559 b_and!45961 (not mapNonEmpty!51890) (not b!1278968))
(check-sat b_and!45961 (not b_next!27919))
