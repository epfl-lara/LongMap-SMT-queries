; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104622 () Bool)

(assert start!104622)

(declare-fun b!1247539 () Bool)

(declare-fun res!832417 () Bool)

(declare-fun e!707750 () Bool)

(assert (=> b!1247539 (=> (not res!832417) (not e!707750))))

(declare-datatypes ((array!80398 0))(
  ( (array!80399 (arr!38768 (Array (_ BitVec 32) (_ BitVec 64))) (size!39304 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80398)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80398 (_ BitVec 32)) Bool)

(assert (=> b!1247539 (= res!832417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1247540 () Bool)

(declare-fun e!707748 () Bool)

(declare-fun e!707752 () Bool)

(declare-fun mapRes!48781 () Bool)

(assert (=> b!1247540 (= e!707748 (and e!707752 mapRes!48781))))

(declare-fun condMapEmpty!48781 () Bool)

(declare-datatypes ((V!47167 0))(
  ( (V!47168 (val!15738 Int)) )
))
(declare-datatypes ((ValueCell!14912 0))(
  ( (ValueCellFull!14912 (v!18434 V!47167)) (EmptyCell!14912) )
))
(declare-datatypes ((array!80400 0))(
  ( (array!80401 (arr!38769 (Array (_ BitVec 32) ValueCell!14912)) (size!39305 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80400)

(declare-fun mapDefault!48781 () ValueCell!14912)

