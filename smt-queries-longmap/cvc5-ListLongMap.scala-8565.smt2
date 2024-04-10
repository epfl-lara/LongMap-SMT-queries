; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104586 () Bool)

(assert start!104586)

(declare-fun res!832271 () Bool)

(declare-fun e!707534 () Bool)

(assert (=> start!104586 (=> (not res!832271) (not e!707534))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104586 (= res!832271 (validMask!0 mask!1466))))

(assert (=> start!104586 e!707534))

(assert (=> start!104586 true))

(declare-datatypes ((array!80348 0))(
  ( (array!80349 (arr!38744 (Array (_ BitVec 32) (_ BitVec 64))) (size!39280 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80348)

(declare-fun array_inv!29587 (array!80348) Bool)

(assert (=> start!104586 (array_inv!29587 _keys!1118)))

(declare-datatypes ((V!47135 0))(
  ( (V!47136 (val!15726 Int)) )
))
(declare-datatypes ((ValueCell!14900 0))(
  ( (ValueCellFull!14900 (v!18421 V!47135)) (EmptyCell!14900) )
))
(declare-datatypes ((array!80350 0))(
  ( (array!80351 (arr!38745 (Array (_ BitVec 32) ValueCell!14900)) (size!39281 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80350)

(declare-fun e!707536 () Bool)

(declare-fun array_inv!29588 (array!80350) Bool)

(assert (=> start!104586 (and (array_inv!29588 _values!914) e!707536)))

(declare-fun b!1247268 () Bool)

(declare-fun e!707537 () Bool)

(declare-fun mapRes!48742 () Bool)

(assert (=> b!1247268 (= e!707536 (and e!707537 mapRes!48742))))

(declare-fun condMapEmpty!48742 () Bool)

(declare-fun mapDefault!48742 () ValueCell!14900)

