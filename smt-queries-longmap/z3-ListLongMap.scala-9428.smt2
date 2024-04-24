; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112400 () Bool)

(assert start!112400)

(declare-fun b_free!30571 () Bool)

(declare-fun b_next!30571 () Bool)

(assert (=> start!112400 (= b_free!30571 (not b_next!30571))))

(declare-fun tp!107350 () Bool)

(declare-fun b_and!49223 () Bool)

(assert (=> start!112400 (= tp!107350 b_and!49223)))

(declare-fun b!1329843 () Bool)

(declare-fun e!758325 () Bool)

(assert (=> b!1329843 (= e!758325 false)))

(declare-datatypes ((V!53745 0))(
  ( (V!53746 (val!18315 Int)) )
))
(declare-datatypes ((ValueCell!17342 0))(
  ( (ValueCellFull!17342 (v!20947 V!53745)) (EmptyCell!17342) )
))
(declare-datatypes ((array!89963 0))(
  ( (array!89964 (arr!43443 (Array (_ BitVec 32) ValueCell!17342)) (size!43994 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89963)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-datatypes ((array!89965 0))(
  ( (array!89966 (arr!43444 (Array (_ BitVec 32) (_ BitVec 64))) (size!43995 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89965)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!53745)

(declare-fun zeroValue!1262 () V!53745)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun lt!591330 () Bool)

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((tuple2!23600 0))(
  ( (tuple2!23601 (_1!11811 (_ BitVec 64)) (_2!11811 V!53745)) )
))
(declare-datatypes ((List!30776 0))(
  ( (Nil!30773) (Cons!30772 (h!31990 tuple2!23600) (t!44774 List!30776)) )
))
(declare-datatypes ((ListLongMap!21265 0))(
  ( (ListLongMap!21266 (toList!10648 List!30776)) )
))
(declare-fun contains!8824 (ListLongMap!21265 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5625 (array!89965 array!89963 (_ BitVec 32) (_ BitVec 32) V!53745 V!53745 (_ BitVec 32) Int) ListLongMap!21265)

(assert (=> b!1329843 (= lt!591330 (contains!8824 (getCurrentListMap!5625 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1329844 () Bool)

(declare-fun e!758326 () Bool)

(declare-fun tp_is_empty!36481 () Bool)

(assert (=> b!1329844 (= e!758326 tp_is_empty!36481)))

(declare-fun mapIsEmpty!56395 () Bool)

(declare-fun mapRes!56395 () Bool)

(assert (=> mapIsEmpty!56395 mapRes!56395))

(declare-fun b!1329845 () Bool)

(declare-fun e!758329 () Bool)

(assert (=> b!1329845 (= e!758329 tp_is_empty!36481)))

(declare-fun b!1329846 () Bool)

(declare-fun res!881993 () Bool)

(assert (=> b!1329846 (=> (not res!881993) (not e!758325))))

(assert (=> b!1329846 (= res!881993 (and (= (size!43994 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43995 _keys!1590) (size!43994 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1329847 () Bool)

(declare-fun res!881996 () Bool)

(assert (=> b!1329847 (=> (not res!881996) (not e!758325))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89965 (_ BitVec 32)) Bool)

(assert (=> b!1329847 (= res!881996 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1329848 () Bool)

(declare-fun res!881994 () Bool)

(assert (=> b!1329848 (=> (not res!881994) (not e!758325))))

(declare-datatypes ((List!30777 0))(
  ( (Nil!30774) (Cons!30773 (h!31991 (_ BitVec 64)) (t!44775 List!30777)) )
))
(declare-fun arrayNoDuplicates!0 (array!89965 (_ BitVec 32) List!30777) Bool)

(assert (=> b!1329848 (= res!881994 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30774))))

(declare-fun b!1329849 () Bool)

(declare-fun res!881992 () Bool)

(assert (=> b!1329849 (=> (not res!881992) (not e!758325))))

(assert (=> b!1329849 (= res!881992 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43995 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1329850 () Bool)

(declare-fun e!758328 () Bool)

(assert (=> b!1329850 (= e!758328 (and e!758326 mapRes!56395))))

(declare-fun condMapEmpty!56395 () Bool)

(declare-fun mapDefault!56395 () ValueCell!17342)

(assert (=> b!1329850 (= condMapEmpty!56395 (= (arr!43443 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17342)) mapDefault!56395)))))

(declare-fun mapNonEmpty!56395 () Bool)

(declare-fun tp!107349 () Bool)

(assert (=> mapNonEmpty!56395 (= mapRes!56395 (and tp!107349 e!758329))))

(declare-fun mapValue!56395 () ValueCell!17342)

(declare-fun mapKey!56395 () (_ BitVec 32))

(declare-fun mapRest!56395 () (Array (_ BitVec 32) ValueCell!17342))

(assert (=> mapNonEmpty!56395 (= (arr!43443 _values!1320) (store mapRest!56395 mapKey!56395 mapValue!56395))))

(declare-fun res!881995 () Bool)

(assert (=> start!112400 (=> (not res!881995) (not e!758325))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112400 (= res!881995 (validMask!0 mask!1998))))

(assert (=> start!112400 e!758325))

(declare-fun array_inv!33059 (array!89963) Bool)

(assert (=> start!112400 (and (array_inv!33059 _values!1320) e!758328)))

(assert (=> start!112400 true))

(declare-fun array_inv!33060 (array!89965) Bool)

(assert (=> start!112400 (array_inv!33060 _keys!1590)))

(assert (=> start!112400 tp!107350))

(assert (=> start!112400 tp_is_empty!36481))

(assert (= (and start!112400 res!881995) b!1329846))

(assert (= (and b!1329846 res!881993) b!1329847))

(assert (= (and b!1329847 res!881996) b!1329848))

(assert (= (and b!1329848 res!881994) b!1329849))

(assert (= (and b!1329849 res!881992) b!1329843))

(assert (= (and b!1329850 condMapEmpty!56395) mapIsEmpty!56395))

(assert (= (and b!1329850 (not condMapEmpty!56395)) mapNonEmpty!56395))

(get-info :version)

(assert (= (and mapNonEmpty!56395 ((_ is ValueCellFull!17342) mapValue!56395)) b!1329845))

(assert (= (and b!1329850 ((_ is ValueCellFull!17342) mapDefault!56395)) b!1329844))

(assert (= start!112400 b!1329850))

(declare-fun m!1219079 () Bool)

(assert (=> b!1329843 m!1219079))

(assert (=> b!1329843 m!1219079))

(declare-fun m!1219081 () Bool)

(assert (=> b!1329843 m!1219081))

(declare-fun m!1219083 () Bool)

(assert (=> mapNonEmpty!56395 m!1219083))

(declare-fun m!1219085 () Bool)

(assert (=> b!1329848 m!1219085))

(declare-fun m!1219087 () Bool)

(assert (=> b!1329847 m!1219087))

(declare-fun m!1219089 () Bool)

(assert (=> start!112400 m!1219089))

(declare-fun m!1219091 () Bool)

(assert (=> start!112400 m!1219091))

(declare-fun m!1219093 () Bool)

(assert (=> start!112400 m!1219093))

(check-sat tp_is_empty!36481 (not b!1329848) (not mapNonEmpty!56395) (not b!1329843) (not b!1329847) (not start!112400) b_and!49223 (not b_next!30571))
(check-sat b_and!49223 (not b_next!30571))
