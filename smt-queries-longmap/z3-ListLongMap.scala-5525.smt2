; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73102 () Bool)

(assert start!73102)

(declare-fun b_free!13849 () Bool)

(declare-fun b_next!13849 () Bool)

(assert (=> start!73102 (= b_free!13849 (not b_next!13849))))

(declare-fun tp!49051 () Bool)

(declare-fun b_and!22945 () Bool)

(assert (=> start!73102 (= tp!49051 b_and!22945)))

(declare-fun b!847795 () Bool)

(declare-fun e!473206 () Bool)

(declare-fun e!473205 () Bool)

(declare-fun mapRes!25577 () Bool)

(assert (=> b!847795 (= e!473206 (and e!473205 mapRes!25577))))

(declare-fun condMapEmpty!25577 () Bool)

(declare-datatypes ((V!26361 0))(
  ( (V!26362 (val!8040 Int)) )
))
(declare-datatypes ((ValueCell!7553 0))(
  ( (ValueCellFull!7553 (v!10465 V!26361)) (EmptyCell!7553) )
))
(declare-datatypes ((array!48233 0))(
  ( (array!48234 (arr!23143 (Array (_ BitVec 32) ValueCell!7553)) (size!23584 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48233)

(declare-fun mapDefault!25577 () ValueCell!7553)

(assert (=> b!847795 (= condMapEmpty!25577 (= (arr!23143 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7553)) mapDefault!25577)))))

(declare-fun b!847796 () Bool)

(declare-fun res!575749 () Bool)

(declare-fun e!473209 () Bool)

(assert (=> b!847796 (=> (not res!575749) (not e!473209))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!847796 (= res!575749 (validKeyInArray!0 k0!854))))

(declare-fun b!847797 () Bool)

(declare-fun res!575742 () Bool)

(assert (=> b!847797 (=> (not res!575742) (not e!473209))))

(declare-datatypes ((array!48235 0))(
  ( (array!48236 (arr!23144 (Array (_ BitVec 32) (_ BitVec 64))) (size!23585 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48235)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48235 (_ BitVec 32)) Bool)

(assert (=> b!847797 (= res!575742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!847798 () Bool)

(declare-fun res!575747 () Bool)

(assert (=> b!847798 (=> (not res!575747) (not e!473209))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!847798 (= res!575747 (validMask!0 mask!1196))))

(declare-fun b!847799 () Bool)

(declare-fun res!575744 () Bool)

(assert (=> b!847799 (=> (not res!575744) (not e!473209))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!847799 (= res!575744 (and (= (size!23584 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23585 _keys!868) (size!23584 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!847800 () Bool)

(assert (=> b!847800 (= e!473209 false)))

(declare-datatypes ((tuple2!10426 0))(
  ( (tuple2!10427 (_1!5224 (_ BitVec 64)) (_2!5224 V!26361)) )
))
(declare-datatypes ((List!16299 0))(
  ( (Nil!16296) (Cons!16295 (h!17432 tuple2!10426) (t!22662 List!16299)) )
))
(declare-datatypes ((ListLongMap!9197 0))(
  ( (ListLongMap!9198 (toList!4614 List!16299)) )
))
(declare-fun lt!381980 () ListLongMap!9197)

(declare-fun v!557 () V!26361)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26361)

(declare-fun zeroValue!654 () V!26361)

(declare-fun getCurrentListMapNoExtraKeys!2672 (array!48235 array!48233 (_ BitVec 32) (_ BitVec 32) V!26361 V!26361 (_ BitVec 32) Int) ListLongMap!9197)

(assert (=> b!847800 (= lt!381980 (getCurrentListMapNoExtraKeys!2672 _keys!868 (array!48234 (store (arr!23143 _values!688) i!612 (ValueCellFull!7553 v!557)) (size!23584 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!381979 () ListLongMap!9197)

(assert (=> b!847800 (= lt!381979 (getCurrentListMapNoExtraKeys!2672 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!25577 () Bool)

(assert (=> mapIsEmpty!25577 mapRes!25577))

(declare-fun b!847801 () Bool)

(declare-fun res!575745 () Bool)

(assert (=> b!847801 (=> (not res!575745) (not e!473209))))

(declare-datatypes ((List!16300 0))(
  ( (Nil!16297) (Cons!16296 (h!17433 (_ BitVec 64)) (t!22663 List!16300)) )
))
(declare-fun arrayNoDuplicates!0 (array!48235 (_ BitVec 32) List!16300) Bool)

(assert (=> b!847801 (= res!575745 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16297))))

(declare-fun res!575748 () Bool)

(assert (=> start!73102 (=> (not res!575748) (not e!473209))))

(assert (=> start!73102 (= res!575748 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23585 _keys!868))))))

(assert (=> start!73102 e!473209))

(declare-fun tp_is_empty!15985 () Bool)

(assert (=> start!73102 tp_is_empty!15985))

(assert (=> start!73102 true))

(assert (=> start!73102 tp!49051))

(declare-fun array_inv!18434 (array!48235) Bool)

(assert (=> start!73102 (array_inv!18434 _keys!868)))

(declare-fun array_inv!18435 (array!48233) Bool)

(assert (=> start!73102 (and (array_inv!18435 _values!688) e!473206)))

(declare-fun b!847802 () Bool)

(declare-fun res!575743 () Bool)

(assert (=> b!847802 (=> (not res!575743) (not e!473209))))

(assert (=> b!847802 (= res!575743 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23585 _keys!868))))))

(declare-fun b!847803 () Bool)

(declare-fun e!473208 () Bool)

(assert (=> b!847803 (= e!473208 tp_is_empty!15985)))

(declare-fun mapNonEmpty!25577 () Bool)

(declare-fun tp!49052 () Bool)

(assert (=> mapNonEmpty!25577 (= mapRes!25577 (and tp!49052 e!473208))))

(declare-fun mapKey!25577 () (_ BitVec 32))

(declare-fun mapValue!25577 () ValueCell!7553)

(declare-fun mapRest!25577 () (Array (_ BitVec 32) ValueCell!7553))

(assert (=> mapNonEmpty!25577 (= (arr!23143 _values!688) (store mapRest!25577 mapKey!25577 mapValue!25577))))

(declare-fun b!847804 () Bool)

(assert (=> b!847804 (= e!473205 tp_is_empty!15985)))

(declare-fun b!847805 () Bool)

(declare-fun res!575746 () Bool)

(assert (=> b!847805 (=> (not res!575746) (not e!473209))))

(assert (=> b!847805 (= res!575746 (and (= (select (arr!23144 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!73102 res!575748) b!847798))

(assert (= (and b!847798 res!575747) b!847799))

(assert (= (and b!847799 res!575744) b!847797))

(assert (= (and b!847797 res!575742) b!847801))

(assert (= (and b!847801 res!575745) b!847802))

(assert (= (and b!847802 res!575743) b!847796))

(assert (= (and b!847796 res!575749) b!847805))

(assert (= (and b!847805 res!575746) b!847800))

(assert (= (and b!847795 condMapEmpty!25577) mapIsEmpty!25577))

(assert (= (and b!847795 (not condMapEmpty!25577)) mapNonEmpty!25577))

(get-info :version)

(assert (= (and mapNonEmpty!25577 ((_ is ValueCellFull!7553) mapValue!25577)) b!847803))

(assert (= (and b!847795 ((_ is ValueCellFull!7553) mapDefault!25577)) b!847804))

(assert (= start!73102 b!847795))

(declare-fun m!789431 () Bool)

(assert (=> b!847798 m!789431))

(declare-fun m!789433 () Bool)

(assert (=> mapNonEmpty!25577 m!789433))

(declare-fun m!789435 () Bool)

(assert (=> b!847796 m!789435))

(declare-fun m!789437 () Bool)

(assert (=> b!847805 m!789437))

(declare-fun m!789439 () Bool)

(assert (=> b!847797 m!789439))

(declare-fun m!789441 () Bool)

(assert (=> b!847801 m!789441))

(declare-fun m!789443 () Bool)

(assert (=> start!73102 m!789443))

(declare-fun m!789445 () Bool)

(assert (=> start!73102 m!789445))

(declare-fun m!789447 () Bool)

(assert (=> b!847800 m!789447))

(declare-fun m!789449 () Bool)

(assert (=> b!847800 m!789449))

(declare-fun m!789451 () Bool)

(assert (=> b!847800 m!789451))

(check-sat (not b_next!13849) (not b!847797) (not start!73102) (not b!847800) (not b!847801) (not mapNonEmpty!25577) tp_is_empty!15985 (not b!847796) b_and!22945 (not b!847798))
(check-sat b_and!22945 (not b_next!13849))
