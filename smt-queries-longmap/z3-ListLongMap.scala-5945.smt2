; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77468 () Bool)

(assert start!77468)

(declare-fun res!609165 () Bool)

(declare-fun e!505681 () Bool)

(assert (=> start!77468 (=> (not res!609165) (not e!505681))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77468 (= res!609165 (validMask!0 mask!1756))))

(assert (=> start!77468 e!505681))

(assert (=> start!77468 true))

(declare-datatypes ((V!29631 0))(
  ( (V!29632 (val!9300 Int)) )
))
(declare-datatypes ((ValueCell!8768 0))(
  ( (ValueCellFull!8768 (v!11804 V!29631)) (EmptyCell!8768) )
))
(declare-datatypes ((array!53041 0))(
  ( (array!53042 (arr!25481 (Array (_ BitVec 32) ValueCell!8768)) (size!25942 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53041)

(declare-fun e!505682 () Bool)

(declare-fun array_inv!20030 (array!53041) Bool)

(assert (=> start!77468 (and (array_inv!20030 _values!1152) e!505682)))

(declare-datatypes ((array!53043 0))(
  ( (array!53044 (arr!25482 (Array (_ BitVec 32) (_ BitVec 64))) (size!25943 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53043)

(declare-fun array_inv!20031 (array!53043) Bool)

(assert (=> start!77468 (array_inv!20031 _keys!1386)))

(declare-fun b!902717 () Bool)

(declare-fun e!505683 () Bool)

(declare-fun tp_is_empty!18499 () Bool)

(assert (=> b!902717 (= e!505683 tp_is_empty!18499)))

(declare-fun b!902718 () Bool)

(declare-fun res!609164 () Bool)

(assert (=> b!902718 (=> (not res!609164) (not e!505681))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!902718 (= res!609164 (and (= (size!25942 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25943 _keys!1386) (size!25942 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!29458 () Bool)

(declare-fun mapRes!29458 () Bool)

(assert (=> mapIsEmpty!29458 mapRes!29458))

(declare-fun b!902719 () Bool)

(declare-fun e!505684 () Bool)

(assert (=> b!902719 (= e!505684 tp_is_empty!18499)))

(declare-fun mapNonEmpty!29458 () Bool)

(declare-fun tp!56518 () Bool)

(assert (=> mapNonEmpty!29458 (= mapRes!29458 (and tp!56518 e!505683))))

(declare-fun mapKey!29458 () (_ BitVec 32))

(declare-fun mapRest!29458 () (Array (_ BitVec 32) ValueCell!8768))

(declare-fun mapValue!29458 () ValueCell!8768)

(assert (=> mapNonEmpty!29458 (= (arr!25481 _values!1152) (store mapRest!29458 mapKey!29458 mapValue!29458))))

(declare-fun b!902720 () Bool)

(assert (=> b!902720 (= e!505681 false)))

(declare-fun lt!407707 () Bool)

(declare-datatypes ((List!17914 0))(
  ( (Nil!17911) (Cons!17910 (h!19056 (_ BitVec 64)) (t!25288 List!17914)) )
))
(declare-fun arrayNoDuplicates!0 (array!53043 (_ BitVec 32) List!17914) Bool)

(assert (=> b!902720 (= lt!407707 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17911))))

(declare-fun b!902721 () Bool)

(assert (=> b!902721 (= e!505682 (and e!505684 mapRes!29458))))

(declare-fun condMapEmpty!29458 () Bool)

(declare-fun mapDefault!29458 () ValueCell!8768)

(assert (=> b!902721 (= condMapEmpty!29458 (= (arr!25481 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8768)) mapDefault!29458)))))

(declare-fun b!902722 () Bool)

(declare-fun res!609163 () Bool)

(assert (=> b!902722 (=> (not res!609163) (not e!505681))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53043 (_ BitVec 32)) Bool)

(assert (=> b!902722 (= res!609163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(assert (= (and start!77468 res!609165) b!902718))

(assert (= (and b!902718 res!609164) b!902722))

(assert (= (and b!902722 res!609163) b!902720))

(assert (= (and b!902721 condMapEmpty!29458) mapIsEmpty!29458))

(assert (= (and b!902721 (not condMapEmpty!29458)) mapNonEmpty!29458))

(get-info :version)

(assert (= (and mapNonEmpty!29458 ((_ is ValueCellFull!8768) mapValue!29458)) b!902717))

(assert (= (and b!902721 ((_ is ValueCellFull!8768) mapDefault!29458)) b!902719))

(assert (= start!77468 b!902721))

(declare-fun m!838025 () Bool)

(assert (=> start!77468 m!838025))

(declare-fun m!838027 () Bool)

(assert (=> start!77468 m!838027))

(declare-fun m!838029 () Bool)

(assert (=> start!77468 m!838029))

(declare-fun m!838031 () Bool)

(assert (=> mapNonEmpty!29458 m!838031))

(declare-fun m!838033 () Bool)

(assert (=> b!902720 m!838033))

(declare-fun m!838035 () Bool)

(assert (=> b!902722 m!838035))

(check-sat (not b!902722) (not b!902720) (not mapNonEmpty!29458) (not start!77468) tp_is_empty!18499)
(check-sat)
