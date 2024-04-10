; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94888 () Bool)

(assert start!94888)

(declare-fun b_free!22093 () Bool)

(declare-fun b_next!22093 () Bool)

(assert (=> start!94888 (= b_free!22093 (not b_next!22093))))

(declare-fun tp!77744 () Bool)

(declare-fun b_and!34947 () Bool)

(assert (=> start!94888 (= tp!77744 b_and!34947)))

(declare-fun res!715645 () Bool)

(declare-fun e!612889 () Bool)

(assert (=> start!94888 (=> (not res!715645) (not e!612889))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94888 (= res!715645 (validMask!0 mask!1515))))

(assert (=> start!94888 e!612889))

(assert (=> start!94888 true))

(declare-fun tp_is_empty!25903 () Bool)

(assert (=> start!94888 tp_is_empty!25903))

(declare-datatypes ((V!39673 0))(
  ( (V!39674 (val!13002 Int)) )
))
(declare-datatypes ((ValueCell!12248 0))(
  ( (ValueCellFull!12248 (v!15620 V!39673)) (EmptyCell!12248) )
))
(declare-datatypes ((array!68771 0))(
  ( (array!68772 (arr!33079 (Array (_ BitVec 32) ValueCell!12248)) (size!33615 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68771)

(declare-fun e!612890 () Bool)

(declare-fun array_inv!25568 (array!68771) Bool)

(assert (=> start!94888 (and (array_inv!25568 _values!955) e!612890)))

(assert (=> start!94888 tp!77744))

(declare-datatypes ((array!68773 0))(
  ( (array!68774 (arr!33080 (Array (_ BitVec 32) (_ BitVec 64))) (size!33616 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68773)

(declare-fun array_inv!25569 (array!68773) Bool)

(assert (=> start!94888 (array_inv!25569 _keys!1163)))

(declare-fun b!1072922 () Bool)

(declare-fun e!612892 () Bool)

(assert (=> b!1072922 (= e!612892 tp_is_empty!25903)))

(declare-fun b!1072923 () Bool)

(declare-fun res!715646 () Bool)

(assert (=> b!1072923 (=> (not res!715646) (not e!612889))))

(declare-datatypes ((List!23093 0))(
  ( (Nil!23090) (Cons!23089 (h!24298 (_ BitVec 64)) (t!32430 List!23093)) )
))
(declare-fun arrayNoDuplicates!0 (array!68773 (_ BitVec 32) List!23093) Bool)

(assert (=> b!1072923 (= res!715646 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23090))))

(declare-fun b!1072924 () Bool)

(declare-fun e!612893 () Bool)

(declare-fun mapRes!40567 () Bool)

(assert (=> b!1072924 (= e!612890 (and e!612893 mapRes!40567))))

(declare-fun condMapEmpty!40567 () Bool)

(declare-fun mapDefault!40567 () ValueCell!12248)

