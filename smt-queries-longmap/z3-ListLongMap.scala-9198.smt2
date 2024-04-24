; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110760 () Bool)

(assert start!110760)

(declare-fun b_free!29371 () Bool)

(declare-fun b_next!29371 () Bool)

(assert (=> start!110760 (= b_free!29371 (not b_next!29371))))

(declare-fun tp!103434 () Bool)

(declare-fun b_and!47581 () Bool)

(assert (=> start!110760 (= tp!103434 b_and!47581)))

(declare-fun b!1308890 () Bool)

(declare-fun res!868483 () Bool)

(declare-fun e!746988 () Bool)

(assert (=> b!1308890 (=> (not res!868483) (not e!746988))))

(declare-datatypes ((array!87261 0))(
  ( (array!87262 (arr!42106 (Array (_ BitVec 32) (_ BitVec 64))) (size!42657 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87261)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!51905 0))(
  ( (V!51906 (val!17625 Int)) )
))
(declare-datatypes ((ValueCell!16652 0))(
  ( (ValueCellFull!16652 (v!20247 V!51905)) (EmptyCell!16652) )
))
(declare-datatypes ((array!87263 0))(
  ( (array!87264 (arr!42107 (Array (_ BitVec 32) ValueCell!16652)) (size!42658 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87263)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1308890 (= res!868483 (and (= (size!42658 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42657 _keys!1628) (size!42658 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1308891 () Bool)

(declare-fun e!746989 () Bool)

(declare-fun e!746990 () Bool)

(declare-fun mapRes!54280 () Bool)

(assert (=> b!1308891 (= e!746989 (and e!746990 mapRes!54280))))

(declare-fun condMapEmpty!54280 () Bool)

(declare-fun mapDefault!54280 () ValueCell!16652)

(assert (=> b!1308891 (= condMapEmpty!54280 (= (arr!42107 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16652)) mapDefault!54280)))))

(declare-fun mapIsEmpty!54280 () Bool)

(assert (=> mapIsEmpty!54280 mapRes!54280))

(declare-fun b!1308892 () Bool)

(declare-fun res!868486 () Bool)

(assert (=> b!1308892 (=> (not res!868486) (not e!746988))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1308892 (= res!868486 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42657 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!868485 () Bool)

(assert (=> start!110760 (=> (not res!868485) (not e!746988))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110760 (= res!868485 (validMask!0 mask!2040))))

(assert (=> start!110760 e!746988))

(assert (=> start!110760 tp!103434))

(declare-fun array_inv!32083 (array!87261) Bool)

(assert (=> start!110760 (array_inv!32083 _keys!1628)))

(assert (=> start!110760 true))

(declare-fun tp_is_empty!35101 () Bool)

(assert (=> start!110760 tp_is_empty!35101))

(declare-fun array_inv!32084 (array!87263) Bool)

(assert (=> start!110760 (and (array_inv!32084 _values!1354) e!746989)))

(declare-fun mapNonEmpty!54280 () Bool)

(declare-fun tp!103435 () Bool)

(declare-fun e!746987 () Bool)

(assert (=> mapNonEmpty!54280 (= mapRes!54280 (and tp!103435 e!746987))))

(declare-fun mapRest!54280 () (Array (_ BitVec 32) ValueCell!16652))

(declare-fun mapKey!54280 () (_ BitVec 32))

(declare-fun mapValue!54280 () ValueCell!16652)

(assert (=> mapNonEmpty!54280 (= (arr!42107 _values!1354) (store mapRest!54280 mapKey!54280 mapValue!54280))))

(declare-fun b!1308893 () Bool)

(assert (=> b!1308893 (= e!746988 false)))

(declare-fun lt!585551 () Bool)

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!51905)

(declare-fun zeroValue!1296 () V!51905)

(declare-datatypes ((tuple2!22718 0))(
  ( (tuple2!22719 (_1!11370 (_ BitVec 64)) (_2!11370 V!51905)) )
))
(declare-datatypes ((List!29884 0))(
  ( (Nil!29881) (Cons!29880 (h!31098 tuple2!22718) (t!43482 List!29884)) )
))
(declare-datatypes ((ListLongMap!20383 0))(
  ( (ListLongMap!20384 (toList!10207 List!29884)) )
))
(declare-fun contains!8369 (ListLongMap!20383 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5211 (array!87261 array!87263 (_ BitVec 32) (_ BitVec 32) V!51905 V!51905 (_ BitVec 32) Int) ListLongMap!20383)

(assert (=> b!1308893 (= lt!585551 (contains!8369 (getCurrentListMap!5211 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1308894 () Bool)

(assert (=> b!1308894 (= e!746990 tp_is_empty!35101)))

(declare-fun b!1308895 () Bool)

(assert (=> b!1308895 (= e!746987 tp_is_empty!35101)))

(declare-fun b!1308896 () Bool)

(declare-fun res!868484 () Bool)

(assert (=> b!1308896 (=> (not res!868484) (not e!746988))))

(declare-datatypes ((List!29885 0))(
  ( (Nil!29882) (Cons!29881 (h!31099 (_ BitVec 64)) (t!43483 List!29885)) )
))
(declare-fun arrayNoDuplicates!0 (array!87261 (_ BitVec 32) List!29885) Bool)

(assert (=> b!1308896 (= res!868484 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29882))))

(declare-fun b!1308897 () Bool)

(declare-fun res!868487 () Bool)

(assert (=> b!1308897 (=> (not res!868487) (not e!746988))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87261 (_ BitVec 32)) Bool)

(assert (=> b!1308897 (= res!868487 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(assert (= (and start!110760 res!868485) b!1308890))

(assert (= (and b!1308890 res!868483) b!1308897))

(assert (= (and b!1308897 res!868487) b!1308896))

(assert (= (and b!1308896 res!868484) b!1308892))

(assert (= (and b!1308892 res!868486) b!1308893))

(assert (= (and b!1308891 condMapEmpty!54280) mapIsEmpty!54280))

(assert (= (and b!1308891 (not condMapEmpty!54280)) mapNonEmpty!54280))

(get-info :version)

(assert (= (and mapNonEmpty!54280 ((_ is ValueCellFull!16652) mapValue!54280)) b!1308895))

(assert (= (and b!1308891 ((_ is ValueCellFull!16652) mapDefault!54280)) b!1308894))

(assert (= start!110760 b!1308891))

(declare-fun m!1199831 () Bool)

(assert (=> b!1308897 m!1199831))

(declare-fun m!1199833 () Bool)

(assert (=> mapNonEmpty!54280 m!1199833))

(declare-fun m!1199835 () Bool)

(assert (=> b!1308893 m!1199835))

(assert (=> b!1308893 m!1199835))

(declare-fun m!1199837 () Bool)

(assert (=> b!1308893 m!1199837))

(declare-fun m!1199839 () Bool)

(assert (=> b!1308896 m!1199839))

(declare-fun m!1199841 () Bool)

(assert (=> start!110760 m!1199841))

(declare-fun m!1199843 () Bool)

(assert (=> start!110760 m!1199843))

(declare-fun m!1199845 () Bool)

(assert (=> start!110760 m!1199845))

(check-sat (not b!1308893) (not b_next!29371) (not mapNonEmpty!54280) (not start!110760) (not b!1308897) b_and!47581 (not b!1308896) tp_is_empty!35101)
(check-sat b_and!47581 (not b_next!29371))
