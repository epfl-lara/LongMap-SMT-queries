; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111732 () Bool)

(assert start!111732)

(declare-fun b_free!30389 () Bool)

(declare-fun b_next!30389 () Bool)

(assert (=> start!111732 (= b_free!30389 (not b_next!30389))))

(declare-fun tp!106643 () Bool)

(declare-fun b_and!48927 () Bool)

(assert (=> start!111732 (= tp!106643 b_and!48927)))

(declare-fun b!1323964 () Bool)

(declare-fun e!754755 () Bool)

(declare-fun tp_is_empty!36209 () Bool)

(assert (=> b!1323964 (= e!754755 tp_is_empty!36209)))

(declare-fun b!1323966 () Bool)

(declare-fun res!878794 () Bool)

(declare-fun e!754759 () Bool)

(assert (=> b!1323966 (=> (not res!878794) (not e!754759))))

(declare-datatypes ((array!89334 0))(
  ( (array!89335 (arr!43141 (Array (_ BitVec 32) (_ BitVec 64))) (size!43691 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89334)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89334 (_ BitVec 32)) Bool)

(assert (=> b!1323966 (= res!878794 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1323967 () Bool)

(declare-fun e!754758 () Bool)

(declare-fun mapRes!55961 () Bool)

(assert (=> b!1323967 (= e!754758 (and e!754755 mapRes!55961))))

(declare-fun condMapEmpty!55961 () Bool)

(declare-datatypes ((V!53381 0))(
  ( (V!53382 (val!18179 Int)) )
))
(declare-datatypes ((ValueCell!17206 0))(
  ( (ValueCellFull!17206 (v!20809 V!53381)) (EmptyCell!17206) )
))
(declare-datatypes ((array!89336 0))(
  ( (array!89337 (arr!43142 (Array (_ BitVec 32) ValueCell!17206)) (size!43692 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89336)

(declare-fun mapDefault!55961 () ValueCell!17206)

