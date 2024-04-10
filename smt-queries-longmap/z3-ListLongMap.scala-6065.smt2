; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78500 () Bool)

(assert start!78500)

(declare-fun res!617084 () Bool)

(declare-fun e!513567 () Bool)

(assert (=> start!78500 (=> (not res!617084) (not e!513567))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78500 (= res!617084 (validMask!0 mask!1881))))

(assert (=> start!78500 e!513567))

(assert (=> start!78500 true))

(declare-datatypes ((V!30593 0))(
  ( (V!30594 (val!9661 Int)) )
))
(declare-datatypes ((ValueCell!9129 0))(
  ( (ValueCellFull!9129 (v!12179 V!30593)) (EmptyCell!9129) )
))
(declare-datatypes ((array!54442 0))(
  ( (array!54443 (arr!26166 (Array (_ BitVec 32) ValueCell!9129)) (size!26625 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54442)

(declare-fun e!513570 () Bool)

(declare-fun array_inv!20430 (array!54442) Bool)

(assert (=> start!78500 (and (array_inv!20430 _values!1231) e!513570)))

(declare-datatypes ((array!54444 0))(
  ( (array!54445 (arr!26167 (Array (_ BitVec 32) (_ BitVec 64))) (size!26626 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54444)

(declare-fun array_inv!20431 (array!54444) Bool)

(assert (=> start!78500 (array_inv!20431 _keys!1487)))

(declare-fun b!915192 () Bool)

(declare-fun e!513571 () Bool)

(declare-fun tp_is_empty!19221 () Bool)

(assert (=> b!915192 (= e!513571 tp_is_empty!19221)))

(declare-fun b!915193 () Bool)

(declare-fun mapRes!30588 () Bool)

(assert (=> b!915193 (= e!513570 (and e!513571 mapRes!30588))))

(declare-fun condMapEmpty!30588 () Bool)

(declare-fun mapDefault!30588 () ValueCell!9129)

(assert (=> b!915193 (= condMapEmpty!30588 (= (arr!26166 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9129)) mapDefault!30588)))))

(declare-fun b!915194 () Bool)

(declare-fun e!513569 () Bool)

(assert (=> b!915194 (= e!513569 tp_is_empty!19221)))

(declare-fun b!915195 () Bool)

(declare-fun res!617086 () Bool)

(assert (=> b!915195 (=> (not res!617086) (not e!513567))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54444 (_ BitVec 32)) Bool)

(assert (=> b!915195 (= res!617086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!30588 () Bool)

(assert (=> mapIsEmpty!30588 mapRes!30588))

(declare-fun b!915196 () Bool)

(declare-fun res!617085 () Bool)

(assert (=> b!915196 (=> (not res!617085) (not e!513567))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!915196 (= res!617085 (and (= (size!26625 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26626 _keys!1487) (size!26625 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!30588 () Bool)

(declare-fun tp!58655 () Bool)

(assert (=> mapNonEmpty!30588 (= mapRes!30588 (and tp!58655 e!513569))))

(declare-fun mapKey!30588 () (_ BitVec 32))

(declare-fun mapValue!30588 () ValueCell!9129)

(declare-fun mapRest!30588 () (Array (_ BitVec 32) ValueCell!9129))

(assert (=> mapNonEmpty!30588 (= (arr!26166 _values!1231) (store mapRest!30588 mapKey!30588 mapValue!30588))))

(declare-fun b!915197 () Bool)

(assert (=> b!915197 (= e!513567 false)))

(declare-fun lt!411631 () Bool)

(declare-datatypes ((List!18363 0))(
  ( (Nil!18360) (Cons!18359 (h!19505 (_ BitVec 64)) (t!25976 List!18363)) )
))
(declare-fun arrayNoDuplicates!0 (array!54444 (_ BitVec 32) List!18363) Bool)

(assert (=> b!915197 (= lt!411631 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18360))))

(assert (= (and start!78500 res!617084) b!915196))

(assert (= (and b!915196 res!617085) b!915195))

(assert (= (and b!915195 res!617086) b!915197))

(assert (= (and b!915193 condMapEmpty!30588) mapIsEmpty!30588))

(assert (= (and b!915193 (not condMapEmpty!30588)) mapNonEmpty!30588))

(get-info :version)

(assert (= (and mapNonEmpty!30588 ((_ is ValueCellFull!9129) mapValue!30588)) b!915194))

(assert (= (and b!915193 ((_ is ValueCellFull!9129) mapDefault!30588)) b!915192))

(assert (= start!78500 b!915193))

(declare-fun m!849651 () Bool)

(assert (=> start!78500 m!849651))

(declare-fun m!849653 () Bool)

(assert (=> start!78500 m!849653))

(declare-fun m!849655 () Bool)

(assert (=> start!78500 m!849655))

(declare-fun m!849657 () Bool)

(assert (=> b!915195 m!849657))

(declare-fun m!849659 () Bool)

(assert (=> mapNonEmpty!30588 m!849659))

(declare-fun m!849661 () Bool)

(assert (=> b!915197 m!849661))

(check-sat (not b!915197) (not mapNonEmpty!30588) tp_is_empty!19221 (not b!915195) (not start!78500))
(check-sat)
