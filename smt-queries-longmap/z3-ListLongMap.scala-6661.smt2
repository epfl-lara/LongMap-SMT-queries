; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83920 () Bool)

(assert start!83920)

(declare-fun mapIsEmpty!36140 () Bool)

(declare-fun mapRes!36140 () Bool)

(assert (=> mapIsEmpty!36140 mapRes!36140))

(declare-fun b!980714 () Bool)

(declare-fun e!552800 () Bool)

(declare-fun e!552796 () Bool)

(assert (=> b!980714 (= e!552800 (and e!552796 mapRes!36140))))

(declare-fun condMapEmpty!36140 () Bool)

(declare-datatypes ((V!35305 0))(
  ( (V!35306 (val!11421 Int)) )
))
(declare-datatypes ((ValueCell!10889 0))(
  ( (ValueCellFull!10889 (v!13982 V!35305)) (EmptyCell!10889) )
))
(declare-datatypes ((array!61412 0))(
  ( (array!61413 (arr!29564 (Array (_ BitVec 32) ValueCell!10889)) (size!30045 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61412)

(declare-fun mapDefault!36140 () ValueCell!10889)

(assert (=> b!980714 (= condMapEmpty!36140 (= (arr!29564 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10889)) mapDefault!36140)))))

(declare-fun b!980715 () Bool)

(declare-fun e!552799 () Bool)

(declare-fun tp_is_empty!22741 () Bool)

(assert (=> b!980715 (= e!552799 tp_is_empty!22741)))

(declare-fun b!980716 () Bool)

(declare-fun e!552798 () Bool)

(assert (=> b!980716 (= e!552798 false)))

(declare-fun lt!435393 () Bool)

(declare-datatypes ((array!61414 0))(
  ( (array!61415 (arr!29565 (Array (_ BitVec 32) (_ BitVec 64))) (size!30046 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61414)

(declare-datatypes ((List!20539 0))(
  ( (Nil!20536) (Cons!20535 (h!21697 (_ BitVec 64)) (t!29213 List!20539)) )
))
(declare-fun arrayNoDuplicates!0 (array!61414 (_ BitVec 32) List!20539) Bool)

(assert (=> b!980716 (= lt!435393 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20536))))

(declare-fun res!656359 () Bool)

(assert (=> start!83920 (=> (not res!656359) (not e!552798))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83920 (= res!656359 (validMask!0 mask!1948))))

(assert (=> start!83920 e!552798))

(assert (=> start!83920 true))

(declare-fun array_inv!22877 (array!61412) Bool)

(assert (=> start!83920 (and (array_inv!22877 _values!1278) e!552800)))

(declare-fun array_inv!22878 (array!61414) Bool)

(assert (=> start!83920 (array_inv!22878 _keys!1544)))

(declare-fun b!980717 () Bool)

(declare-fun res!656361 () Bool)

(assert (=> b!980717 (=> (not res!656361) (not e!552798))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!980717 (= res!656361 (and (= (size!30045 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30046 _keys!1544) (size!30045 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!36140 () Bool)

(declare-fun tp!68654 () Bool)

(assert (=> mapNonEmpty!36140 (= mapRes!36140 (and tp!68654 e!552799))))

(declare-fun mapValue!36140 () ValueCell!10889)

(declare-fun mapKey!36140 () (_ BitVec 32))

(declare-fun mapRest!36140 () (Array (_ BitVec 32) ValueCell!10889))

(assert (=> mapNonEmpty!36140 (= (arr!29564 _values!1278) (store mapRest!36140 mapKey!36140 mapValue!36140))))

(declare-fun b!980718 () Bool)

(declare-fun res!656360 () Bool)

(assert (=> b!980718 (=> (not res!656360) (not e!552798))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61414 (_ BitVec 32)) Bool)

(assert (=> b!980718 (= res!656360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!980719 () Bool)

(assert (=> b!980719 (= e!552796 tp_is_empty!22741)))

(assert (= (and start!83920 res!656359) b!980717))

(assert (= (and b!980717 res!656361) b!980718))

(assert (= (and b!980718 res!656360) b!980716))

(assert (= (and b!980714 condMapEmpty!36140) mapIsEmpty!36140))

(assert (= (and b!980714 (not condMapEmpty!36140)) mapNonEmpty!36140))

(get-info :version)

(assert (= (and mapNonEmpty!36140 ((_ is ValueCellFull!10889) mapValue!36140)) b!980715))

(assert (= (and b!980714 ((_ is ValueCellFull!10889) mapDefault!36140)) b!980719))

(assert (= start!83920 b!980714))

(declare-fun m!907733 () Bool)

(assert (=> b!980716 m!907733))

(declare-fun m!907735 () Bool)

(assert (=> start!83920 m!907735))

(declare-fun m!907737 () Bool)

(assert (=> start!83920 m!907737))

(declare-fun m!907739 () Bool)

(assert (=> start!83920 m!907739))

(declare-fun m!907741 () Bool)

(assert (=> mapNonEmpty!36140 m!907741))

(declare-fun m!907743 () Bool)

(assert (=> b!980718 m!907743))

(check-sat tp_is_empty!22741 (not start!83920) (not b!980716) (not b!980718) (not mapNonEmpty!36140))
(check-sat)
