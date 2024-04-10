; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74890 () Bool)

(assert start!74890)

(declare-fun b_free!15409 () Bool)

(declare-fun b_next!15409 () Bool)

(assert (=> start!74890 (= b_free!15409 (not b_next!15409))))

(declare-fun tp!53929 () Bool)

(declare-fun b_and!25517 () Bool)

(assert (=> start!74890 (= tp!53929 b_and!25517)))

(declare-fun b!882780 () Bool)

(declare-fun res!599715 () Bool)

(declare-fun e!491327 () Bool)

(assert (=> b!882780 (=> (not res!599715) (not e!491327))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!882780 (= res!599715 (validKeyInArray!0 k!854))))

(declare-fun b!882781 () Bool)

(declare-fun e!491330 () Bool)

(declare-fun tp_is_empty!17653 () Bool)

(assert (=> b!882781 (= e!491330 tp_is_empty!17653)))

(declare-fun mapIsEmpty!28116 () Bool)

(declare-fun mapRes!28116 () Bool)

(assert (=> mapIsEmpty!28116 mapRes!28116))

(declare-fun b!882783 () Bool)

(declare-fun res!599719 () Bool)

(assert (=> b!882783 (=> (not res!599719) (not e!491327))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!882783 (= res!599719 (validMask!0 mask!1196))))

(declare-fun b!882784 () Bool)

(declare-fun res!599721 () Bool)

(declare-fun e!491329 () Bool)

(assert (=> b!882784 (=> res!599721 e!491329)))

(declare-datatypes ((List!17561 0))(
  ( (Nil!17558) (Cons!17557 (h!18688 (_ BitVec 64)) (t!24772 List!17561)) )
))
(declare-fun contains!4273 (List!17561 (_ BitVec 64)) Bool)

(assert (=> b!882784 (= res!599721 (contains!4273 Nil!17558 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!882785 () Bool)

(declare-fun res!599716 () Bool)

(assert (=> b!882785 (=> (not res!599716) (not e!491327))))

(declare-datatypes ((array!51434 0))(
  ( (array!51435 (arr!24736 (Array (_ BitVec 32) (_ BitVec 64))) (size!25176 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51434)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51434 (_ BitVec 32)) Bool)

(assert (=> b!882785 (= res!599716 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!882786 () Bool)

(declare-fun e!491331 () Bool)

(declare-fun e!491328 () Bool)

(assert (=> b!882786 (= e!491331 (not e!491328))))

(declare-fun res!599712 () Bool)

(assert (=> b!882786 (=> res!599712 e!491328)))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!882786 (= res!599712 (not (validKeyInArray!0 (select (arr!24736 _keys!868) from!1053))))))

(declare-datatypes ((V!28585 0))(
  ( (V!28586 (val!8874 Int)) )
))
(declare-datatypes ((tuple2!11752 0))(
  ( (tuple2!11753 (_1!5887 (_ BitVec 64)) (_2!5887 V!28585)) )
))
(declare-datatypes ((List!17562 0))(
  ( (Nil!17559) (Cons!17558 (h!18689 tuple2!11752) (t!24773 List!17562)) )
))
(declare-datatypes ((ListLongMap!10521 0))(
  ( (ListLongMap!10522 (toList!5276 List!17562)) )
))
(declare-fun lt!399430 () ListLongMap!10521)

(declare-fun lt!399428 () ListLongMap!10521)

(assert (=> b!882786 (= lt!399430 lt!399428)))

(declare-fun lt!399425 () ListLongMap!10521)

(declare-fun v!557 () V!28585)

(declare-fun +!2546 (ListLongMap!10521 tuple2!11752) ListLongMap!10521)

(assert (=> b!882786 (= lt!399428 (+!2546 lt!399425 (tuple2!11753 k!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!8387 0))(
  ( (ValueCellFull!8387 (v!11343 V!28585)) (EmptyCell!8387) )
))
(declare-datatypes ((array!51436 0))(
  ( (array!51437 (arr!24737 (Array (_ BitVec 32) ValueCell!8387)) (size!25177 (_ BitVec 32))) )
))
(declare-fun lt!399426 () array!51436)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!28585)

(declare-fun zeroValue!654 () V!28585)

(declare-fun getCurrentListMapNoExtraKeys!3237 (array!51434 array!51436 (_ BitVec 32) (_ BitVec 32) V!28585 V!28585 (_ BitVec 32) Int) ListLongMap!10521)

(assert (=> b!882786 (= lt!399430 (getCurrentListMapNoExtraKeys!3237 _keys!868 lt!399426 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun _values!688 () array!51436)

(assert (=> b!882786 (= lt!399425 (getCurrentListMapNoExtraKeys!3237 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!30108 0))(
  ( (Unit!30109) )
))
(declare-fun lt!399423 () Unit!30108)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!733 (array!51434 array!51436 (_ BitVec 32) (_ BitVec 32) V!28585 V!28585 (_ BitVec 32) (_ BitVec 64) V!28585 (_ BitVec 32) Int) Unit!30108)

(assert (=> b!882786 (= lt!399423 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!733 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!28116 () Bool)

(declare-fun tp!53930 () Bool)

(declare-fun e!491324 () Bool)

(assert (=> mapNonEmpty!28116 (= mapRes!28116 (and tp!53930 e!491324))))

(declare-fun mapValue!28116 () ValueCell!8387)

(declare-fun mapRest!28116 () (Array (_ BitVec 32) ValueCell!8387))

(declare-fun mapKey!28116 () (_ BitVec 32))

(assert (=> mapNonEmpty!28116 (= (arr!24737 _values!688) (store mapRest!28116 mapKey!28116 mapValue!28116))))

(declare-fun b!882787 () Bool)

(declare-fun res!599723 () Bool)

(assert (=> b!882787 (=> res!599723 e!491329)))

(declare-fun noDuplicate!1322 (List!17561) Bool)

(assert (=> b!882787 (= res!599723 (not (noDuplicate!1322 Nil!17558)))))

(declare-fun b!882788 () Bool)

(declare-fun e!491325 () Bool)

(assert (=> b!882788 (= e!491328 e!491325)))

(declare-fun res!599717 () Bool)

(assert (=> b!882788 (=> res!599717 e!491325)))

(assert (=> b!882788 (= res!599717 (not (= (select (arr!24736 _keys!868) from!1053) k!854)))))

(declare-fun lt!399431 () ListLongMap!10521)

(declare-fun get!13028 (ValueCell!8387 V!28585) V!28585)

(declare-fun dynLambda!1259 (Int (_ BitVec 64)) V!28585)

(assert (=> b!882788 (= lt!399431 (+!2546 lt!399428 (tuple2!11753 (select (arr!24736 _keys!868) from!1053) (get!13028 (select (arr!24737 _values!688) from!1053) (dynLambda!1259 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!882789 () Bool)

(declare-fun e!491326 () Bool)

(assert (=> b!882789 (= e!491326 (and e!491330 mapRes!28116))))

(declare-fun condMapEmpty!28116 () Bool)

(declare-fun mapDefault!28116 () ValueCell!8387)

