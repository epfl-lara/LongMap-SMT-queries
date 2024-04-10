; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73108 () Bool)

(assert start!73108)

(declare-fun b_free!14023 () Bool)

(declare-fun b_next!14023 () Bool)

(assert (=> start!73108 (= b_free!14023 (not b_next!14023))))

(declare-fun tp!49573 () Bool)

(declare-fun b_and!23205 () Bool)

(assert (=> start!73108 (= tp!49573 b_and!23205)))

(declare-fun b!850695 () Bool)

(declare-fun e!474537 () Bool)

(assert (=> b!850695 (= e!474537 true)))

(declare-datatypes ((V!26593 0))(
  ( (V!26594 (val!8127 Int)) )
))
(declare-fun lt!382989 () V!26593)

(declare-datatypes ((tuple2!10656 0))(
  ( (tuple2!10657 (_1!5339 (_ BitVec 64)) (_2!5339 V!26593)) )
))
(declare-fun lt!382986 () tuple2!10656)

(declare-datatypes ((List!16498 0))(
  ( (Nil!16495) (Cons!16494 (h!17625 tuple2!10656) (t!22967 List!16498)) )
))
(declare-datatypes ((ListLongMap!9425 0))(
  ( (ListLongMap!9426 (toList!4728 List!16498)) )
))
(declare-fun lt!382991 () ListLongMap!9425)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun +!2129 (ListLongMap!9425 tuple2!10656) ListLongMap!9425)

(assert (=> b!850695 (= (+!2129 lt!382991 lt!382986) (+!2129 (+!2129 lt!382991 (tuple2!10657 k!854 lt!382989)) lt!382986))))

(declare-fun lt!382988 () V!26593)

(assert (=> b!850695 (= lt!382986 (tuple2!10657 k!854 lt!382988))))

(declare-datatypes ((Unit!29049 0))(
  ( (Unit!29050) )
))
(declare-fun lt!382987 () Unit!29049)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!264 (ListLongMap!9425 (_ BitVec 64) V!26593 V!26593) Unit!29049)

(assert (=> b!850695 (= lt!382987 (addSameAsAddTwiceSameKeyDiffValues!264 lt!382991 k!854 lt!382989 lt!382988))))

(declare-fun lt!382993 () V!26593)

(declare-datatypes ((ValueCell!7640 0))(
  ( (ValueCellFull!7640 (v!10552 V!26593)) (EmptyCell!7640) )
))
(declare-datatypes ((array!48522 0))(
  ( (array!48523 (arr!23292 (Array (_ BitVec 32) ValueCell!7640)) (size!23732 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48522)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun get!12270 (ValueCell!7640 V!26593) V!26593)

(assert (=> b!850695 (= lt!382989 (get!12270 (select (arr!23292 _values!688) from!1053) lt!382993))))

(declare-fun lt!382984 () ListLongMap!9425)

(declare-datatypes ((array!48524 0))(
  ( (array!48525 (arr!23293 (Array (_ BitVec 32) (_ BitVec 64))) (size!23733 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48524)

(assert (=> b!850695 (= lt!382984 (+!2129 lt!382991 (tuple2!10657 (select (arr!23293 _keys!868) from!1053) lt!382988)))))

(declare-fun v!557 () V!26593)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!850695 (= lt!382988 (get!12270 (select (store (arr!23292 _values!688) i!612 (ValueCellFull!7640 v!557)) from!1053) lt!382993))))

(declare-fun defaultEntry!696 () Int)

(declare-fun dynLambda!1018 (Int (_ BitVec 64)) V!26593)

(assert (=> b!850695 (= lt!382993 (dynLambda!1018 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun lt!382992 () array!48522)

(declare-fun minValue!654 () V!26593)

(declare-fun zeroValue!654 () V!26593)

(declare-fun getCurrentListMapNoExtraKeys!2710 (array!48524 array!48522 (_ BitVec 32) (_ BitVec 32) V!26593 V!26593 (_ BitVec 32) Int) ListLongMap!9425)

(assert (=> b!850695 (= lt!382991 (getCurrentListMapNoExtraKeys!2710 _keys!868 lt!382992 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850696 () Bool)

(declare-fun res!577877 () Bool)

(declare-fun e!474540 () Bool)

(assert (=> b!850696 (=> (not res!577877) (not e!474540))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!850696 (= res!577877 (validKeyInArray!0 k!854))))

(declare-fun b!850697 () Bool)

(declare-fun res!577876 () Bool)

(assert (=> b!850697 (=> (not res!577876) (not e!474540))))

(declare-datatypes ((List!16499 0))(
  ( (Nil!16496) (Cons!16495 (h!17626 (_ BitVec 64)) (t!22968 List!16499)) )
))
(declare-fun arrayNoDuplicates!0 (array!48524 (_ BitVec 32) List!16499) Bool)

(assert (=> b!850697 (= res!577876 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16496))))

(declare-fun call!37924 () ListLongMap!9425)

(declare-fun call!37925 () ListLongMap!9425)

(declare-fun b!850698 () Bool)

(declare-fun e!474544 () Bool)

(assert (=> b!850698 (= e!474544 (= call!37924 (+!2129 call!37925 (tuple2!10657 k!854 v!557))))))

(declare-fun b!850699 () Bool)

(declare-fun e!474541 () Bool)

(declare-fun tp_is_empty!16159 () Bool)

(assert (=> b!850699 (= e!474541 tp_is_empty!16159)))

(declare-fun mapNonEmpty!25838 () Bool)

(declare-fun mapRes!25838 () Bool)

(declare-fun tp!49572 () Bool)

(declare-fun e!474543 () Bool)

(assert (=> mapNonEmpty!25838 (= mapRes!25838 (and tp!49572 e!474543))))

(declare-fun mapValue!25838 () ValueCell!7640)

(declare-fun mapKey!25838 () (_ BitVec 32))

(declare-fun mapRest!25838 () (Array (_ BitVec 32) ValueCell!7640))

(assert (=> mapNonEmpty!25838 (= (arr!23292 _values!688) (store mapRest!25838 mapKey!25838 mapValue!25838))))

(declare-fun res!577869 () Bool)

(assert (=> start!73108 (=> (not res!577869) (not e!474540))))

(assert (=> start!73108 (= res!577869 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23733 _keys!868))))))

(assert (=> start!73108 e!474540))

(assert (=> start!73108 tp_is_empty!16159))

(assert (=> start!73108 true))

(assert (=> start!73108 tp!49573))

(declare-fun array_inv!18484 (array!48524) Bool)

(assert (=> start!73108 (array_inv!18484 _keys!868)))

(declare-fun e!474542 () Bool)

(declare-fun array_inv!18485 (array!48522) Bool)

(assert (=> start!73108 (and (array_inv!18485 _values!688) e!474542)))

(declare-fun b!850700 () Bool)

(declare-fun res!577874 () Bool)

(assert (=> b!850700 (=> (not res!577874) (not e!474540))))

(assert (=> b!850700 (= res!577874 (and (= (select (arr!23293 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!850701 () Bool)

(assert (=> b!850701 (= e!474542 (and e!474541 mapRes!25838))))

(declare-fun condMapEmpty!25838 () Bool)

(declare-fun mapDefault!25838 () ValueCell!7640)

