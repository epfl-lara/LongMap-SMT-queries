; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83928 () Bool)

(assert start!83928)

(declare-fun b!980863 () Bool)

(declare-fun res!656425 () Bool)

(declare-fun e!552873 () Bool)

(assert (=> b!980863 (=> (not res!656425) (not e!552873))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35291 0))(
  ( (V!35292 (val!11416 Int)) )
))
(declare-datatypes ((ValueCell!10884 0))(
  ( (ValueCellFull!10884 (v!13978 V!35291)) (EmptyCell!10884) )
))
(declare-datatypes ((array!61465 0))(
  ( (array!61466 (arr!29590 (Array (_ BitVec 32) ValueCell!10884)) (size!30069 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61465)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61467 0))(
  ( (array!61468 (arr!29591 (Array (_ BitVec 32) (_ BitVec 64))) (size!30070 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61467)

(assert (=> b!980863 (= res!656425 (and (= (size!30069 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30070 _keys!1544) (size!30069 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!980864 () Bool)

(declare-fun e!552871 () Bool)

(declare-fun tp_is_empty!22731 () Bool)

(assert (=> b!980864 (= e!552871 tp_is_empty!22731)))

(declare-fun res!656424 () Bool)

(assert (=> start!83928 (=> (not res!656424) (not e!552873))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83928 (= res!656424 (validMask!0 mask!1948))))

(assert (=> start!83928 e!552873))

(assert (=> start!83928 true))

(declare-fun e!552870 () Bool)

(declare-fun array_inv!22877 (array!61465) Bool)

(assert (=> start!83928 (and (array_inv!22877 _values!1278) e!552870)))

(declare-fun array_inv!22878 (array!61467) Bool)

(assert (=> start!83928 (array_inv!22878 _keys!1544)))

(declare-fun mapNonEmpty!36125 () Bool)

(declare-fun mapRes!36125 () Bool)

(declare-fun tp!68638 () Bool)

(assert (=> mapNonEmpty!36125 (= mapRes!36125 (and tp!68638 e!552871))))

(declare-fun mapKey!36125 () (_ BitVec 32))

(declare-fun mapValue!36125 () ValueCell!10884)

(declare-fun mapRest!36125 () (Array (_ BitVec 32) ValueCell!10884))

(assert (=> mapNonEmpty!36125 (= (arr!29590 _values!1278) (store mapRest!36125 mapKey!36125 mapValue!36125))))

(declare-fun b!980865 () Bool)

(declare-fun e!552869 () Bool)

(assert (=> b!980865 (= e!552870 (and e!552869 mapRes!36125))))

(declare-fun condMapEmpty!36125 () Bool)

(declare-fun mapDefault!36125 () ValueCell!10884)

(assert (=> b!980865 (= condMapEmpty!36125 (= (arr!29590 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10884)) mapDefault!36125)))))

(declare-fun mapIsEmpty!36125 () Bool)

(assert (=> mapIsEmpty!36125 mapRes!36125))

(declare-fun b!980866 () Bool)

(assert (=> b!980866 (= e!552869 tp_is_empty!22731)))

(declare-fun b!980867 () Bool)

(assert (=> b!980867 (= e!552873 false)))

(declare-fun lt!435614 () Bool)

(declare-datatypes ((List!20508 0))(
  ( (Nil!20505) (Cons!20504 (h!21666 (_ BitVec 64)) (t!29191 List!20508)) )
))
(declare-fun arrayNoDuplicates!0 (array!61467 (_ BitVec 32) List!20508) Bool)

(assert (=> b!980867 (= lt!435614 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20505))))

(declare-fun b!980868 () Bool)

(declare-fun res!656426 () Bool)

(assert (=> b!980868 (=> (not res!656426) (not e!552873))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61467 (_ BitVec 32)) Bool)

(assert (=> b!980868 (= res!656426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(assert (= (and start!83928 res!656424) b!980863))

(assert (= (and b!980863 res!656425) b!980868))

(assert (= (and b!980868 res!656426) b!980867))

(assert (= (and b!980865 condMapEmpty!36125) mapIsEmpty!36125))

(assert (= (and b!980865 (not condMapEmpty!36125)) mapNonEmpty!36125))

(get-info :version)

(assert (= (and mapNonEmpty!36125 ((_ is ValueCellFull!10884) mapValue!36125)) b!980864))

(assert (= (and b!980865 ((_ is ValueCellFull!10884) mapDefault!36125)) b!980866))

(assert (= start!83928 b!980865))

(declare-fun m!908431 () Bool)

(assert (=> start!83928 m!908431))

(declare-fun m!908433 () Bool)

(assert (=> start!83928 m!908433))

(declare-fun m!908435 () Bool)

(assert (=> start!83928 m!908435))

(declare-fun m!908437 () Bool)

(assert (=> mapNonEmpty!36125 m!908437))

(declare-fun m!908439 () Bool)

(assert (=> b!980867 m!908439))

(declare-fun m!908441 () Bool)

(assert (=> b!980868 m!908441))

(check-sat (not b!980868) (not mapNonEmpty!36125) tp_is_empty!22731 (not start!83928) (not b!980867))
(check-sat)
