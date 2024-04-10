; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83290 () Bool)

(assert start!83290)

(declare-fun b_free!19283 () Bool)

(declare-fun b_next!19283 () Bool)

(assert (=> start!83290 (= b_free!19283 (not b_next!19283))))

(declare-fun tp!67128 () Bool)

(declare-fun b_and!30787 () Bool)

(assert (=> start!83290 (= tp!67128 b_and!30787)))

(declare-fun b!972091 () Bool)

(declare-fun res!650671 () Bool)

(declare-fun e!547948 () Bool)

(assert (=> b!972091 (=> (not res!650671) (not e!547948))))

(declare-datatypes ((array!60409 0))(
  ( (array!60410 (arr!29068 (Array (_ BitVec 32) (_ BitVec 64))) (size!29547 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60409)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!972091 (= res!650671 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29547 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29547 _keys!1717))))))

(declare-fun mapNonEmpty!35281 () Bool)

(declare-fun mapRes!35281 () Bool)

(declare-fun tp!67127 () Bool)

(declare-fun e!547946 () Bool)

(assert (=> mapNonEmpty!35281 (= mapRes!35281 (and tp!67127 e!547946))))

(declare-datatypes ((V!34557 0))(
  ( (V!34558 (val!11141 Int)) )
))
(declare-datatypes ((ValueCell!10609 0))(
  ( (ValueCellFull!10609 (v!13700 V!34557)) (EmptyCell!10609) )
))
(declare-datatypes ((array!60411 0))(
  ( (array!60412 (arr!29069 (Array (_ BitVec 32) ValueCell!10609)) (size!29548 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60411)

(declare-fun mapRest!35281 () (Array (_ BitVec 32) ValueCell!10609))

(declare-fun mapValue!35281 () ValueCell!10609)

(declare-fun mapKey!35281 () (_ BitVec 32))

(assert (=> mapNonEmpty!35281 (= (arr!29069 _values!1425) (store mapRest!35281 mapKey!35281 mapValue!35281))))

(declare-fun b!972092 () Bool)

(declare-fun e!547947 () Bool)

(assert (=> b!972092 (= e!547947 (not true))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun zeroValue!1367 () V!34557)

(declare-fun lt!431946 () (_ BitVec 64))

(declare-fun minValue!1367 () V!34557)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14286 0))(
  ( (tuple2!14287 (_1!7154 (_ BitVec 64)) (_2!7154 V!34557)) )
))
(declare-datatypes ((List!20151 0))(
  ( (Nil!20148) (Cons!20147 (h!21309 tuple2!14286) (t!28532 List!20151)) )
))
(declare-datatypes ((ListLongMap!12983 0))(
  ( (ListLongMap!12984 (toList!6507 List!20151)) )
))
(declare-fun lt!431947 () ListLongMap!12983)

(declare-fun defaultEntry!1428 () Int)

(declare-fun +!2881 (ListLongMap!12983 tuple2!14286) ListLongMap!12983)

(declare-fun getCurrentListMap!3740 (array!60409 array!60411 (_ BitVec 32) (_ BitVec 32) V!34557 V!34557 (_ BitVec 32) Int) ListLongMap!12983)

(declare-fun get!15054 (ValueCell!10609 V!34557) V!34557)

(declare-fun dynLambda!1670 (Int (_ BitVec 64)) V!34557)

(assert (=> b!972092 (= lt!431947 (+!2881 (getCurrentListMap!3740 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14287 lt!431946 (get!15054 (select (arr!29069 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1670 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32383 0))(
  ( (Unit!32384) )
))
(declare-fun lt!431948 () Unit!32383)

(declare-fun lemmaListMapRecursiveValidKeyArray!247 (array!60409 array!60411 (_ BitVec 32) (_ BitVec 32) V!34557 V!34557 (_ BitVec 32) Int) Unit!32383)

(assert (=> b!972092 (= lt!431948 (lemmaListMapRecursiveValidKeyArray!247 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun mapIsEmpty!35281 () Bool)

(assert (=> mapIsEmpty!35281 mapRes!35281))

(declare-fun b!972093 () Bool)

(assert (=> b!972093 (= e!547948 e!547947)))

(declare-fun res!650674 () Bool)

(assert (=> b!972093 (=> (not res!650674) (not e!547947))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!972093 (= res!650674 (validKeyInArray!0 lt!431946))))

(assert (=> b!972093 (= lt!431946 (select (arr!29068 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!972093 (= lt!431947 (getCurrentListMap!3740 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972094 () Bool)

(declare-fun res!650676 () Bool)

(assert (=> b!972094 (=> (not res!650676) (not e!547948))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60409 (_ BitVec 32)) Bool)

(assert (=> b!972094 (= res!650676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!972095 () Bool)

(declare-fun e!547949 () Bool)

(declare-fun e!547951 () Bool)

(assert (=> b!972095 (= e!547949 (and e!547951 mapRes!35281))))

(declare-fun condMapEmpty!35281 () Bool)

(declare-fun mapDefault!35281 () ValueCell!10609)

