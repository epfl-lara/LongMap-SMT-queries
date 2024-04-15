; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74504 () Bool)

(assert start!74504)

(declare-fun b_free!15211 () Bool)

(declare-fun b_next!15211 () Bool)

(assert (=> start!74504 (= b_free!15211 (not b_next!15211))))

(declare-fun tp!53315 () Bool)

(declare-fun b_and!25061 () Bool)

(assert (=> start!74504 (= tp!53315 b_and!25061)))

(declare-fun b!877578 () Bool)

(declare-fun e!488470 () Bool)

(declare-fun tp_is_empty!17455 () Bool)

(assert (=> b!877578 (= e!488470 tp_is_empty!17455)))

(declare-fun res!596226 () Bool)

(declare-fun e!488468 () Bool)

(assert (=> start!74504 (=> (not res!596226) (not e!488468))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!51017 0))(
  ( (array!51018 (arr!24535 (Array (_ BitVec 32) (_ BitVec 64))) (size!24977 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51017)

(assert (=> start!74504 (= res!596226 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24977 _keys!868))))))

(assert (=> start!74504 e!488468))

(assert (=> start!74504 tp_is_empty!17455))

(assert (=> start!74504 true))

(assert (=> start!74504 tp!53315))

(declare-fun array_inv!19378 (array!51017) Bool)

(assert (=> start!74504 (array_inv!19378 _keys!868)))

(declare-datatypes ((V!28321 0))(
  ( (V!28322 (val!8775 Int)) )
))
(declare-datatypes ((ValueCell!8288 0))(
  ( (ValueCellFull!8288 (v!11209 V!28321)) (EmptyCell!8288) )
))
(declare-datatypes ((array!51019 0))(
  ( (array!51020 (arr!24536 (Array (_ BitVec 32) ValueCell!8288)) (size!24978 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51019)

(declare-fun e!488471 () Bool)

(declare-fun array_inv!19379 (array!51019) Bool)

(assert (=> start!74504 (and (array_inv!19379 _values!688) e!488471)))

(declare-fun mapNonEmpty!27798 () Bool)

(declare-fun mapRes!27798 () Bool)

(declare-fun tp!53316 () Bool)

(declare-fun e!488469 () Bool)

(assert (=> mapNonEmpty!27798 (= mapRes!27798 (and tp!53316 e!488469))))

(declare-fun mapKey!27798 () (_ BitVec 32))

(declare-fun mapValue!27798 () ValueCell!8288)

(declare-fun mapRest!27798 () (Array (_ BitVec 32) ValueCell!8288))

(assert (=> mapNonEmpty!27798 (= (arr!24536 _values!688) (store mapRest!27798 mapKey!27798 mapValue!27798))))

(declare-fun b!877579 () Bool)

(assert (=> b!877579 (= e!488471 (and e!488470 mapRes!27798))))

(declare-fun condMapEmpty!27798 () Bool)

(declare-fun mapDefault!27798 () ValueCell!8288)

(assert (=> b!877579 (= condMapEmpty!27798 (= (arr!24536 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8288)) mapDefault!27798)))))

(declare-fun b!877580 () Bool)

(declare-fun res!596220 () Bool)

(assert (=> b!877580 (=> (not res!596220) (not e!488468))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!877580 (= res!596220 (validMask!0 mask!1196))))

(declare-fun b!877581 () Bool)

(assert (=> b!877581 (= e!488468 false)))

(declare-fun v!557 () V!28321)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11616 0))(
  ( (tuple2!11617 (_1!5819 (_ BitVec 64)) (_2!5819 V!28321)) )
))
(declare-datatypes ((List!17419 0))(
  ( (Nil!17416) (Cons!17415 (h!18546 tuple2!11616) (t!24499 List!17419)) )
))
(declare-datatypes ((ListLongMap!10375 0))(
  ( (ListLongMap!10376 (toList!5203 List!17419)) )
))
(declare-fun lt!396906 () ListLongMap!10375)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!28321)

(declare-fun zeroValue!654 () V!28321)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3196 (array!51017 array!51019 (_ BitVec 32) (_ BitVec 32) V!28321 V!28321 (_ BitVec 32) Int) ListLongMap!10375)

