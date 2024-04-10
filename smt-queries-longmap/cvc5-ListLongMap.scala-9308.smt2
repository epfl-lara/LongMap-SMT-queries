; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111262 () Bool)

(assert start!111262)

(declare-fun b!1316903 () Bool)

(declare-fun res!874098 () Bool)

(declare-fun e!751337 () Bool)

(assert (=> b!1316903 (=> (not res!874098) (not e!751337))))

(declare-datatypes ((array!88484 0))(
  ( (array!88485 (arr!42718 (Array (_ BitVec 32) (_ BitVec 64))) (size!43268 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88484)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!52785 0))(
  ( (V!52786 (val!17955 Int)) )
))
(declare-datatypes ((ValueCell!16982 0))(
  ( (ValueCellFull!16982 (v!20584 V!52785)) (EmptyCell!16982) )
))
(declare-datatypes ((array!88486 0))(
  ( (array!88487 (arr!42719 (Array (_ BitVec 32) ValueCell!16982)) (size!43269 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88486)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1316903 (= res!874098 (and (= (size!43269 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43268 _keys!1609) (size!43269 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1316904 () Bool)

(declare-fun e!751339 () Bool)

(declare-fun e!751336 () Bool)

(declare-fun mapRes!55283 () Bool)

(assert (=> b!1316904 (= e!751339 (and e!751336 mapRes!55283))))

(declare-fun condMapEmpty!55283 () Bool)

(declare-fun mapDefault!55283 () ValueCell!16982)

