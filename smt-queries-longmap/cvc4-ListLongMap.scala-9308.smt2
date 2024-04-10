; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111266 () Bool)

(assert start!111266)

(declare-fun mapIsEmpty!55289 () Bool)

(declare-fun mapRes!55289 () Bool)

(assert (=> mapIsEmpty!55289 mapRes!55289))

(declare-fun b!1316945 () Bool)

(declare-fun e!751366 () Bool)

(declare-fun e!751369 () Bool)

(assert (=> b!1316945 (= e!751366 (and e!751369 mapRes!55289))))

(declare-fun condMapEmpty!55289 () Bool)

(declare-datatypes ((V!52789 0))(
  ( (V!52790 (val!17957 Int)) )
))
(declare-datatypes ((ValueCell!16984 0))(
  ( (ValueCellFull!16984 (v!20586 V!52789)) (EmptyCell!16984) )
))
(declare-datatypes ((array!88492 0))(
  ( (array!88493 (arr!42722 (Array (_ BitVec 32) ValueCell!16984)) (size!43272 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88492)

(declare-fun mapDefault!55289 () ValueCell!16984)

