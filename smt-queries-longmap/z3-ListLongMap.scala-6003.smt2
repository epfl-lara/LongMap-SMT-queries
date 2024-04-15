; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77852 () Bool)

(assert start!77852)

(declare-fun b_free!16429 () Bool)

(declare-fun b_next!16429 () Bool)

(assert (=> start!77852 (= b_free!16429 (not b_next!16429))))

(declare-fun tp!57553 () Bool)

(declare-fun b_and!26971 () Bool)

(assert (=> start!77852 (= tp!57553 b_and!26971)))

(declare-fun b!909026 () Bool)

(declare-fun e!509509 () Bool)

(assert (=> b!909026 (= e!509509 false)))

(declare-datatypes ((V!30095 0))(
  ( (V!30096 (val!9474 Int)) )
))
(declare-datatypes ((ValueCell!8942 0))(
  ( (ValueCellFull!8942 (v!11980 V!30095)) (EmptyCell!8942) )
))
(declare-datatypes ((array!53703 0))(
  ( (array!53704 (arr!25810 (Array (_ BitVec 32) ValueCell!8942)) (size!26271 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53703)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30095)

(declare-datatypes ((array!53705 0))(
  ( (array!53706 (arr!25811 (Array (_ BitVec 32) (_ BitVec 64))) (size!26272 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53705)

(declare-fun lt!409734 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30095)

(declare-datatypes ((tuple2!12378 0))(
  ( (tuple2!12379 (_1!6200 (_ BitVec 64)) (_2!6200 V!30095)) )
))
(declare-datatypes ((List!18160 0))(
  ( (Nil!18157) (Cons!18156 (h!19302 tuple2!12378) (t!25732 List!18160)) )
))
(declare-datatypes ((ListLongMap!11065 0))(
  ( (ListLongMap!11066 (toList!5548 List!18160)) )
))
(declare-fun contains!4547 (ListLongMap!11065 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2750 (array!53705 array!53703 (_ BitVec 32) (_ BitVec 32) V!30095 V!30095 (_ BitVec 32) Int) ListLongMap!11065)

(assert (=> b!909026 (= lt!409734 (contains!4547 (getCurrentListMap!2750 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!909027 () Bool)

(declare-fun e!509511 () Bool)

(declare-fun e!509512 () Bool)

(declare-fun mapRes!29986 () Bool)

(assert (=> b!909027 (= e!509511 (and e!509512 mapRes!29986))))

(declare-fun condMapEmpty!29986 () Bool)

(declare-fun mapDefault!29986 () ValueCell!8942)

(assert (=> b!909027 (= condMapEmpty!29986 (= (arr!25810 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8942)) mapDefault!29986)))))

(declare-fun b!909028 () Bool)

(declare-fun res!613600 () Bool)

(assert (=> b!909028 (=> (not res!613600) (not e!509509))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53705 (_ BitVec 32)) Bool)

(assert (=> b!909028 (= res!613600 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun res!613603 () Bool)

(assert (=> start!77852 (=> (not res!613603) (not e!509509))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77852 (= res!613603 (validMask!0 mask!1756))))

(assert (=> start!77852 e!509509))

(declare-fun array_inv!20242 (array!53703) Bool)

(assert (=> start!77852 (and (array_inv!20242 _values!1152) e!509511)))

(assert (=> start!77852 tp!57553))

(assert (=> start!77852 true))

(declare-fun tp_is_empty!18847 () Bool)

(assert (=> start!77852 tp_is_empty!18847))

(declare-fun array_inv!20243 (array!53705) Bool)

(assert (=> start!77852 (array_inv!20243 _keys!1386)))

(declare-fun b!909029 () Bool)

(declare-fun res!613601 () Bool)

(assert (=> b!909029 (=> (not res!613601) (not e!509509))))

(assert (=> b!909029 (= res!613601 (and (= (size!26271 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26272 _keys!1386) (size!26271 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!909030 () Bool)

(declare-fun e!509510 () Bool)

(assert (=> b!909030 (= e!509510 tp_is_empty!18847)))

(declare-fun mapNonEmpty!29986 () Bool)

(declare-fun tp!57552 () Bool)

(assert (=> mapNonEmpty!29986 (= mapRes!29986 (and tp!57552 e!509510))))

(declare-fun mapRest!29986 () (Array (_ BitVec 32) ValueCell!8942))

(declare-fun mapValue!29986 () ValueCell!8942)

(declare-fun mapKey!29986 () (_ BitVec 32))

(assert (=> mapNonEmpty!29986 (= (arr!25810 _values!1152) (store mapRest!29986 mapKey!29986 mapValue!29986))))

(declare-fun b!909031 () Bool)

(assert (=> b!909031 (= e!509512 tp_is_empty!18847)))

(declare-fun mapIsEmpty!29986 () Bool)

(assert (=> mapIsEmpty!29986 mapRes!29986))

(declare-fun b!909032 () Bool)

(declare-fun res!613602 () Bool)

(assert (=> b!909032 (=> (not res!613602) (not e!509509))))

(declare-datatypes ((List!18161 0))(
  ( (Nil!18158) (Cons!18157 (h!19303 (_ BitVec 64)) (t!25733 List!18161)) )
))
(declare-fun arrayNoDuplicates!0 (array!53705 (_ BitVec 32) List!18161) Bool)

(assert (=> b!909032 (= res!613602 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18158))))

(assert (= (and start!77852 res!613603) b!909029))

(assert (= (and b!909029 res!613601) b!909028))

(assert (= (and b!909028 res!613600) b!909032))

(assert (= (and b!909032 res!613602) b!909026))

(assert (= (and b!909027 condMapEmpty!29986) mapIsEmpty!29986))

(assert (= (and b!909027 (not condMapEmpty!29986)) mapNonEmpty!29986))

(get-info :version)

(assert (= (and mapNonEmpty!29986 ((_ is ValueCellFull!8942) mapValue!29986)) b!909030))

(assert (= (and b!909027 ((_ is ValueCellFull!8942) mapDefault!29986)) b!909031))

(assert (= start!77852 b!909027))

(declare-fun m!843795 () Bool)

(assert (=> b!909026 m!843795))

(assert (=> b!909026 m!843795))

(declare-fun m!843797 () Bool)

(assert (=> b!909026 m!843797))

(declare-fun m!843799 () Bool)

(assert (=> mapNonEmpty!29986 m!843799))

(declare-fun m!843801 () Bool)

(assert (=> start!77852 m!843801))

(declare-fun m!843803 () Bool)

(assert (=> start!77852 m!843803))

(declare-fun m!843805 () Bool)

(assert (=> start!77852 m!843805))

(declare-fun m!843807 () Bool)

(assert (=> b!909028 m!843807))

(declare-fun m!843809 () Bool)

(assert (=> b!909032 m!843809))

(check-sat (not b!909032) tp_is_empty!18847 b_and!26971 (not mapNonEmpty!29986) (not b!909026) (not b_next!16429) (not b!909028) (not start!77852))
(check-sat b_and!26971 (not b_next!16429))
