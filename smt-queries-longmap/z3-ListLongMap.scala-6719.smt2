; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84268 () Bool)

(assert start!84268)

(declare-fun b!985808 () Bool)

(declare-fun e!555733 () Bool)

(declare-fun tp_is_empty!23089 () Bool)

(assert (=> b!985808 (= e!555733 tp_is_empty!23089)))

(declare-fun b!985809 () Bool)

(declare-fun e!555732 () Bool)

(assert (=> b!985809 (= e!555732 false)))

(declare-fun lt!437193 () Bool)

(declare-datatypes ((array!62080 0))(
  ( (array!62081 (arr!29898 (Array (_ BitVec 32) (_ BitVec 64))) (size!30379 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62080)

(declare-datatypes ((List!20763 0))(
  ( (Nil!20760) (Cons!20759 (h!21921 (_ BitVec 64)) (t!29653 List!20763)) )
))
(declare-fun arrayNoDuplicates!0 (array!62080 (_ BitVec 32) List!20763) Bool)

(assert (=> b!985809 (= lt!437193 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20760))))

(declare-fun res!659671 () Bool)

(assert (=> start!84268 (=> (not res!659671) (not e!555732))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84268 (= res!659671 (validMask!0 mask!1948))))

(assert (=> start!84268 e!555732))

(assert (=> start!84268 true))

(declare-datatypes ((V!35769 0))(
  ( (V!35770 (val!11595 Int)) )
))
(declare-datatypes ((ValueCell!11063 0))(
  ( (ValueCellFull!11063 (v!14156 V!35769)) (EmptyCell!11063) )
))
(declare-datatypes ((array!62082 0))(
  ( (array!62083 (arr!29899 (Array (_ BitVec 32) ValueCell!11063)) (size!30380 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62082)

(declare-fun e!555734 () Bool)

(declare-fun array_inv!23117 (array!62082) Bool)

(assert (=> start!84268 (and (array_inv!23117 _values!1278) e!555734)))

(declare-fun array_inv!23118 (array!62080) Bool)

(assert (=> start!84268 (array_inv!23118 _keys!1544)))

(declare-fun b!985810 () Bool)

(declare-fun e!555730 () Bool)

(declare-fun mapRes!36662 () Bool)

(assert (=> b!985810 (= e!555734 (and e!555730 mapRes!36662))))

(declare-fun condMapEmpty!36662 () Bool)

(declare-fun mapDefault!36662 () ValueCell!11063)

(assert (=> b!985810 (= condMapEmpty!36662 (= (arr!29899 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11063)) mapDefault!36662)))))

(declare-fun b!985811 () Bool)

(assert (=> b!985811 (= e!555730 tp_is_empty!23089)))

(declare-fun mapIsEmpty!36662 () Bool)

(assert (=> mapIsEmpty!36662 mapRes!36662))

(declare-fun mapNonEmpty!36662 () Bool)

(declare-fun tp!69518 () Bool)

(assert (=> mapNonEmpty!36662 (= mapRes!36662 (and tp!69518 e!555733))))

(declare-fun mapRest!36662 () (Array (_ BitVec 32) ValueCell!11063))

(declare-fun mapKey!36662 () (_ BitVec 32))

(declare-fun mapValue!36662 () ValueCell!11063)

(assert (=> mapNonEmpty!36662 (= (arr!29899 _values!1278) (store mapRest!36662 mapKey!36662 mapValue!36662))))

(declare-fun b!985812 () Bool)

(declare-fun res!659672 () Bool)

(assert (=> b!985812 (=> (not res!659672) (not e!555732))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!985812 (= res!659672 (and (= (size!30380 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30379 _keys!1544) (size!30380 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!985813 () Bool)

(declare-fun res!659673 () Bool)

(assert (=> b!985813 (=> (not res!659673) (not e!555732))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62080 (_ BitVec 32)) Bool)

(assert (=> b!985813 (= res!659673 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(assert (= (and start!84268 res!659671) b!985812))

(assert (= (and b!985812 res!659672) b!985813))

(assert (= (and b!985813 res!659673) b!985809))

(assert (= (and b!985810 condMapEmpty!36662) mapIsEmpty!36662))

(assert (= (and b!985810 (not condMapEmpty!36662)) mapNonEmpty!36662))

(get-info :version)

(assert (= (and mapNonEmpty!36662 ((_ is ValueCellFull!11063) mapValue!36662)) b!985808))

(assert (= (and b!985810 ((_ is ValueCellFull!11063) mapDefault!36662)) b!985811))

(assert (= start!84268 b!985810))

(declare-fun m!912257 () Bool)

(assert (=> b!985809 m!912257))

(declare-fun m!912259 () Bool)

(assert (=> start!84268 m!912259))

(declare-fun m!912261 () Bool)

(assert (=> start!84268 m!912261))

(declare-fun m!912263 () Bool)

(assert (=> start!84268 m!912263))

(declare-fun m!912265 () Bool)

(assert (=> mapNonEmpty!36662 m!912265))

(declare-fun m!912267 () Bool)

(assert (=> b!985813 m!912267))

(check-sat (not mapNonEmpty!36662) (not b!985809) tp_is_empty!23089 (not b!985813) (not start!84268))
(check-sat)
