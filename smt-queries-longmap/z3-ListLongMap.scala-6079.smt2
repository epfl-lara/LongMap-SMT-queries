; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78584 () Bool)

(assert start!78584)

(declare-fun b_free!16797 () Bool)

(declare-fun b_next!16797 () Bool)

(assert (=> start!78584 (= b_free!16797 (not b_next!16797))))

(declare-fun tp!58832 () Bool)

(declare-fun b_and!27419 () Bool)

(assert (=> start!78584 (= tp!58832 b_and!27419)))

(declare-fun b!916057 () Bool)

(declare-fun res!617571 () Bool)

(declare-fun e!514201 () Bool)

(assert (=> b!916057 (=> (not res!617571) (not e!514201))))

(declare-datatypes ((array!54602 0))(
  ( (array!54603 (arr!26246 (Array (_ BitVec 32) (_ BitVec 64))) (size!26705 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54602)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54602 (_ BitVec 32)) Bool)

(assert (=> b!916057 (= res!617571 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!617572 () Bool)

(assert (=> start!78584 (=> (not res!617572) (not e!514201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78584 (= res!617572 (validMask!0 mask!1881))))

(assert (=> start!78584 e!514201))

(assert (=> start!78584 true))

(declare-datatypes ((V!30705 0))(
  ( (V!30706 (val!9703 Int)) )
))
(declare-datatypes ((ValueCell!9171 0))(
  ( (ValueCellFull!9171 (v!12221 V!30705)) (EmptyCell!9171) )
))
(declare-datatypes ((array!54604 0))(
  ( (array!54605 (arr!26247 (Array (_ BitVec 32) ValueCell!9171)) (size!26706 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54604)

(declare-fun e!514200 () Bool)

(declare-fun array_inv!20474 (array!54604) Bool)

(assert (=> start!78584 (and (array_inv!20474 _values!1231) e!514200)))

(assert (=> start!78584 tp!58832))

(declare-fun array_inv!20475 (array!54602) Bool)

(assert (=> start!78584 (array_inv!20475 _keys!1487)))

(declare-fun tp_is_empty!19305 () Bool)

(assert (=> start!78584 tp_is_empty!19305))

(declare-fun mapNonEmpty!30714 () Bool)

(declare-fun mapRes!30714 () Bool)

(declare-fun tp!58831 () Bool)

(declare-fun e!514198 () Bool)

(assert (=> mapNonEmpty!30714 (= mapRes!30714 (and tp!58831 e!514198))))

(declare-fun mapRest!30714 () (Array (_ BitVec 32) ValueCell!9171))

(declare-fun mapKey!30714 () (_ BitVec 32))

(declare-fun mapValue!30714 () ValueCell!9171)

(assert (=> mapNonEmpty!30714 (= (arr!26247 _values!1231) (store mapRest!30714 mapKey!30714 mapValue!30714))))

(declare-fun b!916058 () Bool)

(assert (=> b!916058 (= e!514198 tp_is_empty!19305)))

(declare-fun b!916059 () Bool)

(assert (=> b!916059 (= e!514201 false)))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!411748 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun zeroValue!1173 () V!30705)

(declare-fun minValue!1173 () V!30705)

(declare-datatypes ((tuple2!12588 0))(
  ( (tuple2!12589 (_1!6305 (_ BitVec 64)) (_2!6305 V!30705)) )
))
(declare-datatypes ((List!18401 0))(
  ( (Nil!18398) (Cons!18397 (h!19543 tuple2!12588) (t!26014 List!18401)) )
))
(declare-datatypes ((ListLongMap!11285 0))(
  ( (ListLongMap!11286 (toList!5658 List!18401)) )
))
(declare-fun contains!4712 (ListLongMap!11285 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2919 (array!54602 array!54604 (_ BitVec 32) (_ BitVec 32) V!30705 V!30705 (_ BitVec 32) Int) ListLongMap!11285)

(assert (=> b!916059 (= lt!411748 (contains!4712 (getCurrentListMap!2919 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) k0!1099))))

(declare-fun mapIsEmpty!30714 () Bool)

(assert (=> mapIsEmpty!30714 mapRes!30714))

(declare-fun b!916060 () Bool)

(declare-fun e!514199 () Bool)

(assert (=> b!916060 (= e!514199 tp_is_empty!19305)))

(declare-fun b!916061 () Bool)

(declare-fun res!617574 () Bool)

(assert (=> b!916061 (=> (not res!617574) (not e!514201))))

(assert (=> b!916061 (= res!617574 (and (= (size!26706 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26705 _keys!1487) (size!26706 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!916062 () Bool)

(declare-fun res!617573 () Bool)

(assert (=> b!916062 (=> (not res!617573) (not e!514201))))

(assert (=> b!916062 (= res!617573 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26705 _keys!1487))))))

(declare-fun b!916063 () Bool)

(declare-fun res!617575 () Bool)

(assert (=> b!916063 (=> (not res!617575) (not e!514201))))

(declare-datatypes ((List!18402 0))(
  ( (Nil!18399) (Cons!18398 (h!19544 (_ BitVec 64)) (t!26015 List!18402)) )
))
(declare-fun arrayNoDuplicates!0 (array!54602 (_ BitVec 32) List!18402) Bool)

(assert (=> b!916063 (= res!617575 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18399))))

(declare-fun b!916064 () Bool)

(assert (=> b!916064 (= e!514200 (and e!514199 mapRes!30714))))

(declare-fun condMapEmpty!30714 () Bool)

(declare-fun mapDefault!30714 () ValueCell!9171)

(assert (=> b!916064 (= condMapEmpty!30714 (= (arr!26247 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9171)) mapDefault!30714)))))

(assert (= (and start!78584 res!617572) b!916061))

(assert (= (and b!916061 res!617574) b!916057))

(assert (= (and b!916057 res!617571) b!916063))

(assert (= (and b!916063 res!617575) b!916062))

(assert (= (and b!916062 res!617573) b!916059))

(assert (= (and b!916064 condMapEmpty!30714) mapIsEmpty!30714))

(assert (= (and b!916064 (not condMapEmpty!30714)) mapNonEmpty!30714))

(get-info :version)

(assert (= (and mapNonEmpty!30714 ((_ is ValueCellFull!9171) mapValue!30714)) b!916058))

(assert (= (and b!916064 ((_ is ValueCellFull!9171) mapDefault!30714)) b!916060))

(assert (= start!78584 b!916064))

(declare-fun m!850219 () Bool)

(assert (=> start!78584 m!850219))

(declare-fun m!850221 () Bool)

(assert (=> start!78584 m!850221))

(declare-fun m!850223 () Bool)

(assert (=> start!78584 m!850223))

(declare-fun m!850225 () Bool)

(assert (=> b!916057 m!850225))

(declare-fun m!850227 () Bool)

(assert (=> b!916063 m!850227))

(declare-fun m!850229 () Bool)

(assert (=> mapNonEmpty!30714 m!850229))

(declare-fun m!850231 () Bool)

(assert (=> b!916059 m!850231))

(assert (=> b!916059 m!850231))

(declare-fun m!850233 () Bool)

(assert (=> b!916059 m!850233))

(check-sat (not start!78584) (not b_next!16797) b_and!27419 (not b!916059) tp_is_empty!19305 (not b!916063) (not mapNonEmpty!30714) (not b!916057))
(check-sat b_and!27419 (not b_next!16797))
