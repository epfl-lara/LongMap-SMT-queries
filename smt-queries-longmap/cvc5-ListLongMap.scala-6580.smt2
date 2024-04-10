; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83364 () Bool)

(assert start!83364)

(declare-fun b_free!19357 () Bool)

(declare-fun b_next!19357 () Bool)

(assert (=> start!83364 (= b_free!19357 (not b_next!19357))))

(declare-fun tp!67350 () Bool)

(declare-fun b_and!30935 () Bool)

(assert (=> start!83364 (= tp!67350 b_and!30935)))

(declare-fun b!973386 () Bool)

(declare-fun e!548659 () Bool)

(assert (=> b!973386 (= e!548659 (not true))))

(declare-datatypes ((array!60551 0))(
  ( (array!60552 (arr!29139 (Array (_ BitVec 32) (_ BitVec 64))) (size!29618 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60551)

(declare-datatypes ((V!34657 0))(
  ( (V!34658 (val!11178 Int)) )
))
(declare-datatypes ((tuple2!14350 0))(
  ( (tuple2!14351 (_1!7186 (_ BitVec 64)) (_2!7186 V!34657)) )
))
(declare-fun lt!432473 () tuple2!14350)

(declare-datatypes ((List!20211 0))(
  ( (Nil!20208) (Cons!20207 (h!21369 tuple2!14350) (t!28666 List!20211)) )
))
(declare-datatypes ((ListLongMap!13047 0))(
  ( (ListLongMap!13048 (toList!6539 List!20211)) )
))
(declare-fun lt!432470 () ListLongMap!13047)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun contains!5632 (ListLongMap!13047 (_ BitVec 64)) Bool)

(declare-fun +!2906 (ListLongMap!13047 tuple2!14350) ListLongMap!13047)

(assert (=> b!973386 (contains!5632 (+!2906 lt!432470 lt!432473) (select (arr!29139 _keys!1717) i!822))))

(declare-fun lt!432468 () V!34657)

(declare-fun lt!432467 () (_ BitVec 64))

(declare-datatypes ((Unit!32433 0))(
  ( (Unit!32434) )
))
(declare-fun lt!432471 () Unit!32433)

(declare-fun addStillContains!602 (ListLongMap!13047 (_ BitVec 64) V!34657 (_ BitVec 64)) Unit!32433)

(assert (=> b!973386 (= lt!432471 (addStillContains!602 lt!432470 lt!432467 lt!432468 (select (arr!29139 _keys!1717) i!822)))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun lt!432472 () ListLongMap!13047)

(declare-datatypes ((ValueCell!10646 0))(
  ( (ValueCellFull!10646 (v!13737 V!34657)) (EmptyCell!10646) )
))
(declare-datatypes ((array!60553 0))(
  ( (array!60554 (arr!29140 (Array (_ BitVec 32) ValueCell!10646)) (size!29619 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60553)

(declare-fun zeroValue!1367 () V!34657)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34657)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3772 (array!60551 array!60553 (_ BitVec 32) (_ BitVec 32) V!34657 V!34657 (_ BitVec 32) Int) ListLongMap!13047)

(assert (=> b!973386 (= lt!432472 (+!2906 (getCurrentListMap!3772 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) lt!432473))))

(assert (=> b!973386 (= lt!432473 (tuple2!14351 lt!432467 lt!432468))))

(declare-fun get!15105 (ValueCell!10646 V!34657) V!34657)

(declare-fun dynLambda!1695 (Int (_ BitVec 64)) V!34657)

(assert (=> b!973386 (= lt!432468 (get!15105 (select (arr!29140 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1695 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!432469 () Unit!32433)

(declare-fun lemmaListMapRecursiveValidKeyArray!272 (array!60551 array!60553 (_ BitVec 32) (_ BitVec 32) V!34657 V!34657 (_ BitVec 32) Int) Unit!32433)

(assert (=> b!973386 (= lt!432469 (lemmaListMapRecursiveValidKeyArray!272 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973387 () Bool)

(declare-fun e!548664 () Bool)

(assert (=> b!973387 (= e!548664 e!548659)))

(declare-fun res!651564 () Bool)

(assert (=> b!973387 (=> (not res!651564) (not e!548659))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!973387 (= res!651564 (validKeyInArray!0 lt!432467))))

(assert (=> b!973387 (= lt!432467 (select (arr!29139 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!973387 (= lt!432472 (getCurrentListMap!3772 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun mapIsEmpty!35392 () Bool)

(declare-fun mapRes!35392 () Bool)

(assert (=> mapIsEmpty!35392 mapRes!35392))

(declare-fun b!973388 () Bool)

(declare-fun e!548661 () Bool)

(declare-fun e!548662 () Bool)

(assert (=> b!973388 (= e!548661 (and e!548662 mapRes!35392))))

(declare-fun condMapEmpty!35392 () Bool)

(declare-fun mapDefault!35392 () ValueCell!10646)

