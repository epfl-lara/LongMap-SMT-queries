; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95400 () Bool)

(assert start!95400)

(declare-fun b!1077464 () Bool)

(declare-fun res!717940 () Bool)

(declare-fun e!616082 () Bool)

(assert (=> b!1077464 (=> (not res!717940) (not e!616082))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!69179 0))(
  ( (array!69180 (arr!33267 (Array (_ BitVec 32) (_ BitVec 64))) (size!33803 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69179)

(assert (=> b!1077464 (= res!717940 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33803 _keys!1070))))))

(declare-fun b!1077465 () Bool)

(declare-fun res!717936 () Bool)

(assert (=> b!1077465 (=> (not res!717936) (not e!616082))))

(declare-datatypes ((List!23219 0))(
  ( (Nil!23216) (Cons!23215 (h!24424 (_ BitVec 64)) (t!32578 List!23219)) )
))
(declare-fun arrayNoDuplicates!0 (array!69179 (_ BitVec 32) List!23219) Bool)

(assert (=> b!1077465 (= res!717936 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23216))))

(declare-fun b!1077466 () Bool)

(declare-fun res!717938 () Bool)

(assert (=> b!1077466 (=> (not res!717938) (not e!616082))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69179 (_ BitVec 32)) Bool)

(assert (=> b!1077466 (= res!717938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1077467 () Bool)

(declare-fun e!616081 () Bool)

(declare-fun e!616078 () Bool)

(declare-fun mapRes!40912 () Bool)

(assert (=> b!1077467 (= e!616081 (and e!616078 mapRes!40912))))

(declare-fun condMapEmpty!40912 () Bool)

(declare-datatypes ((V!39945 0))(
  ( (V!39946 (val!13113 Int)) )
))
(declare-datatypes ((ValueCell!12347 0))(
  ( (ValueCellFull!12347 (v!15733 V!39945)) (EmptyCell!12347) )
))
(declare-datatypes ((array!69181 0))(
  ( (array!69182 (arr!33268 (Array (_ BitVec 32) ValueCell!12347)) (size!33804 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69181)

(declare-fun mapDefault!40912 () ValueCell!12347)

