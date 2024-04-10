; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72882 () Bool)

(assert start!72882)

(declare-fun b_free!13797 () Bool)

(declare-fun b_next!13797 () Bool)

(assert (=> start!72882 (= b_free!13797 (not b_next!13797))))

(declare-fun tp!48895 () Bool)

(declare-fun b_and!22883 () Bool)

(assert (=> start!72882 (= tp!48895 b_and!22883)))

(declare-fun b!846034 () Bool)

(declare-fun res!574777 () Bool)

(declare-fun e!472235 () Bool)

(assert (=> b!846034 (=> (not res!574777) (not e!472235))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48082 0))(
  ( (array!48083 (arr!23072 (Array (_ BitVec 32) (_ BitVec 64))) (size!23512 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48082)

(declare-datatypes ((V!26291 0))(
  ( (V!26292 (val!8014 Int)) )
))
(declare-datatypes ((ValueCell!7527 0))(
  ( (ValueCellFull!7527 (v!10439 V!26291)) (EmptyCell!7527) )
))
(declare-datatypes ((array!48084 0))(
  ( (array!48085 (arr!23073 (Array (_ BitVec 32) ValueCell!7527)) (size!23513 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48084)

(assert (=> b!846034 (= res!574777 (and (= (size!23513 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23512 _keys!868) (size!23513 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!846035 () Bool)

(declare-fun e!472233 () Bool)

(declare-fun e!472237 () Bool)

(declare-fun mapRes!25499 () Bool)

(assert (=> b!846035 (= e!472233 (and e!472237 mapRes!25499))))

(declare-fun condMapEmpty!25499 () Bool)

(declare-fun mapDefault!25499 () ValueCell!7527)

(assert (=> b!846035 (= condMapEmpty!25499 (= (arr!23073 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7527)) mapDefault!25499)))))

(declare-fun b!846036 () Bool)

(declare-fun res!574779 () Bool)

(assert (=> b!846036 (=> (not res!574779) (not e!472235))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!846036 (= res!574779 (validKeyInArray!0 k0!854))))

(declare-fun b!846037 () Bool)

(declare-fun res!574781 () Bool)

(assert (=> b!846037 (=> (not res!574781) (not e!472235))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!846037 (= res!574781 (validMask!0 mask!1196))))

(declare-fun b!846038 () Bool)

(declare-fun res!574776 () Bool)

(assert (=> b!846038 (=> (not res!574776) (not e!472235))))

(declare-datatypes ((List!16329 0))(
  ( (Nil!16326) (Cons!16325 (h!17456 (_ BitVec 64)) (t!22700 List!16329)) )
))
(declare-fun arrayNoDuplicates!0 (array!48082 (_ BitVec 32) List!16329) Bool)

(assert (=> b!846038 (= res!574776 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16326))))

(declare-fun b!846039 () Bool)

(declare-fun tp_is_empty!15933 () Bool)

(assert (=> b!846039 (= e!472237 tp_is_empty!15933)))

(declare-fun b!846040 () Bool)

(assert (=> b!846040 (= e!472235 false)))

(declare-datatypes ((tuple2!10468 0))(
  ( (tuple2!10469 (_1!5245 (_ BitVec 64)) (_2!5245 V!26291)) )
))
(declare-datatypes ((List!16330 0))(
  ( (Nil!16327) (Cons!16326 (h!17457 tuple2!10468) (t!22701 List!16330)) )
))
(declare-datatypes ((ListLongMap!9237 0))(
  ( (ListLongMap!9238 (toList!4634 List!16330)) )
))
(declare-fun lt!381466 () ListLongMap!9237)

(declare-fun defaultEntry!696 () Int)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26291)

(declare-fun zeroValue!654 () V!26291)

(declare-fun getCurrentListMapNoExtraKeys!2619 (array!48082 array!48084 (_ BitVec 32) (_ BitVec 32) V!26291 V!26291 (_ BitVec 32) Int) ListLongMap!9237)

(assert (=> b!846040 (= lt!381466 (getCurrentListMapNoExtraKeys!2619 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!846041 () Bool)

(declare-fun e!472236 () Bool)

(assert (=> b!846041 (= e!472236 tp_is_empty!15933)))

(declare-fun mapIsEmpty!25499 () Bool)

(assert (=> mapIsEmpty!25499 mapRes!25499))

(declare-fun b!846042 () Bool)

(declare-fun res!574775 () Bool)

(assert (=> b!846042 (=> (not res!574775) (not e!472235))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!846042 (= res!574775 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23512 _keys!868))))))

(declare-fun res!574778 () Bool)

(assert (=> start!72882 (=> (not res!574778) (not e!472235))))

(assert (=> start!72882 (= res!574778 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23512 _keys!868))))))

(assert (=> start!72882 e!472235))

(assert (=> start!72882 true))

(assert (=> start!72882 tp!48895))

(declare-fun array_inv!18332 (array!48082) Bool)

(assert (=> start!72882 (array_inv!18332 _keys!868)))

(declare-fun array_inv!18333 (array!48084) Bool)

(assert (=> start!72882 (and (array_inv!18333 _values!688) e!472233)))

(assert (=> start!72882 tp_is_empty!15933))

(declare-fun mapNonEmpty!25499 () Bool)

(declare-fun tp!48894 () Bool)

(assert (=> mapNonEmpty!25499 (= mapRes!25499 (and tp!48894 e!472236))))

(declare-fun mapValue!25499 () ValueCell!7527)

(declare-fun mapKey!25499 () (_ BitVec 32))

(declare-fun mapRest!25499 () (Array (_ BitVec 32) ValueCell!7527))

(assert (=> mapNonEmpty!25499 (= (arr!23073 _values!688) (store mapRest!25499 mapKey!25499 mapValue!25499))))

(declare-fun b!846043 () Bool)

(declare-fun res!574774 () Bool)

(assert (=> b!846043 (=> (not res!574774) (not e!472235))))

(assert (=> b!846043 (= res!574774 (and (= (select (arr!23072 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!846044 () Bool)

(declare-fun res!574780 () Bool)

(assert (=> b!846044 (=> (not res!574780) (not e!472235))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48082 (_ BitVec 32)) Bool)

(assert (=> b!846044 (= res!574780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!72882 res!574778) b!846037))

(assert (= (and b!846037 res!574781) b!846034))

(assert (= (and b!846034 res!574777) b!846044))

(assert (= (and b!846044 res!574780) b!846038))

(assert (= (and b!846038 res!574776) b!846042))

(assert (= (and b!846042 res!574775) b!846036))

(assert (= (and b!846036 res!574779) b!846043))

(assert (= (and b!846043 res!574774) b!846040))

(assert (= (and b!846035 condMapEmpty!25499) mapIsEmpty!25499))

(assert (= (and b!846035 (not condMapEmpty!25499)) mapNonEmpty!25499))

(get-info :version)

(assert (= (and mapNonEmpty!25499 ((_ is ValueCellFull!7527) mapValue!25499)) b!846041))

(assert (= (and b!846035 ((_ is ValueCellFull!7527) mapDefault!25499)) b!846039))

(assert (= start!72882 b!846035))

(declare-fun m!787575 () Bool)

(assert (=> b!846038 m!787575))

(declare-fun m!787577 () Bool)

(assert (=> b!846036 m!787577))

(declare-fun m!787579 () Bool)

(assert (=> mapNonEmpty!25499 m!787579))

(declare-fun m!787581 () Bool)

(assert (=> start!72882 m!787581))

(declare-fun m!787583 () Bool)

(assert (=> start!72882 m!787583))

(declare-fun m!787585 () Bool)

(assert (=> b!846044 m!787585))

(declare-fun m!787587 () Bool)

(assert (=> b!846043 m!787587))

(declare-fun m!787589 () Bool)

(assert (=> b!846040 m!787589))

(declare-fun m!787591 () Bool)

(assert (=> b!846037 m!787591))

(check-sat (not b!846038) (not b!846044) (not start!72882) (not b_next!13797) (not mapNonEmpty!25499) (not b!846040) (not b!846037) (not b!846036) b_and!22883 tp_is_empty!15933)
(check-sat b_and!22883 (not b_next!13797))
