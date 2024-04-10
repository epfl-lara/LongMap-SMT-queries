; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133666 () Bool)

(assert start!133666)

(declare-fun b!1562850 () Bool)

(declare-fun e!870956 () Bool)

(assert (=> b!1562850 (= e!870956 false)))

(declare-fun lt!671793 () Bool)

(declare-datatypes ((array!104204 0))(
  ( (array!104205 (arr!50294 (Array (_ BitVec 32) (_ BitVec 64))) (size!50844 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104204)

(declare-datatypes ((List!36501 0))(
  ( (Nil!36498) (Cons!36497 (h!37943 (_ BitVec 64)) (t!51348 List!36501)) )
))
(declare-fun arrayNoDuplicates!0 (array!104204 (_ BitVec 32) List!36501) Bool)

(assert (=> b!1562850 (= lt!671793 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36498))))

(declare-fun b!1562851 () Bool)

(declare-fun e!870958 () Bool)

(declare-fun tp_is_empty!38749 () Bool)

(assert (=> b!1562851 (= e!870958 tp_is_empty!38749)))

(declare-fun res!1068475 () Bool)

(assert (=> start!133666 (=> (not res!1068475) (not e!870956))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133666 (= res!1068475 (validMask!0 mask!947))))

(assert (=> start!133666 e!870956))

(assert (=> start!133666 true))

(declare-datatypes ((V!59873 0))(
  ( (V!59874 (val!19458 Int)) )
))
(declare-datatypes ((ValueCell!18344 0))(
  ( (ValueCellFull!18344 (v!22210 V!59873)) (EmptyCell!18344) )
))
(declare-datatypes ((array!104206 0))(
  ( (array!104207 (arr!50295 (Array (_ BitVec 32) ValueCell!18344)) (size!50845 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104206)

(declare-fun e!870957 () Bool)

(declare-fun array_inv!39091 (array!104206) Bool)

(assert (=> start!133666 (and (array_inv!39091 _values!487) e!870957)))

(declare-fun array_inv!39092 (array!104204) Bool)

(assert (=> start!133666 (array_inv!39092 _keys!637)))

(declare-fun b!1562852 () Bool)

(declare-fun res!1068476 () Bool)

(assert (=> b!1562852 (=> (not res!1068476) (not e!870956))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104204 (_ BitVec 32)) Bool)

(assert (=> b!1562852 (= res!1068476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapIsEmpty!59499 () Bool)

(declare-fun mapRes!59499 () Bool)

(assert (=> mapIsEmpty!59499 mapRes!59499))

(declare-fun mapNonEmpty!59499 () Bool)

(declare-fun tp!113334 () Bool)

(assert (=> mapNonEmpty!59499 (= mapRes!59499 (and tp!113334 e!870958))))

(declare-fun mapValue!59499 () ValueCell!18344)

(declare-fun mapKey!59499 () (_ BitVec 32))

(declare-fun mapRest!59499 () (Array (_ BitVec 32) ValueCell!18344))

(assert (=> mapNonEmpty!59499 (= (arr!50295 _values!487) (store mapRest!59499 mapKey!59499 mapValue!59499))))

(declare-fun b!1562853 () Bool)

(declare-fun res!1068477 () Bool)

(assert (=> b!1562853 (=> (not res!1068477) (not e!870956))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1562853 (= res!1068477 (and (= (size!50845 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50844 _keys!637) (size!50845 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1562854 () Bool)

(declare-fun e!870955 () Bool)

(assert (=> b!1562854 (= e!870957 (and e!870955 mapRes!59499))))

(declare-fun condMapEmpty!59499 () Bool)

(declare-fun mapDefault!59499 () ValueCell!18344)

