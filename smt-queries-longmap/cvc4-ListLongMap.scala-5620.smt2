; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73508 () Bool)

(assert start!73508)

(declare-fun b_free!14423 () Bool)

(declare-fun b_next!14423 () Bool)

(assert (=> start!73508 (= b_free!14423 (not b_next!14423))))

(declare-fun tp!50772 () Bool)

(declare-fun b_and!23825 () Bool)

(assert (=> start!73508 (= tp!50772 b_and!23825)))

(declare-fun b!858890 () Bool)

(declare-fun res!583528 () Bool)

(declare-fun e!478655 () Bool)

(assert (=> b!858890 (=> (not res!583528) (not e!478655))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49302 0))(
  ( (array!49303 (arr!23682 (Array (_ BitVec 32) (_ BitVec 64))) (size!24122 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49302)

(declare-datatypes ((V!27125 0))(
  ( (V!27126 (val!8327 Int)) )
))
(declare-datatypes ((ValueCell!7840 0))(
  ( (ValueCellFull!7840 (v!10752 V!27125)) (EmptyCell!7840) )
))
(declare-datatypes ((array!49304 0))(
  ( (array!49305 (arr!23683 (Array (_ BitVec 32) ValueCell!7840)) (size!24123 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49304)

(assert (=> b!858890 (= res!583528 (and (= (size!24123 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24122 _keys!868) (size!24123 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!858891 () Bool)

(declare-fun res!583534 () Bool)

(assert (=> b!858891 (=> (not res!583534) (not e!478655))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!858891 (= res!583534 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24122 _keys!868))))))

(declare-fun b!858893 () Bool)

(declare-fun e!478654 () Bool)

(declare-fun e!478660 () Bool)

(assert (=> b!858893 (= e!478654 e!478660)))

(declare-fun res!583526 () Bool)

(assert (=> b!858893 (=> res!583526 e!478660)))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!858893 (= res!583526 (not (= (select (arr!23682 _keys!868) from!1053) k!854)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10994 0))(
  ( (tuple2!10995 (_1!5508 (_ BitVec 64)) (_2!5508 V!27125)) )
))
(declare-datatypes ((List!16803 0))(
  ( (Nil!16800) (Cons!16799 (h!17930 tuple2!10994) (t!23492 List!16803)) )
))
(declare-datatypes ((ListLongMap!9763 0))(
  ( (ListLongMap!9764 (toList!4897 List!16803)) )
))
(declare-fun lt!386963 () ListLongMap!9763)

(declare-fun lt!386961 () ListLongMap!9763)

(declare-fun +!2250 (ListLongMap!9763 tuple2!10994) ListLongMap!9763)

(declare-fun get!12474 (ValueCell!7840 V!27125) V!27125)

(declare-fun dynLambda!1090 (Int (_ BitVec 64)) V!27125)

(assert (=> b!858893 (= lt!386961 (+!2250 lt!386963 (tuple2!10995 (select (arr!23682 _keys!868) from!1053) (get!12474 (select (arr!23683 _values!688) from!1053) (dynLambda!1090 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!858894 () Bool)

(assert (=> b!858894 (= e!478660 true)))

(declare-datatypes ((List!16804 0))(
  ( (Nil!16801) (Cons!16800 (h!17931 (_ BitVec 64)) (t!23493 List!16804)) )
))
(declare-fun arrayNoDuplicates!0 (array!49302 (_ BitVec 32) List!16804) Bool)

(assert (=> b!858894 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16801)))

(declare-datatypes ((Unit!29285 0))(
  ( (Unit!29286) )
))
(declare-fun lt!386968 () Unit!29285)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49302 (_ BitVec 32) (_ BitVec 32)) Unit!29285)

(assert (=> b!858894 (= lt!386968 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!858895 () Bool)

(declare-fun e!478657 () Bool)

(declare-fun tp_is_empty!16559 () Bool)

(assert (=> b!858895 (= e!478657 tp_is_empty!16559)))

(declare-fun mapIsEmpty!26438 () Bool)

(declare-fun mapRes!26438 () Bool)

(assert (=> mapIsEmpty!26438 mapRes!26438))

(declare-fun b!858896 () Bool)

(declare-fun res!583532 () Bool)

(assert (=> b!858896 (=> (not res!583532) (not e!478655))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49302 (_ BitVec 32)) Bool)

(assert (=> b!858896 (= res!583532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!858897 () Bool)

(declare-fun res!583531 () Bool)

(assert (=> b!858897 (=> (not res!583531) (not e!478655))))

(assert (=> b!858897 (= res!583531 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16801))))

(declare-fun b!858898 () Bool)

(declare-fun res!583529 () Bool)

(assert (=> b!858898 (=> (not res!583529) (not e!478655))))

(assert (=> b!858898 (= res!583529 (and (= (select (arr!23682 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!858899 () Bool)

(declare-fun res!583535 () Bool)

(assert (=> b!858899 (=> (not res!583535) (not e!478655))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!858899 (= res!583535 (validKeyInArray!0 k!854))))

(declare-fun b!858900 () Bool)

(declare-fun e!478656 () Bool)

(assert (=> b!858900 (= e!478656 tp_is_empty!16559)))

(declare-fun b!858901 () Bool)

(declare-fun e!478658 () Bool)

(assert (=> b!858901 (= e!478658 (and e!478657 mapRes!26438))))

(declare-fun condMapEmpty!26438 () Bool)

(declare-fun mapDefault!26438 () ValueCell!7840)

