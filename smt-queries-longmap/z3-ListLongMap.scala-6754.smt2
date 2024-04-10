; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84730 () Bool)

(assert start!84730)

(declare-fun b_free!20085 () Bool)

(declare-fun b_next!20085 () Bool)

(assert (=> start!84730 (= b_free!20085 (not b_next!20085))))

(declare-fun tp!70053 () Bool)

(declare-fun b_and!32255 () Bool)

(assert (=> start!84730 (= tp!70053 b_and!32255)))

(declare-fun b!990828 () Bool)

(declare-fun res!662443 () Bool)

(declare-fun e!558714 () Bool)

(assert (=> b!990828 (=> (not res!662443) (not e!558714))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!62565 0))(
  ( (array!62566 (arr!30133 (Array (_ BitVec 32) (_ BitVec 64))) (size!30612 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62565)

(assert (=> b!990828 (= res!662443 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30612 _keys!1544))))))

(declare-fun mapIsEmpty!37004 () Bool)

(declare-fun mapRes!37004 () Bool)

(assert (=> mapIsEmpty!37004 mapRes!37004))

(declare-fun b!990829 () Bool)

(declare-fun res!662442 () Bool)

(assert (=> b!990829 (=> (not res!662442) (not e!558714))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62565 (_ BitVec 32)) Bool)

