; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111198 () Bool)

(assert start!111198)

(declare-fun b_free!29809 () Bool)

(declare-fun b_next!29809 () Bool)

(assert (=> start!111198 (= b_free!29809 (not b_next!29809))))

(declare-fun tp!104748 () Bool)

(declare-fun b_and!48019 () Bool)

(assert (=> start!111198 (= tp!104748 b_and!48019)))

(declare-fun b!1315145 () Bool)

(declare-fun e!750275 () Bool)

(declare-fun tp_is_empty!35539 () Bool)

(assert (=> b!1315145 (= e!750275 tp_is_empty!35539)))

(declare-fun mapNonEmpty!54937 () Bool)

(declare-fun mapRes!54937 () Bool)

(declare-fun tp!104749 () Bool)

(assert (=> mapNonEmpty!54937 (= mapRes!54937 (and tp!104749 e!750275))))

(declare-datatypes ((V!52489 0))(
  ( (V!52490 (val!17844 Int)) )
))
(declare-datatypes ((ValueCell!16871 0))(
  ( (ValueCellFull!16871 (v!20466 V!52489)) (EmptyCell!16871) )
))
(declare-datatypes ((array!88107 0))(
  ( (array!88108 (arr!42529 (Array (_ BitVec 32) ValueCell!16871)) (size!43080 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88107)

(declare-fun mapRest!54937 () (Array (_ BitVec 32) ValueCell!16871))

(declare-fun mapValue!54937 () ValueCell!16871)

(declare-fun mapKey!54937 () (_ BitVec 32))

(assert (=> mapNonEmpty!54937 (= (arr!42529 _values!1354) (store mapRest!54937 mapKey!54937 mapValue!54937))))

(declare-fun res!872771 () Bool)

(declare-fun e!750273 () Bool)

(assert (=> start!111198 (=> (not res!872771) (not e!750273))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111198 (= res!872771 (validMask!0 mask!2040))))

(assert (=> start!111198 e!750273))

(assert (=> start!111198 tp!104748))

(declare-datatypes ((array!88109 0))(
  ( (array!88110 (arr!42530 (Array (_ BitVec 32) (_ BitVec 64))) (size!43081 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88109)

(declare-fun array_inv!32389 (array!88109) Bool)

(assert (=> start!111198 (array_inv!32389 _keys!1628)))

(assert (=> start!111198 true))

(assert (=> start!111198 tp_is_empty!35539))

(declare-fun e!750272 () Bool)

(declare-fun array_inv!32390 (array!88107) Bool)

(assert (=> start!111198 (and (array_inv!32390 _values!1354) e!750272)))

(declare-fun b!1315146 () Bool)

(declare-fun res!872767 () Bool)

(assert (=> b!1315146 (=> (not res!872767) (not e!750273))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1315146 (= res!872767 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43081 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1315147 () Bool)

(declare-fun res!872769 () Bool)

(assert (=> b!1315147 (=> (not res!872769) (not e!750273))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88109 (_ BitVec 32)) Bool)

(assert (=> b!1315147 (= res!872769 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1315148 () Bool)

(assert (=> b!1315148 (= e!750273 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52489)

(declare-fun zeroValue!1296 () V!52489)

(declare-fun lt!586199 () Bool)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!23036 0))(
  ( (tuple2!23037 (_1!11529 (_ BitVec 64)) (_2!11529 V!52489)) )
))
(declare-datatypes ((List!30186 0))(
  ( (Nil!30183) (Cons!30182 (h!31400 tuple2!23036) (t!43784 List!30186)) )
))
(declare-datatypes ((ListLongMap!20701 0))(
  ( (ListLongMap!20702 (toList!10366 List!30186)) )
))
(declare-fun contains!8528 (ListLongMap!20701 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5370 (array!88109 array!88107 (_ BitVec 32) (_ BitVec 32) V!52489 V!52489 (_ BitVec 32) Int) ListLongMap!20701)

(assert (=> b!1315148 (= lt!586199 (contains!8528 (getCurrentListMap!5370 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1315149 () Bool)

(declare-fun e!750274 () Bool)

(assert (=> b!1315149 (= e!750274 tp_is_empty!35539)))

(declare-fun mapIsEmpty!54937 () Bool)

(assert (=> mapIsEmpty!54937 mapRes!54937))

(declare-fun b!1315150 () Bool)

(declare-fun res!872770 () Bool)

(assert (=> b!1315150 (=> (not res!872770) (not e!750273))))

(assert (=> b!1315150 (= res!872770 (and (= (size!43080 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43081 _keys!1628) (size!43080 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1315151 () Bool)

(assert (=> b!1315151 (= e!750272 (and e!750274 mapRes!54937))))

(declare-fun condMapEmpty!54937 () Bool)

(declare-fun mapDefault!54937 () ValueCell!16871)

(assert (=> b!1315151 (= condMapEmpty!54937 (= (arr!42529 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16871)) mapDefault!54937)))))

(declare-fun b!1315152 () Bool)

(declare-fun res!872768 () Bool)

(assert (=> b!1315152 (=> (not res!872768) (not e!750273))))

(declare-datatypes ((List!30187 0))(
  ( (Nil!30184) (Cons!30183 (h!31401 (_ BitVec 64)) (t!43785 List!30187)) )
))
(declare-fun arrayNoDuplicates!0 (array!88109 (_ BitVec 32) List!30187) Bool)

(assert (=> b!1315152 (= res!872768 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30184))))

(assert (= (and start!111198 res!872771) b!1315150))

(assert (= (and b!1315150 res!872770) b!1315147))

(assert (= (and b!1315147 res!872769) b!1315152))

(assert (= (and b!1315152 res!872768) b!1315146))

(assert (= (and b!1315146 res!872767) b!1315148))

(assert (= (and b!1315151 condMapEmpty!54937) mapIsEmpty!54937))

(assert (= (and b!1315151 (not condMapEmpty!54937)) mapNonEmpty!54937))

(get-info :version)

(assert (= (and mapNonEmpty!54937 ((_ is ValueCellFull!16871) mapValue!54937)) b!1315145))

(assert (= (and b!1315151 ((_ is ValueCellFull!16871) mapDefault!54937)) b!1315149))

(assert (= start!111198 b!1315151))

(declare-fun m!1204157 () Bool)

(assert (=> mapNonEmpty!54937 m!1204157))

(declare-fun m!1204159 () Bool)

(assert (=> start!111198 m!1204159))

(declare-fun m!1204161 () Bool)

(assert (=> start!111198 m!1204161))

(declare-fun m!1204163 () Bool)

(assert (=> start!111198 m!1204163))

(declare-fun m!1204165 () Bool)

(assert (=> b!1315148 m!1204165))

(assert (=> b!1315148 m!1204165))

(declare-fun m!1204167 () Bool)

(assert (=> b!1315148 m!1204167))

(declare-fun m!1204169 () Bool)

(assert (=> b!1315152 m!1204169))

(declare-fun m!1204171 () Bool)

(assert (=> b!1315147 m!1204171))

(check-sat (not start!111198) b_and!48019 (not mapNonEmpty!54937) (not b!1315152) (not b!1315148) (not b_next!29809) (not b!1315147) tp_is_empty!35539)
(check-sat b_and!48019 (not b_next!29809))
