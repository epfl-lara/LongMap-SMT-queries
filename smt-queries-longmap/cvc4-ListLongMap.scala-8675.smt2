; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105430 () Bool)

(assert start!105430)

(declare-fun b_free!27089 () Bool)

(declare-fun b_next!27089 () Bool)

(assert (=> start!105430 (= b_free!27089 (not b_next!27089))))

(declare-fun tp!94780 () Bool)

(declare-fun b_and!44935 () Bool)

(assert (=> start!105430 (= tp!94780 b_and!44935)))

(declare-fun b!1256118 () Bool)

(declare-fun res!837405 () Bool)

(declare-fun e!714031 () Bool)

(assert (=> b!1256118 (=> (not res!837405) (not e!714031))))

(declare-datatypes ((array!81624 0))(
  ( (array!81625 (arr!39371 (Array (_ BitVec 32) (_ BitVec 64))) (size!39907 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81624)

(declare-datatypes ((List!27960 0))(
  ( (Nil!27957) (Cons!27956 (h!29165 (_ BitVec 64)) (t!41447 List!27960)) )
))
(declare-fun arrayNoDuplicates!0 (array!81624 (_ BitVec 32) List!27960) Bool)

(assert (=> b!1256118 (= res!837405 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27957))))

(declare-fun mapIsEmpty!49771 () Bool)

(declare-fun mapRes!49771 () Bool)

(assert (=> mapIsEmpty!49771 mapRes!49771))

(declare-fun b!1256119 () Bool)

(declare-fun e!714032 () Bool)

(declare-fun e!714035 () Bool)

(assert (=> b!1256119 (= e!714032 (and e!714035 mapRes!49771))))

(declare-fun condMapEmpty!49771 () Bool)

(declare-datatypes ((V!48019 0))(
  ( (V!48020 (val!16058 Int)) )
))
(declare-datatypes ((ValueCell!15232 0))(
  ( (ValueCellFull!15232 (v!18758 V!48019)) (EmptyCell!15232) )
))
(declare-datatypes ((array!81626 0))(
  ( (array!81627 (arr!39372 (Array (_ BitVec 32) ValueCell!15232)) (size!39908 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81626)

(declare-fun mapDefault!49771 () ValueCell!15232)

