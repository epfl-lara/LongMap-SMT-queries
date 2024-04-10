; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84532 () Bool)

(assert start!84532)

(declare-fun b_free!20027 () Bool)

(declare-fun b_next!20027 () Bool)

(assert (=> start!84532 (= b_free!20027 (not b_next!20027))))

(declare-fun tp!69866 () Bool)

(declare-fun b_and!32121 () Bool)

(assert (=> start!84532 (= tp!69866 b_and!32121)))

(declare-fun b!988732 () Bool)

(declare-fun res!661306 () Bool)

(declare-fun e!557521 () Bool)

(assert (=> b!988732 (=> (not res!661306) (not e!557521))))

(declare-datatypes ((array!62445 0))(
  ( (array!62446 (arr!30077 (Array (_ BitVec 32) (_ BitVec 64))) (size!30556 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62445)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!988732 (= res!661306 (validKeyInArray!0 (select (arr!30077 _keys!1544) from!1932)))))

(declare-fun b!988733 () Bool)

(assert (=> b!988733 (= e!557521 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!30077 _keys!1544) from!1932)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35973 0))(
  ( (V!35974 (val!11672 Int)) )
))
(declare-fun minValue!1220 () V!35973)

(declare-datatypes ((ValueCell!11140 0))(
  ( (ValueCellFull!11140 (v!14239 V!35973)) (EmptyCell!11140) )
))
(declare-datatypes ((array!62447 0))(
  ( (array!62448 (arr!30078 (Array (_ BitVec 32) ValueCell!11140)) (size!30557 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62447)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((tuple2!14874 0))(
  ( (tuple2!14875 (_1!7448 (_ BitVec 64)) (_2!7448 V!35973)) )
))
(declare-datatypes ((List!20804 0))(
  ( (Nil!20801) (Cons!20800 (h!21962 tuple2!14874) (t!29741 List!20804)) )
))
(declare-datatypes ((ListLongMap!13571 0))(
  ( (ListLongMap!13572 (toList!6801 List!20804)) )
))
(declare-fun lt!438547 () ListLongMap!13571)

(declare-fun zeroValue!1220 () V!35973)

(declare-fun defaultEntry!1281 () Int)

(declare-fun getCurrentListMapNoExtraKeys!3492 (array!62445 array!62447 (_ BitVec 32) (_ BitVec 32) V!35973 V!35973 (_ BitVec 32) Int) ListLongMap!13571)

(assert (=> b!988733 (= lt!438547 (getCurrentListMapNoExtraKeys!3492 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!988734 () Bool)

(declare-fun e!557523 () Bool)

(declare-fun e!557520 () Bool)

(declare-fun mapRes!36903 () Bool)

(assert (=> b!988734 (= e!557523 (and e!557520 mapRes!36903))))

(declare-fun condMapEmpty!36903 () Bool)

(declare-fun mapDefault!36903 () ValueCell!11140)

