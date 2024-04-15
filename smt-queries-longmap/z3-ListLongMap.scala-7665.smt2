; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96304 () Bool)

(assert start!96304)

(declare-fun mapNonEmpty!42202 () Bool)

(declare-fun mapRes!42202 () Bool)

(declare-fun tp!80717 () Bool)

(declare-fun e!624779 () Bool)

(assert (=> mapNonEmpty!42202 (= mapRes!42202 (and tp!80717 e!624779))))

(declare-fun mapKey!42202 () (_ BitVec 32))

(declare-datatypes ((V!41081 0))(
  ( (V!41082 (val!13539 Int)) )
))
(declare-datatypes ((ValueCell!12773 0))(
  ( (ValueCellFull!12773 (v!16159 V!41081)) (EmptyCell!12773) )
))
(declare-datatypes ((array!70758 0))(
  ( (array!70759 (arr!34053 (Array (_ BitVec 32) ValueCell!12773)) (size!34591 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70758)

(declare-fun mapRest!42202 () (Array (_ BitVec 32) ValueCell!12773))

(declare-fun mapValue!42202 () ValueCell!12773)

(assert (=> mapNonEmpty!42202 (= (arr!34053 _values!874) (store mapRest!42202 mapKey!42202 mapValue!42202))))

(declare-fun b!1094340 () Bool)

(declare-fun e!624778 () Bool)

(assert (=> b!1094340 (= e!624778 false)))

(declare-fun lt!489458 () Bool)

(declare-datatypes ((array!70760 0))(
  ( (array!70761 (arr!34054 (Array (_ BitVec 32) (_ BitVec 64))) (size!34592 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70760)

(declare-datatypes ((List!23852 0))(
  ( (Nil!23849) (Cons!23848 (h!25057 (_ BitVec 64)) (t!33850 List!23852)) )
))
(declare-fun arrayNoDuplicates!0 (array!70760 (_ BitVec 32) List!23852) Bool)

(assert (=> b!1094340 (= lt!489458 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23849))))

(declare-fun mapIsEmpty!42202 () Bool)

(assert (=> mapIsEmpty!42202 mapRes!42202))

(declare-fun b!1094341 () Bool)

(declare-fun res!730326 () Bool)

(assert (=> b!1094341 (=> (not res!730326) (not e!624778))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1094341 (= res!730326 (and (= (size!34591 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34592 _keys!1070) (size!34591 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!730325 () Bool)

(assert (=> start!96304 (=> (not res!730325) (not e!624778))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96304 (= res!730325 (validMask!0 mask!1414))))

(assert (=> start!96304 e!624778))

(assert (=> start!96304 true))

(declare-fun e!624775 () Bool)

(declare-fun array_inv!26278 (array!70758) Bool)

(assert (=> start!96304 (and (array_inv!26278 _values!874) e!624775)))

(declare-fun array_inv!26279 (array!70760) Bool)

(assert (=> start!96304 (array_inv!26279 _keys!1070)))

(declare-fun b!1094342 () Bool)

(declare-fun tp_is_empty!26965 () Bool)

(assert (=> b!1094342 (= e!624779 tp_is_empty!26965)))

(declare-fun b!1094343 () Bool)

(declare-fun res!730324 () Bool)

(assert (=> b!1094343 (=> (not res!730324) (not e!624778))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70760 (_ BitVec 32)) Bool)

(assert (=> b!1094343 (= res!730324 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1094344 () Bool)

(declare-fun e!624776 () Bool)

(assert (=> b!1094344 (= e!624776 tp_is_empty!26965)))

(declare-fun b!1094345 () Bool)

(assert (=> b!1094345 (= e!624775 (and e!624776 mapRes!42202))))

(declare-fun condMapEmpty!42202 () Bool)

(declare-fun mapDefault!42202 () ValueCell!12773)

(assert (=> b!1094345 (= condMapEmpty!42202 (= (arr!34053 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12773)) mapDefault!42202)))))

(assert (= (and start!96304 res!730325) b!1094341))

(assert (= (and b!1094341 res!730326) b!1094343))

(assert (= (and b!1094343 res!730324) b!1094340))

(assert (= (and b!1094345 condMapEmpty!42202) mapIsEmpty!42202))

(assert (= (and b!1094345 (not condMapEmpty!42202)) mapNonEmpty!42202))

(get-info :version)

(assert (= (and mapNonEmpty!42202 ((_ is ValueCellFull!12773) mapValue!42202)) b!1094342))

(assert (= (and b!1094345 ((_ is ValueCellFull!12773) mapDefault!42202)) b!1094344))

(assert (= start!96304 b!1094345))

(declare-fun m!1013795 () Bool)

(assert (=> mapNonEmpty!42202 m!1013795))

(declare-fun m!1013797 () Bool)

(assert (=> b!1094340 m!1013797))

(declare-fun m!1013799 () Bool)

(assert (=> start!96304 m!1013799))

(declare-fun m!1013801 () Bool)

(assert (=> start!96304 m!1013801))

(declare-fun m!1013803 () Bool)

(assert (=> start!96304 m!1013803))

(declare-fun m!1013805 () Bool)

(assert (=> b!1094343 m!1013805))

(check-sat (not b!1094343) (not start!96304) tp_is_empty!26965 (not b!1094340) (not mapNonEmpty!42202))
(check-sat)
