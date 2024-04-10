; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41908 () Bool)

(assert start!41908)

(declare-fun b_free!11497 () Bool)

(declare-fun b_next!11497 () Bool)

(assert (=> start!41908 (= b_free!11497 (not b_next!11497))))

(declare-fun tp!40504 () Bool)

(declare-fun b_and!19885 () Bool)

(assert (=> start!41908 (= tp!40504 b_and!19885)))

(declare-fun res!279614 () Bool)

(declare-fun e!273742 () Bool)

(assert (=> start!41908 (=> (not res!279614) (not e!273742))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41908 (= res!279614 (validMask!0 mask!1365))))

(assert (=> start!41908 e!273742))

(declare-fun tp_is_empty!12925 () Bool)

(assert (=> start!41908 tp_is_empty!12925))

(assert (=> start!41908 tp!40504))

(assert (=> start!41908 true))

(declare-datatypes ((array!29627 0))(
  ( (array!29628 (arr!14240 (Array (_ BitVec 32) (_ BitVec 64))) (size!14592 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29627)

(declare-fun array_inv!10280 (array!29627) Bool)

(assert (=> start!41908 (array_inv!10280 _keys!1025)))

(declare-datatypes ((V!18339 0))(
  ( (V!18340 (val!6507 Int)) )
))
(declare-datatypes ((ValueCell!6119 0))(
  ( (ValueCellFull!6119 (v!8796 V!18339)) (EmptyCell!6119) )
))
(declare-datatypes ((array!29629 0))(
  ( (array!29630 (arr!14241 (Array (_ BitVec 32) ValueCell!6119)) (size!14593 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29629)

(declare-fun e!273744 () Bool)

(declare-fun array_inv!10281 (array!29629) Bool)

(assert (=> start!41908 (and (array_inv!10281 _values!833) e!273744)))

(declare-fun b!467870 () Bool)

(declare-fun res!279615 () Bool)

(assert (=> b!467870 (=> (not res!279615) (not e!273742))))

(declare-datatypes ((List!8631 0))(
  ( (Nil!8628) (Cons!8627 (h!9483 (_ BitVec 64)) (t!14587 List!8631)) )
))
(declare-fun arrayNoDuplicates!0 (array!29627 (_ BitVec 32) List!8631) Bool)

(assert (=> b!467870 (= res!279615 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8628))))

(declare-fun b!467871 () Bool)

(declare-fun res!279613 () Bool)

(assert (=> b!467871 (=> (not res!279613) (not e!273742))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!467871 (= res!279613 (and (= (size!14593 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14592 _keys!1025) (size!14593 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!467872 () Bool)

(declare-fun e!273740 () Bool)

(declare-fun mapRes!21079 () Bool)

(assert (=> b!467872 (= e!273744 (and e!273740 mapRes!21079))))

(declare-fun condMapEmpty!21079 () Bool)

(declare-fun mapDefault!21079 () ValueCell!6119)

