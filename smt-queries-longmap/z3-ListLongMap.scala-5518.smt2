; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73060 () Bool)

(assert start!73060)

(declare-fun b_free!13807 () Bool)

(declare-fun b_next!13807 () Bool)

(assert (=> start!73060 (= b_free!13807 (not b_next!13807))))

(declare-fun tp!48925 () Bool)

(declare-fun b_and!22903 () Bool)

(assert (=> start!73060 (= tp!48925 b_and!22903)))

(declare-fun mapNonEmpty!25514 () Bool)

(declare-fun mapRes!25514 () Bool)

(declare-fun tp!48926 () Bool)

(declare-fun e!472892 () Bool)

(assert (=> mapNonEmpty!25514 (= mapRes!25514 (and tp!48926 e!472892))))

(declare-datatypes ((V!26305 0))(
  ( (V!26306 (val!8019 Int)) )
))
(declare-datatypes ((ValueCell!7532 0))(
  ( (ValueCellFull!7532 (v!10444 V!26305)) (EmptyCell!7532) )
))
(declare-fun mapRest!25514 () (Array (_ BitVec 32) ValueCell!7532))

(declare-fun mapKey!25514 () (_ BitVec 32))

(declare-fun mapValue!25514 () ValueCell!7532)

(declare-datatypes ((array!48149 0))(
  ( (array!48150 (arr!23101 (Array (_ BitVec 32) ValueCell!7532)) (size!23542 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48149)

(assert (=> mapNonEmpty!25514 (= (arr!23101 _values!688) (store mapRest!25514 mapKey!25514 mapValue!25514))))

(declare-fun b!847102 () Bool)

(declare-fun res!575239 () Bool)

(declare-fun e!472890 () Bool)

(assert (=> b!847102 (=> (not res!575239) (not e!472890))))

(declare-datatypes ((array!48151 0))(
  ( (array!48152 (arr!23102 (Array (_ BitVec 32) (_ BitVec 64))) (size!23543 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48151)

(declare-datatypes ((List!16265 0))(
  ( (Nil!16262) (Cons!16261 (h!17398 (_ BitVec 64)) (t!22628 List!16265)) )
))
(declare-fun arrayNoDuplicates!0 (array!48151 (_ BitVec 32) List!16265) Bool)

(assert (=> b!847102 (= res!575239 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16262))))

(declare-fun res!575241 () Bool)

(assert (=> start!73060 (=> (not res!575241) (not e!472890))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73060 (= res!575241 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23543 _keys!868))))))

(assert (=> start!73060 e!472890))

(declare-fun tp_is_empty!15943 () Bool)

(assert (=> start!73060 tp_is_empty!15943))

(assert (=> start!73060 true))

(assert (=> start!73060 tp!48925))

(declare-fun array_inv!18406 (array!48151) Bool)

(assert (=> start!73060 (array_inv!18406 _keys!868)))

(declare-fun e!472891 () Bool)

(declare-fun array_inv!18407 (array!48149) Bool)

(assert (=> start!73060 (and (array_inv!18407 _values!688) e!472891)))

(declare-fun b!847103 () Bool)

(assert (=> b!847103 (= e!472890 false)))

(declare-fun v!557 () V!26305)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!10396 0))(
  ( (tuple2!10397 (_1!5209 (_ BitVec 64)) (_2!5209 V!26305)) )
))
(declare-datatypes ((List!16266 0))(
  ( (Nil!16263) (Cons!16262 (h!17399 tuple2!10396) (t!22629 List!16266)) )
))
(declare-datatypes ((ListLongMap!9167 0))(
  ( (ListLongMap!9168 (toList!4599 List!16266)) )
))
(declare-fun lt!381854 () ListLongMap!9167)

(declare-fun minValue!654 () V!26305)

(declare-fun zeroValue!654 () V!26305)

(declare-fun getCurrentListMapNoExtraKeys!2657 (array!48151 array!48149 (_ BitVec 32) (_ BitVec 32) V!26305 V!26305 (_ BitVec 32) Int) ListLongMap!9167)

(assert (=> b!847103 (= lt!381854 (getCurrentListMapNoExtraKeys!2657 _keys!868 (array!48150 (store (arr!23101 _values!688) i!612 (ValueCellFull!7532 v!557)) (size!23542 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!381853 () ListLongMap!9167)

(assert (=> b!847103 (= lt!381853 (getCurrentListMapNoExtraKeys!2657 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!847104 () Bool)

(declare-fun res!575243 () Bool)

(assert (=> b!847104 (=> (not res!575243) (not e!472890))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!847104 (= res!575243 (and (= (select (arr!23102 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!847105 () Bool)

(declare-fun res!575244 () Bool)

(assert (=> b!847105 (=> (not res!575244) (not e!472890))))

(assert (=> b!847105 (= res!575244 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23543 _keys!868))))))

(declare-fun b!847106 () Bool)

(declare-fun res!575238 () Bool)

(assert (=> b!847106 (=> (not res!575238) (not e!472890))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!847106 (= res!575238 (validMask!0 mask!1196))))

(declare-fun b!847107 () Bool)

(assert (=> b!847107 (= e!472892 tp_is_empty!15943)))

(declare-fun mapIsEmpty!25514 () Bool)

(assert (=> mapIsEmpty!25514 mapRes!25514))

(declare-fun b!847108 () Bool)

(declare-fun res!575242 () Bool)

(assert (=> b!847108 (=> (not res!575242) (not e!472890))))

(assert (=> b!847108 (= res!575242 (and (= (size!23542 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23543 _keys!868) (size!23542 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!847109 () Bool)

(declare-fun e!472893 () Bool)

(assert (=> b!847109 (= e!472891 (and e!472893 mapRes!25514))))

(declare-fun condMapEmpty!25514 () Bool)

(declare-fun mapDefault!25514 () ValueCell!7532)

(assert (=> b!847109 (= condMapEmpty!25514 (= (arr!23101 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7532)) mapDefault!25514)))))

(declare-fun b!847110 () Bool)

(assert (=> b!847110 (= e!472893 tp_is_empty!15943)))

(declare-fun b!847111 () Bool)

(declare-fun res!575240 () Bool)

(assert (=> b!847111 (=> (not res!575240) (not e!472890))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48151 (_ BitVec 32)) Bool)

(assert (=> b!847111 (= res!575240 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!847112 () Bool)

(declare-fun res!575245 () Bool)

(assert (=> b!847112 (=> (not res!575245) (not e!472890))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!847112 (= res!575245 (validKeyInArray!0 k0!854))))

(assert (= (and start!73060 res!575241) b!847106))

(assert (= (and b!847106 res!575238) b!847108))

(assert (= (and b!847108 res!575242) b!847111))

(assert (= (and b!847111 res!575240) b!847102))

(assert (= (and b!847102 res!575239) b!847105))

(assert (= (and b!847105 res!575244) b!847112))

(assert (= (and b!847112 res!575245) b!847104))

(assert (= (and b!847104 res!575243) b!847103))

(assert (= (and b!847109 condMapEmpty!25514) mapIsEmpty!25514))

(assert (= (and b!847109 (not condMapEmpty!25514)) mapNonEmpty!25514))

(get-info :version)

(assert (= (and mapNonEmpty!25514 ((_ is ValueCellFull!7532) mapValue!25514)) b!847107))

(assert (= (and b!847109 ((_ is ValueCellFull!7532) mapDefault!25514)) b!847110))

(assert (= start!73060 b!847109))

(declare-fun m!788969 () Bool)

(assert (=> b!847111 m!788969))

(declare-fun m!788971 () Bool)

(assert (=> b!847103 m!788971))

(declare-fun m!788973 () Bool)

(assert (=> b!847103 m!788973))

(declare-fun m!788975 () Bool)

(assert (=> b!847103 m!788975))

(declare-fun m!788977 () Bool)

(assert (=> b!847104 m!788977))

(declare-fun m!788979 () Bool)

(assert (=> b!847102 m!788979))

(declare-fun m!788981 () Bool)

(assert (=> b!847106 m!788981))

(declare-fun m!788983 () Bool)

(assert (=> mapNonEmpty!25514 m!788983))

(declare-fun m!788985 () Bool)

(assert (=> start!73060 m!788985))

(declare-fun m!788987 () Bool)

(assert (=> start!73060 m!788987))

(declare-fun m!788989 () Bool)

(assert (=> b!847112 m!788989))

(check-sat (not b!847102) (not mapNonEmpty!25514) (not start!73060) (not b!847103) (not b!847111) (not b!847106) (not b_next!13807) (not b!847112) b_and!22903 tp_is_empty!15943)
(check-sat b_and!22903 (not b_next!13807))
