; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84666 () Bool)

(assert start!84666)

(declare-fun b_free!20077 () Bool)

(declare-fun b_next!20077 () Bool)

(assert (=> start!84666 (= b_free!20077 (not b_next!20077))))

(declare-fun tp!70026 () Bool)

(declare-fun b_and!32225 () Bool)

(assert (=> start!84666 (= tp!70026 b_and!32225)))

(declare-fun b!990200 () Bool)

(declare-fun res!662138 () Bool)

(declare-fun e!558341 () Bool)

(assert (=> b!990200 (=> (not res!662138) (not e!558341))))

(declare-datatypes ((array!62547 0))(
  ( (array!62548 (arr!30125 (Array (_ BitVec 32) (_ BitVec 64))) (size!30604 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62547)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!990200 (= res!662138 (validKeyInArray!0 (select (arr!30125 _keys!1544) from!1932)))))

(declare-fun mapIsEmpty!36988 () Bool)

(declare-fun mapRes!36988 () Bool)

(assert (=> mapIsEmpty!36988 mapRes!36988))

(declare-fun b!990201 () Bool)

(declare-fun e!558345 () Bool)

(declare-fun e!558342 () Bool)

(assert (=> b!990201 (= e!558345 (and e!558342 mapRes!36988))))

(declare-fun condMapEmpty!36988 () Bool)

(declare-datatypes ((V!36041 0))(
  ( (V!36042 (val!11697 Int)) )
))
(declare-datatypes ((ValueCell!11165 0))(
  ( (ValueCellFull!11165 (v!14267 V!36041)) (EmptyCell!11165) )
))
(declare-datatypes ((array!62549 0))(
  ( (array!62550 (arr!30126 (Array (_ BitVec 32) ValueCell!11165)) (size!30605 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62549)

(declare-fun mapDefault!36988 () ValueCell!11165)

