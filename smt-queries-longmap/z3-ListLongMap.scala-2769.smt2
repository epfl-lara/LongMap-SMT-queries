; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40452 () Bool)

(assert start!40452)

(declare-fun b_free!10537 () Bool)

(declare-fun b_next!10537 () Bool)

(assert (=> start!40452 (= b_free!10537 (not b_next!10537))))

(declare-fun tp!37389 () Bool)

(declare-fun b_and!18535 () Bool)

(assert (=> start!40452 (= tp!37389 b_and!18535)))

(declare-fun b!445401 () Bool)

(declare-fun res!264318 () Bool)

(declare-fun e!261802 () Bool)

(assert (=> b!445401 (=> (not res!264318) (not e!261802))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16907 0))(
  ( (V!16908 (val!5970 Int)) )
))
(declare-datatypes ((ValueCell!5582 0))(
  ( (ValueCellFull!5582 (v!8222 V!16907)) (EmptyCell!5582) )
))
(declare-datatypes ((array!27514 0))(
  ( (array!27515 (arr!13204 (Array (_ BitVec 32) ValueCell!5582)) (size!13556 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27514)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!27516 0))(
  ( (array!27517 (arr!13205 (Array (_ BitVec 32) (_ BitVec 64))) (size!13557 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27516)

(assert (=> b!445401 (= res!264318 (and (= (size!13556 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13557 _keys!709) (size!13556 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!445402 () Bool)

(declare-fun res!264311 () Bool)

(assert (=> b!445402 (=> (not res!264311) (not e!261802))))

(declare-datatypes ((List!7807 0))(
  ( (Nil!7804) (Cons!7803 (h!8659 (_ BitVec 64)) (t!13557 List!7807)) )
))
(declare-fun arrayNoDuplicates!0 (array!27516 (_ BitVec 32) List!7807) Bool)

(assert (=> b!445402 (= res!264311 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7804))))

(declare-fun b!445403 () Bool)

(declare-fun e!261807 () Bool)

(declare-fun tp_is_empty!11851 () Bool)

(assert (=> b!445403 (= e!261807 tp_is_empty!11851)))

(declare-fun minValue!515 () V!16907)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16907)

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((tuple2!7746 0))(
  ( (tuple2!7747 (_1!3884 (_ BitVec 64)) (_2!3884 V!16907)) )
))
(declare-datatypes ((List!7808 0))(
  ( (Nil!7805) (Cons!7804 (h!8660 tuple2!7746) (t!13558 List!7808)) )
))
(declare-datatypes ((ListLongMap!6661 0))(
  ( (ListLongMap!6662 (toList!3346 List!7808)) )
))
(declare-fun call!29555 () ListLongMap!6661)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!203654 () array!27516)

(declare-fun bm!29551 () Bool)

(declare-fun c!55828 () Bool)

(declare-fun v!412 () V!16907)

(declare-fun getCurrentListMapNoExtraKeys!1578 (array!27516 array!27514 (_ BitVec 32) (_ BitVec 32) V!16907 V!16907 (_ BitVec 32) Int) ListLongMap!6661)

(assert (=> bm!29551 (= call!29555 (getCurrentListMapNoExtraKeys!1578 (ite c!55828 _keys!709 lt!203654) (ite c!55828 _values!549 (array!27515 (store (arr!13204 _values!549) i!563 (ValueCellFull!5582 v!412)) (size!13556 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!445404 () Bool)

(declare-fun res!264321 () Bool)

(assert (=> b!445404 (=> (not res!264321) (not e!261802))))

(assert (=> b!445404 (= res!264321 (or (= (select (arr!13205 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13205 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!445405 () Bool)

(declare-fun e!261803 () Bool)

(assert (=> b!445405 (= e!261802 e!261803)))

(declare-fun res!264314 () Bool)

(assert (=> b!445405 (=> (not res!264314) (not e!261803))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27516 (_ BitVec 32)) Bool)

(assert (=> b!445405 (= res!264314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203654 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!445405 (= lt!203654 (array!27517 (store (arr!13205 _keys!709) i!563 k0!794) (size!13557 _keys!709)))))

(declare-fun b!445407 () Bool)

(declare-fun call!29554 () ListLongMap!6661)

(declare-fun e!261806 () Bool)

(declare-fun +!1527 (ListLongMap!6661 tuple2!7746) ListLongMap!6661)

(assert (=> b!445407 (= e!261806 (= call!29554 (+!1527 call!29555 (tuple2!7747 k0!794 v!412))))))

(declare-fun b!445408 () Bool)

(declare-fun res!264312 () Bool)

(assert (=> b!445408 (=> (not res!264312) (not e!261802))))

(assert (=> b!445408 (= res!264312 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13557 _keys!709))))))

(declare-fun b!445409 () Bool)

(declare-fun res!264315 () Bool)

(assert (=> b!445409 (=> (not res!264315) (not e!261803))))

(assert (=> b!445409 (= res!264315 (arrayNoDuplicates!0 lt!203654 #b00000000000000000000000000000000 Nil!7804))))

(declare-fun mapNonEmpty!19404 () Bool)

(declare-fun mapRes!19404 () Bool)

(declare-fun tp!37388 () Bool)

(assert (=> mapNonEmpty!19404 (= mapRes!19404 (and tp!37388 e!261807))))

(declare-fun mapRest!19404 () (Array (_ BitVec 32) ValueCell!5582))

(declare-fun mapKey!19404 () (_ BitVec 32))

(declare-fun mapValue!19404 () ValueCell!5582)

(assert (=> mapNonEmpty!19404 (= (arr!13204 _values!549) (store mapRest!19404 mapKey!19404 mapValue!19404))))

(declare-fun b!445410 () Bool)

(declare-fun res!264320 () Bool)

(assert (=> b!445410 (=> (not res!264320) (not e!261802))))

(declare-fun arrayContainsKey!0 (array!27516 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!445410 (= res!264320 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!445411 () Bool)

(assert (=> b!445411 (= e!261803 (not true))))

(assert (=> b!445411 e!261806))

(assert (=> b!445411 (= c!55828 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13131 0))(
  ( (Unit!13132) )
))
(declare-fun lt!203655 () Unit!13131)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!687 (array!27516 array!27514 (_ BitVec 32) (_ BitVec 32) V!16907 V!16907 (_ BitVec 32) (_ BitVec 64) V!16907 (_ BitVec 32) Int) Unit!13131)

(assert (=> b!445411 (= lt!203655 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!687 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!19404 () Bool)

(assert (=> mapIsEmpty!19404 mapRes!19404))

(declare-fun b!445412 () Bool)

(assert (=> b!445412 (= e!261806 (= call!29555 call!29554))))

(declare-fun b!445413 () Bool)

(declare-fun e!261801 () Bool)

(declare-fun e!261805 () Bool)

(assert (=> b!445413 (= e!261801 (and e!261805 mapRes!19404))))

(declare-fun condMapEmpty!19404 () Bool)

(declare-fun mapDefault!19404 () ValueCell!5582)

(assert (=> b!445413 (= condMapEmpty!19404 (= (arr!13204 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5582)) mapDefault!19404)))))

(declare-fun b!445414 () Bool)

(assert (=> b!445414 (= e!261805 tp_is_empty!11851)))

(declare-fun b!445415 () Bool)

(declare-fun res!264319 () Bool)

(assert (=> b!445415 (=> (not res!264319) (not e!261802))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!445415 (= res!264319 (validMask!0 mask!1025))))

(declare-fun bm!29552 () Bool)

(assert (=> bm!29552 (= call!29554 (getCurrentListMapNoExtraKeys!1578 (ite c!55828 lt!203654 _keys!709) (ite c!55828 (array!27515 (store (arr!13204 _values!549) i!563 (ValueCellFull!5582 v!412)) (size!13556 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!264313 () Bool)

(assert (=> start!40452 (=> (not res!264313) (not e!261802))))

(assert (=> start!40452 (= res!264313 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13557 _keys!709))))))

(assert (=> start!40452 e!261802))

(assert (=> start!40452 tp_is_empty!11851))

(assert (=> start!40452 tp!37389))

(assert (=> start!40452 true))

(declare-fun array_inv!9652 (array!27514) Bool)

(assert (=> start!40452 (and (array_inv!9652 _values!549) e!261801)))

(declare-fun array_inv!9653 (array!27516) Bool)

(assert (=> start!40452 (array_inv!9653 _keys!709)))

(declare-fun b!445406 () Bool)

(declare-fun res!264322 () Bool)

(assert (=> b!445406 (=> (not res!264322) (not e!261802))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!445406 (= res!264322 (validKeyInArray!0 k0!794))))

(declare-fun b!445416 () Bool)

(declare-fun res!264317 () Bool)

(assert (=> b!445416 (=> (not res!264317) (not e!261803))))

(assert (=> b!445416 (= res!264317 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13557 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!445417 () Bool)

(declare-fun res!264316 () Bool)

(assert (=> b!445417 (=> (not res!264316) (not e!261802))))

(assert (=> b!445417 (= res!264316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!40452 res!264313) b!445415))

(assert (= (and b!445415 res!264319) b!445401))

(assert (= (and b!445401 res!264318) b!445417))

(assert (= (and b!445417 res!264316) b!445402))

(assert (= (and b!445402 res!264311) b!445408))

(assert (= (and b!445408 res!264312) b!445406))

(assert (= (and b!445406 res!264322) b!445404))

(assert (= (and b!445404 res!264321) b!445410))

(assert (= (and b!445410 res!264320) b!445405))

(assert (= (and b!445405 res!264314) b!445409))

(assert (= (and b!445409 res!264315) b!445416))

(assert (= (and b!445416 res!264317) b!445411))

(assert (= (and b!445411 c!55828) b!445407))

(assert (= (and b!445411 (not c!55828)) b!445412))

(assert (= (or b!445407 b!445412) bm!29552))

(assert (= (or b!445407 b!445412) bm!29551))

(assert (= (and b!445413 condMapEmpty!19404) mapIsEmpty!19404))

(assert (= (and b!445413 (not condMapEmpty!19404)) mapNonEmpty!19404))

(get-info :version)

(assert (= (and mapNonEmpty!19404 ((_ is ValueCellFull!5582) mapValue!19404)) b!445403))

(assert (= (and b!445413 ((_ is ValueCellFull!5582) mapDefault!19404)) b!445414))

(assert (= start!40452 b!445413))

(declare-fun m!431151 () Bool)

(assert (=> b!445410 m!431151))

(declare-fun m!431153 () Bool)

(assert (=> b!445406 m!431153))

(declare-fun m!431155 () Bool)

(assert (=> start!40452 m!431155))

(declare-fun m!431157 () Bool)

(assert (=> start!40452 m!431157))

(declare-fun m!431159 () Bool)

(assert (=> b!445407 m!431159))

(declare-fun m!431161 () Bool)

(assert (=> b!445411 m!431161))

(declare-fun m!431163 () Bool)

(assert (=> b!445405 m!431163))

(declare-fun m!431165 () Bool)

(assert (=> b!445405 m!431165))

(declare-fun m!431167 () Bool)

(assert (=> b!445415 m!431167))

(declare-fun m!431169 () Bool)

(assert (=> bm!29551 m!431169))

(declare-fun m!431171 () Bool)

(assert (=> bm!29551 m!431171))

(declare-fun m!431173 () Bool)

(assert (=> b!445409 m!431173))

(declare-fun m!431175 () Bool)

(assert (=> b!445404 m!431175))

(assert (=> bm!29552 m!431169))

(declare-fun m!431177 () Bool)

(assert (=> bm!29552 m!431177))

(declare-fun m!431179 () Bool)

(assert (=> b!445417 m!431179))

(declare-fun m!431181 () Bool)

(assert (=> b!445402 m!431181))

(declare-fun m!431183 () Bool)

(assert (=> mapNonEmpty!19404 m!431183))

(check-sat tp_is_empty!11851 (not b!445415) b_and!18535 (not b!445406) (not b!445409) (not mapNonEmpty!19404) (not b!445402) (not b_next!10537) (not b!445410) (not start!40452) (not bm!29552) (not bm!29551) (not b!445407) (not b!445405) (not b!445411) (not b!445417))
(check-sat b_and!18535 (not b_next!10537))
