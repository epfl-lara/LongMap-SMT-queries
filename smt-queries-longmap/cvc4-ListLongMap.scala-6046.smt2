; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78200 () Bool)

(assert start!78200)

(declare-fun b_free!16691 () Bool)

(declare-fun b_next!16691 () Bool)

(assert (=> start!78200 (= b_free!16691 (not b_next!16691))))

(declare-fun tp!58349 () Bool)

(declare-fun b_and!27267 () Bool)

(assert (=> start!78200 (= tp!58349 b_and!27267)))

(declare-fun mapNonEmpty!30391 () Bool)

(declare-fun mapRes!30391 () Bool)

(declare-fun tp!58350 () Bool)

(declare-fun e!511923 () Bool)

(assert (=> mapNonEmpty!30391 (= mapRes!30391 (and tp!58350 e!511923))))

(declare-datatypes ((V!30443 0))(
  ( (V!30444 (val!9605 Int)) )
))
(declare-datatypes ((ValueCell!9073 0))(
  ( (ValueCellFull!9073 (v!12116 V!30443)) (EmptyCell!9073) )
))
(declare-datatypes ((array!54212 0))(
  ( (array!54213 (arr!26060 (Array (_ BitVec 32) ValueCell!9073)) (size!26519 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54212)

(declare-fun mapKey!30391 () (_ BitVec 32))

(declare-fun mapValue!30391 () ValueCell!9073)

(declare-fun mapRest!30391 () (Array (_ BitVec 32) ValueCell!9073))

(assert (=> mapNonEmpty!30391 (= (arr!26060 _values!1152) (store mapRest!30391 mapKey!30391 mapValue!30391))))

(declare-fun b!912624 () Bool)

(declare-fun e!511919 () Bool)

(assert (=> b!912624 (= e!511919 (not true))))

(declare-datatypes ((array!54214 0))(
  ( (array!54215 (arr!26061 (Array (_ BitVec 32) (_ BitVec 64))) (size!26520 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54214)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!54214 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!912624 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30443)

(declare-datatypes ((Unit!30882 0))(
  ( (Unit!30883) )
))
(declare-fun lt!410687 () Unit!30882)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30443)

(declare-fun lemmaKeyInListMapIsInArray!266 (array!54214 array!54212 (_ BitVec 32) (_ BitVec 32) V!30443 V!30443 (_ BitVec 64) Int) Unit!30882)

(assert (=> b!912624 (= lt!410687 (lemmaKeyInListMapIsInArray!266 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!912625 () Bool)

(declare-fun res!615629 () Bool)

(assert (=> b!912625 (=> (not res!615629) (not e!511919))))

(declare-datatypes ((List!18304 0))(
  ( (Nil!18301) (Cons!18300 (h!19446 (_ BitVec 64)) (t!25893 List!18304)) )
))
(declare-fun arrayNoDuplicates!0 (array!54214 (_ BitVec 32) List!18304) Bool)

(assert (=> b!912625 (= res!615629 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18301))))

(declare-fun b!912626 () Bool)

(declare-fun res!615632 () Bool)

(assert (=> b!912626 (=> (not res!615632) (not e!511919))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54214 (_ BitVec 32)) Bool)

(assert (=> b!912626 (= res!615632 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!912627 () Bool)

(declare-fun e!511922 () Bool)

(declare-fun tp_is_empty!19109 () Bool)

(assert (=> b!912627 (= e!511922 tp_is_empty!19109)))

(declare-fun b!912628 () Bool)

(declare-fun res!615633 () Bool)

(assert (=> b!912628 (=> (not res!615633) (not e!511919))))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!912628 (= res!615633 (and (= (select (arr!26061 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!912629 () Bool)

(declare-fun res!615631 () Bool)

(assert (=> b!912629 (=> (not res!615631) (not e!511919))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!912629 (= res!615631 (inRange!0 i!717 mask!1756))))

(declare-fun b!912630 () Bool)

(declare-fun res!615627 () Bool)

(assert (=> b!912630 (=> (not res!615627) (not e!511919))))

(declare-datatypes ((tuple2!12514 0))(
  ( (tuple2!12515 (_1!6268 (_ BitVec 64)) (_2!6268 V!30443)) )
))
(declare-datatypes ((List!18305 0))(
  ( (Nil!18302) (Cons!18301 (h!19447 tuple2!12514) (t!25894 List!18305)) )
))
(declare-datatypes ((ListLongMap!11211 0))(
  ( (ListLongMap!11212 (toList!5621 List!18305)) )
))
(declare-fun contains!4667 (ListLongMap!11211 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2883 (array!54214 array!54212 (_ BitVec 32) (_ BitVec 32) V!30443 V!30443 (_ BitVec 32) Int) ListLongMap!11211)

(assert (=> b!912630 (= res!615627 (contains!4667 (getCurrentListMap!2883 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun mapIsEmpty!30391 () Bool)

(assert (=> mapIsEmpty!30391 mapRes!30391))

(declare-fun b!912623 () Bool)

(declare-fun e!511920 () Bool)

(assert (=> b!912623 (= e!511920 (and e!511922 mapRes!30391))))

(declare-fun condMapEmpty!30391 () Bool)

(declare-fun mapDefault!30391 () ValueCell!9073)

