; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78702 () Bool)

(assert start!78702)

(declare-fun b!916401 () Bool)

(declare-fun e!514407 () Bool)

(declare-fun tp_is_empty!19255 () Bool)

(assert (=> b!916401 (= e!514407 tp_is_empty!19255)))

(declare-fun res!617583 () Bool)

(declare-fun e!514408 () Bool)

(assert (=> start!78702 (=> (not res!617583) (not e!514408))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78702 (= res!617583 (validMask!0 mask!1881))))

(assert (=> start!78702 e!514408))

(assert (=> start!78702 true))

(declare-datatypes ((V!30639 0))(
  ( (V!30640 (val!9678 Int)) )
))
(declare-datatypes ((ValueCell!9146 0))(
  ( (ValueCellFull!9146 (v!12193 V!30639)) (EmptyCell!9146) )
))
(declare-datatypes ((array!54557 0))(
  ( (array!54558 (arr!26219 (Array (_ BitVec 32) ValueCell!9146)) (size!26679 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54557)

(declare-fun e!514404 () Bool)

(declare-fun array_inv!20564 (array!54557) Bool)

(assert (=> start!78702 (and (array_inv!20564 _values!1231) e!514404)))

(declare-datatypes ((array!54559 0))(
  ( (array!54560 (arr!26220 (Array (_ BitVec 32) (_ BitVec 64))) (size!26680 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54559)

(declare-fun array_inv!20565 (array!54559) Bool)

(assert (=> start!78702 (array_inv!20565 _keys!1487)))

(declare-fun b!916402 () Bool)

(declare-fun mapRes!30639 () Bool)

(assert (=> b!916402 (= e!514404 (and e!514407 mapRes!30639))))

(declare-fun condMapEmpty!30639 () Bool)

(declare-fun mapDefault!30639 () ValueCell!9146)

(assert (=> b!916402 (= condMapEmpty!30639 (= (arr!26219 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9146)) mapDefault!30639)))))

(declare-fun b!916403 () Bool)

(declare-fun res!617581 () Bool)

(assert (=> b!916403 (=> (not res!617581) (not e!514408))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!916403 (= res!617581 (and (= (size!26679 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26680 _keys!1487) (size!26679 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!30639 () Bool)

(declare-fun tp!58707 () Bool)

(declare-fun e!514406 () Bool)

(assert (=> mapNonEmpty!30639 (= mapRes!30639 (and tp!58707 e!514406))))

(declare-fun mapRest!30639 () (Array (_ BitVec 32) ValueCell!9146))

(declare-fun mapValue!30639 () ValueCell!9146)

(declare-fun mapKey!30639 () (_ BitVec 32))

(assert (=> mapNonEmpty!30639 (= (arr!26219 _values!1231) (store mapRest!30639 mapKey!30639 mapValue!30639))))

(declare-fun b!916404 () Bool)

(declare-fun res!617582 () Bool)

(assert (=> b!916404 (=> (not res!617582) (not e!514408))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54559 (_ BitVec 32)) Bool)

(assert (=> b!916404 (= res!617582 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!30639 () Bool)

(assert (=> mapIsEmpty!30639 mapRes!30639))

(declare-fun b!916405 () Bool)

(assert (=> b!916405 (= e!514408 false)))

(declare-fun lt!412043 () Bool)

(declare-datatypes ((List!18360 0))(
  ( (Nil!18357) (Cons!18356 (h!19508 (_ BitVec 64)) (t!25965 List!18360)) )
))
(declare-fun arrayNoDuplicates!0 (array!54559 (_ BitVec 32) List!18360) Bool)

(assert (=> b!916405 (= lt!412043 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18357))))

(declare-fun b!916406 () Bool)

(assert (=> b!916406 (= e!514406 tp_is_empty!19255)))

(assert (= (and start!78702 res!617583) b!916403))

(assert (= (and b!916403 res!617581) b!916404))

(assert (= (and b!916404 res!617582) b!916405))

(assert (= (and b!916402 condMapEmpty!30639) mapIsEmpty!30639))

(assert (= (and b!916402 (not condMapEmpty!30639)) mapNonEmpty!30639))

(get-info :version)

(assert (= (and mapNonEmpty!30639 ((_ is ValueCellFull!9146) mapValue!30639)) b!916406))

(assert (= (and b!916402 ((_ is ValueCellFull!9146) mapDefault!30639)) b!916401))

(assert (= start!78702 b!916402))

(declare-fun m!851149 () Bool)

(assert (=> start!78702 m!851149))

(declare-fun m!851151 () Bool)

(assert (=> start!78702 m!851151))

(declare-fun m!851153 () Bool)

(assert (=> start!78702 m!851153))

(declare-fun m!851155 () Bool)

(assert (=> mapNonEmpty!30639 m!851155))

(declare-fun m!851157 () Bool)

(assert (=> b!916404 m!851157))

(declare-fun m!851159 () Bool)

(assert (=> b!916405 m!851159))

(check-sat (not mapNonEmpty!30639) (not b!916404) (not start!78702) (not b!916405) tp_is_empty!19255)
(check-sat)
