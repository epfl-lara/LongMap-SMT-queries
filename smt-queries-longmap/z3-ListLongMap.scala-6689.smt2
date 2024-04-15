; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84088 () Bool)

(assert start!84088)

(declare-fun mapIsEmpty!36392 () Bool)

(declare-fun mapRes!36392 () Bool)

(assert (=> mapIsEmpty!36392 mapRes!36392))

(declare-fun b!983207 () Bool)

(declare-fun res!657989 () Bool)

(declare-fun e!554220 () Bool)

(assert (=> b!983207 (=> (not res!657989) (not e!554220))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35529 0))(
  ( (V!35530 (val!11505 Int)) )
))
(declare-datatypes ((ValueCell!10973 0))(
  ( (ValueCellFull!10973 (v!14066 V!35529)) (EmptyCell!10973) )
))
(declare-datatypes ((array!61740 0))(
  ( (array!61741 (arr!29728 (Array (_ BitVec 32) ValueCell!10973)) (size!30209 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61740)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61742 0))(
  ( (array!61743 (arr!29729 (Array (_ BitVec 32) (_ BitVec 64))) (size!30210 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61742)

(assert (=> b!983207 (= res!657989 (and (= (size!30209 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30210 _keys!1544) (size!30209 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!983208 () Bool)

(declare-fun res!657990 () Bool)

(assert (=> b!983208 (=> (not res!657990) (not e!554220))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61742 (_ BitVec 32)) Bool)

(assert (=> b!983208 (= res!657990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun res!657988 () Bool)

(assert (=> start!84088 (=> (not res!657988) (not e!554220))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84088 (= res!657988 (validMask!0 mask!1948))))

(assert (=> start!84088 e!554220))

(assert (=> start!84088 true))

(declare-fun e!554222 () Bool)

(declare-fun array_inv!22997 (array!61740) Bool)

(assert (=> start!84088 (and (array_inv!22997 _values!1278) e!554222)))

(declare-fun array_inv!22998 (array!61742) Bool)

(assert (=> start!84088 (array_inv!22998 _keys!1544)))

(declare-fun mapNonEmpty!36392 () Bool)

(declare-fun tp!69077 () Bool)

(declare-fun e!554219 () Bool)

(assert (=> mapNonEmpty!36392 (= mapRes!36392 (and tp!69077 e!554219))))

(declare-fun mapKey!36392 () (_ BitVec 32))

(declare-fun mapRest!36392 () (Array (_ BitVec 32) ValueCell!10973))

(declare-fun mapValue!36392 () ValueCell!10973)

(assert (=> mapNonEmpty!36392 (= (arr!29728 _values!1278) (store mapRest!36392 mapKey!36392 mapValue!36392))))

(declare-fun b!983209 () Bool)

(declare-fun e!554218 () Bool)

(declare-fun tp_is_empty!22909 () Bool)

(assert (=> b!983209 (= e!554218 tp_is_empty!22909)))

(declare-fun b!983210 () Bool)

(assert (=> b!983210 (= e!554222 (and e!554218 mapRes!36392))))

(declare-fun condMapEmpty!36392 () Bool)

(declare-fun mapDefault!36392 () ValueCell!10973)

(assert (=> b!983210 (= condMapEmpty!36392 (= (arr!29728 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10973)) mapDefault!36392)))))

(declare-fun b!983211 () Bool)

(assert (=> b!983211 (= e!554219 tp_is_empty!22909)))

(declare-fun b!983212 () Bool)

(assert (=> b!983212 (= e!554220 false)))

(declare-fun lt!436284 () Bool)

(declare-datatypes ((List!20651 0))(
  ( (Nil!20648) (Cons!20647 (h!21809 (_ BitVec 64)) (t!29433 List!20651)) )
))
(declare-fun arrayNoDuplicates!0 (array!61742 (_ BitVec 32) List!20651) Bool)

(assert (=> b!983212 (= lt!436284 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20648))))

(assert (= (and start!84088 res!657988) b!983207))

(assert (= (and b!983207 res!657989) b!983208))

(assert (= (and b!983208 res!657990) b!983212))

(assert (= (and b!983210 condMapEmpty!36392) mapIsEmpty!36392))

(assert (= (and b!983210 (not condMapEmpty!36392)) mapNonEmpty!36392))

(get-info :version)

(assert (= (and mapNonEmpty!36392 ((_ is ValueCellFull!10973) mapValue!36392)) b!983211))

(assert (= (and b!983210 ((_ is ValueCellFull!10973) mapDefault!36392)) b!983209))

(assert (= start!84088 b!983210))

(declare-fun m!909959 () Bool)

(assert (=> b!983208 m!909959))

(declare-fun m!909961 () Bool)

(assert (=> start!84088 m!909961))

(declare-fun m!909963 () Bool)

(assert (=> start!84088 m!909963))

(declare-fun m!909965 () Bool)

(assert (=> start!84088 m!909965))

(declare-fun m!909967 () Bool)

(assert (=> mapNonEmpty!36392 m!909967))

(declare-fun m!909969 () Bool)

(assert (=> b!983212 m!909969))

(check-sat (not b!983212) tp_is_empty!22909 (not mapNonEmpty!36392) (not start!84088) (not b!983208))
(check-sat)
