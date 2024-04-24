; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72550 () Bool)

(assert start!72550)

(declare-fun b_free!13567 () Bool)

(declare-fun b_next!13567 () Bool)

(assert (=> start!72550 (= b_free!13567 (not b_next!13567))))

(declare-fun tp!47801 () Bool)

(declare-fun b_and!22663 () Bool)

(assert (=> start!72550 (= tp!47801 b_and!22663)))

(declare-fun b!839771 () Bool)

(declare-fun res!570739 () Bool)

(declare-fun e!468799 () Bool)

(assert (=> b!839771 (=> (not res!570739) (not e!468799))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47163 0))(
  ( (array!47164 (arr!22608 (Array (_ BitVec 32) (_ BitVec 64))) (size!23049 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47163)

(declare-datatypes ((V!25625 0))(
  ( (V!25626 (val!7764 Int)) )
))
(declare-datatypes ((ValueCell!7277 0))(
  ( (ValueCellFull!7277 (v!10189 V!25625)) (EmptyCell!7277) )
))
(declare-datatypes ((array!47165 0))(
  ( (array!47166 (arr!22609 (Array (_ BitVec 32) ValueCell!7277)) (size!23050 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47165)

(assert (=> b!839771 (= res!570739 (and (= (size!23050 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23049 _keys!868) (size!23050 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!839772 () Bool)

(declare-fun res!570741 () Bool)

(assert (=> b!839772 (=> (not res!570741) (not e!468799))))

(declare-datatypes ((List!15983 0))(
  ( (Nil!15980) (Cons!15979 (h!17116 (_ BitVec 64)) (t!22346 List!15983)) )
))
(declare-fun arrayNoDuplicates!0 (array!47163 (_ BitVec 32) List!15983) Bool)

(assert (=> b!839772 (= res!570741 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!15980))))

(declare-fun b!839773 () Bool)

(declare-fun res!570743 () Bool)

(assert (=> b!839773 (=> (not res!570743) (not e!468799))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!839773 (= res!570743 (and (= (select (arr!22608 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23049 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!839774 () Bool)

(declare-fun res!570745 () Bool)

(assert (=> b!839774 (=> (not res!570745) (not e!468799))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!839774 (= res!570745 (validMask!0 mask!1196))))

(declare-fun b!839775 () Bool)

(declare-fun e!468798 () Bool)

(declare-fun e!468797 () Bool)

(declare-fun mapRes!24749 () Bool)

(assert (=> b!839775 (= e!468798 (and e!468797 mapRes!24749))))

(declare-fun condMapEmpty!24749 () Bool)

(declare-fun mapDefault!24749 () ValueCell!7277)

(assert (=> b!839775 (= condMapEmpty!24749 (= (arr!22609 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7277)) mapDefault!24749)))))

(declare-fun b!839776 () Bool)

(declare-fun e!468801 () Bool)

(declare-fun tp_is_empty!15433 () Bool)

(assert (=> b!839776 (= e!468801 tp_is_empty!15433)))

(declare-fun res!570744 () Bool)

(assert (=> start!72550 (=> (not res!570744) (not e!468799))))

(assert (=> start!72550 (= res!570744 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23049 _keys!868))))))

(assert (=> start!72550 e!468799))

(assert (=> start!72550 tp_is_empty!15433))

(assert (=> start!72550 true))

(assert (=> start!72550 tp!47801))

(declare-fun array_inv!18048 (array!47163) Bool)

(assert (=> start!72550 (array_inv!18048 _keys!868)))

(declare-fun array_inv!18049 (array!47165) Bool)

(assert (=> start!72550 (and (array_inv!18049 _values!688) e!468798)))

(declare-fun b!839777 () Bool)

(declare-fun res!570738 () Bool)

(assert (=> b!839777 (=> (not res!570738) (not e!468799))))

(assert (=> b!839777 (= res!570738 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23049 _keys!868))))))

(declare-fun b!839778 () Bool)

(assert (=> b!839778 (= e!468799 (not true))))

(declare-fun e!468802 () Bool)

(assert (=> b!839778 e!468802))

(declare-fun c!91492 () Bool)

(assert (=> b!839778 (= c!91492 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!25625)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((Unit!28826 0))(
  ( (Unit!28827) )
))
(declare-fun lt!381077 () Unit!28826)

(declare-fun minValue!654 () V!25625)

(declare-fun zeroValue!654 () V!25625)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!249 (array!47163 array!47165 (_ BitVec 32) (_ BitVec 32) V!25625 V!25625 (_ BitVec 32) (_ BitVec 64) V!25625 (_ BitVec 32) Int) Unit!28826)

(assert (=> b!839778 (= lt!381077 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!249 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839779 () Bool)

(declare-datatypes ((tuple2!10202 0))(
  ( (tuple2!10203 (_1!5112 (_ BitVec 64)) (_2!5112 V!25625)) )
))
(declare-datatypes ((List!15984 0))(
  ( (Nil!15981) (Cons!15980 (h!17117 tuple2!10202) (t!22347 List!15984)) )
))
(declare-datatypes ((ListLongMap!8973 0))(
  ( (ListLongMap!8974 (toList!4502 List!15984)) )
))
(declare-fun call!36979 () ListLongMap!8973)

(declare-fun call!36980 () ListLongMap!8973)

(assert (=> b!839779 (= e!468802 (= call!36979 call!36980))))

(declare-fun b!839780 () Bool)

(declare-fun +!2018 (ListLongMap!8973 tuple2!10202) ListLongMap!8973)

(assert (=> b!839780 (= e!468802 (= call!36979 (+!2018 call!36980 (tuple2!10203 k0!854 v!557))))))

(declare-fun mapNonEmpty!24749 () Bool)

(declare-fun tp!47800 () Bool)

(assert (=> mapNonEmpty!24749 (= mapRes!24749 (and tp!47800 e!468801))))

(declare-fun mapKey!24749 () (_ BitVec 32))

(declare-fun mapRest!24749 () (Array (_ BitVec 32) ValueCell!7277))

(declare-fun mapValue!24749 () ValueCell!7277)

(assert (=> mapNonEmpty!24749 (= (arr!22609 _values!688) (store mapRest!24749 mapKey!24749 mapValue!24749))))

(declare-fun bm!36976 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2564 (array!47163 array!47165 (_ BitVec 32) (_ BitVec 32) V!25625 V!25625 (_ BitVec 32) Int) ListLongMap!8973)

(assert (=> bm!36976 (= call!36980 (getCurrentListMapNoExtraKeys!2564 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839781 () Bool)

(declare-fun res!570742 () Bool)

(assert (=> b!839781 (=> (not res!570742) (not e!468799))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!839781 (= res!570742 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!24749 () Bool)

(assert (=> mapIsEmpty!24749 mapRes!24749))

(declare-fun b!839782 () Bool)

(assert (=> b!839782 (= e!468797 tp_is_empty!15433)))

(declare-fun b!839783 () Bool)

(declare-fun res!570740 () Bool)

(assert (=> b!839783 (=> (not res!570740) (not e!468799))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47163 (_ BitVec 32)) Bool)

(assert (=> b!839783 (= res!570740 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun bm!36977 () Bool)

(assert (=> bm!36977 (= call!36979 (getCurrentListMapNoExtraKeys!2564 _keys!868 (array!47166 (store (arr!22609 _values!688) i!612 (ValueCellFull!7277 v!557)) (size!23050 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!72550 res!570744) b!839774))

(assert (= (and b!839774 res!570745) b!839771))

(assert (= (and b!839771 res!570739) b!839783))

(assert (= (and b!839783 res!570740) b!839772))

(assert (= (and b!839772 res!570741) b!839777))

(assert (= (and b!839777 res!570738) b!839781))

(assert (= (and b!839781 res!570742) b!839773))

(assert (= (and b!839773 res!570743) b!839778))

(assert (= (and b!839778 c!91492) b!839780))

(assert (= (and b!839778 (not c!91492)) b!839779))

(assert (= (or b!839780 b!839779) bm!36977))

(assert (= (or b!839780 b!839779) bm!36976))

(assert (= (and b!839775 condMapEmpty!24749) mapIsEmpty!24749))

(assert (= (and b!839775 (not condMapEmpty!24749)) mapNonEmpty!24749))

(get-info :version)

(assert (= (and mapNonEmpty!24749 ((_ is ValueCellFull!7277) mapValue!24749)) b!839776))

(assert (= (and b!839775 ((_ is ValueCellFull!7277) mapDefault!24749)) b!839782))

(assert (= start!72550 b!839775))

(declare-fun m!784457 () Bool)

(assert (=> bm!36976 m!784457))

(declare-fun m!784459 () Bool)

(assert (=> mapNonEmpty!24749 m!784459))

(declare-fun m!784461 () Bool)

(assert (=> b!839780 m!784461))

(declare-fun m!784463 () Bool)

(assert (=> bm!36977 m!784463))

(declare-fun m!784465 () Bool)

(assert (=> bm!36977 m!784465))

(declare-fun m!784467 () Bool)

(assert (=> b!839778 m!784467))

(declare-fun m!784469 () Bool)

(assert (=> b!839772 m!784469))

(declare-fun m!784471 () Bool)

(assert (=> b!839781 m!784471))

(declare-fun m!784473 () Bool)

(assert (=> b!839773 m!784473))

(declare-fun m!784475 () Bool)

(assert (=> b!839783 m!784475))

(declare-fun m!784477 () Bool)

(assert (=> start!72550 m!784477))

(declare-fun m!784479 () Bool)

(assert (=> start!72550 m!784479))

(declare-fun m!784481 () Bool)

(assert (=> b!839774 m!784481))

(check-sat (not mapNonEmpty!24749) (not b!839781) (not b!839774) (not start!72550) (not bm!36977) (not bm!36976) (not b!839780) (not b_next!13567) tp_is_empty!15433 (not b!839778) (not b!839772) b_and!22663 (not b!839783))
(check-sat b_and!22663 (not b_next!13567))
