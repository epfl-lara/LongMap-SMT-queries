; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110560 () Bool)

(assert start!110560)

(declare-fun b_free!29395 () Bool)

(declare-fun b_next!29395 () Bool)

(assert (=> start!110560 (= b_free!29395 (not b_next!29395))))

(declare-fun tp!103507 () Bool)

(declare-fun b_and!47585 () Bool)

(assert (=> start!110560 (= tp!103507 b_and!47585)))

(declare-fun b!1307817 () Bool)

(declare-fun res!868131 () Bool)

(declare-fun e!746292 () Bool)

(assert (=> b!1307817 (=> (not res!868131) (not e!746292))))

(declare-datatypes ((array!87165 0))(
  ( (array!87166 (arr!42063 (Array (_ BitVec 32) (_ BitVec 64))) (size!42615 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87165)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87165 (_ BitVec 32)) Bool)

(assert (=> b!1307817 (= res!868131 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun res!868125 () Bool)

(assert (=> start!110560 (=> (not res!868125) (not e!746292))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110560 (= res!868125 (validMask!0 mask!2040))))

(assert (=> start!110560 e!746292))

(assert (=> start!110560 tp!103507))

(declare-fun array_inv!31989 (array!87165) Bool)

(assert (=> start!110560 (array_inv!31989 _keys!1628)))

(assert (=> start!110560 true))

(declare-fun tp_is_empty!35125 () Bool)

(assert (=> start!110560 tp_is_empty!35125))

(declare-datatypes ((V!51937 0))(
  ( (V!51938 (val!17637 Int)) )
))
(declare-datatypes ((ValueCell!16664 0))(
  ( (ValueCellFull!16664 (v!20263 V!51937)) (EmptyCell!16664) )
))
(declare-datatypes ((array!87167 0))(
  ( (array!87168 (arr!42064 (Array (_ BitVec 32) ValueCell!16664)) (size!42616 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87167)

(declare-fun e!746293 () Bool)

(declare-fun array_inv!31990 (array!87167) Bool)

(assert (=> start!110560 (and (array_inv!31990 _values!1354) e!746293)))

(declare-fun b!1307818 () Bool)

(declare-fun e!746294 () Bool)

(assert (=> b!1307818 (= e!746294 tp_is_empty!35125)))

(declare-fun mapNonEmpty!54316 () Bool)

(declare-fun mapRes!54316 () Bool)

(declare-fun tp!103508 () Bool)

(declare-fun e!746291 () Bool)

(assert (=> mapNonEmpty!54316 (= mapRes!54316 (and tp!103508 e!746291))))

(declare-fun mapValue!54316 () ValueCell!16664)

(declare-fun mapKey!54316 () (_ BitVec 32))

(declare-fun mapRest!54316 () (Array (_ BitVec 32) ValueCell!16664))

(assert (=> mapNonEmpty!54316 (= (arr!42064 _values!1354) (store mapRest!54316 mapKey!54316 mapValue!54316))))

(declare-fun b!1307819 () Bool)

(declare-fun res!868127 () Bool)

(assert (=> b!1307819 (=> (not res!868127) (not e!746292))))

(declare-datatypes ((List!29916 0))(
  ( (Nil!29913) (Cons!29912 (h!31121 (_ BitVec 64)) (t!43514 List!29916)) )
))
(declare-fun arrayNoDuplicates!0 (array!87165 (_ BitVec 32) List!29916) Bool)

(assert (=> b!1307819 (= res!868127 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29913))))

(declare-fun b!1307820 () Bool)

(declare-fun res!868132 () Bool)

(assert (=> b!1307820 (=> (not res!868132) (not e!746292))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1307820 (= res!868132 (not (= (select (arr!42063 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1307821 () Bool)

(declare-fun res!868130 () Bool)

(assert (=> b!1307821 (=> (not res!868130) (not e!746292))))

(assert (=> b!1307821 (= res!868130 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42615 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1307822 () Bool)

(assert (=> b!1307822 (= e!746293 (and e!746294 mapRes!54316))))

(declare-fun condMapEmpty!54316 () Bool)

(declare-fun mapDefault!54316 () ValueCell!16664)

(assert (=> b!1307822 (= condMapEmpty!54316 (= (arr!42064 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16664)) mapDefault!54316)))))

(declare-fun b!1307823 () Bool)

(declare-fun res!868128 () Bool)

(assert (=> b!1307823 (=> (not res!868128) (not e!746292))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1307823 (= res!868128 (validKeyInArray!0 (select (arr!42063 _keys!1628) from!2020)))))

(declare-fun b!1307824 () Bool)

(declare-fun res!868126 () Bool)

(assert (=> b!1307824 (=> (not res!868126) (not e!746292))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1307824 (= res!868126 (and (= (size!42616 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42615 _keys!1628) (size!42616 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1307825 () Bool)

(declare-fun res!868129 () Bool)

(assert (=> b!1307825 (=> (not res!868129) (not e!746292))))

(assert (=> b!1307825 (= res!868129 (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1307826 () Bool)

(assert (=> b!1307826 (= e!746292 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!51937)

(declare-fun zeroValue!1296 () V!51937)

(declare-datatypes ((tuple2!22790 0))(
  ( (tuple2!22791 (_1!11406 (_ BitVec 64)) (_2!11406 V!51937)) )
))
(declare-datatypes ((List!29917 0))(
  ( (Nil!29914) (Cons!29913 (h!31122 tuple2!22790) (t!43515 List!29917)) )
))
(declare-datatypes ((ListLongMap!20447 0))(
  ( (ListLongMap!20448 (toList!10239 List!29917)) )
))
(declare-fun contains!8316 (ListLongMap!20447 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5134 (array!87165 array!87167 (_ BitVec 32) (_ BitVec 32) V!51937 V!51937 (_ BitVec 32) Int) ListLongMap!20447)

(assert (=> b!1307826 (contains!8316 (getCurrentListMap!5134 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43113 0))(
  ( (Unit!43114) )
))
(declare-fun lt!584925 () Unit!43113)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!1 (array!87165 array!87167 (_ BitVec 32) (_ BitVec 32) V!51937 V!51937 (_ BitVec 64) (_ BitVec 32) Int) Unit!43113)

(assert (=> b!1307826 (= lt!584925 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!1 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1307827 () Bool)

(declare-fun res!868124 () Bool)

(assert (=> b!1307827 (=> (not res!868124) (not e!746292))))

(assert (=> b!1307827 (= res!868124 (contains!8316 (getCurrentListMap!5134 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapIsEmpty!54316 () Bool)

(assert (=> mapIsEmpty!54316 mapRes!54316))

(declare-fun b!1307828 () Bool)

(assert (=> b!1307828 (= e!746291 tp_is_empty!35125)))

(assert (= (and start!110560 res!868125) b!1307824))

(assert (= (and b!1307824 res!868126) b!1307817))

(assert (= (and b!1307817 res!868131) b!1307819))

(assert (= (and b!1307819 res!868127) b!1307821))

(assert (= (and b!1307821 res!868130) b!1307827))

(assert (= (and b!1307827 res!868124) b!1307820))

(assert (= (and b!1307820 res!868132) b!1307823))

(assert (= (and b!1307823 res!868128) b!1307825))

(assert (= (and b!1307825 res!868129) b!1307826))

(assert (= (and b!1307822 condMapEmpty!54316) mapIsEmpty!54316))

(assert (= (and b!1307822 (not condMapEmpty!54316)) mapNonEmpty!54316))

(get-info :version)

(assert (= (and mapNonEmpty!54316 ((_ is ValueCellFull!16664) mapValue!54316)) b!1307828))

(assert (= (and b!1307822 ((_ is ValueCellFull!16664) mapDefault!54316)) b!1307818))

(assert (= start!110560 b!1307822))

(declare-fun m!1197909 () Bool)

(assert (=> b!1307823 m!1197909))

(assert (=> b!1307823 m!1197909))

(declare-fun m!1197911 () Bool)

(assert (=> b!1307823 m!1197911))

(declare-fun m!1197913 () Bool)

(assert (=> b!1307817 m!1197913))

(declare-fun m!1197915 () Bool)

(assert (=> mapNonEmpty!54316 m!1197915))

(declare-fun m!1197917 () Bool)

(assert (=> b!1307826 m!1197917))

(assert (=> b!1307826 m!1197917))

(declare-fun m!1197919 () Bool)

(assert (=> b!1307826 m!1197919))

(declare-fun m!1197921 () Bool)

(assert (=> b!1307826 m!1197921))

(declare-fun m!1197923 () Bool)

(assert (=> start!110560 m!1197923))

(declare-fun m!1197925 () Bool)

(assert (=> start!110560 m!1197925))

(declare-fun m!1197927 () Bool)

(assert (=> start!110560 m!1197927))

(declare-fun m!1197929 () Bool)

(assert (=> b!1307827 m!1197929))

(assert (=> b!1307827 m!1197929))

(declare-fun m!1197931 () Bool)

(assert (=> b!1307827 m!1197931))

(assert (=> b!1307820 m!1197909))

(declare-fun m!1197933 () Bool)

(assert (=> b!1307819 m!1197933))

(check-sat tp_is_empty!35125 (not b_next!29395) (not b!1307827) (not start!110560) (not mapNonEmpty!54316) (not b!1307817) (not b!1307826) (not b!1307819) (not b!1307823) b_and!47585)
(check-sat b_and!47585 (not b_next!29395))
