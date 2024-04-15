; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95394 () Bool)

(assert start!95394)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun i!650 () (_ BitVec 32))

(declare-fun e!615989 () Bool)

(declare-datatypes ((array!69108 0))(
  ( (array!69109 (arr!33232 (Array (_ BitVec 32) (_ BitVec 64))) (size!33770 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69108)

(declare-fun b!1077311 () Bool)

(assert (=> b!1077311 (= e!615989 (and (= (select (arr!33232 _keys!1070) i!650) k0!904) (not (= (size!33770 _keys!1070) (bvadd #b00000000000000000000000000000001 mask!1414)))))))

(declare-fun res!717869 () Bool)

(assert (=> start!95394 (=> (not res!717869) (not e!615989))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95394 (= res!717869 (validMask!0 mask!1414))))

(assert (=> start!95394 e!615989))

(assert (=> start!95394 true))

(declare-fun array_inv!25704 (array!69108) Bool)

(assert (=> start!95394 (array_inv!25704 _keys!1070)))

(declare-datatypes ((V!39945 0))(
  ( (V!39946 (val!13113 Int)) )
))
(declare-datatypes ((ValueCell!12347 0))(
  ( (ValueCellFull!12347 (v!15732 V!39945)) (EmptyCell!12347) )
))
(declare-datatypes ((array!69110 0))(
  ( (array!69111 (arr!33233 (Array (_ BitVec 32) ValueCell!12347)) (size!33771 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69110)

(declare-fun e!615985 () Bool)

(declare-fun array_inv!25705 (array!69110) Bool)

(assert (=> start!95394 (and (array_inv!25705 _values!874) e!615985)))

(declare-fun b!1077312 () Bool)

(declare-fun e!615988 () Bool)

(declare-fun tp_is_empty!26113 () Bool)

(assert (=> b!1077312 (= e!615988 tp_is_empty!26113)))

(declare-fun b!1077313 () Bool)

(declare-fun res!717871 () Bool)

(assert (=> b!1077313 (=> (not res!717871) (not e!615989))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1077313 (= res!717871 (validKeyInArray!0 k0!904))))

(declare-fun b!1077314 () Bool)

(declare-fun res!717870 () Bool)

(assert (=> b!1077314 (=> (not res!717870) (not e!615989))))

(assert (=> b!1077314 (= res!717870 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33770 _keys!1070))))))

(declare-fun b!1077315 () Bool)

(declare-fun e!615986 () Bool)

(assert (=> b!1077315 (= e!615986 tp_is_empty!26113)))

(declare-fun mapIsEmpty!40912 () Bool)

(declare-fun mapRes!40912 () Bool)

(assert (=> mapIsEmpty!40912 mapRes!40912))

(declare-fun mapNonEmpty!40912 () Bool)

(declare-fun tp!78374 () Bool)

(assert (=> mapNonEmpty!40912 (= mapRes!40912 (and tp!78374 e!615988))))

(declare-fun mapKey!40912 () (_ BitVec 32))

(declare-fun mapRest!40912 () (Array (_ BitVec 32) ValueCell!12347))

(declare-fun mapValue!40912 () ValueCell!12347)

(assert (=> mapNonEmpty!40912 (= (arr!33233 _values!874) (store mapRest!40912 mapKey!40912 mapValue!40912))))

(declare-fun b!1077316 () Bool)

(declare-fun res!717867 () Bool)

(assert (=> b!1077316 (=> (not res!717867) (not e!615989))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69108 (_ BitVec 32)) Bool)

(assert (=> b!1077316 (= res!717867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1077317 () Bool)

(declare-fun res!717868 () Bool)

(assert (=> b!1077317 (=> (not res!717868) (not e!615989))))

(declare-datatypes ((List!23270 0))(
  ( (Nil!23267) (Cons!23266 (h!24475 (_ BitVec 64)) (t!32620 List!23270)) )
))
(declare-fun arrayNoDuplicates!0 (array!69108 (_ BitVec 32) List!23270) Bool)

(assert (=> b!1077317 (= res!717868 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23267))))

(declare-fun b!1077318 () Bool)

(declare-fun res!717872 () Bool)

(assert (=> b!1077318 (=> (not res!717872) (not e!615989))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1077318 (= res!717872 (and (= (size!33771 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33770 _keys!1070) (size!33771 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1077319 () Bool)

(assert (=> b!1077319 (= e!615985 (and e!615986 mapRes!40912))))

(declare-fun condMapEmpty!40912 () Bool)

(declare-fun mapDefault!40912 () ValueCell!12347)

(assert (=> b!1077319 (= condMapEmpty!40912 (= (arr!33233 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12347)) mapDefault!40912)))))

(assert (= (and start!95394 res!717869) b!1077318))

(assert (= (and b!1077318 res!717872) b!1077316))

(assert (= (and b!1077316 res!717867) b!1077317))

(assert (= (and b!1077317 res!717868) b!1077314))

(assert (= (and b!1077314 res!717870) b!1077313))

(assert (= (and b!1077313 res!717871) b!1077311))

(assert (= (and b!1077319 condMapEmpty!40912) mapIsEmpty!40912))

(assert (= (and b!1077319 (not condMapEmpty!40912)) mapNonEmpty!40912))

(get-info :version)

(assert (= (and mapNonEmpty!40912 ((_ is ValueCellFull!12347) mapValue!40912)) b!1077312))

(assert (= (and b!1077319 ((_ is ValueCellFull!12347) mapDefault!40912)) b!1077315))

(assert (= start!95394 b!1077319))

(declare-fun m!995685 () Bool)

(assert (=> start!95394 m!995685))

(declare-fun m!995687 () Bool)

(assert (=> start!95394 m!995687))

(declare-fun m!995689 () Bool)

(assert (=> start!95394 m!995689))

(declare-fun m!995691 () Bool)

(assert (=> b!1077311 m!995691))

(declare-fun m!995693 () Bool)

(assert (=> mapNonEmpty!40912 m!995693))

(declare-fun m!995695 () Bool)

(assert (=> b!1077317 m!995695))

(declare-fun m!995697 () Bool)

(assert (=> b!1077313 m!995697))

(declare-fun m!995699 () Bool)

(assert (=> b!1077316 m!995699))

(check-sat (not start!95394) tp_is_empty!26113 (not mapNonEmpty!40912) (not b!1077313) (not b!1077317) (not b!1077316))
(check-sat)
