; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72600 () Bool)

(assert start!72600)

(declare-fun b!842765 () Bool)

(declare-fun res!572776 () Bool)

(declare-fun e!470122 () Bool)

(assert (=> b!842765 (=> (not res!572776) (not e!470122))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842765 (= res!572776 (validMask!0 mask!1196))))

(declare-fun b!842766 () Bool)

(assert (=> b!842766 (= e!470122 false)))

(declare-fun lt!381043 () Bool)

(declare-datatypes ((array!47570 0))(
  ( (array!47571 (arr!22816 (Array (_ BitVec 32) (_ BitVec 64))) (size!23256 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47570)

(declare-datatypes ((List!16221 0))(
  ( (Nil!16218) (Cons!16217 (h!17348 (_ BitVec 64)) (t!22592 List!16221)) )
))
(declare-fun arrayNoDuplicates!0 (array!47570 (_ BitVec 32) List!16221) Bool)

(assert (=> b!842766 (= lt!381043 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16218))))

(declare-fun b!842767 () Bool)

(declare-fun res!572774 () Bool)

(assert (=> b!842767 (=> (not res!572774) (not e!470122))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!25915 0))(
  ( (V!25916 (val!7873 Int)) )
))
(declare-datatypes ((ValueCell!7386 0))(
  ( (ValueCellFull!7386 (v!10298 V!25915)) (EmptyCell!7386) )
))
(declare-datatypes ((array!47572 0))(
  ( (array!47573 (arr!22817 (Array (_ BitVec 32) ValueCell!7386)) (size!23257 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47572)

(assert (=> b!842767 (= res!572774 (and (= (size!23257 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23256 _keys!868) (size!23257 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!25076 () Bool)

(declare-fun mapRes!25076 () Bool)

(declare-fun tp!48394 () Bool)

(declare-fun e!470120 () Bool)

(assert (=> mapNonEmpty!25076 (= mapRes!25076 (and tp!48394 e!470120))))

(declare-fun mapRest!25076 () (Array (_ BitVec 32) ValueCell!7386))

(declare-fun mapKey!25076 () (_ BitVec 32))

(declare-fun mapValue!25076 () ValueCell!7386)

(assert (=> mapNonEmpty!25076 (= (arr!22817 _values!688) (store mapRest!25076 mapKey!25076 mapValue!25076))))

(declare-fun res!572777 () Bool)

(assert (=> start!72600 (=> (not res!572777) (not e!470122))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72600 (= res!572777 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23256 _keys!868))))))

(assert (=> start!72600 e!470122))

(assert (=> start!72600 true))

(declare-fun array_inv!18154 (array!47570) Bool)

(assert (=> start!72600 (array_inv!18154 _keys!868)))

(declare-fun e!470121 () Bool)

(declare-fun array_inv!18155 (array!47572) Bool)

(assert (=> start!72600 (and (array_inv!18155 _values!688) e!470121)))

(declare-fun mapIsEmpty!25076 () Bool)

(assert (=> mapIsEmpty!25076 mapRes!25076))

(declare-fun b!842768 () Bool)

(declare-fun res!572775 () Bool)

(assert (=> b!842768 (=> (not res!572775) (not e!470122))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47570 (_ BitVec 32)) Bool)

(assert (=> b!842768 (= res!572775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!842769 () Bool)

(declare-fun tp_is_empty!15651 () Bool)

(assert (=> b!842769 (= e!470120 tp_is_empty!15651)))

(declare-fun b!842770 () Bool)

(declare-fun e!470119 () Bool)

(assert (=> b!842770 (= e!470119 tp_is_empty!15651)))

(declare-fun b!842771 () Bool)

(assert (=> b!842771 (= e!470121 (and e!470119 mapRes!25076))))

(declare-fun condMapEmpty!25076 () Bool)

(declare-fun mapDefault!25076 () ValueCell!7386)

(assert (=> b!842771 (= condMapEmpty!25076 (= (arr!22817 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7386)) mapDefault!25076)))))

(assert (= (and start!72600 res!572777) b!842765))

(assert (= (and b!842765 res!572776) b!842767))

(assert (= (and b!842767 res!572774) b!842768))

(assert (= (and b!842768 res!572775) b!842766))

(assert (= (and b!842771 condMapEmpty!25076) mapIsEmpty!25076))

(assert (= (and b!842771 (not condMapEmpty!25076)) mapNonEmpty!25076))

(get-info :version)

(assert (= (and mapNonEmpty!25076 ((_ is ValueCellFull!7386) mapValue!25076)) b!842769))

(assert (= (and b!842771 ((_ is ValueCellFull!7386) mapDefault!25076)) b!842770))

(assert (= start!72600 b!842771))

(declare-fun m!785733 () Bool)

(assert (=> b!842766 m!785733))

(declare-fun m!785735 () Bool)

(assert (=> start!72600 m!785735))

(declare-fun m!785737 () Bool)

(assert (=> start!72600 m!785737))

(declare-fun m!785739 () Bool)

(assert (=> mapNonEmpty!25076 m!785739))

(declare-fun m!785741 () Bool)

(assert (=> b!842765 m!785741))

(declare-fun m!785743 () Bool)

(assert (=> b!842768 m!785743))

(check-sat (not mapNonEmpty!25076) (not b!842768) (not start!72600) tp_is_empty!15651 (not b!842766) (not b!842765))
(check-sat)
