; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78388 () Bool)

(assert start!78388)

(declare-fun b_free!16753 () Bool)

(declare-fun b_next!16753 () Bool)

(assert (=> start!78388 (= b_free!16753 (not b_next!16753))))

(declare-fun tp!58546 () Bool)

(declare-fun b_and!27373 () Bool)

(assert (=> start!78388 (= tp!58546 b_and!27373)))

(declare-fun mapIsEmpty!30495 () Bool)

(declare-fun mapRes!30495 () Bool)

(assert (=> mapIsEmpty!30495 mapRes!30495))

(declare-fun b!914437 () Bool)

(declare-fun e!512984 () Bool)

(declare-fun tp_is_empty!19171 () Bool)

(assert (=> b!914437 (= e!512984 tp_is_empty!19171)))

(declare-fun b!914438 () Bool)

(declare-fun res!616703 () Bool)

(declare-fun e!512982 () Bool)

(assert (=> b!914438 (=> (not res!616703) (not e!512982))))

(declare-datatypes ((V!30527 0))(
  ( (V!30528 (val!9636 Int)) )
))
(declare-datatypes ((ValueCell!9104 0))(
  ( (ValueCellFull!9104 (v!12152 V!30527)) (EmptyCell!9104) )
))
(declare-datatypes ((array!54334 0))(
  ( (array!54335 (arr!26118 (Array (_ BitVec 32) ValueCell!9104)) (size!26577 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54334)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!54336 0))(
  ( (array!54337 (arr!26119 (Array (_ BitVec 32) (_ BitVec 64))) (size!26578 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54336)

(assert (=> b!914438 (= res!616703 (and (= (size!26577 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26578 _keys!1386) (size!26577 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!30495 () Bool)

(declare-fun tp!58547 () Bool)

(declare-fun e!512983 () Bool)

(assert (=> mapNonEmpty!30495 (= mapRes!30495 (and tp!58547 e!512983))))

(declare-fun mapRest!30495 () (Array (_ BitVec 32) ValueCell!9104))

(declare-fun mapValue!30495 () ValueCell!9104)

(declare-fun mapKey!30495 () (_ BitVec 32))

(assert (=> mapNonEmpty!30495 (= (arr!26118 _values!1152) (store mapRest!30495 mapKey!30495 mapValue!30495))))

(declare-fun res!616701 () Bool)

(assert (=> start!78388 (=> (not res!616701) (not e!512982))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78388 (= res!616701 (validMask!0 mask!1756))))

(assert (=> start!78388 e!512982))

(declare-fun e!512980 () Bool)

(declare-fun array_inv!20398 (array!54334) Bool)

(assert (=> start!78388 (and (array_inv!20398 _values!1152) e!512980)))

(assert (=> start!78388 tp!58546))

(assert (=> start!78388 true))

(assert (=> start!78388 tp_is_empty!19171))

(declare-fun array_inv!20399 (array!54336) Bool)

(assert (=> start!78388 (array_inv!20399 _keys!1386)))

(declare-fun b!914439 () Bool)

(declare-fun res!616702 () Bool)

(assert (=> b!914439 (=> (not res!616702) (not e!512982))))

(declare-datatypes ((List!18350 0))(
  ( (Nil!18347) (Cons!18346 (h!19492 (_ BitVec 64)) (t!25961 List!18350)) )
))
(declare-fun arrayNoDuplicates!0 (array!54336 (_ BitVec 32) List!18350) Bool)

(assert (=> b!914439 (= res!616702 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18347))))

(declare-fun b!914440 () Bool)

(assert (=> b!914440 (= e!512983 tp_is_empty!19171)))

(declare-fun b!914441 () Bool)

(assert (=> b!914441 (= e!512982 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30527)

(declare-fun lt!411483 () Bool)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30527)

(declare-datatypes ((tuple2!12562 0))(
  ( (tuple2!12563 (_1!6292 (_ BitVec 64)) (_2!6292 V!30527)) )
))
(declare-datatypes ((List!18351 0))(
  ( (Nil!18348) (Cons!18347 (h!19493 tuple2!12562) (t!25962 List!18351)) )
))
(declare-datatypes ((ListLongMap!11259 0))(
  ( (ListLongMap!11260 (toList!5645 List!18351)) )
))
(declare-fun contains!4695 (ListLongMap!11259 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2906 (array!54336 array!54334 (_ BitVec 32) (_ BitVec 32) V!30527 V!30527 (_ BitVec 32) Int) ListLongMap!11259)

(assert (=> b!914441 (= lt!411483 (contains!4695 (getCurrentListMap!2906 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!914442 () Bool)

(assert (=> b!914442 (= e!512980 (and e!512984 mapRes!30495))))

(declare-fun condMapEmpty!30495 () Bool)

(declare-fun mapDefault!30495 () ValueCell!9104)

