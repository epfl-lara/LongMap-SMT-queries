; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108394 () Bool)

(assert start!108394)

(declare-fun b_free!27865 () Bool)

(declare-fun b_next!27865 () Bool)

(assert (=> start!108394 (= b_free!27865 (not b_next!27865))))

(declare-fun tp!98552 () Bool)

(declare-fun b_and!45925 () Bool)

(assert (=> start!108394 (= tp!98552 b_and!45925)))

(declare-fun mapIsEmpty!51656 () Bool)

(declare-fun mapRes!51656 () Bool)

(assert (=> mapIsEmpty!51656 mapRes!51656))

(declare-fun b!1278687 () Bool)

(declare-fun e!730349 () Bool)

(declare-fun tp_is_empty!33415 () Bool)

(assert (=> b!1278687 (= e!730349 tp_is_empty!33415)))

(declare-fun b!1278688 () Bool)

(declare-fun res!849316 () Bool)

(declare-fun e!730347 () Bool)

(assert (=> b!1278688 (=> (not res!849316) (not e!730347))))

(declare-datatypes ((array!83953 0))(
  ( (array!83954 (arr!40482 (Array (_ BitVec 32) (_ BitVec 64))) (size!41033 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83953)

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83953 (_ BitVec 32)) Bool)

(assert (=> b!1278688 (= res!849316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1278689 () Bool)

(declare-fun res!849317 () Bool)

(assert (=> b!1278689 (=> (not res!849317) (not e!730347))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((V!49657 0))(
  ( (V!49658 (val!16782 Int)) )
))
(declare-datatypes ((ValueCell!15809 0))(
  ( (ValueCellFull!15809 (v!19375 V!49657)) (EmptyCell!15809) )
))
(declare-datatypes ((array!83955 0))(
  ( (array!83956 (arr!40483 (Array (_ BitVec 32) ValueCell!15809)) (size!41034 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83955)

(assert (=> b!1278689 (= res!849317 (and (= (size!41034 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!41033 _keys!1427) (size!41034 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1278690 () Bool)

(declare-fun e!730348 () Bool)

(declare-fun e!730351 () Bool)

(assert (=> b!1278690 (= e!730348 (and e!730351 mapRes!51656))))

(declare-fun condMapEmpty!51656 () Bool)

(declare-fun mapDefault!51656 () ValueCell!15809)

(assert (=> b!1278690 (= condMapEmpty!51656 (= (arr!40483 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15809)) mapDefault!51656)))))

(declare-fun res!849318 () Bool)

(assert (=> start!108394 (=> (not res!849318) (not e!730347))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108394 (= res!849318 (validMask!0 mask!1805))))

(assert (=> start!108394 e!730347))

(assert (=> start!108394 true))

(assert (=> start!108394 tp!98552))

(assert (=> start!108394 tp_is_empty!33415))

(declare-fun array_inv!30943 (array!83955) Bool)

(assert (=> start!108394 (and (array_inv!30943 _values!1187) e!730348)))

(declare-fun array_inv!30944 (array!83953) Bool)

(assert (=> start!108394 (array_inv!30944 _keys!1427)))

(declare-fun b!1278691 () Bool)

(assert (=> b!1278691 (= e!730347 false)))

(declare-fun lt!576173 () Bool)

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49657)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49657)

(declare-datatypes ((tuple2!21542 0))(
  ( (tuple2!21543 (_1!10782 (_ BitVec 64)) (_2!10782 V!49657)) )
))
(declare-datatypes ((List!28731 0))(
  ( (Nil!28728) (Cons!28727 (h!29945 tuple2!21542) (t!42261 List!28731)) )
))
(declare-datatypes ((ListLongMap!19207 0))(
  ( (ListLongMap!19208 (toList!9619 List!28731)) )
))
(declare-fun contains!7744 (ListLongMap!19207 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4688 (array!83953 array!83955 (_ BitVec 32) (_ BitVec 32) V!49657 V!49657 (_ BitVec 32) Int) ListLongMap!19207)

(assert (=> b!1278691 (= lt!576173 (contains!7744 (getCurrentListMap!4688 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun b!1278692 () Bool)

(assert (=> b!1278692 (= e!730351 tp_is_empty!33415)))

(declare-fun b!1278693 () Bool)

(declare-fun res!849319 () Bool)

(assert (=> b!1278693 (=> (not res!849319) (not e!730347))))

(declare-datatypes ((List!28732 0))(
  ( (Nil!28729) (Cons!28728 (h!29946 (_ BitVec 64)) (t!42262 List!28732)) )
))
(declare-fun arrayNoDuplicates!0 (array!83953 (_ BitVec 32) List!28732) Bool)

(assert (=> b!1278693 (= res!849319 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28729))))

(declare-fun mapNonEmpty!51656 () Bool)

(declare-fun tp!98551 () Bool)

(assert (=> mapNonEmpty!51656 (= mapRes!51656 (and tp!98551 e!730349))))

(declare-fun mapValue!51656 () ValueCell!15809)

(declare-fun mapKey!51656 () (_ BitVec 32))

(declare-fun mapRest!51656 () (Array (_ BitVec 32) ValueCell!15809))

(assert (=> mapNonEmpty!51656 (= (arr!40483 _values!1187) (store mapRest!51656 mapKey!51656 mapValue!51656))))

(assert (= (and start!108394 res!849318) b!1278689))

(assert (= (and b!1278689 res!849317) b!1278688))

(assert (= (and b!1278688 res!849316) b!1278693))

(assert (= (and b!1278693 res!849319) b!1278691))

(assert (= (and b!1278690 condMapEmpty!51656) mapIsEmpty!51656))

(assert (= (and b!1278690 (not condMapEmpty!51656)) mapNonEmpty!51656))

(get-info :version)

(assert (= (and mapNonEmpty!51656 ((_ is ValueCellFull!15809) mapValue!51656)) b!1278687))

(assert (= (and b!1278690 ((_ is ValueCellFull!15809) mapDefault!51656)) b!1278692))

(assert (= start!108394 b!1278690))

(declare-fun m!1174629 () Bool)

(assert (=> b!1278693 m!1174629))

(declare-fun m!1174631 () Bool)

(assert (=> start!108394 m!1174631))

(declare-fun m!1174633 () Bool)

(assert (=> start!108394 m!1174633))

(declare-fun m!1174635 () Bool)

(assert (=> start!108394 m!1174635))

(declare-fun m!1174637 () Bool)

(assert (=> b!1278688 m!1174637))

(declare-fun m!1174639 () Bool)

(assert (=> b!1278691 m!1174639))

(assert (=> b!1278691 m!1174639))

(declare-fun m!1174641 () Bool)

(assert (=> b!1278691 m!1174641))

(declare-fun m!1174643 () Bool)

(assert (=> mapNonEmpty!51656 m!1174643))

(check-sat (not start!108394) (not mapNonEmpty!51656) (not b!1278693) (not b_next!27865) (not b!1278688) tp_is_empty!33415 (not b!1278691) b_and!45925)
(check-sat b_and!45925 (not b_next!27865))
