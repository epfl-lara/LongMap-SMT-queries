; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111750 () Bool)

(assert start!111750)

(declare-fun b_free!30407 () Bool)

(declare-fun b_next!30407 () Bool)

(assert (=> start!111750 (= b_free!30407 (not b_next!30407))))

(declare-fun tp!106696 () Bool)

(declare-fun b_and!48945 () Bool)

(assert (=> start!111750 (= tp!106696 b_and!48945)))

(declare-fun b!1324180 () Bool)

(declare-fun res!878930 () Bool)

(declare-fun e!754893 () Bool)

(assert (=> b!1324180 (=> (not res!878930) (not e!754893))))

(declare-datatypes ((array!89370 0))(
  ( (array!89371 (arr!43159 (Array (_ BitVec 32) (_ BitVec 64))) (size!43709 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89370)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89370 (_ BitVec 32)) Bool)

(assert (=> b!1324180 (= res!878930 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1324181 () Bool)

(declare-fun e!754890 () Bool)

(declare-fun e!754891 () Bool)

(declare-fun mapRes!55988 () Bool)

(assert (=> b!1324181 (= e!754890 (and e!754891 mapRes!55988))))

(declare-fun condMapEmpty!55988 () Bool)

(declare-datatypes ((V!53405 0))(
  ( (V!53406 (val!18188 Int)) )
))
(declare-datatypes ((ValueCell!17215 0))(
  ( (ValueCellFull!17215 (v!20818 V!53405)) (EmptyCell!17215) )
))
(declare-datatypes ((array!89372 0))(
  ( (array!89373 (arr!43160 (Array (_ BitVec 32) ValueCell!17215)) (size!43710 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89372)

(declare-fun mapDefault!55988 () ValueCell!17215)

