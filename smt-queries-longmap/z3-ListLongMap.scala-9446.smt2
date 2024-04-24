; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112508 () Bool)

(assert start!112508)

(declare-fun b_free!30679 () Bool)

(declare-fun b_next!30679 () Bool)

(assert (=> start!112508 (= b_free!30679 (not b_next!30679))))

(declare-fun tp!107673 () Bool)

(declare-fun b_and!49415 () Bool)

(assert (=> start!112508 (= tp!107673 b_and!49415)))

(declare-fun b!1331762 () Bool)

(declare-fun res!883346 () Bool)

(declare-fun e!759138 () Bool)

(assert (=> b!1331762 (=> (not res!883346) (not e!759138))))

(declare-datatypes ((V!53889 0))(
  ( (V!53890 (val!18369 Int)) )
))
(declare-datatypes ((ValueCell!17396 0))(
  ( (ValueCellFull!17396 (v!21001 V!53889)) (EmptyCell!17396) )
))
(declare-datatypes ((array!90173 0))(
  ( (array!90174 (arr!43548 (Array (_ BitVec 32) ValueCell!17396)) (size!44099 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90173)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90175 0))(
  ( (array!90176 (arr!43549 (Array (_ BitVec 32) (_ BitVec 64))) (size!44100 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90175)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!53889)

(declare-fun zeroValue!1262 () V!53889)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23690 0))(
  ( (tuple2!23691 (_1!11856 (_ BitVec 64)) (_2!11856 V!53889)) )
))
(declare-datatypes ((List!30858 0))(
  ( (Nil!30855) (Cons!30854 (h!32072 tuple2!23690) (t!44942 List!30858)) )
))
(declare-datatypes ((ListLongMap!21355 0))(
  ( (ListLongMap!21356 (toList!10693 List!30858)) )
))
(declare-fun contains!8869 (ListLongMap!21355 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5664 (array!90175 array!90173 (_ BitVec 32) (_ BitVec 32) V!53889 V!53889 (_ BitVec 32) Int) ListLongMap!21355)

(assert (=> b!1331762 (= res!883346 (contains!8869 (getCurrentListMap!5664 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1331763 () Bool)

(declare-fun res!883344 () Bool)

(assert (=> b!1331763 (=> (not res!883344) (not e!759138))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90175 (_ BitVec 32)) Bool)

(assert (=> b!1331763 (= res!883344 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapNonEmpty!56557 () Bool)

(declare-fun mapRes!56557 () Bool)

(declare-fun tp!107674 () Bool)

(declare-fun e!759137 () Bool)

(assert (=> mapNonEmpty!56557 (= mapRes!56557 (and tp!107674 e!759137))))

(declare-fun mapRest!56557 () (Array (_ BitVec 32) ValueCell!17396))

(declare-fun mapKey!56557 () (_ BitVec 32))

(declare-fun mapValue!56557 () ValueCell!17396)

(assert (=> mapNonEmpty!56557 (= (arr!43548 _values!1320) (store mapRest!56557 mapKey!56557 mapValue!56557))))

(declare-fun b!1331764 () Bool)

(assert (=> b!1331764 (= e!759138 (not true))))

(declare-fun lt!591627 () ListLongMap!21355)

(assert (=> b!1331764 (contains!8869 lt!591627 k0!1153)))

(declare-fun lt!591628 () V!53889)

(declare-datatypes ((Unit!43728 0))(
  ( (Unit!43729) )
))
(declare-fun lt!591630 () Unit!43728)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!252 ((_ BitVec 64) (_ BitVec 64) V!53889 ListLongMap!21355) Unit!43728)

(assert (=> b!1331764 (= lt!591630 (lemmaInListMapAfterAddingDiffThenInBefore!252 k0!1153 (select (arr!43549 _keys!1590) from!1980) lt!591628 lt!591627))))

(declare-fun lt!591626 () ListLongMap!21355)

(assert (=> b!1331764 (contains!8869 lt!591626 k0!1153)))

(declare-fun lt!591629 () Unit!43728)

(assert (=> b!1331764 (= lt!591629 (lemmaInListMapAfterAddingDiffThenInBefore!252 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591626))))

(declare-fun +!4709 (ListLongMap!21355 tuple2!23690) ListLongMap!21355)

(assert (=> b!1331764 (= lt!591626 (+!4709 lt!591627 (tuple2!23691 (select (arr!43549 _keys!1590) from!1980) lt!591628)))))

(declare-fun get!21968 (ValueCell!17396 V!53889) V!53889)

(declare-fun dynLambda!3663 (Int (_ BitVec 64)) V!53889)

(assert (=> b!1331764 (= lt!591628 (get!21968 (select (arr!43548 _values!1320) from!1980) (dynLambda!3663 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6353 (array!90175 array!90173 (_ BitVec 32) (_ BitVec 32) V!53889 V!53889 (_ BitVec 32) Int) ListLongMap!21355)

(assert (=> b!1331764 (= lt!591627 (getCurrentListMapNoExtraKeys!6353 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1331765 () Bool)

(declare-fun res!883345 () Bool)

(assert (=> b!1331765 (=> (not res!883345) (not e!759138))))

(assert (=> b!1331765 (= res!883345 (and (= (size!44099 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44100 _keys!1590) (size!44099 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1331766 () Bool)

(declare-fun tp_is_empty!36589 () Bool)

(assert (=> b!1331766 (= e!759137 tp_is_empty!36589)))

(declare-fun b!1331767 () Bool)

(declare-fun res!883347 () Bool)

(assert (=> b!1331767 (=> (not res!883347) (not e!759138))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1331767 (= res!883347 (validKeyInArray!0 (select (arr!43549 _keys!1590) from!1980)))))

(declare-fun res!883343 () Bool)

(assert (=> start!112508 (=> (not res!883343) (not e!759138))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112508 (= res!883343 (validMask!0 mask!1998))))

(assert (=> start!112508 e!759138))

(declare-fun e!759136 () Bool)

(declare-fun array_inv!33133 (array!90173) Bool)

(assert (=> start!112508 (and (array_inv!33133 _values!1320) e!759136)))

(assert (=> start!112508 true))

(declare-fun array_inv!33134 (array!90175) Bool)

(assert (=> start!112508 (array_inv!33134 _keys!1590)))

(assert (=> start!112508 tp!107673))

(assert (=> start!112508 tp_is_empty!36589))

(declare-fun b!1331768 () Bool)

(declare-fun res!883349 () Bool)

(assert (=> b!1331768 (=> (not res!883349) (not e!759138))))

(assert (=> b!1331768 (= res!883349 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1331769 () Bool)

(declare-fun res!883342 () Bool)

(assert (=> b!1331769 (=> (not res!883342) (not e!759138))))

(declare-datatypes ((List!30859 0))(
  ( (Nil!30856) (Cons!30855 (h!32073 (_ BitVec 64)) (t!44943 List!30859)) )
))
(declare-fun arrayNoDuplicates!0 (array!90175 (_ BitVec 32) List!30859) Bool)

(assert (=> b!1331769 (= res!883342 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30856))))

(declare-fun b!1331770 () Bool)

(declare-fun e!759135 () Bool)

(assert (=> b!1331770 (= e!759136 (and e!759135 mapRes!56557))))

(declare-fun condMapEmpty!56557 () Bool)

(declare-fun mapDefault!56557 () ValueCell!17396)

(assert (=> b!1331770 (= condMapEmpty!56557 (= (arr!43548 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17396)) mapDefault!56557)))))

(declare-fun b!1331771 () Bool)

(declare-fun res!883341 () Bool)

(assert (=> b!1331771 (=> (not res!883341) (not e!759138))))

(assert (=> b!1331771 (= res!883341 (not (= (select (arr!43549 _keys!1590) from!1980) k0!1153)))))

(declare-fun mapIsEmpty!56557 () Bool)

(assert (=> mapIsEmpty!56557 mapRes!56557))

(declare-fun b!1331772 () Bool)

(assert (=> b!1331772 (= e!759135 tp_is_empty!36589)))

(declare-fun b!1331773 () Bool)

(declare-fun res!883348 () Bool)

(assert (=> b!1331773 (=> (not res!883348) (not e!759138))))

(assert (=> b!1331773 (= res!883348 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44100 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!112508 res!883343) b!1331765))

(assert (= (and b!1331765 res!883345) b!1331763))

(assert (= (and b!1331763 res!883344) b!1331769))

(assert (= (and b!1331769 res!883342) b!1331773))

(assert (= (and b!1331773 res!883348) b!1331762))

(assert (= (and b!1331762 res!883346) b!1331771))

(assert (= (and b!1331771 res!883341) b!1331767))

(assert (= (and b!1331767 res!883347) b!1331768))

(assert (= (and b!1331768 res!883349) b!1331764))

(assert (= (and b!1331770 condMapEmpty!56557) mapIsEmpty!56557))

(assert (= (and b!1331770 (not condMapEmpty!56557)) mapNonEmpty!56557))

(get-info :version)

(assert (= (and mapNonEmpty!56557 ((_ is ValueCellFull!17396) mapValue!56557)) b!1331766))

(assert (= (and b!1331770 ((_ is ValueCellFull!17396) mapDefault!56557)) b!1331772))

(assert (= start!112508 b!1331770))

(declare-fun b_lambda!23933 () Bool)

(assert (=> (not b_lambda!23933) (not b!1331764)))

(declare-fun t!44941 () Bool)

(declare-fun tb!11887 () Bool)

(assert (=> (and start!112508 (= defaultEntry!1323 defaultEntry!1323) t!44941) tb!11887))

(declare-fun result!24853 () Bool)

(assert (=> tb!11887 (= result!24853 tp_is_empty!36589)))

(assert (=> b!1331764 t!44941))

(declare-fun b_and!49417 () Bool)

(assert (= b_and!49415 (and (=> t!44941 result!24853) b_and!49417)))

(declare-fun m!1220723 () Bool)

(assert (=> b!1331767 m!1220723))

(assert (=> b!1331767 m!1220723))

(declare-fun m!1220725 () Bool)

(assert (=> b!1331767 m!1220725))

(declare-fun m!1220727 () Bool)

(assert (=> b!1331763 m!1220727))

(declare-fun m!1220729 () Bool)

(assert (=> mapNonEmpty!56557 m!1220729))

(declare-fun m!1220731 () Bool)

(assert (=> b!1331769 m!1220731))

(declare-fun m!1220733 () Bool)

(assert (=> start!112508 m!1220733))

(declare-fun m!1220735 () Bool)

(assert (=> start!112508 m!1220735))

(declare-fun m!1220737 () Bool)

(assert (=> start!112508 m!1220737))

(assert (=> b!1331764 m!1220723))

(declare-fun m!1220739 () Bool)

(assert (=> b!1331764 m!1220739))

(declare-fun m!1220741 () Bool)

(assert (=> b!1331764 m!1220741))

(declare-fun m!1220743 () Bool)

(assert (=> b!1331764 m!1220743))

(assert (=> b!1331764 m!1220741))

(declare-fun m!1220745 () Bool)

(assert (=> b!1331764 m!1220745))

(assert (=> b!1331764 m!1220743))

(declare-fun m!1220747 () Bool)

(assert (=> b!1331764 m!1220747))

(assert (=> b!1331764 m!1220723))

(declare-fun m!1220749 () Bool)

(assert (=> b!1331764 m!1220749))

(declare-fun m!1220751 () Bool)

(assert (=> b!1331764 m!1220751))

(declare-fun m!1220753 () Bool)

(assert (=> b!1331764 m!1220753))

(declare-fun m!1220755 () Bool)

(assert (=> b!1331764 m!1220755))

(declare-fun m!1220757 () Bool)

(assert (=> b!1331762 m!1220757))

(assert (=> b!1331762 m!1220757))

(declare-fun m!1220759 () Bool)

(assert (=> b!1331762 m!1220759))

(assert (=> b!1331771 m!1220723))

(check-sat (not b!1331767) tp_is_empty!36589 (not b!1331764) b_and!49417 (not b_next!30679) (not mapNonEmpty!56557) (not b_lambda!23933) (not b!1331763) (not start!112508) (not b!1331762) (not b!1331769))
(check-sat b_and!49417 (not b_next!30679))
