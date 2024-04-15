; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78480 () Bool)

(assert start!78480)

(declare-fun res!616965 () Bool)

(declare-fun e!513407 () Bool)

(assert (=> start!78480 (=> (not res!616965) (not e!513407))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78480 (= res!616965 (validMask!0 mask!1881))))

(assert (=> start!78480 e!513407))

(assert (=> start!78480 true))

(declare-datatypes ((V!30591 0))(
  ( (V!30592 (val!9660 Int)) )
))
(declare-datatypes ((ValueCell!9128 0))(
  ( (ValueCellFull!9128 (v!12177 V!30591)) (EmptyCell!9128) )
))
(declare-datatypes ((array!54435 0))(
  ( (array!54436 (arr!26163 (Array (_ BitVec 32) ValueCell!9128)) (size!26624 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54435)

(declare-fun e!513408 () Bool)

(declare-fun array_inv!20508 (array!54435) Bool)

(assert (=> start!78480 (and (array_inv!20508 _values!1231) e!513408)))

(declare-datatypes ((array!54437 0))(
  ( (array!54438 (arr!26164 (Array (_ BitVec 32) (_ BitVec 64))) (size!26625 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54437)

(declare-fun array_inv!20509 (array!54437) Bool)

(assert (=> start!78480 (array_inv!20509 _keys!1487)))

(declare-fun b!914935 () Bool)

(declare-fun e!513405 () Bool)

(declare-fun tp_is_empty!19219 () Bool)

(assert (=> b!914935 (= e!513405 tp_is_empty!19219)))

(declare-fun mapIsEmpty!30585 () Bool)

(declare-fun mapRes!30585 () Bool)

(assert (=> mapIsEmpty!30585 mapRes!30585))

(declare-fun b!914936 () Bool)

(declare-fun e!513404 () Bool)

(assert (=> b!914936 (= e!513404 tp_is_empty!19219)))

(declare-fun b!914937 () Bool)

(declare-fun res!616966 () Bool)

(assert (=> b!914937 (=> (not res!616966) (not e!513407))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!914937 (= res!616966 (and (= (size!26624 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26625 _keys!1487) (size!26624 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!30585 () Bool)

(declare-fun tp!58653 () Bool)

(assert (=> mapNonEmpty!30585 (= mapRes!30585 (and tp!58653 e!513404))))

(declare-fun mapKey!30585 () (_ BitVec 32))

(declare-fun mapRest!30585 () (Array (_ BitVec 32) ValueCell!9128))

(declare-fun mapValue!30585 () ValueCell!9128)

(assert (=> mapNonEmpty!30585 (= (arr!26163 _values!1231) (store mapRest!30585 mapKey!30585 mapValue!30585))))

(declare-fun b!914938 () Bool)

(declare-fun res!616967 () Bool)

(assert (=> b!914938 (=> (not res!616967) (not e!513407))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54437 (_ BitVec 32)) Bool)

(assert (=> b!914938 (= res!616967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!914939 () Bool)

(assert (=> b!914939 (= e!513408 (and e!513405 mapRes!30585))))

(declare-fun condMapEmpty!30585 () Bool)

(declare-fun mapDefault!30585 () ValueCell!9128)

(assert (=> b!914939 (= condMapEmpty!30585 (= (arr!26163 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9128)) mapDefault!30585)))))

(declare-fun b!914940 () Bool)

(assert (=> b!914940 (= e!513407 false)))

(declare-fun lt!411392 () Bool)

(declare-datatypes ((List!18398 0))(
  ( (Nil!18395) (Cons!18394 (h!19540 (_ BitVec 64)) (t!26002 List!18398)) )
))
(declare-fun arrayNoDuplicates!0 (array!54437 (_ BitVec 32) List!18398) Bool)

(assert (=> b!914940 (= lt!411392 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18395))))

(assert (= (and start!78480 res!616965) b!914937))

(assert (= (and b!914937 res!616966) b!914938))

(assert (= (and b!914938 res!616967) b!914940))

(assert (= (and b!914939 condMapEmpty!30585) mapIsEmpty!30585))

(assert (= (and b!914939 (not condMapEmpty!30585)) mapNonEmpty!30585))

(get-info :version)

(assert (= (and mapNonEmpty!30585 ((_ is ValueCellFull!9128) mapValue!30585)) b!914936))

(assert (= (and b!914939 ((_ is ValueCellFull!9128) mapDefault!30585)) b!914935))

(assert (= start!78480 b!914939))

(declare-fun m!848881 () Bool)

(assert (=> start!78480 m!848881))

(declare-fun m!848883 () Bool)

(assert (=> start!78480 m!848883))

(declare-fun m!848885 () Bool)

(assert (=> start!78480 m!848885))

(declare-fun m!848887 () Bool)

(assert (=> mapNonEmpty!30585 m!848887))

(declare-fun m!848889 () Bool)

(assert (=> b!914938 m!848889))

(declare-fun m!848891 () Bool)

(assert (=> b!914940 m!848891))

(check-sat (not b!914940) (not start!78480) (not mapNonEmpty!30585) (not b!914938) tp_is_empty!19219)
(check-sat)
