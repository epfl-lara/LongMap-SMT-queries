; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112654 () Bool)

(assert start!112654)

(declare-fun b_free!30991 () Bool)

(declare-fun b_next!30991 () Bool)

(assert (=> start!112654 (= b_free!30991 (not b_next!30991))))

(declare-fun tp!108614 () Bool)

(declare-fun b_and!49901 () Bool)

(assert (=> start!112654 (= tp!108614 b_and!49901)))

(declare-fun mapIsEmpty!57029 () Bool)

(declare-fun mapRes!57029 () Bool)

(assert (=> mapIsEmpty!57029 mapRes!57029))

(declare-fun b!1336069 () Bool)

(declare-fun e!760924 () Bool)

(declare-fun tp_is_empty!36901 () Bool)

(assert (=> b!1336069 (= e!760924 tp_is_empty!36901)))

(declare-fun b!1336070 () Bool)

(declare-fun res!886667 () Bool)

(declare-fun e!760927 () Bool)

(assert (=> b!1336070 (=> (not res!886667) (not e!760927))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1336070 (= res!886667 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1336071 () Bool)

(declare-fun res!886671 () Bool)

(assert (=> b!1336071 (=> (not res!886671) (not e!760927))))

(declare-datatypes ((array!90609 0))(
  ( (array!90610 (arr!43770 (Array (_ BitVec 32) (_ BitVec 64))) (size!44322 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90609)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1336071 (= res!886671 (validKeyInArray!0 (select (arr!43770 _keys!1590) from!1980)))))

(declare-fun b!1336072 () Bool)

(assert (=> b!1336072 (= e!760927 false)))

(declare-datatypes ((V!54305 0))(
  ( (V!54306 (val!18525 Int)) )
))
(declare-datatypes ((ValueCell!17552 0))(
  ( (ValueCellFull!17552 (v!21164 V!54305)) (EmptyCell!17552) )
))
(declare-datatypes ((array!90611 0))(
  ( (array!90612 (arr!43771 (Array (_ BitVec 32) ValueCell!17552)) (size!44323 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90611)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun lt!592547 () Bool)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54305)

(declare-fun zeroValue!1262 () V!54305)

(declare-datatypes ((tuple2!23956 0))(
  ( (tuple2!23957 (_1!11989 (_ BitVec 64)) (_2!11989 V!54305)) )
))
(declare-datatypes ((List!31090 0))(
  ( (Nil!31087) (Cons!31086 (h!32295 tuple2!23956) (t!45354 List!31090)) )
))
(declare-datatypes ((ListLongMap!21613 0))(
  ( (ListLongMap!21614 (toList!10822 List!31090)) )
))
(declare-fun contains!8916 (ListLongMap!21613 (_ BitVec 64)) Bool)

(declare-fun +!4755 (ListLongMap!21613 tuple2!23956) ListLongMap!21613)

(declare-fun getCurrentListMapNoExtraKeys!6398 (array!90609 array!90611 (_ BitVec 32) (_ BitVec 32) V!54305 V!54305 (_ BitVec 32) Int) ListLongMap!21613)

(declare-fun get!22085 (ValueCell!17552 V!54305) V!54305)

(declare-fun dynLambda!3685 (Int (_ BitVec 64)) V!54305)

(assert (=> b!1336072 (= lt!592547 (contains!8916 (+!4755 (+!4755 (getCurrentListMapNoExtraKeys!6398 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23957 (select (arr!43770 _keys!1590) from!1980) (get!22085 (select (arr!43771 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23957 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153))))

(declare-fun res!886666 () Bool)

(assert (=> start!112654 (=> (not res!886666) (not e!760927))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112654 (= res!886666 (validMask!0 mask!1998))))

(assert (=> start!112654 e!760927))

(declare-fun e!760925 () Bool)

(declare-fun array_inv!33205 (array!90611) Bool)

(assert (=> start!112654 (and (array_inv!33205 _values!1320) e!760925)))

(assert (=> start!112654 true))

(declare-fun array_inv!33206 (array!90609) Bool)

(assert (=> start!112654 (array_inv!33206 _keys!1590)))

(assert (=> start!112654 tp!108614))

(assert (=> start!112654 tp_is_empty!36901))

(declare-fun b!1336073 () Bool)

(declare-fun res!886664 () Bool)

(assert (=> b!1336073 (=> (not res!886664) (not e!760927))))

(assert (=> b!1336073 (= res!886664 (and (= (size!44323 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44322 _keys!1590) (size!44323 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1336074 () Bool)

(declare-fun e!760923 () Bool)

(assert (=> b!1336074 (= e!760923 tp_is_empty!36901)))

(declare-fun b!1336075 () Bool)

(declare-fun res!886665 () Bool)

(assert (=> b!1336075 (=> (not res!886665) (not e!760927))))

(declare-fun getCurrentListMap!5676 (array!90609 array!90611 (_ BitVec 32) (_ BitVec 32) V!54305 V!54305 (_ BitVec 32) Int) ListLongMap!21613)

(assert (=> b!1336075 (= res!886665 (contains!8916 (getCurrentListMap!5676 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1336076 () Bool)

(declare-fun res!886670 () Bool)

(assert (=> b!1336076 (=> (not res!886670) (not e!760927))))

(assert (=> b!1336076 (= res!886670 (not (= (select (arr!43770 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1336077 () Bool)

(declare-fun res!886669 () Bool)

(assert (=> b!1336077 (=> (not res!886669) (not e!760927))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90609 (_ BitVec 32)) Bool)

(assert (=> b!1336077 (= res!886669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapNonEmpty!57029 () Bool)

(declare-fun tp!108615 () Bool)

(assert (=> mapNonEmpty!57029 (= mapRes!57029 (and tp!108615 e!760923))))

(declare-fun mapValue!57029 () ValueCell!17552)

(declare-fun mapRest!57029 () (Array (_ BitVec 32) ValueCell!17552))

(declare-fun mapKey!57029 () (_ BitVec 32))

(assert (=> mapNonEmpty!57029 (= (arr!43771 _values!1320) (store mapRest!57029 mapKey!57029 mapValue!57029))))

(declare-fun b!1336078 () Bool)

(declare-fun res!886663 () Bool)

(assert (=> b!1336078 (=> (not res!886663) (not e!760927))))

(declare-datatypes ((List!31091 0))(
  ( (Nil!31088) (Cons!31087 (h!32296 (_ BitVec 64)) (t!45355 List!31091)) )
))
(declare-fun arrayNoDuplicates!0 (array!90609 (_ BitVec 32) List!31091) Bool)

(assert (=> b!1336078 (= res!886663 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31088))))

(declare-fun b!1336079 () Bool)

(declare-fun res!886668 () Bool)

(assert (=> b!1336079 (=> (not res!886668) (not e!760927))))

(assert (=> b!1336079 (= res!886668 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44322 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1336080 () Bool)

(assert (=> b!1336080 (= e!760925 (and e!760924 mapRes!57029))))

(declare-fun condMapEmpty!57029 () Bool)

(declare-fun mapDefault!57029 () ValueCell!17552)

(assert (=> b!1336080 (= condMapEmpty!57029 (= (arr!43771 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17552)) mapDefault!57029)))))

(assert (= (and start!112654 res!886666) b!1336073))

(assert (= (and b!1336073 res!886664) b!1336077))

(assert (= (and b!1336077 res!886669) b!1336078))

(assert (= (and b!1336078 res!886663) b!1336079))

(assert (= (and b!1336079 res!886668) b!1336075))

(assert (= (and b!1336075 res!886665) b!1336076))

(assert (= (and b!1336076 res!886670) b!1336071))

(assert (= (and b!1336071 res!886671) b!1336070))

(assert (= (and b!1336070 res!886667) b!1336072))

(assert (= (and b!1336080 condMapEmpty!57029) mapIsEmpty!57029))

(assert (= (and b!1336080 (not condMapEmpty!57029)) mapNonEmpty!57029))

(get-info :version)

(assert (= (and mapNonEmpty!57029 ((_ is ValueCellFull!17552) mapValue!57029)) b!1336074))

(assert (= (and b!1336080 ((_ is ValueCellFull!17552) mapDefault!57029)) b!1336069))

(assert (= start!112654 b!1336080))

(declare-fun b_lambda!24139 () Bool)

(assert (=> (not b_lambda!24139) (not b!1336072)))

(declare-fun t!45353 () Bool)

(declare-fun tb!12067 () Bool)

(assert (=> (and start!112654 (= defaultEntry!1323 defaultEntry!1323) t!45353) tb!12067))

(declare-fun result!25215 () Bool)

(assert (=> tb!12067 (= result!25215 tp_is_empty!36901)))

(assert (=> b!1336072 t!45353))

(declare-fun b_and!49903 () Bool)

(assert (= b_and!49901 (and (=> t!45353 result!25215) b_and!49903)))

(declare-fun m!1223743 () Bool)

(assert (=> b!1336072 m!1223743))

(declare-fun m!1223745 () Bool)

(assert (=> b!1336072 m!1223745))

(declare-fun m!1223747 () Bool)

(assert (=> b!1336072 m!1223747))

(declare-fun m!1223749 () Bool)

(assert (=> b!1336072 m!1223749))

(declare-fun m!1223751 () Bool)

(assert (=> b!1336072 m!1223751))

(assert (=> b!1336072 m!1223745))

(declare-fun m!1223753 () Bool)

(assert (=> b!1336072 m!1223753))

(assert (=> b!1336072 m!1223743))

(assert (=> b!1336072 m!1223747))

(declare-fun m!1223755 () Bool)

(assert (=> b!1336072 m!1223755))

(assert (=> b!1336072 m!1223749))

(assert (=> b!1336072 m!1223753))

(declare-fun m!1223757 () Bool)

(assert (=> b!1336072 m!1223757))

(declare-fun m!1223759 () Bool)

(assert (=> b!1336075 m!1223759))

(assert (=> b!1336075 m!1223759))

(declare-fun m!1223761 () Bool)

(assert (=> b!1336075 m!1223761))

(declare-fun m!1223763 () Bool)

(assert (=> start!112654 m!1223763))

(declare-fun m!1223765 () Bool)

(assert (=> start!112654 m!1223765))

(declare-fun m!1223767 () Bool)

(assert (=> start!112654 m!1223767))

(assert (=> b!1336076 m!1223755))

(declare-fun m!1223769 () Bool)

(assert (=> mapNonEmpty!57029 m!1223769))

(declare-fun m!1223771 () Bool)

(assert (=> b!1336078 m!1223771))

(declare-fun m!1223773 () Bool)

(assert (=> b!1336077 m!1223773))

(assert (=> b!1336071 m!1223755))

(assert (=> b!1336071 m!1223755))

(declare-fun m!1223775 () Bool)

(assert (=> b!1336071 m!1223775))

(check-sat (not b!1336077) (not start!112654) tp_is_empty!36901 (not b!1336078) (not b!1336071) b_and!49903 (not b_next!30991) (not b!1336075) (not b_lambda!24139) (not mapNonEmpty!57029) (not b!1336072))
(check-sat b_and!49903 (not b_next!30991))
