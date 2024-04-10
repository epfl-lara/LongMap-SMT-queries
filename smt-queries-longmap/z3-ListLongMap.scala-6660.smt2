; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83934 () Bool)

(assert start!83934)

(declare-fun mapIsEmpty!36134 () Bool)

(declare-fun mapRes!36134 () Bool)

(assert (=> mapIsEmpty!36134 mapRes!36134))

(declare-fun b!980917 () Bool)

(declare-fun e!552917 () Bool)

(declare-fun tp_is_empty!22737 () Bool)

(assert (=> b!980917 (= e!552917 tp_is_empty!22737)))

(declare-fun mapNonEmpty!36134 () Bool)

(declare-fun tp!68647 () Bool)

(assert (=> mapNonEmpty!36134 (= mapRes!36134 (and tp!68647 e!552917))))

(declare-datatypes ((V!35299 0))(
  ( (V!35300 (val!11419 Int)) )
))
(declare-datatypes ((ValueCell!10887 0))(
  ( (ValueCellFull!10887 (v!13981 V!35299)) (EmptyCell!10887) )
))
(declare-fun mapValue!36134 () ValueCell!10887)

(declare-datatypes ((array!61477 0))(
  ( (array!61478 (arr!29596 (Array (_ BitVec 32) ValueCell!10887)) (size!30075 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61477)

(declare-fun mapRest!36134 () (Array (_ BitVec 32) ValueCell!10887))

(declare-fun mapKey!36134 () (_ BitVec 32))

(assert (=> mapNonEmpty!36134 (= (arr!29596 _values!1278) (store mapRest!36134 mapKey!36134 mapValue!36134))))

(declare-fun b!980918 () Bool)

(declare-fun e!552916 () Bool)

(declare-fun e!552914 () Bool)

(assert (=> b!980918 (= e!552916 (and e!552914 mapRes!36134))))

(declare-fun condMapEmpty!36134 () Bool)

(declare-fun mapDefault!36134 () ValueCell!10887)

(assert (=> b!980918 (= condMapEmpty!36134 (= (arr!29596 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10887)) mapDefault!36134)))))

(declare-fun b!980919 () Bool)

(declare-fun e!552915 () Bool)

(assert (=> b!980919 (= e!552915 false)))

(declare-fun lt!435623 () Bool)

(declare-datatypes ((array!61479 0))(
  ( (array!61480 (arr!29597 (Array (_ BitVec 32) (_ BitVec 64))) (size!30076 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61479)

(declare-datatypes ((List!20511 0))(
  ( (Nil!20508) (Cons!20507 (h!21669 (_ BitVec 64)) (t!29194 List!20511)) )
))
(declare-fun arrayNoDuplicates!0 (array!61479 (_ BitVec 32) List!20511) Bool)

(assert (=> b!980919 (= lt!435623 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20508))))

(declare-fun b!980920 () Bool)

(declare-fun res!656452 () Bool)

(assert (=> b!980920 (=> (not res!656452) (not e!552915))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!980920 (= res!656452 (and (= (size!30075 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30076 _keys!1544) (size!30075 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!980921 () Bool)

(assert (=> b!980921 (= e!552914 tp_is_empty!22737)))

(declare-fun b!980922 () Bool)

(declare-fun res!656451 () Bool)

(assert (=> b!980922 (=> (not res!656451) (not e!552915))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61479 (_ BitVec 32)) Bool)

(assert (=> b!980922 (= res!656451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun res!656453 () Bool)

(assert (=> start!83934 (=> (not res!656453) (not e!552915))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83934 (= res!656453 (validMask!0 mask!1948))))

(assert (=> start!83934 e!552915))

(assert (=> start!83934 true))

(declare-fun array_inv!22881 (array!61477) Bool)

(assert (=> start!83934 (and (array_inv!22881 _values!1278) e!552916)))

(declare-fun array_inv!22882 (array!61479) Bool)

(assert (=> start!83934 (array_inv!22882 _keys!1544)))

(assert (= (and start!83934 res!656453) b!980920))

(assert (= (and b!980920 res!656452) b!980922))

(assert (= (and b!980922 res!656451) b!980919))

(assert (= (and b!980918 condMapEmpty!36134) mapIsEmpty!36134))

(assert (= (and b!980918 (not condMapEmpty!36134)) mapNonEmpty!36134))

(get-info :version)

(assert (= (and mapNonEmpty!36134 ((_ is ValueCellFull!10887) mapValue!36134)) b!980917))

(assert (= (and b!980918 ((_ is ValueCellFull!10887) mapDefault!36134)) b!980921))

(assert (= start!83934 b!980918))

(declare-fun m!908467 () Bool)

(assert (=> mapNonEmpty!36134 m!908467))

(declare-fun m!908469 () Bool)

(assert (=> b!980919 m!908469))

(declare-fun m!908471 () Bool)

(assert (=> b!980922 m!908471))

(declare-fun m!908473 () Bool)

(assert (=> start!83934 m!908473))

(declare-fun m!908475 () Bool)

(assert (=> start!83934 m!908475))

(declare-fun m!908477 () Bool)

(assert (=> start!83934 m!908477))

(check-sat (not start!83934) (not b!980919) tp_is_empty!22737 (not mapNonEmpty!36134) (not b!980922))
(check-sat)
