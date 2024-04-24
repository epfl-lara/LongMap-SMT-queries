; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78684 () Bool)

(assert start!78684)

(declare-fun b!916239 () Bool)

(declare-fun e!514271 () Bool)

(declare-fun tp_is_empty!19237 () Bool)

(assert (=> b!916239 (= e!514271 tp_is_empty!19237)))

(declare-fun b!916240 () Bool)

(declare-fun e!514273 () Bool)

(declare-fun e!514269 () Bool)

(declare-fun mapRes!30612 () Bool)

(assert (=> b!916240 (= e!514273 (and e!514269 mapRes!30612))))

(declare-fun condMapEmpty!30612 () Bool)

(declare-datatypes ((V!30615 0))(
  ( (V!30616 (val!9669 Int)) )
))
(declare-datatypes ((ValueCell!9137 0))(
  ( (ValueCellFull!9137 (v!12184 V!30615)) (EmptyCell!9137) )
))
(declare-datatypes ((array!54529 0))(
  ( (array!54530 (arr!26205 (Array (_ BitVec 32) ValueCell!9137)) (size!26665 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54529)

(declare-fun mapDefault!30612 () ValueCell!9137)

(assert (=> b!916240 (= condMapEmpty!30612 (= (arr!26205 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9137)) mapDefault!30612)))))

(declare-fun b!916241 () Bool)

(declare-fun res!617501 () Bool)

(declare-fun e!514272 () Bool)

(assert (=> b!916241 (=> (not res!617501) (not e!514272))))

(declare-datatypes ((array!54531 0))(
  ( (array!54532 (arr!26206 (Array (_ BitVec 32) (_ BitVec 64))) (size!26666 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54531)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!916241 (= res!617501 (and (= (size!26665 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26666 _keys!1487) (size!26665 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!30612 () Bool)

(declare-fun tp!58680 () Bool)

(assert (=> mapNonEmpty!30612 (= mapRes!30612 (and tp!58680 e!514271))))

(declare-fun mapKey!30612 () (_ BitVec 32))

(declare-fun mapRest!30612 () (Array (_ BitVec 32) ValueCell!9137))

(declare-fun mapValue!30612 () ValueCell!9137)

(assert (=> mapNonEmpty!30612 (= (arr!26205 _values!1231) (store mapRest!30612 mapKey!30612 mapValue!30612))))

(declare-fun b!916242 () Bool)

(assert (=> b!916242 (= e!514269 tp_is_empty!19237)))

(declare-fun mapIsEmpty!30612 () Bool)

(assert (=> mapIsEmpty!30612 mapRes!30612))

(declare-fun res!617500 () Bool)

(assert (=> start!78684 (=> (not res!617500) (not e!514272))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78684 (= res!617500 (validMask!0 mask!1881))))

(assert (=> start!78684 e!514272))

(assert (=> start!78684 true))

(declare-fun array_inv!20556 (array!54529) Bool)

(assert (=> start!78684 (and (array_inv!20556 _values!1231) e!514273)))

(declare-fun array_inv!20557 (array!54531) Bool)

(assert (=> start!78684 (array_inv!20557 _keys!1487)))

(declare-fun b!916243 () Bool)

(declare-fun res!617502 () Bool)

(assert (=> b!916243 (=> (not res!617502) (not e!514272))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54531 (_ BitVec 32)) Bool)

(assert (=> b!916243 (= res!617502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!916244 () Bool)

(assert (=> b!916244 (= e!514272 false)))

(declare-fun lt!412016 () Bool)

(declare-datatypes ((List!18356 0))(
  ( (Nil!18353) (Cons!18352 (h!19504 (_ BitVec 64)) (t!25961 List!18356)) )
))
(declare-fun arrayNoDuplicates!0 (array!54531 (_ BitVec 32) List!18356) Bool)

(assert (=> b!916244 (= lt!412016 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18353))))

(assert (= (and start!78684 res!617500) b!916241))

(assert (= (and b!916241 res!617501) b!916243))

(assert (= (and b!916243 res!617502) b!916244))

(assert (= (and b!916240 condMapEmpty!30612) mapIsEmpty!30612))

(assert (= (and b!916240 (not condMapEmpty!30612)) mapNonEmpty!30612))

(get-info :version)

(assert (= (and mapNonEmpty!30612 ((_ is ValueCellFull!9137) mapValue!30612)) b!916239))

(assert (= (and b!916240 ((_ is ValueCellFull!9137) mapDefault!30612)) b!916242))

(assert (= start!78684 b!916240))

(declare-fun m!851041 () Bool)

(assert (=> mapNonEmpty!30612 m!851041))

(declare-fun m!851043 () Bool)

(assert (=> start!78684 m!851043))

(declare-fun m!851045 () Bool)

(assert (=> start!78684 m!851045))

(declare-fun m!851047 () Bool)

(assert (=> start!78684 m!851047))

(declare-fun m!851049 () Bool)

(assert (=> b!916243 m!851049))

(declare-fun m!851051 () Bool)

(assert (=> b!916244 m!851051))

(check-sat (not mapNonEmpty!30612) tp_is_empty!19237 (not b!916244) (not start!78684) (not b!916243))
(check-sat)
