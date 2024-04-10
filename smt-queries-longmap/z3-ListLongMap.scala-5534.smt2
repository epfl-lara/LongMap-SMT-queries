; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72990 () Bool)

(assert start!72990)

(declare-fun b_free!13905 () Bool)

(declare-fun b_next!13905 () Bool)

(assert (=> start!72990 (= b_free!13905 (not b_next!13905))))

(declare-fun tp!49218 () Bool)

(declare-fun b_and!22991 () Bool)

(assert (=> start!72990 (= tp!49218 b_and!22991)))

(declare-fun res!576121 () Bool)

(declare-fun e!473145 () Bool)

(assert (=> start!72990 (=> (not res!576121) (not e!473145))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48292 0))(
  ( (array!48293 (arr!23177 (Array (_ BitVec 32) (_ BitVec 64))) (size!23617 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48292)

(assert (=> start!72990 (= res!576121 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23617 _keys!868))))))

(assert (=> start!72990 e!473145))

(declare-fun tp_is_empty!16041 () Bool)

(assert (=> start!72990 tp_is_empty!16041))

(assert (=> start!72990 true))

(assert (=> start!72990 tp!49218))

(declare-fun array_inv!18406 (array!48292) Bool)

(assert (=> start!72990 (array_inv!18406 _keys!868)))

