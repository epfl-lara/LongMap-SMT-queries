; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84338 () Bool)

(assert start!84338)

(declare-fun res!660042 () Bool)

(declare-fun e!556272 () Bool)

(assert (=> start!84338 (=> (not res!660042) (not e!556272))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84338 (= res!660042 (validMask!0 mask!1948))))

(assert (=> start!84338 e!556272))

(assert (=> start!84338 true))

(declare-datatypes ((V!35837 0))(
  ( (V!35838 (val!11621 Int)) )
))
(declare-datatypes ((ValueCell!11089 0))(
  ( (ValueCellFull!11089 (v!14183 V!35837)) (EmptyCell!11089) )
))
(declare-datatypes ((array!62243 0))(
  ( (array!62244 (arr!29979 (Array (_ BitVec 32) ValueCell!11089)) (size!30458 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62243)

(declare-fun e!556270 () Bool)

(declare-fun array_inv!23169 (array!62243) Bool)

(assert (=> start!84338 (and (array_inv!23169 _values!1278) e!556270)))

(declare-datatypes ((array!62245 0))(
  ( (array!62246 (arr!29980 (Array (_ BitVec 32) (_ BitVec 64))) (size!30459 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62245)

(declare-fun array_inv!23170 (array!62245) Bool)

(assert (=> start!84338 (array_inv!23170 _keys!1544)))

(declare-fun b!986542 () Bool)

(declare-fun e!556268 () Bool)

(declare-fun mapRes!36740 () Bool)

(assert (=> b!986542 (= e!556270 (and e!556268 mapRes!36740))))

(declare-fun condMapEmpty!36740 () Bool)

(declare-fun mapDefault!36740 () ValueCell!11089)

