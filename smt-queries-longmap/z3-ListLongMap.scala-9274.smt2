; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110992 () Bool)

(assert start!110992)

(declare-fun b_free!29827 () Bool)

(declare-fun b_next!29827 () Bool)

(assert (=> start!110992 (= b_free!29827 (not b_next!29827))))

(declare-fun tp!104803 () Bool)

(declare-fun b_and!48017 () Bool)

(assert (=> start!110992 (= tp!104803 b_and!48017)))

(declare-fun b!1313992 () Bool)

(declare-fun e!749534 () Bool)

(assert (=> b!1313992 (= e!749534 false)))

(declare-fun lt!585564 () Bool)

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87993 0))(
  ( (array!87994 (arr!42477 (Array (_ BitVec 32) (_ BitVec 64))) (size!43029 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87993)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52513 0))(
  ( (V!52514 (val!17853 Int)) )
))
(declare-fun minValue!1296 () V!52513)

(declare-datatypes ((ValueCell!16880 0))(
  ( (ValueCellFull!16880 (v!20479 V!52513)) (EmptyCell!16880) )
))
(declare-datatypes ((array!87995 0))(
  ( (array!87996 (arr!42478 (Array (_ BitVec 32) ValueCell!16880)) (size!43030 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87995)

(declare-fun zeroValue!1296 () V!52513)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!23106 0))(
  ( (tuple2!23107 (_1!11564 (_ BitVec 64)) (_2!11564 V!52513)) )
))
(declare-datatypes ((List!30225 0))(
  ( (Nil!30222) (Cons!30221 (h!31430 tuple2!23106) (t!43823 List!30225)) )
))
(declare-datatypes ((ListLongMap!20763 0))(
  ( (ListLongMap!20764 (toList!10397 List!30225)) )
))
(declare-fun contains!8474 (ListLongMap!20763 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5292 (array!87993 array!87995 (_ BitVec 32) (_ BitVec 32) V!52513 V!52513 (_ BitVec 32) Int) ListLongMap!20763)

(assert (=> b!1313992 (= lt!585564 (contains!8474 (getCurrentListMap!5292 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1313993 () Bool)

(declare-fun res!872355 () Bool)

(assert (=> b!1313993 (=> (not res!872355) (not e!749534))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87993 (_ BitVec 32)) Bool)

(assert (=> b!1313993 (= res!872355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1313994 () Bool)

(declare-fun res!872357 () Bool)

(assert (=> b!1313994 (=> (not res!872357) (not e!749534))))

(declare-datatypes ((List!30226 0))(
  ( (Nil!30223) (Cons!30222 (h!31431 (_ BitVec 64)) (t!43824 List!30226)) )
))
(declare-fun arrayNoDuplicates!0 (array!87993 (_ BitVec 32) List!30226) Bool)

(assert (=> b!1313994 (= res!872357 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30223))))

(declare-fun mapNonEmpty!54964 () Bool)

(declare-fun mapRes!54964 () Bool)

(declare-fun tp!104804 () Bool)

(declare-fun e!749531 () Bool)

(assert (=> mapNonEmpty!54964 (= mapRes!54964 (and tp!104804 e!749531))))

(declare-fun mapValue!54964 () ValueCell!16880)

(declare-fun mapKey!54964 () (_ BitVec 32))

(declare-fun mapRest!54964 () (Array (_ BitVec 32) ValueCell!16880))

(assert (=> mapNonEmpty!54964 (= (arr!42478 _values!1354) (store mapRest!54964 mapKey!54964 mapValue!54964))))

(declare-fun mapIsEmpty!54964 () Bool)

(assert (=> mapIsEmpty!54964 mapRes!54964))

(declare-fun b!1313996 () Bool)

(declare-fun e!749533 () Bool)

(declare-fun tp_is_empty!35557 () Bool)

(assert (=> b!1313996 (= e!749533 tp_is_empty!35557)))

(declare-fun b!1313997 () Bool)

(declare-fun e!749532 () Bool)

(assert (=> b!1313997 (= e!749532 (and e!749533 mapRes!54964))))

(declare-fun condMapEmpty!54964 () Bool)

(declare-fun mapDefault!54964 () ValueCell!16880)

(assert (=> b!1313997 (= condMapEmpty!54964 (= (arr!42478 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16880)) mapDefault!54964)))))

(declare-fun b!1313998 () Bool)

(assert (=> b!1313998 (= e!749531 tp_is_empty!35557)))

(declare-fun b!1313999 () Bool)

(declare-fun res!872356 () Bool)

(assert (=> b!1313999 (=> (not res!872356) (not e!749534))))

(assert (=> b!1313999 (= res!872356 (and (= (size!43030 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43029 _keys!1628) (size!43030 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1313995 () Bool)

(declare-fun res!872358 () Bool)

(assert (=> b!1313995 (=> (not res!872358) (not e!749534))))

(assert (=> b!1313995 (= res!872358 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43029 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!872359 () Bool)

(assert (=> start!110992 (=> (not res!872359) (not e!749534))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110992 (= res!872359 (validMask!0 mask!2040))))

(assert (=> start!110992 e!749534))

(assert (=> start!110992 tp!104803))

(declare-fun array_inv!32273 (array!87993) Bool)

(assert (=> start!110992 (array_inv!32273 _keys!1628)))

(assert (=> start!110992 true))

(assert (=> start!110992 tp_is_empty!35557))

(declare-fun array_inv!32274 (array!87995) Bool)

(assert (=> start!110992 (and (array_inv!32274 _values!1354) e!749532)))

(assert (= (and start!110992 res!872359) b!1313999))

(assert (= (and b!1313999 res!872356) b!1313993))

(assert (= (and b!1313993 res!872355) b!1313994))

(assert (= (and b!1313994 res!872357) b!1313995))

(assert (= (and b!1313995 res!872358) b!1313992))

(assert (= (and b!1313997 condMapEmpty!54964) mapIsEmpty!54964))

(assert (= (and b!1313997 (not condMapEmpty!54964)) mapNonEmpty!54964))

(get-info :version)

(assert (= (and mapNonEmpty!54964 ((_ is ValueCellFull!16880) mapValue!54964)) b!1313998))

(assert (= (and b!1313997 ((_ is ValueCellFull!16880) mapDefault!54964)) b!1313996))

(assert (= start!110992 b!1313997))

(declare-fun m!1202187 () Bool)

(assert (=> b!1313992 m!1202187))

(assert (=> b!1313992 m!1202187))

(declare-fun m!1202189 () Bool)

(assert (=> b!1313992 m!1202189))

(declare-fun m!1202191 () Bool)

(assert (=> start!110992 m!1202191))

(declare-fun m!1202193 () Bool)

(assert (=> start!110992 m!1202193))

(declare-fun m!1202195 () Bool)

(assert (=> start!110992 m!1202195))

(declare-fun m!1202197 () Bool)

(assert (=> b!1313993 m!1202197))

(declare-fun m!1202199 () Bool)

(assert (=> b!1313994 m!1202199))

(declare-fun m!1202201 () Bool)

(assert (=> mapNonEmpty!54964 m!1202201))

(check-sat (not mapNonEmpty!54964) (not b_next!29827) tp_is_empty!35557 (not b!1313994) (not b!1313992) (not start!110992) (not b!1313993) b_and!48017)
(check-sat b_and!48017 (not b_next!29827))
