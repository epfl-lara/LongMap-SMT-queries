; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84104 () Bool)

(assert start!84104)

(declare-fun res!658090 () Bool)

(declare-fun e!554351 () Bool)

(assert (=> start!84104 (=> (not res!658090) (not e!554351))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84104 (= res!658090 (validMask!0 mask!1948))))

(assert (=> start!84104 e!554351))

(assert (=> start!84104 true))

(declare-datatypes ((V!35525 0))(
  ( (V!35526 (val!11504 Int)) )
))
(declare-datatypes ((ValueCell!10972 0))(
  ( (ValueCellFull!10972 (v!14066 V!35525)) (EmptyCell!10972) )
))
(declare-datatypes ((array!61801 0))(
  ( (array!61802 (arr!29758 (Array (_ BitVec 32) ValueCell!10972)) (size!30237 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61801)

(declare-fun e!554353 () Bool)

(declare-fun array_inv!23009 (array!61801) Bool)

(assert (=> start!84104 (and (array_inv!23009 _values!1278) e!554353)))

(declare-datatypes ((array!61803 0))(
  ( (array!61804 (arr!29759 (Array (_ BitVec 32) (_ BitVec 64))) (size!30238 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61803)

(declare-fun array_inv!23010 (array!61803) Bool)

(assert (=> start!84104 (array_inv!23010 _keys!1544)))

(declare-fun mapIsEmpty!36389 () Bool)

(declare-fun mapRes!36389 () Bool)

(assert (=> mapIsEmpty!36389 mapRes!36389))

(declare-fun b!983428 () Bool)

(declare-fun e!554354 () Bool)

(assert (=> b!983428 (= e!554353 (and e!554354 mapRes!36389))))

(declare-fun condMapEmpty!36389 () Bool)

(declare-fun mapDefault!36389 () ValueCell!10972)

