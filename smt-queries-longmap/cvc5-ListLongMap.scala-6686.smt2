; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84088 () Bool)

(assert start!84088)

(declare-fun b!983284 () Bool)

(declare-fun res!658019 () Bool)

(declare-fun e!554235 () Bool)

(assert (=> b!983284 (=> (not res!658019) (not e!554235))))

(declare-datatypes ((V!35505 0))(
  ( (V!35506 (val!11496 Int)) )
))
(declare-datatypes ((ValueCell!10964 0))(
  ( (ValueCellFull!10964 (v!14058 V!35505)) (EmptyCell!10964) )
))
(declare-datatypes ((array!61771 0))(
  ( (array!61772 (arr!29743 (Array (_ BitVec 32) ValueCell!10964)) (size!30222 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61771)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61773 0))(
  ( (array!61774 (arr!29744 (Array (_ BitVec 32) (_ BitVec 64))) (size!30223 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61773)

(declare-fun mask!1948 () (_ BitVec 32))

(assert (=> b!983284 (= res!658019 (and (= (size!30222 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30223 _keys!1544) (size!30222 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!983286 () Bool)

(declare-fun e!554234 () Bool)

(declare-fun e!554231 () Bool)

(declare-fun mapRes!36365 () Bool)

(assert (=> b!983286 (= e!554234 (and e!554231 mapRes!36365))))

(declare-fun condMapEmpty!36365 () Bool)

(declare-fun mapDefault!36365 () ValueCell!10964)

