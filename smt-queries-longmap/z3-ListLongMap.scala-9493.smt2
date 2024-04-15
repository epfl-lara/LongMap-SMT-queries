; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112566 () Bool)

(assert start!112566)

(declare-fun b_free!30961 () Bool)

(declare-fun b_next!30961 () Bool)

(assert (=> start!112566 (= b_free!30961 (not b_next!30961))))

(declare-fun tp!108521 () Bool)

(declare-fun b_and!49851 () Bool)

(assert (=> start!112566 (= tp!108521 b_and!49851)))

(declare-fun b!1335203 () Bool)

(declare-fun res!886161 () Bool)

(declare-fun e!760456 () Bool)

(assert (=> b!1335203 (=> (not res!886161) (not e!760456))))

(declare-datatypes ((array!90547 0))(
  ( (array!90548 (arr!43740 (Array (_ BitVec 32) (_ BitVec 64))) (size!44292 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90547)

(declare-datatypes ((List!31067 0))(
  ( (Nil!31064) (Cons!31063 (h!32272 (_ BitVec 64)) (t!45323 List!31067)) )
))
(declare-fun arrayNoDuplicates!0 (array!90547 (_ BitVec 32) List!31067) Bool)

(assert (=> b!1335203 (= res!886161 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31064))))

(declare-fun b!1335204 () Bool)

(declare-fun e!760457 () Bool)

(declare-fun tp_is_empty!36871 () Bool)

(assert (=> b!1335204 (= e!760457 tp_is_empty!36871)))

(declare-fun res!886164 () Bool)

(assert (=> start!112566 (=> (not res!886164) (not e!760456))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112566 (= res!886164 (validMask!0 mask!1998))))

(assert (=> start!112566 e!760456))

(declare-datatypes ((V!54265 0))(
  ( (V!54266 (val!18510 Int)) )
))
(declare-datatypes ((ValueCell!17537 0))(
  ( (ValueCellFull!17537 (v!21146 V!54265)) (EmptyCell!17537) )
))
(declare-datatypes ((array!90549 0))(
  ( (array!90550 (arr!43741 (Array (_ BitVec 32) ValueCell!17537)) (size!44293 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90549)

(declare-fun e!760459 () Bool)

(declare-fun array_inv!33185 (array!90549) Bool)

(assert (=> start!112566 (and (array_inv!33185 _values!1320) e!760459)))

(assert (=> start!112566 true))

(declare-fun array_inv!33186 (array!90547) Bool)

(assert (=> start!112566 (array_inv!33186 _keys!1590)))

(assert (=> start!112566 tp!108521))

(assert (=> start!112566 tp_is_empty!36871))

(declare-fun mapIsEmpty!56980 () Bool)

(declare-fun mapRes!56980 () Bool)

(assert (=> mapIsEmpty!56980 mapRes!56980))

(declare-fun b!1335205 () Bool)

(declare-fun res!886165 () Bool)

(assert (=> b!1335205 (=> (not res!886165) (not e!760456))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1335205 (= res!886165 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44292 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1335206 () Bool)

(declare-fun res!886162 () Bool)

(assert (=> b!1335206 (=> (not res!886162) (not e!760456))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90547 (_ BitVec 32)) Bool)

(assert (=> b!1335206 (= res!886162 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1335207 () Bool)

(declare-fun e!760458 () Bool)

(assert (=> b!1335207 (= e!760458 tp_is_empty!36871)))

(declare-fun b!1335208 () Bool)

(assert (=> b!1335208 (= e!760456 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54265)

(declare-fun zeroValue!1262 () V!54265)

(declare-fun lt!592252 () Bool)

(declare-datatypes ((tuple2!23930 0))(
  ( (tuple2!23931 (_1!11976 (_ BitVec 64)) (_2!11976 V!54265)) )
))
(declare-datatypes ((List!31068 0))(
  ( (Nil!31065) (Cons!31064 (h!32273 tuple2!23930) (t!45324 List!31068)) )
))
(declare-datatypes ((ListLongMap!21587 0))(
  ( (ListLongMap!21588 (toList!10809 List!31068)) )
))
(declare-fun contains!8901 (ListLongMap!21587 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5663 (array!90547 array!90549 (_ BitVec 32) (_ BitVec 32) V!54265 V!54265 (_ BitVec 32) Int) ListLongMap!21587)

(assert (=> b!1335208 (= lt!592252 (contains!8901 (getCurrentListMap!5663 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1335209 () Bool)

(assert (=> b!1335209 (= e!760459 (and e!760458 mapRes!56980))))

(declare-fun condMapEmpty!56980 () Bool)

(declare-fun mapDefault!56980 () ValueCell!17537)

(assert (=> b!1335209 (= condMapEmpty!56980 (= (arr!43741 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17537)) mapDefault!56980)))))

(declare-fun b!1335210 () Bool)

(declare-fun res!886163 () Bool)

(assert (=> b!1335210 (=> (not res!886163) (not e!760456))))

(assert (=> b!1335210 (= res!886163 (and (= (size!44293 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44292 _keys!1590) (size!44293 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56980 () Bool)

(declare-fun tp!108520 () Bool)

(assert (=> mapNonEmpty!56980 (= mapRes!56980 (and tp!108520 e!760457))))

(declare-fun mapValue!56980 () ValueCell!17537)

(declare-fun mapRest!56980 () (Array (_ BitVec 32) ValueCell!17537))

(declare-fun mapKey!56980 () (_ BitVec 32))

(assert (=> mapNonEmpty!56980 (= (arr!43741 _values!1320) (store mapRest!56980 mapKey!56980 mapValue!56980))))

(assert (= (and start!112566 res!886164) b!1335210))

(assert (= (and b!1335210 res!886163) b!1335206))

(assert (= (and b!1335206 res!886162) b!1335203))

(assert (= (and b!1335203 res!886161) b!1335205))

(assert (= (and b!1335205 res!886165) b!1335208))

(assert (= (and b!1335209 condMapEmpty!56980) mapIsEmpty!56980))

(assert (= (and b!1335209 (not condMapEmpty!56980)) mapNonEmpty!56980))

(get-info :version)

(assert (= (and mapNonEmpty!56980 ((_ is ValueCellFull!17537) mapValue!56980)) b!1335204))

(assert (= (and b!1335209 ((_ is ValueCellFull!17537) mapDefault!56980)) b!1335207))

(assert (= start!112566 b!1335209))

(declare-fun m!1222875 () Bool)

(assert (=> b!1335203 m!1222875))

(declare-fun m!1222877 () Bool)

(assert (=> b!1335206 m!1222877))

(declare-fun m!1222879 () Bool)

(assert (=> start!112566 m!1222879))

(declare-fun m!1222881 () Bool)

(assert (=> start!112566 m!1222881))

(declare-fun m!1222883 () Bool)

(assert (=> start!112566 m!1222883))

(declare-fun m!1222885 () Bool)

(assert (=> b!1335208 m!1222885))

(assert (=> b!1335208 m!1222885))

(declare-fun m!1222887 () Bool)

(assert (=> b!1335208 m!1222887))

(declare-fun m!1222889 () Bool)

(assert (=> mapNonEmpty!56980 m!1222889))

(check-sat (not mapNonEmpty!56980) (not start!112566) (not b!1335208) b_and!49851 (not b!1335206) (not b!1335203) (not b_next!30961) tp_is_empty!36871)
(check-sat b_and!49851 (not b_next!30961))
