; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72846 () Bool)

(assert start!72846)

(declare-fun b_free!13761 () Bool)

(declare-fun b_next!13761 () Bool)

(assert (=> start!72846 (= b_free!13761 (not b_next!13761))))

(declare-fun tp!48786 () Bool)

(declare-fun b_and!22847 () Bool)

(assert (=> start!72846 (= tp!48786 b_and!22847)))

(declare-fun b!845440 () Bool)

(declare-fun e!471966 () Bool)

(declare-fun tp_is_empty!15897 () Bool)

(assert (=> b!845440 (= e!471966 tp_is_empty!15897)))

(declare-fun b!845441 () Bool)

(declare-fun res!574345 () Bool)

(declare-fun e!471965 () Bool)

(assert (=> b!845441 (=> (not res!574345) (not e!471965))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845441 (= res!574345 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!25445 () Bool)

(declare-fun mapRes!25445 () Bool)

(declare-fun tp!48787 () Bool)

(declare-fun e!471963 () Bool)

(assert (=> mapNonEmpty!25445 (= mapRes!25445 (and tp!48787 e!471963))))

(declare-datatypes ((V!26243 0))(
  ( (V!26244 (val!7996 Int)) )
))
(declare-datatypes ((ValueCell!7509 0))(
  ( (ValueCellFull!7509 (v!10421 V!26243)) (EmptyCell!7509) )
))
(declare-fun mapRest!25445 () (Array (_ BitVec 32) ValueCell!7509))

(declare-fun mapValue!25445 () ValueCell!7509)

(declare-fun mapKey!25445 () (_ BitVec 32))

(declare-datatypes ((array!48014 0))(
  ( (array!48015 (arr!23038 (Array (_ BitVec 32) ValueCell!7509)) (size!23478 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48014)

(assert (=> mapNonEmpty!25445 (= (arr!23038 _values!688) (store mapRest!25445 mapKey!25445 mapValue!25445))))

(declare-fun b!845442 () Bool)

(declare-fun res!574342 () Bool)

(assert (=> b!845442 (=> (not res!574342) (not e!471965))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!48016 0))(
  ( (array!48017 (arr!23039 (Array (_ BitVec 32) (_ BitVec 64))) (size!23479 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48016)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!845442 (= res!574342 (and (= (select (arr!23039 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!845443 () Bool)

(declare-fun res!574347 () Bool)

(assert (=> b!845443 (=> (not res!574347) (not e!471965))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!845443 (= res!574347 (validKeyInArray!0 k0!854))))

(declare-fun b!845444 () Bool)

(declare-fun e!471964 () Bool)

(assert (=> b!845444 (= e!471964 (and e!471966 mapRes!25445))))

(declare-fun condMapEmpty!25445 () Bool)

(declare-fun mapDefault!25445 () ValueCell!7509)

(assert (=> b!845444 (= condMapEmpty!25445 (= (arr!23038 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7509)) mapDefault!25445)))))

(declare-fun b!845445 () Bool)

(declare-fun res!574343 () Bool)

(assert (=> b!845445 (=> (not res!574343) (not e!471965))))

(declare-datatypes ((List!16304 0))(
  ( (Nil!16301) (Cons!16300 (h!17431 (_ BitVec 64)) (t!22675 List!16304)) )
))
(declare-fun arrayNoDuplicates!0 (array!48016 (_ BitVec 32) List!16304) Bool)

(assert (=> b!845445 (= res!574343 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16301))))

(declare-fun b!845446 () Bool)

(declare-fun res!574348 () Bool)

(assert (=> b!845446 (=> (not res!574348) (not e!471965))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48016 (_ BitVec 32)) Bool)

(assert (=> b!845446 (= res!574348 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!845447 () Bool)

(declare-fun res!574349 () Bool)

(assert (=> b!845447 (=> (not res!574349) (not e!471965))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!845447 (= res!574349 (and (= (size!23478 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23479 _keys!868) (size!23478 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!845448 () Bool)

(assert (=> b!845448 (= e!471963 tp_is_empty!15897)))

(declare-fun res!574346 () Bool)

(assert (=> start!72846 (=> (not res!574346) (not e!471965))))

(assert (=> start!72846 (= res!574346 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23479 _keys!868))))))

(assert (=> start!72846 e!471965))

(assert (=> start!72846 true))

(assert (=> start!72846 tp!48786))

(declare-fun array_inv!18310 (array!48016) Bool)

(assert (=> start!72846 (array_inv!18310 _keys!868)))

(declare-fun array_inv!18311 (array!48014) Bool)

(assert (=> start!72846 (and (array_inv!18311 _values!688) e!471964)))

(assert (=> start!72846 tp_is_empty!15897))

(declare-fun mapIsEmpty!25445 () Bool)

(assert (=> mapIsEmpty!25445 mapRes!25445))

(declare-fun b!845449 () Bool)

(declare-fun res!574344 () Bool)

(assert (=> b!845449 (=> (not res!574344) (not e!471965))))

(assert (=> b!845449 (= res!574344 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23479 _keys!868))))))

(declare-fun b!845450 () Bool)

(assert (=> b!845450 (= e!471965 false)))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10442 0))(
  ( (tuple2!10443 (_1!5232 (_ BitVec 64)) (_2!5232 V!26243)) )
))
(declare-datatypes ((List!16305 0))(
  ( (Nil!16302) (Cons!16301 (h!17432 tuple2!10442) (t!22676 List!16305)) )
))
(declare-datatypes ((ListLongMap!9211 0))(
  ( (ListLongMap!9212 (toList!4621 List!16305)) )
))
(declare-fun lt!381412 () ListLongMap!9211)

(declare-fun minValue!654 () V!26243)

(declare-fun zeroValue!654 () V!26243)

(declare-fun getCurrentListMapNoExtraKeys!2606 (array!48016 array!48014 (_ BitVec 32) (_ BitVec 32) V!26243 V!26243 (_ BitVec 32) Int) ListLongMap!9211)

(assert (=> b!845450 (= lt!381412 (getCurrentListMapNoExtraKeys!2606 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!72846 res!574346) b!845441))

(assert (= (and b!845441 res!574345) b!845447))

(assert (= (and b!845447 res!574349) b!845446))

(assert (= (and b!845446 res!574348) b!845445))

(assert (= (and b!845445 res!574343) b!845449))

(assert (= (and b!845449 res!574344) b!845443))

(assert (= (and b!845443 res!574347) b!845442))

(assert (= (and b!845442 res!574342) b!845450))

(assert (= (and b!845444 condMapEmpty!25445) mapIsEmpty!25445))

(assert (= (and b!845444 (not condMapEmpty!25445)) mapNonEmpty!25445))

(get-info :version)

(assert (= (and mapNonEmpty!25445 ((_ is ValueCellFull!7509) mapValue!25445)) b!845448))

(assert (= (and b!845444 ((_ is ValueCellFull!7509) mapDefault!25445)) b!845440))

(assert (= start!72846 b!845444))

(declare-fun m!787251 () Bool)

(assert (=> b!845443 m!787251))

(declare-fun m!787253 () Bool)

(assert (=> mapNonEmpty!25445 m!787253))

(declare-fun m!787255 () Bool)

(assert (=> b!845446 m!787255))

(declare-fun m!787257 () Bool)

(assert (=> b!845445 m!787257))

(declare-fun m!787259 () Bool)

(assert (=> b!845450 m!787259))

(declare-fun m!787261 () Bool)

(assert (=> start!72846 m!787261))

(declare-fun m!787263 () Bool)

(assert (=> start!72846 m!787263))

(declare-fun m!787265 () Bool)

(assert (=> b!845442 m!787265))

(declare-fun m!787267 () Bool)

(assert (=> b!845441 m!787267))

(check-sat tp_is_empty!15897 (not b!845446) (not b!845443) (not start!72846) (not b!845445) (not mapNonEmpty!25445) (not b!845450) b_and!22847 (not b_next!13761) (not b!845441))
(check-sat b_and!22847 (not b_next!13761))
