; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112790 () Bool)

(assert start!112790)

(declare-fun b_free!30961 () Bool)

(declare-fun b_next!30961 () Bool)

(assert (=> start!112790 (= b_free!30961 (not b_next!30961))))

(declare-fun tp!108520 () Bool)

(declare-fun b_and!49871 () Bool)

(assert (=> start!112790 (= tp!108520 b_and!49871)))

(declare-fun b!1336572 () Bool)

(declare-fun e!761332 () Bool)

(declare-fun e!761335 () Bool)

(declare-fun mapRes!56980 () Bool)

(assert (=> b!1336572 (= e!761332 (and e!761335 mapRes!56980))))

(declare-fun condMapEmpty!56980 () Bool)

(declare-datatypes ((V!54265 0))(
  ( (V!54266 (val!18510 Int)) )
))
(declare-datatypes ((ValueCell!17537 0))(
  ( (ValueCellFull!17537 (v!21142 V!54265)) (EmptyCell!17537) )
))
(declare-datatypes ((array!90713 0))(
  ( (array!90714 (arr!43818 (Array (_ BitVec 32) ValueCell!17537)) (size!44369 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90713)

(declare-fun mapDefault!56980 () ValueCell!17537)

(assert (=> b!1336572 (= condMapEmpty!56980 (= (arr!43818 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17537)) mapDefault!56980)))))

(declare-fun b!1336573 () Bool)

(declare-fun res!886712 () Bool)

(declare-fun e!761333 () Bool)

(assert (=> b!1336573 (=> (not res!886712) (not e!761333))))

(declare-datatypes ((array!90715 0))(
  ( (array!90716 (arr!43819 (Array (_ BitVec 32) (_ BitVec 64))) (size!44370 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90715)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90715 (_ BitVec 32)) Bool)

(assert (=> b!1336573 (= res!886712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapNonEmpty!56980 () Bool)

(declare-fun tp!108519 () Bool)

(declare-fun e!761334 () Bool)

(assert (=> mapNonEmpty!56980 (= mapRes!56980 (and tp!108519 e!761334))))

(declare-fun mapKey!56980 () (_ BitVec 32))

(declare-fun mapValue!56980 () ValueCell!17537)

(declare-fun mapRest!56980 () (Array (_ BitVec 32) ValueCell!17537))

(assert (=> mapNonEmpty!56980 (= (arr!43818 _values!1320) (store mapRest!56980 mapKey!56980 mapValue!56980))))

(declare-fun b!1336574 () Bool)

(assert (=> b!1336574 (= e!761333 false)))

(declare-fun lt!592914 () Bool)

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54265)

(declare-fun zeroValue!1262 () V!54265)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23900 0))(
  ( (tuple2!23901 (_1!11961 (_ BitVec 64)) (_2!11961 V!54265)) )
))
(declare-datatypes ((List!31047 0))(
  ( (Nil!31044) (Cons!31043 (h!32261 tuple2!23900) (t!45303 List!31047)) )
))
(declare-datatypes ((ListLongMap!21565 0))(
  ( (ListLongMap!21566 (toList!10798 List!31047)) )
))
(declare-fun contains!8974 (ListLongMap!21565 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5757 (array!90715 array!90713 (_ BitVec 32) (_ BitVec 32) V!54265 V!54265 (_ BitVec 32) Int) ListLongMap!21565)

(assert (=> b!1336574 (= lt!592914 (contains!8974 (getCurrentListMap!5757 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun mapIsEmpty!56980 () Bool)

(assert (=> mapIsEmpty!56980 mapRes!56980))

(declare-fun b!1336575 () Bool)

(declare-fun res!886711 () Bool)

(assert (=> b!1336575 (=> (not res!886711) (not e!761333))))

(assert (=> b!1336575 (= res!886711 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44370 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1336576 () Bool)

(declare-fun tp_is_empty!36871 () Bool)

(assert (=> b!1336576 (= e!761334 tp_is_empty!36871)))

(declare-fun b!1336577 () Bool)

(declare-fun res!886710 () Bool)

(assert (=> b!1336577 (=> (not res!886710) (not e!761333))))

(declare-datatypes ((List!31048 0))(
  ( (Nil!31045) (Cons!31044 (h!32262 (_ BitVec 64)) (t!45304 List!31048)) )
))
(declare-fun arrayNoDuplicates!0 (array!90715 (_ BitVec 32) List!31048) Bool)

(assert (=> b!1336577 (= res!886710 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31045))))

(declare-fun b!1336578 () Bool)

(assert (=> b!1336578 (= e!761335 tp_is_empty!36871)))

(declare-fun b!1336579 () Bool)

(declare-fun res!886709 () Bool)

(assert (=> b!1336579 (=> (not res!886709) (not e!761333))))

(assert (=> b!1336579 (= res!886709 (and (= (size!44369 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44370 _keys!1590) (size!44369 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun res!886708 () Bool)

(assert (=> start!112790 (=> (not res!886708) (not e!761333))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112790 (= res!886708 (validMask!0 mask!1998))))

(assert (=> start!112790 e!761333))

(declare-fun array_inv!33313 (array!90713) Bool)

(assert (=> start!112790 (and (array_inv!33313 _values!1320) e!761332)))

(assert (=> start!112790 true))

(declare-fun array_inv!33314 (array!90715) Bool)

(assert (=> start!112790 (array_inv!33314 _keys!1590)))

(assert (=> start!112790 tp!108520))

(assert (=> start!112790 tp_is_empty!36871))

(assert (= (and start!112790 res!886708) b!1336579))

(assert (= (and b!1336579 res!886709) b!1336573))

(assert (= (and b!1336573 res!886712) b!1336577))

(assert (= (and b!1336577 res!886710) b!1336575))

(assert (= (and b!1336575 res!886711) b!1336574))

(assert (= (and b!1336572 condMapEmpty!56980) mapIsEmpty!56980))

(assert (= (and b!1336572 (not condMapEmpty!56980)) mapNonEmpty!56980))

(get-info :version)

(assert (= (and mapNonEmpty!56980 ((_ is ValueCellFull!17537) mapValue!56980)) b!1336576))

(assert (= (and b!1336572 ((_ is ValueCellFull!17537) mapDefault!56980)) b!1336578))

(assert (= start!112790 b!1336572))

(declare-fun m!1224989 () Bool)

(assert (=> b!1336574 m!1224989))

(assert (=> b!1336574 m!1224989))

(declare-fun m!1224991 () Bool)

(assert (=> b!1336574 m!1224991))

(declare-fun m!1224993 () Bool)

(assert (=> mapNonEmpty!56980 m!1224993))

(declare-fun m!1224995 () Bool)

(assert (=> b!1336577 m!1224995))

(declare-fun m!1224997 () Bool)

(assert (=> b!1336573 m!1224997))

(declare-fun m!1224999 () Bool)

(assert (=> start!112790 m!1224999))

(declare-fun m!1225001 () Bool)

(assert (=> start!112790 m!1225001))

(declare-fun m!1225003 () Bool)

(assert (=> start!112790 m!1225003))

(check-sat (not start!112790) (not b!1336574) b_and!49871 (not b_next!30961) (not b!1336573) tp_is_empty!36871 (not mapNonEmpty!56980) (not b!1336577))
(check-sat b_and!49871 (not b_next!30961))
