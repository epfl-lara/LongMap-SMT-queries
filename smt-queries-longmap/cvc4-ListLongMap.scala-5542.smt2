; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73040 () Bool)

(assert start!73040)

(declare-fun b_free!13955 () Bool)

(declare-fun b_next!13955 () Bool)

(assert (=> start!73040 (= b_free!13955 (not b_next!13955))))

(declare-fun tp!49368 () Bool)

(declare-fun b_and!23069 () Bool)

(assert (=> start!73040 (= tp!49368 b_and!23069)))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!26501 0))(
  ( (V!26502 (val!8093 Int)) )
))
(declare-datatypes ((tuple2!10592 0))(
  ( (tuple2!10593 (_1!5307 (_ BitVec 64)) (_2!5307 V!26501)) )
))
(declare-datatypes ((List!16443 0))(
  ( (Nil!16440) (Cons!16439 (h!17570 tuple2!10592) (t!22844 List!16443)) )
))
(declare-datatypes ((ListLongMap!9361 0))(
  ( (ListLongMap!9362 (toList!4696 List!16443)) )
))
(declare-fun call!37720 () ListLongMap!9361)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48388 0))(
  ( (array!48389 (arr!23225 (Array (_ BitVec 32) (_ BitVec 64))) (size!23665 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48388)

(declare-fun bm!37717 () Bool)

(declare-datatypes ((ValueCell!7606 0))(
  ( (ValueCellFull!7606 (v!10518 V!26501)) (EmptyCell!7606) )
))
(declare-datatypes ((array!48390 0))(
  ( (array!48391 (arr!23226 (Array (_ BitVec 32) ValueCell!7606)) (size!23666 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48390)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26501)

(declare-fun zeroValue!654 () V!26501)

(declare-fun getCurrentListMapNoExtraKeys!2678 (array!48388 array!48390 (_ BitVec 32) (_ BitVec 32) V!26501 V!26501 (_ BitVec 32) Int) ListLongMap!9361)

(assert (=> bm!37717 (= call!37720 (getCurrentListMapNoExtraKeys!2678 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849097 () Bool)

(declare-fun res!576853 () Bool)

(declare-fun e!473723 () Bool)

(assert (=> b!849097 (=> (not res!576853) (not e!473723))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48388 (_ BitVec 32)) Bool)

(assert (=> b!849097 (= res!576853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!849098 () Bool)

(declare-fun res!576857 () Bool)

(assert (=> b!849098 (=> (not res!576857) (not e!473723))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!849098 (= res!576857 (validKeyInArray!0 k!854))))

(declare-fun b!849100 () Bool)

(declare-fun res!576848 () Bool)

(assert (=> b!849100 (=> (not res!576848) (not e!473723))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!849100 (= res!576848 (and (= (select (arr!23225 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!849101 () Bool)

(declare-fun res!576856 () Bool)

(assert (=> b!849101 (=> (not res!576856) (not e!473723))))

(assert (=> b!849101 (= res!576856 (and (= (size!23666 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23665 _keys!868) (size!23666 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!849102 () Bool)

(declare-fun res!576855 () Bool)

(assert (=> b!849102 (=> (not res!576855) (not e!473723))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!849102 (= res!576855 (validMask!0 mask!1196))))

(declare-fun b!849103 () Bool)

(declare-fun e!473724 () Bool)

(declare-fun e!473725 () Bool)

(declare-fun mapRes!25736 () Bool)

(assert (=> b!849103 (= e!473724 (and e!473725 mapRes!25736))))

(declare-fun condMapEmpty!25736 () Bool)

(declare-fun mapDefault!25736 () ValueCell!7606)

