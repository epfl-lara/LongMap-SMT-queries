; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84340 () Bool)

(assert start!84340)

(declare-fun b!986560 () Bool)

(declare-fun e!556286 () Bool)

(declare-fun tp_is_empty!23143 () Bool)

(assert (=> b!986560 (= e!556286 tp_is_empty!23143)))

(declare-fun b!986561 () Bool)

(declare-fun res!660051 () Bool)

(declare-fun e!556283 () Bool)

(assert (=> b!986561 (=> (not res!660051) (not e!556283))))

(declare-datatypes ((array!62247 0))(
  ( (array!62248 (arr!29981 (Array (_ BitVec 32) (_ BitVec 64))) (size!30460 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62247)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62247 (_ BitVec 32)) Bool)

(assert (=> b!986561 (= res!660051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!36743 () Bool)

(declare-fun mapRes!36743 () Bool)

(declare-fun tp!69598 () Bool)

(declare-fun e!556285 () Bool)

(assert (=> mapNonEmpty!36743 (= mapRes!36743 (and tp!69598 e!556285))))

(declare-datatypes ((V!35841 0))(
  ( (V!35842 (val!11622 Int)) )
))
(declare-datatypes ((ValueCell!11090 0))(
  ( (ValueCellFull!11090 (v!14184 V!35841)) (EmptyCell!11090) )
))
(declare-datatypes ((array!62249 0))(
  ( (array!62250 (arr!29982 (Array (_ BitVec 32) ValueCell!11090)) (size!30461 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62249)

(declare-fun mapValue!36743 () ValueCell!11090)

(declare-fun mapKey!36743 () (_ BitVec 32))

(declare-fun mapRest!36743 () (Array (_ BitVec 32) ValueCell!11090))

(assert (=> mapNonEmpty!36743 (= (arr!29982 _values!1278) (store mapRest!36743 mapKey!36743 mapValue!36743))))

(declare-fun res!660052 () Bool)

(assert (=> start!84340 (=> (not res!660052) (not e!556283))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84340 (= res!660052 (validMask!0 mask!1948))))

(assert (=> start!84340 e!556283))

(assert (=> start!84340 true))

(declare-fun e!556284 () Bool)

(declare-fun array_inv!23171 (array!62249) Bool)

(assert (=> start!84340 (and (array_inv!23171 _values!1278) e!556284)))

(declare-fun array_inv!23172 (array!62247) Bool)

(assert (=> start!84340 (array_inv!23172 _keys!1544)))

(declare-fun b!986562 () Bool)

(assert (=> b!986562 (= e!556285 tp_is_empty!23143)))

(declare-fun b!986563 () Bool)

(assert (=> b!986563 (= e!556284 (and e!556286 mapRes!36743))))

(declare-fun condMapEmpty!36743 () Bool)

(declare-fun mapDefault!36743 () ValueCell!11090)

