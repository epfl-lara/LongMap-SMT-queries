; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20368 () Bool)

(assert start!20368)

(declare-fun b_free!5023 () Bool)

(declare-fun b_next!5023 () Bool)

(assert (=> start!20368 (= b_free!5023 (not b_next!5023))))

(declare-fun tp!18101 () Bool)

(declare-fun b_and!11783 () Bool)

(assert (=> start!20368 (= tp!18101 b_and!11783)))

(declare-fun b!201089 () Bool)

(declare-fun res!95982 () Bool)

(declare-fun e!131814 () Bool)

(assert (=> b!201089 (=> (not res!95982) (not e!131814))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!201089 (= res!95982 (validKeyInArray!0 k0!843))))

(declare-fun b!201090 () Bool)

(declare-fun res!95976 () Bool)

(assert (=> b!201090 (=> (not res!95976) (not e!131814))))

(declare-datatypes ((array!8981 0))(
  ( (array!8982 (arr!4241 (Array (_ BitVec 32) (_ BitVec 64))) (size!4566 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8981)

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!201090 (= res!95976 (= (select (arr!4241 _keys!825) i!601) k0!843))))

(declare-fun b!201091 () Bool)

(declare-fun e!131815 () Bool)

(declare-fun tp_is_empty!4879 () Bool)

(assert (=> b!201091 (= e!131815 tp_is_empty!4879)))

(declare-fun b!201092 () Bool)

(declare-fun e!131816 () Bool)

(declare-fun e!131813 () Bool)

(declare-fun mapRes!8387 () Bool)

(assert (=> b!201092 (= e!131816 (and e!131813 mapRes!8387))))

(declare-fun condMapEmpty!8387 () Bool)

(declare-datatypes ((V!6153 0))(
  ( (V!6154 (val!2484 Int)) )
))
(declare-datatypes ((ValueCell!2096 0))(
  ( (ValueCellFull!2096 (v!4455 V!6153)) (EmptyCell!2096) )
))
(declare-datatypes ((array!8983 0))(
  ( (array!8984 (arr!4242 (Array (_ BitVec 32) ValueCell!2096)) (size!4567 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8983)

(declare-fun mapDefault!8387 () ValueCell!2096)

(assert (=> b!201092 (= condMapEmpty!8387 (= (arr!4242 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2096)) mapDefault!8387)))))

(declare-fun b!201093 () Bool)

(declare-fun res!95980 () Bool)

(assert (=> b!201093 (=> (not res!95980) (not e!131814))))

(assert (=> b!201093 (= res!95980 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4566 _keys!825))))))

(declare-fun mapNonEmpty!8387 () Bool)

(declare-fun tp!18100 () Bool)

(assert (=> mapNonEmpty!8387 (= mapRes!8387 (and tp!18100 e!131815))))

(declare-fun mapRest!8387 () (Array (_ BitVec 32) ValueCell!2096))

(declare-fun mapValue!8387 () ValueCell!2096)

(declare-fun mapKey!8387 () (_ BitVec 32))

(assert (=> mapNonEmpty!8387 (= (arr!4242 _values!649) (store mapRest!8387 mapKey!8387 mapValue!8387))))

(declare-fun b!201094 () Bool)

(declare-fun res!95981 () Bool)

(assert (=> b!201094 (=> (not res!95981) (not e!131814))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8981 (_ BitVec 32)) Bool)

(assert (=> b!201094 (= res!95981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!201095 () Bool)

(declare-fun e!131818 () Bool)

(assert (=> b!201095 (= e!131818 true)))

(declare-datatypes ((tuple2!3694 0))(
  ( (tuple2!3695 (_1!1858 (_ BitVec 64)) (_2!1858 V!6153)) )
))
(declare-datatypes ((List!2608 0))(
  ( (Nil!2605) (Cons!2604 (h!3246 tuple2!3694) (t!7531 List!2608)) )
))
(declare-datatypes ((ListLongMap!2609 0))(
  ( (ListLongMap!2610 (toList!1320 List!2608)) )
))
(declare-fun lt!99907 () ListLongMap!2609)

(declare-fun lt!99905 () tuple2!3694)

(declare-fun lt!99911 () tuple2!3694)

(declare-fun lt!99909 () ListLongMap!2609)

(declare-fun +!374 (ListLongMap!2609 tuple2!3694) ListLongMap!2609)

(assert (=> b!201095 (= (+!374 lt!99907 lt!99911) (+!374 lt!99909 lt!99905))))

(declare-fun minValue!615 () V!6153)

(declare-fun lt!99903 () ListLongMap!2609)

(declare-fun v!520 () V!6153)

(declare-datatypes ((Unit!6032 0))(
  ( (Unit!6033) )
))
(declare-fun lt!99913 () Unit!6032)

(declare-fun addCommutativeForDiffKeys!98 (ListLongMap!2609 (_ BitVec 64) V!6153 (_ BitVec 64) V!6153) Unit!6032)

(assert (=> b!201095 (= lt!99913 (addCommutativeForDiffKeys!98 lt!99903 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun mapIsEmpty!8387 () Bool)

(assert (=> mapIsEmpty!8387 mapRes!8387))

(declare-fun res!95977 () Bool)

(assert (=> start!20368 (=> (not res!95977) (not e!131814))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20368 (= res!95977 (validMask!0 mask!1149))))

(assert (=> start!20368 e!131814))

(declare-fun array_inv!2767 (array!8983) Bool)

(assert (=> start!20368 (and (array_inv!2767 _values!649) e!131816)))

(assert (=> start!20368 true))

(assert (=> start!20368 tp_is_empty!4879))

(declare-fun array_inv!2768 (array!8981) Bool)

(assert (=> start!20368 (array_inv!2768 _keys!825)))

(assert (=> start!20368 tp!18101))

(declare-fun b!201096 () Bool)

(declare-fun res!95983 () Bool)

(assert (=> b!201096 (=> (not res!95983) (not e!131814))))

(declare-datatypes ((List!2609 0))(
  ( (Nil!2606) (Cons!2605 (h!3247 (_ BitVec 64)) (t!7532 List!2609)) )
))
(declare-fun arrayNoDuplicates!0 (array!8981 (_ BitVec 32) List!2609) Bool)

(assert (=> b!201096 (= res!95983 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2606))))

(declare-fun b!201097 () Bool)

(declare-fun e!131817 () Bool)

(assert (=> b!201097 (= e!131817 e!131818)))

(declare-fun res!95975 () Bool)

(assert (=> b!201097 (=> res!95975 e!131818)))

(assert (=> b!201097 (= res!95975 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!99900 () ListLongMap!2609)

(assert (=> b!201097 (= lt!99900 lt!99907)))

(assert (=> b!201097 (= lt!99907 (+!374 lt!99903 lt!99905))))

(declare-fun lt!99899 () Unit!6032)

(declare-fun zeroValue!615 () V!6153)

(declare-fun lt!99901 () ListLongMap!2609)

(assert (=> b!201097 (= lt!99899 (addCommutativeForDiffKeys!98 lt!99901 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!99904 () ListLongMap!2609)

(assert (=> b!201097 (= lt!99904 (+!374 lt!99900 lt!99911))))

(declare-fun lt!99914 () ListLongMap!2609)

(declare-fun lt!99902 () tuple2!3694)

(assert (=> b!201097 (= lt!99900 (+!374 lt!99914 lt!99902))))

(declare-fun lt!99906 () ListLongMap!2609)

(assert (=> b!201097 (= lt!99906 lt!99909)))

(assert (=> b!201097 (= lt!99909 (+!374 lt!99903 lt!99911))))

(assert (=> b!201097 (= lt!99903 (+!374 lt!99901 lt!99902))))

(declare-fun lt!99908 () ListLongMap!2609)

(assert (=> b!201097 (= lt!99904 (+!374 (+!374 lt!99908 lt!99902) lt!99911))))

(assert (=> b!201097 (= lt!99911 (tuple2!3695 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!201097 (= lt!99902 (tuple2!3695 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!201098 () Bool)

(assert (=> b!201098 (= e!131814 (not e!131817))))

(declare-fun res!95979 () Bool)

(assert (=> b!201098 (=> res!95979 e!131817)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!201098 (= res!95979 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!913 (array!8981 array!8983 (_ BitVec 32) (_ BitVec 32) V!6153 V!6153 (_ BitVec 32) Int) ListLongMap!2609)

(assert (=> b!201098 (= lt!99906 (getCurrentListMap!913 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99910 () array!8983)

(assert (=> b!201098 (= lt!99904 (getCurrentListMap!913 _keys!825 lt!99910 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201098 (and (= lt!99908 lt!99914) (= lt!99914 lt!99908))))

(assert (=> b!201098 (= lt!99914 (+!374 lt!99901 lt!99905))))

(assert (=> b!201098 (= lt!99905 (tuple2!3695 k0!843 v!520))))

(declare-fun lt!99912 () Unit!6032)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!49 (array!8981 array!8983 (_ BitVec 32) (_ BitVec 32) V!6153 V!6153 (_ BitVec 32) (_ BitVec 64) V!6153 (_ BitVec 32) Int) Unit!6032)

(assert (=> b!201098 (= lt!99912 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!49 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!306 (array!8981 array!8983 (_ BitVec 32) (_ BitVec 32) V!6153 V!6153 (_ BitVec 32) Int) ListLongMap!2609)

(assert (=> b!201098 (= lt!99908 (getCurrentListMapNoExtraKeys!306 _keys!825 lt!99910 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201098 (= lt!99910 (array!8984 (store (arr!4242 _values!649) i!601 (ValueCellFull!2096 v!520)) (size!4567 _values!649)))))

(assert (=> b!201098 (= lt!99901 (getCurrentListMapNoExtraKeys!306 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!201099 () Bool)

(assert (=> b!201099 (= e!131813 tp_is_empty!4879)))

(declare-fun b!201100 () Bool)

(declare-fun res!95978 () Bool)

(assert (=> b!201100 (=> (not res!95978) (not e!131814))))

(assert (=> b!201100 (= res!95978 (and (= (size!4567 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4566 _keys!825) (size!4567 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(assert (= (and start!20368 res!95977) b!201100))

(assert (= (and b!201100 res!95978) b!201094))

(assert (= (and b!201094 res!95981) b!201096))

(assert (= (and b!201096 res!95983) b!201093))

(assert (= (and b!201093 res!95980) b!201089))

(assert (= (and b!201089 res!95982) b!201090))

(assert (= (and b!201090 res!95976) b!201098))

(assert (= (and b!201098 (not res!95979)) b!201097))

(assert (= (and b!201097 (not res!95975)) b!201095))

(assert (= (and b!201092 condMapEmpty!8387) mapIsEmpty!8387))

(assert (= (and b!201092 (not condMapEmpty!8387)) mapNonEmpty!8387))

(get-info :version)

(assert (= (and mapNonEmpty!8387 ((_ is ValueCellFull!2096) mapValue!8387)) b!201091))

(assert (= (and b!201092 ((_ is ValueCellFull!2096) mapDefault!8387)) b!201099))

(assert (= start!20368 b!201092))

(declare-fun m!227973 () Bool)

(assert (=> b!201096 m!227973))

(declare-fun m!227975 () Bool)

(assert (=> mapNonEmpty!8387 m!227975))

(declare-fun m!227977 () Bool)

(assert (=> b!201097 m!227977))

(declare-fun m!227979 () Bool)

(assert (=> b!201097 m!227979))

(declare-fun m!227981 () Bool)

(assert (=> b!201097 m!227981))

(declare-fun m!227983 () Bool)

(assert (=> b!201097 m!227983))

(declare-fun m!227985 () Bool)

(assert (=> b!201097 m!227985))

(assert (=> b!201097 m!227979))

(declare-fun m!227987 () Bool)

(assert (=> b!201097 m!227987))

(declare-fun m!227989 () Bool)

(assert (=> b!201097 m!227989))

(declare-fun m!227991 () Bool)

(assert (=> b!201097 m!227991))

(declare-fun m!227993 () Bool)

(assert (=> b!201095 m!227993))

(declare-fun m!227995 () Bool)

(assert (=> b!201095 m!227995))

(declare-fun m!227997 () Bool)

(assert (=> b!201095 m!227997))

(declare-fun m!227999 () Bool)

(assert (=> b!201090 m!227999))

(declare-fun m!228001 () Bool)

(assert (=> b!201089 m!228001))

(declare-fun m!228003 () Bool)

(assert (=> b!201098 m!228003))

(declare-fun m!228005 () Bool)

(assert (=> b!201098 m!228005))

(declare-fun m!228007 () Bool)

(assert (=> b!201098 m!228007))

(declare-fun m!228009 () Bool)

(assert (=> b!201098 m!228009))

(declare-fun m!228011 () Bool)

(assert (=> b!201098 m!228011))

(declare-fun m!228013 () Bool)

(assert (=> b!201098 m!228013))

(declare-fun m!228015 () Bool)

(assert (=> b!201098 m!228015))

(declare-fun m!228017 () Bool)

(assert (=> b!201094 m!228017))

(declare-fun m!228019 () Bool)

(assert (=> start!20368 m!228019))

(declare-fun m!228021 () Bool)

(assert (=> start!20368 m!228021))

(declare-fun m!228023 () Bool)

(assert (=> start!20368 m!228023))

(check-sat (not mapNonEmpty!8387) (not b!201098) (not start!20368) (not b!201095) (not b!201094) b_and!11783 (not b!201089) (not b!201097) (not b!201096) tp_is_empty!4879 (not b_next!5023))
(check-sat b_and!11783 (not b_next!5023))
