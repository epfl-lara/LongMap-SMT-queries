; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78272 () Bool)

(assert start!78272)

(declare-fun b_free!16615 () Bool)

(declare-fun b_next!16615 () Bool)

(assert (=> start!78272 (= b_free!16615 (not b_next!16615))))

(declare-fun tp!58120 () Bool)

(declare-fun b_and!27199 () Bool)

(assert (=> start!78272 (= tp!58120 b_and!27199)))

(declare-fun b!912502 () Bool)

(declare-fun e!511851 () Bool)

(declare-fun tp_is_empty!19033 () Bool)

(assert (=> b!912502 (= e!511851 tp_is_empty!19033)))

(declare-fun mapNonEmpty!30274 () Bool)

(declare-fun mapRes!30274 () Bool)

(declare-fun tp!58119 () Bool)

(declare-fun e!511853 () Bool)

(assert (=> mapNonEmpty!30274 (= mapRes!30274 (and tp!58119 e!511853))))

(declare-datatypes ((V!30343 0))(
  ( (V!30344 (val!9567 Int)) )
))
(declare-datatypes ((ValueCell!9035 0))(
  ( (ValueCellFull!9035 (v!12074 V!30343)) (EmptyCell!9035) )
))
(declare-datatypes ((array!54131 0))(
  ( (array!54132 (arr!26016 (Array (_ BitVec 32) ValueCell!9035)) (size!26476 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54131)

(declare-fun mapValue!30274 () ValueCell!9035)

(declare-fun mapKey!30274 () (_ BitVec 32))

(declare-fun mapRest!30274 () (Array (_ BitVec 32) ValueCell!9035))

(assert (=> mapNonEmpty!30274 (= (arr!26016 _values!1152) (store mapRest!30274 mapKey!30274 mapValue!30274))))

(declare-fun res!615361 () Bool)

(declare-fun e!511850 () Bool)

(assert (=> start!78272 (=> (not res!615361) (not e!511850))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78272 (= res!615361 (validMask!0 mask!1756))))

(assert (=> start!78272 e!511850))

(declare-fun e!511854 () Bool)

(declare-fun array_inv!20414 (array!54131) Bool)

(assert (=> start!78272 (and (array_inv!20414 _values!1152) e!511854)))

(assert (=> start!78272 tp!58120))

(assert (=> start!78272 true))

(assert (=> start!78272 tp_is_empty!19033))

(declare-datatypes ((array!54133 0))(
  ( (array!54134 (arr!26017 (Array (_ BitVec 32) (_ BitVec 64))) (size!26477 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54133)

(declare-fun array_inv!20415 (array!54133) Bool)

(assert (=> start!78272 (array_inv!20415 _keys!1386)))

(declare-fun b!912503 () Bool)

(assert (=> b!912503 (= e!511853 tp_is_empty!19033)))

(declare-fun b!912504 () Bool)

(declare-fun res!615360 () Bool)

(assert (=> b!912504 (=> (not res!615360) (not e!511850))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!912504 (= res!615360 (and (= (size!26476 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26477 _keys!1386) (size!26476 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!30274 () Bool)

(assert (=> mapIsEmpty!30274 mapRes!30274))

(declare-fun b!912505 () Bool)

(declare-fun res!615362 () Bool)

(assert (=> b!912505 (=> (not res!615362) (not e!511850))))

(declare-datatypes ((List!18248 0))(
  ( (Nil!18245) (Cons!18244 (h!19396 (_ BitVec 64)) (t!25827 List!18248)) )
))
(declare-fun arrayNoDuplicates!0 (array!54133 (_ BitVec 32) List!18248) Bool)

(assert (=> b!912505 (= res!615362 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18245))))

(declare-fun b!912506 () Bool)

(declare-fun res!615359 () Bool)

(assert (=> b!912506 (=> (not res!615359) (not e!511850))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54133 (_ BitVec 32)) Bool)

(assert (=> b!912506 (= res!615359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!912507 () Bool)

(assert (=> b!912507 (= e!511850 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30343)

(declare-fun lt!410844 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30343)

(declare-datatypes ((tuple2!12428 0))(
  ( (tuple2!12429 (_1!6225 (_ BitVec 64)) (_2!6225 V!30343)) )
))
(declare-datatypes ((List!18249 0))(
  ( (Nil!18246) (Cons!18245 (h!19397 tuple2!12428) (t!25828 List!18249)) )
))
(declare-datatypes ((ListLongMap!11127 0))(
  ( (ListLongMap!11128 (toList!5579 List!18249)) )
))
(declare-fun contains!4633 (ListLongMap!11127 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2840 (array!54133 array!54131 (_ BitVec 32) (_ BitVec 32) V!30343 V!30343 (_ BitVec 32) Int) ListLongMap!11127)

(assert (=> b!912507 (= lt!410844 (contains!4633 (getCurrentListMap!2840 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!912508 () Bool)

(assert (=> b!912508 (= e!511854 (and e!511851 mapRes!30274))))

(declare-fun condMapEmpty!30274 () Bool)

(declare-fun mapDefault!30274 () ValueCell!9035)

(assert (=> b!912508 (= condMapEmpty!30274 (= (arr!26016 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9035)) mapDefault!30274)))))

(assert (= (and start!78272 res!615361) b!912504))

(assert (= (and b!912504 res!615360) b!912506))

(assert (= (and b!912506 res!615359) b!912505))

(assert (= (and b!912505 res!615362) b!912507))

(assert (= (and b!912508 condMapEmpty!30274) mapIsEmpty!30274))

(assert (= (and b!912508 (not condMapEmpty!30274)) mapNonEmpty!30274))

(get-info :version)

(assert (= (and mapNonEmpty!30274 ((_ is ValueCellFull!9035) mapValue!30274)) b!912503))

(assert (= (and b!912508 ((_ is ValueCellFull!9035) mapDefault!30274)) b!912502))

(assert (= start!78272 b!912508))

(declare-fun m!847605 () Bool)

(assert (=> start!78272 m!847605))

(declare-fun m!847607 () Bool)

(assert (=> start!78272 m!847607))

(declare-fun m!847609 () Bool)

(assert (=> start!78272 m!847609))

(declare-fun m!847611 () Bool)

(assert (=> b!912505 m!847611))

(declare-fun m!847613 () Bool)

(assert (=> b!912507 m!847613))

(assert (=> b!912507 m!847613))

(declare-fun m!847615 () Bool)

(assert (=> b!912507 m!847615))

(declare-fun m!847617 () Bool)

(assert (=> mapNonEmpty!30274 m!847617))

(declare-fun m!847619 () Bool)

(assert (=> b!912506 m!847619))

(check-sat (not b!912505) tp_is_empty!19033 b_and!27199 (not b_next!16615) (not b!912506) (not b!912507) (not mapNonEmpty!30274) (not start!78272))
(check-sat b_and!27199 (not b_next!16615))