(assert (=> b!990829 (= res!662442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun res!662441 () Bool)

(assert (=> start!84730 (=> (not res!662441) (not e!558714))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84730 (= res!662441 (validMask!0 mask!1948))))

(assert (=> start!84730 e!558714))

(assert (=> start!84730 true))

(declare-fun tp_is_empty!23301 () Bool)

(assert (=> start!84730 tp_is_empty!23301))

(declare-datatypes ((V!36051 0))(
  ( (V!36052 (val!11701 Int)) )
))
(declare-datatypes ((ValueCell!11169 0))(
  ( (ValueCellFull!11169 (v!14274 V!36051)) (EmptyCell!11169) )
))
(declare-datatypes ((array!62567 0))(
  ( (array!62568 (arr!30134 (Array (_ BitVec 32) ValueCell!11169)) (size!30613 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62567)

(declare-fun e!558719 () Bool)

(declare-fun array_inv!23271 (array!62567) Bool)

(assert (=> start!84730 (and (array_inv!23271 _values!1278) e!558719)))

(assert (=> start!84730 tp!70053))

(declare-fun array_inv!23272 (array!62565) Bool)

(assert (=> start!84730 (array_inv!23272 _keys!1544)))

(declare-fun mapNonEmpty!37004 () Bool)

(declare-fun tp!70054 () Bool)

(declare-fun e!558715 () Bool)

(assert (=> mapNonEmpty!37004 (= mapRes!37004 (and tp!70054 e!558715))))

(declare-fun mapKey!37004 () (_ BitVec 32))

(declare-fun mapValue!37004 () ValueCell!11169)

(declare-fun mapRest!37004 () (Array (_ BitVec 32) ValueCell!11169))

(assert (=> mapNonEmpty!37004 (= (arr!30134 _values!1278) (store mapRest!37004 mapKey!37004 mapValue!37004))))

(declare-fun b!990830 () Bool)

(declare-fun res!662440 () Bool)

(assert (=> b!990830 (=> (not res!662440) (not e!558714))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!990830 (= res!662440 (and (= (size!30613 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30612 _keys!1544) (size!30613 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!990831 () Bool)

(assert (=> b!990831 (= e!558715 tp_is_empty!23301)))

(declare-fun b!990832 () Bool)

(declare-fun e!558718 () Bool)

(assert (=> b!990832 (= e!558714 e!558718)))

(declare-fun res!662444 () Bool)

(assert (=> b!990832 (=> (not res!662444) (not e!558718))))

(declare-fun lt!439682 () Bool)

(assert (=> b!990832 (= res!662444 (and (or lt!439682 (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (or lt!439682 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (or (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not lt!439682))))))

(assert (=> b!990832 (= lt!439682 (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!990833 () Bool)

(assert (=> b!990833 (= e!558718 false)))

(declare-datatypes ((tuple2!14920 0))(
  ( (tuple2!14921 (_1!7471 (_ BitVec 64)) (_2!7471 V!36051)) )
))
(declare-datatypes ((List!20849 0))(
  ( (Nil!20846) (Cons!20845 (h!22007 tuple2!14920) (t!29826 List!20849)) )
))
(declare-datatypes ((ListLongMap!13617 0))(
  ( (ListLongMap!13618 (toList!6824 List!20849)) )
))
(declare-fun lt!439681 () ListLongMap!13617)

(declare-fun minValue!1220 () V!36051)

(declare-fun zeroValue!1220 () V!36051)

(declare-fun defaultEntry!1281 () Int)

(declare-fun getCurrentListMap!3874 (array!62565 array!62567 (_ BitVec 32) (_ BitVec 32) V!36051 V!36051 (_ BitVec 32) Int) ListLongMap!13617)

(assert (=> b!990833 (= lt!439681 (getCurrentListMap!3874 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!990834 () Bool)

(declare-fun res!662445 () Bool)

(assert (=> b!990834 (=> (not res!662445) (not e!558714))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!990834 (= res!662445 (validKeyInArray!0 (select (arr!30133 _keys!1544) from!1932)))))

(declare-fun b!990835 () Bool)

(declare-fun e!558717 () Bool)

(assert (=> b!990835 (= e!558719 (and e!558717 mapRes!37004))))

(declare-fun condMapEmpty!37004 () Bool)

(declare-fun mapDefault!37004 () ValueCell!11169)

(assert (=> b!990835 (= condMapEmpty!37004 (= (arr!30134 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11169)) mapDefault!37004)))))

(declare-fun b!990836 () Bool)

(assert (=> b!990836 (= e!558717 tp_is_empty!23301)))

(declare-fun b!990837 () Bool)

(declare-fun res!662439 () Bool)

(assert (=> b!990837 (=> (not res!662439) (not e!558714))))

(declare-datatypes ((List!20850 0))(
  ( (Nil!20847) (Cons!20846 (h!22008 (_ BitVec 64)) (t!29827 List!20850)) )
))
(declare-fun arrayNoDuplicates!0 (array!62565 (_ BitVec 32) List!20850) Bool)

(assert (=> b!990837 (= res!662439 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20847))))

(assert (= (and start!84730 res!662441) b!990830))

(assert (= (and b!990830 res!662440) b!990829))

(assert (= (and b!990829 res!662442) b!990837))

(assert (= (and b!990837 res!662439) b!990828))

(assert (= (and b!990828 res!662443) b!990834))

(assert (= (and b!990834 res!662445) b!990832))

(assert (= (and b!990832 res!662444) b!990833))

(assert (= (and b!990835 condMapEmpty!37004) mapIsEmpty!37004))

(assert (= (and b!990835 (not condMapEmpty!37004)) mapNonEmpty!37004))

(get-info :version)

(assert (= (and mapNonEmpty!37004 ((_ is ValueCellFull!11169) mapValue!37004)) b!990831))

(assert (= (and b!990835 ((_ is ValueCellFull!11169) mapDefault!37004)) b!990836))

(assert (= start!84730 b!990835))

(declare-fun m!918639 () Bool)

(assert (=> b!990834 m!918639))

(assert (=> b!990834 m!918639))

(declare-fun m!918641 () Bool)

(assert (=> b!990834 m!918641))

(declare-fun m!918643 () Bool)

(assert (=> mapNonEmpty!37004 m!918643))

(declare-fun m!918645 () Bool)

(assert (=> start!84730 m!918645))

(declare-fun m!918647 () Bool)

(assert (=> start!84730 m!918647))

(declare-fun m!918649 () Bool)

(assert (=> start!84730 m!918649))

(declare-fun m!918651 () Bool)

(assert (=> b!990833 m!918651))

(declare-fun m!918653 () Bool)

(assert (=> b!990829 m!918653))

(declare-fun m!918655 () Bool)

(assert (=> b!990837 m!918655))

(check-sat (not b_next!20085) (not b!990834) b_and!32255 (not start!84730) tp_is_empty!23301 (not b!990833) (not mapNonEmpty!37004) (not b!990829) (not b!990837))
(check-sat b_and!32255 (not b_next!20085))
