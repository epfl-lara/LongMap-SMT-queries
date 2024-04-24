; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20764 () Bool)

(assert start!20764)

(declare-fun b_free!5419 () Bool)

(declare-fun b_next!5419 () Bool)

(assert (=> start!20764 (= b_free!5419 (not b_next!5419))))

(declare-fun tp!19289 () Bool)

(declare-fun b_and!12179 () Bool)

(assert (=> start!20764 (= tp!19289 b_and!12179)))

(declare-fun b!207943 () Bool)

(declare-fun res!101047 () Bool)

(declare-fun e!135683 () Bool)

(assert (=> b!207943 (=> (not res!101047) (not e!135683))))

(declare-datatypes ((array!9751 0))(
  ( (array!9752 (arr!4626 (Array (_ BitVec 32) (_ BitVec 64))) (size!4951 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9751)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6681 0))(
  ( (V!6682 (val!2682 Int)) )
))
(declare-datatypes ((ValueCell!2294 0))(
  ( (ValueCellFull!2294 (v!4653 V!6681)) (EmptyCell!2294) )
))
(declare-datatypes ((array!9753 0))(
  ( (array!9754 (arr!4627 (Array (_ BitVec 32) ValueCell!2294)) (size!4952 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9753)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!207943 (= res!101047 (and (= (size!4952 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4951 _keys!825) (size!4952 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!8981 () Bool)

(declare-fun mapRes!8981 () Bool)

(declare-fun tp!19288 () Bool)

(declare-fun e!135680 () Bool)

(assert (=> mapNonEmpty!8981 (= mapRes!8981 (and tp!19288 e!135680))))

(declare-fun mapValue!8981 () ValueCell!2294)

(declare-fun mapKey!8981 () (_ BitVec 32))

(declare-fun mapRest!8981 () (Array (_ BitVec 32) ValueCell!2294))

(assert (=> mapNonEmpty!8981 (= (arr!4627 _values!649) (store mapRest!8981 mapKey!8981 mapValue!8981))))

(declare-fun b!207944 () Bool)

(assert (=> b!207944 (= e!135683 (not true))))

(declare-datatypes ((tuple2!4010 0))(
  ( (tuple2!4011 (_1!2016 (_ BitVec 64)) (_2!2016 V!6681)) )
))
(declare-datatypes ((List!2899 0))(
  ( (Nil!2896) (Cons!2895 (h!3537 tuple2!4010) (t!7822 List!2899)) )
))
(declare-datatypes ((ListLongMap!2925 0))(
  ( (ListLongMap!2926 (toList!1478 List!2899)) )
))
(declare-fun lt!106658 () ListLongMap!2925)

(declare-fun zeroValue!615 () V!6681)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6681)

(declare-fun getCurrentListMap!1048 (array!9751 array!9753 (_ BitVec 32) (_ BitVec 32) V!6681 V!6681 (_ BitVec 32) Int) ListLongMap!2925)

(assert (=> b!207944 (= lt!106658 (getCurrentListMap!1048 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106661 () array!9753)

(declare-fun lt!106659 () ListLongMap!2925)

(assert (=> b!207944 (= lt!106659 (getCurrentListMap!1048 _keys!825 lt!106661 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106662 () ListLongMap!2925)

(declare-fun lt!106664 () ListLongMap!2925)

(assert (=> b!207944 (and (= lt!106662 lt!106664) (= lt!106664 lt!106662))))

(declare-fun lt!106663 () ListLongMap!2925)

(declare-fun v!520 () V!6681)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun +!532 (ListLongMap!2925 tuple2!4010) ListLongMap!2925)

(assert (=> b!207944 (= lt!106664 (+!532 lt!106663 (tuple2!4011 k0!843 v!520)))))

(declare-datatypes ((Unit!6340 0))(
  ( (Unit!6341) )
))
(declare-fun lt!106660 () Unit!6340)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!184 (array!9751 array!9753 (_ BitVec 32) (_ BitVec 32) V!6681 V!6681 (_ BitVec 32) (_ BitVec 64) V!6681 (_ BitVec 32) Int) Unit!6340)

(assert (=> b!207944 (= lt!106660 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!184 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!441 (array!9751 array!9753 (_ BitVec 32) (_ BitVec 32) V!6681 V!6681 (_ BitVec 32) Int) ListLongMap!2925)

(assert (=> b!207944 (= lt!106662 (getCurrentListMapNoExtraKeys!441 _keys!825 lt!106661 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!207944 (= lt!106661 (array!9754 (store (arr!4627 _values!649) i!601 (ValueCellFull!2294 v!520)) (size!4952 _values!649)))))

(assert (=> b!207944 (= lt!106663 (getCurrentListMapNoExtraKeys!441 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!207945 () Bool)

(declare-fun res!101053 () Bool)

(assert (=> b!207945 (=> (not res!101053) (not e!135683))))

(declare-datatypes ((List!2900 0))(
  ( (Nil!2897) (Cons!2896 (h!3538 (_ BitVec 64)) (t!7823 List!2900)) )
))
(declare-fun arrayNoDuplicates!0 (array!9751 (_ BitVec 32) List!2900) Bool)

(assert (=> b!207945 (= res!101053 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2897))))

(declare-fun b!207946 () Bool)

(declare-fun tp_is_empty!5275 () Bool)

(assert (=> b!207946 (= e!135680 tp_is_empty!5275)))

(declare-fun res!101051 () Bool)

(assert (=> start!20764 (=> (not res!101051) (not e!135683))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20764 (= res!101051 (validMask!0 mask!1149))))

(assert (=> start!20764 e!135683))

(declare-fun e!135682 () Bool)

(declare-fun array_inv!3031 (array!9753) Bool)

(assert (=> start!20764 (and (array_inv!3031 _values!649) e!135682)))

(assert (=> start!20764 true))

(assert (=> start!20764 tp_is_empty!5275))

(declare-fun array_inv!3032 (array!9751) Bool)

(assert (=> start!20764 (array_inv!3032 _keys!825)))

(assert (=> start!20764 tp!19289))

(declare-fun b!207947 () Bool)

(declare-fun res!101049 () Bool)

(assert (=> b!207947 (=> (not res!101049) (not e!135683))))

(assert (=> b!207947 (= res!101049 (= (select (arr!4626 _keys!825) i!601) k0!843))))

(declare-fun b!207948 () Bool)

(declare-fun e!135681 () Bool)

(assert (=> b!207948 (= e!135682 (and e!135681 mapRes!8981))))

(declare-fun condMapEmpty!8981 () Bool)

(declare-fun mapDefault!8981 () ValueCell!2294)

(assert (=> b!207948 (= condMapEmpty!8981 (= (arr!4627 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2294)) mapDefault!8981)))))

(declare-fun b!207949 () Bool)

(assert (=> b!207949 (= e!135681 tp_is_empty!5275)))

(declare-fun b!207950 () Bool)

(declare-fun res!101052 () Bool)

(assert (=> b!207950 (=> (not res!101052) (not e!135683))))

(assert (=> b!207950 (= res!101052 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4951 _keys!825))))))

(declare-fun mapIsEmpty!8981 () Bool)

(assert (=> mapIsEmpty!8981 mapRes!8981))

(declare-fun b!207951 () Bool)

(declare-fun res!101050 () Bool)

(assert (=> b!207951 (=> (not res!101050) (not e!135683))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!207951 (= res!101050 (validKeyInArray!0 k0!843))))

(declare-fun b!207952 () Bool)

(declare-fun res!101048 () Bool)

(assert (=> b!207952 (=> (not res!101048) (not e!135683))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9751 (_ BitVec 32)) Bool)

(assert (=> b!207952 (= res!101048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(assert (= (and start!20764 res!101051) b!207943))

(assert (= (and b!207943 res!101047) b!207952))

(assert (= (and b!207952 res!101048) b!207945))

(assert (= (and b!207945 res!101053) b!207950))

(assert (= (and b!207950 res!101052) b!207951))

(assert (= (and b!207951 res!101050) b!207947))

(assert (= (and b!207947 res!101049) b!207944))

(assert (= (and b!207948 condMapEmpty!8981) mapIsEmpty!8981))

(assert (= (and b!207948 (not condMapEmpty!8981)) mapNonEmpty!8981))

(get-info :version)

(assert (= (and mapNonEmpty!8981 ((_ is ValueCellFull!2294) mapValue!8981)) b!207946))

(assert (= (and b!207948 ((_ is ValueCellFull!2294) mapDefault!8981)) b!207949))

(assert (= start!20764 b!207948))

(declare-fun m!235821 () Bool)

(assert (=> b!207944 m!235821))

(declare-fun m!235823 () Bool)

(assert (=> b!207944 m!235823))

(declare-fun m!235825 () Bool)

(assert (=> b!207944 m!235825))

(declare-fun m!235827 () Bool)

(assert (=> b!207944 m!235827))

(declare-fun m!235829 () Bool)

(assert (=> b!207944 m!235829))

(declare-fun m!235831 () Bool)

(assert (=> b!207944 m!235831))

(declare-fun m!235833 () Bool)

(assert (=> b!207944 m!235833))

(declare-fun m!235835 () Bool)

(assert (=> b!207947 m!235835))

(declare-fun m!235837 () Bool)

(assert (=> b!207945 m!235837))

(declare-fun m!235839 () Bool)

(assert (=> mapNonEmpty!8981 m!235839))

(declare-fun m!235841 () Bool)

(assert (=> b!207952 m!235841))

(declare-fun m!235843 () Bool)

(assert (=> b!207951 m!235843))

(declare-fun m!235845 () Bool)

(assert (=> start!20764 m!235845))

(declare-fun m!235847 () Bool)

(assert (=> start!20764 m!235847))

(declare-fun m!235849 () Bool)

(assert (=> start!20764 m!235849))

(check-sat (not b!207945) (not start!20764) (not mapNonEmpty!8981) (not b!207951) b_and!12179 (not b!207952) tp_is_empty!5275 (not b!207944) (not b_next!5419))
(check-sat b_and!12179 (not b_next!5419))
