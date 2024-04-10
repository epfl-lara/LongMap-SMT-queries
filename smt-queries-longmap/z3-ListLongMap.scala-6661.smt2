; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83940 () Bool)

(assert start!83940)

(declare-fun res!656479 () Bool)

(declare-fun e!552959 () Bool)

(assert (=> start!83940 (=> (not res!656479) (not e!552959))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83940 (= res!656479 (validMask!0 mask!1948))))

(assert (=> start!83940 e!552959))

(assert (=> start!83940 true))

(declare-datatypes ((V!35307 0))(
  ( (V!35308 (val!11422 Int)) )
))
(declare-datatypes ((ValueCell!10890 0))(
  ( (ValueCellFull!10890 (v!13984 V!35307)) (EmptyCell!10890) )
))
(declare-datatypes ((array!61489 0))(
  ( (array!61490 (arr!29602 (Array (_ BitVec 32) ValueCell!10890)) (size!30081 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61489)

(declare-fun e!552963 () Bool)

(declare-fun array_inv!22885 (array!61489) Bool)

(assert (=> start!83940 (and (array_inv!22885 _values!1278) e!552963)))

(declare-datatypes ((array!61491 0))(
  ( (array!61492 (arr!29603 (Array (_ BitVec 32) (_ BitVec 64))) (size!30082 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61491)

(declare-fun array_inv!22886 (array!61491) Bool)

(assert (=> start!83940 (array_inv!22886 _keys!1544)))

(declare-fun b!980971 () Bool)

(declare-fun e!552960 () Bool)

(declare-fun tp_is_empty!22743 () Bool)

(assert (=> b!980971 (= e!552960 tp_is_empty!22743)))

(declare-fun mapNonEmpty!36143 () Bool)

(declare-fun mapRes!36143 () Bool)

(declare-fun tp!68656 () Bool)

(declare-fun e!552961 () Bool)

(assert (=> mapNonEmpty!36143 (= mapRes!36143 (and tp!68656 e!552961))))

(declare-fun mapValue!36143 () ValueCell!10890)

(declare-fun mapRest!36143 () (Array (_ BitVec 32) ValueCell!10890))

(declare-fun mapKey!36143 () (_ BitVec 32))

(assert (=> mapNonEmpty!36143 (= (arr!29602 _values!1278) (store mapRest!36143 mapKey!36143 mapValue!36143))))

(declare-fun b!980972 () Bool)

(assert (=> b!980972 (= e!552963 (and e!552960 mapRes!36143))))

(declare-fun condMapEmpty!36143 () Bool)

(declare-fun mapDefault!36143 () ValueCell!10890)

(assert (=> b!980972 (= condMapEmpty!36143 (= (arr!29602 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10890)) mapDefault!36143)))))

(declare-fun mapIsEmpty!36143 () Bool)

(assert (=> mapIsEmpty!36143 mapRes!36143))

(declare-fun b!980973 () Bool)

(declare-fun res!656478 () Bool)

(assert (=> b!980973 (=> (not res!656478) (not e!552959))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!980973 (= res!656478 (and (= (size!30081 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30082 _keys!1544) (size!30081 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!980974 () Bool)

(assert (=> b!980974 (= e!552961 tp_is_empty!22743)))

(declare-fun b!980975 () Bool)

(assert (=> b!980975 (= e!552959 false)))

(declare-fun lt!435632 () Bool)

(declare-datatypes ((List!20512 0))(
  ( (Nil!20509) (Cons!20508 (h!21670 (_ BitVec 64)) (t!29195 List!20512)) )
))
(declare-fun arrayNoDuplicates!0 (array!61491 (_ BitVec 32) List!20512) Bool)

(assert (=> b!980975 (= lt!435632 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20509))))

(declare-fun b!980976 () Bool)

(declare-fun res!656480 () Bool)

(assert (=> b!980976 (=> (not res!656480) (not e!552959))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61491 (_ BitVec 32)) Bool)

(assert (=> b!980976 (= res!656480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(assert (= (and start!83940 res!656479) b!980973))

(assert (= (and b!980973 res!656478) b!980976))

(assert (= (and b!980976 res!656480) b!980975))

(assert (= (and b!980972 condMapEmpty!36143) mapIsEmpty!36143))

(assert (= (and b!980972 (not condMapEmpty!36143)) mapNonEmpty!36143))

(get-info :version)

(assert (= (and mapNonEmpty!36143 ((_ is ValueCellFull!10890) mapValue!36143)) b!980974))

(assert (= (and b!980972 ((_ is ValueCellFull!10890) mapDefault!36143)) b!980971))

(assert (= start!83940 b!980972))

(declare-fun m!908503 () Bool)

(assert (=> start!83940 m!908503))

(declare-fun m!908505 () Bool)

(assert (=> start!83940 m!908505))

(declare-fun m!908507 () Bool)

(assert (=> start!83940 m!908507))

(declare-fun m!908509 () Bool)

(assert (=> mapNonEmpty!36143 m!908509))

(declare-fun m!908511 () Bool)

(assert (=> b!980975 m!908511))

(declare-fun m!908513 () Bool)

(assert (=> b!980976 m!908513))

(check-sat (not mapNonEmpty!36143) (not start!83940) (not b!980976) (not b!980975) tp_is_empty!22743)
(check-sat)
