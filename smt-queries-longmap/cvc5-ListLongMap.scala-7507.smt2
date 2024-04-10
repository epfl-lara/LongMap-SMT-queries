; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95180 () Bool)

(assert start!95180)

(declare-fun b_free!22219 () Bool)

(declare-fun b_next!22219 () Bool)

(assert (=> start!95180 (= b_free!22219 (not b_next!22219))))

(declare-fun tp!78148 () Bool)

(declare-fun b_and!35173 () Bool)

(assert (=> start!95180 (= tp!78148 b_and!35173)))

(declare-fun res!717137 () Bool)

(declare-fun e!614907 () Bool)

(assert (=> start!95180 (=> (not res!717137) (not e!614907))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95180 (= res!717137 (validMask!0 mask!1515))))

(assert (=> start!95180 e!614907))

(assert (=> start!95180 true))

(declare-fun tp_is_empty!26029 () Bool)

(assert (=> start!95180 tp_is_empty!26029))

(declare-datatypes ((V!39841 0))(
  ( (V!39842 (val!13065 Int)) )
))
(declare-datatypes ((ValueCell!12311 0))(
  ( (ValueCellFull!12311 (v!15691 V!39841)) (EmptyCell!12311) )
))
(declare-datatypes ((array!69027 0))(
  ( (array!69028 (arr!33198 (Array (_ BitVec 32) ValueCell!12311)) (size!33734 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!69027)

(declare-fun e!614909 () Bool)

(declare-fun array_inv!25652 (array!69027) Bool)

(assert (=> start!95180 (and (array_inv!25652 _values!955) e!614909)))

(assert (=> start!95180 tp!78148))

(declare-datatypes ((array!69029 0))(
  ( (array!69030 (arr!33199 (Array (_ BitVec 32) (_ BitVec 64))) (size!33735 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!69029)

(declare-fun array_inv!25653 (array!69029) Bool)

(assert (=> start!95180 (array_inv!25653 _keys!1163)))

(declare-fun mapIsEmpty!40783 () Bool)

(declare-fun mapRes!40783 () Bool)

(assert (=> mapIsEmpty!40783 mapRes!40783))

(declare-fun b!1075852 () Bool)

(declare-fun res!717132 () Bool)

(assert (=> b!1075852 (=> (not res!717132) (not e!614907))))

(declare-datatypes ((List!23179 0))(
  ( (Nil!23176) (Cons!23175 (h!24384 (_ BitVec 64)) (t!32534 List!23179)) )
))
(declare-fun arrayNoDuplicates!0 (array!69029 (_ BitVec 32) List!23179) Bool)

(assert (=> b!1075852 (= res!717132 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23176))))

(declare-fun b!1075853 () Bool)

(declare-fun e!614910 () Bool)

(assert (=> b!1075853 (= e!614910 tp_is_empty!26029)))

(declare-fun b!1075854 () Bool)

(declare-fun e!614905 () Bool)

(assert (=> b!1075854 (= e!614909 (and e!614905 mapRes!40783))))

(declare-fun condMapEmpty!40783 () Bool)

(declare-fun mapDefault!40783 () ValueCell!12311)

