; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3806 () Bool)

(assert start!3806)

(declare-fun b!26664 () Bool)

(declare-fun res!15815 () Bool)

(declare-fun e!17399 () Bool)

(assert (=> b!26664 (=> (not res!15815) (not e!17399))))

(declare-datatypes ((array!1493 0))(
  ( (array!1494 (arr!704 (Array (_ BitVec 32) (_ BitVec 64))) (size!805 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1493)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1493 (_ BitVec 32)) Bool)

(assert (=> b!26664 (= res!15815 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun res!15816 () Bool)

(assert (=> start!3806 (=> (not res!15816) (not e!17399))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3806 (= res!15816 (validMask!0 mask!2294))))

(assert (=> start!3806 e!17399))

(assert (=> start!3806 true))

(declare-datatypes ((V!1327 0))(
  ( (V!1328 (val!590 Int)) )
))
(declare-datatypes ((ValueCell!364 0))(
  ( (ValueCellFull!364 (v!1676 V!1327)) (EmptyCell!364) )
))
(declare-datatypes ((array!1495 0))(
  ( (array!1496 (arr!705 (Array (_ BitVec 32) ValueCell!364)) (size!806 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1495)

(declare-fun e!17395 () Bool)

(declare-fun array_inv!485 (array!1495) Bool)

(assert (=> start!3806 (and (array_inv!485 _values!1501) e!17395)))

(declare-fun array_inv!486 (array!1493) Bool)

(assert (=> start!3806 (array_inv!486 _keys!1833)))

(declare-fun b!26665 () Bool)

(declare-fun e!17397 () Bool)

(declare-fun mapRes!1207 () Bool)

(assert (=> b!26665 (= e!17395 (and e!17397 mapRes!1207))))

(declare-fun condMapEmpty!1207 () Bool)

(declare-fun mapDefault!1207 () ValueCell!364)

