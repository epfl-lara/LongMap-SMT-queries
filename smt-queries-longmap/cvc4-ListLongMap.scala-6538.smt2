; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83116 () Bool)

(assert start!83116)

(declare-fun b_free!19109 () Bool)

(declare-fun b_next!19109 () Bool)

(assert (=> start!83116 (= b_free!19109 (not b_next!19109))))

(declare-fun tp!66605 () Bool)

(declare-fun b_and!30597 () Bool)

(assert (=> start!83116 (= tp!66605 b_and!30597)))

(declare-fun b!969566 () Bool)

(declare-fun res!648948 () Bool)

(declare-fun e!546616 () Bool)

(assert (=> b!969566 (=> (not res!648948) (not e!546616))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34325 0))(
  ( (V!34326 (val!11054 Int)) )
))
(declare-datatypes ((ValueCell!10522 0))(
  ( (ValueCellFull!10522 (v!13613 V!34325)) (EmptyCell!10522) )
))
(declare-datatypes ((array!60079 0))(
  ( (array!60080 (arr!28903 (Array (_ BitVec 32) ValueCell!10522)) (size!29382 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60079)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60081 0))(
  ( (array!60082 (arr!28904 (Array (_ BitVec 32) (_ BitVec 64))) (size!29383 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60081)

(assert (=> b!969566 (= res!648948 (and (= (size!29382 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29383 _keys!1717) (size!29382 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!969567 () Bool)

(declare-fun e!546615 () Bool)

(declare-fun e!546619 () Bool)

(declare-fun mapRes!35020 () Bool)

(assert (=> b!969567 (= e!546615 (and e!546619 mapRes!35020))))

(declare-fun condMapEmpty!35020 () Bool)

(declare-fun mapDefault!35020 () ValueCell!10522)

