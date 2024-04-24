; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72652 () Bool)

(assert start!72652)

(declare-fun b_free!13669 () Bool)

(declare-fun b_next!13669 () Bool)

(assert (=> start!72652 (= b_free!13669 (not b_next!13669))))

(declare-fun tp!48107 () Bool)

(declare-fun b_and!22765 () Bool)

(assert (=> start!72652 (= tp!48107 b_and!22765)))

(declare-fun e!469719 () Bool)

(declare-datatypes ((V!25761 0))(
  ( (V!25762 (val!7815 Int)) )
))
(declare-fun v!557 () V!25761)

(declare-datatypes ((tuple2!10292 0))(
  ( (tuple2!10293 (_1!5157 (_ BitVec 64)) (_2!5157 V!25761)) )
))
(declare-datatypes ((List!16067 0))(
  ( (Nil!16064) (Cons!16063 (h!17200 tuple2!10292) (t!22430 List!16067)) )
))
(declare-datatypes ((ListLongMap!9063 0))(
  ( (ListLongMap!9064 (toList!4547 List!16067)) )
))
(declare-fun call!37286 () ListLongMap!9063)

(declare-fun call!37285 () ListLongMap!9063)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun b!841760 () Bool)

(declare-fun +!2055 (ListLongMap!9063 tuple2!10292) ListLongMap!9063)

(assert (=> b!841760 (= e!469719 (= call!37286 (+!2055 call!37285 (tuple2!10293 k0!854 v!557))))))

