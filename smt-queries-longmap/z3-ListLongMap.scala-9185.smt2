; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110460 () Bool)

(assert start!110460)

(declare-fun b!1306750 () Bool)

(declare-fun res!867466 () Bool)

(declare-fun e!745576 () Bool)

(assert (=> b!1306750 (=> (not res!867466) (not e!745576))))

(declare-datatypes ((array!87062 0))(
  ( (array!87063 (arr!42011 (Array (_ BitVec 32) (_ BitVec 64))) (size!42561 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87062)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!51803 0))(
  ( (V!51804 (val!17587 Int)) )
))
(declare-datatypes ((ValueCell!16614 0))(
  ( (ValueCellFull!16614 (v!20214 V!51803)) (EmptyCell!16614) )
))
(declare-datatypes ((array!87064 0))(
  ( (array!87065 (arr!42012 (Array (_ BitVec 32) ValueCell!16614)) (size!42562 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87064)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1306750 (= res!867466 (and (= (size!42562 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42561 _keys!1628) (size!42562 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1306751 () Bool)

(assert (=> b!1306751 (= e!745576 false)))

(declare-fun lt!584970 () Bool)

(declare-datatypes ((List!29798 0))(
  ( (Nil!29795) (Cons!29794 (h!31003 (_ BitVec 64)) (t!43404 List!29798)) )
))
(declare-fun arrayNoDuplicates!0 (array!87062 (_ BitVec 32) List!29798) Bool)

(assert (=> b!1306751 (= lt!584970 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29795))))

(declare-fun b!1306752 () Bool)

(declare-fun res!867467 () Bool)

(assert (=> b!1306752 (=> (not res!867467) (not e!745576))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87062 (_ BitVec 32)) Bool)

(assert (=> b!1306752 (= res!867467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapNonEmpty!54166 () Bool)

(declare-fun mapRes!54166 () Bool)

(declare-fun tp!103246 () Bool)

(declare-fun e!745577 () Bool)

(assert (=> mapNonEmpty!54166 (= mapRes!54166 (and tp!103246 e!745577))))

(declare-fun mapValue!54166 () ValueCell!16614)

(declare-fun mapKey!54166 () (_ BitVec 32))

(declare-fun mapRest!54166 () (Array (_ BitVec 32) ValueCell!16614))

(assert (=> mapNonEmpty!54166 (= (arr!42012 _values!1354) (store mapRest!54166 mapKey!54166 mapValue!54166))))

(declare-fun b!1306753 () Bool)

(declare-fun tp_is_empty!35025 () Bool)

(assert (=> b!1306753 (= e!745577 tp_is_empty!35025)))

(declare-fun b!1306754 () Bool)

(declare-fun e!745573 () Bool)

(declare-fun e!745575 () Bool)

(assert (=> b!1306754 (= e!745573 (and e!745575 mapRes!54166))))

(declare-fun condMapEmpty!54166 () Bool)

(declare-fun mapDefault!54166 () ValueCell!16614)

(assert (=> b!1306754 (= condMapEmpty!54166 (= (arr!42012 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16614)) mapDefault!54166)))))

(declare-fun b!1306755 () Bool)

(assert (=> b!1306755 (= e!745575 tp_is_empty!35025)))

(declare-fun res!867468 () Bool)

(assert (=> start!110460 (=> (not res!867468) (not e!745576))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110460 (= res!867468 (validMask!0 mask!2040))))

(assert (=> start!110460 e!745576))

(assert (=> start!110460 true))

(declare-fun array_inv!31763 (array!87064) Bool)

(assert (=> start!110460 (and (array_inv!31763 _values!1354) e!745573)))

(declare-fun array_inv!31764 (array!87062) Bool)

(assert (=> start!110460 (array_inv!31764 _keys!1628)))

(declare-fun mapIsEmpty!54166 () Bool)

(assert (=> mapIsEmpty!54166 mapRes!54166))

(assert (= (and start!110460 res!867468) b!1306750))

(assert (= (and b!1306750 res!867466) b!1306752))

(assert (= (and b!1306752 res!867467) b!1306751))

(assert (= (and b!1306754 condMapEmpty!54166) mapIsEmpty!54166))

(assert (= (and b!1306754 (not condMapEmpty!54166)) mapNonEmpty!54166))

(get-info :version)

(assert (= (and mapNonEmpty!54166 ((_ is ValueCellFull!16614) mapValue!54166)) b!1306753))

(assert (= (and b!1306754 ((_ is ValueCellFull!16614) mapDefault!54166)) b!1306755))

(assert (= start!110460 b!1306754))

(declare-fun m!1197681 () Bool)

(assert (=> b!1306751 m!1197681))

(declare-fun m!1197683 () Bool)

(assert (=> b!1306752 m!1197683))

(declare-fun m!1197685 () Bool)

(assert (=> mapNonEmpty!54166 m!1197685))

(declare-fun m!1197687 () Bool)

(assert (=> start!110460 m!1197687))

(declare-fun m!1197689 () Bool)

(assert (=> start!110460 m!1197689))

(declare-fun m!1197691 () Bool)

(assert (=> start!110460 m!1197691))

(check-sat (not b!1306751) (not start!110460) tp_is_empty!35025 (not b!1306752) (not mapNonEmpty!54166))
(check-sat)
