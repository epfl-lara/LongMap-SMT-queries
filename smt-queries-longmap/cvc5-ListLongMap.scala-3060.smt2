; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43202 () Bool)

(assert start!43202)

(declare-fun mapIsEmpty!22081 () Bool)

(declare-fun mapRes!22081 () Bool)

(assert (=> mapIsEmpty!22081 mapRes!22081))

(declare-fun b!478804 () Bool)

(declare-fun e!281580 () Bool)

(assert (=> b!478804 (= e!281580 false)))

(declare-fun lt!217771 () Bool)

(declare-datatypes ((array!30859 0))(
  ( (array!30860 (arr!14837 (Array (_ BitVec 32) (_ BitVec 64))) (size!15195 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30859)

(declare-datatypes ((List!9069 0))(
  ( (Nil!9066) (Cons!9065 (h!9921 (_ BitVec 64)) (t!15275 List!9069)) )
))
(declare-fun arrayNoDuplicates!0 (array!30859 (_ BitVec 32) List!9069) Bool)

(assert (=> b!478804 (= lt!217771 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9066))))

(declare-fun mapNonEmpty!22081 () Bool)

(declare-fun tp!42556 () Bool)

(declare-fun e!281581 () Bool)

(assert (=> mapNonEmpty!22081 (= mapRes!22081 (and tp!42556 e!281581))))

(declare-datatypes ((V!19193 0))(
  ( (V!19194 (val!6843 Int)) )
))
(declare-datatypes ((ValueCell!6434 0))(
  ( (ValueCellFull!6434 (v!9132 V!19193)) (EmptyCell!6434) )
))
(declare-fun mapValue!22081 () ValueCell!6434)

(declare-fun mapRest!22081 () (Array (_ BitVec 32) ValueCell!6434))

(declare-fun mapKey!22081 () (_ BitVec 32))

(declare-datatypes ((array!30861 0))(
  ( (array!30862 (arr!14838 (Array (_ BitVec 32) ValueCell!6434)) (size!15196 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30861)

(assert (=> mapNonEmpty!22081 (= (arr!14838 _values!1516) (store mapRest!22081 mapKey!22081 mapValue!22081))))

(declare-fun b!478805 () Bool)

(declare-fun res!285649 () Bool)

(assert (=> b!478805 (=> (not res!285649) (not e!281580))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30859 (_ BitVec 32)) Bool)

(assert (=> b!478805 (= res!285649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!478806 () Bool)

(declare-fun e!281579 () Bool)

(declare-fun e!281583 () Bool)

(assert (=> b!478806 (= e!281579 (and e!281583 mapRes!22081))))

(declare-fun condMapEmpty!22081 () Bool)

(declare-fun mapDefault!22081 () ValueCell!6434)

