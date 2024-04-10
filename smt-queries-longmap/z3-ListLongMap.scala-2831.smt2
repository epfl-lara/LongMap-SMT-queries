; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40952 () Bool)

(assert start!40952)

(declare-fun b_free!10887 () Bool)

(declare-fun b_next!10887 () Bool)

(assert (=> start!40952 (= b_free!10887 (not b_next!10887))))

(declare-fun tp!38488 () Bool)

(declare-fun b_and!19029 () Bool)

(assert (=> start!40952 (= tp!38488 b_and!19029)))

(declare-fun b!455582 () Bool)

(declare-fun e!266338 () Bool)

(declare-fun e!266341 () Bool)

(assert (=> b!455582 (= e!266338 e!266341)))

(declare-fun res!271686 () Bool)

(assert (=> b!455582 (=> (not res!271686) (not e!266341))))

(declare-datatypes ((array!28253 0))(
  ( (array!28254 (arr!13570 (Array (_ BitVec 32) (_ BitVec 64))) (size!13922 (_ BitVec 32))) )
))
(declare-fun lt!206365 () array!28253)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28253 (_ BitVec 32)) Bool)

(assert (=> b!455582 (= res!271686 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206365 mask!1025))))

(declare-fun _keys!709 () array!28253)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!455582 (= lt!206365 (array!28254 (store (arr!13570 _keys!709) i!563 k0!794) (size!13922 _keys!709)))))

(declare-fun b!455583 () Bool)

(declare-fun e!266339 () Bool)

(declare-fun e!266340 () Bool)

(declare-fun mapRes!19978 () Bool)

(assert (=> b!455583 (= e!266339 (and e!266340 mapRes!19978))))

(declare-fun condMapEmpty!19978 () Bool)

