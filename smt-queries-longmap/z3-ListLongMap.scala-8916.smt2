; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108388 () Bool)

(assert start!108388)

(declare-fun b_free!27859 () Bool)

(declare-fun b_next!27859 () Bool)

(assert (=> start!108388 (= b_free!27859 (not b_next!27859))))

(declare-fun tp!98533 () Bool)

(declare-fun b_and!45919 () Bool)

(assert (=> start!108388 (= tp!98533 b_and!45919)))

(declare-fun b!1278624 () Bool)

(declare-fun res!849281 () Bool)

(declare-fun e!730303 () Bool)

(assert (=> b!1278624 (=> (not res!849281) (not e!730303))))

(declare-datatypes ((array!83941 0))(
  ( (array!83942 (arr!40476 (Array (_ BitVec 32) (_ BitVec 64))) (size!41027 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83941)

(declare-datatypes ((List!28728 0))(
  ( (Nil!28725) (Cons!28724 (h!29942 (_ BitVec 64)) (t!42258 List!28728)) )
))
(declare-fun arrayNoDuplicates!0 (array!83941 (_ BitVec 32) List!28728) Bool)

(assert (=> b!1278624 (= res!849281 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28725))))

(declare-fun b!1278625 () Bool)

(assert (=> b!1278625 (= e!730303 false)))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun lt!576164 () Bool)

(declare-fun defaultEntry!1195 () Int)

(declare-datatypes ((V!49649 0))(
  ( (V!49650 (val!16779 Int)) )
))
(declare-fun minValue!1129 () V!49649)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-datatypes ((ValueCell!15806 0))(
  ( (ValueCellFull!15806 (v!19372 V!49649)) (EmptyCell!15806) )
))
(declare-datatypes ((array!83943 0))(
  ( (array!83944 (arr!40477 (Array (_ BitVec 32) ValueCell!15806)) (size!41028 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83943)

(declare-fun zeroValue!1129 () V!49649)

(declare-datatypes ((tuple2!21538 0))(
  ( (tuple2!21539 (_1!10780 (_ BitVec 64)) (_2!10780 V!49649)) )
))
(declare-datatypes ((List!28729 0))(
  ( (Nil!28726) (Cons!28725 (h!29943 tuple2!21538) (t!42259 List!28729)) )
))
(declare-datatypes ((ListLongMap!19203 0))(
  ( (ListLongMap!19204 (toList!9617 List!28729)) )
))
(declare-fun contains!7742 (ListLongMap!19203 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4686 (array!83941 array!83943 (_ BitVec 32) (_ BitVec 32) V!49649 V!49649 (_ BitVec 32) Int) ListLongMap!19203)

(assert (=> b!1278625 (= lt!576164 (contains!7742 (getCurrentListMap!4686 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun mapNonEmpty!51647 () Bool)

(declare-fun mapRes!51647 () Bool)

(declare-fun tp!98534 () Bool)

(declare-fun e!730306 () Bool)

(assert (=> mapNonEmpty!51647 (= mapRes!51647 (and tp!98534 e!730306))))

(declare-fun mapValue!51647 () ValueCell!15806)

(declare-fun mapRest!51647 () (Array (_ BitVec 32) ValueCell!15806))

(declare-fun mapKey!51647 () (_ BitVec 32))

(assert (=> mapNonEmpty!51647 (= (arr!40477 _values!1187) (store mapRest!51647 mapKey!51647 mapValue!51647))))

(declare-fun b!1278626 () Bool)

(declare-fun e!730304 () Bool)

(declare-fun e!730305 () Bool)

(assert (=> b!1278626 (= e!730304 (and e!730305 mapRes!51647))))

(declare-fun condMapEmpty!51647 () Bool)

(declare-fun mapDefault!51647 () ValueCell!15806)

(assert (=> b!1278626 (= condMapEmpty!51647 (= (arr!40477 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15806)) mapDefault!51647)))))

(declare-fun mapIsEmpty!51647 () Bool)

(assert (=> mapIsEmpty!51647 mapRes!51647))

(declare-fun res!849280 () Bool)

(assert (=> start!108388 (=> (not res!849280) (not e!730303))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108388 (= res!849280 (validMask!0 mask!1805))))

(assert (=> start!108388 e!730303))

(assert (=> start!108388 true))

(assert (=> start!108388 tp!98533))

(declare-fun tp_is_empty!33409 () Bool)

(assert (=> start!108388 tp_is_empty!33409))

(declare-fun array_inv!30941 (array!83943) Bool)

(assert (=> start!108388 (and (array_inv!30941 _values!1187) e!730304)))

(declare-fun array_inv!30942 (array!83941) Bool)

(assert (=> start!108388 (array_inv!30942 _keys!1427)))

(declare-fun b!1278627 () Bool)

(assert (=> b!1278627 (= e!730305 tp_is_empty!33409)))

(declare-fun b!1278628 () Bool)

(declare-fun res!849283 () Bool)

(assert (=> b!1278628 (=> (not res!849283) (not e!730303))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83941 (_ BitVec 32)) Bool)

(assert (=> b!1278628 (= res!849283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1278629 () Bool)

(assert (=> b!1278629 (= e!730306 tp_is_empty!33409)))

(declare-fun b!1278630 () Bool)

(declare-fun res!849282 () Bool)

(assert (=> b!1278630 (=> (not res!849282) (not e!730303))))

(assert (=> b!1278630 (= res!849282 (and (= (size!41028 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!41027 _keys!1427) (size!41028 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(assert (= (and start!108388 res!849280) b!1278630))

(assert (= (and b!1278630 res!849282) b!1278628))

(assert (= (and b!1278628 res!849283) b!1278624))

(assert (= (and b!1278624 res!849281) b!1278625))

(assert (= (and b!1278626 condMapEmpty!51647) mapIsEmpty!51647))

(assert (= (and b!1278626 (not condMapEmpty!51647)) mapNonEmpty!51647))

(get-info :version)

(assert (= (and mapNonEmpty!51647 ((_ is ValueCellFull!15806) mapValue!51647)) b!1278629))

(assert (= (and b!1278626 ((_ is ValueCellFull!15806) mapDefault!51647)) b!1278627))

(assert (= start!108388 b!1278626))

(declare-fun m!1174581 () Bool)

(assert (=> b!1278628 m!1174581))

(declare-fun m!1174583 () Bool)

(assert (=> b!1278624 m!1174583))

(declare-fun m!1174585 () Bool)

(assert (=> mapNonEmpty!51647 m!1174585))

(declare-fun m!1174587 () Bool)

(assert (=> b!1278625 m!1174587))

(assert (=> b!1278625 m!1174587))

(declare-fun m!1174589 () Bool)

(assert (=> b!1278625 m!1174589))

(declare-fun m!1174591 () Bool)

(assert (=> start!108388 m!1174591))

(declare-fun m!1174593 () Bool)

(assert (=> start!108388 m!1174593))

(declare-fun m!1174595 () Bool)

(assert (=> start!108388 m!1174595))

(check-sat (not b_next!27859) (not b!1278624) (not b!1278628) (not mapNonEmpty!51647) (not start!108388) b_and!45919 tp_is_empty!33409 (not b!1278625))
(check-sat b_and!45919 (not b_next!27859))
