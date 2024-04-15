; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83956 () Bool)

(assert start!83956)

(declare-fun b_free!19729 () Bool)

(declare-fun b_next!19729 () Bool)

(assert (=> start!83956 (= b_free!19729 (not b_next!19729))))

(declare-fun tp!68711 () Bool)

(declare-fun b_and!31521 () Bool)

(assert (=> start!83956 (= tp!68711 b_and!31521)))

(declare-fun b!981073 () Bool)

(declare-fun e!553067 () Bool)

(assert (=> b!981073 (= e!553067 false)))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35353 0))(
  ( (V!35354 (val!11439 Int)) )
))
(declare-fun minValue!1220 () V!35353)

(declare-datatypes ((ValueCell!10907 0))(
  ( (ValueCellFull!10907 (v!14000 V!35353)) (EmptyCell!10907) )
))
(declare-datatypes ((array!61484 0))(
  ( (array!61485 (arr!29600 (Array (_ BitVec 32) ValueCell!10907)) (size!30081 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61484)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35353)

(declare-fun defaultEntry!1281 () Int)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61486 0))(
  ( (array!61487 (arr!29601 (Array (_ BitVec 32) (_ BitVec 64))) (size!30082 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61486)

(declare-datatypes ((tuple2!14712 0))(
  ( (tuple2!14713 (_1!7367 (_ BitVec 64)) (_2!7367 V!35353)) )
))
(declare-datatypes ((List!20554 0))(
  ( (Nil!20551) (Cons!20550 (h!21712 tuple2!14712) (t!29228 List!20554)) )
))
(declare-datatypes ((ListLongMap!13399 0))(
  ( (ListLongMap!13400 (toList!6715 List!20554)) )
))
(declare-fun lt!435438 () ListLongMap!13399)

(declare-fun getCurrentListMapNoExtraKeys!3428 (array!61486 array!61484 (_ BitVec 32) (_ BitVec 32) V!35353 V!35353 (_ BitVec 32) Int) ListLongMap!13399)

(assert (=> b!981073 (= lt!435438 (getCurrentListMapNoExtraKeys!3428 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!981074 () Bool)

(declare-fun res!656562 () Bool)

(assert (=> b!981074 (=> (not res!656562) (not e!553067))))

(assert (=> b!981074 (= res!656562 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30082 _keys!1544))))))

(declare-fun b!981075 () Bool)

(declare-fun res!656557 () Bool)

(assert (=> b!981075 (=> (not res!656557) (not e!553067))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!981075 (= res!656557 (validKeyInArray!0 (select (arr!29601 _keys!1544) from!1932)))))

(declare-fun b!981076 () Bool)

(declare-fun res!656556 () Bool)

(assert (=> b!981076 (=> (not res!656556) (not e!553067))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61486 (_ BitVec 32)) Bool)

(assert (=> b!981076 (= res!656556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!981077 () Bool)

(declare-fun res!656558 () Bool)

(assert (=> b!981077 (=> (not res!656558) (not e!553067))))

(declare-datatypes ((List!20555 0))(
  ( (Nil!20552) (Cons!20551 (h!21713 (_ BitVec 64)) (t!29229 List!20555)) )
))
(declare-fun arrayNoDuplicates!0 (array!61486 (_ BitVec 32) List!20555) Bool)

(assert (=> b!981077 (= res!656558 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20552))))

(declare-fun b!981078 () Bool)

(declare-fun e!553068 () Bool)

(declare-fun tp_is_empty!22777 () Bool)

(assert (=> b!981078 (= e!553068 tp_is_empty!22777)))

(declare-fun b!981079 () Bool)

(declare-fun res!656560 () Bool)

(assert (=> b!981079 (=> (not res!656560) (not e!553067))))

(assert (=> b!981079 (= res!656560 (and (= (size!30081 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30082 _keys!1544) (size!30081 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!981081 () Bool)

(declare-fun res!656561 () Bool)

(assert (=> b!981081 (=> (not res!656561) (not e!553067))))

(assert (=> b!981081 (= res!656561 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!36194 () Bool)

(declare-fun mapRes!36194 () Bool)

(declare-fun tp!68710 () Bool)

(declare-fun e!553069 () Bool)

(assert (=> mapNonEmpty!36194 (= mapRes!36194 (and tp!68710 e!553069))))

(declare-fun mapKey!36194 () (_ BitVec 32))

(declare-fun mapValue!36194 () ValueCell!10907)

(declare-fun mapRest!36194 () (Array (_ BitVec 32) ValueCell!10907))

(assert (=> mapNonEmpty!36194 (= (arr!29600 _values!1278) (store mapRest!36194 mapKey!36194 mapValue!36194))))

(declare-fun mapIsEmpty!36194 () Bool)

(assert (=> mapIsEmpty!36194 mapRes!36194))

(declare-fun b!981082 () Bool)

(assert (=> b!981082 (= e!553069 tp_is_empty!22777)))

(declare-fun b!981080 () Bool)

(declare-fun e!553070 () Bool)

(assert (=> b!981080 (= e!553070 (and e!553068 mapRes!36194))))

(declare-fun condMapEmpty!36194 () Bool)

(declare-fun mapDefault!36194 () ValueCell!10907)

(assert (=> b!981080 (= condMapEmpty!36194 (= (arr!29600 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10907)) mapDefault!36194)))))

(declare-fun res!656559 () Bool)

(assert (=> start!83956 (=> (not res!656559) (not e!553067))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83956 (= res!656559 (validMask!0 mask!1948))))

(assert (=> start!83956 e!553067))

(assert (=> start!83956 true))

(assert (=> start!83956 tp_is_empty!22777))

(declare-fun array_inv!22905 (array!61484) Bool)

(assert (=> start!83956 (and (array_inv!22905 _values!1278) e!553070)))

(assert (=> start!83956 tp!68711))

(declare-fun array_inv!22906 (array!61486) Bool)

(assert (=> start!83956 (array_inv!22906 _keys!1544)))

(assert (= (and start!83956 res!656559) b!981079))

(assert (= (and b!981079 res!656560) b!981076))

(assert (= (and b!981076 res!656556) b!981077))

(assert (= (and b!981077 res!656558) b!981074))

(assert (= (and b!981074 res!656562) b!981075))

(assert (= (and b!981075 res!656557) b!981081))

(assert (= (and b!981081 res!656561) b!981073))

(assert (= (and b!981080 condMapEmpty!36194) mapIsEmpty!36194))

(assert (= (and b!981080 (not condMapEmpty!36194)) mapNonEmpty!36194))

(get-info :version)

(assert (= (and mapNonEmpty!36194 ((_ is ValueCellFull!10907) mapValue!36194)) b!981082))

(assert (= (and b!981080 ((_ is ValueCellFull!10907) mapDefault!36194)) b!981078))

(assert (= start!83956 b!981080))

(declare-fun m!907961 () Bool)

(assert (=> b!981077 m!907961))

(declare-fun m!907963 () Bool)

(assert (=> mapNonEmpty!36194 m!907963))

(declare-fun m!907965 () Bool)

(assert (=> b!981075 m!907965))

(assert (=> b!981075 m!907965))

(declare-fun m!907967 () Bool)

(assert (=> b!981075 m!907967))

(declare-fun m!907969 () Bool)

(assert (=> start!83956 m!907969))

(declare-fun m!907971 () Bool)

(assert (=> start!83956 m!907971))

(declare-fun m!907973 () Bool)

(assert (=> start!83956 m!907973))

(declare-fun m!907975 () Bool)

(assert (=> b!981076 m!907975))

(declare-fun m!907977 () Bool)

(assert (=> b!981073 m!907977))

(check-sat (not b!981076) (not start!83956) b_and!31521 (not b!981075) (not b_next!19729) (not mapNonEmpty!36194) (not b!981073) tp_is_empty!22777 (not b!981077))
(check-sat b_and!31521 (not b_next!19729))
