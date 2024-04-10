; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78634 () Bool)

(assert start!78634)

(declare-fun b_free!16847 () Bool)

(declare-fun b_next!16847 () Bool)

(assert (=> start!78634 (= b_free!16847 (not b_next!16847))))

(declare-fun tp!58982 () Bool)

(declare-fun b_and!27469 () Bool)

(assert (=> start!78634 (= tp!58982 b_and!27469)))

(declare-fun mapIsEmpty!30789 () Bool)

(declare-fun mapRes!30789 () Bool)

(assert (=> mapIsEmpty!30789 mapRes!30789))

(declare-fun b!916701 () Bool)

(declare-fun res!617992 () Bool)

(declare-fun e!514611 () Bool)

(assert (=> b!916701 (=> (not res!617992) (not e!514611))))

(declare-datatypes ((array!54696 0))(
  ( (array!54697 (arr!26293 (Array (_ BitVec 32) (_ BitVec 64))) (size!26752 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54696)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54696 (_ BitVec 32)) Bool)

(assert (=> b!916701 (= res!617992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!617994 () Bool)

(assert (=> start!78634 (=> (not res!617994) (not e!514611))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78634 (= res!617994 (validMask!0 mask!1881))))

(assert (=> start!78634 e!514611))

(assert (=> start!78634 true))

(declare-datatypes ((V!30771 0))(
  ( (V!30772 (val!9728 Int)) )
))
(declare-datatypes ((ValueCell!9196 0))(
  ( (ValueCellFull!9196 (v!12246 V!30771)) (EmptyCell!9196) )
))
(declare-datatypes ((array!54698 0))(
  ( (array!54699 (arr!26294 (Array (_ BitVec 32) ValueCell!9196)) (size!26753 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54698)

(declare-fun e!514608 () Bool)

(declare-fun array_inv!20506 (array!54698) Bool)

(assert (=> start!78634 (and (array_inv!20506 _values!1231) e!514608)))

(assert (=> start!78634 tp!58982))

(declare-fun array_inv!20507 (array!54696) Bool)

(assert (=> start!78634 (array_inv!20507 _keys!1487)))

(declare-fun tp_is_empty!19355 () Bool)

(assert (=> start!78634 tp_is_empty!19355))

(declare-fun b!916702 () Bool)

(declare-fun res!617993 () Bool)

(assert (=> b!916702 (=> (not res!617993) (not e!514611))))

(declare-datatypes ((List!18435 0))(
  ( (Nil!18432) (Cons!18431 (h!19577 (_ BitVec 64)) (t!26048 List!18435)) )
))
(declare-fun arrayNoDuplicates!0 (array!54696 (_ BitVec 32) List!18435) Bool)

(assert (=> b!916702 (= res!617993 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18432))))

(declare-fun b!916703 () Bool)

(declare-fun res!617995 () Bool)

(assert (=> b!916703 (=> (not res!617995) (not e!514611))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!916703 (= res!617995 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26752 _keys!1487))))))

(declare-fun mapNonEmpty!30789 () Bool)

(declare-fun tp!58981 () Bool)

(declare-fun e!514607 () Bool)

(assert (=> mapNonEmpty!30789 (= mapRes!30789 (and tp!58981 e!514607))))

(declare-fun mapValue!30789 () ValueCell!9196)

(declare-fun mapKey!30789 () (_ BitVec 32))

(declare-fun mapRest!30789 () (Array (_ BitVec 32) ValueCell!9196))

(assert (=> mapNonEmpty!30789 (= (arr!26294 _values!1231) (store mapRest!30789 mapKey!30789 mapValue!30789))))

(declare-fun b!916704 () Bool)

(declare-fun e!514609 () Bool)

(assert (=> b!916704 (= e!514609 tp_is_empty!19355)))

(declare-fun b!916705 () Bool)

(assert (=> b!916705 (= e!514608 (and e!514609 mapRes!30789))))

(declare-fun condMapEmpty!30789 () Bool)

(declare-fun mapDefault!30789 () ValueCell!9196)

