; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40476 () Bool)

(assert start!40476)

(declare-fun b_free!10561 () Bool)

(declare-fun b_next!10561 () Bool)

(assert (=> start!40476 (= b_free!10561 (not b_next!10561))))

(declare-fun tp!37461 () Bool)

(declare-fun b_and!18559 () Bool)

(assert (=> start!40476 (= tp!37461 b_and!18559)))

(declare-fun b!446013 () Bool)

(declare-fun res!264747 () Bool)

(declare-fun e!262055 () Bool)

(assert (=> b!446013 (=> (not res!264747) (not e!262055))))

(declare-datatypes ((array!27560 0))(
  ( (array!27561 (arr!13227 (Array (_ BitVec 32) (_ BitVec 64))) (size!13579 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27560)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!446013 (= res!264747 (or (= (select (arr!13227 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13227 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!446014 () Bool)

(declare-fun e!262054 () Bool)

(declare-fun e!262057 () Bool)

(declare-fun mapRes!19440 () Bool)

(assert (=> b!446014 (= e!262054 (and e!262057 mapRes!19440))))

(declare-fun condMapEmpty!19440 () Bool)

(declare-datatypes ((V!16939 0))(
  ( (V!16940 (val!5982 Int)) )
))
(declare-datatypes ((ValueCell!5594 0))(
  ( (ValueCellFull!5594 (v!8234 V!16939)) (EmptyCell!5594) )
))
(declare-datatypes ((array!27562 0))(
  ( (array!27563 (arr!13228 (Array (_ BitVec 32) ValueCell!5594)) (size!13580 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27562)

(declare-fun mapDefault!19440 () ValueCell!5594)

(assert (=> b!446014 (= condMapEmpty!19440 (= (arr!13228 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5594)) mapDefault!19440)))))

(declare-fun bm!29623 () Bool)

(declare-fun lt!203726 () array!27560)

(declare-fun minValue!515 () V!16939)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16939)

(declare-fun c!55864 () Bool)

(declare-fun v!412 () V!16939)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!7764 0))(
  ( (tuple2!7765 (_1!3893 (_ BitVec 64)) (_2!3893 V!16939)) )
))
(declare-datatypes ((List!7826 0))(
  ( (Nil!7823) (Cons!7822 (h!8678 tuple2!7764) (t!13576 List!7826)) )
))
(declare-datatypes ((ListLongMap!6679 0))(
  ( (ListLongMap!6680 (toList!3355 List!7826)) )
))
(declare-fun call!29627 () ListLongMap!6679)

(declare-fun getCurrentListMapNoExtraKeys!1585 (array!27560 array!27562 (_ BitVec 32) (_ BitVec 32) V!16939 V!16939 (_ BitVec 32) Int) ListLongMap!6679)

(assert (=> bm!29623 (= call!29627 (getCurrentListMapNoExtraKeys!1585 (ite c!55864 lt!203726 _keys!709) (ite c!55864 (array!27563 (store (arr!13228 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13580 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!446015 () Bool)

(declare-fun tp_is_empty!11875 () Bool)

(assert (=> b!446015 (= e!262057 tp_is_empty!11875)))

(declare-fun e!262059 () Bool)

(declare-fun b!446016 () Bool)

(assert (=> b!446016 (= e!262059 (not (= (getCurrentListMapNoExtraKeys!1585 lt!203726 (array!27563 (store (arr!13228 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13580 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) (getCurrentListMapNoExtraKeys!1585 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))))

(declare-fun e!262058 () Bool)

(assert (=> b!446016 e!262058))

(assert (=> b!446016 (= c!55864 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((Unit!13147 0))(
  ( (Unit!13148) )
))
(declare-fun lt!203727 () Unit!13147)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!695 (array!27560 array!27562 (_ BitVec 32) (_ BitVec 32) V!16939 V!16939 (_ BitVec 32) (_ BitVec 64) V!16939 (_ BitVec 32) Int) Unit!13147)

(assert (=> b!446016 (= lt!203727 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!695 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!446017 () Bool)

(declare-fun res!264752 () Bool)

(assert (=> b!446017 (=> (not res!264752) (not e!262055))))

(assert (=> b!446017 (= res!264752 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13579 _keys!709))))))

(declare-fun mapNonEmpty!19440 () Bool)

(declare-fun tp!37460 () Bool)

(declare-fun e!262056 () Bool)

(assert (=> mapNonEmpty!19440 (= mapRes!19440 (and tp!37460 e!262056))))

(declare-fun mapRest!19440 () (Array (_ BitVec 32) ValueCell!5594))

(declare-fun mapKey!19440 () (_ BitVec 32))

(declare-fun mapValue!19440 () ValueCell!5594)

(assert (=> mapNonEmpty!19440 (= (arr!13228 _values!549) (store mapRest!19440 mapKey!19440 mapValue!19440))))

(declare-fun b!446019 () Bool)

(assert (=> b!446019 (= e!262056 tp_is_empty!11875)))

(declare-fun b!446020 () Bool)

(assert (=> b!446020 (= e!262055 e!262059)))

(declare-fun res!264748 () Bool)

(assert (=> b!446020 (=> (not res!264748) (not e!262059))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27560 (_ BitVec 32)) Bool)

(assert (=> b!446020 (= res!264748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203726 mask!1025))))

(assert (=> b!446020 (= lt!203726 (array!27561 (store (arr!13227 _keys!709) i!563 k0!794) (size!13579 _keys!709)))))

(declare-fun b!446021 () Bool)

(declare-fun res!264749 () Bool)

(assert (=> b!446021 (=> (not res!264749) (not e!262055))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!446021 (= res!264749 (validMask!0 mask!1025))))

(declare-fun b!446022 () Bool)

(declare-fun res!264746 () Bool)

(assert (=> b!446022 (=> (not res!264746) (not e!262059))))

(assert (=> b!446022 (= res!264746 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13579 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!446023 () Bool)

(declare-fun res!264751 () Bool)

(assert (=> b!446023 (=> (not res!264751) (not e!262055))))

(declare-datatypes ((List!7827 0))(
  ( (Nil!7824) (Cons!7823 (h!8679 (_ BitVec 64)) (t!13577 List!7827)) )
))
(declare-fun arrayNoDuplicates!0 (array!27560 (_ BitVec 32) List!7827) Bool)

(assert (=> b!446023 (= res!264751 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7824))))

(declare-fun b!446024 () Bool)

(declare-fun res!264744 () Bool)

(assert (=> b!446024 (=> (not res!264744) (not e!262055))))

(declare-fun arrayContainsKey!0 (array!27560 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!446024 (= res!264744 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!446025 () Bool)

(declare-fun res!264753 () Bool)

(assert (=> b!446025 (=> (not res!264753) (not e!262055))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!446025 (= res!264753 (validKeyInArray!0 k0!794))))

(declare-fun b!446026 () Bool)

(declare-fun res!264750 () Bool)

(assert (=> b!446026 (=> (not res!264750) (not e!262059))))

(assert (=> b!446026 (= res!264750 (arrayNoDuplicates!0 lt!203726 #b00000000000000000000000000000000 Nil!7824))))

(declare-fun mapIsEmpty!19440 () Bool)

(assert (=> mapIsEmpty!19440 mapRes!19440))

(declare-fun b!446027 () Bool)

(declare-fun res!264743 () Bool)

(assert (=> b!446027 (=> (not res!264743) (not e!262055))))

(assert (=> b!446027 (= res!264743 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!446028 () Bool)

(declare-fun call!29626 () ListLongMap!6679)

(declare-fun +!1533 (ListLongMap!6679 tuple2!7764) ListLongMap!6679)

(assert (=> b!446028 (= e!262058 (= call!29627 (+!1533 call!29626 (tuple2!7765 k0!794 v!412))))))

(declare-fun bm!29624 () Bool)

(assert (=> bm!29624 (= call!29626 (getCurrentListMapNoExtraKeys!1585 (ite c!55864 _keys!709 lt!203726) (ite c!55864 _values!549 (array!27563 (store (arr!13228 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13580 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!446029 () Bool)

(assert (=> b!446029 (= e!262058 (= call!29626 call!29627))))

(declare-fun res!264745 () Bool)

(assert (=> start!40476 (=> (not res!264745) (not e!262055))))

(assert (=> start!40476 (= res!264745 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13579 _keys!709))))))

(assert (=> start!40476 e!262055))

(assert (=> start!40476 tp_is_empty!11875))

(assert (=> start!40476 tp!37461))

(assert (=> start!40476 true))

(declare-fun array_inv!9670 (array!27562) Bool)

(assert (=> start!40476 (and (array_inv!9670 _values!549) e!262054)))

(declare-fun array_inv!9671 (array!27560) Bool)

(assert (=> start!40476 (array_inv!9671 _keys!709)))

(declare-fun b!446018 () Bool)

(declare-fun res!264754 () Bool)

(assert (=> b!446018 (=> (not res!264754) (not e!262055))))

(assert (=> b!446018 (= res!264754 (and (= (size!13580 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13579 _keys!709) (size!13580 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!40476 res!264745) b!446021))

(assert (= (and b!446021 res!264749) b!446018))

(assert (= (and b!446018 res!264754) b!446027))

(assert (= (and b!446027 res!264743) b!446023))

(assert (= (and b!446023 res!264751) b!446017))

(assert (= (and b!446017 res!264752) b!446025))

(assert (= (and b!446025 res!264753) b!446013))

(assert (= (and b!446013 res!264747) b!446024))

(assert (= (and b!446024 res!264744) b!446020))

(assert (= (and b!446020 res!264748) b!446026))

(assert (= (and b!446026 res!264750) b!446022))

(assert (= (and b!446022 res!264746) b!446016))

(assert (= (and b!446016 c!55864) b!446028))

(assert (= (and b!446016 (not c!55864)) b!446029))

(assert (= (or b!446028 b!446029) bm!29623))

(assert (= (or b!446028 b!446029) bm!29624))

(assert (= (and b!446014 condMapEmpty!19440) mapIsEmpty!19440))

(assert (= (and b!446014 (not condMapEmpty!19440)) mapNonEmpty!19440))

(get-info :version)

(assert (= (and mapNonEmpty!19440 ((_ is ValueCellFull!5594) mapValue!19440)) b!446019))

(assert (= (and b!446014 ((_ is ValueCellFull!5594) mapDefault!19440)) b!446015))

(assert (= start!40476 b!446014))

(declare-fun m!431559 () Bool)

(assert (=> b!446025 m!431559))

(declare-fun m!431561 () Bool)

(assert (=> b!446016 m!431561))

(declare-fun m!431563 () Bool)

(assert (=> b!446016 m!431563))

(declare-fun m!431565 () Bool)

(assert (=> b!446016 m!431565))

(declare-fun m!431567 () Bool)

(assert (=> b!446016 m!431567))

(declare-fun m!431569 () Bool)

(assert (=> b!446027 m!431569))

(declare-fun m!431571 () Bool)

(assert (=> start!40476 m!431571))

(declare-fun m!431573 () Bool)

(assert (=> start!40476 m!431573))

(declare-fun m!431575 () Bool)

(assert (=> b!446021 m!431575))

(declare-fun m!431577 () Bool)

(assert (=> b!446024 m!431577))

(declare-fun m!431579 () Bool)

(assert (=> b!446023 m!431579))

(declare-fun m!431581 () Bool)

(assert (=> b!446026 m!431581))

(assert (=> bm!29624 m!431561))

(declare-fun m!431583 () Bool)

(assert (=> bm!29624 m!431583))

(declare-fun m!431585 () Bool)

(assert (=> b!446020 m!431585))

(declare-fun m!431587 () Bool)

(assert (=> b!446020 m!431587))

(declare-fun m!431589 () Bool)

(assert (=> b!446013 m!431589))

(declare-fun m!431591 () Bool)

(assert (=> mapNonEmpty!19440 m!431591))

(declare-fun m!431593 () Bool)

(assert (=> b!446028 m!431593))

(assert (=> bm!29623 m!431561))

(declare-fun m!431595 () Bool)

(assert (=> bm!29623 m!431595))

(check-sat (not mapNonEmpty!19440) (not b_next!10561) (not bm!29623) (not b!446020) (not b!446027) tp_is_empty!11875 (not b!446023) (not b!446028) (not b!446024) (not b!446021) (not b!446026) (not start!40476) b_and!18559 (not b!446016) (not b!446025) (not bm!29624))
(check-sat b_and!18559 (not b_next!10561))
(get-model)

(declare-fun b!446156 () Bool)

(declare-fun e!262122 () ListLongMap!6679)

(assert (=> b!446156 (= e!262122 (ListLongMap!6680 Nil!7823))))

(declare-fun b!446157 () Bool)

(declare-fun lt!203759 () Unit!13147)

(declare-fun lt!203758 () Unit!13147)

(assert (=> b!446157 (= lt!203759 lt!203758)))

(declare-fun lt!203757 () ListLongMap!6679)

(declare-fun lt!203760 () V!16939)

(declare-fun lt!203755 () (_ BitVec 64))

(declare-fun lt!203756 () (_ BitVec 64))

(declare-fun contains!2469 (ListLongMap!6679 (_ BitVec 64)) Bool)

(assert (=> b!446157 (not (contains!2469 (+!1533 lt!203757 (tuple2!7765 lt!203755 lt!203760)) lt!203756))))

(declare-fun addStillNotContains!145 (ListLongMap!6679 (_ BitVec 64) V!16939 (_ BitVec 64)) Unit!13147)

(assert (=> b!446157 (= lt!203758 (addStillNotContains!145 lt!203757 lt!203755 lt!203760 lt!203756))))

(assert (=> b!446157 (= lt!203756 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!6548 (ValueCell!5594 V!16939) V!16939)

(declare-fun dynLambda!853 (Int (_ BitVec 64)) V!16939)

(assert (=> b!446157 (= lt!203760 (get!6548 (select (arr!13228 (ite c!55864 _values!549 (array!27563 (store (arr!13228 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13580 _values!549)))) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!853 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!446157 (= lt!203755 (select (arr!13227 (ite c!55864 _keys!709 lt!203726)) (bvadd #b00000000000000000000000000000001 from!863)))))

(declare-fun call!29642 () ListLongMap!6679)

(assert (=> b!446157 (= lt!203757 call!29642)))

(declare-fun e!262116 () ListLongMap!6679)

(assert (=> b!446157 (= e!262116 (+!1533 call!29642 (tuple2!7765 (select (arr!13227 (ite c!55864 _keys!709 lt!203726)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6548 (select (arr!13228 (ite c!55864 _values!549 (array!27563 (store (arr!13228 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13580 _values!549)))) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!853 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!446158 () Bool)

(declare-fun e!262119 () Bool)

(declare-fun e!262121 () Bool)

(assert (=> b!446158 (= e!262119 e!262121)))

(declare-fun c!55880 () Bool)

(declare-fun e!262118 () Bool)

(assert (=> b!446158 (= c!55880 e!262118)))

(declare-fun res!264837 () Bool)

(assert (=> b!446158 (=> (not res!264837) (not e!262118))))

(assert (=> b!446158 (= res!264837 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13579 (ite c!55864 _keys!709 lt!203726))))))

(declare-fun bm!29639 () Bool)

(assert (=> bm!29639 (= call!29642 (getCurrentListMapNoExtraKeys!1585 (ite c!55864 _keys!709 lt!203726) (ite c!55864 _values!549 (array!27563 (store (arr!13228 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13580 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!446159 () Bool)

(declare-fun res!264838 () Bool)

(assert (=> b!446159 (=> (not res!264838) (not e!262119))))

(declare-fun lt!203754 () ListLongMap!6679)

(assert (=> b!446159 (= res!264838 (not (contains!2469 lt!203754 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!446160 () Bool)

(assert (=> b!446160 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13579 (ite c!55864 _keys!709 lt!203726))))))

(assert (=> b!446160 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13580 (ite c!55864 _values!549 (array!27563 (store (arr!13228 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13580 _values!549))))))))

(declare-fun e!262117 () Bool)

(declare-fun apply!310 (ListLongMap!6679 (_ BitVec 64)) V!16939)

(assert (=> b!446160 (= e!262117 (= (apply!310 lt!203754 (select (arr!13227 (ite c!55864 _keys!709 lt!203726)) (bvadd #b00000000000000000000000000000001 from!863))) (get!6548 (select (arr!13228 (ite c!55864 _values!549 (array!27563 (store (arr!13228 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13580 _values!549)))) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!853 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!446161 () Bool)

(assert (=> b!446161 (= e!262122 e!262116)))

(declare-fun c!55879 () Bool)

(assert (=> b!446161 (= c!55879 (validKeyInArray!0 (select (arr!13227 (ite c!55864 _keys!709 lt!203726)) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!446162 () Bool)

(assert (=> b!446162 (= e!262121 e!262117)))

(assert (=> b!446162 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13579 (ite c!55864 _keys!709 lt!203726))))))

(declare-fun res!264836 () Bool)

(assert (=> b!446162 (= res!264836 (contains!2469 lt!203754 (select (arr!13227 (ite c!55864 _keys!709 lt!203726)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!446162 (=> (not res!264836) (not e!262117))))

(declare-fun b!446163 () Bool)

(assert (=> b!446163 (= e!262118 (validKeyInArray!0 (select (arr!13227 (ite c!55864 _keys!709 lt!203726)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!446163 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!446164 () Bool)

(declare-fun e!262120 () Bool)

(assert (=> b!446164 (= e!262121 e!262120)))

(declare-fun c!55881 () Bool)

(assert (=> b!446164 (= c!55881 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13579 (ite c!55864 _keys!709 lt!203726))))))

(declare-fun d!74173 () Bool)

(assert (=> d!74173 e!262119))

(declare-fun res!264835 () Bool)

(assert (=> d!74173 (=> (not res!264835) (not e!262119))))

(assert (=> d!74173 (= res!264835 (not (contains!2469 lt!203754 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74173 (= lt!203754 e!262122)))

(declare-fun c!55882 () Bool)

(assert (=> d!74173 (= c!55882 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!13579 (ite c!55864 _keys!709 lt!203726))))))

(assert (=> d!74173 (validMask!0 mask!1025)))

(assert (=> d!74173 (= (getCurrentListMapNoExtraKeys!1585 (ite c!55864 _keys!709 lt!203726) (ite c!55864 _values!549 (array!27563 (store (arr!13228 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13580 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!203754)))

(declare-fun b!446165 () Bool)

(assert (=> b!446165 (= e!262116 call!29642)))

(declare-fun b!446166 () Bool)

(assert (=> b!446166 (= e!262120 (= lt!203754 (getCurrentListMapNoExtraKeys!1585 (ite c!55864 _keys!709 lt!203726) (ite c!55864 _values!549 (array!27563 (store (arr!13228 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13580 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!446167 () Bool)

(declare-fun isEmpty!562 (ListLongMap!6679) Bool)

(assert (=> b!446167 (= e!262120 (isEmpty!562 lt!203754))))

(assert (= (and d!74173 c!55882) b!446156))

(assert (= (and d!74173 (not c!55882)) b!446161))

(assert (= (and b!446161 c!55879) b!446157))

(assert (= (and b!446161 (not c!55879)) b!446165))

(assert (= (or b!446157 b!446165) bm!29639))

(assert (= (and d!74173 res!264835) b!446159))

(assert (= (and b!446159 res!264838) b!446158))

(assert (= (and b!446158 res!264837) b!446163))

(assert (= (and b!446158 c!55880) b!446162))

(assert (= (and b!446158 (not c!55880)) b!446164))

(assert (= (and b!446162 res!264836) b!446160))

(assert (= (and b!446164 c!55881) b!446166))

(assert (= (and b!446164 (not c!55881)) b!446167))

(declare-fun b_lambda!9451 () Bool)

(assert (=> (not b_lambda!9451) (not b!446157)))

(declare-fun t!13583 () Bool)

(declare-fun tb!3709 () Bool)

(assert (=> (and start!40476 (= defaultEntry!557 defaultEntry!557) t!13583) tb!3709))

(declare-fun result!6957 () Bool)

(assert (=> tb!3709 (= result!6957 tp_is_empty!11875)))

(assert (=> b!446157 t!13583))

(declare-fun b_and!18565 () Bool)

(assert (= b_and!18559 (and (=> t!13583 result!6957) b_and!18565)))

(declare-fun b_lambda!9453 () Bool)

(assert (=> (not b_lambda!9453) (not b!446160)))

(assert (=> b!446160 t!13583))

(declare-fun b_and!18567 () Bool)

(assert (= b_and!18565 (and (=> t!13583 result!6957) b_and!18567)))

(declare-fun m!431673 () Bool)

(assert (=> b!446167 m!431673))

(declare-fun m!431675 () Bool)

(assert (=> b!446161 m!431675))

(assert (=> b!446161 m!431675))

(declare-fun m!431677 () Bool)

(assert (=> b!446161 m!431677))

(assert (=> b!446163 m!431675))

(assert (=> b!446163 m!431675))

(assert (=> b!446163 m!431677))

(declare-fun m!431679 () Bool)

(assert (=> b!446160 m!431679))

(declare-fun m!431681 () Bool)

(assert (=> b!446160 m!431681))

(assert (=> b!446160 m!431679))

(assert (=> b!446160 m!431681))

(declare-fun m!431683 () Bool)

(assert (=> b!446160 m!431683))

(assert (=> b!446160 m!431675))

(assert (=> b!446160 m!431675))

(declare-fun m!431685 () Bool)

(assert (=> b!446160 m!431685))

(declare-fun m!431687 () Bool)

(assert (=> b!446166 m!431687))

(assert (=> b!446157 m!431679))

(assert (=> b!446157 m!431681))

(declare-fun m!431689 () Bool)

(assert (=> b!446157 m!431689))

(declare-fun m!431691 () Bool)

(assert (=> b!446157 m!431691))

(assert (=> b!446157 m!431675))

(assert (=> b!446157 m!431679))

(assert (=> b!446157 m!431681))

(assert (=> b!446157 m!431683))

(assert (=> b!446157 m!431689))

(declare-fun m!431693 () Bool)

(assert (=> b!446157 m!431693))

(declare-fun m!431695 () Bool)

(assert (=> b!446157 m!431695))

(assert (=> bm!29639 m!431687))

(declare-fun m!431697 () Bool)

(assert (=> b!446159 m!431697))

(declare-fun m!431699 () Bool)

(assert (=> d!74173 m!431699))

(assert (=> d!74173 m!431575))

(assert (=> b!446162 m!431675))

(assert (=> b!446162 m!431675))

(declare-fun m!431701 () Bool)

(assert (=> b!446162 m!431701))

(assert (=> bm!29624 d!74173))

(declare-fun d!74175 () Bool)

(assert (=> d!74175 (= (array_inv!9670 _values!549) (bvsge (size!13580 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!40476 d!74175))

(declare-fun d!74177 () Bool)

(assert (=> d!74177 (= (array_inv!9671 _keys!709) (bvsge (size!13579 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!40476 d!74177))

(declare-fun bm!29642 () Bool)

(declare-fun call!29645 () Bool)

(assert (=> bm!29642 (= call!29645 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!203726 mask!1025))))

(declare-fun b!446178 () Bool)

(declare-fun e!262130 () Bool)

(assert (=> b!446178 (= e!262130 call!29645)))

(declare-fun b!446179 () Bool)

(declare-fun e!262131 () Bool)

(assert (=> b!446179 (= e!262131 call!29645)))

(declare-fun b!446180 () Bool)

(declare-fun e!262129 () Bool)

(assert (=> b!446180 (= e!262129 e!262131)))

(declare-fun c!55885 () Bool)

(assert (=> b!446180 (= c!55885 (validKeyInArray!0 (select (arr!13227 lt!203726) #b00000000000000000000000000000000)))))

(declare-fun d!74179 () Bool)

(declare-fun res!264844 () Bool)

(assert (=> d!74179 (=> res!264844 e!262129)))

(assert (=> d!74179 (= res!264844 (bvsge #b00000000000000000000000000000000 (size!13579 lt!203726)))))

(assert (=> d!74179 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203726 mask!1025) e!262129)))

(declare-fun b!446181 () Bool)

(assert (=> b!446181 (= e!262131 e!262130)))

(declare-fun lt!203768 () (_ BitVec 64))

(assert (=> b!446181 (= lt!203768 (select (arr!13227 lt!203726) #b00000000000000000000000000000000))))

(declare-fun lt!203767 () Unit!13147)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!27560 (_ BitVec 64) (_ BitVec 32)) Unit!13147)

(assert (=> b!446181 (= lt!203767 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!203726 lt!203768 #b00000000000000000000000000000000))))

(assert (=> b!446181 (arrayContainsKey!0 lt!203726 lt!203768 #b00000000000000000000000000000000)))

(declare-fun lt!203769 () Unit!13147)

(assert (=> b!446181 (= lt!203769 lt!203767)))

(declare-fun res!264843 () Bool)

(declare-datatypes ((SeekEntryResult!3478 0))(
  ( (MissingZero!3478 (index!16091 (_ BitVec 32))) (Found!3478 (index!16092 (_ BitVec 32))) (Intermediate!3478 (undefined!4290 Bool) (index!16093 (_ BitVec 32)) (x!41953 (_ BitVec 32))) (Undefined!3478) (MissingVacant!3478 (index!16094 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!27560 (_ BitVec 32)) SeekEntryResult!3478)

(assert (=> b!446181 (= res!264843 (= (seekEntryOrOpen!0 (select (arr!13227 lt!203726) #b00000000000000000000000000000000) lt!203726 mask!1025) (Found!3478 #b00000000000000000000000000000000)))))

(assert (=> b!446181 (=> (not res!264843) (not e!262130))))

(assert (= (and d!74179 (not res!264844)) b!446180))

(assert (= (and b!446180 c!55885) b!446181))

(assert (= (and b!446180 (not c!55885)) b!446179))

(assert (= (and b!446181 res!264843) b!446178))

(assert (= (or b!446178 b!446179) bm!29642))

(declare-fun m!431703 () Bool)

(assert (=> bm!29642 m!431703))

(declare-fun m!431705 () Bool)

(assert (=> b!446180 m!431705))

(assert (=> b!446180 m!431705))

(declare-fun m!431707 () Bool)

(assert (=> b!446180 m!431707))

(assert (=> b!446181 m!431705))

(declare-fun m!431709 () Bool)

(assert (=> b!446181 m!431709))

(declare-fun m!431711 () Bool)

(assert (=> b!446181 m!431711))

(assert (=> b!446181 m!431705))

(declare-fun m!431713 () Bool)

(assert (=> b!446181 m!431713))

(assert (=> b!446020 d!74179))

(declare-fun d!74181 () Bool)

(assert (=> d!74181 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!446021 d!74181))

(declare-fun d!74183 () Bool)

(declare-fun res!264852 () Bool)

(declare-fun e!262143 () Bool)

(assert (=> d!74183 (=> res!264852 e!262143)))

(assert (=> d!74183 (= res!264852 (bvsge #b00000000000000000000000000000000 (size!13579 _keys!709)))))

(assert (=> d!74183 (= (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7824) e!262143)))

(declare-fun b!446192 () Bool)

(declare-fun e!262142 () Bool)

(declare-fun e!262141 () Bool)

(assert (=> b!446192 (= e!262142 e!262141)))

(declare-fun c!55888 () Bool)

(assert (=> b!446192 (= c!55888 (validKeyInArray!0 (select (arr!13227 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!446193 () Bool)

(declare-fun call!29648 () Bool)

(assert (=> b!446193 (= e!262141 call!29648)))

(declare-fun bm!29645 () Bool)

(assert (=> bm!29645 (= call!29648 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!55888 (Cons!7823 (select (arr!13227 _keys!709) #b00000000000000000000000000000000) Nil!7824) Nil!7824)))))

(declare-fun b!446194 () Bool)

(declare-fun e!262140 () Bool)

(declare-fun contains!2470 (List!7827 (_ BitVec 64)) Bool)

(assert (=> b!446194 (= e!262140 (contains!2470 Nil!7824 (select (arr!13227 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!446195 () Bool)

(assert (=> b!446195 (= e!262143 e!262142)))

(declare-fun res!264851 () Bool)

(assert (=> b!446195 (=> (not res!264851) (not e!262142))))

(assert (=> b!446195 (= res!264851 (not e!262140))))

(declare-fun res!264853 () Bool)

(assert (=> b!446195 (=> (not res!264853) (not e!262140))))

(assert (=> b!446195 (= res!264853 (validKeyInArray!0 (select (arr!13227 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!446196 () Bool)

(assert (=> b!446196 (= e!262141 call!29648)))

(assert (= (and d!74183 (not res!264852)) b!446195))

(assert (= (and b!446195 res!264853) b!446194))

(assert (= (and b!446195 res!264851) b!446192))

(assert (= (and b!446192 c!55888) b!446193))

(assert (= (and b!446192 (not c!55888)) b!446196))

(assert (= (or b!446193 b!446196) bm!29645))

(declare-fun m!431715 () Bool)

(assert (=> b!446192 m!431715))

(assert (=> b!446192 m!431715))

(declare-fun m!431717 () Bool)

(assert (=> b!446192 m!431717))

(assert (=> bm!29645 m!431715))

(declare-fun m!431719 () Bool)

(assert (=> bm!29645 m!431719))

(assert (=> b!446194 m!431715))

(assert (=> b!446194 m!431715))

(declare-fun m!431721 () Bool)

(assert (=> b!446194 m!431721))

(assert (=> b!446195 m!431715))

(assert (=> b!446195 m!431715))

(assert (=> b!446195 m!431717))

(assert (=> b!446023 d!74183))

(declare-fun b!446197 () Bool)

(declare-fun e!262150 () ListLongMap!6679)

(assert (=> b!446197 (= e!262150 (ListLongMap!6680 Nil!7823))))

(declare-fun b!446198 () Bool)

(declare-fun lt!203775 () Unit!13147)

(declare-fun lt!203774 () Unit!13147)

(assert (=> b!446198 (= lt!203775 lt!203774)))

(declare-fun lt!203773 () ListLongMap!6679)

(declare-fun lt!203772 () (_ BitVec 64))

(declare-fun lt!203771 () (_ BitVec 64))

(declare-fun lt!203776 () V!16939)

(assert (=> b!446198 (not (contains!2469 (+!1533 lt!203773 (tuple2!7765 lt!203771 lt!203776)) lt!203772))))

(assert (=> b!446198 (= lt!203774 (addStillNotContains!145 lt!203773 lt!203771 lt!203776 lt!203772))))

(assert (=> b!446198 (= lt!203772 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!446198 (= lt!203776 (get!6548 (select (arr!13228 (ite c!55864 (array!27563 (store (arr!13228 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13580 _values!549)) _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!853 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!446198 (= lt!203771 (select (arr!13227 (ite c!55864 lt!203726 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)))))

(declare-fun call!29649 () ListLongMap!6679)

(assert (=> b!446198 (= lt!203773 call!29649)))

(declare-fun e!262144 () ListLongMap!6679)

(assert (=> b!446198 (= e!262144 (+!1533 call!29649 (tuple2!7765 (select (arr!13227 (ite c!55864 lt!203726 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6548 (select (arr!13228 (ite c!55864 (array!27563 (store (arr!13228 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13580 _values!549)) _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!853 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!446199 () Bool)

(declare-fun e!262147 () Bool)

(declare-fun e!262149 () Bool)

(assert (=> b!446199 (= e!262147 e!262149)))

(declare-fun c!55890 () Bool)

(declare-fun e!262146 () Bool)

(assert (=> b!446199 (= c!55890 e!262146)))

(declare-fun res!264856 () Bool)

(assert (=> b!446199 (=> (not res!264856) (not e!262146))))

(assert (=> b!446199 (= res!264856 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13579 (ite c!55864 lt!203726 _keys!709))))))

(declare-fun bm!29646 () Bool)

(assert (=> bm!29646 (= call!29649 (getCurrentListMapNoExtraKeys!1585 (ite c!55864 lt!203726 _keys!709) (ite c!55864 (array!27563 (store (arr!13228 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13580 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!446200 () Bool)

(declare-fun res!264857 () Bool)

(assert (=> b!446200 (=> (not res!264857) (not e!262147))))

(declare-fun lt!203770 () ListLongMap!6679)

(assert (=> b!446200 (= res!264857 (not (contains!2469 lt!203770 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!446201 () Bool)

(assert (=> b!446201 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13579 (ite c!55864 lt!203726 _keys!709))))))

(assert (=> b!446201 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13580 (ite c!55864 (array!27563 (store (arr!13228 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13580 _values!549)) _values!549))))))

(declare-fun e!262145 () Bool)

(assert (=> b!446201 (= e!262145 (= (apply!310 lt!203770 (select (arr!13227 (ite c!55864 lt!203726 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))) (get!6548 (select (arr!13228 (ite c!55864 (array!27563 (store (arr!13228 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13580 _values!549)) _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!853 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!446202 () Bool)

(assert (=> b!446202 (= e!262150 e!262144)))

(declare-fun c!55889 () Bool)

(assert (=> b!446202 (= c!55889 (validKeyInArray!0 (select (arr!13227 (ite c!55864 lt!203726 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!446203 () Bool)

(assert (=> b!446203 (= e!262149 e!262145)))

(assert (=> b!446203 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13579 (ite c!55864 lt!203726 _keys!709))))))

(declare-fun res!264855 () Bool)

(assert (=> b!446203 (= res!264855 (contains!2469 lt!203770 (select (arr!13227 (ite c!55864 lt!203726 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!446203 (=> (not res!264855) (not e!262145))))

(declare-fun b!446204 () Bool)

(assert (=> b!446204 (= e!262146 (validKeyInArray!0 (select (arr!13227 (ite c!55864 lt!203726 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!446204 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!446205 () Bool)

(declare-fun e!262148 () Bool)

(assert (=> b!446205 (= e!262149 e!262148)))

(declare-fun c!55891 () Bool)

(assert (=> b!446205 (= c!55891 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13579 (ite c!55864 lt!203726 _keys!709))))))

(declare-fun d!74185 () Bool)

(assert (=> d!74185 e!262147))

(declare-fun res!264854 () Bool)

(assert (=> d!74185 (=> (not res!264854) (not e!262147))))

(assert (=> d!74185 (= res!264854 (not (contains!2469 lt!203770 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74185 (= lt!203770 e!262150)))

(declare-fun c!55892 () Bool)

(assert (=> d!74185 (= c!55892 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!13579 (ite c!55864 lt!203726 _keys!709))))))

(assert (=> d!74185 (validMask!0 mask!1025)))

(assert (=> d!74185 (= (getCurrentListMapNoExtraKeys!1585 (ite c!55864 lt!203726 _keys!709) (ite c!55864 (array!27563 (store (arr!13228 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13580 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!203770)))

(declare-fun b!446206 () Bool)

(assert (=> b!446206 (= e!262144 call!29649)))

(declare-fun b!446207 () Bool)

(assert (=> b!446207 (= e!262148 (= lt!203770 (getCurrentListMapNoExtraKeys!1585 (ite c!55864 lt!203726 _keys!709) (ite c!55864 (array!27563 (store (arr!13228 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13580 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!446208 () Bool)

(assert (=> b!446208 (= e!262148 (isEmpty!562 lt!203770))))

(assert (= (and d!74185 c!55892) b!446197))

(assert (= (and d!74185 (not c!55892)) b!446202))

(assert (= (and b!446202 c!55889) b!446198))

(assert (= (and b!446202 (not c!55889)) b!446206))

(assert (= (or b!446198 b!446206) bm!29646))

(assert (= (and d!74185 res!264854) b!446200))

(assert (= (and b!446200 res!264857) b!446199))

(assert (= (and b!446199 res!264856) b!446204))

(assert (= (and b!446199 c!55890) b!446203))

(assert (= (and b!446199 (not c!55890)) b!446205))

(assert (= (and b!446203 res!264855) b!446201))

(assert (= (and b!446205 c!55891) b!446207))

(assert (= (and b!446205 (not c!55891)) b!446208))

(declare-fun b_lambda!9455 () Bool)

(assert (=> (not b_lambda!9455) (not b!446198)))

(assert (=> b!446198 t!13583))

(declare-fun b_and!18569 () Bool)

(assert (= b_and!18567 (and (=> t!13583 result!6957) b_and!18569)))

(declare-fun b_lambda!9457 () Bool)

(assert (=> (not b_lambda!9457) (not b!446201)))

(assert (=> b!446201 t!13583))

(declare-fun b_and!18571 () Bool)

(assert (= b_and!18569 (and (=> t!13583 result!6957) b_and!18571)))

(declare-fun m!431723 () Bool)

(assert (=> b!446208 m!431723))

(declare-fun m!431725 () Bool)

(assert (=> b!446202 m!431725))

(assert (=> b!446202 m!431725))

(declare-fun m!431727 () Bool)

(assert (=> b!446202 m!431727))

(assert (=> b!446204 m!431725))

(assert (=> b!446204 m!431725))

(assert (=> b!446204 m!431727))

(declare-fun m!431729 () Bool)

(assert (=> b!446201 m!431729))

(assert (=> b!446201 m!431681))

(assert (=> b!446201 m!431729))

(assert (=> b!446201 m!431681))

(declare-fun m!431731 () Bool)

(assert (=> b!446201 m!431731))

(assert (=> b!446201 m!431725))

(assert (=> b!446201 m!431725))

(declare-fun m!431733 () Bool)

(assert (=> b!446201 m!431733))

(declare-fun m!431735 () Bool)

(assert (=> b!446207 m!431735))

(assert (=> b!446198 m!431729))

(assert (=> b!446198 m!431681))

(declare-fun m!431737 () Bool)

(assert (=> b!446198 m!431737))

(declare-fun m!431739 () Bool)

(assert (=> b!446198 m!431739))

(assert (=> b!446198 m!431725))

(assert (=> b!446198 m!431729))

(assert (=> b!446198 m!431681))

(assert (=> b!446198 m!431731))

(assert (=> b!446198 m!431737))

(declare-fun m!431741 () Bool)

(assert (=> b!446198 m!431741))

(declare-fun m!431743 () Bool)

(assert (=> b!446198 m!431743))

(assert (=> bm!29646 m!431735))

(declare-fun m!431745 () Bool)

(assert (=> b!446200 m!431745))

(declare-fun m!431747 () Bool)

(assert (=> d!74185 m!431747))

(assert (=> d!74185 m!431575))

(assert (=> b!446203 m!431725))

(assert (=> b!446203 m!431725))

(declare-fun m!431749 () Bool)

(assert (=> b!446203 m!431749))

(assert (=> bm!29623 d!74185))

(declare-fun d!74187 () Bool)

(declare-fun res!264862 () Bool)

(declare-fun e!262155 () Bool)

(assert (=> d!74187 (=> res!264862 e!262155)))

(assert (=> d!74187 (= res!264862 (= (select (arr!13227 _keys!709) #b00000000000000000000000000000000) k0!794))))

(assert (=> d!74187 (= (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000) e!262155)))

(declare-fun b!446213 () Bool)

(declare-fun e!262156 () Bool)

(assert (=> b!446213 (= e!262155 e!262156)))

(declare-fun res!264863 () Bool)

(assert (=> b!446213 (=> (not res!264863) (not e!262156))))

(assert (=> b!446213 (= res!264863 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!13579 _keys!709)))))

(declare-fun b!446214 () Bool)

(assert (=> b!446214 (= e!262156 (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!74187 (not res!264862)) b!446213))

(assert (= (and b!446213 res!264863) b!446214))

(assert (=> d!74187 m!431715))

(declare-fun m!431751 () Bool)

(assert (=> b!446214 m!431751))

(assert (=> b!446024 d!74187))

(declare-fun d!74189 () Bool)

(assert (=> d!74189 (= (validKeyInArray!0 k0!794) (and (not (= k0!794 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!794 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!446025 d!74189))

(declare-fun b!446215 () Bool)

(declare-fun e!262163 () ListLongMap!6679)

(assert (=> b!446215 (= e!262163 (ListLongMap!6680 Nil!7823))))

(declare-fun b!446216 () Bool)

(declare-fun lt!203782 () Unit!13147)

(declare-fun lt!203781 () Unit!13147)

(assert (=> b!446216 (= lt!203782 lt!203781)))

(declare-fun lt!203780 () ListLongMap!6679)

(declare-fun lt!203779 () (_ BitVec 64))

(declare-fun lt!203778 () (_ BitVec 64))

(declare-fun lt!203783 () V!16939)

(assert (=> b!446216 (not (contains!2469 (+!1533 lt!203780 (tuple2!7765 lt!203778 lt!203783)) lt!203779))))

(assert (=> b!446216 (= lt!203781 (addStillNotContains!145 lt!203780 lt!203778 lt!203783 lt!203779))))

(assert (=> b!446216 (= lt!203779 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!446216 (= lt!203783 (get!6548 (select (arr!13228 (array!27563 (store (arr!13228 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13580 _values!549))) from!863) (dynLambda!853 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!446216 (= lt!203778 (select (arr!13227 lt!203726) from!863))))

(declare-fun call!29650 () ListLongMap!6679)

(assert (=> b!446216 (= lt!203780 call!29650)))

(declare-fun e!262157 () ListLongMap!6679)

(assert (=> b!446216 (= e!262157 (+!1533 call!29650 (tuple2!7765 (select (arr!13227 lt!203726) from!863) (get!6548 (select (arr!13228 (array!27563 (store (arr!13228 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13580 _values!549))) from!863) (dynLambda!853 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!446217 () Bool)

(declare-fun e!262160 () Bool)

(declare-fun e!262162 () Bool)

(assert (=> b!446217 (= e!262160 e!262162)))

(declare-fun c!55894 () Bool)

(declare-fun e!262159 () Bool)

(assert (=> b!446217 (= c!55894 e!262159)))

(declare-fun res!264866 () Bool)

(assert (=> b!446217 (=> (not res!264866) (not e!262159))))

(assert (=> b!446217 (= res!264866 (bvslt from!863 (size!13579 lt!203726)))))

(declare-fun bm!29647 () Bool)

(assert (=> bm!29647 (= call!29650 (getCurrentListMapNoExtraKeys!1585 lt!203726 (array!27563 (store (arr!13228 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13580 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!446218 () Bool)

(declare-fun res!264867 () Bool)

(assert (=> b!446218 (=> (not res!264867) (not e!262160))))

(declare-fun lt!203777 () ListLongMap!6679)

(assert (=> b!446218 (= res!264867 (not (contains!2469 lt!203777 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!446219 () Bool)

(assert (=> b!446219 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13579 lt!203726)))))

(assert (=> b!446219 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13580 (array!27563 (store (arr!13228 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13580 _values!549)))))))

(declare-fun e!262158 () Bool)

(assert (=> b!446219 (= e!262158 (= (apply!310 lt!203777 (select (arr!13227 lt!203726) from!863)) (get!6548 (select (arr!13228 (array!27563 (store (arr!13228 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13580 _values!549))) from!863) (dynLambda!853 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!446220 () Bool)

(assert (=> b!446220 (= e!262163 e!262157)))

(declare-fun c!55893 () Bool)

(assert (=> b!446220 (= c!55893 (validKeyInArray!0 (select (arr!13227 lt!203726) from!863)))))

(declare-fun b!446221 () Bool)

(assert (=> b!446221 (= e!262162 e!262158)))

(assert (=> b!446221 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13579 lt!203726)))))

(declare-fun res!264865 () Bool)

(assert (=> b!446221 (= res!264865 (contains!2469 lt!203777 (select (arr!13227 lt!203726) from!863)))))

(assert (=> b!446221 (=> (not res!264865) (not e!262158))))

(declare-fun b!446222 () Bool)

(assert (=> b!446222 (= e!262159 (validKeyInArray!0 (select (arr!13227 lt!203726) from!863)))))

(assert (=> b!446222 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!446223 () Bool)

(declare-fun e!262161 () Bool)

(assert (=> b!446223 (= e!262162 e!262161)))

(declare-fun c!55895 () Bool)

(assert (=> b!446223 (= c!55895 (bvslt from!863 (size!13579 lt!203726)))))

(declare-fun d!74191 () Bool)

(assert (=> d!74191 e!262160))

(declare-fun res!264864 () Bool)

(assert (=> d!74191 (=> (not res!264864) (not e!262160))))

(assert (=> d!74191 (= res!264864 (not (contains!2469 lt!203777 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74191 (= lt!203777 e!262163)))

(declare-fun c!55896 () Bool)

(assert (=> d!74191 (= c!55896 (bvsge from!863 (size!13579 lt!203726)))))

(assert (=> d!74191 (validMask!0 mask!1025)))

(assert (=> d!74191 (= (getCurrentListMapNoExtraKeys!1585 lt!203726 (array!27563 (store (arr!13228 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13580 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!203777)))

(declare-fun b!446224 () Bool)

(assert (=> b!446224 (= e!262157 call!29650)))

(declare-fun b!446225 () Bool)

(assert (=> b!446225 (= e!262161 (= lt!203777 (getCurrentListMapNoExtraKeys!1585 lt!203726 (array!27563 (store (arr!13228 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13580 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!446226 () Bool)

(assert (=> b!446226 (= e!262161 (isEmpty!562 lt!203777))))

(assert (= (and d!74191 c!55896) b!446215))

(assert (= (and d!74191 (not c!55896)) b!446220))

(assert (= (and b!446220 c!55893) b!446216))

(assert (= (and b!446220 (not c!55893)) b!446224))

(assert (= (or b!446216 b!446224) bm!29647))

(assert (= (and d!74191 res!264864) b!446218))

(assert (= (and b!446218 res!264867) b!446217))

(assert (= (and b!446217 res!264866) b!446222))

(assert (= (and b!446217 c!55894) b!446221))

(assert (= (and b!446217 (not c!55894)) b!446223))

(assert (= (and b!446221 res!264865) b!446219))

(assert (= (and b!446223 c!55895) b!446225))

(assert (= (and b!446223 (not c!55895)) b!446226))

(declare-fun b_lambda!9459 () Bool)

(assert (=> (not b_lambda!9459) (not b!446216)))

(assert (=> b!446216 t!13583))

(declare-fun b_and!18573 () Bool)

(assert (= b_and!18571 (and (=> t!13583 result!6957) b_and!18573)))

(declare-fun b_lambda!9461 () Bool)

(assert (=> (not b_lambda!9461) (not b!446219)))

(assert (=> b!446219 t!13583))

(declare-fun b_and!18575 () Bool)

(assert (= b_and!18573 (and (=> t!13583 result!6957) b_and!18575)))

(declare-fun m!431753 () Bool)

(assert (=> b!446226 m!431753))

(declare-fun m!431755 () Bool)

(assert (=> b!446220 m!431755))

(assert (=> b!446220 m!431755))

(declare-fun m!431757 () Bool)

(assert (=> b!446220 m!431757))

(assert (=> b!446222 m!431755))

(assert (=> b!446222 m!431755))

(assert (=> b!446222 m!431757))

(declare-fun m!431759 () Bool)

(assert (=> b!446219 m!431759))

(assert (=> b!446219 m!431681))

(assert (=> b!446219 m!431759))

(assert (=> b!446219 m!431681))

(declare-fun m!431761 () Bool)

(assert (=> b!446219 m!431761))

(assert (=> b!446219 m!431755))

(assert (=> b!446219 m!431755))

(declare-fun m!431763 () Bool)

(assert (=> b!446219 m!431763))

(declare-fun m!431765 () Bool)

(assert (=> b!446225 m!431765))

(assert (=> b!446216 m!431759))

(assert (=> b!446216 m!431681))

(declare-fun m!431767 () Bool)

(assert (=> b!446216 m!431767))

(declare-fun m!431769 () Bool)

(assert (=> b!446216 m!431769))

(assert (=> b!446216 m!431755))

(assert (=> b!446216 m!431759))

(assert (=> b!446216 m!431681))

(assert (=> b!446216 m!431761))

(assert (=> b!446216 m!431767))

(declare-fun m!431771 () Bool)

(assert (=> b!446216 m!431771))

(declare-fun m!431773 () Bool)

(assert (=> b!446216 m!431773))

(assert (=> bm!29647 m!431765))

(declare-fun m!431775 () Bool)

(assert (=> b!446218 m!431775))

(declare-fun m!431777 () Bool)

(assert (=> d!74191 m!431777))

(assert (=> d!74191 m!431575))

(assert (=> b!446221 m!431755))

(assert (=> b!446221 m!431755))

(declare-fun m!431779 () Bool)

(assert (=> b!446221 m!431779))

(assert (=> b!446016 d!74191))

(declare-fun b!446227 () Bool)

(declare-fun e!262170 () ListLongMap!6679)

(assert (=> b!446227 (= e!262170 (ListLongMap!6680 Nil!7823))))

(declare-fun b!446228 () Bool)

(declare-fun lt!203789 () Unit!13147)

(declare-fun lt!203788 () Unit!13147)

(assert (=> b!446228 (= lt!203789 lt!203788)))

(declare-fun lt!203786 () (_ BitVec 64))

(declare-fun lt!203785 () (_ BitVec 64))

(declare-fun lt!203790 () V!16939)

(declare-fun lt!203787 () ListLongMap!6679)

(assert (=> b!446228 (not (contains!2469 (+!1533 lt!203787 (tuple2!7765 lt!203785 lt!203790)) lt!203786))))

(assert (=> b!446228 (= lt!203788 (addStillNotContains!145 lt!203787 lt!203785 lt!203790 lt!203786))))

(assert (=> b!446228 (= lt!203786 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!446228 (= lt!203790 (get!6548 (select (arr!13228 _values!549) from!863) (dynLambda!853 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!446228 (= lt!203785 (select (arr!13227 _keys!709) from!863))))

(declare-fun call!29651 () ListLongMap!6679)

(assert (=> b!446228 (= lt!203787 call!29651)))

(declare-fun e!262164 () ListLongMap!6679)

(assert (=> b!446228 (= e!262164 (+!1533 call!29651 (tuple2!7765 (select (arr!13227 _keys!709) from!863) (get!6548 (select (arr!13228 _values!549) from!863) (dynLambda!853 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!446229 () Bool)

(declare-fun e!262167 () Bool)

(declare-fun e!262169 () Bool)

(assert (=> b!446229 (= e!262167 e!262169)))

(declare-fun c!55898 () Bool)

(declare-fun e!262166 () Bool)

(assert (=> b!446229 (= c!55898 e!262166)))

(declare-fun res!264870 () Bool)

(assert (=> b!446229 (=> (not res!264870) (not e!262166))))

(assert (=> b!446229 (= res!264870 (bvslt from!863 (size!13579 _keys!709)))))

(declare-fun bm!29648 () Bool)

(assert (=> bm!29648 (= call!29651 (getCurrentListMapNoExtraKeys!1585 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!446230 () Bool)

(declare-fun res!264871 () Bool)

(assert (=> b!446230 (=> (not res!264871) (not e!262167))))

(declare-fun lt!203784 () ListLongMap!6679)

(assert (=> b!446230 (= res!264871 (not (contains!2469 lt!203784 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!446231 () Bool)

(assert (=> b!446231 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13579 _keys!709)))))

(assert (=> b!446231 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13580 _values!549)))))

(declare-fun e!262165 () Bool)

(assert (=> b!446231 (= e!262165 (= (apply!310 lt!203784 (select (arr!13227 _keys!709) from!863)) (get!6548 (select (arr!13228 _values!549) from!863) (dynLambda!853 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!446232 () Bool)

(assert (=> b!446232 (= e!262170 e!262164)))

(declare-fun c!55897 () Bool)

(assert (=> b!446232 (= c!55897 (validKeyInArray!0 (select (arr!13227 _keys!709) from!863)))))

(declare-fun b!446233 () Bool)

(assert (=> b!446233 (= e!262169 e!262165)))

(assert (=> b!446233 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13579 _keys!709)))))

(declare-fun res!264869 () Bool)

(assert (=> b!446233 (= res!264869 (contains!2469 lt!203784 (select (arr!13227 _keys!709) from!863)))))

(assert (=> b!446233 (=> (not res!264869) (not e!262165))))

(declare-fun b!446234 () Bool)

(assert (=> b!446234 (= e!262166 (validKeyInArray!0 (select (arr!13227 _keys!709) from!863)))))

(assert (=> b!446234 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!446235 () Bool)

(declare-fun e!262168 () Bool)

(assert (=> b!446235 (= e!262169 e!262168)))

(declare-fun c!55899 () Bool)

(assert (=> b!446235 (= c!55899 (bvslt from!863 (size!13579 _keys!709)))))

(declare-fun d!74193 () Bool)

(assert (=> d!74193 e!262167))

(declare-fun res!264868 () Bool)

(assert (=> d!74193 (=> (not res!264868) (not e!262167))))

(assert (=> d!74193 (= res!264868 (not (contains!2469 lt!203784 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74193 (= lt!203784 e!262170)))

(declare-fun c!55900 () Bool)

(assert (=> d!74193 (= c!55900 (bvsge from!863 (size!13579 _keys!709)))))

(assert (=> d!74193 (validMask!0 mask!1025)))

(assert (=> d!74193 (= (getCurrentListMapNoExtraKeys!1585 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!203784)))

(declare-fun b!446236 () Bool)

(assert (=> b!446236 (= e!262164 call!29651)))

(declare-fun b!446237 () Bool)

(assert (=> b!446237 (= e!262168 (= lt!203784 (getCurrentListMapNoExtraKeys!1585 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!446238 () Bool)

(assert (=> b!446238 (= e!262168 (isEmpty!562 lt!203784))))

(assert (= (and d!74193 c!55900) b!446227))

(assert (= (and d!74193 (not c!55900)) b!446232))

(assert (= (and b!446232 c!55897) b!446228))

(assert (= (and b!446232 (not c!55897)) b!446236))

(assert (= (or b!446228 b!446236) bm!29648))

(assert (= (and d!74193 res!264868) b!446230))

(assert (= (and b!446230 res!264871) b!446229))

(assert (= (and b!446229 res!264870) b!446234))

(assert (= (and b!446229 c!55898) b!446233))

(assert (= (and b!446229 (not c!55898)) b!446235))

(assert (= (and b!446233 res!264869) b!446231))

(assert (= (and b!446235 c!55899) b!446237))

(assert (= (and b!446235 (not c!55899)) b!446238))

(declare-fun b_lambda!9463 () Bool)

(assert (=> (not b_lambda!9463) (not b!446228)))

(assert (=> b!446228 t!13583))

(declare-fun b_and!18577 () Bool)

(assert (= b_and!18575 (and (=> t!13583 result!6957) b_and!18577)))

(declare-fun b_lambda!9465 () Bool)

(assert (=> (not b_lambda!9465) (not b!446231)))

(assert (=> b!446231 t!13583))

(declare-fun b_and!18579 () Bool)

(assert (= b_and!18577 (and (=> t!13583 result!6957) b_and!18579)))

(declare-fun m!431781 () Bool)

(assert (=> b!446238 m!431781))

(declare-fun m!431783 () Bool)

(assert (=> b!446232 m!431783))

(assert (=> b!446232 m!431783))

(declare-fun m!431785 () Bool)

(assert (=> b!446232 m!431785))

(assert (=> b!446234 m!431783))

(assert (=> b!446234 m!431783))

(assert (=> b!446234 m!431785))

(declare-fun m!431787 () Bool)

(assert (=> b!446231 m!431787))

(assert (=> b!446231 m!431681))

(assert (=> b!446231 m!431787))

(assert (=> b!446231 m!431681))

(declare-fun m!431789 () Bool)

(assert (=> b!446231 m!431789))

(assert (=> b!446231 m!431783))

(assert (=> b!446231 m!431783))

(declare-fun m!431791 () Bool)

(assert (=> b!446231 m!431791))

(declare-fun m!431793 () Bool)

(assert (=> b!446237 m!431793))

(assert (=> b!446228 m!431787))

(assert (=> b!446228 m!431681))

(declare-fun m!431795 () Bool)

(assert (=> b!446228 m!431795))

(declare-fun m!431797 () Bool)

(assert (=> b!446228 m!431797))

(assert (=> b!446228 m!431783))

(assert (=> b!446228 m!431787))

(assert (=> b!446228 m!431681))

(assert (=> b!446228 m!431789))

(assert (=> b!446228 m!431795))

(declare-fun m!431799 () Bool)

(assert (=> b!446228 m!431799))

(declare-fun m!431801 () Bool)

(assert (=> b!446228 m!431801))

(assert (=> bm!29648 m!431793))

(declare-fun m!431803 () Bool)

(assert (=> b!446230 m!431803))

(declare-fun m!431805 () Bool)

(assert (=> d!74193 m!431805))

(assert (=> d!74193 m!431575))

(assert (=> b!446233 m!431783))

(assert (=> b!446233 m!431783))

(declare-fun m!431807 () Bool)

(assert (=> b!446233 m!431807))

(assert (=> b!446016 d!74193))

(declare-fun d!74195 () Bool)

(declare-fun e!262175 () Bool)

(assert (=> d!74195 e!262175))

(declare-fun res!264874 () Bool)

(assert (=> d!74195 (=> (not res!264874) (not e!262175))))

(assert (=> d!74195 (= res!264874 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13579 _keys!709)))) (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13580 _values!549)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13579 _keys!709)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13580 _values!549))))))))

(declare-fun lt!203793 () Unit!13147)

(declare-fun choose!1332 (array!27560 array!27562 (_ BitVec 32) (_ BitVec 32) V!16939 V!16939 (_ BitVec 32) (_ BitVec 64) V!16939 (_ BitVec 32) Int) Unit!13147)

(assert (=> d!74195 (= lt!203793 (choose!1332 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> d!74195 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13579 _keys!709)))))

(assert (=> d!74195 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!695 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!203793)))

(declare-fun call!29657 () ListLongMap!6679)

(declare-fun bm!29653 () Bool)

(assert (=> bm!29653 (= call!29657 (getCurrentListMapNoExtraKeys!1585 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun call!29656 () ListLongMap!6679)

(declare-fun bm!29654 () Bool)

(assert (=> bm!29654 (= call!29656 (getCurrentListMapNoExtraKeys!1585 (array!27561 (store (arr!13227 _keys!709) i!563 k0!794) (size!13579 _keys!709)) (array!27563 (store (arr!13228 _values!549) i!563 (ValueCellFull!5594 v!412)) (size!13580 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!446245 () Bool)

(declare-fun e!262176 () Bool)

(assert (=> b!446245 (= e!262175 e!262176)))

(declare-fun c!55903 () Bool)

(assert (=> b!446245 (= c!55903 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun b!446246 () Bool)

(assert (=> b!446246 (= e!262176 (= call!29656 call!29657))))

(declare-fun b!446247 () Bool)

(assert (=> b!446247 (= e!262176 (= call!29656 (+!1533 call!29657 (tuple2!7765 k0!794 v!412))))))

(assert (= (and d!74195 res!264874) b!446245))

(assert (= (and b!446245 c!55903) b!446247))

(assert (= (and b!446245 (not c!55903)) b!446246))

(assert (= (or b!446247 b!446246) bm!29653))

(assert (= (or b!446247 b!446246) bm!29654))

(declare-fun m!431809 () Bool)

(assert (=> d!74195 m!431809))

(declare-fun m!431811 () Bool)

(assert (=> bm!29653 m!431811))

(assert (=> bm!29654 m!431587))

(assert (=> bm!29654 m!431561))

(declare-fun m!431813 () Bool)

(assert (=> bm!29654 m!431813))

(declare-fun m!431815 () Bool)

(assert (=> b!446247 m!431815))

(assert (=> b!446016 d!74195))

(declare-fun d!74197 () Bool)

(declare-fun res!264876 () Bool)

(declare-fun e!262180 () Bool)

(assert (=> d!74197 (=> res!264876 e!262180)))

(assert (=> d!74197 (= res!264876 (bvsge #b00000000000000000000000000000000 (size!13579 lt!203726)))))

(assert (=> d!74197 (= (arrayNoDuplicates!0 lt!203726 #b00000000000000000000000000000000 Nil!7824) e!262180)))

(declare-fun b!446248 () Bool)

(declare-fun e!262179 () Bool)

(declare-fun e!262178 () Bool)

(assert (=> b!446248 (= e!262179 e!262178)))

(declare-fun c!55904 () Bool)

(assert (=> b!446248 (= c!55904 (validKeyInArray!0 (select (arr!13227 lt!203726) #b00000000000000000000000000000000)))))

(declare-fun b!446249 () Bool)

(declare-fun call!29658 () Bool)

(assert (=> b!446249 (= e!262178 call!29658)))

(declare-fun bm!29655 () Bool)

(assert (=> bm!29655 (= call!29658 (arrayNoDuplicates!0 lt!203726 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!55904 (Cons!7823 (select (arr!13227 lt!203726) #b00000000000000000000000000000000) Nil!7824) Nil!7824)))))

(declare-fun b!446250 () Bool)

(declare-fun e!262177 () Bool)

(assert (=> b!446250 (= e!262177 (contains!2470 Nil!7824 (select (arr!13227 lt!203726) #b00000000000000000000000000000000)))))

(declare-fun b!446251 () Bool)

(assert (=> b!446251 (= e!262180 e!262179)))

(declare-fun res!264875 () Bool)

(assert (=> b!446251 (=> (not res!264875) (not e!262179))))

(assert (=> b!446251 (= res!264875 (not e!262177))))

(declare-fun res!264877 () Bool)

(assert (=> b!446251 (=> (not res!264877) (not e!262177))))

(assert (=> b!446251 (= res!264877 (validKeyInArray!0 (select (arr!13227 lt!203726) #b00000000000000000000000000000000)))))

(declare-fun b!446252 () Bool)

(assert (=> b!446252 (= e!262178 call!29658)))

(assert (= (and d!74197 (not res!264876)) b!446251))

(assert (= (and b!446251 res!264877) b!446250))

(assert (= (and b!446251 res!264875) b!446248))

(assert (= (and b!446248 c!55904) b!446249))

(assert (= (and b!446248 (not c!55904)) b!446252))

(assert (= (or b!446249 b!446252) bm!29655))

(assert (=> b!446248 m!431705))

(assert (=> b!446248 m!431705))

(assert (=> b!446248 m!431707))

(assert (=> bm!29655 m!431705))

(declare-fun m!431817 () Bool)

(assert (=> bm!29655 m!431817))

(assert (=> b!446250 m!431705))

(assert (=> b!446250 m!431705))

(declare-fun m!431819 () Bool)

(assert (=> b!446250 m!431819))

(assert (=> b!446251 m!431705))

(assert (=> b!446251 m!431705))

(assert (=> b!446251 m!431707))

(assert (=> b!446026 d!74197))

(declare-fun bm!29656 () Bool)

(declare-fun call!29659 () Bool)

(assert (=> bm!29656 (= call!29659 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(declare-fun b!446253 () Bool)

(declare-fun e!262182 () Bool)

(assert (=> b!446253 (= e!262182 call!29659)))

(declare-fun b!446254 () Bool)

(declare-fun e!262183 () Bool)

(assert (=> b!446254 (= e!262183 call!29659)))

(declare-fun b!446255 () Bool)

(declare-fun e!262181 () Bool)

(assert (=> b!446255 (= e!262181 e!262183)))

(declare-fun c!55905 () Bool)

(assert (=> b!446255 (= c!55905 (validKeyInArray!0 (select (arr!13227 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun d!74199 () Bool)

(declare-fun res!264879 () Bool)

(assert (=> d!74199 (=> res!264879 e!262181)))

(assert (=> d!74199 (= res!264879 (bvsge #b00000000000000000000000000000000 (size!13579 _keys!709)))))

(assert (=> d!74199 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!262181)))

(declare-fun b!446256 () Bool)

(assert (=> b!446256 (= e!262183 e!262182)))

(declare-fun lt!203795 () (_ BitVec 64))

(assert (=> b!446256 (= lt!203795 (select (arr!13227 _keys!709) #b00000000000000000000000000000000))))

(declare-fun lt!203794 () Unit!13147)

(assert (=> b!446256 (= lt!203794 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!203795 #b00000000000000000000000000000000))))

(assert (=> b!446256 (arrayContainsKey!0 _keys!709 lt!203795 #b00000000000000000000000000000000)))

(declare-fun lt!203796 () Unit!13147)

(assert (=> b!446256 (= lt!203796 lt!203794)))

(declare-fun res!264878 () Bool)

(assert (=> b!446256 (= res!264878 (= (seekEntryOrOpen!0 (select (arr!13227 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3478 #b00000000000000000000000000000000)))))

(assert (=> b!446256 (=> (not res!264878) (not e!262182))))

(assert (= (and d!74199 (not res!264879)) b!446255))

(assert (= (and b!446255 c!55905) b!446256))

(assert (= (and b!446255 (not c!55905)) b!446254))

(assert (= (and b!446256 res!264878) b!446253))

(assert (= (or b!446253 b!446254) bm!29656))

(declare-fun m!431821 () Bool)

(assert (=> bm!29656 m!431821))

(assert (=> b!446255 m!431715))

(assert (=> b!446255 m!431715))

(assert (=> b!446255 m!431717))

(assert (=> b!446256 m!431715))

(declare-fun m!431823 () Bool)

(assert (=> b!446256 m!431823))

(declare-fun m!431825 () Bool)

(assert (=> b!446256 m!431825))

(assert (=> b!446256 m!431715))

(declare-fun m!431827 () Bool)

(assert (=> b!446256 m!431827))

(assert (=> b!446027 d!74199))

(declare-fun d!74201 () Bool)

(declare-fun e!262186 () Bool)

(assert (=> d!74201 e!262186))

(declare-fun res!264884 () Bool)

(assert (=> d!74201 (=> (not res!264884) (not e!262186))))

(declare-fun lt!203808 () ListLongMap!6679)

(assert (=> d!74201 (= res!264884 (contains!2469 lt!203808 (_1!3893 (tuple2!7765 k0!794 v!412))))))

(declare-fun lt!203805 () List!7826)

(assert (=> d!74201 (= lt!203808 (ListLongMap!6680 lt!203805))))

(declare-fun lt!203807 () Unit!13147)

(declare-fun lt!203806 () Unit!13147)

(assert (=> d!74201 (= lt!203807 lt!203806)))

(declare-datatypes ((Option!375 0))(
  ( (Some!374 (v!8240 V!16939)) (None!373) )
))
(declare-fun getValueByKey!369 (List!7826 (_ BitVec 64)) Option!375)

(assert (=> d!74201 (= (getValueByKey!369 lt!203805 (_1!3893 (tuple2!7765 k0!794 v!412))) (Some!374 (_2!3893 (tuple2!7765 k0!794 v!412))))))

(declare-fun lemmaContainsTupThenGetReturnValue!191 (List!7826 (_ BitVec 64) V!16939) Unit!13147)

(assert (=> d!74201 (= lt!203806 (lemmaContainsTupThenGetReturnValue!191 lt!203805 (_1!3893 (tuple2!7765 k0!794 v!412)) (_2!3893 (tuple2!7765 k0!794 v!412))))))

(declare-fun insertStrictlySorted!194 (List!7826 (_ BitVec 64) V!16939) List!7826)

(assert (=> d!74201 (= lt!203805 (insertStrictlySorted!194 (toList!3355 call!29626) (_1!3893 (tuple2!7765 k0!794 v!412)) (_2!3893 (tuple2!7765 k0!794 v!412))))))

(assert (=> d!74201 (= (+!1533 call!29626 (tuple2!7765 k0!794 v!412)) lt!203808)))

(declare-fun b!446261 () Bool)

(declare-fun res!264885 () Bool)

(assert (=> b!446261 (=> (not res!264885) (not e!262186))))

(assert (=> b!446261 (= res!264885 (= (getValueByKey!369 (toList!3355 lt!203808) (_1!3893 (tuple2!7765 k0!794 v!412))) (Some!374 (_2!3893 (tuple2!7765 k0!794 v!412)))))))

(declare-fun b!446262 () Bool)

(declare-fun contains!2471 (List!7826 tuple2!7764) Bool)

(assert (=> b!446262 (= e!262186 (contains!2471 (toList!3355 lt!203808) (tuple2!7765 k0!794 v!412)))))

(assert (= (and d!74201 res!264884) b!446261))

(assert (= (and b!446261 res!264885) b!446262))

(declare-fun m!431829 () Bool)

(assert (=> d!74201 m!431829))

(declare-fun m!431831 () Bool)

(assert (=> d!74201 m!431831))

(declare-fun m!431833 () Bool)

(assert (=> d!74201 m!431833))

(declare-fun m!431835 () Bool)

(assert (=> d!74201 m!431835))

(declare-fun m!431837 () Bool)

(assert (=> b!446261 m!431837))

(declare-fun m!431839 () Bool)

(assert (=> b!446262 m!431839))

(assert (=> b!446028 d!74201))

(declare-fun mapNonEmpty!19449 () Bool)

(declare-fun mapRes!19449 () Bool)

(declare-fun tp!37476 () Bool)

(declare-fun e!262191 () Bool)

(assert (=> mapNonEmpty!19449 (= mapRes!19449 (and tp!37476 e!262191))))

(declare-fun mapValue!19449 () ValueCell!5594)

(declare-fun mapKey!19449 () (_ BitVec 32))

(declare-fun mapRest!19449 () (Array (_ BitVec 32) ValueCell!5594))

(assert (=> mapNonEmpty!19449 (= mapRest!19440 (store mapRest!19449 mapKey!19449 mapValue!19449))))

(declare-fun b!446270 () Bool)

(declare-fun e!262192 () Bool)

(assert (=> b!446270 (= e!262192 tp_is_empty!11875)))

(declare-fun condMapEmpty!19449 () Bool)

(declare-fun mapDefault!19449 () ValueCell!5594)

(assert (=> mapNonEmpty!19440 (= condMapEmpty!19449 (= mapRest!19440 ((as const (Array (_ BitVec 32) ValueCell!5594)) mapDefault!19449)))))

(assert (=> mapNonEmpty!19440 (= tp!37460 (and e!262192 mapRes!19449))))

(declare-fun mapIsEmpty!19449 () Bool)

(assert (=> mapIsEmpty!19449 mapRes!19449))

(declare-fun b!446269 () Bool)

(assert (=> b!446269 (= e!262191 tp_is_empty!11875)))

(assert (= (and mapNonEmpty!19440 condMapEmpty!19449) mapIsEmpty!19449))

(assert (= (and mapNonEmpty!19440 (not condMapEmpty!19449)) mapNonEmpty!19449))

(assert (= (and mapNonEmpty!19449 ((_ is ValueCellFull!5594) mapValue!19449)) b!446269))

(assert (= (and mapNonEmpty!19440 ((_ is ValueCellFull!5594) mapDefault!19449)) b!446270))

(declare-fun m!431841 () Bool)

(assert (=> mapNonEmpty!19449 m!431841))

(declare-fun b_lambda!9467 () Bool)

(assert (= b_lambda!9465 (or (and start!40476 b_free!10561) b_lambda!9467)))

(declare-fun b_lambda!9469 () Bool)

(assert (= b_lambda!9463 (or (and start!40476 b_free!10561) b_lambda!9469)))

(declare-fun b_lambda!9471 () Bool)

(assert (= b_lambda!9457 (or (and start!40476 b_free!10561) b_lambda!9471)))

(declare-fun b_lambda!9473 () Bool)

(assert (= b_lambda!9451 (or (and start!40476 b_free!10561) b_lambda!9473)))

(declare-fun b_lambda!9475 () Bool)

(assert (= b_lambda!9455 (or (and start!40476 b_free!10561) b_lambda!9475)))

(declare-fun b_lambda!9477 () Bool)

(assert (= b_lambda!9461 (or (and start!40476 b_free!10561) b_lambda!9477)))

(declare-fun b_lambda!9479 () Bool)

(assert (= b_lambda!9459 (or (and start!40476 b_free!10561) b_lambda!9479)))

(declare-fun b_lambda!9481 () Bool)

(assert (= b_lambda!9453 (or (and start!40476 b_free!10561) b_lambda!9481)))

(check-sat (not b!446225) (not b!446207) (not b!446166) (not b!446163) (not b!446221) (not b_lambda!9469) (not b!446247) (not b!446194) (not b!446167) (not b!446180) (not b!446200) (not b_next!10561) (not b!446204) (not b_lambda!9473) (not bm!29648) (not b!446214) (not b!446228) (not b!446157) (not b!446203) (not d!74195) (not b!446231) (not bm!29639) (not b!446232) (not b_lambda!9477) (not d!74191) (not d!74173) (not bm!29645) (not bm!29646) b_and!18579 (not b!446201) (not b!446198) (not b!446261) (not b!446195) (not d!74201) (not b!446255) (not b_lambda!9467) (not b!446237) (not bm!29656) (not b!446251) (not bm!29654) (not b!446202) (not b!446262) (not b!446256) (not b!446218) (not b!446238) tp_is_empty!11875 (not b!446159) (not b!446162) (not b_lambda!9475) (not mapNonEmpty!19449) (not b!446220) (not bm!29655) (not b!446234) (not b!446250) (not bm!29647) (not b!446233) (not b!446161) (not b!446230) (not b!446160) (not bm!29653) (not b_lambda!9479) (not b!446192) (not bm!29642) (not b!446222) (not d!74185) (not d!74193) (not b!446208) (not b_lambda!9481) (not b_lambda!9471) (not b!446226) (not b!446219) (not b!446216) (not b!446181) (not b!446248))
(check-sat b_and!18579 (not b_next!10561))
