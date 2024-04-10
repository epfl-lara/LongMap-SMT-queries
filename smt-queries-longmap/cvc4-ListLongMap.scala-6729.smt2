; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84350 () Bool)

(assert start!84350)

(declare-fun b!986650 () Bool)

(declare-fun e!556359 () Bool)

(declare-fun tp_is_empty!23153 () Bool)

(assert (=> b!986650 (= e!556359 tp_is_empty!23153)))

(declare-fun res!660098 () Bool)

(declare-fun e!556358 () Bool)

(assert (=> start!84350 (=> (not res!660098) (not e!556358))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84350 (= res!660098 (validMask!0 mask!1948))))

(assert (=> start!84350 e!556358))

(assert (=> start!84350 true))

(declare-datatypes ((V!35853 0))(
  ( (V!35854 (val!11627 Int)) )
))
(declare-datatypes ((ValueCell!11095 0))(
  ( (ValueCellFull!11095 (v!14189 V!35853)) (EmptyCell!11095) )
))
(declare-datatypes ((array!62267 0))(
  ( (array!62268 (arr!29991 (Array (_ BitVec 32) ValueCell!11095)) (size!30470 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62267)

(declare-fun e!556362 () Bool)

(declare-fun array_inv!23179 (array!62267) Bool)

(assert (=> start!84350 (and (array_inv!23179 _values!1278) e!556362)))

(declare-datatypes ((array!62269 0))(
  ( (array!62270 (arr!29992 (Array (_ BitVec 32) (_ BitVec 64))) (size!30471 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62269)

(declare-fun array_inv!23180 (array!62269) Bool)

(assert (=> start!84350 (array_inv!23180 _keys!1544)))

(declare-fun b!986651 () Bool)

(declare-fun e!556360 () Bool)

(declare-fun mapRes!36758 () Bool)

(assert (=> b!986651 (= e!556362 (and e!556360 mapRes!36758))))

(declare-fun condMapEmpty!36758 () Bool)

(declare-fun mapDefault!36758 () ValueCell!11095)

