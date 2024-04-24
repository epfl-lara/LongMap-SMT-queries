; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84142 () Bool)

(assert start!84142)

(declare-fun b_free!19729 () Bool)

(declare-fun b_next!19729 () Bool)

(assert (=> start!84142 (= b_free!19729 (not b_next!19729))))

(declare-fun tp!68711 () Bool)

(declare-fun b_and!31557 () Bool)

(assert (=> start!84142 (= tp!68711 b_and!31557)))

(declare-fun mapNonEmpty!36194 () Bool)

(declare-fun mapRes!36194 () Bool)

(declare-fun tp!68710 () Bool)

(declare-fun e!553799 () Bool)

(assert (=> mapNonEmpty!36194 (= mapRes!36194 (and tp!68710 e!553799))))

(declare-datatypes ((V!35353 0))(
  ( (V!35354 (val!11439 Int)) )
))
(declare-datatypes ((ValueCell!10907 0))(
  ( (ValueCellFull!10907 (v!13998 V!35353)) (EmptyCell!10907) )
))
(declare-datatypes ((array!61586 0))(
  ( (array!61587 (arr!29646 (Array (_ BitVec 32) ValueCell!10907)) (size!30126 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61586)

(declare-fun mapValue!36194 () ValueCell!10907)

(declare-fun mapRest!36194 () (Array (_ BitVec 32) ValueCell!10907))

(declare-fun mapKey!36194 () (_ BitVec 32))

(assert (=> mapNonEmpty!36194 (= (arr!29646 _values!1278) (store mapRest!36194 mapKey!36194 mapValue!36194))))

(declare-fun b!982215 () Bool)

(declare-fun res!657011 () Bool)

(declare-fun e!553798 () Bool)

(assert (=> b!982215 (=> (not res!657011) (not e!553798))))

(declare-datatypes ((array!61588 0))(
  ( (array!61589 (arr!29647 (Array (_ BitVec 32) (_ BitVec 64))) (size!30127 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61588)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!982215 (= res!657011 (validKeyInArray!0 (select (arr!29647 _keys!1544) from!1932)))))

(declare-fun b!982216 () Bool)

(declare-fun res!657015 () Bool)

(assert (=> b!982216 (=> (not res!657015) (not e!553798))))

(assert (=> b!982216 (= res!657015 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30127 _keys!1544))))))

(declare-fun b!982217 () Bool)

(declare-fun res!657016 () Bool)

(assert (=> b!982217 (=> (not res!657016) (not e!553798))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61588 (_ BitVec 32)) Bool)

(assert (=> b!982217 (= res!657016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!982218 () Bool)

(declare-fun tp_is_empty!22777 () Bool)

(assert (=> b!982218 (= e!553799 tp_is_empty!22777)))

(declare-fun b!982219 () Bool)

(assert (=> b!982219 (= e!553798 false)))

(declare-fun minValue!1220 () V!35353)

(declare-fun zeroValue!1220 () V!35353)

(declare-fun defaultEntry!1281 () Int)

(declare-datatypes ((tuple2!14652 0))(
  ( (tuple2!14653 (_1!7337 (_ BitVec 64)) (_2!7337 V!35353)) )
))
(declare-datatypes ((List!20530 0))(
  ( (Nil!20527) (Cons!20526 (h!21694 tuple2!14652) (t!29205 List!20530)) )
))
(declare-datatypes ((ListLongMap!13351 0))(
  ( (ListLongMap!13352 (toList!6691 List!20530)) )
))
(declare-fun lt!436035 () ListLongMap!13351)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3437 (array!61588 array!61586 (_ BitVec 32) (_ BitVec 32) V!35353 V!35353 (_ BitVec 32) Int) ListLongMap!13351)

(assert (=> b!982219 (= lt!436035 (getCurrentListMapNoExtraKeys!3437 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!982220 () Bool)

(declare-fun res!657013 () Bool)

(assert (=> b!982220 (=> (not res!657013) (not e!553798))))

(assert (=> b!982220 (= res!657013 (and (= (size!30126 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30127 _keys!1544) (size!30126 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!982221 () Bool)

(declare-fun res!657010 () Bool)

(assert (=> b!982221 (=> (not res!657010) (not e!553798))))

(declare-datatypes ((List!20531 0))(
  ( (Nil!20528) (Cons!20527 (h!21695 (_ BitVec 64)) (t!29206 List!20531)) )
))
(declare-fun arrayNoDuplicates!0 (array!61588 (_ BitVec 32) List!20531) Bool)

(assert (=> b!982221 (= res!657010 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20528))))

(declare-fun mapIsEmpty!36194 () Bool)

(assert (=> mapIsEmpty!36194 mapRes!36194))

(declare-fun b!982222 () Bool)

(declare-fun res!657014 () Bool)

(assert (=> b!982222 (=> (not res!657014) (not e!553798))))

(assert (=> b!982222 (= res!657014 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!982223 () Bool)

(declare-fun e!553796 () Bool)

(declare-fun e!553797 () Bool)

(assert (=> b!982223 (= e!553796 (and e!553797 mapRes!36194))))

(declare-fun condMapEmpty!36194 () Bool)

(declare-fun mapDefault!36194 () ValueCell!10907)

(assert (=> b!982223 (= condMapEmpty!36194 (= (arr!29646 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10907)) mapDefault!36194)))))

(declare-fun b!982224 () Bool)

(assert (=> b!982224 (= e!553797 tp_is_empty!22777)))

(declare-fun res!657012 () Bool)

(assert (=> start!84142 (=> (not res!657012) (not e!553798))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84142 (= res!657012 (validMask!0 mask!1948))))

(assert (=> start!84142 e!553798))

(assert (=> start!84142 true))

(assert (=> start!84142 tp_is_empty!22777))

(declare-fun array_inv!22943 (array!61586) Bool)

(assert (=> start!84142 (and (array_inv!22943 _values!1278) e!553796)))

(assert (=> start!84142 tp!68711))

(declare-fun array_inv!22944 (array!61588) Bool)

(assert (=> start!84142 (array_inv!22944 _keys!1544)))

(assert (= (and start!84142 res!657012) b!982220))

(assert (= (and b!982220 res!657013) b!982217))

(assert (= (and b!982217 res!657016) b!982221))

(assert (= (and b!982221 res!657010) b!982216))

(assert (= (and b!982216 res!657015) b!982215))

(assert (= (and b!982215 res!657011) b!982222))

(assert (= (and b!982222 res!657014) b!982219))

(assert (= (and b!982223 condMapEmpty!36194) mapIsEmpty!36194))

(assert (= (and b!982223 (not condMapEmpty!36194)) mapNonEmpty!36194))

(get-info :version)

(assert (= (and mapNonEmpty!36194 ((_ is ValueCellFull!10907) mapValue!36194)) b!982218))

(assert (= (and b!982223 ((_ is ValueCellFull!10907) mapDefault!36194)) b!982224))

(assert (= start!84142 b!982223))

(declare-fun m!910013 () Bool)

(assert (=> b!982221 m!910013))

(declare-fun m!910015 () Bool)

(assert (=> b!982219 m!910015))

(declare-fun m!910017 () Bool)

(assert (=> start!84142 m!910017))

(declare-fun m!910019 () Bool)

(assert (=> start!84142 m!910019))

(declare-fun m!910021 () Bool)

(assert (=> start!84142 m!910021))

(declare-fun m!910023 () Bool)

(assert (=> b!982217 m!910023))

(declare-fun m!910025 () Bool)

(assert (=> mapNonEmpty!36194 m!910025))

(declare-fun m!910027 () Bool)

(assert (=> b!982215 m!910027))

(assert (=> b!982215 m!910027))

(declare-fun m!910029 () Bool)

(assert (=> b!982215 m!910029))

(check-sat (not b!982215) (not mapNonEmpty!36194) tp_is_empty!22777 (not b!982217) (not start!84142) (not b!982221) (not b!982219) (not b_next!19729) b_and!31557)
(check-sat b_and!31557 (not b_next!19729))
