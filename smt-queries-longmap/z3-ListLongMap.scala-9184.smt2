; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110676 () Bool)

(assert start!110676)

(declare-fun b!1307977 () Bool)

(declare-fun e!746359 () Bool)

(declare-fun tp_is_empty!35017 () Bool)

(assert (=> b!1307977 (= e!746359 tp_is_empty!35017)))

(declare-fun b!1307978 () Bool)

(declare-fun res!867949 () Bool)

(declare-fun e!746358 () Bool)

(assert (=> b!1307978 (=> (not res!867949) (not e!746358))))

(declare-datatypes ((array!87103 0))(
  ( (array!87104 (arr!42027 (Array (_ BitVec 32) (_ BitVec 64))) (size!42578 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87103)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!51793 0))(
  ( (V!51794 (val!17583 Int)) )
))
(declare-datatypes ((ValueCell!16610 0))(
  ( (ValueCellFull!16610 (v!20205 V!51793)) (EmptyCell!16610) )
))
(declare-datatypes ((array!87105 0))(
  ( (array!87106 (arr!42028 (Array (_ BitVec 32) ValueCell!16610)) (size!42579 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87105)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1307978 (= res!867949 (and (= (size!42579 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42578 _keys!1628) (size!42579 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!54154 () Bool)

(declare-fun mapRes!54154 () Bool)

(assert (=> mapIsEmpty!54154 mapRes!54154))

(declare-fun b!1307979 () Bool)

(declare-fun res!867950 () Bool)

(assert (=> b!1307979 (=> (not res!867950) (not e!746358))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87103 (_ BitVec 32)) Bool)

(assert (=> b!1307979 (= res!867950 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapNonEmpty!54154 () Bool)

(declare-fun tp!103234 () Bool)

(assert (=> mapNonEmpty!54154 (= mapRes!54154 (and tp!103234 e!746359))))

(declare-fun mapValue!54154 () ValueCell!16610)

(declare-fun mapRest!54154 () (Array (_ BitVec 32) ValueCell!16610))

(declare-fun mapKey!54154 () (_ BitVec 32))

(assert (=> mapNonEmpty!54154 (= (arr!42028 _values!1354) (store mapRest!54154 mapKey!54154 mapValue!54154))))

(declare-fun b!1307980 () Bool)

(declare-fun e!746357 () Bool)

(assert (=> b!1307980 (= e!746357 tp_is_empty!35017)))

(declare-fun res!867948 () Bool)

(assert (=> start!110676 (=> (not res!867948) (not e!746358))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110676 (= res!867948 (validMask!0 mask!2040))))

(assert (=> start!110676 e!746358))

(assert (=> start!110676 true))

(declare-fun e!746356 () Bool)

(declare-fun array_inv!32031 (array!87105) Bool)

(assert (=> start!110676 (and (array_inv!32031 _values!1354) e!746356)))

(declare-fun array_inv!32032 (array!87103) Bool)

(assert (=> start!110676 (array_inv!32032 _keys!1628)))

(declare-fun b!1307981 () Bool)

(assert (=> b!1307981 (= e!746356 (and e!746357 mapRes!54154))))

(declare-fun condMapEmpty!54154 () Bool)

(declare-fun mapDefault!54154 () ValueCell!16610)

(assert (=> b!1307981 (= condMapEmpty!54154 (= (arr!42028 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16610)) mapDefault!54154)))))

(declare-fun b!1307982 () Bool)

(assert (=> b!1307982 (= e!746358 false)))

(declare-fun lt!585434 () Bool)

(declare-datatypes ((List!29844 0))(
  ( (Nil!29841) (Cons!29840 (h!31058 (_ BitVec 64)) (t!43442 List!29844)) )
))
(declare-fun arrayNoDuplicates!0 (array!87103 (_ BitVec 32) List!29844) Bool)

(assert (=> b!1307982 (= lt!585434 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29841))))

(assert (= (and start!110676 res!867948) b!1307978))

(assert (= (and b!1307978 res!867949) b!1307979))

(assert (= (and b!1307979 res!867950) b!1307982))

(assert (= (and b!1307981 condMapEmpty!54154) mapIsEmpty!54154))

(assert (= (and b!1307981 (not condMapEmpty!54154)) mapNonEmpty!54154))

(get-info :version)

(assert (= (and mapNonEmpty!54154 ((_ is ValueCellFull!16610) mapValue!54154)) b!1307977))

(assert (= (and b!1307981 ((_ is ValueCellFull!16610) mapDefault!54154)) b!1307980))

(assert (= start!110676 b!1307981))

(declare-fun m!1199231 () Bool)

(assert (=> b!1307979 m!1199231))

(declare-fun m!1199233 () Bool)

(assert (=> mapNonEmpty!54154 m!1199233))

(declare-fun m!1199235 () Bool)

(assert (=> start!110676 m!1199235))

(declare-fun m!1199237 () Bool)

(assert (=> start!110676 m!1199237))

(declare-fun m!1199239 () Bool)

(assert (=> start!110676 m!1199239))

(declare-fun m!1199241 () Bool)

(assert (=> b!1307982 m!1199241))

(check-sat (not b!1307979) (not mapNonEmpty!54154) tp_is_empty!35017 (not b!1307982) (not start!110676))
(check-sat)
