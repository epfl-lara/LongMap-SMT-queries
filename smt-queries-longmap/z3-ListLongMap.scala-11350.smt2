; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132416 () Bool)

(assert start!132416)

(declare-fun b_free!31717 () Bool)

(declare-fun b_next!31717 () Bool)

(assert (=> start!132416 (= b_free!31717 (not b_next!31717))))

(declare-fun tp!111402 () Bool)

(declare-fun b_and!51129 () Bool)

(assert (=> start!132416 (= tp!111402 b_and!51129)))

(declare-fun c!142657 () Bool)

(declare-datatypes ((V!59101 0))(
  ( (V!59102 (val!19074 Int)) )
))
(declare-fun zeroValue!436 () V!59101)

(declare-datatypes ((tuple2!24588 0))(
  ( (tuple2!24589 (_1!12305 (_ BitVec 64)) (_2!12305 V!59101)) )
))
(declare-datatypes ((List!36072 0))(
  ( (Nil!36069) (Cons!36068 (h!37531 tuple2!24588) (t!50758 List!36072)) )
))
(declare-datatypes ((ListLongMap!22205 0))(
  ( (ListLongMap!22206 (toList!11118 List!36072)) )
))
(declare-fun call!69759 () ListLongMap!22205)

(declare-fun bm!69752 () Bool)

(declare-fun call!69757 () ListLongMap!22205)

(declare-fun minValue!436 () V!59101)

(declare-fun call!69758 () ListLongMap!22205)

(declare-fun c!142656 () Bool)

(declare-fun call!69755 () ListLongMap!22205)

(declare-fun +!4963 (ListLongMap!22205 tuple2!24588) ListLongMap!22205)

