; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20636 () Bool)

(assert start!20636)

(declare-fun b_free!5295 () Bool)

(declare-fun b_next!5295 () Bool)

(assert (=> start!20636 (= b_free!5295 (not b_next!5295))))

(declare-fun tp!18916 () Bool)

(declare-fun b_and!12041 () Bool)

(assert (=> start!20636 (= tp!18916 b_and!12041)))

(declare-fun b!205956 () Bool)

(declare-fun e!134651 () Bool)

(declare-fun e!134648 () Bool)

(assert (=> b!205956 (= e!134651 (not e!134648))))

(declare-fun res!99644 () Bool)

(assert (=> b!205956 (=> res!99644 e!134648)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!205956 (= res!99644 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6515 0))(
  ( (V!6516 (val!2620 Int)) )
))
(declare-datatypes ((ValueCell!2232 0))(
  ( (ValueCellFull!2232 (v!4590 V!6515)) (EmptyCell!2232) )
))
(declare-datatypes ((array!9513 0))(
  ( (array!9514 (arr!4507 (Array (_ BitVec 32) ValueCell!2232)) (size!4832 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9513)

(declare-datatypes ((array!9515 0))(
  ( (array!9516 (arr!4508 (Array (_ BitVec 32) (_ BitVec 64))) (size!4833 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9515)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6515)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((tuple2!3976 0))(
  ( (tuple2!3977 (_1!1999 (_ BitVec 64)) (_2!1999 V!6515)) )
))
(declare-datatypes ((List!2869 0))(
  ( (Nil!2866) (Cons!2865 (h!3507 tuple2!3976) (t!7800 List!2869)) )
))
(declare-datatypes ((ListLongMap!2889 0))(
  ( (ListLongMap!2890 (toList!1460 List!2869)) )
))
(declare-fun lt!105088 () ListLongMap!2889)

(declare-fun zeroValue!615 () V!6515)

(declare-fun getCurrentListMap!1030 (array!9515 array!9513 (_ BitVec 32) (_ BitVec 32) V!6515 V!6515 (_ BitVec 32) Int) ListLongMap!2889)

(assert (=> b!205956 (= lt!105088 (getCurrentListMap!1030 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105090 () array!9513)

(declare-fun lt!105097 () ListLongMap!2889)

(assert (=> b!205956 (= lt!105097 (getCurrentListMap!1030 _keys!825 lt!105090 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105096 () ListLongMap!2889)

(declare-fun lt!105092 () ListLongMap!2889)

(assert (=> b!205956 (and (= lt!105096 lt!105092) (= lt!105092 lt!105096))))

(declare-fun lt!105098 () ListLongMap!2889)

(declare-fun lt!105089 () tuple2!3976)

(declare-fun +!487 (ListLongMap!2889 tuple2!3976) ListLongMap!2889)

(assert (=> b!205956 (= lt!105092 (+!487 lt!105098 lt!105089))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6515)

(assert (=> b!205956 (= lt!105089 (tuple2!3977 k0!843 v!520))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((Unit!6264 0))(
  ( (Unit!6265) )
))
(declare-fun lt!105094 () Unit!6264)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!143 (array!9515 array!9513 (_ BitVec 32) (_ BitVec 32) V!6515 V!6515 (_ BitVec 32) (_ BitVec 64) V!6515 (_ BitVec 32) Int) Unit!6264)

(assert (=> b!205956 (= lt!105094 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!143 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!404 (array!9515 array!9513 (_ BitVec 32) (_ BitVec 32) V!6515 V!6515 (_ BitVec 32) Int) ListLongMap!2889)

(assert (=> b!205956 (= lt!105096 (getCurrentListMapNoExtraKeys!404 _keys!825 lt!105090 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205956 (= lt!105090 (array!9514 (store (arr!4507 _values!649) i!601 (ValueCellFull!2232 v!520)) (size!4832 _values!649)))))

(assert (=> b!205956 (= lt!105098 (getCurrentListMapNoExtraKeys!404 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun res!99646 () Bool)

(assert (=> start!20636 (=> (not res!99646) (not e!134651))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20636 (= res!99646 (validMask!0 mask!1149))))

(assert (=> start!20636 e!134651))

(declare-fun e!134645 () Bool)

(declare-fun array_inv!2979 (array!9513) Bool)

(assert (=> start!20636 (and (array_inv!2979 _values!649) e!134645)))

(assert (=> start!20636 true))

(declare-fun tp_is_empty!5151 () Bool)

(assert (=> start!20636 tp_is_empty!5151))

(declare-fun array_inv!2980 (array!9515) Bool)

(assert (=> start!20636 (array_inv!2980 _keys!825)))

(assert (=> start!20636 tp!18916))

(declare-fun b!205957 () Bool)

(declare-fun res!99645 () Bool)

(assert (=> b!205957 (=> (not res!99645) (not e!134651))))

(declare-datatypes ((List!2870 0))(
  ( (Nil!2867) (Cons!2866 (h!3508 (_ BitVec 64)) (t!7801 List!2870)) )
))
(declare-fun arrayNoDuplicates!0 (array!9515 (_ BitVec 32) List!2870) Bool)

(assert (=> b!205957 (= res!99645 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2867))))

(declare-fun b!205958 () Bool)

(declare-fun res!99647 () Bool)

(assert (=> b!205958 (=> (not res!99647) (not e!134651))))

(assert (=> b!205958 (= res!99647 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4833 _keys!825))))))

(declare-fun b!205959 () Bool)

(declare-fun res!99649 () Bool)

(assert (=> b!205959 (=> (not res!99649) (not e!134651))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!205959 (= res!99649 (validKeyInArray!0 k0!843))))

(declare-fun b!205960 () Bool)

(declare-fun res!99651 () Bool)

(assert (=> b!205960 (=> (not res!99651) (not e!134651))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9515 (_ BitVec 32)) Bool)

(assert (=> b!205960 (= res!99651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!205961 () Bool)

(declare-fun e!134649 () Bool)

(declare-fun mapRes!8795 () Bool)

(assert (=> b!205961 (= e!134645 (and e!134649 mapRes!8795))))

(declare-fun condMapEmpty!8795 () Bool)

(declare-fun mapDefault!8795 () ValueCell!2232)

(assert (=> b!205961 (= condMapEmpty!8795 (= (arr!4507 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2232)) mapDefault!8795)))))

(declare-fun b!205962 () Bool)

(declare-fun res!99650 () Bool)

(assert (=> b!205962 (=> (not res!99650) (not e!134651))))

(assert (=> b!205962 (= res!99650 (and (= (size!4832 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4833 _keys!825) (size!4832 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!8795 () Bool)

(assert (=> mapIsEmpty!8795 mapRes!8795))

(declare-fun b!205963 () Bool)

(declare-fun e!134646 () Bool)

(assert (=> b!205963 (= e!134648 e!134646)))

(declare-fun res!99648 () Bool)

(assert (=> b!205963 (=> res!99648 e!134646)))

(assert (=> b!205963 (= res!99648 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!105091 () ListLongMap!2889)

(assert (=> b!205963 (= lt!105088 lt!105091)))

(declare-fun lt!105095 () tuple2!3976)

(assert (=> b!205963 (= lt!105091 (+!487 lt!105098 lt!105095))))

(declare-fun lt!105099 () ListLongMap!2889)

(assert (=> b!205963 (= lt!105097 lt!105099)))

(assert (=> b!205963 (= lt!105099 (+!487 lt!105092 lt!105095))))

(assert (=> b!205963 (= lt!105097 (+!487 lt!105096 lt!105095))))

(assert (=> b!205963 (= lt!105095 (tuple2!3977 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205964 () Bool)

(declare-fun res!99652 () Bool)

(assert (=> b!205964 (=> (not res!99652) (not e!134651))))

(assert (=> b!205964 (= res!99652 (= (select (arr!4508 _keys!825) i!601) k0!843))))

(declare-fun mapNonEmpty!8795 () Bool)

(declare-fun tp!18917 () Bool)

(declare-fun e!134650 () Bool)

(assert (=> mapNonEmpty!8795 (= mapRes!8795 (and tp!18917 e!134650))))

(declare-fun mapValue!8795 () ValueCell!2232)

(declare-fun mapRest!8795 () (Array (_ BitVec 32) ValueCell!2232))

(declare-fun mapKey!8795 () (_ BitVec 32))

(assert (=> mapNonEmpty!8795 (= (arr!4507 _values!649) (store mapRest!8795 mapKey!8795 mapValue!8795))))

(declare-fun b!205965 () Bool)

(assert (=> b!205965 (= e!134650 tp_is_empty!5151)))

(declare-fun b!205966 () Bool)

(assert (=> b!205966 (= e!134649 tp_is_empty!5151)))

(declare-fun b!205967 () Bool)

(assert (=> b!205967 (= e!134646 true)))

(assert (=> b!205967 (= lt!105099 (+!487 lt!105091 lt!105089))))

(declare-fun lt!105093 () Unit!6264)

(declare-fun addCommutativeForDiffKeys!186 (ListLongMap!2889 (_ BitVec 64) V!6515 (_ BitVec 64) V!6515) Unit!6264)

(assert (=> b!205967 (= lt!105093 (addCommutativeForDiffKeys!186 lt!105098 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (= (and start!20636 res!99646) b!205962))

(assert (= (and b!205962 res!99650) b!205960))

(assert (= (and b!205960 res!99651) b!205957))

(assert (= (and b!205957 res!99645) b!205958))

(assert (= (and b!205958 res!99647) b!205959))

(assert (= (and b!205959 res!99649) b!205964))

(assert (= (and b!205964 res!99652) b!205956))

(assert (= (and b!205956 (not res!99644)) b!205963))

(assert (= (and b!205963 (not res!99648)) b!205967))

(assert (= (and b!205961 condMapEmpty!8795) mapIsEmpty!8795))

(assert (= (and b!205961 (not condMapEmpty!8795)) mapNonEmpty!8795))

(get-info :version)

(assert (= (and mapNonEmpty!8795 ((_ is ValueCellFull!2232) mapValue!8795)) b!205965))

(assert (= (and b!205961 ((_ is ValueCellFull!2232) mapDefault!8795)) b!205966))

(assert (= start!20636 b!205961))

(declare-fun m!233639 () Bool)

(assert (=> b!205964 m!233639))

(declare-fun m!233641 () Bool)

(assert (=> b!205959 m!233641))

(declare-fun m!233643 () Bool)

(assert (=> b!205957 m!233643))

(declare-fun m!233645 () Bool)

(assert (=> start!20636 m!233645))

(declare-fun m!233647 () Bool)

(assert (=> start!20636 m!233647))

(declare-fun m!233649 () Bool)

(assert (=> start!20636 m!233649))

(declare-fun m!233651 () Bool)

(assert (=> b!205967 m!233651))

(declare-fun m!233653 () Bool)

(assert (=> b!205967 m!233653))

(declare-fun m!233655 () Bool)

(assert (=> b!205956 m!233655))

(declare-fun m!233657 () Bool)

(assert (=> b!205956 m!233657))

(declare-fun m!233659 () Bool)

(assert (=> b!205956 m!233659))

(declare-fun m!233661 () Bool)

(assert (=> b!205956 m!233661))

(declare-fun m!233663 () Bool)

(assert (=> b!205956 m!233663))

(declare-fun m!233665 () Bool)

(assert (=> b!205956 m!233665))

(declare-fun m!233667 () Bool)

(assert (=> b!205956 m!233667))

(declare-fun m!233669 () Bool)

(assert (=> b!205963 m!233669))

(declare-fun m!233671 () Bool)

(assert (=> b!205963 m!233671))

(declare-fun m!233673 () Bool)

(assert (=> b!205963 m!233673))

(declare-fun m!233675 () Bool)

(assert (=> mapNonEmpty!8795 m!233675))

(declare-fun m!233677 () Bool)

(assert (=> b!205960 m!233677))

(check-sat (not b!205963) (not b!205967) (not start!20636) b_and!12041 (not b!205957) (not b!205956) (not b_next!5295) (not b!205960) (not mapNonEmpty!8795) (not b!205959) tp_is_empty!5151)
(check-sat b_and!12041 (not b_next!5295))
