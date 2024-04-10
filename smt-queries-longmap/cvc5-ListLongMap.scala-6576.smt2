; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83340 () Bool)

(assert start!83340)

(declare-fun b_free!19333 () Bool)

(declare-fun b_next!19333 () Bool)

(assert (=> start!83340 (= b_free!19333 (not b_next!19333))))

(declare-fun tp!67278 () Bool)

(declare-fun b_and!30887 () Bool)

(assert (=> start!83340 (= tp!67278 b_and!30887)))

(declare-fun b!972966 () Bool)

(declare-fun e!548409 () Bool)

(declare-fun e!548407 () Bool)

(assert (=> b!972966 (= e!548409 e!548407)))

(declare-fun res!651275 () Bool)

(assert (=> b!972966 (=> (not res!651275) (not e!548407))))

(declare-datatypes ((array!60503 0))(
  ( (array!60504 (arr!29115 (Array (_ BitVec 32) (_ BitVec 64))) (size!29594 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60503)

(declare-datatypes ((V!34625 0))(
  ( (V!34626 (val!11166 Int)) )
))
(declare-datatypes ((tuple2!14326 0))(
  ( (tuple2!14327 (_1!7174 (_ BitVec 64)) (_2!7174 V!34625)) )
))
(declare-datatypes ((List!20189 0))(
  ( (Nil!20186) (Cons!20185 (h!21347 tuple2!14326) (t!28620 List!20189)) )
))
(declare-datatypes ((ListLongMap!13023 0))(
  ( (ListLongMap!13024 (toList!6527 List!20189)) )
))
(declare-fun lt!432219 () ListLongMap!13023)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun contains!5620 (ListLongMap!13023 (_ BitVec 64)) Bool)

(assert (=> b!972966 (= res!651275 (contains!5620 lt!432219 (select (arr!29115 _keys!1717) i!822)))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((ValueCell!10634 0))(
  ( (ValueCellFull!10634 (v!13725 V!34625)) (EmptyCell!10634) )
))
(declare-datatypes ((array!60505 0))(
  ( (array!60506 (arr!29116 (Array (_ BitVec 32) ValueCell!10634)) (size!29595 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60505)

(declare-fun zeroValue!1367 () V!34625)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34625)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun getCurrentListMap!3760 (array!60503 array!60505 (_ BitVec 32) (_ BitVec 32) V!34625 V!34625 (_ BitVec 32) Int) ListLongMap!13023)

(assert (=> b!972966 (= lt!432219 (getCurrentListMap!3760 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun b!972967 () Bool)

(declare-fun e!548411 () Bool)

(assert (=> b!972967 (= e!548411 (not true))))

(declare-fun lt!432216 () tuple2!14326)

(declare-fun +!2898 (ListLongMap!13023 tuple2!14326) ListLongMap!13023)

(assert (=> b!972967 (contains!5620 (+!2898 lt!432219 lt!432216) (select (arr!29115 _keys!1717) i!822))))

(declare-datatypes ((Unit!32417 0))(
  ( (Unit!32418) )
))
(declare-fun lt!432218 () Unit!32417)

(declare-fun lt!432220 () (_ BitVec 64))

(declare-fun lt!432221 () V!34625)

(declare-fun addStillContains!594 (ListLongMap!13023 (_ BitVec 64) V!34625 (_ BitVec 64)) Unit!32417)

(assert (=> b!972967 (= lt!432218 (addStillContains!594 lt!432219 lt!432220 lt!432221 (select (arr!29115 _keys!1717) i!822)))))

(declare-fun lt!432215 () ListLongMap!13023)

(assert (=> b!972967 (= lt!432215 (+!2898 (getCurrentListMap!3760 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) lt!432216))))

(assert (=> b!972967 (= lt!432216 (tuple2!14327 lt!432220 lt!432221))))

(declare-fun get!15089 (ValueCell!10634 V!34625) V!34625)

(declare-fun dynLambda!1687 (Int (_ BitVec 64)) V!34625)

(assert (=> b!972967 (= lt!432221 (get!15089 (select (arr!29116 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1687 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!432217 () Unit!32417)

(declare-fun lemmaListMapRecursiveValidKeyArray!264 (array!60503 array!60505 (_ BitVec 32) (_ BitVec 32) V!34625 V!34625 (_ BitVec 32) Int) Unit!32417)

(assert (=> b!972967 (= lt!432217 (lemmaListMapRecursiveValidKeyArray!264 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972968 () Bool)

(declare-fun e!548408 () Bool)

(declare-fun tp_is_empty!22231 () Bool)

(assert (=> b!972968 (= e!548408 tp_is_empty!22231)))

(declare-fun mapNonEmpty!35356 () Bool)

(declare-fun mapRes!35356 () Bool)

(declare-fun tp!67277 () Bool)

(declare-fun e!548410 () Bool)

(assert (=> mapNonEmpty!35356 (= mapRes!35356 (and tp!67277 e!548410))))

(declare-fun mapKey!35356 () (_ BitVec 32))

(declare-fun mapRest!35356 () (Array (_ BitVec 32) ValueCell!10634))

(declare-fun mapValue!35356 () ValueCell!10634)

(assert (=> mapNonEmpty!35356 (= (arr!29116 _values!1425) (store mapRest!35356 mapKey!35356 mapValue!35356))))

(declare-fun res!651271 () Bool)

(assert (=> start!83340 (=> (not res!651271) (not e!548409))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83340 (= res!651271 (validMask!0 mask!2147))))

(assert (=> start!83340 e!548409))

(assert (=> start!83340 true))

(declare-fun e!548412 () Bool)

(declare-fun array_inv!22523 (array!60505) Bool)

(assert (=> start!83340 (and (array_inv!22523 _values!1425) e!548412)))

(assert (=> start!83340 tp_is_empty!22231))

(assert (=> start!83340 tp!67278))

(declare-fun array_inv!22524 (array!60503) Bool)

(assert (=> start!83340 (array_inv!22524 _keys!1717)))

(declare-fun b!972969 () Bool)

(assert (=> b!972969 (= e!548412 (and e!548408 mapRes!35356))))

(declare-fun condMapEmpty!35356 () Bool)

(declare-fun mapDefault!35356 () ValueCell!10634)

