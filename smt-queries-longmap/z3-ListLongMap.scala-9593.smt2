; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113644 () Bool)

(assert start!113644)

(declare-fun b_free!31471 () Bool)

(declare-fun b_next!31471 () Bool)

(assert (=> start!113644 (= b_free!31471 (not b_next!31471))))

(declare-fun tp!110218 () Bool)

(declare-fun b_and!50761 () Bool)

(assert (=> start!113644 (= tp!110218 b_and!50761)))

(declare-fun b!1347693 () Bool)

(declare-fun res!893915 () Bool)

(declare-fun e!766935 () Bool)

(assert (=> b!1347693 (=> (not res!893915) (not e!766935))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91887 0))(
  ( (array!91888 (arr!44395 (Array (_ BitVec 32) (_ BitVec 64))) (size!44946 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91887)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1347693 (= res!893915 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44946 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1347694 () Bool)

(assert (=> b!1347694 (= e!766935 false)))

(declare-datatypes ((V!55065 0))(
  ( (V!55066 (val!18810 Int)) )
))
(declare-fun minValue!1245 () V!55065)

(declare-fun lt!595985 () Bool)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun zeroValue!1245 () V!55065)

(declare-datatypes ((ValueCell!17837 0))(
  ( (ValueCellFull!17837 (v!21453 V!55065)) (EmptyCell!17837) )
))
(declare-datatypes ((array!91889 0))(
  ( (array!91890 (arr!44396 (Array (_ BitVec 32) ValueCell!17837)) (size!44947 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91889)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24294 0))(
  ( (tuple2!24295 (_1!12158 (_ BitVec 64)) (_2!12158 V!55065)) )
))
(declare-datatypes ((List!31434 0))(
  ( (Nil!31431) (Cons!31430 (h!32648 tuple2!24294) (t!46016 List!31434)) )
))
(declare-datatypes ((ListLongMap!21959 0))(
  ( (ListLongMap!21960 (toList!10995 List!31434)) )
))
(declare-fun contains!9183 (ListLongMap!21959 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5935 (array!91887 array!91889 (_ BitVec 32) (_ BitVec 32) V!55065 V!55065 (_ BitVec 32) Int) ListLongMap!21959)

(assert (=> b!1347694 (= lt!595985 (contains!9183 (getCurrentListMap!5935 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1347695 () Bool)

(declare-fun e!766936 () Bool)

(declare-fun tp_is_empty!37471 () Bool)

(assert (=> b!1347695 (= e!766936 tp_is_empty!37471)))

(declare-fun b!1347696 () Bool)

(declare-fun e!766933 () Bool)

(assert (=> b!1347696 (= e!766933 tp_is_empty!37471)))

(declare-fun res!893914 () Bool)

(assert (=> start!113644 (=> (not res!893914) (not e!766935))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113644 (= res!893914 (validMask!0 mask!1977))))

(assert (=> start!113644 e!766935))

(assert (=> start!113644 tp_is_empty!37471))

(assert (=> start!113644 true))

(declare-fun array_inv!33711 (array!91887) Bool)

(assert (=> start!113644 (array_inv!33711 _keys!1571)))

(declare-fun e!766937 () Bool)

(declare-fun array_inv!33712 (array!91889) Bool)

(assert (=> start!113644 (and (array_inv!33712 _values!1303) e!766937)))

(assert (=> start!113644 tp!110218))

(declare-fun b!1347697 () Bool)

(declare-fun mapRes!57913 () Bool)

(assert (=> b!1347697 (= e!766937 (and e!766936 mapRes!57913))))

(declare-fun condMapEmpty!57913 () Bool)

(declare-fun mapDefault!57913 () ValueCell!17837)

(assert (=> b!1347697 (= condMapEmpty!57913 (= (arr!44396 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17837)) mapDefault!57913)))))

(declare-fun b!1347698 () Bool)

(declare-fun res!893916 () Bool)

(assert (=> b!1347698 (=> (not res!893916) (not e!766935))))

(assert (=> b!1347698 (= res!893916 (and (= (size!44947 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44946 _keys!1571) (size!44947 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!57913 () Bool)

(declare-fun tp!110217 () Bool)

(assert (=> mapNonEmpty!57913 (= mapRes!57913 (and tp!110217 e!766933))))

(declare-fun mapKey!57913 () (_ BitVec 32))

(declare-fun mapValue!57913 () ValueCell!17837)

(declare-fun mapRest!57913 () (Array (_ BitVec 32) ValueCell!17837))

(assert (=> mapNonEmpty!57913 (= (arr!44396 _values!1303) (store mapRest!57913 mapKey!57913 mapValue!57913))))

(declare-fun b!1347699 () Bool)

(declare-fun res!893918 () Bool)

(assert (=> b!1347699 (=> (not res!893918) (not e!766935))))

(declare-datatypes ((List!31435 0))(
  ( (Nil!31432) (Cons!31431 (h!32649 (_ BitVec 64)) (t!46017 List!31435)) )
))
(declare-fun arrayNoDuplicates!0 (array!91887 (_ BitVec 32) List!31435) Bool)

(assert (=> b!1347699 (= res!893918 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31432))))

(declare-fun mapIsEmpty!57913 () Bool)

(assert (=> mapIsEmpty!57913 mapRes!57913))

(declare-fun b!1347700 () Bool)

(declare-fun res!893917 () Bool)

(assert (=> b!1347700 (=> (not res!893917) (not e!766935))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91887 (_ BitVec 32)) Bool)

(assert (=> b!1347700 (= res!893917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(assert (= (and start!113644 res!893914) b!1347698))

(assert (= (and b!1347698 res!893916) b!1347700))

(assert (= (and b!1347700 res!893917) b!1347699))

(assert (= (and b!1347699 res!893918) b!1347693))

(assert (= (and b!1347693 res!893915) b!1347694))

(assert (= (and b!1347697 condMapEmpty!57913) mapIsEmpty!57913))

(assert (= (and b!1347697 (not condMapEmpty!57913)) mapNonEmpty!57913))

(get-info :version)

(assert (= (and mapNonEmpty!57913 ((_ is ValueCellFull!17837) mapValue!57913)) b!1347696))

(assert (= (and b!1347697 ((_ is ValueCellFull!17837) mapDefault!57913)) b!1347695))

(assert (= start!113644 b!1347697))

(declare-fun m!1235157 () Bool)

(assert (=> b!1347694 m!1235157))

(assert (=> b!1347694 m!1235157))

(declare-fun m!1235159 () Bool)

(assert (=> b!1347694 m!1235159))

(declare-fun m!1235161 () Bool)

(assert (=> b!1347699 m!1235161))

(declare-fun m!1235163 () Bool)

(assert (=> start!113644 m!1235163))

(declare-fun m!1235165 () Bool)

(assert (=> start!113644 m!1235165))

(declare-fun m!1235167 () Bool)

(assert (=> start!113644 m!1235167))

(declare-fun m!1235169 () Bool)

(assert (=> mapNonEmpty!57913 m!1235169))

(declare-fun m!1235171 () Bool)

(assert (=> b!1347700 m!1235171))

(check-sat (not b!1347699) (not b_next!31471) (not b!1347700) (not b!1347694) tp_is_empty!37471 (not start!113644) (not mapNonEmpty!57913) b_and!50761)
(check-sat b_and!50761 (not b_next!31471))
