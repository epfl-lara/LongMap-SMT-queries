; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40726 () Bool)

(assert start!40726)

(declare-fun b_free!10737 () Bool)

(declare-fun b_next!10737 () Bool)

(assert (=> start!40726 (= b_free!10737 (not b_next!10737))))

(declare-fun tp!38030 () Bool)

(declare-fun b_and!18745 () Bool)

(assert (=> start!40726 (= tp!38030 b_and!18745)))

(declare-fun b!450961 () Bool)

(declare-fun res!268480 () Bool)

(declare-fun e!264205 () Bool)

(assert (=> b!450961 (=> (not res!268480) (not e!264205))))

(declare-datatypes ((array!27955 0))(
  ( (array!27956 (arr!13423 (Array (_ BitVec 32) (_ BitVec 64))) (size!13775 (_ BitVec 32))) )
))
(declare-fun lt!204760 () array!27955)

(declare-datatypes ((List!8057 0))(
  ( (Nil!8054) (Cons!8053 (h!8909 (_ BitVec 64)) (t!13819 List!8057)) )
))
(declare-fun arrayNoDuplicates!0 (array!27955 (_ BitVec 32) List!8057) Bool)

(assert (=> b!450961 (= res!268480 (arrayNoDuplicates!0 lt!204760 #b00000000000000000000000000000000 Nil!8054))))

(declare-fun b!450962 () Bool)

(declare-fun e!264204 () Bool)

(assert (=> b!450962 (= e!264205 e!264204)))

(declare-fun res!268478 () Bool)

(assert (=> b!450962 (=> (not res!268478) (not e!264204))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!450962 (= res!268478 (= from!863 i!563))))

(declare-datatypes ((V!17205 0))(
  ( (V!17206 (val!6082 Int)) )
))
(declare-datatypes ((ValueCell!5694 0))(
  ( (ValueCellFull!5694 (v!8337 V!17205)) (EmptyCell!5694) )
))
(declare-datatypes ((array!27957 0))(
  ( (array!27958 (arr!13424 (Array (_ BitVec 32) ValueCell!5694)) (size!13776 (_ BitVec 32))) )
))
(declare-fun lt!204764 () array!27957)

(declare-fun minValue!515 () V!17205)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!7992 0))(
  ( (tuple2!7993 (_1!4007 (_ BitVec 64)) (_2!4007 V!17205)) )
))
(declare-datatypes ((List!8058 0))(
  ( (Nil!8055) (Cons!8054 (h!8910 tuple2!7992) (t!13820 List!8058)) )
))
(declare-datatypes ((ListLongMap!6905 0))(
  ( (ListLongMap!6906 (toList!3468 List!8058)) )
))
(declare-fun lt!204765 () ListLongMap!6905)

(declare-fun zeroValue!515 () V!17205)

(declare-fun getCurrentListMapNoExtraKeys!1652 (array!27955 array!27957 (_ BitVec 32) (_ BitVec 32) V!17205 V!17205 (_ BitVec 32) Int) ListLongMap!6905)

(assert (=> b!450962 (= lt!204765 (getCurrentListMapNoExtraKeys!1652 lt!204760 lt!204764 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!27957)

(declare-fun v!412 () V!17205)

(assert (=> b!450962 (= lt!204764 (array!27958 (store (arr!13424 _values!549) i!563 (ValueCellFull!5694 v!412)) (size!13776 _values!549)))))

(declare-fun lt!204762 () ListLongMap!6905)

(declare-fun _keys!709 () array!27955)

(assert (=> b!450962 (= lt!204762 (getCurrentListMapNoExtraKeys!1652 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!450963 () Bool)

(declare-fun res!268483 () Bool)

(declare-fun e!264202 () Bool)

(assert (=> b!450963 (=> (not res!268483) (not e!264202))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27955 (_ BitVec 32)) Bool)

(assert (=> b!450963 (= res!268483 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!450964 () Bool)

(declare-fun e!264207 () Bool)

(declare-fun tp_is_empty!12075 () Bool)

(assert (=> b!450964 (= e!264207 tp_is_empty!12075)))

(declare-fun b!450965 () Bool)

(assert (=> b!450965 (= e!264202 e!264205)))

(declare-fun res!268484 () Bool)

(assert (=> b!450965 (=> (not res!268484) (not e!264205))))

(assert (=> b!450965 (= res!268484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204760 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!450965 (= lt!204760 (array!27956 (store (arr!13423 _keys!709) i!563 k0!794) (size!13775 _keys!709)))))

(declare-fun b!450966 () Bool)

(declare-fun res!268477 () Bool)

(assert (=> b!450966 (=> (not res!268477) (not e!264202))))

(declare-fun arrayContainsKey!0 (array!27955 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!450966 (= res!268477 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!268481 () Bool)

(assert (=> start!40726 (=> (not res!268481) (not e!264202))))

(assert (=> start!40726 (= res!268481 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13775 _keys!709))))))

(assert (=> start!40726 e!264202))

(assert (=> start!40726 tp_is_empty!12075))

(assert (=> start!40726 tp!38030))

(assert (=> start!40726 true))

(declare-fun e!264209 () Bool)

(declare-fun array_inv!9720 (array!27957) Bool)

(assert (=> start!40726 (and (array_inv!9720 _values!549) e!264209)))

(declare-fun array_inv!9721 (array!27955) Bool)

(assert (=> start!40726 (array_inv!9721 _keys!709)))

(declare-fun b!450967 () Bool)

(declare-fun res!268482 () Bool)

(assert (=> b!450967 (=> (not res!268482) (not e!264202))))

(assert (=> b!450967 (= res!268482 (and (= (size!13776 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13775 _keys!709) (size!13776 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!450968 () Bool)

(declare-fun e!264206 () Bool)

(assert (=> b!450968 (= e!264204 (not e!264206))))

(declare-fun res!268487 () Bool)

(assert (=> b!450968 (=> res!268487 e!264206)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!450968 (= res!268487 (validKeyInArray!0 (select (arr!13423 _keys!709) from!863)))))

(declare-fun e!264201 () Bool)

(assert (=> b!450968 e!264201))

(declare-fun c!56012 () Bool)

(assert (=> b!450968 (= c!56012 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13202 0))(
  ( (Unit!13203) )
))
(declare-fun lt!204761 () Unit!13202)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!716 (array!27955 array!27957 (_ BitVec 32) (_ BitVec 32) V!17205 V!17205 (_ BitVec 32) (_ BitVec 64) V!17205 (_ BitVec 32) Int) Unit!13202)

(assert (=> b!450968 (= lt!204761 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!716 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450969 () Bool)

(declare-fun e!264208 () Bool)

(assert (=> b!450969 (= e!264208 tp_is_empty!12075)))

(declare-fun b!450970 () Bool)

(declare-fun call!29803 () ListLongMap!6905)

(declare-fun call!29804 () ListLongMap!6905)

(assert (=> b!450970 (= e!264201 (= call!29803 call!29804))))

(declare-fun b!450971 () Bool)

(assert (=> b!450971 (= e!264206 (bvslt from!863 (size!13776 _values!549)))))

(declare-fun lt!204763 () ListLongMap!6905)

(assert (=> b!450971 (= lt!204763 (getCurrentListMapNoExtraKeys!1652 lt!204760 lt!204764 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!19746 () Bool)

(declare-fun mapRes!19746 () Bool)

(declare-fun tp!38031 () Bool)

(assert (=> mapNonEmpty!19746 (= mapRes!19746 (and tp!38031 e!264207))))

(declare-fun mapKey!19746 () (_ BitVec 32))

(declare-fun mapRest!19746 () (Array (_ BitVec 32) ValueCell!5694))

(declare-fun mapValue!19746 () ValueCell!5694)

(assert (=> mapNonEmpty!19746 (= (arr!13424 _values!549) (store mapRest!19746 mapKey!19746 mapValue!19746))))

(declare-fun mapIsEmpty!19746 () Bool)

(assert (=> mapIsEmpty!19746 mapRes!19746))

(declare-fun bm!29800 () Bool)

(assert (=> bm!29800 (= call!29804 (getCurrentListMapNoExtraKeys!1652 (ite c!56012 lt!204760 _keys!709) (ite c!56012 lt!204764 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450972 () Bool)

(declare-fun res!268488 () Bool)

(assert (=> b!450972 (=> (not res!268488) (not e!264202))))

(assert (=> b!450972 (= res!268488 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8054))))

(declare-fun b!450973 () Bool)

(declare-fun res!268485 () Bool)

(assert (=> b!450973 (=> (not res!268485) (not e!264202))))

(assert (=> b!450973 (= res!268485 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13775 _keys!709))))))

(declare-fun bm!29801 () Bool)

(assert (=> bm!29801 (= call!29803 (getCurrentListMapNoExtraKeys!1652 (ite c!56012 _keys!709 lt!204760) (ite c!56012 _values!549 lt!204764) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450974 () Bool)

(assert (=> b!450974 (= e!264209 (and e!264208 mapRes!19746))))

(declare-fun condMapEmpty!19746 () Bool)

(declare-fun mapDefault!19746 () ValueCell!5694)

(assert (=> b!450974 (= condMapEmpty!19746 (= (arr!13424 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5694)) mapDefault!19746)))))

(declare-fun b!450975 () Bool)

(declare-fun res!268486 () Bool)

(assert (=> b!450975 (=> (not res!268486) (not e!264205))))

(assert (=> b!450975 (= res!268486 (bvsle from!863 i!563))))

(declare-fun b!450976 () Bool)

(declare-fun res!268479 () Bool)

(assert (=> b!450976 (=> (not res!268479) (not e!264202))))

(assert (=> b!450976 (= res!268479 (validKeyInArray!0 k0!794))))

(declare-fun b!450977 () Bool)

(declare-fun res!268476 () Bool)

(assert (=> b!450977 (=> (not res!268476) (not e!264202))))

(assert (=> b!450977 (= res!268476 (or (= (select (arr!13423 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13423 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!450978 () Bool)

(declare-fun +!1548 (ListLongMap!6905 tuple2!7992) ListLongMap!6905)

(assert (=> b!450978 (= e!264201 (= call!29804 (+!1548 call!29803 (tuple2!7993 k0!794 v!412))))))

(declare-fun b!450979 () Bool)

(declare-fun res!268475 () Bool)

(assert (=> b!450979 (=> (not res!268475) (not e!264202))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!450979 (= res!268475 (validMask!0 mask!1025))))

(assert (= (and start!40726 res!268481) b!450979))

(assert (= (and b!450979 res!268475) b!450967))

(assert (= (and b!450967 res!268482) b!450963))

(assert (= (and b!450963 res!268483) b!450972))

(assert (= (and b!450972 res!268488) b!450973))

(assert (= (and b!450973 res!268485) b!450976))

(assert (= (and b!450976 res!268479) b!450977))

(assert (= (and b!450977 res!268476) b!450966))

(assert (= (and b!450966 res!268477) b!450965))

(assert (= (and b!450965 res!268484) b!450961))

(assert (= (and b!450961 res!268480) b!450975))

(assert (= (and b!450975 res!268486) b!450962))

(assert (= (and b!450962 res!268478) b!450968))

(assert (= (and b!450968 c!56012) b!450978))

(assert (= (and b!450968 (not c!56012)) b!450970))

(assert (= (or b!450978 b!450970) bm!29800))

(assert (= (or b!450978 b!450970) bm!29801))

(assert (= (and b!450968 (not res!268487)) b!450971))

(assert (= (and b!450974 condMapEmpty!19746) mapIsEmpty!19746))

(assert (= (and b!450974 (not condMapEmpty!19746)) mapNonEmpty!19746))

(get-info :version)

(assert (= (and mapNonEmpty!19746 ((_ is ValueCellFull!5694) mapValue!19746)) b!450964))

(assert (= (and b!450974 ((_ is ValueCellFull!5694) mapDefault!19746)) b!450969))

(assert (= start!40726 b!450974))

(declare-fun m!434733 () Bool)

(assert (=> b!450976 m!434733))

(declare-fun m!434735 () Bool)

(assert (=> b!450961 m!434735))

(declare-fun m!434737 () Bool)

(assert (=> bm!29801 m!434737))

(declare-fun m!434739 () Bool)

(assert (=> b!450968 m!434739))

(assert (=> b!450968 m!434739))

(declare-fun m!434741 () Bool)

(assert (=> b!450968 m!434741))

(declare-fun m!434743 () Bool)

(assert (=> b!450968 m!434743))

(declare-fun m!434745 () Bool)

(assert (=> b!450965 m!434745))

(declare-fun m!434747 () Bool)

(assert (=> b!450965 m!434747))

(declare-fun m!434749 () Bool)

(assert (=> b!450978 m!434749))

(declare-fun m!434751 () Bool)

(assert (=> b!450972 m!434751))

(declare-fun m!434753 () Bool)

(assert (=> b!450977 m!434753))

(declare-fun m!434755 () Bool)

(assert (=> b!450971 m!434755))

(declare-fun m!434757 () Bool)

(assert (=> b!450979 m!434757))

(declare-fun m!434759 () Bool)

(assert (=> bm!29800 m!434759))

(declare-fun m!434761 () Bool)

(assert (=> b!450966 m!434761))

(declare-fun m!434763 () Bool)

(assert (=> b!450963 m!434763))

(declare-fun m!434765 () Bool)

(assert (=> start!40726 m!434765))

(declare-fun m!434767 () Bool)

(assert (=> start!40726 m!434767))

(declare-fun m!434769 () Bool)

(assert (=> mapNonEmpty!19746 m!434769))

(declare-fun m!434771 () Bool)

(assert (=> b!450962 m!434771))

(declare-fun m!434773 () Bool)

(assert (=> b!450962 m!434773))

(declare-fun m!434775 () Bool)

(assert (=> b!450962 m!434775))

(check-sat (not mapNonEmpty!19746) (not b!450978) (not b!450979) (not b!450968) (not start!40726) (not b!450976) (not bm!29800) (not bm!29801) tp_is_empty!12075 (not b!450972) (not b!450971) (not b!450961) (not b!450965) b_and!18745 (not b!450962) (not b!450963) (not b_next!10737) (not b!450966))
(check-sat b_and!18745 (not b_next!10737))
