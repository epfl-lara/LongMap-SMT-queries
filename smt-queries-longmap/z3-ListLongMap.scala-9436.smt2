; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112224 () Bool)

(assert start!112224)

(declare-fun b_free!30619 () Bool)

(declare-fun b_next!30619 () Bool)

(assert (=> start!112224 (= b_free!30619 (not b_next!30619))))

(declare-fun tp!107494 () Bool)

(declare-fun b_and!49275 () Bool)

(assert (=> start!112224 (= tp!107494 b_and!49275)))

(declare-fun b!1329253 () Bool)

(declare-fun res!881986 () Bool)

(declare-fun e!757813 () Bool)

(assert (=> b!1329253 (=> (not res!881986) (not e!757813))))

(declare-datatypes ((V!53809 0))(
  ( (V!53810 (val!18339 Int)) )
))
(declare-datatypes ((ValueCell!17366 0))(
  ( (ValueCellFull!17366 (v!20975 V!53809)) (EmptyCell!17366) )
))
(declare-datatypes ((array!89885 0))(
  ( (array!89886 (arr!43409 (Array (_ BitVec 32) ValueCell!17366)) (size!43961 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89885)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-datatypes ((array!89887 0))(
  ( (array!89888 (arr!43410 (Array (_ BitVec 32) (_ BitVec 64))) (size!43962 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89887)

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1329253 (= res!881986 (and (= (size!43961 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43962 _keys!1590) (size!43961 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1329254 () Bool)

(declare-fun res!881990 () Bool)

(assert (=> b!1329254 (=> (not res!881990) (not e!757813))))

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!53809)

(declare-fun zeroValue!1262 () V!53809)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-datatypes ((tuple2!23670 0))(
  ( (tuple2!23671 (_1!11846 (_ BitVec 64)) (_2!11846 V!53809)) )
))
(declare-datatypes ((List!30820 0))(
  ( (Nil!30817) (Cons!30816 (h!32025 tuple2!23670) (t!44844 List!30820)) )
))
(declare-datatypes ((ListLongMap!21327 0))(
  ( (ListLongMap!21328 (toList!10679 List!30820)) )
))
(declare-fun contains!8771 (ListLongMap!21327 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5549 (array!89887 array!89885 (_ BitVec 32) (_ BitVec 32) V!53809 V!53809 (_ BitVec 32) Int) ListLongMap!21327)

(assert (=> b!1329254 (= res!881990 (contains!8771 (getCurrentListMap!5549 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun mapIsEmpty!56467 () Bool)

(declare-fun mapRes!56467 () Bool)

(assert (=> mapIsEmpty!56467 mapRes!56467))

(declare-fun b!1329255 () Bool)

(assert (=> b!1329255 (= e!757813 (not true))))

(declare-fun lt!590752 () ListLongMap!21327)

(assert (=> b!1329255 (contains!8771 lt!590752 k0!1153)))

(declare-datatypes ((Unit!43542 0))(
  ( (Unit!43543) )
))
(declare-fun lt!590751 () Unit!43542)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!221 ((_ BitVec 64) (_ BitVec 64) V!53809 ListLongMap!21327) Unit!43542)

(assert (=> b!1329255 (= lt!590751 (lemmaInListMapAfterAddingDiffThenInBefore!221 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!590752))))

(declare-fun +!4665 (ListLongMap!21327 tuple2!23670) ListLongMap!21327)

(declare-fun getCurrentListMapNoExtraKeys!6303 (array!89887 array!89885 (_ BitVec 32) (_ BitVec 32) V!53809 V!53809 (_ BitVec 32) Int) ListLongMap!21327)

(declare-fun get!21868 (ValueCell!17366 V!53809) V!53809)

(declare-fun dynLambda!3595 (Int (_ BitVec 64)) V!53809)

(assert (=> b!1329255 (= lt!590752 (+!4665 (getCurrentListMapNoExtraKeys!6303 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23671 (select (arr!43410 _keys!1590) from!1980) (get!21868 (select (arr!43409 _values!1320) from!1980) (dynLambda!3595 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!881992 () Bool)

(assert (=> start!112224 (=> (not res!881992) (not e!757813))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112224 (= res!881992 (validMask!0 mask!1998))))

(assert (=> start!112224 e!757813))

(declare-fun e!757811 () Bool)

(declare-fun array_inv!32925 (array!89885) Bool)

(assert (=> start!112224 (and (array_inv!32925 _values!1320) e!757811)))

(assert (=> start!112224 true))

(declare-fun array_inv!32926 (array!89887) Bool)

(assert (=> start!112224 (array_inv!32926 _keys!1590)))

(assert (=> start!112224 tp!107494))

(declare-fun tp_is_empty!36529 () Bool)

(assert (=> start!112224 tp_is_empty!36529))

(declare-fun b!1329256 () Bool)

(declare-fun e!757810 () Bool)

(assert (=> b!1329256 (= e!757810 tp_is_empty!36529)))

(declare-fun b!1329257 () Bool)

(declare-fun res!881988 () Bool)

(assert (=> b!1329257 (=> (not res!881988) (not e!757813))))

(assert (=> b!1329257 (= res!881988 (not (= (select (arr!43410 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1329258 () Bool)

(declare-fun e!757809 () Bool)

(assert (=> b!1329258 (= e!757809 tp_is_empty!36529)))

(declare-fun mapNonEmpty!56467 () Bool)

(declare-fun tp!107495 () Bool)

(assert (=> mapNonEmpty!56467 (= mapRes!56467 (and tp!107495 e!757809))))

(declare-fun mapValue!56467 () ValueCell!17366)

(declare-fun mapRest!56467 () (Array (_ BitVec 32) ValueCell!17366))

(declare-fun mapKey!56467 () (_ BitVec 32))

(assert (=> mapNonEmpty!56467 (= (arr!43409 _values!1320) (store mapRest!56467 mapKey!56467 mapValue!56467))))

(declare-fun b!1329259 () Bool)

(assert (=> b!1329259 (= e!757811 (and e!757810 mapRes!56467))))

(declare-fun condMapEmpty!56467 () Bool)

(declare-fun mapDefault!56467 () ValueCell!17366)

(assert (=> b!1329259 (= condMapEmpty!56467 (= (arr!43409 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17366)) mapDefault!56467)))))

(declare-fun b!1329260 () Bool)

(declare-fun res!881987 () Bool)

(assert (=> b!1329260 (=> (not res!881987) (not e!757813))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1329260 (= res!881987 (validKeyInArray!0 (select (arr!43410 _keys!1590) from!1980)))))

(declare-fun b!1329261 () Bool)

(declare-fun res!881985 () Bool)

(assert (=> b!1329261 (=> (not res!881985) (not e!757813))))

(assert (=> b!1329261 (= res!881985 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43962 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1329262 () Bool)

(declare-fun res!881984 () Bool)

(assert (=> b!1329262 (=> (not res!881984) (not e!757813))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89887 (_ BitVec 32)) Bool)

(assert (=> b!1329262 (= res!881984 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1329263 () Bool)

(declare-fun res!881989 () Bool)

(assert (=> b!1329263 (=> (not res!881989) (not e!757813))))

(declare-datatypes ((List!30821 0))(
  ( (Nil!30818) (Cons!30817 (h!32026 (_ BitVec 64)) (t!44845 List!30821)) )
))
(declare-fun arrayNoDuplicates!0 (array!89887 (_ BitVec 32) List!30821) Bool)

(assert (=> b!1329263 (= res!881989 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30818))))

(declare-fun b!1329264 () Bool)

(declare-fun res!881991 () Bool)

(assert (=> b!1329264 (=> (not res!881991) (not e!757813))))

(assert (=> b!1329264 (= res!881991 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!112224 res!881992) b!1329253))

(assert (= (and b!1329253 res!881986) b!1329262))

(assert (= (and b!1329262 res!881984) b!1329263))

(assert (= (and b!1329263 res!881989) b!1329261))

(assert (= (and b!1329261 res!881985) b!1329254))

(assert (= (and b!1329254 res!881990) b!1329257))

(assert (= (and b!1329257 res!881988) b!1329260))

(assert (= (and b!1329260 res!881987) b!1329264))

(assert (= (and b!1329264 res!881991) b!1329255))

(assert (= (and b!1329259 condMapEmpty!56467) mapIsEmpty!56467))

(assert (= (and b!1329259 (not condMapEmpty!56467)) mapNonEmpty!56467))

(get-info :version)

(assert (= (and mapNonEmpty!56467 ((_ is ValueCellFull!17366) mapValue!56467)) b!1329258))

(assert (= (and b!1329259 ((_ is ValueCellFull!17366) mapDefault!56467)) b!1329256))

(assert (= start!112224 b!1329259))

(declare-fun b_lambda!23869 () Bool)

(assert (=> (not b_lambda!23869) (not b!1329255)))

(declare-fun t!44843 () Bool)

(declare-fun tb!11827 () Bool)

(assert (=> (and start!112224 (= defaultEntry!1323 defaultEntry!1323) t!44843) tb!11827))

(declare-fun result!24733 () Bool)

(assert (=> tb!11827 (= result!24733 tp_is_empty!36529)))

(assert (=> b!1329255 t!44843))

(declare-fun b_and!49277 () Bool)

(assert (= b_and!49275 (and (=> t!44843 result!24733) b_and!49277)))

(declare-fun m!1217577 () Bool)

(assert (=> mapNonEmpty!56467 m!1217577))

(declare-fun m!1217579 () Bool)

(assert (=> b!1329263 m!1217579))

(declare-fun m!1217581 () Bool)

(assert (=> b!1329260 m!1217581))

(assert (=> b!1329260 m!1217581))

(declare-fun m!1217583 () Bool)

(assert (=> b!1329260 m!1217583))

(declare-fun m!1217585 () Bool)

(assert (=> start!112224 m!1217585))

(declare-fun m!1217587 () Bool)

(assert (=> start!112224 m!1217587))

(declare-fun m!1217589 () Bool)

(assert (=> start!112224 m!1217589))

(declare-fun m!1217591 () Bool)

(assert (=> b!1329254 m!1217591))

(assert (=> b!1329254 m!1217591))

(declare-fun m!1217593 () Bool)

(assert (=> b!1329254 m!1217593))

(declare-fun m!1217595 () Bool)

(assert (=> b!1329262 m!1217595))

(assert (=> b!1329257 m!1217581))

(declare-fun m!1217597 () Bool)

(assert (=> b!1329255 m!1217597))

(declare-fun m!1217599 () Bool)

(assert (=> b!1329255 m!1217599))

(declare-fun m!1217601 () Bool)

(assert (=> b!1329255 m!1217601))

(declare-fun m!1217603 () Bool)

(assert (=> b!1329255 m!1217603))

(assert (=> b!1329255 m!1217597))

(declare-fun m!1217605 () Bool)

(assert (=> b!1329255 m!1217605))

(declare-fun m!1217607 () Bool)

(assert (=> b!1329255 m!1217607))

(declare-fun m!1217609 () Bool)

(assert (=> b!1329255 m!1217609))

(assert (=> b!1329255 m!1217599))

(assert (=> b!1329255 m!1217603))

(assert (=> b!1329255 m!1217581))

(check-sat (not b!1329254) (not b!1329260) b_and!49277 (not b_next!30619) (not mapNonEmpty!56467) (not b!1329263) (not b_lambda!23869) tp_is_empty!36529 (not b!1329262) (not b!1329255) (not start!112224))
(check-sat b_and!49277 (not b_next!30619))
