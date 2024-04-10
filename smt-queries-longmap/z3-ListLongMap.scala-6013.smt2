; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77948 () Bool)

(assert start!77948)

(declare-fun b_free!16491 () Bool)

(declare-fun b_next!16491 () Bool)

(assert (=> start!77948 (= b_free!16491 (not b_next!16491))))

(declare-fun tp!57740 () Bool)

(declare-fun b_and!27061 () Bool)

(assert (=> start!77948 (= tp!57740 b_and!27061)))

(declare-fun b!910043 () Bool)

(declare-fun e!510197 () Bool)

(declare-fun tp_is_empty!18909 () Bool)

(assert (=> b!910043 (= e!510197 tp_is_empty!18909)))

(declare-fun b!910044 () Bool)

(declare-fun e!510198 () Bool)

(declare-fun mapRes!30082 () Bool)

(assert (=> b!910044 (= e!510198 (and e!510197 mapRes!30082))))

(declare-fun condMapEmpty!30082 () Bool)

(declare-datatypes ((V!30177 0))(
  ( (V!30178 (val!9505 Int)) )
))
(declare-datatypes ((ValueCell!8973 0))(
  ( (ValueCellFull!8973 (v!12013 V!30177)) (EmptyCell!8973) )
))
(declare-datatypes ((array!53838 0))(
  ( (array!53839 (arr!25876 (Array (_ BitVec 32) ValueCell!8973)) (size!26335 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53838)

(declare-fun mapDefault!30082 () ValueCell!8973)

(assert (=> b!910044 (= condMapEmpty!30082 (= (arr!25876 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8973)) mapDefault!30082)))))

(declare-fun b!910045 () Bool)

(declare-fun res!614147 () Bool)

(declare-fun e!510194 () Bool)

(assert (=> b!910045 (=> (not res!614147) (not e!510194))))

(declare-datatypes ((array!53840 0))(
  ( (array!53841 (arr!25877 (Array (_ BitVec 32) (_ BitVec 64))) (size!26336 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53840)

(declare-datatypes ((List!18178 0))(
  ( (Nil!18175) (Cons!18174 (h!19320 (_ BitVec 64)) (t!25761 List!18178)) )
))
(declare-fun arrayNoDuplicates!0 (array!53840 (_ BitVec 32) List!18178) Bool)

(assert (=> b!910045 (= res!614147 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18175))))

(declare-fun b!910046 () Bool)

(declare-fun res!614148 () Bool)

(assert (=> b!910046 (=> (not res!614148) (not e!510194))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53840 (_ BitVec 32)) Bool)

(assert (=> b!910046 (= res!614148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapIsEmpty!30082 () Bool)

(assert (=> mapIsEmpty!30082 mapRes!30082))

(declare-fun b!910047 () Bool)

(declare-fun res!614145 () Bool)

(assert (=> b!910047 (=> (not res!614145) (not e!510194))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!910047 (= res!614145 (and (= (size!26335 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26336 _keys!1386) (size!26335 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!910048 () Bool)

(declare-fun e!510196 () Bool)

(assert (=> b!910048 (= e!510196 tp_is_empty!18909)))

(declare-fun res!614146 () Bool)

(assert (=> start!77948 (=> (not res!614146) (not e!510194))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77948 (= res!614146 (validMask!0 mask!1756))))

(assert (=> start!77948 e!510194))

(declare-fun array_inv!20238 (array!53838) Bool)

(assert (=> start!77948 (and (array_inv!20238 _values!1152) e!510198)))

(assert (=> start!77948 tp!57740))

(assert (=> start!77948 true))

(assert (=> start!77948 tp_is_empty!18909))

(declare-fun array_inv!20239 (array!53840) Bool)

(assert (=> start!77948 (array_inv!20239 _keys!1386)))

(declare-fun mapNonEmpty!30082 () Bool)

(declare-fun tp!57741 () Bool)

(assert (=> mapNonEmpty!30082 (= mapRes!30082 (and tp!57741 e!510196))))

(declare-fun mapRest!30082 () (Array (_ BitVec 32) ValueCell!8973))

(declare-fun mapValue!30082 () ValueCell!8973)

(declare-fun mapKey!30082 () (_ BitVec 32))

(assert (=> mapNonEmpty!30082 (= (arr!25876 _values!1152) (store mapRest!30082 mapKey!30082 mapValue!30082))))

(declare-fun b!910049 () Bool)

(assert (=> b!910049 (= e!510194 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30177)

(declare-fun lt!410141 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30177)

(declare-datatypes ((tuple2!12388 0))(
  ( (tuple2!12389 (_1!6205 (_ BitVec 64)) (_2!6205 V!30177)) )
))
(declare-datatypes ((List!18179 0))(
  ( (Nil!18176) (Cons!18175 (h!19321 tuple2!12388) (t!25762 List!18179)) )
))
(declare-datatypes ((ListLongMap!11085 0))(
  ( (ListLongMap!11086 (toList!5558 List!18179)) )
))
(declare-fun contains!4601 (ListLongMap!11085 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2820 (array!53840 array!53838 (_ BitVec 32) (_ BitVec 32) V!30177 V!30177 (_ BitVec 32) Int) ListLongMap!11085)

(assert (=> b!910049 (= lt!410141 (contains!4601 (getCurrentListMap!2820 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(assert (= (and start!77948 res!614146) b!910047))

(assert (= (and b!910047 res!614145) b!910046))

(assert (= (and b!910046 res!614148) b!910045))

(assert (= (and b!910045 res!614147) b!910049))

(assert (= (and b!910044 condMapEmpty!30082) mapIsEmpty!30082))

(assert (= (and b!910044 (not condMapEmpty!30082)) mapNonEmpty!30082))

(get-info :version)

(assert (= (and mapNonEmpty!30082 ((_ is ValueCellFull!8973) mapValue!30082)) b!910048))

(assert (= (and b!910044 ((_ is ValueCellFull!8973) mapDefault!30082)) b!910043))

(assert (= start!77948 b!910044))

(declare-fun m!845141 () Bool)

(assert (=> mapNonEmpty!30082 m!845141))

(declare-fun m!845143 () Bool)

(assert (=> start!77948 m!845143))

(declare-fun m!845145 () Bool)

(assert (=> start!77948 m!845145))

(declare-fun m!845147 () Bool)

(assert (=> start!77948 m!845147))

(declare-fun m!845149 () Bool)

(assert (=> b!910046 m!845149))

(declare-fun m!845151 () Bool)

(assert (=> b!910045 m!845151))

(declare-fun m!845153 () Bool)

(assert (=> b!910049 m!845153))

(assert (=> b!910049 m!845153))

(declare-fun m!845155 () Bool)

(assert (=> b!910049 m!845155))

(check-sat (not b!910046) (not b!910045) b_and!27061 (not mapNonEmpty!30082) (not start!77948) (not b!910049) (not b_next!16491) tp_is_empty!18909)
(check-sat b_and!27061 (not b_next!16491))