(assert (=> b!877581 (= lt!396906 (getCurrentListMapNoExtraKeys!3196 _keys!868 (array!51020 (store (arr!24536 _values!688) i!612 (ValueCellFull!8288 v!557)) (size!24978 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!396907 () ListLongMap!10375)

(assert (=> b!877581 (= lt!396907 (getCurrentListMapNoExtraKeys!3196 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!877582 () Bool)

(declare-fun res!596223 () Bool)

(assert (=> b!877582 (=> (not res!596223) (not e!488468))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!877582 (= res!596223 (and (= (select (arr!24535 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!877583 () Bool)

(declare-fun res!596224 () Bool)

(assert (=> b!877583 (=> (not res!596224) (not e!488468))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!877583 (= res!596224 (validKeyInArray!0 k0!854))))

(declare-fun b!877584 () Bool)

(assert (=> b!877584 (= e!488469 tp_is_empty!17455)))

(declare-fun b!877585 () Bool)

(declare-fun res!596225 () Bool)

(assert (=> b!877585 (=> (not res!596225) (not e!488468))))

(assert (=> b!877585 (= res!596225 (and (= (size!24978 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24977 _keys!868) (size!24978 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!27798 () Bool)

(assert (=> mapIsEmpty!27798 mapRes!27798))

(declare-fun b!877586 () Bool)

(declare-fun res!596222 () Bool)

(assert (=> b!877586 (=> (not res!596222) (not e!488468))))

(assert (=> b!877586 (= res!596222 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24977 _keys!868))))))

(declare-fun b!877587 () Bool)

(declare-fun res!596221 () Bool)

(assert (=> b!877587 (=> (not res!596221) (not e!488468))))

(declare-datatypes ((List!17420 0))(
  ( (Nil!17417) (Cons!17416 (h!18547 (_ BitVec 64)) (t!24500 List!17420)) )
))
(declare-fun arrayNoDuplicates!0 (array!51017 (_ BitVec 32) List!17420) Bool)

(assert (=> b!877587 (= res!596221 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17417))))

(declare-fun b!877588 () Bool)

(declare-fun res!596219 () Bool)

(assert (=> b!877588 (=> (not res!596219) (not e!488468))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51017 (_ BitVec 32)) Bool)

(assert (=> b!877588 (= res!596219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!74504 res!596226) b!877580))

(assert (= (and b!877580 res!596220) b!877585))

(assert (= (and b!877585 res!596225) b!877588))

(assert (= (and b!877588 res!596219) b!877587))

(assert (= (and b!877587 res!596221) b!877586))

(assert (= (and b!877586 res!596222) b!877583))

(assert (= (and b!877583 res!596224) b!877582))

(assert (= (and b!877582 res!596223) b!877581))

(assert (= (and b!877579 condMapEmpty!27798) mapIsEmpty!27798))

(assert (= (and b!877579 (not condMapEmpty!27798)) mapNonEmpty!27798))

(get-info :version)

(assert (= (and mapNonEmpty!27798 ((_ is ValueCellFull!8288) mapValue!27798)) b!877584))

(assert (= (and b!877579 ((_ is ValueCellFull!8288) mapDefault!27798)) b!877578))

(assert (= start!74504 b!877579))

(declare-fun m!817137 () Bool)

(assert (=> b!877581 m!817137))

(declare-fun m!817139 () Bool)

(assert (=> b!877581 m!817139))

(declare-fun m!817141 () Bool)

(assert (=> b!877581 m!817141))

(declare-fun m!817143 () Bool)

(assert (=> start!74504 m!817143))

(declare-fun m!817145 () Bool)

(assert (=> start!74504 m!817145))

(declare-fun m!817147 () Bool)

(assert (=> b!877587 m!817147))

(declare-fun m!817149 () Bool)

(assert (=> b!877582 m!817149))

(declare-fun m!817151 () Bool)

(assert (=> b!877588 m!817151))

(declare-fun m!817153 () Bool)

(assert (=> mapNonEmpty!27798 m!817153))

(declare-fun m!817155 () Bool)

(assert (=> b!877580 m!817155))

(declare-fun m!817157 () Bool)

(assert (=> b!877583 m!817157))

(check-sat tp_is_empty!17455 (not b!877580) (not b_next!15211) (not b!877588) (not b!877583) (not mapNonEmpty!27798) (not b!877587) (not start!74504) (not b!877581) b_and!25061)
(check-sat b_and!25061 (not b_next!15211))
