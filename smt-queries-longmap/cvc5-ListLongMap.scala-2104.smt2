; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35792 () Bool)

(assert start!35792)

(declare-fun res!199819 () Bool)

(declare-fun e!220215 () Bool)

(assert (=> start!35792 (=> (not res!199819) (not e!220215))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35792 (= res!199819 (validMask!0 mask!1842))))

(assert (=> start!35792 e!220215))

(assert (=> start!35792 true))

(declare-datatypes ((V!11971 0))(
  ( (V!11972 (val!4167 Int)) )
))
(declare-datatypes ((ValueCell!3779 0))(
  ( (ValueCellFull!3779 (v!6361 V!11971)) (EmptyCell!3779) )
))
(declare-datatypes ((array!20045 0))(
  ( (array!20046 (arr!9516 (Array (_ BitVec 32) ValueCell!3779)) (size!9868 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20045)

(declare-fun e!220214 () Bool)

(declare-fun array_inv!7000 (array!20045) Bool)

(assert (=> start!35792 (and (array_inv!7000 _values!1208) e!220214)))

(declare-datatypes ((array!20047 0))(
  ( (array!20048 (arr!9517 (Array (_ BitVec 32) (_ BitVec 64))) (size!9869 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20047)

(declare-fun array_inv!7001 (array!20047) Bool)

(assert (=> start!35792 (array_inv!7001 _keys!1456)))

(declare-fun b!359516 () Bool)

(declare-fun res!199817 () Bool)

(assert (=> b!359516 (=> (not res!199817) (not e!220215))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20047 (_ BitVec 32)) Bool)

(assert (=> b!359516 (= res!199817 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!359517 () Bool)

(declare-fun e!220213 () Bool)

(declare-fun tp_is_empty!8245 () Bool)

(assert (=> b!359517 (= e!220213 tp_is_empty!8245)))

(declare-fun b!359518 () Bool)

(declare-fun e!220216 () Bool)

(declare-fun mapRes!13875 () Bool)

(assert (=> b!359518 (= e!220214 (and e!220216 mapRes!13875))))

(declare-fun condMapEmpty!13875 () Bool)

(declare-fun mapDefault!13875 () ValueCell!3779)

