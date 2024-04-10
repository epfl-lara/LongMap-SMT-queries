; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73078 () Bool)

(assert start!73078)

(declare-fun b_free!13993 () Bool)

(declare-fun b_next!13993 () Bool)

(assert (=> start!73078 (= b_free!13993 (not b_next!13993))))

(declare-fun tp!49482 () Bool)

(declare-fun b_and!23145 () Bool)

(assert (=> start!73078 (= tp!49482 b_and!23145)))

(declare-fun b!849990 () Bool)

(declare-fun res!577418 () Bool)

(declare-fun e!474182 () Bool)

(assert (=> b!849990 (=> (not res!577418) (not e!474182))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!849990 (= res!577418 (validKeyInArray!0 k!854))))

(declare-fun b!849991 () Bool)

(declare-fun res!577420 () Bool)

(assert (=> b!849991 (=> (not res!577420) (not e!474182))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!849991 (= res!577420 (validMask!0 mask!1196))))

(declare-fun b!849992 () Bool)

(declare-fun e!474179 () Bool)

(assert (=> b!849992 (= e!474182 e!474179)))

(declare-fun res!577422 () Bool)

(assert (=> b!849992 (=> (not res!577422) (not e!474179))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!849992 (= res!577422 (= from!1053 i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!26553 0))(
  ( (V!26554 (val!8112 Int)) )
))
(declare-datatypes ((ValueCell!7625 0))(
  ( (ValueCellFull!7625 (v!10537 V!26553)) (EmptyCell!7625) )
))
(declare-datatypes ((array!48464 0))(
  ( (array!48465 (arr!23263 (Array (_ BitVec 32) ValueCell!7625)) (size!23703 (_ BitVec 32))) )
))
(declare-fun lt!382538 () array!48464)

(declare-datatypes ((tuple2!10628 0))(
  ( (tuple2!10629 (_1!5325 (_ BitVec 64)) (_2!5325 V!26553)) )
))
(declare-datatypes ((List!16473 0))(
  ( (Nil!16470) (Cons!16469 (h!17600 tuple2!10628) (t!22912 List!16473)) )
))
(declare-datatypes ((ListLongMap!9397 0))(
  ( (ListLongMap!9398 (toList!4714 List!16473)) )
))
(declare-fun lt!382542 () ListLongMap!9397)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!48466 0))(
  ( (array!48467 (arr!23264 (Array (_ BitVec 32) (_ BitVec 64))) (size!23704 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48466)

(declare-fun minValue!654 () V!26553)

(declare-fun zeroValue!654 () V!26553)

(declare-fun getCurrentListMapNoExtraKeys!2696 (array!48466 array!48464 (_ BitVec 32) (_ BitVec 32) V!26553 V!26553 (_ BitVec 32) Int) ListLongMap!9397)

(assert (=> b!849992 (= lt!382542 (getCurrentListMapNoExtraKeys!2696 _keys!868 lt!382538 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26553)

(declare-fun _values!688 () array!48464)

(assert (=> b!849992 (= lt!382538 (array!48465 (store (arr!23263 _values!688) i!612 (ValueCellFull!7625 v!557)) (size!23703 _values!688)))))

(declare-fun lt!382539 () ListLongMap!9397)

(assert (=> b!849992 (= lt!382539 (getCurrentListMapNoExtraKeys!2696 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!849993 () Bool)

(declare-fun e!474184 () Bool)

(declare-fun tp_is_empty!16129 () Bool)

(assert (=> b!849993 (= e!474184 tp_is_empty!16129)))

(declare-fun b!849994 () Bool)

(declare-fun res!577421 () Bool)

(assert (=> b!849994 (=> (not res!577421) (not e!474182))))

(assert (=> b!849994 (= res!577421 (and (= (select (arr!23264 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!849995 () Bool)

(declare-fun e!474177 () Bool)

(assert (=> b!849995 (= e!474179 (not e!474177))))

(declare-fun res!577424 () Bool)

(assert (=> b!849995 (=> res!577424 e!474177)))

(assert (=> b!849995 (= res!577424 (not (validKeyInArray!0 (select (arr!23264 _keys!868) from!1053))))))

(declare-fun e!474180 () Bool)

(assert (=> b!849995 e!474180))

(declare-fun c!91660 () Bool)

(assert (=> b!849995 (= c!91660 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29023 0))(
  ( (Unit!29024) )
))
(declare-fun lt!382537 () Unit!29023)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!355 (array!48466 array!48464 (_ BitVec 32) (_ BitVec 32) V!26553 V!26553 (_ BitVec 32) (_ BitVec 64) V!26553 (_ BitVec 32) Int) Unit!29023)

(assert (=> b!849995 (= lt!382537 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!355 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!25793 () Bool)

(declare-fun mapRes!25793 () Bool)

(assert (=> mapIsEmpty!25793 mapRes!25793))

(declare-fun b!849996 () Bool)

(declare-fun e!474183 () Bool)

(assert (=> b!849996 (= e!474183 tp_is_empty!16129)))

(declare-fun b!849997 () Bool)

(declare-fun res!577419 () Bool)

(assert (=> b!849997 (=> (not res!577419) (not e!474182))))

(assert (=> b!849997 (= res!577419 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23704 _keys!868))))))

(declare-fun b!849998 () Bool)

(declare-fun res!577427 () Bool)

(assert (=> b!849998 (=> (not res!577427) (not e!474182))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48466 (_ BitVec 32)) Bool)

(assert (=> b!849998 (= res!577427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!849999 () Bool)

(declare-fun res!577426 () Bool)

(assert (=> b!849999 (=> (not res!577426) (not e!474182))))

(declare-datatypes ((List!16474 0))(
  ( (Nil!16471) (Cons!16470 (h!17601 (_ BitVec 64)) (t!22913 List!16474)) )
))
(declare-fun arrayNoDuplicates!0 (array!48466 (_ BitVec 32) List!16474) Bool)

(assert (=> b!849999 (= res!577426 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16471))))

(declare-fun res!577423 () Bool)

(assert (=> start!73078 (=> (not res!577423) (not e!474182))))

(assert (=> start!73078 (= res!577423 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23704 _keys!868))))))

(assert (=> start!73078 e!474182))

(assert (=> start!73078 tp_is_empty!16129))

(assert (=> start!73078 true))

(assert (=> start!73078 tp!49482))

(declare-fun array_inv!18460 (array!48466) Bool)

(assert (=> start!73078 (array_inv!18460 _keys!868)))

(declare-fun e!474178 () Bool)

(declare-fun array_inv!18461 (array!48464) Bool)

(assert (=> start!73078 (and (array_inv!18461 _values!688) e!474178)))

(declare-fun call!37835 () ListLongMap!9397)

(declare-fun bm!37831 () Bool)

(assert (=> bm!37831 (= call!37835 (getCurrentListMapNoExtraKeys!2696 _keys!868 lt!382538 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850000 () Bool)

(assert (=> b!850000 (= e!474178 (and e!474184 mapRes!25793))))

(declare-fun condMapEmpty!25793 () Bool)

(declare-fun mapDefault!25793 () ValueCell!7625)

