; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84008 () Bool)

(assert start!84008)

(declare-fun b_free!19763 () Bool)

(declare-fun b_next!19763 () Bool)

(assert (=> start!84008 (= b_free!19763 (not b_next!19763))))

(declare-fun tp!68811 () Bool)

(declare-fun b_and!31609 () Bool)

(assert (=> start!84008 (= tp!68811 b_and!31609)))

(declare-fun mapIsEmpty!36245 () Bool)

(declare-fun mapRes!36245 () Bool)

(assert (=> mapIsEmpty!36245 mapRes!36245))

(declare-fun b!981894 () Bool)

(declare-fun res!657073 () Bool)

(declare-fun e!553515 () Bool)

(assert (=> b!981894 (=> (not res!657073) (not e!553515))))

(declare-datatypes ((array!61617 0))(
  ( (array!61618 (arr!29666 (Array (_ BitVec 32) (_ BitVec 64))) (size!30145 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61617)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!981894 (= res!657073 (validKeyInArray!0 (select (arr!29666 _keys!1544) from!1932)))))

(declare-fun b!981895 () Bool)

(declare-fun res!657070 () Bool)

(assert (=> b!981895 (=> (not res!657070) (not e!553515))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35397 0))(
  ( (V!35398 (val!11456 Int)) )
))
(declare-datatypes ((ValueCell!10924 0))(
  ( (ValueCellFull!10924 (v!14018 V!35397)) (EmptyCell!10924) )
))
(declare-datatypes ((array!61619 0))(
  ( (array!61620 (arr!29667 (Array (_ BitVec 32) ValueCell!10924)) (size!30146 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61619)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!981895 (= res!657070 (and (= (size!30146 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30145 _keys!1544) (size!30146 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!981896 () Bool)

(declare-fun e!553517 () Bool)

(assert (=> b!981896 (= e!553515 e!553517)))

(declare-fun res!657071 () Bool)

(assert (=> b!981896 (=> (not res!657071) (not e!553517))))

(assert (=> b!981896 (= res!657071 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29666 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun lt!435902 () V!35397)

(declare-fun get!15378 (ValueCell!10924 V!35397) V!35397)

(declare-fun dynLambda!1781 (Int (_ BitVec 64)) V!35397)

(assert (=> b!981896 (= lt!435902 (get!15378 (select (arr!29667 _values!1278) from!1932) (dynLambda!1781 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35397)

(declare-datatypes ((tuple2!14668 0))(
  ( (tuple2!14669 (_1!7345 (_ BitVec 64)) (_2!7345 V!35397)) )
))
(declare-datatypes ((List!20550 0))(
  ( (Nil!20547) (Cons!20546 (h!21708 tuple2!14668) (t!29263 List!20550)) )
))
(declare-datatypes ((ListLongMap!13365 0))(
  ( (ListLongMap!13366 (toList!6698 List!20550)) )
))
(declare-fun lt!435903 () ListLongMap!13365)

(declare-fun zeroValue!1220 () V!35397)

(declare-fun getCurrentListMapNoExtraKeys!3398 (array!61617 array!61619 (_ BitVec 32) (_ BitVec 32) V!35397 V!35397 (_ BitVec 32) Int) ListLongMap!13365)

(assert (=> b!981896 (= lt!435903 (getCurrentListMapNoExtraKeys!3398 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!981897 () Bool)

(declare-fun e!553514 () Bool)

(declare-fun e!553513 () Bool)

(assert (=> b!981897 (= e!553514 (and e!553513 mapRes!36245))))

(declare-fun condMapEmpty!36245 () Bool)

(declare-fun mapDefault!36245 () ValueCell!10924)

