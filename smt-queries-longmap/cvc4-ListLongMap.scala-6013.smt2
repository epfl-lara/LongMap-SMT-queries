; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77950 () Bool)

(assert start!77950)

(declare-fun b_free!16493 () Bool)

(declare-fun b_next!16493 () Bool)

(assert (=> start!77950 (= b_free!16493 (not b_next!16493))))

(declare-fun tp!57747 () Bool)

(declare-fun b_and!27063 () Bool)

(assert (=> start!77950 (= tp!57747 b_and!27063)))

(declare-fun b!910064 () Bool)

(declare-fun e!510210 () Bool)

(declare-fun tp_is_empty!18911 () Bool)

(assert (=> b!910064 (= e!510210 tp_is_empty!18911)))

(declare-fun b!910065 () Bool)

(declare-fun e!510212 () Bool)

(assert (=> b!910065 (= e!510212 tp_is_empty!18911)))

(declare-fun b!910066 () Bool)

(declare-fun res!614157 () Bool)

(declare-fun e!510211 () Bool)

(assert (=> b!910066 (=> (not res!614157) (not e!510211))))

(declare-datatypes ((array!53842 0))(
  ( (array!53843 (arr!25878 (Array (_ BitVec 32) (_ BitVec 64))) (size!26337 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53842)

(declare-datatypes ((List!18180 0))(
  ( (Nil!18177) (Cons!18176 (h!19322 (_ BitVec 64)) (t!25763 List!18180)) )
))
(declare-fun arrayNoDuplicates!0 (array!53842 (_ BitVec 32) List!18180) Bool)

(assert (=> b!910066 (= res!614157 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18177))))

(declare-fun res!614159 () Bool)

(assert (=> start!77950 (=> (not res!614159) (not e!510211))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77950 (= res!614159 (validMask!0 mask!1756))))

(assert (=> start!77950 e!510211))

(declare-datatypes ((V!30179 0))(
  ( (V!30180 (val!9506 Int)) )
))
(declare-datatypes ((ValueCell!8974 0))(
  ( (ValueCellFull!8974 (v!12014 V!30179)) (EmptyCell!8974) )
))
(declare-datatypes ((array!53844 0))(
  ( (array!53845 (arr!25879 (Array (_ BitVec 32) ValueCell!8974)) (size!26338 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53844)

(declare-fun e!510213 () Bool)

(declare-fun array_inv!20240 (array!53844) Bool)

(assert (=> start!77950 (and (array_inv!20240 _values!1152) e!510213)))

(assert (=> start!77950 tp!57747))

(assert (=> start!77950 true))

(assert (=> start!77950 tp_is_empty!18911))

(declare-fun array_inv!20241 (array!53842) Bool)

(assert (=> start!77950 (array_inv!20241 _keys!1386)))

(declare-fun b!910067 () Bool)

(declare-fun mapRes!30085 () Bool)

(assert (=> b!910067 (= e!510213 (and e!510210 mapRes!30085))))

(declare-fun condMapEmpty!30085 () Bool)

(declare-fun mapDefault!30085 () ValueCell!8974)