(assert (=> bm!69752 (= call!69758 (+!4963 (ite c!142657 call!69759 (ite c!142656 call!69757 call!69755)) (ite (or c!142657 c!142656) (tuple2!24589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun bm!69753 () Bool)

(assert (=> bm!69753 (= call!69757 call!69759)))

(declare-fun b!1549085 () Bool)

(declare-fun res!1061200 () Bool)

(declare-fun e!862416 () Bool)

(assert (=> b!1549085 (=> (not res!1061200) (not e!862416))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103314 0))(
  ( (array!103315 (arr!49852 (Array (_ BitVec 32) (_ BitVec 64))) (size!50403 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103314)

(assert (=> b!1549085 (= res!1061200 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50403 _keys!618))))))

(declare-fun b!1549086 () Bool)

(declare-fun e!862411 () ListLongMap!22205)

(declare-fun call!69756 () ListLongMap!22205)

(assert (=> b!1549086 (= e!862411 call!69756)))

(declare-fun b!1549087 () Bool)

(declare-fun res!1061199 () Bool)

(assert (=> b!1549087 (=> (not res!1061199) (not e!862416))))

(declare-datatypes ((List!36073 0))(
  ( (Nil!36070) (Cons!36069 (h!37532 (_ BitVec 64)) (t!50759 List!36073)) )
))
(declare-fun arrayNoDuplicates!0 (array!103314 (_ BitVec 32) List!36073) Bool)

(assert (=> b!1549087 (= res!1061199 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36070))))

(declare-fun b!1549088 () Bool)

(declare-fun e!862417 () Bool)

(assert (=> b!1549088 (= e!862416 e!862417)))

(declare-fun res!1061201 () Bool)

(assert (=> b!1549088 (=> (not res!1061201) (not e!862417))))

(assert (=> b!1549088 (= res!1061201 (bvslt from!762 (size!50403 _keys!618)))))

(declare-fun lt!667537 () ListLongMap!22205)

(declare-fun e!862419 () ListLongMap!22205)

(assert (=> b!1549088 (= lt!667537 e!862419)))

(declare-fun lt!667540 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1549088 (= c!142657 (and (not lt!667540) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1549088 (= lt!667540 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1549089 () Bool)

(declare-fun e!862412 () Bool)

(declare-fun tp_is_empty!37993 () Bool)

(assert (=> b!1549089 (= e!862412 tp_is_empty!37993)))

(declare-fun mapNonEmpty!58693 () Bool)

(declare-fun mapRes!58693 () Bool)

(declare-fun tp!111403 () Bool)

(declare-fun e!862414 () Bool)

(assert (=> mapNonEmpty!58693 (= mapRes!58693 (and tp!111403 e!862414))))

(declare-datatypes ((ValueCell!18086 0))(
  ( (ValueCellFull!18086 (v!21867 V!59101)) (EmptyCell!18086) )
))
(declare-datatypes ((array!103316 0))(
  ( (array!103317 (arr!49853 (Array (_ BitVec 32) ValueCell!18086)) (size!50404 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103316)

(declare-fun mapRest!58693 () (Array (_ BitVec 32) ValueCell!18086))

(declare-fun mapKey!58693 () (_ BitVec 32))

(declare-fun mapValue!58693 () ValueCell!18086)

(assert (=> mapNonEmpty!58693 (= (arr!49853 _values!470) (store mapRest!58693 mapKey!58693 mapValue!58693))))

(declare-fun b!1549090 () Bool)

(declare-fun e!862413 () ListLongMap!22205)

(assert (=> b!1549090 (= e!862419 e!862413)))

(assert (=> b!1549090 (= c!142656 (and (not lt!667540) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1549091 () Bool)

(assert (=> b!1549091 (= e!862413 call!69756)))

(declare-fun b!1549092 () Bool)

(assert (=> b!1549092 (= e!862411 call!69755)))

(declare-fun b!1549093 () Bool)

(assert (=> b!1549093 (= e!862419 (+!4963 call!69758 (tuple2!24589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1549094 () Bool)

(declare-fun c!142655 () Bool)

(assert (=> b!1549094 (= c!142655 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667540))))

(assert (=> b!1549094 (= e!862413 e!862411)))

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun bm!69755 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6598 (array!103314 array!103316 (_ BitVec 32) (_ BitVec 32) V!59101 V!59101 (_ BitVec 32) Int) ListLongMap!22205)

(assert (=> bm!69755 (= call!69759 (getCurrentListMapNoExtraKeys!6598 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1549095 () Bool)

(declare-fun res!1061195 () Bool)

(assert (=> b!1549095 (=> (not res!1061195) (not e!862416))))

(assert (=> b!1549095 (= res!1061195 (and (= (size!50404 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50403 _keys!618) (size!50404 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1549096 () Bool)

(declare-fun e!862418 () Bool)

(assert (=> b!1549096 (= e!862418 (and e!862412 mapRes!58693))))

(declare-fun condMapEmpty!58693 () Bool)

(declare-fun mapDefault!58693 () ValueCell!18086)

(assert (=> b!1549096 (= condMapEmpty!58693 (= (arr!49853 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18086)) mapDefault!58693)))))

(declare-fun mapIsEmpty!58693 () Bool)

(assert (=> mapIsEmpty!58693 mapRes!58693))

(declare-fun b!1549097 () Bool)

(declare-fun res!1061197 () Bool)

(assert (=> b!1549097 (=> (not res!1061197) (not e!862416))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103314 (_ BitVec 32)) Bool)

(assert (=> b!1549097 (= res!1061197 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1549098 () Bool)

(assert (=> b!1549098 (= e!862414 tp_is_empty!37993)))

(declare-fun bm!69756 () Bool)

(assert (=> bm!69756 (= call!69755 call!69757)))

(declare-fun b!1549099 () Bool)

(declare-fun res!1061196 () Bool)

(assert (=> b!1549099 (=> (not res!1061196) (not e!862417))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1549099 (= res!1061196 (validKeyInArray!0 (select (arr!49852 _keys!618) from!762)))))

(declare-fun b!1549100 () Bool)

(assert (=> b!1549100 (= e!862417 (not true))))

(declare-fun lt!667536 () ListLongMap!22205)

(declare-fun apply!1051 (ListLongMap!22205 (_ BitVec 64)) V!59101)

(assert (=> b!1549100 (= (apply!1051 (+!4963 lt!667536 (tuple2!24589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49852 _keys!618) from!762)) (apply!1051 lt!667536 (select (arr!49852 _keys!618) from!762)))))

(declare-datatypes ((Unit!51467 0))(
  ( (Unit!51468) )
))
(declare-fun lt!667539 () Unit!51467)

(declare-fun addApplyDifferent!580 (ListLongMap!22205 (_ BitVec 64) V!59101 (_ BitVec 64)) Unit!51467)

(assert (=> b!1549100 (= lt!667539 (addApplyDifferent!580 lt!667536 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49852 _keys!618) from!762)))))

(declare-fun contains!10099 (ListLongMap!22205 (_ BitVec 64)) Bool)

(assert (=> b!1549100 (contains!10099 (+!4963 lt!667536 (tuple2!24589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49852 _keys!618) from!762))))

(declare-fun lt!667538 () Unit!51467)

(declare-fun addStillContains!1241 (ListLongMap!22205 (_ BitVec 64) V!59101 (_ BitVec 64)) Unit!51467)

(assert (=> b!1549100 (= lt!667538 (addStillContains!1241 lt!667536 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49852 _keys!618) from!762)))))

(assert (=> b!1549100 (= lt!667536 (getCurrentListMapNoExtraKeys!6598 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun res!1061198 () Bool)

(assert (=> start!132416 (=> (not res!1061198) (not e!862416))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132416 (= res!1061198 (validMask!0 mask!926))))

(assert (=> start!132416 e!862416))

(declare-fun array_inv!39039 (array!103314) Bool)

(assert (=> start!132416 (array_inv!39039 _keys!618)))

(assert (=> start!132416 tp_is_empty!37993))

(assert (=> start!132416 true))

(assert (=> start!132416 tp!111402))

(declare-fun array_inv!39040 (array!103316) Bool)

(assert (=> start!132416 (and (array_inv!39040 _values!470) e!862418)))

(declare-fun bm!69754 () Bool)

(assert (=> bm!69754 (= call!69756 call!69758)))

(assert (= (and start!132416 res!1061198) b!1549095))

(assert (= (and b!1549095 res!1061195) b!1549097))

(assert (= (and b!1549097 res!1061197) b!1549087))

(assert (= (and b!1549087 res!1061199) b!1549085))

(assert (= (and b!1549085 res!1061200) b!1549088))

(assert (= (and b!1549088 c!142657) b!1549093))

(assert (= (and b!1549088 (not c!142657)) b!1549090))

(assert (= (and b!1549090 c!142656) b!1549091))

(assert (= (and b!1549090 (not c!142656)) b!1549094))

(assert (= (and b!1549094 c!142655) b!1549086))

(assert (= (and b!1549094 (not c!142655)) b!1549092))

(assert (= (or b!1549086 b!1549092) bm!69756))

(assert (= (or b!1549091 bm!69756) bm!69753))

(assert (= (or b!1549091 b!1549086) bm!69754))

(assert (= (or b!1549093 bm!69753) bm!69755))

(assert (= (or b!1549093 bm!69754) bm!69752))

(assert (= (and b!1549088 res!1061201) b!1549099))

(assert (= (and b!1549099 res!1061196) b!1549100))

(assert (= (and b!1549096 condMapEmpty!58693) mapIsEmpty!58693))

(assert (= (and b!1549096 (not condMapEmpty!58693)) mapNonEmpty!58693))

(get-info :version)

(assert (= (and mapNonEmpty!58693 ((_ is ValueCellFull!18086) mapValue!58693)) b!1549098))

(assert (= (and b!1549096 ((_ is ValueCellFull!18086) mapDefault!58693)) b!1549089))

(assert (= start!132416 b!1549096))

(declare-fun m!1428723 () Bool)

(assert (=> start!132416 m!1428723))

(declare-fun m!1428725 () Bool)

(assert (=> start!132416 m!1428725))

(declare-fun m!1428727 () Bool)

(assert (=> start!132416 m!1428727))

(declare-fun m!1428729 () Bool)

(assert (=> b!1549097 m!1428729))

(declare-fun m!1428731 () Bool)

(assert (=> bm!69755 m!1428731))

(assert (=> b!1549100 m!1428731))

(declare-fun m!1428733 () Bool)

(assert (=> b!1549100 m!1428733))

(declare-fun m!1428735 () Bool)

(assert (=> b!1549100 m!1428735))

(assert (=> b!1549100 m!1428733))

(declare-fun m!1428737 () Bool)

(assert (=> b!1549100 m!1428737))

(assert (=> b!1549100 m!1428735))

(assert (=> b!1549100 m!1428733))

(declare-fun m!1428739 () Bool)

(assert (=> b!1549100 m!1428739))

(assert (=> b!1549100 m!1428733))

(declare-fun m!1428741 () Bool)

(assert (=> b!1549100 m!1428741))

(declare-fun m!1428743 () Bool)

(assert (=> b!1549100 m!1428743))

(assert (=> b!1549100 m!1428733))

(declare-fun m!1428745 () Bool)

(assert (=> b!1549100 m!1428745))

(assert (=> b!1549100 m!1428743))

(assert (=> b!1549100 m!1428733))

(declare-fun m!1428747 () Bool)

(assert (=> b!1549100 m!1428747))

(assert (=> b!1549099 m!1428733))

(assert (=> b!1549099 m!1428733))

(declare-fun m!1428749 () Bool)

(assert (=> b!1549099 m!1428749))

(declare-fun m!1428751 () Bool)

(assert (=> b!1549093 m!1428751))

(declare-fun m!1428753 () Bool)

(assert (=> bm!69752 m!1428753))

(declare-fun m!1428755 () Bool)

(assert (=> b!1549087 m!1428755))

(declare-fun m!1428757 () Bool)

(assert (=> mapNonEmpty!58693 m!1428757))

(check-sat (not b!1549100) (not mapNonEmpty!58693) (not b!1549093) tp_is_empty!37993 (not bm!69752) (not bm!69755) (not b!1549097) b_and!51129 (not start!132416) (not b!1549099) (not b!1549087) (not b_next!31717))
(check-sat b_and!51129 (not b_next!31717))
