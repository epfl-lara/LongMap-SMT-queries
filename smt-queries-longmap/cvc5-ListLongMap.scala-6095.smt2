; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78678 () Bool)

(assert start!78678)

(declare-fun b_free!16891 () Bool)

(declare-fun b_next!16891 () Bool)

(assert (=> start!78678 (= b_free!16891 (not b_next!16891))))

(declare-fun tp!59113 () Bool)

(declare-fun b_and!27519 () Bool)

(assert (=> start!78678 (= tp!59113 b_and!27519)))

(declare-fun b!917345 () Bool)

(declare-fun res!618430 () Bool)

(declare-fun e!515017 () Bool)

(assert (=> b!917345 (=> (not res!618430) (not e!515017))))

(declare-datatypes ((array!54784 0))(
  ( (array!54785 (arr!26337 (Array (_ BitVec 32) (_ BitVec 64))) (size!26796 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54784)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30831 0))(
  ( (V!30832 (val!9750 Int)) )
))
(declare-datatypes ((ValueCell!9218 0))(
  ( (ValueCellFull!9218 (v!12268 V!30831)) (EmptyCell!9218) )
))
(declare-datatypes ((array!54786 0))(
  ( (array!54787 (arr!26338 (Array (_ BitVec 32) ValueCell!9218)) (size!26797 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54786)

(assert (=> b!917345 (= res!618430 (and (= (size!26797 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26796 _keys!1487) (size!26797 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!917346 () Bool)

(declare-fun res!618437 () Bool)

(declare-fun e!515014 () Bool)

(assert (=> b!917346 (=> (not res!618437) (not e!515014))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!917346 (= res!618437 (validKeyInArray!0 k!1099))))

(declare-fun b!917347 () Bool)

(declare-fun res!618436 () Bool)

(assert (=> b!917347 (=> (not res!618436) (not e!515014))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!917347 (= res!618436 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!917348 () Bool)

(assert (=> b!917348 (= e!515017 e!515014)))

(declare-fun res!618433 () Bool)

(assert (=> b!917348 (=> (not res!618433) (not e!515014))))

(declare-datatypes ((tuple2!12662 0))(
  ( (tuple2!12663 (_1!6342 (_ BitVec 64)) (_2!6342 V!30831)) )
))
(declare-datatypes ((List!18472 0))(
  ( (Nil!18469) (Cons!18468 (h!19614 tuple2!12662) (t!26093 List!18472)) )
))
(declare-datatypes ((ListLongMap!11359 0))(
  ( (ListLongMap!11360 (toList!5695 List!18472)) )
))
(declare-fun lt!411992 () ListLongMap!11359)

(declare-fun contains!4747 (ListLongMap!11359 (_ BitVec 64)) Bool)

(assert (=> b!917348 (= res!618433 (contains!4747 lt!411992 k!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30831)

(declare-fun minValue!1173 () V!30831)

(declare-fun getCurrentListMap!2954 (array!54784 array!54786 (_ BitVec 32) (_ BitVec 32) V!30831 V!30831 (_ BitVec 32) Int) ListLongMap!11359)

(assert (=> b!917348 (= lt!411992 (getCurrentListMap!2954 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapNonEmpty!30855 () Bool)

(declare-fun mapRes!30855 () Bool)

(declare-fun tp!59114 () Bool)

(declare-fun e!515016 () Bool)

(assert (=> mapNonEmpty!30855 (= mapRes!30855 (and tp!59114 e!515016))))

(declare-fun mapKey!30855 () (_ BitVec 32))

(declare-fun mapRest!30855 () (Array (_ BitVec 32) ValueCell!9218))

(declare-fun mapValue!30855 () ValueCell!9218)

(assert (=> mapNonEmpty!30855 (= (arr!26338 _values!1231) (store mapRest!30855 mapKey!30855 mapValue!30855))))

(declare-fun b!917349 () Bool)

(declare-fun res!618432 () Bool)

(assert (=> b!917349 (=> (not res!618432) (not e!515017))))

(declare-datatypes ((List!18473 0))(
  ( (Nil!18470) (Cons!18469 (h!19615 (_ BitVec 64)) (t!26094 List!18473)) )
))
(declare-fun arrayNoDuplicates!0 (array!54784 (_ BitVec 32) List!18473) Bool)

(assert (=> b!917349 (= res!618432 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18470))))

(declare-fun res!618435 () Bool)

(assert (=> start!78678 (=> (not res!618435) (not e!515017))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78678 (= res!618435 (validMask!0 mask!1881))))

(assert (=> start!78678 e!515017))

(assert (=> start!78678 true))

(declare-fun tp_is_empty!19399 () Bool)

(assert (=> start!78678 tp_is_empty!19399))

(declare-fun e!515015 () Bool)

(declare-fun array_inv!20538 (array!54786) Bool)

(assert (=> start!78678 (and (array_inv!20538 _values!1231) e!515015)))

(assert (=> start!78678 tp!59113))

(declare-fun array_inv!20539 (array!54784) Bool)

(assert (=> start!78678 (array_inv!20539 _keys!1487)))

(declare-fun mapIsEmpty!30855 () Bool)

(assert (=> mapIsEmpty!30855 mapRes!30855))

(declare-fun b!917350 () Bool)

(declare-fun e!515018 () Bool)

(assert (=> b!917350 (= e!515014 e!515018)))

(declare-fun res!618439 () Bool)

(assert (=> b!917350 (=> (not res!618439) (not e!515018))))

(declare-fun lt!411994 () (_ BitVec 64))

(assert (=> b!917350 (= res!618439 (validKeyInArray!0 lt!411994))))

(assert (=> b!917350 (= lt!411994 (select (arr!26337 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!917351 () Bool)

(declare-fun e!515019 () Bool)

(assert (=> b!917351 (= e!515019 tp_is_empty!19399)))

(declare-fun b!917352 () Bool)

(declare-fun res!618431 () Bool)

(assert (=> b!917352 (=> (not res!618431) (not e!515017))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54784 (_ BitVec 32)) Bool)

(assert (=> b!917352 (= res!618431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!917353 () Bool)

(assert (=> b!917353 (= e!515016 tp_is_empty!19399)))

(declare-fun b!917354 () Bool)

(assert (=> b!917354 (= e!515015 (and e!515019 mapRes!30855))))

(declare-fun condMapEmpty!30855 () Bool)

(declare-fun mapDefault!30855 () ValueCell!9218)

