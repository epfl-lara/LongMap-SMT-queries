; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77884 () Bool)

(assert start!77884)

(declare-fun b_free!16443 () Bool)

(declare-fun b_next!16443 () Bool)

(assert (=> start!77884 (= b_free!16443 (not b_next!16443))))

(declare-fun tp!57593 () Bool)

(declare-fun b_and!27011 () Bool)

(assert (=> start!77884 (= tp!57593 b_and!27011)))

(declare-fun res!613797 () Bool)

(declare-fun e!509764 () Bool)

(assert (=> start!77884 (=> (not res!613797) (not e!509764))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77884 (= res!613797 (validMask!0 mask!1756))))

(assert (=> start!77884 e!509764))

(declare-datatypes ((V!30113 0))(
  ( (V!30114 (val!9481 Int)) )
))
(declare-datatypes ((ValueCell!8949 0))(
  ( (ValueCellFull!8949 (v!11988 V!30113)) (EmptyCell!8949) )
))
(declare-datatypes ((array!53748 0))(
  ( (array!53749 (arr!25832 (Array (_ BitVec 32) ValueCell!8949)) (size!26291 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53748)

(declare-fun e!509763 () Bool)

(declare-fun array_inv!20210 (array!53748) Bool)

(assert (=> start!77884 (and (array_inv!20210 _values!1152) e!509763)))

(assert (=> start!77884 tp!57593))

(assert (=> start!77884 true))

(declare-fun tp_is_empty!18861 () Bool)

(assert (=> start!77884 tp_is_empty!18861))

(declare-datatypes ((array!53750 0))(
  ( (array!53751 (arr!25833 (Array (_ BitVec 32) (_ BitVec 64))) (size!26292 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53750)

(declare-fun array_inv!20211 (array!53750) Bool)

(assert (=> start!77884 (array_inv!20211 _keys!1386)))

(declare-fun b!909412 () Bool)

(declare-fun res!613794 () Bool)

(assert (=> b!909412 (=> (not res!613794) (not e!509764))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!909412 (= res!613794 (and (= (size!26291 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26292 _keys!1386) (size!26291 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!30007 () Bool)

(declare-fun mapRes!30007 () Bool)

(declare-fun tp!57594 () Bool)

(declare-fun e!509762 () Bool)

(assert (=> mapNonEmpty!30007 (= mapRes!30007 (and tp!57594 e!509762))))

(declare-fun mapValue!30007 () ValueCell!8949)

(declare-fun mapRest!30007 () (Array (_ BitVec 32) ValueCell!8949))

(declare-fun mapKey!30007 () (_ BitVec 32))

(assert (=> mapNonEmpty!30007 (= (arr!25832 _values!1152) (store mapRest!30007 mapKey!30007 mapValue!30007))))

(declare-fun b!909413 () Bool)

(declare-fun res!613795 () Bool)

(assert (=> b!909413 (=> (not res!613795) (not e!509764))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53750 (_ BitVec 32)) Bool)

(assert (=> b!909413 (= res!613795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!909414 () Bool)

(declare-fun e!509766 () Bool)

(assert (=> b!909414 (= e!509766 tp_is_empty!18861)))

(declare-fun b!909415 () Bool)

(declare-fun res!613796 () Bool)

(assert (=> b!909415 (=> (not res!613796) (not e!509764))))

(declare-datatypes ((List!18151 0))(
  ( (Nil!18148) (Cons!18147 (h!19293 (_ BitVec 64)) (t!25732 List!18151)) )
))
(declare-fun arrayNoDuplicates!0 (array!53750 (_ BitVec 32) List!18151) Bool)

(assert (=> b!909415 (= res!613796 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18148))))

(declare-fun mapIsEmpty!30007 () Bool)

(assert (=> mapIsEmpty!30007 mapRes!30007))

(declare-fun b!909416 () Bool)

(assert (=> b!909416 (= e!509764 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30113)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun lt!409991 () Bool)

(declare-fun minValue!1094 () V!30113)

(declare-datatypes ((tuple2!12360 0))(
  ( (tuple2!12361 (_1!6191 (_ BitVec 64)) (_2!6191 V!30113)) )
))
(declare-datatypes ((List!18152 0))(
  ( (Nil!18149) (Cons!18148 (h!19294 tuple2!12360) (t!25733 List!18152)) )
))
(declare-datatypes ((ListLongMap!11057 0))(
  ( (ListLongMap!11058 (toList!5544 List!18152)) )
))
(declare-fun contains!4586 (ListLongMap!11057 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2806 (array!53750 array!53748 (_ BitVec 32) (_ BitVec 32) V!30113 V!30113 (_ BitVec 32) Int) ListLongMap!11057)

(assert (=> b!909416 (= lt!409991 (contains!4586 (getCurrentListMap!2806 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!909417 () Bool)

(assert (=> b!909417 (= e!509763 (and e!509766 mapRes!30007))))

(declare-fun condMapEmpty!30007 () Bool)

(declare-fun mapDefault!30007 () ValueCell!8949)

(assert (=> b!909417 (= condMapEmpty!30007 (= (arr!25832 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8949)) mapDefault!30007)))))

(declare-fun b!909418 () Bool)

(assert (=> b!909418 (= e!509762 tp_is_empty!18861)))

(assert (= (and start!77884 res!613797) b!909412))

(assert (= (and b!909412 res!613794) b!909413))

(assert (= (and b!909413 res!613795) b!909415))

(assert (= (and b!909415 res!613796) b!909416))

(assert (= (and b!909417 condMapEmpty!30007) mapIsEmpty!30007))

(assert (= (and b!909417 (not condMapEmpty!30007)) mapNonEmpty!30007))

(get-info :version)

(assert (= (and mapNonEmpty!30007 ((_ is ValueCellFull!8949) mapValue!30007)) b!909418))

(assert (= (and b!909417 ((_ is ValueCellFull!8949) mapDefault!30007)) b!909414))

(assert (= start!77884 b!909417))

(declare-fun m!844665 () Bool)

(assert (=> b!909415 m!844665))

(declare-fun m!844667 () Bool)

(assert (=> mapNonEmpty!30007 m!844667))

(declare-fun m!844669 () Bool)

(assert (=> start!77884 m!844669))

(declare-fun m!844671 () Bool)

(assert (=> start!77884 m!844671))

(declare-fun m!844673 () Bool)

(assert (=> start!77884 m!844673))

(declare-fun m!844675 () Bool)

(assert (=> b!909416 m!844675))

(assert (=> b!909416 m!844675))

(declare-fun m!844677 () Bool)

(assert (=> b!909416 m!844677))

(declare-fun m!844679 () Bool)

(assert (=> b!909413 m!844679))

(check-sat tp_is_empty!18861 (not b!909415) (not mapNonEmpty!30007) (not b!909413) (not start!77884) (not b!909416) b_and!27011 (not b_next!16443))
(check-sat b_and!27011 (not b_next!16443))
