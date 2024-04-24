; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110682 () Bool)

(assert start!110682)

(declare-fun b!1308031 () Bool)

(declare-fun e!746401 () Bool)

(declare-fun e!746404 () Bool)

(declare-fun mapRes!54163 () Bool)

(assert (=> b!1308031 (= e!746401 (and e!746404 mapRes!54163))))

(declare-fun condMapEmpty!54163 () Bool)

(declare-datatypes ((V!51801 0))(
  ( (V!51802 (val!17586 Int)) )
))
(declare-datatypes ((ValueCell!16613 0))(
  ( (ValueCellFull!16613 (v!20208 V!51801)) (EmptyCell!16613) )
))
(declare-datatypes ((array!87115 0))(
  ( (array!87116 (arr!42033 (Array (_ BitVec 32) ValueCell!16613)) (size!42584 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87115)

(declare-fun mapDefault!54163 () ValueCell!16613)

(assert (=> b!1308031 (= condMapEmpty!54163 (= (arr!42033 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16613)) mapDefault!54163)))))

(declare-fun mapIsEmpty!54163 () Bool)

(assert (=> mapIsEmpty!54163 mapRes!54163))

(declare-fun b!1308032 () Bool)

(declare-fun tp_is_empty!35023 () Bool)

(assert (=> b!1308032 (= e!746404 tp_is_empty!35023)))

(declare-fun mapNonEmpty!54163 () Bool)

(declare-fun tp!103243 () Bool)

(declare-fun e!746405 () Bool)

(assert (=> mapNonEmpty!54163 (= mapRes!54163 (and tp!103243 e!746405))))

(declare-fun mapKey!54163 () (_ BitVec 32))

(declare-fun mapRest!54163 () (Array (_ BitVec 32) ValueCell!16613))

(declare-fun mapValue!54163 () ValueCell!16613)

(assert (=> mapNonEmpty!54163 (= (arr!42033 _values!1354) (store mapRest!54163 mapKey!54163 mapValue!54163))))

(declare-fun b!1308033 () Bool)

(declare-fun e!746403 () Bool)

(assert (=> b!1308033 (= e!746403 false)))

(declare-fun lt!585443 () Bool)

(declare-datatypes ((array!87117 0))(
  ( (array!87118 (arr!42034 (Array (_ BitVec 32) (_ BitVec 64))) (size!42585 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87117)

(declare-datatypes ((List!29846 0))(
  ( (Nil!29843) (Cons!29842 (h!31060 (_ BitVec 64)) (t!43444 List!29846)) )
))
(declare-fun arrayNoDuplicates!0 (array!87117 (_ BitVec 32) List!29846) Bool)

(assert (=> b!1308033 (= lt!585443 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29843))))

(declare-fun b!1308034 () Bool)

(declare-fun res!867976 () Bool)

(assert (=> b!1308034 (=> (not res!867976) (not e!746403))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1308034 (= res!867976 (and (= (size!42584 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42585 _keys!1628) (size!42584 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1308036 () Bool)

(assert (=> b!1308036 (= e!746405 tp_is_empty!35023)))

(declare-fun b!1308035 () Bool)

(declare-fun res!867975 () Bool)

(assert (=> b!1308035 (=> (not res!867975) (not e!746403))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87117 (_ BitVec 32)) Bool)

(assert (=> b!1308035 (= res!867975 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun res!867977 () Bool)

(assert (=> start!110682 (=> (not res!867977) (not e!746403))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110682 (= res!867977 (validMask!0 mask!2040))))

(assert (=> start!110682 e!746403))

(assert (=> start!110682 true))

(declare-fun array_inv!32033 (array!87115) Bool)

(assert (=> start!110682 (and (array_inv!32033 _values!1354) e!746401)))

(declare-fun array_inv!32034 (array!87117) Bool)

(assert (=> start!110682 (array_inv!32034 _keys!1628)))

(assert (= (and start!110682 res!867977) b!1308034))

(assert (= (and b!1308034 res!867976) b!1308035))

(assert (= (and b!1308035 res!867975) b!1308033))

(assert (= (and b!1308031 condMapEmpty!54163) mapIsEmpty!54163))

(assert (= (and b!1308031 (not condMapEmpty!54163)) mapNonEmpty!54163))

(get-info :version)

(assert (= (and mapNonEmpty!54163 ((_ is ValueCellFull!16613) mapValue!54163)) b!1308036))

(assert (= (and b!1308031 ((_ is ValueCellFull!16613) mapDefault!54163)) b!1308032))

(assert (= start!110682 b!1308031))

(declare-fun m!1199267 () Bool)

(assert (=> mapNonEmpty!54163 m!1199267))

(declare-fun m!1199269 () Bool)

(assert (=> b!1308033 m!1199269))

(declare-fun m!1199271 () Bool)

(assert (=> b!1308035 m!1199271))

(declare-fun m!1199273 () Bool)

(assert (=> start!110682 m!1199273))

(declare-fun m!1199275 () Bool)

(assert (=> start!110682 m!1199275))

(declare-fun m!1199277 () Bool)

(assert (=> start!110682 m!1199277))

(check-sat (not mapNonEmpty!54163) (not b!1308033) (not start!110682) (not b!1308035) tp_is_empty!35023)
(check-sat)