(declare-fun bm!37282 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47363 0))(
  ( (array!47364 (arr!22708 (Array (_ BitVec 32) (_ BitVec 64))) (size!23149 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47363)

(declare-datatypes ((ValueCell!7328 0))(
  ( (ValueCellFull!7328 (v!10240 V!25761)) (EmptyCell!7328) )
))
(declare-datatypes ((array!47365 0))(
  ( (array!47366 (arr!22709 (Array (_ BitVec 32) ValueCell!7328)) (size!23150 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47365)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25761)

(declare-fun zeroValue!654 () V!25761)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2607 (array!47363 array!47365 (_ BitVec 32) (_ BitVec 32) V!25761 V!25761 (_ BitVec 32) Int) ListLongMap!9063)

(assert (=> bm!37282 (= call!37286 (getCurrentListMapNoExtraKeys!2607 _keys!868 (array!47366 (store (arr!22709 _values!688) i!612 (ValueCellFull!7328 v!557)) (size!23150 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!571968 () Bool)

(declare-fun e!469717 () Bool)

(assert (=> start!72652 (=> (not res!571968) (not e!469717))))

(assert (=> start!72652 (= res!571968 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23149 _keys!868))))))

(assert (=> start!72652 e!469717))

(declare-fun tp_is_empty!15535 () Bool)

(assert (=> start!72652 tp_is_empty!15535))

(assert (=> start!72652 true))

(assert (=> start!72652 tp!48107))

(declare-fun array_inv!18118 (array!47363) Bool)

(assert (=> start!72652 (array_inv!18118 _keys!868)))

(declare-fun e!469720 () Bool)

(declare-fun array_inv!18119 (array!47365) Bool)

(assert (=> start!72652 (and (array_inv!18119 _values!688) e!469720)))

(declare-fun mapIsEmpty!24902 () Bool)

(declare-fun mapRes!24902 () Bool)

(assert (=> mapIsEmpty!24902 mapRes!24902))

(declare-fun b!841761 () Bool)

(declare-fun e!469716 () Bool)

(assert (=> b!841761 (= e!469716 tp_is_empty!15535)))

(declare-fun bm!37283 () Bool)

(assert (=> bm!37283 (= call!37285 (getCurrentListMapNoExtraKeys!2607 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841762 () Bool)

(declare-fun res!571964 () Bool)

(assert (=> b!841762 (=> (not res!571964) (not e!469717))))

(assert (=> b!841762 (= res!571964 (and (= (select (arr!22708 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23149 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!841763 () Bool)

(declare-fun res!571962 () Bool)

(assert (=> b!841763 (=> (not res!571962) (not e!469717))))

(declare-datatypes ((List!16068 0))(
  ( (Nil!16065) (Cons!16064 (h!17201 (_ BitVec 64)) (t!22431 List!16068)) )
))
(declare-fun arrayNoDuplicates!0 (array!47363 (_ BitVec 32) List!16068) Bool)

(assert (=> b!841763 (= res!571962 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16065))))

(declare-fun b!841764 () Bool)

(declare-fun res!571963 () Bool)

(assert (=> b!841764 (=> (not res!571963) (not e!469717))))

(assert (=> b!841764 (= res!571963 (and (= (size!23150 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23149 _keys!868) (size!23150 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!841765 () Bool)

(assert (=> b!841765 (= e!469719 (= call!37286 call!37285))))

(declare-fun b!841766 () Bool)

(declare-fun e!469718 () Bool)

(assert (=> b!841766 (= e!469720 (and e!469718 mapRes!24902))))

(declare-fun condMapEmpty!24902 () Bool)

(declare-fun mapDefault!24902 () ValueCell!7328)

(assert (=> b!841766 (= condMapEmpty!24902 (= (arr!22709 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7328)) mapDefault!24902)))))

(declare-fun b!841767 () Bool)

(assert (=> b!841767 (= e!469717 (not true))))

(assert (=> b!841767 e!469719))

(declare-fun c!91645 () Bool)

(assert (=> b!841767 (= c!91645 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28896 0))(
  ( (Unit!28897) )
))
(declare-fun lt!381230 () Unit!28896)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!284 (array!47363 array!47365 (_ BitVec 32) (_ BitVec 32) V!25761 V!25761 (_ BitVec 32) (_ BitVec 64) V!25761 (_ BitVec 32) Int) Unit!28896)

(assert (=> b!841767 (= lt!381230 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!284 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841768 () Bool)

(declare-fun res!571965 () Bool)

(assert (=> b!841768 (=> (not res!571965) (not e!469717))))

(assert (=> b!841768 (= res!571965 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23149 _keys!868))))))

(declare-fun mapNonEmpty!24902 () Bool)

(declare-fun tp!48106 () Bool)

(assert (=> mapNonEmpty!24902 (= mapRes!24902 (and tp!48106 e!469716))))

(declare-fun mapValue!24902 () ValueCell!7328)

(declare-fun mapRest!24902 () (Array (_ BitVec 32) ValueCell!7328))

(declare-fun mapKey!24902 () (_ BitVec 32))

(assert (=> mapNonEmpty!24902 (= (arr!22709 _values!688) (store mapRest!24902 mapKey!24902 mapValue!24902))))

(declare-fun b!841769 () Bool)

(declare-fun res!571967 () Bool)

(assert (=> b!841769 (=> (not res!571967) (not e!469717))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!841769 (= res!571967 (validKeyInArray!0 k0!854))))

(declare-fun b!841770 () Bool)

(assert (=> b!841770 (= e!469718 tp_is_empty!15535)))

(declare-fun b!841771 () Bool)

(declare-fun res!571966 () Bool)

(assert (=> b!841771 (=> (not res!571966) (not e!469717))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!841771 (= res!571966 (validMask!0 mask!1196))))

(declare-fun b!841772 () Bool)

(declare-fun res!571969 () Bool)

(assert (=> b!841772 (=> (not res!571969) (not e!469717))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47363 (_ BitVec 32)) Bool)

(assert (=> b!841772 (= res!571969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!72652 res!571968) b!841771))

(assert (= (and b!841771 res!571966) b!841764))

(assert (= (and b!841764 res!571963) b!841772))

(assert (= (and b!841772 res!571969) b!841763))

(assert (= (and b!841763 res!571962) b!841768))

(assert (= (and b!841768 res!571965) b!841769))

(assert (= (and b!841769 res!571967) b!841762))

(assert (= (and b!841762 res!571964) b!841767))

(assert (= (and b!841767 c!91645) b!841760))

(assert (= (and b!841767 (not c!91645)) b!841765))

(assert (= (or b!841760 b!841765) bm!37282))

(assert (= (or b!841760 b!841765) bm!37283))

(assert (= (and b!841766 condMapEmpty!24902) mapIsEmpty!24902))

(assert (= (and b!841766 (not condMapEmpty!24902)) mapNonEmpty!24902))

(get-info :version)

(assert (= (and mapNonEmpty!24902 ((_ is ValueCellFull!7328) mapValue!24902)) b!841761))

(assert (= (and b!841766 ((_ is ValueCellFull!7328) mapDefault!24902)) b!841770))

(assert (= start!72652 b!841766))

(declare-fun m!785783 () Bool)

(assert (=> b!841763 m!785783))

(declare-fun m!785785 () Bool)

(assert (=> mapNonEmpty!24902 m!785785))

(declare-fun m!785787 () Bool)

(assert (=> start!72652 m!785787))

(declare-fun m!785789 () Bool)

(assert (=> start!72652 m!785789))

(declare-fun m!785791 () Bool)

(assert (=> bm!37282 m!785791))

(declare-fun m!785793 () Bool)

(assert (=> bm!37282 m!785793))

(declare-fun m!785795 () Bool)

(assert (=> b!841762 m!785795))

(declare-fun m!785797 () Bool)

(assert (=> b!841760 m!785797))

(declare-fun m!785799 () Bool)

(assert (=> b!841767 m!785799))

(declare-fun m!785801 () Bool)

(assert (=> bm!37283 m!785801))

(declare-fun m!785803 () Bool)

(assert (=> b!841772 m!785803))

(declare-fun m!785805 () Bool)

(assert (=> b!841769 m!785805))

(declare-fun m!785807 () Bool)

(assert (=> b!841771 m!785807))

(check-sat (not b_next!13669) (not start!72652) (not b!841769) (not b!841771) b_and!22765 (not b!841760) (not b!841772) tp_is_empty!15535 (not b!841763) (not b!841767) (not bm!37283) (not bm!37282) (not mapNonEmpty!24902))
(check-sat b_and!22765 (not b_next!13669))
