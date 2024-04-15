; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73354 () Bool)

(assert start!73354)

(declare-fun b_free!14287 () Bool)

(declare-fun b_next!14287 () Bool)

(assert (=> start!73354 (= b_free!14287 (not b_next!14287))))

(declare-fun tp!50366 () Bool)

(declare-fun b_and!23617 () Bool)

(assert (=> start!73354 (= tp!50366 b_and!23617)))

(declare-fun b!856051 () Bool)

(declare-fun res!581475 () Bool)

(declare-fun e!477179 () Bool)

(assert (=> b!856051 (=> (not res!581475) (not e!477179))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49025 0))(
  ( (array!49026 (arr!23544 (Array (_ BitVec 32) (_ BitVec 64))) (size!23986 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49025)

(assert (=> b!856051 (= res!581475 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23986 _keys!868))))))

(declare-fun b!856053 () Bool)

(declare-fun e!477177 () Bool)

(assert (=> b!856053 (= e!477177 (not true))))

(declare-datatypes ((V!26945 0))(
  ( (V!26946 (val!8259 Int)) )
))
(declare-fun v!557 () V!26945)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((ValueCell!7772 0))(
  ( (ValueCellFull!7772 (v!10678 V!26945)) (EmptyCell!7772) )
))
(declare-datatypes ((array!49027 0))(
  ( (array!49028 (arr!23545 (Array (_ BitVec 32) ValueCell!7772)) (size!23987 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49027)

(declare-fun minValue!654 () V!26945)

(declare-fun zeroValue!654 () V!26945)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lt!385672 () array!49027)

(declare-datatypes ((tuple2!10896 0))(
  ( (tuple2!10897 (_1!5459 (_ BitVec 64)) (_2!5459 V!26945)) )
))
(declare-datatypes ((List!16704 0))(
  ( (Nil!16701) (Cons!16700 (h!17831 tuple2!10896) (t!23336 List!16704)) )
))
(declare-datatypes ((ListLongMap!9655 0))(
  ( (ListLongMap!9656 (toList!4843 List!16704)) )
))
(declare-fun getCurrentListMapNoExtraKeys!2850 (array!49025 array!49027 (_ BitVec 32) (_ BitVec 32) V!26945 V!26945 (_ BitVec 32) Int) ListLongMap!9655)

(declare-fun +!2223 (ListLongMap!9655 tuple2!10896) ListLongMap!9655)

(assert (=> b!856053 (= (getCurrentListMapNoExtraKeys!2850 _keys!868 lt!385672 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2223 (getCurrentListMapNoExtraKeys!2850 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10897 k0!854 v!557)))))

(declare-datatypes ((Unit!29115 0))(
  ( (Unit!29116) )
))
(declare-fun lt!385671 () Unit!29115)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!420 (array!49025 array!49027 (_ BitVec 32) (_ BitVec 32) V!26945 V!26945 (_ BitVec 32) (_ BitVec 64) V!26945 (_ BitVec 32) Int) Unit!29115)

(assert (=> b!856053 (= lt!385671 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!420 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!856054 () Bool)

(declare-fun res!581480 () Bool)

(assert (=> b!856054 (=> (not res!581480) (not e!477179))))

(assert (=> b!856054 (= res!581480 (and (= (size!23987 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23986 _keys!868) (size!23987 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!856055 () Bool)

(declare-fun res!581481 () Bool)

(assert (=> b!856055 (=> (not res!581481) (not e!477179))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49025 (_ BitVec 32)) Bool)

(assert (=> b!856055 (= res!581481 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!856056 () Bool)

(declare-fun e!477180 () Bool)

(declare-fun tp_is_empty!16423 () Bool)

(assert (=> b!856056 (= e!477180 tp_is_empty!16423)))

(declare-fun b!856052 () Bool)

(declare-fun e!477175 () Bool)

(assert (=> b!856052 (= e!477175 tp_is_empty!16423)))

(declare-fun res!581479 () Bool)

(assert (=> start!73354 (=> (not res!581479) (not e!477179))))

(assert (=> start!73354 (= res!581479 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23986 _keys!868))))))

(assert (=> start!73354 e!477179))

(assert (=> start!73354 tp_is_empty!16423))

(assert (=> start!73354 true))

(assert (=> start!73354 tp!50366))

(declare-fun array_inv!18722 (array!49025) Bool)

(assert (=> start!73354 (array_inv!18722 _keys!868)))

(declare-fun e!477178 () Bool)

(declare-fun array_inv!18723 (array!49027) Bool)

(assert (=> start!73354 (and (array_inv!18723 _values!688) e!477178)))

(declare-fun mapIsEmpty!26234 () Bool)

(declare-fun mapRes!26234 () Bool)

(assert (=> mapIsEmpty!26234 mapRes!26234))

(declare-fun b!856057 () Bool)

(declare-fun res!581476 () Bool)

(assert (=> b!856057 (=> (not res!581476) (not e!477179))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!856057 (= res!581476 (validMask!0 mask!1196))))

(declare-fun b!856058 () Bool)

(declare-fun res!581473 () Bool)

(assert (=> b!856058 (=> (not res!581473) (not e!477179))))

(assert (=> b!856058 (= res!581473 (and (= (select (arr!23544 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!26234 () Bool)

(declare-fun tp!50365 () Bool)

(assert (=> mapNonEmpty!26234 (= mapRes!26234 (and tp!50365 e!477175))))

(declare-fun mapKey!26234 () (_ BitVec 32))

(declare-fun mapRest!26234 () (Array (_ BitVec 32) ValueCell!7772))

(declare-fun mapValue!26234 () ValueCell!7772)

(assert (=> mapNonEmpty!26234 (= (arr!23545 _values!688) (store mapRest!26234 mapKey!26234 mapValue!26234))))

(declare-fun b!856059 () Bool)

(assert (=> b!856059 (= e!477179 e!477177)))

(declare-fun res!581478 () Bool)

(assert (=> b!856059 (=> (not res!581478) (not e!477177))))

(assert (=> b!856059 (= res!581478 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!385673 () ListLongMap!9655)

(assert (=> b!856059 (= lt!385673 (getCurrentListMapNoExtraKeys!2850 _keys!868 lt!385672 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!856059 (= lt!385672 (array!49028 (store (arr!23545 _values!688) i!612 (ValueCellFull!7772 v!557)) (size!23987 _values!688)))))

(declare-fun lt!385670 () ListLongMap!9655)

(assert (=> b!856059 (= lt!385670 (getCurrentListMapNoExtraKeys!2850 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!856060 () Bool)

(declare-fun res!581477 () Bool)

(assert (=> b!856060 (=> (not res!581477) (not e!477179))))

(declare-datatypes ((List!16705 0))(
  ( (Nil!16702) (Cons!16701 (h!17832 (_ BitVec 64)) (t!23337 List!16705)) )
))
(declare-fun arrayNoDuplicates!0 (array!49025 (_ BitVec 32) List!16705) Bool)

(assert (=> b!856060 (= res!581477 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16702))))

(declare-fun b!856061 () Bool)

(assert (=> b!856061 (= e!477178 (and e!477180 mapRes!26234))))

(declare-fun condMapEmpty!26234 () Bool)

(declare-fun mapDefault!26234 () ValueCell!7772)

(assert (=> b!856061 (= condMapEmpty!26234 (= (arr!23545 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7772)) mapDefault!26234)))))

(declare-fun b!856062 () Bool)

(declare-fun res!581474 () Bool)

(assert (=> b!856062 (=> (not res!581474) (not e!477179))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!856062 (= res!581474 (validKeyInArray!0 k0!854))))

(assert (= (and start!73354 res!581479) b!856057))

(assert (= (and b!856057 res!581476) b!856054))

(assert (= (and b!856054 res!581480) b!856055))

(assert (= (and b!856055 res!581481) b!856060))

(assert (= (and b!856060 res!581477) b!856051))

(assert (= (and b!856051 res!581475) b!856062))

(assert (= (and b!856062 res!581474) b!856058))

(assert (= (and b!856058 res!581473) b!856059))

(assert (= (and b!856059 res!581478) b!856053))

(assert (= (and b!856061 condMapEmpty!26234) mapIsEmpty!26234))

(assert (= (and b!856061 (not condMapEmpty!26234)) mapNonEmpty!26234))

(get-info :version)

(assert (= (and mapNonEmpty!26234 ((_ is ValueCellFull!7772) mapValue!26234)) b!856052))

(assert (= (and b!856061 ((_ is ValueCellFull!7772) mapDefault!26234)) b!856056))

(assert (= start!73354 b!856061))

(declare-fun m!796503 () Bool)

(assert (=> b!856057 m!796503))

(declare-fun m!796505 () Bool)

(assert (=> mapNonEmpty!26234 m!796505))

(declare-fun m!796507 () Bool)

(assert (=> start!73354 m!796507))

(declare-fun m!796509 () Bool)

(assert (=> start!73354 m!796509))

(declare-fun m!796511 () Bool)

(assert (=> b!856053 m!796511))

(declare-fun m!796513 () Bool)

(assert (=> b!856053 m!796513))

(assert (=> b!856053 m!796513))

(declare-fun m!796515 () Bool)

(assert (=> b!856053 m!796515))

(declare-fun m!796517 () Bool)

(assert (=> b!856053 m!796517))

(declare-fun m!796519 () Bool)

(assert (=> b!856055 m!796519))

(declare-fun m!796521 () Bool)

(assert (=> b!856060 m!796521))

(declare-fun m!796523 () Bool)

(assert (=> b!856058 m!796523))

(declare-fun m!796525 () Bool)

(assert (=> b!856062 m!796525))

(declare-fun m!796527 () Bool)

(assert (=> b!856059 m!796527))

(declare-fun m!796529 () Bool)

(assert (=> b!856059 m!796529))

(declare-fun m!796531 () Bool)

(assert (=> b!856059 m!796531))

(check-sat (not start!73354) (not b!856060) b_and!23617 (not b!856053) (not b!856057) tp_is_empty!16423 (not b_next!14287) (not b!856062) (not b!856059) (not b!856055) (not mapNonEmpty!26234))
(check-sat b_and!23617 (not b_next!14287))
