; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4634 () Bool)

(assert start!4634)

(declare-fun b_free!1285 () Bool)

(declare-fun b_next!1285 () Bool)

(assert (=> start!4634 (= b_free!1285 (not b_next!1285))))

(declare-fun tp!5306 () Bool)

(declare-fun b_and!2109 () Bool)

(assert (=> start!4634 (= tp!5306 b_and!2109)))

(declare-fun mapIsEmpty!2018 () Bool)

(declare-fun mapRes!2018 () Bool)

(assert (=> mapIsEmpty!2018 mapRes!2018))

(declare-fun b!36162 () Bool)

(declare-fun e!22831 () Bool)

(assert (=> b!36162 (= e!22831 false)))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!2011 0))(
  ( (V!2012 (val!846 Int)) )
))
(declare-datatypes ((ValueCell!620 0))(
  ( (ValueCellFull!620 (v!1946 V!2011)) (EmptyCell!620) )
))
(declare-datatypes ((array!2481 0))(
  ( (array!2482 (arr!1184 (Array (_ BitVec 32) ValueCell!620)) (size!1285 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2481)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!2483 0))(
  ( (array!2484 (arr!1185 (Array (_ BitVec 32) (_ BitVec 64))) (size!1286 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2483)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun lt!13396 () Bool)

(declare-fun zeroValue!1443 () V!2011)

(declare-fun minValue!1443 () V!2011)

(declare-datatypes ((tuple2!1338 0))(
  ( (tuple2!1339 (_1!680 (_ BitVec 64)) (_2!680 V!2011)) )
))
(declare-datatypes ((List!936 0))(
  ( (Nil!933) (Cons!932 (h!1500 tuple2!1338) (t!3643 List!936)) )
))
(declare-datatypes ((ListLongMap!909 0))(
  ( (ListLongMap!910 (toList!470 List!936)) )
))
(declare-fun contains!423 (ListLongMap!909 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!290 (array!2483 array!2481 (_ BitVec 32) (_ BitVec 32) V!2011 V!2011 (_ BitVec 32) Int) ListLongMap!909)

(assert (=> b!36162 (= lt!13396 (contains!423 (getCurrentListMap!290 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304))))

(declare-fun res!21889 () Bool)

(assert (=> start!4634 (=> (not res!21889) (not e!22831))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4634 (= res!21889 (validMask!0 mask!2294))))

(assert (=> start!4634 e!22831))

(assert (=> start!4634 true))

(assert (=> start!4634 tp!5306))

(declare-fun e!22829 () Bool)

(declare-fun array_inv!815 (array!2481) Bool)

(assert (=> start!4634 (and (array_inv!815 _values!1501) e!22829)))

(declare-fun array_inv!816 (array!2483) Bool)

(assert (=> start!4634 (array_inv!816 _keys!1833)))

(declare-fun tp_is_empty!1639 () Bool)

(assert (=> start!4634 tp_is_empty!1639))

(declare-fun b!36163 () Bool)

(declare-fun e!22833 () Bool)

(assert (=> b!36163 (= e!22829 (and e!22833 mapRes!2018))))

(declare-fun condMapEmpty!2018 () Bool)

(declare-fun mapDefault!2018 () ValueCell!620)

(assert (=> b!36163 (= condMapEmpty!2018 (= (arr!1184 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!620)) mapDefault!2018)))))

(declare-fun b!36164 () Bool)

(assert (=> b!36164 (= e!22833 tp_is_empty!1639)))

(declare-fun b!36165 () Bool)

(declare-fun res!21886 () Bool)

(assert (=> b!36165 (=> (not res!21886) (not e!22831))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!36165 (= res!21886 (validKeyInArray!0 k0!1304))))

(declare-fun b!36166 () Bool)

(declare-fun res!21890 () Bool)

(assert (=> b!36166 (=> (not res!21890) (not e!22831))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2483 (_ BitVec 32)) Bool)

(assert (=> b!36166 (= res!21890 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!36167 () Bool)

(declare-fun res!21887 () Bool)

(assert (=> b!36167 (=> (not res!21887) (not e!22831))))

(declare-datatypes ((List!937 0))(
  ( (Nil!934) (Cons!933 (h!1501 (_ BitVec 64)) (t!3644 List!937)) )
))
(declare-fun arrayNoDuplicates!0 (array!2483 (_ BitVec 32) List!937) Bool)

(assert (=> b!36167 (= res!21887 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!934))))

(declare-fun b!36168 () Bool)

(declare-fun res!21888 () Bool)

(assert (=> b!36168 (=> (not res!21888) (not e!22831))))

(assert (=> b!36168 (= res!21888 (and (= (size!1285 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1286 _keys!1833) (size!1285 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!2018 () Bool)

(declare-fun tp!5305 () Bool)

(declare-fun e!22832 () Bool)

(assert (=> mapNonEmpty!2018 (= mapRes!2018 (and tp!5305 e!22832))))

(declare-fun mapKey!2018 () (_ BitVec 32))

(declare-fun mapValue!2018 () ValueCell!620)

(declare-fun mapRest!2018 () (Array (_ BitVec 32) ValueCell!620))

(assert (=> mapNonEmpty!2018 (= (arr!1184 _values!1501) (store mapRest!2018 mapKey!2018 mapValue!2018))))

(declare-fun b!36169 () Bool)

(assert (=> b!36169 (= e!22832 tp_is_empty!1639)))

(assert (= (and start!4634 res!21889) b!36168))

(assert (= (and b!36168 res!21888) b!36166))

(assert (= (and b!36166 res!21890) b!36167))

(assert (= (and b!36167 res!21887) b!36165))

(assert (= (and b!36165 res!21886) b!36162))

(assert (= (and b!36163 condMapEmpty!2018) mapIsEmpty!2018))

(assert (= (and b!36163 (not condMapEmpty!2018)) mapNonEmpty!2018))

(get-info :version)

(assert (= (and mapNonEmpty!2018 ((_ is ValueCellFull!620) mapValue!2018)) b!36169))

(assert (= (and b!36163 ((_ is ValueCellFull!620) mapDefault!2018)) b!36164))

(assert (= start!4634 b!36163))

(declare-fun m!29059 () Bool)

(assert (=> b!36166 m!29059))

(declare-fun m!29061 () Bool)

(assert (=> b!36162 m!29061))

(assert (=> b!36162 m!29061))

(declare-fun m!29063 () Bool)

(assert (=> b!36162 m!29063))

(declare-fun m!29065 () Bool)

(assert (=> mapNonEmpty!2018 m!29065))

(declare-fun m!29067 () Bool)

(assert (=> b!36167 m!29067))

(declare-fun m!29069 () Bool)

(assert (=> b!36165 m!29069))

(declare-fun m!29071 () Bool)

(assert (=> start!4634 m!29071))

(declare-fun m!29073 () Bool)

(assert (=> start!4634 m!29073))

(declare-fun m!29075 () Bool)

(assert (=> start!4634 m!29075))

(check-sat (not b!36165) tp_is_empty!1639 b_and!2109 (not b!36166) (not mapNonEmpty!2018) (not b!36167) (not start!4634) (not b_next!1285) (not b!36162))
(check-sat b_and!2109 (not b_next!1285))
