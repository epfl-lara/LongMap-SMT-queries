; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20334 () Bool)

(assert start!20334)

(declare-fun b_free!4993 () Bool)

(declare-fun b_next!4993 () Bool)

(assert (=> start!20334 (= b_free!4993 (not b_next!4993))))

(declare-fun tp!18010 () Bool)

(declare-fun b_and!11739 () Bool)

(assert (=> start!20334 (= tp!18010 b_and!11739)))

(declare-fun b!200502 () Bool)

(declare-fun res!95554 () Bool)

(declare-fun e!131476 () Bool)

(assert (=> b!200502 (=> (not res!95554) (not e!131476))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!200502 (= res!95554 (validKeyInArray!0 k!843))))

(declare-fun b!200503 () Bool)

(declare-fun res!95555 () Bool)

(assert (=> b!200503 (=> (not res!95555) (not e!131476))))

(declare-datatypes ((array!8929 0))(
  ( (array!8930 (arr!4215 (Array (_ BitVec 32) (_ BitVec 64))) (size!4540 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8929)

(declare-datatypes ((List!2648 0))(
  ( (Nil!2645) (Cons!2644 (h!3286 (_ BitVec 64)) (t!7579 List!2648)) )
))
(declare-fun arrayNoDuplicates!0 (array!8929 (_ BitVec 32) List!2648) Bool)

(assert (=> b!200503 (= res!95555 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2645))))

(declare-fun b!200504 () Bool)

(declare-fun e!131475 () Bool)

(declare-fun e!131474 () Bool)

(declare-fun mapRes!8342 () Bool)

(assert (=> b!200504 (= e!131475 (and e!131474 mapRes!8342))))

(declare-fun condMapEmpty!8342 () Bool)

(declare-datatypes ((V!6113 0))(
  ( (V!6114 (val!2469 Int)) )
))
(declare-datatypes ((ValueCell!2081 0))(
  ( (ValueCellFull!2081 (v!4439 V!6113)) (EmptyCell!2081) )
))
(declare-datatypes ((array!8931 0))(
  ( (array!8932 (arr!4216 (Array (_ BitVec 32) ValueCell!2081)) (size!4541 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8931)

(declare-fun mapDefault!8342 () ValueCell!2081)

