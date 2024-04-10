; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35672 () Bool)

(assert start!35672)

(declare-fun b!358337 () Bool)

(declare-fun e!219313 () Bool)

(assert (=> b!358337 (= e!219313 false)))

(declare-fun lt!166175 () Bool)

(declare-datatypes ((array!19815 0))(
  ( (array!19816 (arr!9401 (Array (_ BitVec 32) (_ BitVec 64))) (size!9753 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19815)

(declare-datatypes ((List!5426 0))(
  ( (Nil!5423) (Cons!5422 (h!6278 (_ BitVec 64)) (t!10576 List!5426)) )
))
(declare-fun arrayNoDuplicates!0 (array!19815 (_ BitVec 32) List!5426) Bool)

(assert (=> b!358337 (= lt!166175 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5423))))

(declare-fun res!199180 () Bool)

(assert (=> start!35672 (=> (not res!199180) (not e!219313))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35672 (= res!199180 (validMask!0 mask!1842))))

(assert (=> start!35672 e!219313))

(assert (=> start!35672 true))

(declare-datatypes ((V!11811 0))(
  ( (V!11812 (val!4107 Int)) )
))
(declare-datatypes ((ValueCell!3719 0))(
  ( (ValueCellFull!3719 (v!6301 V!11811)) (EmptyCell!3719) )
))
(declare-datatypes ((array!19817 0))(
  ( (array!19818 (arr!9402 (Array (_ BitVec 32) ValueCell!3719)) (size!9754 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19817)

(declare-fun e!219315 () Bool)

(declare-fun array_inv!6910 (array!19817) Bool)

(assert (=> start!35672 (and (array_inv!6910 _values!1208) e!219315)))

(declare-fun array_inv!6911 (array!19815) Bool)

(assert (=> start!35672 (array_inv!6911 _keys!1456)))

(declare-fun b!358338 () Bool)

(declare-fun e!219317 () Bool)

(declare-fun tp_is_empty!8125 () Bool)

(assert (=> b!358338 (= e!219317 tp_is_empty!8125)))

(declare-fun b!358339 () Bool)

(declare-fun res!199179 () Bool)

(assert (=> b!358339 (=> (not res!199179) (not e!219313))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!358339 (= res!199179 (and (= (size!9754 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9753 _keys!1456) (size!9754 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!358340 () Bool)

(declare-fun e!219314 () Bool)

(declare-fun mapRes!13695 () Bool)

(assert (=> b!358340 (= e!219315 (and e!219314 mapRes!13695))))

(declare-fun condMapEmpty!13695 () Bool)

(declare-fun mapDefault!13695 () ValueCell!3719)

