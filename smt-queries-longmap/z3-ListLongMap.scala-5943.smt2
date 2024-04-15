; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77456 () Bool)

(assert start!77456)

(declare-fun b!902609 () Bool)

(declare-fun e!505593 () Bool)

(declare-fun tp_is_empty!18487 () Bool)

(assert (=> b!902609 (= e!505593 tp_is_empty!18487)))

(declare-fun b!902610 () Bool)

(declare-fun res!609111 () Bool)

(declare-fun e!505594 () Bool)

(assert (=> b!902610 (=> (not res!609111) (not e!505594))))

(declare-datatypes ((V!29615 0))(
  ( (V!29616 (val!9294 Int)) )
))
(declare-datatypes ((ValueCell!8762 0))(
  ( (ValueCellFull!8762 (v!11798 V!29615)) (EmptyCell!8762) )
))
(declare-datatypes ((array!53019 0))(
  ( (array!53020 (arr!25470 (Array (_ BitVec 32) ValueCell!8762)) (size!25931 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53019)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53021 0))(
  ( (array!53022 (arr!25471 (Array (_ BitVec 32) (_ BitVec 64))) (size!25932 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53021)

(assert (=> b!902610 (= res!609111 (and (= (size!25931 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25932 _keys!1386) (size!25931 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!609109 () Bool)

(assert (=> start!77456 (=> (not res!609109) (not e!505594))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77456 (= res!609109 (validMask!0 mask!1756))))

(assert (=> start!77456 e!505594))

(assert (=> start!77456 true))

(declare-fun e!505591 () Bool)

(declare-fun array_inv!20024 (array!53019) Bool)

(assert (=> start!77456 (and (array_inv!20024 _values!1152) e!505591)))

(declare-fun array_inv!20025 (array!53021) Bool)

(assert (=> start!77456 (array_inv!20025 _keys!1386)))

(declare-fun b!902611 () Bool)

(declare-fun e!505595 () Bool)

(assert (=> b!902611 (= e!505595 tp_is_empty!18487)))

(declare-fun b!902612 () Bool)

(declare-fun mapRes!29440 () Bool)

(assert (=> b!902612 (= e!505591 (and e!505593 mapRes!29440))))

(declare-fun condMapEmpty!29440 () Bool)

(declare-fun mapDefault!29440 () ValueCell!8762)

(assert (=> b!902612 (= condMapEmpty!29440 (= (arr!25470 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8762)) mapDefault!29440)))))

(declare-fun mapIsEmpty!29440 () Bool)

(assert (=> mapIsEmpty!29440 mapRes!29440))

(declare-fun b!902613 () Bool)

(declare-fun res!609110 () Bool)

(assert (=> b!902613 (=> (not res!609110) (not e!505594))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53021 (_ BitVec 32)) Bool)

(assert (=> b!902613 (= res!609110 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapNonEmpty!29440 () Bool)

(declare-fun tp!56500 () Bool)

(assert (=> mapNonEmpty!29440 (= mapRes!29440 (and tp!56500 e!505595))))

(declare-fun mapKey!29440 () (_ BitVec 32))

(declare-fun mapValue!29440 () ValueCell!8762)

(declare-fun mapRest!29440 () (Array (_ BitVec 32) ValueCell!8762))

(assert (=> mapNonEmpty!29440 (= (arr!25470 _values!1152) (store mapRest!29440 mapKey!29440 mapValue!29440))))

(declare-fun b!902614 () Bool)

(assert (=> b!902614 (= e!505594 false)))

(declare-fun lt!407689 () Bool)

(declare-datatypes ((List!17909 0))(
  ( (Nil!17906) (Cons!17905 (h!19051 (_ BitVec 64)) (t!25283 List!17909)) )
))
(declare-fun arrayNoDuplicates!0 (array!53021 (_ BitVec 32) List!17909) Bool)

(assert (=> b!902614 (= lt!407689 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17906))))

(assert (= (and start!77456 res!609109) b!902610))

(assert (= (and b!902610 res!609111) b!902613))

(assert (= (and b!902613 res!609110) b!902614))

(assert (= (and b!902612 condMapEmpty!29440) mapIsEmpty!29440))

(assert (= (and b!902612 (not condMapEmpty!29440)) mapNonEmpty!29440))

(get-info :version)

(assert (= (and mapNonEmpty!29440 ((_ is ValueCellFull!8762) mapValue!29440)) b!902611))

(assert (= (and b!902612 ((_ is ValueCellFull!8762) mapDefault!29440)) b!902609))

(assert (= start!77456 b!902612))

(declare-fun m!837953 () Bool)

(assert (=> start!77456 m!837953))

(declare-fun m!837955 () Bool)

(assert (=> start!77456 m!837955))

(declare-fun m!837957 () Bool)

(assert (=> start!77456 m!837957))

(declare-fun m!837959 () Bool)

(assert (=> b!902613 m!837959))

(declare-fun m!837961 () Bool)

(assert (=> mapNonEmpty!29440 m!837961))

(declare-fun m!837963 () Bool)

(assert (=> b!902614 m!837963))

(check-sat (not b!902614) (not start!77456) tp_is_empty!18487 (not b!902613) (not mapNonEmpty!29440))
(check-sat)
