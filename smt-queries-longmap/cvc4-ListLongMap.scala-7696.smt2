; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96632 () Bool)

(assert start!96632)

(declare-fun b_free!23105 () Bool)

(declare-fun b_next!23105 () Bool)

(assert (=> start!96632 (= b_free!23105 (not b_next!23105))))

(declare-fun tp!81254 () Bool)

(declare-fun b_and!36929 () Bool)

(assert (=> start!96632 (= tp!81254 b_and!36929)))

(declare-fun b!1099002 () Bool)

(declare-fun res!733418 () Bool)

(declare-fun e!627269 () Bool)

(assert (=> b!1099002 (=> (not res!733418) (not e!627269))))

(declare-datatypes ((array!71225 0))(
  ( (array!71226 (arr!34280 (Array (_ BitVec 32) (_ BitVec 64))) (size!34816 (_ BitVec 32))) )
))
(declare-fun lt!491934 () array!71225)

(declare-datatypes ((List!23940 0))(
  ( (Nil!23937) (Cons!23936 (h!25145 (_ BitVec 64)) (t!34091 List!23940)) )
))
(declare-fun arrayNoDuplicates!0 (array!71225 (_ BitVec 32) List!23940) Bool)

(assert (=> b!1099002 (= res!733418 (arrayNoDuplicates!0 lt!491934 #b00000000000000000000000000000000 Nil!23937))))

(declare-fun res!733422 () Bool)

(declare-fun e!627264 () Bool)

(assert (=> start!96632 (=> (not res!733422) (not e!627264))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96632 (= res!733422 (validMask!0 mask!1414))))

(assert (=> start!96632 e!627264))

(assert (=> start!96632 tp!81254))

(assert (=> start!96632 true))

(declare-fun tp_is_empty!27155 () Bool)

(assert (=> start!96632 tp_is_empty!27155))

(declare-fun _keys!1070 () array!71225)

(declare-fun array_inv!26406 (array!71225) Bool)

(assert (=> start!96632 (array_inv!26406 _keys!1070)))

(declare-datatypes ((V!41333 0))(
  ( (V!41334 (val!13634 Int)) )
))
(declare-datatypes ((ValueCell!12868 0))(
  ( (ValueCellFull!12868 (v!16259 V!41333)) (EmptyCell!12868) )
))
(declare-datatypes ((array!71227 0))(
  ( (array!71228 (arr!34281 (Array (_ BitVec 32) ValueCell!12868)) (size!34817 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71227)

(declare-fun e!627263 () Bool)

(declare-fun array_inv!26407 (array!71227) Bool)

(assert (=> start!96632 (and (array_inv!26407 _values!874) e!627263)))

(declare-fun b!1099003 () Bool)

(declare-fun res!733420 () Bool)

(assert (=> b!1099003 (=> (not res!733420) (not e!627264))))

(assert (=> b!1099003 (= res!733420 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23937))))

(declare-fun b!1099004 () Bool)

(declare-fun e!627266 () Bool)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1099004 (= e!627266 (bvslt i!650 (size!34817 _values!874)))))

(declare-datatypes ((tuple2!17320 0))(
  ( (tuple2!17321 (_1!8671 (_ BitVec 64)) (_2!8671 V!41333)) )
))
(declare-datatypes ((List!23941 0))(
  ( (Nil!23938) (Cons!23937 (h!25146 tuple2!17320) (t!34092 List!23941)) )
))
(declare-datatypes ((ListLongMap!15289 0))(
  ( (ListLongMap!15290 (toList!7660 List!23941)) )
))
(declare-fun lt!491929 () ListLongMap!15289)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun lt!491926 () ListLongMap!15289)

(declare-fun lt!491928 () tuple2!17320)

(declare-fun -!949 (ListLongMap!15289 (_ BitVec 64)) ListLongMap!15289)

(declare-fun +!3369 (ListLongMap!15289 tuple2!17320) ListLongMap!15289)

(assert (=> b!1099004 (= (-!949 lt!491926 k!904) (+!3369 lt!491929 lt!491928))))

(declare-fun minValue!831 () V!41333)

(declare-fun lt!491935 () ListLongMap!15289)

(declare-datatypes ((Unit!36138 0))(
  ( (Unit!36139) )
))
(declare-fun lt!491931 () Unit!36138)

(declare-fun addRemoveCommutativeForDiffKeys!121 (ListLongMap!15289 (_ BitVec 64) V!41333 (_ BitVec 64)) Unit!36138)

(assert (=> b!1099004 (= lt!491931 (addRemoveCommutativeForDiffKeys!121 lt!491935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k!904))))

(declare-fun b!1099005 () Bool)

(declare-fun e!627265 () Bool)

(declare-fun mapRes!42505 () Bool)

(assert (=> b!1099005 (= e!627263 (and e!627265 mapRes!42505))))

(declare-fun condMapEmpty!42505 () Bool)

(declare-fun mapDefault!42505 () ValueCell!12868)

