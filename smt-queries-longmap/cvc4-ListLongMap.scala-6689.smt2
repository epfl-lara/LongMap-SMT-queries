; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84110 () Bool)

(assert start!84110)

(declare-fun res!658117 () Bool)

(declare-fun e!554397 () Bool)

(assert (=> start!84110 (=> (not res!658117) (not e!554397))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84110 (= res!658117 (validMask!0 mask!1948))))

(assert (=> start!84110 e!554397))

(assert (=> start!84110 true))

(declare-datatypes ((V!35533 0))(
  ( (V!35534 (val!11507 Int)) )
))
(declare-datatypes ((ValueCell!10975 0))(
  ( (ValueCellFull!10975 (v!14069 V!35533)) (EmptyCell!10975) )
))
(declare-datatypes ((array!61813 0))(
  ( (array!61814 (arr!29764 (Array (_ BitVec 32) ValueCell!10975)) (size!30243 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61813)

(declare-fun e!554398 () Bool)

(declare-fun array_inv!23015 (array!61813) Bool)

(assert (=> start!84110 (and (array_inv!23015 _values!1278) e!554398)))

(declare-datatypes ((array!61815 0))(
  ( (array!61816 (arr!29765 (Array (_ BitVec 32) (_ BitVec 64))) (size!30244 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61815)

(declare-fun array_inv!23016 (array!61815) Bool)

(assert (=> start!84110 (array_inv!23016 _keys!1544)))

(declare-fun b!983482 () Bool)

(declare-fun res!658116 () Bool)

(assert (=> b!983482 (=> (not res!658116) (not e!554397))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61815 (_ BitVec 32)) Bool)

(assert (=> b!983482 (= res!658116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!983483 () Bool)

(declare-fun e!554396 () Bool)

(declare-fun mapRes!36398 () Bool)

(assert (=> b!983483 (= e!554398 (and e!554396 mapRes!36398))))

(declare-fun condMapEmpty!36398 () Bool)

(declare-fun mapDefault!36398 () ValueCell!10975)

