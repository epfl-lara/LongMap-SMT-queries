; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74920 () Bool)

(assert start!74920)

(declare-fun b_free!15439 () Bool)

(declare-fun b_next!15439 () Bool)

(assert (=> start!74920 (= b_free!15439 (not b_next!15439))))

(declare-fun tp!54019 () Bool)

(declare-fun b_and!25577 () Bool)

(assert (=> start!74920 (= tp!54019 b_and!25577)))

(declare-fun b!883508 () Bool)

(declare-fun e!491700 () Bool)

(declare-fun e!491706 () Bool)

(assert (=> b!883508 (= e!491700 (not e!491706))))

(declare-fun res!600237 () Bool)

(assert (=> b!883508 (=> res!600237 e!491706)))

(declare-datatypes ((array!51492 0))(
  ( (array!51493 (arr!24765 (Array (_ BitVec 32) (_ BitVec 64))) (size!25205 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51492)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!883508 (= res!600237 (not (validKeyInArray!0 (select (arr!24765 _keys!868) from!1053))))))

(declare-datatypes ((V!28625 0))(
  ( (V!28626 (val!8889 Int)) )
))
(declare-datatypes ((tuple2!11778 0))(
  ( (tuple2!11779 (_1!5900 (_ BitVec 64)) (_2!5900 V!28625)) )
))
(declare-datatypes ((List!17586 0))(
  ( (Nil!17583) (Cons!17582 (h!18713 tuple2!11778) (t!24827 List!17586)) )
))
(declare-datatypes ((ListLongMap!10547 0))(
  ( (ListLongMap!10548 (toList!5289 List!17586)) )
))
(declare-fun lt!399902 () ListLongMap!10547)

(declare-fun lt!399897 () ListLongMap!10547)

(assert (=> b!883508 (= lt!399902 lt!399897)))

(declare-fun lt!399895 () ListLongMap!10547)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun v!557 () V!28625)

(declare-fun +!2558 (ListLongMap!10547 tuple2!11778) ListLongMap!10547)

(assert (=> b!883508 (= lt!399897 (+!2558 lt!399895 (tuple2!11779 k!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!8402 0))(
  ( (ValueCellFull!8402 (v!11358 V!28625)) (EmptyCell!8402) )
))
(declare-datatypes ((array!51494 0))(
  ( (array!51495 (arr!24766 (Array (_ BitVec 32) ValueCell!8402)) (size!25206 (_ BitVec 32))) )
))
(declare-fun lt!399893 () array!51494)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!28625)

(declare-fun zeroValue!654 () V!28625)

(declare-fun getCurrentListMapNoExtraKeys!3248 (array!51492 array!51494 (_ BitVec 32) (_ BitVec 32) V!28625 V!28625 (_ BitVec 32) Int) ListLongMap!10547)

(assert (=> b!883508 (= lt!399902 (getCurrentListMapNoExtraKeys!3248 _keys!868 lt!399893 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun _values!688 () array!51494)

(assert (=> b!883508 (= lt!399895 (getCurrentListMapNoExtraKeys!3248 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!30142 0))(
  ( (Unit!30143) )
))
(declare-fun lt!399892 () Unit!30142)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!742 (array!51492 array!51494 (_ BitVec 32) (_ BitVec 32) V!28625 V!28625 (_ BitVec 32) (_ BitVec 64) V!28625 (_ BitVec 32) Int) Unit!30142)

(assert (=> b!883508 (= lt!399892 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!742 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!883509 () Bool)

(declare-fun e!491699 () Bool)

(declare-fun tp_is_empty!17683 () Bool)

(assert (=> b!883509 (= e!491699 tp_is_empty!17683)))

(declare-fun b!883510 () Bool)

(declare-fun res!600235 () Bool)

(declare-fun e!491704 () Bool)

(assert (=> b!883510 (=> (not res!600235) (not e!491704))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!883510 (= res!600235 (validMask!0 mask!1196))))

(declare-fun b!883511 () Bool)

(declare-fun e!491701 () Unit!30142)

(declare-fun Unit!30144 () Unit!30142)

(assert (=> b!883511 (= e!491701 Unit!30144)))

(declare-fun lt!399899 () Unit!30142)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51492 (_ BitVec 32) (_ BitVec 32)) Unit!30142)

(assert (=> b!883511 (= lt!399899 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17587 0))(
  ( (Nil!17584) (Cons!17583 (h!18714 (_ BitVec 64)) (t!24828 List!17587)) )
))
(declare-fun arrayNoDuplicates!0 (array!51492 (_ BitVec 32) List!17587) Bool)

(assert (=> b!883511 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17584)))

(declare-fun lt!399900 () Unit!30142)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51492 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30142)

(assert (=> b!883511 (= lt!399900 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!51492 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!883511 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!399894 () Unit!30142)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!51492 (_ BitVec 64) (_ BitVec 32) List!17587) Unit!30142)

(assert (=> b!883511 (= lt!399894 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!17584))))

(assert (=> b!883511 false))

(declare-fun b!883512 () Bool)

(declare-fun Unit!30145 () Unit!30142)

(assert (=> b!883512 (= e!491701 Unit!30145)))

(declare-fun b!883513 () Bool)

(declare-fun res!600240 () Bool)

(assert (=> b!883513 (=> (not res!600240) (not e!491704))))

(assert (=> b!883513 (= res!600240 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25205 _keys!868))))))

(declare-fun b!883514 () Bool)

(declare-fun res!600242 () Bool)

(assert (=> b!883514 (=> (not res!600242) (not e!491704))))

(assert (=> b!883514 (= res!600242 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17584))))

(declare-fun b!883515 () Bool)

(declare-fun e!491702 () Bool)

(declare-fun e!491703 () Bool)

(declare-fun mapRes!28161 () Bool)

(assert (=> b!883515 (= e!491702 (and e!491703 mapRes!28161))))

(declare-fun condMapEmpty!28161 () Bool)

(declare-fun mapDefault!28161 () ValueCell!8402)