(declare-datatypes ((V!26435 0))(
  ( (V!26436 (val!8068 Int)) )
))
(declare-datatypes ((ValueCell!7581 0))(
  ( (ValueCellFull!7581 (v!10493 V!26435)) (EmptyCell!7581) )
))
(declare-datatypes ((array!48294 0))(
  ( (array!48295 (arr!23178 (Array (_ BitVec 32) ValueCell!7581)) (size!23618 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48294)

(declare-fun e!473147 () Bool)

(declare-fun array_inv!18407 (array!48294) Bool)

(assert (=> start!72990 (and (array_inv!18407 _values!688) e!473147)))

(declare-fun b!847966 () Bool)

(declare-fun e!473144 () Bool)

(assert (=> b!847966 (= e!473145 e!473144)))

(declare-fun res!576127 () Bool)

(assert (=> b!847966 (=> (not res!576127) (not e!473144))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!847966 (= res!576127 (= from!1053 i!612))))

(declare-datatypes ((tuple2!10546 0))(
  ( (tuple2!10547 (_1!5284 (_ BitVec 64)) (_2!5284 V!26435)) )
))
(declare-datatypes ((List!16404 0))(
  ( (Nil!16401) (Cons!16400 (h!17531 tuple2!10546) (t!22775 List!16404)) )
))
(declare-datatypes ((ListLongMap!9315 0))(
  ( (ListLongMap!9316 (toList!4673 List!16404)) )
))
(declare-fun lt!381887 () ListLongMap!9315)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun lt!381886 () array!48294)

(declare-fun minValue!654 () V!26435)

(declare-fun zeroValue!654 () V!26435)

(declare-fun getCurrentListMapNoExtraKeys!2657 (array!48292 array!48294 (_ BitVec 32) (_ BitVec 32) V!26435 V!26435 (_ BitVec 32) Int) ListLongMap!9315)

(assert (=> b!847966 (= lt!381887 (getCurrentListMapNoExtraKeys!2657 _keys!868 lt!381886 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26435)

(assert (=> b!847966 (= lt!381886 (array!48295 (store (arr!23178 _values!688) i!612 (ValueCellFull!7581 v!557)) (size!23618 _values!688)))))

(declare-fun lt!381889 () ListLongMap!9315)

(assert (=> b!847966 (= lt!381889 (getCurrentListMapNoExtraKeys!2657 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!847967 () Bool)

(declare-fun e!473148 () Bool)

(assert (=> b!847967 (= e!473148 tp_is_empty!16041)))

(declare-fun b!847968 () Bool)

(declare-fun e!473143 () Bool)

(declare-fun call!37571 () ListLongMap!9315)

(declare-fun call!37570 () ListLongMap!9315)

(assert (=> b!847968 (= e!473143 (= call!37571 call!37570))))

(declare-fun b!847969 () Bool)

(declare-fun res!576128 () Bool)

(assert (=> b!847969 (=> (not res!576128) (not e!473145))))

(assert (=> b!847969 (= res!576128 (and (= (size!23618 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23617 _keys!868) (size!23618 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!847970 () Bool)

(declare-fun res!576122 () Bool)

(assert (=> b!847970 (=> (not res!576122) (not e!473145))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!847970 (= res!576122 (validMask!0 mask!1196))))

(declare-fun b!847971 () Bool)

(assert (=> b!847971 (= e!473144 (not true))))

(assert (=> b!847971 e!473143))

(declare-fun c!91528 () Bool)

(assert (=> b!847971 (= c!91528 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28961 0))(
  ( (Unit!28962) )
))
(declare-fun lt!381888 () Unit!28961)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!326 (array!48292 array!48294 (_ BitVec 32) (_ BitVec 32) V!26435 V!26435 (_ BitVec 32) (_ BitVec 64) V!26435 (_ BitVec 32) Int) Unit!28961)

(assert (=> b!847971 (= lt!381888 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!326 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!847972 () Bool)

(declare-fun res!576125 () Bool)

(assert (=> b!847972 (=> (not res!576125) (not e!473145))))

(declare-datatypes ((List!16405 0))(
  ( (Nil!16402) (Cons!16401 (h!17532 (_ BitVec 64)) (t!22776 List!16405)) )
))
(declare-fun arrayNoDuplicates!0 (array!48292 (_ BitVec 32) List!16405) Bool)

(assert (=> b!847972 (= res!576125 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16402))))

(declare-fun b!847973 () Bool)

(declare-fun res!576126 () Bool)

(assert (=> b!847973 (=> (not res!576126) (not e!473145))))

(assert (=> b!847973 (= res!576126 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23617 _keys!868))))))

(declare-fun b!847974 () Bool)

(declare-fun res!576120 () Bool)

(assert (=> b!847974 (=> (not res!576120) (not e!473145))))

(assert (=> b!847974 (= res!576120 (and (= (select (arr!23177 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun bm!37567 () Bool)

(assert (=> bm!37567 (= call!37571 (getCurrentListMapNoExtraKeys!2657 _keys!868 lt!381886 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!847975 () Bool)

(declare-fun mapRes!25661 () Bool)

(assert (=> b!847975 (= e!473147 (and e!473148 mapRes!25661))))

(declare-fun condMapEmpty!25661 () Bool)

(declare-fun mapDefault!25661 () ValueCell!7581)

(assert (=> b!847975 (= condMapEmpty!25661 (= (arr!23178 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7581)) mapDefault!25661)))))

(declare-fun mapIsEmpty!25661 () Bool)

(assert (=> mapIsEmpty!25661 mapRes!25661))

(declare-fun b!847976 () Bool)

(declare-fun e!473146 () Bool)

(assert (=> b!847976 (= e!473146 tp_is_empty!16041)))

(declare-fun bm!37568 () Bool)

(assert (=> bm!37568 (= call!37570 (getCurrentListMapNoExtraKeys!2657 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!847977 () Bool)

(declare-fun res!576123 () Bool)

(assert (=> b!847977 (=> (not res!576123) (not e!473145))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48292 (_ BitVec 32)) Bool)

(assert (=> b!847977 (= res!576123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!25661 () Bool)

(declare-fun tp!49219 () Bool)

(assert (=> mapNonEmpty!25661 (= mapRes!25661 (and tp!49219 e!473146))))

(declare-fun mapRest!25661 () (Array (_ BitVec 32) ValueCell!7581))

(declare-fun mapValue!25661 () ValueCell!7581)

(declare-fun mapKey!25661 () (_ BitVec 32))

(assert (=> mapNonEmpty!25661 (= (arr!23178 _values!688) (store mapRest!25661 mapKey!25661 mapValue!25661))))

(declare-fun b!847978 () Bool)

(declare-fun +!2087 (ListLongMap!9315 tuple2!10546) ListLongMap!9315)

(assert (=> b!847978 (= e!473143 (= call!37571 (+!2087 call!37570 (tuple2!10547 k0!854 v!557))))))

(declare-fun b!847979 () Bool)

(declare-fun res!576124 () Bool)

(assert (=> b!847979 (=> (not res!576124) (not e!473145))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!847979 (= res!576124 (validKeyInArray!0 k0!854))))

(assert (= (and start!72990 res!576121) b!847970))

(assert (= (and b!847970 res!576122) b!847969))

(assert (= (and b!847969 res!576128) b!847977))

(assert (= (and b!847977 res!576123) b!847972))

(assert (= (and b!847972 res!576125) b!847973))

(assert (= (and b!847973 res!576126) b!847979))

(assert (= (and b!847979 res!576124) b!847974))

(assert (= (and b!847974 res!576120) b!847966))

(assert (= (and b!847966 res!576127) b!847971))

(assert (= (and b!847971 c!91528) b!847978))

(assert (= (and b!847971 (not c!91528)) b!847968))

(assert (= (or b!847978 b!847968) bm!37568))

(assert (= (or b!847978 b!847968) bm!37567))

(assert (= (and b!847975 condMapEmpty!25661) mapIsEmpty!25661))

(assert (= (and b!847975 (not condMapEmpty!25661)) mapNonEmpty!25661))

(get-info :version)

(assert (= (and mapNonEmpty!25661 ((_ is ValueCellFull!7581) mapValue!25661)) b!847976))

(assert (= (and b!847975 ((_ is ValueCellFull!7581) mapDefault!25661)) b!847967))

(assert (= start!72990 b!847975))

(declare-fun m!788883 () Bool)

(assert (=> b!847966 m!788883))

(declare-fun m!788885 () Bool)

(assert (=> b!847966 m!788885))

(declare-fun m!788887 () Bool)

(assert (=> b!847966 m!788887))

(declare-fun m!788889 () Bool)

(assert (=> b!847978 m!788889))

(declare-fun m!788891 () Bool)

(assert (=> b!847979 m!788891))

(declare-fun m!788893 () Bool)

(assert (=> b!847972 m!788893))

(declare-fun m!788895 () Bool)

(assert (=> start!72990 m!788895))

(declare-fun m!788897 () Bool)

(assert (=> start!72990 m!788897))

(declare-fun m!788899 () Bool)

(assert (=> b!847977 m!788899))

(declare-fun m!788901 () Bool)

(assert (=> b!847971 m!788901))

(declare-fun m!788903 () Bool)

(assert (=> b!847970 m!788903))

(declare-fun m!788905 () Bool)

(assert (=> b!847974 m!788905))

(declare-fun m!788907 () Bool)

(assert (=> mapNonEmpty!25661 m!788907))

(declare-fun m!788909 () Bool)

(assert (=> bm!37568 m!788909))

(declare-fun m!788911 () Bool)

(assert (=> bm!37567 m!788911))

(check-sat (not b!847971) (not b!847979) (not b_next!13905) (not b!847970) (not bm!37568) b_and!22991 (not b!847978) (not start!72990) tp_is_empty!16041 (not b!847972) (not b!847966) (not mapNonEmpty!25661) (not bm!37567) (not b!847977))
(check-sat b_and!22991 (not b_next!13905))
