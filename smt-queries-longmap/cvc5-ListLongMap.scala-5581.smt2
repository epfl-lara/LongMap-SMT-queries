; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73270 () Bool)

(assert start!73270)

(declare-fun b_free!14185 () Bool)

(declare-fun b_next!14185 () Bool)

(assert (=> start!73270 (= b_free!14185 (not b_next!14185))))

(declare-fun tp!50058 () Bool)

(declare-fun b_and!23529 () Bool)

(assert (=> start!73270 (= tp!50058 b_and!23529)))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!26809 0))(
  ( (V!26810 (val!8208 Int)) )
))
(declare-datatypes ((ValueCell!7721 0))(
  ( (ValueCellFull!7721 (v!10633 V!26809)) (EmptyCell!7721) )
))
(declare-datatypes ((array!48840 0))(
  ( (array!48841 (arr!23451 (Array (_ BitVec 32) ValueCell!7721)) (size!23891 (_ BitVec 32))) )
))
(declare-fun lt!385416 () array!48840)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48842 0))(
  ( (array!48843 (arr!23452 (Array (_ BitVec 32) (_ BitVec 64))) (size!23892 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48842)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26809)

(declare-fun zeroValue!654 () V!26809)

(declare-fun bm!38407 () Bool)

(declare-datatypes ((tuple2!10806 0))(
  ( (tuple2!10807 (_1!5414 (_ BitVec 64)) (_2!5414 V!26809)) )
))
(declare-datatypes ((List!16622 0))(
  ( (Nil!16619) (Cons!16618 (h!17749 tuple2!10806) (t!23253 List!16622)) )
))
(declare-datatypes ((ListLongMap!9575 0))(
  ( (ListLongMap!9576 (toList!4803 List!16622)) )
))
(declare-fun call!38410 () ListLongMap!9575)

(declare-fun getCurrentListMapNoExtraKeys!2784 (array!48842 array!48840 (_ BitVec 32) (_ BitVec 32) V!26809 V!26809 (_ BitVec 32) Int) ListLongMap!9575)

(assert (=> bm!38407 (= call!38410 (getCurrentListMapNoExtraKeys!2784 _keys!868 lt!385416 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854502 () Bool)

(declare-fun e!476484 () Bool)

(declare-fun e!476483 () Bool)

(assert (=> b!854502 (= e!476484 (not e!476483))))

(declare-fun res!580304 () Bool)

(assert (=> b!854502 (=> res!580304 e!476483)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!854502 (= res!580304 (not (validKeyInArray!0 (select (arr!23452 _keys!868) from!1053))))))

(declare-fun e!476487 () Bool)

(assert (=> b!854502 e!476487))

(declare-fun c!91948 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!854502 (= c!91948 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!26809)

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((Unit!29169 0))(
  ( (Unit!29170) )
))
(declare-fun lt!385418 () Unit!29169)

(declare-fun _values!688 () array!48840)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!413 (array!48842 array!48840 (_ BitVec 32) (_ BitVec 32) V!26809 V!26809 (_ BitVec 32) (_ BitVec 64) V!26809 (_ BitVec 32) Int) Unit!29169)

(assert (=> b!854502 (= lt!385418 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!413 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854503 () Bool)

(declare-fun call!38411 () ListLongMap!9575)

(assert (=> b!854503 (= e!476487 (= call!38410 call!38411))))

(declare-fun b!854504 () Bool)

(declare-fun res!580302 () Bool)

(declare-fun e!476481 () Bool)

(assert (=> b!854504 (=> (not res!580302) (not e!476481))))

(declare-datatypes ((List!16623 0))(
  ( (Nil!16620) (Cons!16619 (h!17750 (_ BitVec 64)) (t!23254 List!16623)) )
))
(declare-fun arrayNoDuplicates!0 (array!48842 (_ BitVec 32) List!16623) Bool)

(assert (=> b!854504 (= res!580302 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16620))))

(declare-fun b!854505 () Bool)

(assert (=> b!854505 (= e!476481 e!476484)))

(declare-fun res!580307 () Bool)

(assert (=> b!854505 (=> (not res!580307) (not e!476484))))

(assert (=> b!854505 (= res!580307 (= from!1053 i!612))))

(declare-fun lt!385423 () ListLongMap!9575)

(assert (=> b!854505 (= lt!385423 (getCurrentListMapNoExtraKeys!2784 _keys!868 lt!385416 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!854505 (= lt!385416 (array!48841 (store (arr!23451 _values!688) i!612 (ValueCellFull!7721 v!557)) (size!23891 _values!688)))))

(declare-fun lt!385419 () ListLongMap!9575)

(assert (=> b!854505 (= lt!385419 (getCurrentListMapNoExtraKeys!2784 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!854506 () Bool)

(declare-fun res!580305 () Bool)

(assert (=> b!854506 (=> (not res!580305) (not e!476481))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!854506 (= res!580305 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!26081 () Bool)

(declare-fun mapRes!26081 () Bool)

(declare-fun tp!50059 () Bool)

(declare-fun e!476485 () Bool)

(assert (=> mapNonEmpty!26081 (= mapRes!26081 (and tp!50059 e!476485))))

(declare-fun mapValue!26081 () ValueCell!7721)

(declare-fun mapKey!26081 () (_ BitVec 32))

(declare-fun mapRest!26081 () (Array (_ BitVec 32) ValueCell!7721))

(assert (=> mapNonEmpty!26081 (= (arr!23451 _values!688) (store mapRest!26081 mapKey!26081 mapValue!26081))))

(declare-fun b!854507 () Bool)

(declare-fun e!476482 () Bool)

(declare-fun tp_is_empty!16321 () Bool)

(assert (=> b!854507 (= e!476482 tp_is_empty!16321)))

(declare-fun bm!38408 () Bool)

(assert (=> bm!38408 (= call!38411 (getCurrentListMapNoExtraKeys!2784 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!26081 () Bool)

(assert (=> mapIsEmpty!26081 mapRes!26081))

(declare-fun b!854508 () Bool)

(declare-fun res!580300 () Bool)

(assert (=> b!854508 (=> (not res!580300) (not e!476481))))

(assert (=> b!854508 (= res!580300 (validKeyInArray!0 k!854))))

(declare-fun b!854509 () Bool)

(declare-fun res!580298 () Bool)

(assert (=> b!854509 (=> (not res!580298) (not e!476481))))

(assert (=> b!854509 (= res!580298 (and (= (size!23891 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23892 _keys!868) (size!23891 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!854510 () Bool)

(assert (=> b!854510 (= e!476483 true)))

(declare-fun lt!385421 () tuple2!10806)

(declare-fun lt!385417 () V!26809)

(declare-fun lt!385415 () ListLongMap!9575)

(declare-fun +!2191 (ListLongMap!9575 tuple2!10806) ListLongMap!9575)

(assert (=> b!854510 (= (+!2191 lt!385415 lt!385421) (+!2191 (+!2191 lt!385415 (tuple2!10807 k!854 lt!385417)) lt!385421))))

(declare-fun lt!385420 () V!26809)

(assert (=> b!854510 (= lt!385421 (tuple2!10807 k!854 lt!385420))))

(declare-fun lt!385422 () Unit!29169)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!316 (ListLongMap!9575 (_ BitVec 64) V!26809 V!26809) Unit!29169)

(assert (=> b!854510 (= lt!385422 (addSameAsAddTwiceSameKeyDiffValues!316 lt!385415 k!854 lt!385417 lt!385420))))

(declare-fun lt!385414 () V!26809)

(declare-fun get!12376 (ValueCell!7721 V!26809) V!26809)

(assert (=> b!854510 (= lt!385417 (get!12376 (select (arr!23451 _values!688) from!1053) lt!385414))))

(assert (=> b!854510 (= lt!385423 (+!2191 lt!385415 (tuple2!10807 (select (arr!23452 _keys!868) from!1053) lt!385420)))))

(assert (=> b!854510 (= lt!385420 (get!12376 (select (store (arr!23451 _values!688) i!612 (ValueCellFull!7721 v!557)) from!1053) lt!385414))))

(declare-fun dynLambda!1070 (Int (_ BitVec 64)) V!26809)

(assert (=> b!854510 (= lt!385414 (dynLambda!1070 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!854510 (= lt!385415 (getCurrentListMapNoExtraKeys!2784 _keys!868 lt!385416 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!580299 () Bool)

(assert (=> start!73270 (=> (not res!580299) (not e!476481))))

(assert (=> start!73270 (= res!580299 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23892 _keys!868))))))

(assert (=> start!73270 e!476481))

(assert (=> start!73270 tp_is_empty!16321))

(assert (=> start!73270 true))

(assert (=> start!73270 tp!50058))

(declare-fun array_inv!18586 (array!48842) Bool)

(assert (=> start!73270 (array_inv!18586 _keys!868)))

(declare-fun e!476488 () Bool)

(declare-fun array_inv!18587 (array!48840) Bool)

(assert (=> start!73270 (and (array_inv!18587 _values!688) e!476488)))

(declare-fun b!854511 () Bool)

(assert (=> b!854511 (= e!476487 (= call!38410 (+!2191 call!38411 (tuple2!10807 k!854 v!557))))))

(declare-fun b!854512 () Bool)

(declare-fun res!580303 () Bool)

(assert (=> b!854512 (=> (not res!580303) (not e!476481))))

(assert (=> b!854512 (= res!580303 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23892 _keys!868))))))

(declare-fun b!854513 () Bool)

(assert (=> b!854513 (= e!476485 tp_is_empty!16321)))

(declare-fun b!854514 () Bool)

(declare-fun res!580301 () Bool)

(assert (=> b!854514 (=> (not res!580301) (not e!476481))))

(assert (=> b!854514 (= res!580301 (and (= (select (arr!23452 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!854515 () Bool)

(declare-fun res!580306 () Bool)

(assert (=> b!854515 (=> (not res!580306) (not e!476481))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48842 (_ BitVec 32)) Bool)

(assert (=> b!854515 (= res!580306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!854516 () Bool)

(assert (=> b!854516 (= e!476488 (and e!476482 mapRes!26081))))

(declare-fun condMapEmpty!26081 () Bool)

(declare-fun mapDefault!26081 () ValueCell!7721)

