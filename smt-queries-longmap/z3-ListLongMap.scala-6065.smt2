; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78666 () Bool)

(assert start!78666)

(declare-fun mapIsEmpty!30585 () Bool)

(declare-fun mapRes!30585 () Bool)

(assert (=> mapIsEmpty!30585 mapRes!30585))

(declare-fun mapNonEmpty!30585 () Bool)

(declare-fun tp!58653 () Bool)

(declare-fun e!514137 () Bool)

(assert (=> mapNonEmpty!30585 (= mapRes!30585 (and tp!58653 e!514137))))

(declare-datatypes ((V!30591 0))(
  ( (V!30592 (val!9660 Int)) )
))
(declare-datatypes ((ValueCell!9128 0))(
  ( (ValueCellFull!9128 (v!12175 V!30591)) (EmptyCell!9128) )
))
(declare-fun mapValue!30585 () ValueCell!9128)

(declare-fun mapRest!30585 () (Array (_ BitVec 32) ValueCell!9128))

(declare-fun mapKey!30585 () (_ BitVec 32))

(declare-datatypes ((array!54497 0))(
  ( (array!54498 (arr!26189 (Array (_ BitVec 32) ValueCell!9128)) (size!26649 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54497)

(assert (=> mapNonEmpty!30585 (= (arr!26189 _values!1231) (store mapRest!30585 mapKey!30585 mapValue!30585))))

(declare-fun b!916077 () Bool)

(declare-fun e!514136 () Bool)

(declare-fun tp_is_empty!19219 () Bool)

(assert (=> b!916077 (= e!514136 tp_is_empty!19219)))

(declare-fun res!617419 () Bool)

(declare-fun e!514134 () Bool)

(assert (=> start!78666 (=> (not res!617419) (not e!514134))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78666 (= res!617419 (validMask!0 mask!1881))))

(assert (=> start!78666 e!514134))

(assert (=> start!78666 true))

(declare-fun e!514138 () Bool)

(declare-fun array_inv!20542 (array!54497) Bool)

(assert (=> start!78666 (and (array_inv!20542 _values!1231) e!514138)))

(declare-datatypes ((array!54499 0))(
  ( (array!54500 (arr!26190 (Array (_ BitVec 32) (_ BitVec 64))) (size!26650 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54499)

(declare-fun array_inv!20543 (array!54499) Bool)

(assert (=> start!78666 (array_inv!20543 _keys!1487)))

(declare-fun b!916078 () Bool)

(declare-fun res!617420 () Bool)

(assert (=> b!916078 (=> (not res!617420) (not e!514134))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54499 (_ BitVec 32)) Bool)

(assert (=> b!916078 (= res!617420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!916079 () Bool)

(assert (=> b!916079 (= e!514134 false)))

(declare-fun lt!411989 () Bool)

(declare-datatypes ((List!18350 0))(
  ( (Nil!18347) (Cons!18346 (h!19498 (_ BitVec 64)) (t!25955 List!18350)) )
))
(declare-fun arrayNoDuplicates!0 (array!54499 (_ BitVec 32) List!18350) Bool)

(assert (=> b!916079 (= lt!411989 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18347))))

(declare-fun b!916080 () Bool)

(assert (=> b!916080 (= e!514138 (and e!514136 mapRes!30585))))

(declare-fun condMapEmpty!30585 () Bool)

(declare-fun mapDefault!30585 () ValueCell!9128)

(assert (=> b!916080 (= condMapEmpty!30585 (= (arr!26189 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9128)) mapDefault!30585)))))

(declare-fun b!916081 () Bool)

(assert (=> b!916081 (= e!514137 tp_is_empty!19219)))

(declare-fun b!916082 () Bool)

(declare-fun res!617421 () Bool)

(assert (=> b!916082 (=> (not res!617421) (not e!514134))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!916082 (= res!617421 (and (= (size!26649 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26650 _keys!1487) (size!26649 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!78666 res!617419) b!916082))

(assert (= (and b!916082 res!617421) b!916078))

(assert (= (and b!916078 res!617420) b!916079))

(assert (= (and b!916080 condMapEmpty!30585) mapIsEmpty!30585))

(assert (= (and b!916080 (not condMapEmpty!30585)) mapNonEmpty!30585))

(get-info :version)

(assert (= (and mapNonEmpty!30585 ((_ is ValueCellFull!9128) mapValue!30585)) b!916081))

(assert (= (and b!916080 ((_ is ValueCellFull!9128) mapDefault!30585)) b!916077))

(assert (= start!78666 b!916080))

(declare-fun m!850933 () Bool)

(assert (=> mapNonEmpty!30585 m!850933))

(declare-fun m!850935 () Bool)

(assert (=> start!78666 m!850935))

(declare-fun m!850937 () Bool)

(assert (=> start!78666 m!850937))

(declare-fun m!850939 () Bool)

(assert (=> start!78666 m!850939))

(declare-fun m!850941 () Bool)

(assert (=> b!916078 m!850941))

(declare-fun m!850943 () Bool)

(assert (=> b!916079 m!850943))

(check-sat (not mapNonEmpty!30585) (not start!78666) (not b!916079) (not b!916078) tp_is_empty!19219)
(check-sat)
