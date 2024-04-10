; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96456 () Bool)

(assert start!96456)

(declare-fun b_free!23035 () Bool)

(declare-fun b_next!23035 () Bool)

(assert (=> start!96456 (= b_free!23035 (not b_next!23035))))

(declare-fun tp!81032 () Bool)

(declare-fun b_and!36733 () Bool)

(assert (=> start!96456 (= tp!81032 b_and!36733)))

(declare-fun b!1096750 () Bool)

(declare-fun res!731990 () Bool)

(declare-fun e!626009 () Bool)

(assert (=> b!1096750 (=> (not res!731990) (not e!626009))))

(declare-datatypes ((array!71083 0))(
  ( (array!71084 (arr!34213 (Array (_ BitVec 32) (_ BitVec 64))) (size!34749 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71083)

(declare-datatypes ((List!23893 0))(
  ( (Nil!23890) (Cons!23889 (h!25098 (_ BitVec 64)) (t!33974 List!23893)) )
))
(declare-fun arrayNoDuplicates!0 (array!71083 (_ BitVec 32) List!23893) Bool)

(assert (=> b!1096750 (= res!731990 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23890))))

(declare-fun b!1096751 () Bool)

(declare-fun e!626010 () Bool)

(assert (=> b!1096751 (= e!626009 e!626010)))

(declare-fun res!731993 () Bool)

(assert (=> b!1096751 (=> (not res!731993) (not e!626010))))

(declare-fun lt!490248 () array!71083)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71083 (_ BitVec 32)) Bool)

(assert (=> b!1096751 (= res!731993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490248 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1096751 (= lt!490248 (array!71084 (store (arr!34213 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34749 _keys!1070)))))

(declare-fun res!731992 () Bool)

(assert (=> start!96456 (=> (not res!731992) (not e!626009))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96456 (= res!731992 (validMask!0 mask!1414))))

(assert (=> start!96456 e!626009))

(assert (=> start!96456 tp!81032))

(assert (=> start!96456 true))

(declare-fun tp_is_empty!27085 () Bool)

(assert (=> start!96456 tp_is_empty!27085))

(declare-fun array_inv!26358 (array!71083) Bool)

(assert (=> start!96456 (array_inv!26358 _keys!1070)))

(declare-datatypes ((V!41241 0))(
  ( (V!41242 (val!13599 Int)) )
))
(declare-datatypes ((ValueCell!12833 0))(
  ( (ValueCellFull!12833 (v!16220 V!41241)) (EmptyCell!12833) )
))
(declare-datatypes ((array!71085 0))(
  ( (array!71086 (arr!34214 (Array (_ BitVec 32) ValueCell!12833)) (size!34750 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71085)

(declare-fun e!626007 () Bool)

(declare-fun array_inv!26359 (array!71085) Bool)

(assert (=> start!96456 (and (array_inv!26359 _values!874) e!626007)))

(declare-fun b!1096752 () Bool)

(declare-fun res!731994 () Bool)

(assert (=> b!1096752 (=> (not res!731994) (not e!626009))))

(assert (=> b!1096752 (= res!731994 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1096753 () Bool)

(declare-fun e!626008 () Bool)

(declare-fun mapRes!42388 () Bool)

(assert (=> b!1096753 (= e!626007 (and e!626008 mapRes!42388))))

(declare-fun condMapEmpty!42388 () Bool)

(declare-fun mapDefault!42388 () ValueCell!12833)

