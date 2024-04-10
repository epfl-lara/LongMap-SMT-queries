; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74930 () Bool)

(assert start!74930)

(declare-fun b_free!15449 () Bool)

(declare-fun b_next!15449 () Bool)

(assert (=> start!74930 (= b_free!15449 (not b_next!15449))))

(declare-fun tp!54050 () Bool)

(declare-fun b_and!25597 () Bool)

(assert (=> start!74930 (= tp!54050 b_and!25597)))

(declare-fun mapNonEmpty!28176 () Bool)

(declare-fun mapRes!28176 () Bool)

(declare-fun tp!54049 () Bool)

(declare-fun e!491821 () Bool)

(assert (=> mapNonEmpty!28176 (= mapRes!28176 (and tp!54049 e!491821))))

(declare-datatypes ((V!28637 0))(
  ( (V!28638 (val!8894 Int)) )
))
(declare-datatypes ((ValueCell!8407 0))(
  ( (ValueCellFull!8407 (v!11363 V!28637)) (EmptyCell!8407) )
))
(declare-fun mapValue!28176 () ValueCell!8407)

(declare-fun mapKey!28176 () (_ BitVec 32))

(declare-datatypes ((array!51512 0))(
  ( (array!51513 (arr!24775 (Array (_ BitVec 32) ValueCell!8407)) (size!25215 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51512)

(declare-fun mapRest!28176 () (Array (_ BitVec 32) ValueCell!8407))

(assert (=> mapNonEmpty!28176 (= (arr!24775 _values!688) (store mapRest!28176 mapKey!28176 mapValue!28176))))

(declare-fun b!883743 () Bool)

(declare-fun e!491824 () Bool)

(declare-fun e!491823 () Bool)

(assert (=> b!883743 (= e!491824 e!491823)))

(declare-fun res!600389 () Bool)

(assert (=> b!883743 (=> (not res!600389) (not e!491823))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!883743 (= res!600389 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!400065 () array!51512)

(declare-datatypes ((tuple2!11788 0))(
  ( (tuple2!11789 (_1!5905 (_ BitVec 64)) (_2!5905 V!28637)) )
))
(declare-datatypes ((List!17596 0))(
  ( (Nil!17593) (Cons!17592 (h!18723 tuple2!11788) (t!24847 List!17596)) )
))
(declare-datatypes ((ListLongMap!10557 0))(
  ( (ListLongMap!10558 (toList!5294 List!17596)) )
))
(declare-fun lt!400063 () ListLongMap!10557)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!51514 0))(
  ( (array!51515 (arr!24776 (Array (_ BitVec 32) (_ BitVec 64))) (size!25216 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51514)

(declare-fun minValue!654 () V!28637)

(declare-fun zeroValue!654 () V!28637)

(declare-fun getCurrentListMapNoExtraKeys!3253 (array!51514 array!51512 (_ BitVec 32) (_ BitVec 32) V!28637 V!28637 (_ BitVec 32) Int) ListLongMap!10557)

(assert (=> b!883743 (= lt!400063 (getCurrentListMapNoExtraKeys!3253 _keys!868 lt!400065 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28637)

(assert (=> b!883743 (= lt!400065 (array!51513 (store (arr!24775 _values!688) i!612 (ValueCellFull!8407 v!557)) (size!25215 _values!688)))))

(declare-fun lt!400061 () ListLongMap!10557)

(assert (=> b!883743 (= lt!400061 (getCurrentListMapNoExtraKeys!3253 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!883744 () Bool)

(declare-fun e!491822 () Bool)

(assert (=> b!883744 (= e!491823 (not e!491822))))

(declare-fun res!600393 () Bool)

(assert (=> b!883744 (=> res!600393 e!491822)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!883744 (= res!600393 (not (validKeyInArray!0 (select (arr!24776 _keys!868) from!1053))))))

(declare-fun lt!400059 () ListLongMap!10557)

(declare-fun lt!400062 () ListLongMap!10557)

(assert (=> b!883744 (= lt!400059 lt!400062)))

(declare-fun lt!400057 () ListLongMap!10557)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun +!2563 (ListLongMap!10557 tuple2!11788) ListLongMap!10557)

(assert (=> b!883744 (= lt!400062 (+!2563 lt!400057 (tuple2!11789 k!854 v!557)))))

(assert (=> b!883744 (= lt!400059 (getCurrentListMapNoExtraKeys!3253 _keys!868 lt!400065 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!883744 (= lt!400057 (getCurrentListMapNoExtraKeys!3253 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!30162 0))(
  ( (Unit!30163) )
))
(declare-fun lt!400064 () Unit!30162)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!747 (array!51514 array!51512 (_ BitVec 32) (_ BitVec 32) V!28637 V!28637 (_ BitVec 32) (_ BitVec 64) V!28637 (_ BitVec 32) Int) Unit!30162)

(assert (=> b!883744 (= lt!400064 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!747 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!883745 () Bool)

(declare-fun res!600392 () Bool)

(assert (=> b!883745 (=> (not res!600392) (not e!491824))))

(assert (=> b!883745 (= res!600392 (and (= (size!25215 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25216 _keys!868) (size!25215 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!883747 () Bool)

(declare-fun res!600384 () Bool)

(assert (=> b!883747 (=> (not res!600384) (not e!491824))))

(assert (=> b!883747 (= res!600384 (validKeyInArray!0 k!854))))

(declare-fun b!883748 () Bool)

(declare-fun res!600386 () Bool)

(assert (=> b!883748 (=> (not res!600386) (not e!491824))))

(assert (=> b!883748 (= res!600386 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25216 _keys!868))))))

(declare-fun b!883749 () Bool)

(declare-fun res!600385 () Bool)

(assert (=> b!883749 (=> (not res!600385) (not e!491824))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51514 (_ BitVec 32)) Bool)

(assert (=> b!883749 (= res!600385 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!883750 () Bool)

(assert (=> b!883750 (= e!491822 (bvslt from!1053 (size!25215 _values!688)))))

(assert (=> b!883750 (not (= (select (arr!24776 _keys!868) from!1053) k!854))))

(declare-fun lt!400066 () Unit!30162)

(declare-fun e!491825 () Unit!30162)

(assert (=> b!883750 (= lt!400066 e!491825)))

(declare-fun c!93079 () Bool)

(assert (=> b!883750 (= c!93079 (= (select (arr!24776 _keys!868) from!1053) k!854))))

(declare-fun get!13056 (ValueCell!8407 V!28637) V!28637)

(declare-fun dynLambda!1275 (Int (_ BitVec 64)) V!28637)

(assert (=> b!883750 (= lt!400063 (+!2563 lt!400062 (tuple2!11789 (select (arr!24776 _keys!868) from!1053) (get!13056 (select (arr!24775 _values!688) from!1053) (dynLambda!1275 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!883751 () Bool)

(declare-fun res!600391 () Bool)

(assert (=> b!883751 (=> (not res!600391) (not e!491824))))

(declare-datatypes ((List!17597 0))(
  ( (Nil!17594) (Cons!17593 (h!18724 (_ BitVec 64)) (t!24848 List!17597)) )
))
(declare-fun arrayNoDuplicates!0 (array!51514 (_ BitVec 32) List!17597) Bool)

(assert (=> b!883751 (= res!600391 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17594))))

(declare-fun b!883752 () Bool)

(declare-fun res!600390 () Bool)

(assert (=> b!883752 (=> (not res!600390) (not e!491824))))

(assert (=> b!883752 (= res!600390 (and (= (select (arr!24776 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!883753 () Bool)

(declare-fun e!491819 () Bool)

(declare-fun e!491820 () Bool)

(assert (=> b!883753 (= e!491819 (and e!491820 mapRes!28176))))

(declare-fun condMapEmpty!28176 () Bool)

(declare-fun mapDefault!28176 () ValueCell!8407)

