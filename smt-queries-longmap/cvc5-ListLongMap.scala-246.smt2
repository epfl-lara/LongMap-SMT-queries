; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4158 () Bool)

(assert start!4158)

(declare-fun b_free!1063 () Bool)

(declare-fun b_next!1063 () Bool)

(assert (=> start!4158 (= b_free!1063 (not b_next!1063))))

(declare-fun tp!4609 () Bool)

(declare-fun b_and!1873 () Bool)

(assert (=> start!4158 (= tp!4609 b_and!1873)))

(declare-fun b!31349 () Bool)

(declare-fun res!18984 () Bool)

(declare-fun e!20036 () Bool)

(assert (=> b!31349 (=> (not res!18984) (not e!20036))))

(declare-datatypes ((V!1715 0))(
  ( (V!1716 (val!735 Int)) )
))
(declare-datatypes ((ValueCell!509 0))(
  ( (ValueCellFull!509 (v!1824 V!1715)) (EmptyCell!509) )
))
(declare-datatypes ((array!2055 0))(
  ( (array!2056 (arr!981 (Array (_ BitVec 32) ValueCell!509)) (size!1082 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2055)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!2057 0))(
  ( (array!2058 (arr!982 (Array (_ BitVec 32) (_ BitVec 64))) (size!1083 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2057)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!31349 (= res!18984 (and (= (size!1082 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1083 _keys!1833) (size!1082 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!31350 () Bool)

(declare-fun res!18983 () Bool)

(assert (=> b!31350 (=> (not res!18983) (not e!20036))))

(declare-datatypes ((List!796 0))(
  ( (Nil!793) (Cons!792 (h!1359 (_ BitVec 64)) (t!3489 List!796)) )
))
(declare-fun arrayNoDuplicates!0 (array!2057 (_ BitVec 32) List!796) Bool)

(assert (=> b!31350 (= res!18983 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!793))))

(declare-fun b!31351 () Bool)

(declare-fun e!20038 () Bool)

(declare-fun tp_is_empty!1417 () Bool)

(assert (=> b!31351 (= e!20038 tp_is_empty!1417)))

(declare-fun b!31352 () Bool)

(declare-fun res!18987 () Bool)

(assert (=> b!31352 (=> (not res!18987) (not e!20036))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2057 (_ BitVec 32)) Bool)

(assert (=> b!31352 (= res!18987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!31353 () Bool)

(declare-fun e!20037 () Bool)

(declare-fun e!20039 () Bool)

(declare-fun mapRes!1654 () Bool)

(assert (=> b!31353 (= e!20037 (and e!20039 mapRes!1654))))

(declare-fun condMapEmpty!1654 () Bool)

(declare-fun mapDefault!1654 () ValueCell!509)

