; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112532 () Bool)

(assert start!112532)

(declare-fun b_free!30927 () Bool)

(declare-fun b_next!30927 () Bool)

(assert (=> start!112532 (= b_free!30927 (not b_next!30927))))

(declare-fun tp!108417 () Bool)

(declare-fun b_and!49835 () Bool)

(assert (=> start!112532 (= tp!108417 b_and!49835)))

(declare-fun b!1334838 () Bool)

(declare-fun e!760234 () Bool)

(assert (=> b!1334838 (= e!760234 false)))

(declare-datatypes ((V!54219 0))(
  ( (V!54220 (val!18493 Int)) )
))
(declare-datatypes ((ValueCell!17520 0))(
  ( (ValueCellFull!17520 (v!21130 V!54219)) (EmptyCell!17520) )
))
(declare-datatypes ((array!90536 0))(
  ( (array!90537 (arr!43734 (Array (_ BitVec 32) ValueCell!17520)) (size!44284 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90536)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90538 0))(
  ( (array!90539 (arr!43735 (Array (_ BitVec 32) (_ BitVec 64))) (size!44285 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90538)

(declare-fun defaultEntry!1323 () Int)

(declare-fun lt!592396 () Bool)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54219)

(declare-fun zeroValue!1262 () V!54219)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23844 0))(
  ( (tuple2!23845 (_1!11933 (_ BitVec 64)) (_2!11933 V!54219)) )
))
(declare-datatypes ((List!30983 0))(
  ( (Nil!30980) (Cons!30979 (h!32188 tuple2!23844) (t!45247 List!30983)) )
))
(declare-datatypes ((ListLongMap!21501 0))(
  ( (ListLongMap!21502 (toList!10766 List!30983)) )
))
(declare-fun contains!8930 (ListLongMap!21501 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5740 (array!90538 array!90536 (_ BitVec 32) (_ BitVec 32) V!54219 V!54219 (_ BitVec 32) Int) ListLongMap!21501)

(assert (=> b!1334838 (= lt!592396 (contains!8930 (getCurrentListMap!5740 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun res!885908 () Bool)

(assert (=> start!112532 (=> (not res!885908) (not e!760234))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112532 (= res!885908 (validMask!0 mask!1998))))

(assert (=> start!112532 e!760234))

(declare-fun e!760236 () Bool)

(declare-fun array_inv!32981 (array!90536) Bool)

(assert (=> start!112532 (and (array_inv!32981 _values!1320) e!760236)))

(assert (=> start!112532 true))

(declare-fun array_inv!32982 (array!90538) Bool)

(assert (=> start!112532 (array_inv!32982 _keys!1590)))

(assert (=> start!112532 tp!108417))

(declare-fun tp_is_empty!36837 () Bool)

(assert (=> start!112532 tp_is_empty!36837))

(declare-fun b!1334839 () Bool)

(declare-fun e!760235 () Bool)

(assert (=> b!1334839 (= e!760235 tp_is_empty!36837)))

(declare-fun mapNonEmpty!56929 () Bool)

(declare-fun mapRes!56929 () Bool)

(declare-fun tp!108418 () Bool)

(assert (=> mapNonEmpty!56929 (= mapRes!56929 (and tp!108418 e!760235))))

(declare-fun mapValue!56929 () ValueCell!17520)

(declare-fun mapKey!56929 () (_ BitVec 32))

(declare-fun mapRest!56929 () (Array (_ BitVec 32) ValueCell!17520))

(assert (=> mapNonEmpty!56929 (= (arr!43734 _values!1320) (store mapRest!56929 mapKey!56929 mapValue!56929))))

(declare-fun b!1334840 () Bool)

(declare-fun res!885911 () Bool)

(assert (=> b!1334840 (=> (not res!885911) (not e!760234))))

(assert (=> b!1334840 (= res!885911 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44285 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1334841 () Bool)

(declare-fun res!885912 () Bool)

(assert (=> b!1334841 (=> (not res!885912) (not e!760234))))

(assert (=> b!1334841 (= res!885912 (and (= (size!44284 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44285 _keys!1590) (size!44284 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1334842 () Bool)

(declare-fun res!885910 () Bool)

(assert (=> b!1334842 (=> (not res!885910) (not e!760234))))

(declare-datatypes ((List!30984 0))(
  ( (Nil!30981) (Cons!30980 (h!32189 (_ BitVec 64)) (t!45248 List!30984)) )
))
(declare-fun arrayNoDuplicates!0 (array!90538 (_ BitVec 32) List!30984) Bool)

(assert (=> b!1334842 (= res!885910 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30981))))

(declare-fun b!1334843 () Bool)

(declare-fun e!760233 () Bool)

(assert (=> b!1334843 (= e!760233 tp_is_empty!36837)))

(declare-fun mapIsEmpty!56929 () Bool)

(assert (=> mapIsEmpty!56929 mapRes!56929))

(declare-fun b!1334844 () Bool)

(assert (=> b!1334844 (= e!760236 (and e!760233 mapRes!56929))))

(declare-fun condMapEmpty!56929 () Bool)

(declare-fun mapDefault!56929 () ValueCell!17520)

(assert (=> b!1334844 (= condMapEmpty!56929 (= (arr!43734 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17520)) mapDefault!56929)))))

(declare-fun b!1334845 () Bool)

(declare-fun res!885909 () Bool)

(assert (=> b!1334845 (=> (not res!885909) (not e!760234))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90538 (_ BitVec 32)) Bool)

(assert (=> b!1334845 (= res!885909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(assert (= (and start!112532 res!885908) b!1334841))

(assert (= (and b!1334841 res!885912) b!1334845))

(assert (= (and b!1334845 res!885909) b!1334842))

(assert (= (and b!1334842 res!885910) b!1334840))

(assert (= (and b!1334840 res!885911) b!1334838))

(assert (= (and b!1334844 condMapEmpty!56929) mapIsEmpty!56929))

(assert (= (and b!1334844 (not condMapEmpty!56929)) mapNonEmpty!56929))

(get-info :version)

(assert (= (and mapNonEmpty!56929 ((_ is ValueCellFull!17520) mapValue!56929)) b!1334839))

(assert (= (and b!1334844 ((_ is ValueCellFull!17520) mapDefault!56929)) b!1334843))

(assert (= start!112532 b!1334844))

(declare-fun m!1223107 () Bool)

(assert (=> b!1334845 m!1223107))

(declare-fun m!1223109 () Bool)

(assert (=> start!112532 m!1223109))

(declare-fun m!1223111 () Bool)

(assert (=> start!112532 m!1223111))

(declare-fun m!1223113 () Bool)

(assert (=> start!112532 m!1223113))

(declare-fun m!1223115 () Bool)

(assert (=> b!1334838 m!1223115))

(assert (=> b!1334838 m!1223115))

(declare-fun m!1223117 () Bool)

(assert (=> b!1334838 m!1223117))

(declare-fun m!1223119 () Bool)

(assert (=> b!1334842 m!1223119))

(declare-fun m!1223121 () Bool)

(assert (=> mapNonEmpty!56929 m!1223121))

(check-sat b_and!49835 (not start!112532) (not b_next!30927) (not b!1334845) (not b!1334842) (not b!1334838) (not mapNonEmpty!56929) tp_is_empty!36837)
(check-sat b_and!49835 (not b_next!30927))
