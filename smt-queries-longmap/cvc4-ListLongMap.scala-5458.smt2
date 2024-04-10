; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72536 () Bool)

(assert start!72536)

(declare-fun b_free!13721 () Bool)

(declare-fun b_next!13721 () Bool)

(assert (=> start!72536 (= b_free!13721 (not b_next!13721))))

(declare-fun tp!48261 () Bool)

(declare-fun b_and!22807 () Bool)

(assert (=> start!72536 (= tp!48261 b_and!22807)))

(declare-fun b!841871 () Bool)

(declare-fun res!572249 () Bool)

(declare-fun e!469604 () Bool)

(assert (=> b!841871 (=> (not res!572249) (not e!469604))))

(declare-datatypes ((array!47448 0))(
  ( (array!47449 (arr!22755 (Array (_ BitVec 32) (_ BitVec 64))) (size!23195 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47448)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47448 (_ BitVec 32)) Bool)

(assert (=> b!841871 (= res!572249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!841872 () Bool)

(declare-fun res!572244 () Bool)

(assert (=> b!841872 (=> (not res!572244) (not e!469604))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!841872 (= res!572244 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23195 _keys!868))))))

(declare-fun b!841873 () Bool)

(declare-fun res!572242 () Bool)

(assert (=> b!841873 (=> (not res!572242) (not e!469604))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!841873 (= res!572242 (and (= (select (arr!22755 _keys!868) i!612) k!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23195 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun res!572245 () Bool)

(assert (=> start!72536 (=> (not res!572245) (not e!469604))))

(assert (=> start!72536 (= res!572245 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23195 _keys!868))))))

(assert (=> start!72536 e!469604))

(declare-fun tp_is_empty!15587 () Bool)

(assert (=> start!72536 tp_is_empty!15587))

(assert (=> start!72536 true))

(assert (=> start!72536 tp!48261))

(declare-fun array_inv!18106 (array!47448) Bool)

(assert (=> start!72536 (array_inv!18106 _keys!868)))

(declare-datatypes ((V!25829 0))(
  ( (V!25830 (val!7841 Int)) )
))
(declare-datatypes ((ValueCell!7354 0))(
  ( (ValueCellFull!7354 (v!10266 V!25829)) (EmptyCell!7354) )
))
(declare-datatypes ((array!47450 0))(
  ( (array!47451 (arr!22756 (Array (_ BitVec 32) ValueCell!7354)) (size!23196 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47450)

(declare-fun e!469605 () Bool)

(declare-fun array_inv!18107 (array!47450) Bool)

(assert (=> start!72536 (and (array_inv!18107 _values!688) e!469605)))

(declare-fun bm!37393 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!10408 0))(
  ( (tuple2!10409 (_1!5215 (_ BitVec 64)) (_2!5215 V!25829)) )
))
(declare-datatypes ((List!16187 0))(
  ( (Nil!16184) (Cons!16183 (h!17314 tuple2!10408) (t!22558 List!16187)) )
))
(declare-datatypes ((ListLongMap!9177 0))(
  ( (ListLongMap!9178 (toList!4604 List!16187)) )
))
(declare-fun call!37396 () ListLongMap!9177)

(declare-fun minValue!654 () V!25829)

(declare-fun zeroValue!654 () V!25829)

(declare-fun getCurrentListMapNoExtraKeys!2589 (array!47448 array!47450 (_ BitVec 32) (_ BitVec 32) V!25829 V!25829 (_ BitVec 32) Int) ListLongMap!9177)

(assert (=> bm!37393 (= call!37396 (getCurrentListMapNoExtraKeys!2589 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841874 () Bool)

(assert (=> b!841874 (= e!469604 (not true))))

(declare-fun e!469603 () Bool)

(assert (=> b!841874 e!469603))

(declare-fun c!91441 () Bool)

(assert (=> b!841874 (= c!91441 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!25829)

(declare-datatypes ((Unit!28913 0))(
  ( (Unit!28914) )
))
(declare-fun lt!380947 () Unit!28913)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!302 (array!47448 array!47450 (_ BitVec 32) (_ BitVec 32) V!25829 V!25829 (_ BitVec 32) (_ BitVec 64) V!25829 (_ BitVec 32) Int) Unit!28913)

(assert (=> b!841874 (= lt!380947 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!302 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841875 () Bool)

(declare-fun e!469601 () Bool)

(assert (=> b!841875 (= e!469601 tp_is_empty!15587)))

(declare-fun b!841876 () Bool)

(declare-fun res!572243 () Bool)

(assert (=> b!841876 (=> (not res!572243) (not e!469604))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!841876 (= res!572243 (validKeyInArray!0 k!854))))

(declare-fun mapIsEmpty!24980 () Bool)

(declare-fun mapRes!24980 () Bool)

(assert (=> mapIsEmpty!24980 mapRes!24980))

(declare-fun b!841877 () Bool)

(declare-fun res!572247 () Bool)

(assert (=> b!841877 (=> (not res!572247) (not e!469604))))

(declare-datatypes ((List!16188 0))(
  ( (Nil!16185) (Cons!16184 (h!17315 (_ BitVec 64)) (t!22559 List!16188)) )
))
(declare-fun arrayNoDuplicates!0 (array!47448 (_ BitVec 32) List!16188) Bool)

(assert (=> b!841877 (= res!572247 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16185))))

(declare-fun b!841878 () Bool)

(declare-fun e!469606 () Bool)

(assert (=> b!841878 (= e!469606 tp_is_empty!15587)))

(declare-fun mapNonEmpty!24980 () Bool)

(declare-fun tp!48262 () Bool)

(assert (=> mapNonEmpty!24980 (= mapRes!24980 (and tp!48262 e!469601))))

(declare-fun mapKey!24980 () (_ BitVec 32))

(declare-fun mapRest!24980 () (Array (_ BitVec 32) ValueCell!7354))

(declare-fun mapValue!24980 () ValueCell!7354)

(assert (=> mapNonEmpty!24980 (= (arr!22756 _values!688) (store mapRest!24980 mapKey!24980 mapValue!24980))))

(declare-fun b!841879 () Bool)

(assert (=> b!841879 (= e!469605 (and e!469606 mapRes!24980))))

(declare-fun condMapEmpty!24980 () Bool)

(declare-fun mapDefault!24980 () ValueCell!7354)

