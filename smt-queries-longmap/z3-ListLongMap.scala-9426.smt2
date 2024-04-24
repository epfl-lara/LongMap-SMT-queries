; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112388 () Bool)

(assert start!112388)

(declare-fun b_free!30559 () Bool)

(declare-fun b_next!30559 () Bool)

(assert (=> start!112388 (= b_free!30559 (not b_next!30559))))

(declare-fun tp!107314 () Bool)

(declare-fun b_and!49211 () Bool)

(assert (=> start!112388 (= tp!107314 b_and!49211)))

(declare-fun b!1329699 () Bool)

(declare-fun e!758239 () Bool)

(declare-fun tp_is_empty!36469 () Bool)

(assert (=> b!1329699 (= e!758239 tp_is_empty!36469)))

(declare-fun b!1329700 () Bool)

(declare-fun e!758236 () Bool)

(declare-fun e!758238 () Bool)

(declare-fun mapRes!56377 () Bool)

(assert (=> b!1329700 (= e!758236 (and e!758238 mapRes!56377))))

(declare-fun condMapEmpty!56377 () Bool)

(declare-datatypes ((V!53729 0))(
  ( (V!53730 (val!18309 Int)) )
))
(declare-datatypes ((ValueCell!17336 0))(
  ( (ValueCellFull!17336 (v!20941 V!53729)) (EmptyCell!17336) )
))
(declare-datatypes ((array!89939 0))(
  ( (array!89940 (arr!43431 (Array (_ BitVec 32) ValueCell!17336)) (size!43982 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89939)

(declare-fun mapDefault!56377 () ValueCell!17336)

(assert (=> b!1329700 (= condMapEmpty!56377 (= (arr!43431 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17336)) mapDefault!56377)))))

(declare-fun b!1329701 () Bool)

(declare-fun res!881905 () Bool)

(declare-fun e!758237 () Bool)

(assert (=> b!1329701 (=> (not res!881905) (not e!758237))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!89941 0))(
  ( (array!89942 (arr!43432 (Array (_ BitVec 32) (_ BitVec 64))) (size!43983 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89941)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun from!1980 () (_ BitVec 32))

(assert (=> b!1329701 (= res!881905 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43983 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!56377 () Bool)

(assert (=> mapIsEmpty!56377 mapRes!56377))

(declare-fun res!881903 () Bool)

(assert (=> start!112388 (=> (not res!881903) (not e!758237))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112388 (= res!881903 (validMask!0 mask!1998))))

(assert (=> start!112388 e!758237))

(declare-fun array_inv!33051 (array!89939) Bool)

(assert (=> start!112388 (and (array_inv!33051 _values!1320) e!758236)))

(assert (=> start!112388 true))

(declare-fun array_inv!33052 (array!89941) Bool)

(assert (=> start!112388 (array_inv!33052 _keys!1590)))

(assert (=> start!112388 tp!107314))

(assert (=> start!112388 tp_is_empty!36469))

(declare-fun b!1329702 () Bool)

(assert (=> b!1329702 (= e!758238 tp_is_empty!36469)))

(declare-fun b!1329703 () Bool)

(assert (=> b!1329703 (= e!758237 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!53729)

(declare-fun zeroValue!1262 () V!53729)

(declare-fun lt!591312 () Bool)

(declare-datatypes ((tuple2!23592 0))(
  ( (tuple2!23593 (_1!11807 (_ BitVec 64)) (_2!11807 V!53729)) )
))
(declare-datatypes ((List!30768 0))(
  ( (Nil!30765) (Cons!30764 (h!31982 tuple2!23592) (t!44766 List!30768)) )
))
(declare-datatypes ((ListLongMap!21257 0))(
  ( (ListLongMap!21258 (toList!10644 List!30768)) )
))
(declare-fun contains!8820 (ListLongMap!21257 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5621 (array!89941 array!89939 (_ BitVec 32) (_ BitVec 32) V!53729 V!53729 (_ BitVec 32) Int) ListLongMap!21257)

(assert (=> b!1329703 (= lt!591312 (contains!8820 (getCurrentListMap!5621 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1329704 () Bool)

(declare-fun res!881904 () Bool)

(assert (=> b!1329704 (=> (not res!881904) (not e!758237))))

(assert (=> b!1329704 (= res!881904 (and (= (size!43982 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43983 _keys!1590) (size!43982 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1329705 () Bool)

(declare-fun res!881906 () Bool)

(assert (=> b!1329705 (=> (not res!881906) (not e!758237))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89941 (_ BitVec 32)) Bool)

(assert (=> b!1329705 (= res!881906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1329706 () Bool)

(declare-fun res!881902 () Bool)

(assert (=> b!1329706 (=> (not res!881902) (not e!758237))))

(declare-datatypes ((List!30769 0))(
  ( (Nil!30766) (Cons!30765 (h!31983 (_ BitVec 64)) (t!44767 List!30769)) )
))
(declare-fun arrayNoDuplicates!0 (array!89941 (_ BitVec 32) List!30769) Bool)

(assert (=> b!1329706 (= res!881902 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30766))))

(declare-fun mapNonEmpty!56377 () Bool)

(declare-fun tp!107313 () Bool)

(assert (=> mapNonEmpty!56377 (= mapRes!56377 (and tp!107313 e!758239))))

(declare-fun mapValue!56377 () ValueCell!17336)

(declare-fun mapRest!56377 () (Array (_ BitVec 32) ValueCell!17336))

(declare-fun mapKey!56377 () (_ BitVec 32))

(assert (=> mapNonEmpty!56377 (= (arr!43431 _values!1320) (store mapRest!56377 mapKey!56377 mapValue!56377))))

(assert (= (and start!112388 res!881903) b!1329704))

(assert (= (and b!1329704 res!881904) b!1329705))

(assert (= (and b!1329705 res!881906) b!1329706))

(assert (= (and b!1329706 res!881902) b!1329701))

(assert (= (and b!1329701 res!881905) b!1329703))

(assert (= (and b!1329700 condMapEmpty!56377) mapIsEmpty!56377))

(assert (= (and b!1329700 (not condMapEmpty!56377)) mapNonEmpty!56377))

(get-info :version)

(assert (= (and mapNonEmpty!56377 ((_ is ValueCellFull!17336) mapValue!56377)) b!1329699))

(assert (= (and b!1329700 ((_ is ValueCellFull!17336) mapDefault!56377)) b!1329702))

(assert (= start!112388 b!1329700))

(declare-fun m!1218983 () Bool)

(assert (=> b!1329703 m!1218983))

(assert (=> b!1329703 m!1218983))

(declare-fun m!1218985 () Bool)

(assert (=> b!1329703 m!1218985))

(declare-fun m!1218987 () Bool)

(assert (=> mapNonEmpty!56377 m!1218987))

(declare-fun m!1218989 () Bool)

(assert (=> b!1329705 m!1218989))

(declare-fun m!1218991 () Bool)

(assert (=> b!1329706 m!1218991))

(declare-fun m!1218993 () Bool)

(assert (=> start!112388 m!1218993))

(declare-fun m!1218995 () Bool)

(assert (=> start!112388 m!1218995))

(declare-fun m!1218997 () Bool)

(assert (=> start!112388 m!1218997))

(check-sat (not b!1329703) (not mapNonEmpty!56377) b_and!49211 (not b!1329706) (not b!1329705) (not b_next!30559) (not start!112388) tp_is_empty!36469)
(check-sat b_and!49211 (not b_next!30559))
