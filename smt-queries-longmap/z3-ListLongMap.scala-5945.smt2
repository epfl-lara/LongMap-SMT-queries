; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77488 () Bool)

(assert start!77488)

(declare-fun b!902974 () Bool)

(declare-fun e!505844 () Bool)

(declare-fun tp_is_empty!18501 () Bool)

(assert (=> b!902974 (= e!505844 tp_is_empty!18501)))

(declare-fun mapIsEmpty!29461 () Bool)

(declare-fun mapRes!29461 () Bool)

(assert (=> mapIsEmpty!29461 mapRes!29461))

(declare-fun res!609283 () Bool)

(declare-fun e!505847 () Bool)

(assert (=> start!77488 (=> (not res!609283) (not e!505847))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77488 (= res!609283 (validMask!0 mask!1756))))

(assert (=> start!77488 e!505847))

(assert (=> start!77488 true))

(declare-datatypes ((V!29633 0))(
  ( (V!29634 (val!9301 Int)) )
))
(declare-datatypes ((ValueCell!8769 0))(
  ( (ValueCellFull!8769 (v!11806 V!29633)) (EmptyCell!8769) )
))
(declare-datatypes ((array!53060 0))(
  ( (array!53061 (arr!25490 (Array (_ BitVec 32) ValueCell!8769)) (size!25949 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53060)

(declare-fun e!505845 () Bool)

(declare-fun array_inv!19982 (array!53060) Bool)

(assert (=> start!77488 (and (array_inv!19982 _values!1152) e!505845)))

(declare-datatypes ((array!53062 0))(
  ( (array!53063 (arr!25491 (Array (_ BitVec 32) (_ BitVec 64))) (size!25950 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53062)

(declare-fun array_inv!19983 (array!53062) Bool)

(assert (=> start!77488 (array_inv!19983 _keys!1386)))

(declare-fun b!902975 () Bool)

(declare-fun res!609282 () Bool)

(assert (=> b!902975 (=> (not res!609282) (not e!505847))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!902975 (= res!609282 (and (= (size!25949 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25950 _keys!1386) (size!25949 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!902976 () Bool)

(declare-fun res!609284 () Bool)

(assert (=> b!902976 (=> (not res!609284) (not e!505847))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53062 (_ BitVec 32)) Bool)

(assert (=> b!902976 (= res!609284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!902977 () Bool)

(assert (=> b!902977 (= e!505845 (and e!505844 mapRes!29461))))

(declare-fun condMapEmpty!29461 () Bool)

(declare-fun mapDefault!29461 () ValueCell!8769)

(assert (=> b!902977 (= condMapEmpty!29461 (= (arr!25490 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8769)) mapDefault!29461)))))

(declare-fun b!902978 () Bool)

(declare-fun e!505848 () Bool)

(assert (=> b!902978 (= e!505848 tp_is_empty!18501)))

(declare-fun b!902979 () Bool)

(assert (=> b!902979 (= e!505847 false)))

(declare-fun lt!407946 () Bool)

(declare-datatypes ((List!17901 0))(
  ( (Nil!17898) (Cons!17897 (h!19043 (_ BitVec 64)) (t!25284 List!17901)) )
))
(declare-fun arrayNoDuplicates!0 (array!53062 (_ BitVec 32) List!17901) Bool)

(assert (=> b!902979 (= lt!407946 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17898))))

(declare-fun mapNonEmpty!29461 () Bool)

(declare-fun tp!56520 () Bool)

(assert (=> mapNonEmpty!29461 (= mapRes!29461 (and tp!56520 e!505848))))

(declare-fun mapValue!29461 () ValueCell!8769)

(declare-fun mapRest!29461 () (Array (_ BitVec 32) ValueCell!8769))

(declare-fun mapKey!29461 () (_ BitVec 32))

(assert (=> mapNonEmpty!29461 (= (arr!25490 _values!1152) (store mapRest!29461 mapKey!29461 mapValue!29461))))

(assert (= (and start!77488 res!609283) b!902975))

(assert (= (and b!902975 res!609282) b!902976))

(assert (= (and b!902976 res!609284) b!902979))

(assert (= (and b!902977 condMapEmpty!29461) mapIsEmpty!29461))

(assert (= (and b!902977 (not condMapEmpty!29461)) mapNonEmpty!29461))

(get-info :version)

(assert (= (and mapNonEmpty!29461 ((_ is ValueCellFull!8769) mapValue!29461)) b!902978))

(assert (= (and b!902977 ((_ is ValueCellFull!8769) mapDefault!29461)) b!902974))

(assert (= start!77488 b!902977))

(declare-fun m!838795 () Bool)

(assert (=> start!77488 m!838795))

(declare-fun m!838797 () Bool)

(assert (=> start!77488 m!838797))

(declare-fun m!838799 () Bool)

(assert (=> start!77488 m!838799))

(declare-fun m!838801 () Bool)

(assert (=> b!902976 m!838801))

(declare-fun m!838803 () Bool)

(assert (=> b!902979 m!838803))

(declare-fun m!838805 () Bool)

(assert (=> mapNonEmpty!29461 m!838805))

(check-sat (not start!77488) (not b!902979) (not mapNonEmpty!29461) tp_is_empty!18501 (not b!902976))
(check-sat)
