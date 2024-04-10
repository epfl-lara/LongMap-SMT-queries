; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72936 () Bool)

(assert start!72936)

(declare-fun b_free!13851 () Bool)

(declare-fun b_next!13851 () Bool)

(assert (=> start!72936 (= b_free!13851 (not b_next!13851))))

(declare-fun tp!49057 () Bool)

(declare-fun b_and!22937 () Bool)

(assert (=> start!72936 (= tp!49057 b_and!22937)))

(declare-fun b!846925 () Bool)

(declare-fun res!575427 () Bool)

(declare-fun e!472639 () Bool)

(assert (=> b!846925 (=> (not res!575427) (not e!472639))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!48186 0))(
  ( (array!48187 (arr!23124 (Array (_ BitVec 32) (_ BitVec 64))) (size!23564 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48186)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!846925 (= res!575427 (and (= (select (arr!23124 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!846926 () Bool)

(declare-fun res!575422 () Bool)

(assert (=> b!846926 (=> (not res!575422) (not e!472639))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!846926 (= res!575422 (validMask!0 mask!1196))))

(declare-fun b!846927 () Bool)

(declare-fun res!575425 () Bool)

(assert (=> b!846927 (=> (not res!575425) (not e!472639))))

(declare-datatypes ((List!16360 0))(
  ( (Nil!16357) (Cons!16356 (h!17487 (_ BitVec 64)) (t!22731 List!16360)) )
))
(declare-fun arrayNoDuplicates!0 (array!48186 (_ BitVec 32) List!16360) Bool)

(assert (=> b!846927 (= res!575425 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16357))))

(declare-fun b!846928 () Bool)

(declare-fun res!575424 () Bool)

(assert (=> b!846928 (=> (not res!575424) (not e!472639))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48186 (_ BitVec 32)) Bool)

(assert (=> b!846928 (= res!575424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!846929 () Bool)

(declare-fun res!575428 () Bool)

(assert (=> b!846929 (=> (not res!575428) (not e!472639))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!26363 0))(
  ( (V!26364 (val!8041 Int)) )
))
(declare-datatypes ((ValueCell!7554 0))(
  ( (ValueCellFull!7554 (v!10466 V!26363)) (EmptyCell!7554) )
))
(declare-datatypes ((array!48188 0))(
  ( (array!48189 (arr!23125 (Array (_ BitVec 32) ValueCell!7554)) (size!23565 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48188)

(assert (=> b!846929 (= res!575428 (and (= (size!23565 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23564 _keys!868) (size!23565 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!846930 () Bool)

(declare-fun res!575429 () Bool)

(assert (=> b!846930 (=> (not res!575429) (not e!472639))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!846930 (= res!575429 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!25580 () Bool)

(declare-fun mapRes!25580 () Bool)

(declare-fun tp!49056 () Bool)

(declare-fun e!472638 () Bool)

(assert (=> mapNonEmpty!25580 (= mapRes!25580 (and tp!49056 e!472638))))

(declare-fun mapValue!25580 () ValueCell!7554)

(declare-fun mapKey!25580 () (_ BitVec 32))

(declare-fun mapRest!25580 () (Array (_ BitVec 32) ValueCell!7554))

(assert (=> mapNonEmpty!25580 (= (arr!23125 _values!688) (store mapRest!25580 mapKey!25580 mapValue!25580))))

(declare-fun res!575423 () Bool)

(assert (=> start!72936 (=> (not res!575423) (not e!472639))))

(assert (=> start!72936 (= res!575423 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23564 _keys!868))))))

(assert (=> start!72936 e!472639))

(declare-fun tp_is_empty!15987 () Bool)

(assert (=> start!72936 tp_is_empty!15987))

(assert (=> start!72936 true))

(assert (=> start!72936 tp!49057))

(declare-fun array_inv!18364 (array!48186) Bool)

(assert (=> start!72936 (array_inv!18364 _keys!868)))

(declare-fun e!472640 () Bool)

(declare-fun array_inv!18365 (array!48188) Bool)

(assert (=> start!72936 (and (array_inv!18365 _values!688) e!472640)))

(declare-fun mapIsEmpty!25580 () Bool)

(assert (=> mapIsEmpty!25580 mapRes!25580))

(declare-fun b!846931 () Bool)

(declare-fun e!472642 () Bool)

(assert (=> b!846931 (= e!472642 tp_is_empty!15987)))

(declare-fun b!846932 () Bool)

(declare-fun res!575426 () Bool)

(assert (=> b!846932 (=> (not res!575426) (not e!472639))))

(assert (=> b!846932 (= res!575426 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23564 _keys!868))))))

(declare-fun b!846933 () Bool)

(assert (=> b!846933 (= e!472640 (and e!472642 mapRes!25580))))

(declare-fun condMapEmpty!25580 () Bool)

(declare-fun mapDefault!25580 () ValueCell!7554)

(assert (=> b!846933 (= condMapEmpty!25580 (= (arr!23125 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7554)) mapDefault!25580)))))

(declare-fun b!846934 () Bool)

(assert (=> b!846934 (= e!472638 tp_is_empty!15987)))

(declare-fun b!846935 () Bool)

(assert (=> b!846935 (= e!472639 false)))

(declare-fun v!557 () V!26363)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!26363)

(declare-fun zeroValue!654 () V!26363)

(declare-datatypes ((tuple2!10498 0))(
  ( (tuple2!10499 (_1!5260 (_ BitVec 64)) (_2!5260 V!26363)) )
))
(declare-datatypes ((List!16361 0))(
  ( (Nil!16358) (Cons!16357 (h!17488 tuple2!10498) (t!22732 List!16361)) )
))
(declare-datatypes ((ListLongMap!9267 0))(
  ( (ListLongMap!9268 (toList!4649 List!16361)) )
))
(declare-fun lt!381624 () ListLongMap!9267)

(declare-fun getCurrentListMapNoExtraKeys!2634 (array!48186 array!48188 (_ BitVec 32) (_ BitVec 32) V!26363 V!26363 (_ BitVec 32) Int) ListLongMap!9267)

(assert (=> b!846935 (= lt!381624 (getCurrentListMapNoExtraKeys!2634 _keys!868 (array!48189 (store (arr!23125 _values!688) i!612 (ValueCellFull!7554 v!557)) (size!23565 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!381625 () ListLongMap!9267)

(assert (=> b!846935 (= lt!381625 (getCurrentListMapNoExtraKeys!2634 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!72936 res!575423) b!846926))

(assert (= (and b!846926 res!575422) b!846929))

(assert (= (and b!846929 res!575428) b!846928))

(assert (= (and b!846928 res!575424) b!846927))

(assert (= (and b!846927 res!575425) b!846932))

(assert (= (and b!846932 res!575426) b!846930))

(assert (= (and b!846930 res!575429) b!846925))

(assert (= (and b!846925 res!575427) b!846935))

(assert (= (and b!846933 condMapEmpty!25580) mapIsEmpty!25580))

(assert (= (and b!846933 (not condMapEmpty!25580)) mapNonEmpty!25580))

(get-info :version)

(assert (= (and mapNonEmpty!25580 ((_ is ValueCellFull!7554) mapValue!25580)) b!846934))

(assert (= (and b!846933 ((_ is ValueCellFull!7554) mapDefault!25580)) b!846931))

(assert (= start!72936 b!846933))

(declare-fun m!788161 () Bool)

(assert (=> b!846925 m!788161))

(declare-fun m!788163 () Bool)

(assert (=> b!846926 m!788163))

(declare-fun m!788165 () Bool)

(assert (=> b!846935 m!788165))

(declare-fun m!788167 () Bool)

(assert (=> b!846935 m!788167))

(declare-fun m!788169 () Bool)

(assert (=> b!846935 m!788169))

(declare-fun m!788171 () Bool)

(assert (=> start!72936 m!788171))

(declare-fun m!788173 () Bool)

(assert (=> start!72936 m!788173))

(declare-fun m!788175 () Bool)

(assert (=> b!846927 m!788175))

(declare-fun m!788177 () Bool)

(assert (=> b!846928 m!788177))

(declare-fun m!788179 () Bool)

(assert (=> b!846930 m!788179))

(declare-fun m!788181 () Bool)

(assert (=> mapNonEmpty!25580 m!788181))

(check-sat (not mapNonEmpty!25580) (not b!846928) (not b!846930) (not b!846935) (not b_next!13851) (not b!846926) tp_is_empty!15987 (not b!846927) b_and!22937 (not start!72936))
(check-sat b_and!22937 (not b_next!13851))
