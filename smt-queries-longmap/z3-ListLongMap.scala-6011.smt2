; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77936 () Bool)

(assert start!77936)

(declare-fun b_free!16479 () Bool)

(declare-fun b_next!16479 () Bool)

(assert (=> start!77936 (= b_free!16479 (not b_next!16479))))

(declare-fun tp!57705 () Bool)

(declare-fun b_and!27049 () Bool)

(assert (=> start!77936 (= tp!57705 b_and!27049)))

(declare-fun b!909917 () Bool)

(declare-fun e!510105 () Bool)

(declare-fun tp_is_empty!18897 () Bool)

(assert (=> b!909917 (= e!510105 tp_is_empty!18897)))

(declare-fun mapIsEmpty!30064 () Bool)

(declare-fun mapRes!30064 () Bool)

(assert (=> mapIsEmpty!30064 mapRes!30064))

(declare-fun b!909918 () Bool)

(declare-fun e!510107 () Bool)

(assert (=> b!909918 (= e!510107 false)))

(declare-datatypes ((V!30161 0))(
  ( (V!30162 (val!9499 Int)) )
))
(declare-datatypes ((ValueCell!8967 0))(
  ( (ValueCellFull!8967 (v!12007 V!30161)) (EmptyCell!8967) )
))
(declare-datatypes ((array!53816 0))(
  ( (array!53817 (arr!25865 (Array (_ BitVec 32) ValueCell!8967)) (size!26324 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53816)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30161)

(declare-datatypes ((array!53818 0))(
  ( (array!53819 (arr!25866 (Array (_ BitVec 32) (_ BitVec 64))) (size!26325 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53818)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30161)

(declare-fun lt!410123 () Bool)

(declare-fun defaultEntry!1160 () Int)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-datatypes ((tuple2!12380 0))(
  ( (tuple2!12381 (_1!6201 (_ BitVec 64)) (_2!6201 V!30161)) )
))
(declare-datatypes ((List!18171 0))(
  ( (Nil!18168) (Cons!18167 (h!19313 tuple2!12380) (t!25754 List!18171)) )
))
(declare-datatypes ((ListLongMap!11077 0))(
  ( (ListLongMap!11078 (toList!5554 List!18171)) )
))
(declare-fun contains!4597 (ListLongMap!11077 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2816 (array!53818 array!53816 (_ BitVec 32) (_ BitVec 32) V!30161 V!30161 (_ BitVec 32) Int) ListLongMap!11077)

(assert (=> b!909918 (= lt!410123 (contains!4597 (getCurrentListMap!2816 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun res!614075 () Bool)

(assert (=> start!77936 (=> (not res!614075) (not e!510107))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77936 (= res!614075 (validMask!0 mask!1756))))

(assert (=> start!77936 e!510107))

(declare-fun e!510106 () Bool)

(declare-fun array_inv!20230 (array!53816) Bool)

(assert (=> start!77936 (and (array_inv!20230 _values!1152) e!510106)))

(assert (=> start!77936 tp!57705))

(assert (=> start!77936 true))

(assert (=> start!77936 tp_is_empty!18897))

(declare-fun array_inv!20231 (array!53818) Bool)

(assert (=> start!77936 (array_inv!20231 _keys!1386)))

(declare-fun b!909919 () Bool)

(declare-fun res!614074 () Bool)

(assert (=> b!909919 (=> (not res!614074) (not e!510107))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53818 (_ BitVec 32)) Bool)

(assert (=> b!909919 (= res!614074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapNonEmpty!30064 () Bool)

(declare-fun tp!57704 () Bool)

(assert (=> mapNonEmpty!30064 (= mapRes!30064 (and tp!57704 e!510105))))

(declare-fun mapKey!30064 () (_ BitVec 32))

(declare-fun mapRest!30064 () (Array (_ BitVec 32) ValueCell!8967))

(declare-fun mapValue!30064 () ValueCell!8967)

(assert (=> mapNonEmpty!30064 (= (arr!25865 _values!1152) (store mapRest!30064 mapKey!30064 mapValue!30064))))

(declare-fun b!909920 () Bool)

(declare-fun res!614073 () Bool)

(assert (=> b!909920 (=> (not res!614073) (not e!510107))))

(declare-datatypes ((List!18172 0))(
  ( (Nil!18169) (Cons!18168 (h!19314 (_ BitVec 64)) (t!25755 List!18172)) )
))
(declare-fun arrayNoDuplicates!0 (array!53818 (_ BitVec 32) List!18172) Bool)

(assert (=> b!909920 (= res!614073 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18169))))

(declare-fun b!909921 () Bool)

(declare-fun e!510104 () Bool)

(assert (=> b!909921 (= e!510106 (and e!510104 mapRes!30064))))

(declare-fun condMapEmpty!30064 () Bool)

(declare-fun mapDefault!30064 () ValueCell!8967)

(assert (=> b!909921 (= condMapEmpty!30064 (= (arr!25865 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8967)) mapDefault!30064)))))

(declare-fun b!909922 () Bool)

(assert (=> b!909922 (= e!510104 tp_is_empty!18897)))

(declare-fun b!909923 () Bool)

(declare-fun res!614076 () Bool)

(assert (=> b!909923 (=> (not res!614076) (not e!510107))))

(assert (=> b!909923 (= res!614076 (and (= (size!26324 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26325 _keys!1386) (size!26324 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(assert (= (and start!77936 res!614075) b!909923))

(assert (= (and b!909923 res!614076) b!909919))

(assert (= (and b!909919 res!614074) b!909920))

(assert (= (and b!909920 res!614073) b!909918))

(assert (= (and b!909921 condMapEmpty!30064) mapIsEmpty!30064))

(assert (= (and b!909921 (not condMapEmpty!30064)) mapNonEmpty!30064))

(get-info :version)

(assert (= (and mapNonEmpty!30064 ((_ is ValueCellFull!8967) mapValue!30064)) b!909917))

(assert (= (and b!909921 ((_ is ValueCellFull!8967) mapDefault!30064)) b!909922))

(assert (= start!77936 b!909921))

(declare-fun m!845045 () Bool)

(assert (=> b!909919 m!845045))

(declare-fun m!845047 () Bool)

(assert (=> mapNonEmpty!30064 m!845047))

(declare-fun m!845049 () Bool)

(assert (=> start!77936 m!845049))

(declare-fun m!845051 () Bool)

(assert (=> start!77936 m!845051))

(declare-fun m!845053 () Bool)

(assert (=> start!77936 m!845053))

(declare-fun m!845055 () Bool)

(assert (=> b!909918 m!845055))

(assert (=> b!909918 m!845055))

(declare-fun m!845057 () Bool)

(assert (=> b!909918 m!845057))

(declare-fun m!845059 () Bool)

(assert (=> b!909920 m!845059))

(check-sat (not start!77936) b_and!27049 (not b_next!16479) tp_is_empty!18897 (not b!909918) (not mapNonEmpty!30064) (not b!909919) (not b!909920))
(check-sat b_and!27049 (not b_next!16479))
