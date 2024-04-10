; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42120 () Bool)

(assert start!42120)

(declare-fun b_free!11653 () Bool)

(declare-fun b_next!11653 () Bool)

(assert (=> start!42120 (= b_free!11653 (not b_next!11653))))

(declare-fun tp!40980 () Bool)

(declare-fun b_and!20075 () Bool)

(assert (=> start!42120 (= tp!40980 b_and!20075)))

(declare-fun res!280986 () Bool)

(declare-fun e!275455 () Bool)

(assert (=> start!42120 (=> (not res!280986) (not e!275455))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42120 (= res!280986 (validMask!0 mask!1365))))

(assert (=> start!42120 e!275455))

(declare-fun tp_is_empty!13081 () Bool)

(assert (=> start!42120 tp_is_empty!13081))

(assert (=> start!42120 tp!40980))

(assert (=> start!42120 true))

(declare-datatypes ((array!29933 0))(
  ( (array!29934 (arr!14390 (Array (_ BitVec 32) (_ BitVec 64))) (size!14742 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29933)

(declare-fun array_inv!10380 (array!29933) Bool)

(assert (=> start!42120 (array_inv!10380 _keys!1025)))

(declare-datatypes ((V!18547 0))(
  ( (V!18548 (val!6585 Int)) )
))
(declare-datatypes ((ValueCell!6197 0))(
  ( (ValueCellFull!6197 (v!8876 V!18547)) (EmptyCell!6197) )
))
(declare-datatypes ((array!29935 0))(
  ( (array!29936 (arr!14391 (Array (_ BitVec 32) ValueCell!6197)) (size!14743 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29935)

(declare-fun e!275454 () Bool)

(declare-fun array_inv!10381 (array!29935) Bool)

(assert (=> start!42120 (and (array_inv!10381 _values!833) e!275454)))

(declare-fun b!470237 () Bool)

(declare-fun res!280984 () Bool)

(assert (=> b!470237 (=> (not res!280984) (not e!275455))))

(declare-datatypes ((List!8750 0))(
  ( (Nil!8747) (Cons!8746 (h!9602 (_ BitVec 64)) (t!14712 List!8750)) )
))
(declare-fun arrayNoDuplicates!0 (array!29933 (_ BitVec 32) List!8750) Bool)

(assert (=> b!470237 (= res!280984 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8747))))

(declare-fun b!470238 () Bool)

(declare-fun e!275452 () Bool)

(assert (=> b!470238 (= e!275452 tp_is_empty!13081)))

(declare-fun b!470239 () Bool)

(declare-fun res!280985 () Bool)

(assert (=> b!470239 (=> (not res!280985) (not e!275455))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!470239 (= res!280985 (and (= (size!14743 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14742 _keys!1025) (size!14743 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!470240 () Bool)

(declare-fun mapRes!21322 () Bool)

(assert (=> b!470240 (= e!275454 (and e!275452 mapRes!21322))))

(declare-fun condMapEmpty!21322 () Bool)

(declare-fun mapDefault!21322 () ValueCell!6197)

