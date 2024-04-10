; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84316 () Bool)

(assert start!84316)

(declare-fun b!986344 () Bool)

(declare-fun res!659944 () Bool)

(declare-fun e!556107 () Bool)

(assert (=> b!986344 (=> (not res!659944) (not e!556107))))

(declare-datatypes ((array!62205 0))(
  ( (array!62206 (arr!29960 (Array (_ BitVec 32) (_ BitVec 64))) (size!30439 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62205)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62205 (_ BitVec 32)) Bool)

(assert (=> b!986344 (= res!659944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!986345 () Bool)

(declare-fun e!556104 () Bool)

(declare-fun e!556105 () Bool)

(declare-fun mapRes!36707 () Bool)

(assert (=> b!986345 (= e!556104 (and e!556105 mapRes!36707))))

(declare-fun condMapEmpty!36707 () Bool)

(declare-datatypes ((V!35809 0))(
  ( (V!35810 (val!11610 Int)) )
))
(declare-datatypes ((ValueCell!11078 0))(
  ( (ValueCellFull!11078 (v!14172 V!35809)) (EmptyCell!11078) )
))
(declare-datatypes ((array!62207 0))(
  ( (array!62208 (arr!29961 (Array (_ BitVec 32) ValueCell!11078)) (size!30440 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62207)

(declare-fun mapDefault!36707 () ValueCell!11078)

