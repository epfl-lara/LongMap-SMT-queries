; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72350 () Bool)

(assert start!72350)

(declare-fun b_free!13535 () Bool)

(declare-fun b_next!13535 () Bool)

(assert (=> start!72350 (= b_free!13535 (not b_next!13535))))

(declare-fun tp!47703 () Bool)

(declare-fun b_and!22621 () Bool)

(assert (=> start!72350 (= tp!47703 b_and!22621)))

(declare-fun res!570010 () Bool)

(declare-fun e!467929 () Bool)

(assert (=> start!72350 (=> (not res!570010) (not e!467929))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47092 0))(
  ( (array!47093 (arr!22577 (Array (_ BitVec 32) (_ BitVec 64))) (size!23017 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47092)

(assert (=> start!72350 (= res!570010 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23017 _keys!868))))))

(assert (=> start!72350 e!467929))

(declare-fun tp_is_empty!15401 () Bool)

(assert (=> start!72350 tp_is_empty!15401))

(assert (=> start!72350 true))

(assert (=> start!72350 tp!47703))

(declare-fun array_inv!17992 (array!47092) Bool)

(assert (=> start!72350 (array_inv!17992 _keys!868)))

(declare-datatypes ((V!25581 0))(
  ( (V!25582 (val!7748 Int)) )
))
(declare-datatypes ((ValueCell!7261 0))(
  ( (ValueCellFull!7261 (v!10173 V!25581)) (EmptyCell!7261) )
))
(declare-datatypes ((array!47094 0))(
  ( (array!47095 (arr!22578 (Array (_ BitVec 32) ValueCell!7261)) (size!23018 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47094)

(declare-fun e!467931 () Bool)

(declare-fun array_inv!17993 (array!47094) Bool)

(assert (=> start!72350 (and (array_inv!17993 _values!688) e!467931)))

(declare-fun mapIsEmpty!24701 () Bool)

(declare-fun mapRes!24701 () Bool)

(assert (=> mapIsEmpty!24701 mapRes!24701))

(declare-fun v!557 () V!25581)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun bm!36835 () Bool)

(declare-fun minValue!654 () V!25581)

(declare-fun zeroValue!654 () V!25581)

(declare-datatypes ((tuple2!10248 0))(
  ( (tuple2!10249 (_1!5135 (_ BitVec 64)) (_2!5135 V!25581)) )
))
(declare-datatypes ((List!16052 0))(
  ( (Nil!16049) (Cons!16048 (h!17179 tuple2!10248) (t!22423 List!16052)) )
))
(declare-datatypes ((ListLongMap!9017 0))(
  ( (ListLongMap!9018 (toList!4524 List!16052)) )
))
(declare-fun call!36838 () ListLongMap!9017)

(declare-fun getCurrentListMapNoExtraKeys!2516 (array!47092 array!47094 (_ BitVec 32) (_ BitVec 32) V!25581 V!25581 (_ BitVec 32) Int) ListLongMap!9017)

(assert (=> bm!36835 (= call!36838 (getCurrentListMapNoExtraKeys!2516 _keys!868 (array!47095 (store (arr!22578 _values!688) i!612 (ValueCellFull!7261 v!557)) (size!23018 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838244 () Bool)

(declare-fun res!570014 () Bool)

(assert (=> b!838244 (=> (not res!570014) (not e!467929))))

(assert (=> b!838244 (= res!570014 (and (= (size!23018 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23017 _keys!868) (size!23018 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!838245 () Bool)

(declare-fun res!570011 () Bool)

(assert (=> b!838245 (=> (not res!570011) (not e!467929))))

(assert (=> b!838245 (= res!570011 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23017 _keys!868))))))

(declare-fun b!838246 () Bool)

(declare-fun e!467927 () Bool)

(assert (=> b!838246 (= e!467927 tp_is_empty!15401)))

(declare-fun call!36839 () ListLongMap!9017)

(declare-fun bm!36836 () Bool)

(assert (=> bm!36836 (= call!36839 (getCurrentListMapNoExtraKeys!2516 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838247 () Bool)

(assert (=> b!838247 (= e!467929 (not true))))

(declare-fun e!467930 () Bool)

(assert (=> b!838247 e!467930))

(declare-fun c!91162 () Bool)

(assert (=> b!838247 (= c!91162 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28789 0))(
  ( (Unit!28790) )
))
(declare-fun lt!380668 () Unit!28789)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!240 (array!47092 array!47094 (_ BitVec 32) (_ BitVec 32) V!25581 V!25581 (_ BitVec 32) (_ BitVec 64) V!25581 (_ BitVec 32) Int) Unit!28789)

(assert (=> b!838247 (= lt!380668 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!240 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838248 () Bool)

(declare-fun +!1999 (ListLongMap!9017 tuple2!10248) ListLongMap!9017)

(assert (=> b!838248 (= e!467930 (= call!36838 (+!1999 call!36839 (tuple2!10249 k!854 v!557))))))

(declare-fun b!838249 () Bool)

(declare-fun res!570012 () Bool)

(assert (=> b!838249 (=> (not res!570012) (not e!467929))))

(declare-datatypes ((List!16053 0))(
  ( (Nil!16050) (Cons!16049 (h!17180 (_ BitVec 64)) (t!22424 List!16053)) )
))
(declare-fun arrayNoDuplicates!0 (array!47092 (_ BitVec 32) List!16053) Bool)

(assert (=> b!838249 (= res!570012 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16050))))

(declare-fun b!838250 () Bool)

(declare-fun res!570017 () Bool)

(assert (=> b!838250 (=> (not res!570017) (not e!467929))))

(assert (=> b!838250 (= res!570017 (and (= (select (arr!22577 _keys!868) i!612) k!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23017 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!838251 () Bool)

(assert (=> b!838251 (= e!467930 (= call!36838 call!36839))))

(declare-fun b!838252 () Bool)

(declare-fun res!570013 () Bool)

(assert (=> b!838252 (=> (not res!570013) (not e!467929))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!838252 (= res!570013 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!24701 () Bool)

(declare-fun tp!47704 () Bool)

(assert (=> mapNonEmpty!24701 (= mapRes!24701 (and tp!47704 e!467927))))

(declare-fun mapRest!24701 () (Array (_ BitVec 32) ValueCell!7261))

(declare-fun mapValue!24701 () ValueCell!7261)

(declare-fun mapKey!24701 () (_ BitVec 32))

(assert (=> mapNonEmpty!24701 (= (arr!22578 _values!688) (store mapRest!24701 mapKey!24701 mapValue!24701))))

(declare-fun b!838253 () Bool)

(declare-fun e!467928 () Bool)

(assert (=> b!838253 (= e!467931 (and e!467928 mapRes!24701))))

(declare-fun condMapEmpty!24701 () Bool)

(declare-fun mapDefault!24701 () ValueCell!7261)

