; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110658 () Bool)

(assert start!110658)

(declare-fun res!867868 () Bool)

(declare-fun e!746224 () Bool)

(assert (=> start!110658 (=> (not res!867868) (not e!746224))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110658 (= res!867868 (validMask!0 mask!2040))))

(assert (=> start!110658 e!746224))

(assert (=> start!110658 true))

(declare-datatypes ((V!51769 0))(
  ( (V!51770 (val!17574 Int)) )
))
(declare-datatypes ((ValueCell!16601 0))(
  ( (ValueCellFull!16601 (v!20196 V!51769)) (EmptyCell!16601) )
))
(declare-datatypes ((array!87069 0))(
  ( (array!87070 (arr!42010 (Array (_ BitVec 32) ValueCell!16601)) (size!42561 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87069)

(declare-fun e!746223 () Bool)

(declare-fun array_inv!32017 (array!87069) Bool)

(assert (=> start!110658 (and (array_inv!32017 _values!1354) e!746223)))

(declare-datatypes ((array!87071 0))(
  ( (array!87072 (arr!42011 (Array (_ BitVec 32) (_ BitVec 64))) (size!42562 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87071)

(declare-fun array_inv!32018 (array!87071) Bool)

(assert (=> start!110658 (array_inv!32018 _keys!1628)))

(declare-fun b!1307815 () Bool)

(declare-fun res!867867 () Bool)

(assert (=> b!1307815 (=> (not res!867867) (not e!746224))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87071 (_ BitVec 32)) Bool)

(assert (=> b!1307815 (= res!867867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1307816 () Bool)

(assert (=> b!1307816 (= e!746224 false)))

(declare-fun lt!585407 () Bool)

(declare-datatypes ((List!29837 0))(
  ( (Nil!29834) (Cons!29833 (h!31051 (_ BitVec 64)) (t!43435 List!29837)) )
))
(declare-fun arrayNoDuplicates!0 (array!87071 (_ BitVec 32) List!29837) Bool)

(assert (=> b!1307816 (= lt!585407 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29834))))

(declare-fun b!1307817 () Bool)

(declare-fun e!746225 () Bool)

(declare-fun tp_is_empty!34999 () Bool)

(assert (=> b!1307817 (= e!746225 tp_is_empty!34999)))

(declare-fun b!1307818 () Bool)

(declare-fun mapRes!54127 () Bool)

(assert (=> b!1307818 (= e!746223 (and e!746225 mapRes!54127))))

(declare-fun condMapEmpty!54127 () Bool)

(declare-fun mapDefault!54127 () ValueCell!16601)

(assert (=> b!1307818 (= condMapEmpty!54127 (= (arr!42010 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16601)) mapDefault!54127)))))

(declare-fun b!1307819 () Bool)

(declare-fun res!867869 () Bool)

(assert (=> b!1307819 (=> (not res!867869) (not e!746224))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1307819 (= res!867869 (and (= (size!42561 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42562 _keys!1628) (size!42561 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!54127 () Bool)

(assert (=> mapIsEmpty!54127 mapRes!54127))

(declare-fun mapNonEmpty!54127 () Bool)

(declare-fun tp!103207 () Bool)

(declare-fun e!746222 () Bool)

(assert (=> mapNonEmpty!54127 (= mapRes!54127 (and tp!103207 e!746222))))

(declare-fun mapRest!54127 () (Array (_ BitVec 32) ValueCell!16601))

(declare-fun mapKey!54127 () (_ BitVec 32))

(declare-fun mapValue!54127 () ValueCell!16601)

(assert (=> mapNonEmpty!54127 (= (arr!42010 _values!1354) (store mapRest!54127 mapKey!54127 mapValue!54127))))

(declare-fun b!1307820 () Bool)

(assert (=> b!1307820 (= e!746222 tp_is_empty!34999)))

(assert (= (and start!110658 res!867868) b!1307819))

(assert (= (and b!1307819 res!867869) b!1307815))

(assert (= (and b!1307815 res!867867) b!1307816))

(assert (= (and b!1307818 condMapEmpty!54127) mapIsEmpty!54127))

(assert (= (and b!1307818 (not condMapEmpty!54127)) mapNonEmpty!54127))

(get-info :version)

(assert (= (and mapNonEmpty!54127 ((_ is ValueCellFull!16601) mapValue!54127)) b!1307820))

(assert (= (and b!1307818 ((_ is ValueCellFull!16601) mapDefault!54127)) b!1307817))

(assert (= start!110658 b!1307818))

(declare-fun m!1199123 () Bool)

(assert (=> start!110658 m!1199123))

(declare-fun m!1199125 () Bool)

(assert (=> start!110658 m!1199125))

(declare-fun m!1199127 () Bool)

(assert (=> start!110658 m!1199127))

(declare-fun m!1199129 () Bool)

(assert (=> b!1307815 m!1199129))

(declare-fun m!1199131 () Bool)

(assert (=> b!1307816 m!1199131))

(declare-fun m!1199133 () Bool)

(assert (=> mapNonEmpty!54127 m!1199133))

(check-sat (not mapNonEmpty!54127) tp_is_empty!34999 (not b!1307816) (not b!1307815) (not start!110658))
(check-sat)