(declare-datatypes ((V!17405 0))(
  ( (V!17406 (val!6157 Int)) )
))
(declare-datatypes ((ValueCell!5769 0))(
  ( (ValueCellFull!5769 (v!8423 V!17405)) (EmptyCell!5769) )
))
(declare-datatypes ((array!28255 0))(
  ( (array!28256 (arr!13571 (Array (_ BitVec 32) ValueCell!5769)) (size!13923 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28255)

(declare-fun mapDefault!19978 () ValueCell!5769)

(assert (=> b!455583 (= condMapEmpty!19978 (= (arr!13571 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5769)) mapDefault!19978)))))

(declare-fun mapNonEmpty!19978 () Bool)

(declare-fun tp!38487 () Bool)

(declare-fun e!266336 () Bool)

(assert (=> mapNonEmpty!19978 (= mapRes!19978 (and tp!38487 e!266336))))

(declare-fun mapRest!19978 () (Array (_ BitVec 32) ValueCell!5769))

(declare-fun mapValue!19978 () ValueCell!5769)

(declare-fun mapKey!19978 () (_ BitVec 32))

(assert (=> mapNonEmpty!19978 (= (arr!13571 _values!549) (store mapRest!19978 mapKey!19978 mapValue!19978))))

(declare-fun b!455584 () Bool)

(declare-fun res!271680 () Bool)

(assert (=> b!455584 (=> (not res!271680) (not e!266338))))

(assert (=> b!455584 (= res!271680 (or (= (select (arr!13570 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13570 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!455585 () Bool)

(declare-fun res!271682 () Bool)

(assert (=> b!455585 (=> (not res!271682) (not e!266338))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!455585 (= res!271682 (and (= (size!13923 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13922 _keys!709) (size!13923 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!455586 () Bool)

(declare-fun res!271691 () Bool)

(assert (=> b!455586 (=> (not res!271691) (not e!266338))))

(assert (=> b!455586 (= res!271691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!455588 () Bool)

(assert (=> b!455588 (= e!266341 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!17405)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!8112 0))(
  ( (tuple2!8113 (_1!4067 (_ BitVec 64)) (_2!4067 V!17405)) )
))
(declare-datatypes ((List!8179 0))(
  ( (Nil!8176) (Cons!8175 (h!9031 tuple2!8112) (t!14007 List!8179)) )
))
(declare-datatypes ((ListLongMap!7025 0))(
  ( (ListLongMap!7026 (toList!3528 List!8179)) )
))
(declare-fun lt!206366 () ListLongMap!7025)

(declare-fun zeroValue!515 () V!17405)

(declare-fun v!412 () V!17405)

(declare-fun getCurrentListMapNoExtraKeys!1711 (array!28253 array!28255 (_ BitVec 32) (_ BitVec 32) V!17405 V!17405 (_ BitVec 32) Int) ListLongMap!7025)

(assert (=> b!455588 (= lt!206366 (getCurrentListMapNoExtraKeys!1711 lt!206365 (array!28256 (store (arr!13571 _values!549) i!563 (ValueCellFull!5769 v!412)) (size!13923 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206364 () ListLongMap!7025)

(assert (=> b!455588 (= lt!206364 (getCurrentListMapNoExtraKeys!1711 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!455589 () Bool)

(declare-fun res!271681 () Bool)

(assert (=> b!455589 (=> (not res!271681) (not e!266338))))

(assert (=> b!455589 (= res!271681 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13922 _keys!709))))))

(declare-fun b!455590 () Bool)

(declare-fun res!271684 () Bool)

(assert (=> b!455590 (=> (not res!271684) (not e!266341))))

(assert (=> b!455590 (= res!271684 (bvsle from!863 i!563))))

(declare-fun b!455591 () Bool)

(declare-fun res!271685 () Bool)

(assert (=> b!455591 (=> (not res!271685) (not e!266341))))

(declare-datatypes ((List!8180 0))(
  ( (Nil!8177) (Cons!8176 (h!9032 (_ BitVec 64)) (t!14008 List!8180)) )
))
(declare-fun arrayNoDuplicates!0 (array!28253 (_ BitVec 32) List!8180) Bool)

(assert (=> b!455591 (= res!271685 (arrayNoDuplicates!0 lt!206365 #b00000000000000000000000000000000 Nil!8177))))

(declare-fun b!455592 () Bool)

(declare-fun res!271689 () Bool)

(assert (=> b!455592 (=> (not res!271689) (not e!266338))))

(assert (=> b!455592 (= res!271689 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8177))))

(declare-fun b!455593 () Bool)

(declare-fun tp_is_empty!12225 () Bool)

(assert (=> b!455593 (= e!266336 tp_is_empty!12225)))

(declare-fun b!455594 () Bool)

(declare-fun res!271683 () Bool)

(assert (=> b!455594 (=> (not res!271683) (not e!266338))))

(declare-fun arrayContainsKey!0 (array!28253 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!455594 (= res!271683 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!455595 () Bool)

(declare-fun res!271688 () Bool)

(assert (=> b!455595 (=> (not res!271688) (not e!266338))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!455595 (= res!271688 (validKeyInArray!0 k0!794))))

(declare-fun b!455596 () Bool)

(declare-fun res!271687 () Bool)

(assert (=> b!455596 (=> (not res!271687) (not e!266338))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!455596 (= res!271687 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!19978 () Bool)

(assert (=> mapIsEmpty!19978 mapRes!19978))

(declare-fun b!455587 () Bool)

(assert (=> b!455587 (= e!266340 tp_is_empty!12225)))

(declare-fun res!271690 () Bool)

(assert (=> start!40952 (=> (not res!271690) (not e!266338))))

(assert (=> start!40952 (= res!271690 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13922 _keys!709))))))

(assert (=> start!40952 e!266338))

(assert (=> start!40952 tp_is_empty!12225))

(assert (=> start!40952 tp!38488))

(assert (=> start!40952 true))

(declare-fun array_inv!9832 (array!28255) Bool)

(assert (=> start!40952 (and (array_inv!9832 _values!549) e!266339)))

(declare-fun array_inv!9833 (array!28253) Bool)

(assert (=> start!40952 (array_inv!9833 _keys!709)))

(assert (= (and start!40952 res!271690) b!455596))

(assert (= (and b!455596 res!271687) b!455585))

(assert (= (and b!455585 res!271682) b!455586))

(assert (= (and b!455586 res!271691) b!455592))

(assert (= (and b!455592 res!271689) b!455589))

(assert (= (and b!455589 res!271681) b!455595))

(assert (= (and b!455595 res!271688) b!455584))

(assert (= (and b!455584 res!271680) b!455594))

(assert (= (and b!455594 res!271683) b!455582))

(assert (= (and b!455582 res!271686) b!455591))

(assert (= (and b!455591 res!271685) b!455590))

(assert (= (and b!455590 res!271684) b!455588))

(assert (= (and b!455583 condMapEmpty!19978) mapIsEmpty!19978))

(assert (= (and b!455583 (not condMapEmpty!19978)) mapNonEmpty!19978))

(get-info :version)

(assert (= (and mapNonEmpty!19978 ((_ is ValueCellFull!5769) mapValue!19978)) b!455593))

(assert (= (and b!455583 ((_ is ValueCellFull!5769) mapDefault!19978)) b!455587))

(assert (= start!40952 b!455583))

(declare-fun m!439321 () Bool)

(assert (=> b!455594 m!439321))

(declare-fun m!439323 () Bool)

(assert (=> b!455582 m!439323))

(declare-fun m!439325 () Bool)

(assert (=> b!455582 m!439325))

(declare-fun m!439327 () Bool)

(assert (=> b!455595 m!439327))

(declare-fun m!439329 () Bool)

(assert (=> b!455586 m!439329))

(declare-fun m!439331 () Bool)

(assert (=> b!455596 m!439331))

(declare-fun m!439333 () Bool)

(assert (=> mapNonEmpty!19978 m!439333))

(declare-fun m!439335 () Bool)

(assert (=> b!455592 m!439335))

(declare-fun m!439337 () Bool)

(assert (=> start!40952 m!439337))

(declare-fun m!439339 () Bool)

(assert (=> start!40952 m!439339))

(declare-fun m!439341 () Bool)

(assert (=> b!455584 m!439341))

(declare-fun m!439343 () Bool)

(assert (=> b!455588 m!439343))

(declare-fun m!439345 () Bool)

(assert (=> b!455588 m!439345))

(declare-fun m!439347 () Bool)

(assert (=> b!455588 m!439347))

(declare-fun m!439349 () Bool)

(assert (=> b!455591 m!439349))

(check-sat (not b!455588) (not start!40952) (not b!455596) (not mapNonEmpty!19978) (not b!455592) tp_is_empty!12225 b_and!19029 (not b!455594) (not b!455586) (not b!455582) (not b!455591) (not b_next!10887) (not b!455595))
(check-sat b_and!19029 (not b_next!10887))
