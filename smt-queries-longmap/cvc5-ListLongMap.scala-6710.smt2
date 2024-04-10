; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84232 () Bool)

(assert start!84232)

(declare-fun b_free!19933 () Bool)

(declare-fun b_next!19933 () Bool)

(assert (=> start!84232 (= b_free!19933 (not b_next!19933))))

(declare-fun tp!69403 () Bool)

(declare-fun b_and!31943 () Bool)

(assert (=> start!84232 (= tp!69403 b_and!31943)))

(declare-fun b!985367 () Bool)

(declare-fun res!659370 () Bool)

(declare-fun e!555439 () Bool)

(assert (=> b!985367 (=> (not res!659370) (not e!555439))))

(declare-datatypes ((array!62045 0))(
  ( (array!62046 (arr!29880 (Array (_ BitVec 32) (_ BitVec 64))) (size!30359 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62045)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62045 (_ BitVec 32)) Bool)

(assert (=> b!985367 (= res!659370 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!985368 () Bool)

(declare-fun e!555444 () Bool)

(assert (=> b!985368 (= e!555439 e!555444)))

(declare-fun res!659375 () Bool)

(assert (=> b!985368 (=> (not res!659375) (not e!555444))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!985368 (= res!659375 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29880 _keys!1544) from!1932))))))

(declare-datatypes ((V!35697 0))(
  ( (V!35698 (val!11568 Int)) )
))
(declare-datatypes ((ValueCell!11036 0))(
  ( (ValueCellFull!11036 (v!14130 V!35697)) (EmptyCell!11036) )
))
(declare-datatypes ((array!62047 0))(
  ( (array!62048 (arr!29881 (Array (_ BitVec 32) ValueCell!11036)) (size!30360 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62047)

(declare-fun defaultEntry!1281 () Int)

(declare-fun lt!437214 () V!35697)

(declare-fun get!15509 (ValueCell!11036 V!35697) V!35697)

(declare-fun dynLambda!1836 (Int (_ BitVec 64)) V!35697)

(assert (=> b!985368 (= lt!437214 (get!15509 (select (arr!29881 _values!1278) from!1932) (dynLambda!1836 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35697)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35697)

(declare-datatypes ((tuple2!14802 0))(
  ( (tuple2!14803 (_1!7412 (_ BitVec 64)) (_2!7412 V!35697)) )
))
(declare-datatypes ((List!20694 0))(
  ( (Nil!20691) (Cons!20690 (h!21852 tuple2!14802) (t!29571 List!20694)) )
))
(declare-datatypes ((ListLongMap!13499 0))(
  ( (ListLongMap!13500 (toList!6765 List!20694)) )
))
(declare-fun lt!437215 () ListLongMap!13499)

(declare-fun getCurrentListMapNoExtraKeys!3456 (array!62045 array!62047 (_ BitVec 32) (_ BitVec 32) V!35697 V!35697 (_ BitVec 32) Int) ListLongMap!13499)

(assert (=> b!985368 (= lt!437215 (getCurrentListMapNoExtraKeys!3456 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun mapNonEmpty!36581 () Bool)

(declare-fun mapRes!36581 () Bool)

(declare-fun tp!69402 () Bool)

(declare-fun e!555442 () Bool)

(assert (=> mapNonEmpty!36581 (= mapRes!36581 (and tp!69402 e!555442))))

(declare-fun mapKey!36581 () (_ BitVec 32))

(declare-fun mapValue!36581 () ValueCell!11036)

(declare-fun mapRest!36581 () (Array (_ BitVec 32) ValueCell!11036))

(assert (=> mapNonEmpty!36581 (= (arr!29881 _values!1278) (store mapRest!36581 mapKey!36581 mapValue!36581))))

(declare-fun b!985369 () Bool)

(declare-fun e!555440 () Bool)

(declare-fun e!555443 () Bool)

(assert (=> b!985369 (= e!555440 (and e!555443 mapRes!36581))))

(declare-fun condMapEmpty!36581 () Bool)

(declare-fun mapDefault!36581 () ValueCell!11036)

