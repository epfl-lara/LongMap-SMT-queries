; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112404 () Bool)

(assert start!112404)

(declare-fun b_free!30799 () Bool)

(declare-fun b_next!30799 () Bool)

(assert (=> start!112404 (= b_free!30799 (not b_next!30799))))

(declare-fun tp!108034 () Bool)

(declare-fun b_and!49623 () Bool)

(assert (=> start!112404 (= tp!108034 b_and!49623)))

(declare-fun b!1332581 () Bool)

(declare-fun res!884338 () Bool)

(declare-fun e!759160 () Bool)

(assert (=> b!1332581 (=> (not res!884338) (not e!759160))))

(declare-datatypes ((array!90237 0))(
  ( (array!90238 (arr!43585 (Array (_ BitVec 32) (_ BitVec 64))) (size!44137 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90237)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90237 (_ BitVec 32)) Bool)

(assert (=> b!1332581 (= res!884338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1332582 () Bool)

(declare-fun e!759161 () Bool)

(declare-fun tp_is_empty!36709 () Bool)

(assert (=> b!1332582 (= e!759161 tp_is_empty!36709)))

(declare-fun b!1332583 () Bool)

(assert (=> b!1332583 (= e!759160 false)))

(declare-datatypes ((V!54049 0))(
  ( (V!54050 (val!18429 Int)) )
))
(declare-datatypes ((ValueCell!17456 0))(
  ( (ValueCellFull!17456 (v!21065 V!54049)) (EmptyCell!17456) )
))
(declare-datatypes ((array!90239 0))(
  ( (array!90240 (arr!43586 (Array (_ BitVec 32) ValueCell!17456)) (size!44138 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90239)

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54049)

(declare-fun lt!591865 () Bool)

(declare-fun zeroValue!1262 () V!54049)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23820 0))(
  ( (tuple2!23821 (_1!11921 (_ BitVec 64)) (_2!11921 V!54049)) )
))
(declare-datatypes ((List!30955 0))(
  ( (Nil!30952) (Cons!30951 (h!32160 tuple2!23820) (t!45145 List!30955)) )
))
(declare-datatypes ((ListLongMap!21477 0))(
  ( (ListLongMap!21478 (toList!10754 List!30955)) )
))
(declare-fun contains!8846 (ListLongMap!21477 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5614 (array!90237 array!90239 (_ BitVec 32) (_ BitVec 32) V!54049 V!54049 (_ BitVec 32) Int) ListLongMap!21477)

(assert (=> b!1332583 (= lt!591865 (contains!8846 (getCurrentListMap!5614 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1332584 () Bool)

(declare-fun e!759159 () Bool)

(declare-fun e!759163 () Bool)

(declare-fun mapRes!56737 () Bool)

(assert (=> b!1332584 (= e!759159 (and e!759163 mapRes!56737))))

(declare-fun condMapEmpty!56737 () Bool)

(declare-fun mapDefault!56737 () ValueCell!17456)

(assert (=> b!1332584 (= condMapEmpty!56737 (= (arr!43586 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17456)) mapDefault!56737)))))

(declare-fun b!1332585 () Bool)

(declare-fun res!884336 () Bool)

(assert (=> b!1332585 (=> (not res!884336) (not e!759160))))

(declare-datatypes ((List!30956 0))(
  ( (Nil!30953) (Cons!30952 (h!32161 (_ BitVec 64)) (t!45146 List!30956)) )
))
(declare-fun arrayNoDuplicates!0 (array!90237 (_ BitVec 32) List!30956) Bool)

(assert (=> b!1332585 (= res!884336 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30953))))

(declare-fun b!1332586 () Bool)

(declare-fun res!884334 () Bool)

(assert (=> b!1332586 (=> (not res!884334) (not e!759160))))

(assert (=> b!1332586 (= res!884334 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44137 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!56737 () Bool)

(assert (=> mapIsEmpty!56737 mapRes!56737))

(declare-fun mapNonEmpty!56737 () Bool)

(declare-fun tp!108035 () Bool)

(assert (=> mapNonEmpty!56737 (= mapRes!56737 (and tp!108035 e!759161))))

(declare-fun mapKey!56737 () (_ BitVec 32))

(declare-fun mapValue!56737 () ValueCell!17456)

(declare-fun mapRest!56737 () (Array (_ BitVec 32) ValueCell!17456))

(assert (=> mapNonEmpty!56737 (= (arr!43586 _values!1320) (store mapRest!56737 mapKey!56737 mapValue!56737))))

(declare-fun res!884337 () Bool)

(assert (=> start!112404 (=> (not res!884337) (not e!759160))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112404 (= res!884337 (validMask!0 mask!1998))))

(assert (=> start!112404 e!759160))

(declare-fun array_inv!33065 (array!90239) Bool)

(assert (=> start!112404 (and (array_inv!33065 _values!1320) e!759159)))

(assert (=> start!112404 true))

(declare-fun array_inv!33066 (array!90237) Bool)

(assert (=> start!112404 (array_inv!33066 _keys!1590)))

(assert (=> start!112404 tp!108034))

(assert (=> start!112404 tp_is_empty!36709))

(declare-fun b!1332587 () Bool)

(assert (=> b!1332587 (= e!759163 tp_is_empty!36709)))

(declare-fun b!1332588 () Bool)

(declare-fun res!884335 () Bool)

(assert (=> b!1332588 (=> (not res!884335) (not e!759160))))

(assert (=> b!1332588 (= res!884335 (and (= (size!44138 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44137 _keys!1590) (size!44138 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(assert (= (and start!112404 res!884337) b!1332588))

(assert (= (and b!1332588 res!884335) b!1332581))

(assert (= (and b!1332581 res!884338) b!1332585))

(assert (= (and b!1332585 res!884336) b!1332586))

(assert (= (and b!1332586 res!884334) b!1332583))

(assert (= (and b!1332584 condMapEmpty!56737) mapIsEmpty!56737))

(assert (= (and b!1332584 (not condMapEmpty!56737)) mapNonEmpty!56737))

(get-info :version)

(assert (= (and mapNonEmpty!56737 ((_ is ValueCellFull!17456) mapValue!56737)) b!1332582))

(assert (= (and b!1332584 ((_ is ValueCellFull!17456) mapDefault!56737)) b!1332587))

(assert (= start!112404 b!1332584))

(declare-fun m!1220919 () Bool)

(assert (=> b!1332581 m!1220919))

(declare-fun m!1220921 () Bool)

(assert (=> b!1332583 m!1220921))

(assert (=> b!1332583 m!1220921))

(declare-fun m!1220923 () Bool)

(assert (=> b!1332583 m!1220923))

(declare-fun m!1220925 () Bool)

(assert (=> mapNonEmpty!56737 m!1220925))

(declare-fun m!1220927 () Bool)

(assert (=> start!112404 m!1220927))

(declare-fun m!1220929 () Bool)

(assert (=> start!112404 m!1220929))

(declare-fun m!1220931 () Bool)

(assert (=> start!112404 m!1220931))

(declare-fun m!1220933 () Bool)

(assert (=> b!1332585 m!1220933))

(check-sat (not mapNonEmpty!56737) b_and!49623 (not b!1332583) tp_is_empty!36709 (not b!1332585) (not start!112404) (not b!1332581) (not b_next!30799))
(check-sat b_and!49623 (not b_next!30799))
