; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83298 () Bool)

(assert start!83298)

(declare-fun b_free!19291 () Bool)

(declare-fun b_next!19291 () Bool)

(assert (=> start!83298 (= b_free!19291 (not b_next!19291))))

(declare-fun tp!67152 () Bool)

(declare-fun b_and!30803 () Bool)

(assert (=> start!83298 (= tp!67152 b_and!30803)))

(declare-fun mapIsEmpty!35293 () Bool)

(declare-fun mapRes!35293 () Bool)

(assert (=> mapIsEmpty!35293 mapRes!35293))

(declare-fun b!972231 () Bool)

(declare-fun e!548023 () Bool)

(assert (=> b!972231 (= e!548023 (not true))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34569 0))(
  ( (V!34570 (val!11145 Int)) )
))
(declare-datatypes ((ValueCell!10613 0))(
  ( (ValueCellFull!10613 (v!13704 V!34569)) (EmptyCell!10613) )
))
(declare-datatypes ((array!60425 0))(
  ( (array!60426 (arr!29076 (Array (_ BitVec 32) ValueCell!10613)) (size!29555 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60425)

(declare-fun zeroValue!1367 () V!34569)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34569)

(declare-fun lt!431982 () (_ BitVec 64))

(declare-datatypes ((tuple2!14292 0))(
  ( (tuple2!14293 (_1!7157 (_ BitVec 64)) (_2!7157 V!34569)) )
))
(declare-datatypes ((List!20156 0))(
  ( (Nil!20153) (Cons!20152 (h!21314 tuple2!14292) (t!28545 List!20156)) )
))
(declare-datatypes ((ListLongMap!12989 0))(
  ( (ListLongMap!12990 (toList!6510 List!20156)) )
))
(declare-fun lt!431983 () ListLongMap!12989)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60427 0))(
  ( (array!60428 (arr!29077 (Array (_ BitVec 32) (_ BitVec 64))) (size!29556 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60427)

(declare-fun +!2884 (ListLongMap!12989 tuple2!14292) ListLongMap!12989)

(declare-fun getCurrentListMap!3743 (array!60427 array!60425 (_ BitVec 32) (_ BitVec 32) V!34569 V!34569 (_ BitVec 32) Int) ListLongMap!12989)

(declare-fun get!15061 (ValueCell!10613 V!34569) V!34569)

(declare-fun dynLambda!1673 (Int (_ BitVec 64)) V!34569)

(assert (=> b!972231 (= lt!431983 (+!2884 (getCurrentListMap!3743 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14293 lt!431982 (get!15061 (select (arr!29076 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1673 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32389 0))(
  ( (Unit!32390) )
))
(declare-fun lt!431984 () Unit!32389)

(declare-fun lemmaListMapRecursiveValidKeyArray!250 (array!60427 array!60425 (_ BitVec 32) (_ BitVec 32) V!34569 V!34569 (_ BitVec 32) Int) Unit!32389)

(assert (=> b!972231 (= lt!431984 (lemmaListMapRecursiveValidKeyArray!250 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972233 () Bool)

(declare-fun e!548018 () Bool)

(declare-fun tp_is_empty!22189 () Bool)

(assert (=> b!972233 (= e!548018 tp_is_empty!22189)))

(declare-fun b!972234 () Bool)

(declare-fun res!650770 () Bool)

(declare-fun e!548021 () Bool)

(assert (=> b!972234 (=> (not res!650770) (not e!548021))))

(assert (=> b!972234 (= res!650770 (and (= (size!29555 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29556 _keys!1717) (size!29555 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!972235 () Bool)

(declare-fun res!650765 () Bool)

(assert (=> b!972235 (=> (not res!650765) (not e!548021))))

(declare-datatypes ((List!20157 0))(
  ( (Nil!20154) (Cons!20153 (h!21315 (_ BitVec 64)) (t!28546 List!20157)) )
))
(declare-fun arrayNoDuplicates!0 (array!60427 (_ BitVec 32) List!20157) Bool)

(assert (=> b!972235 (= res!650765 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20154))))

(declare-fun b!972236 () Bool)

(declare-fun res!650772 () Bool)

(assert (=> b!972236 (=> (not res!650772) (not e!548021))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!972236 (= res!650772 (validKeyInArray!0 (select (arr!29077 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35293 () Bool)

(declare-fun tp!67151 () Bool)

(declare-fun e!548019 () Bool)

(assert (=> mapNonEmpty!35293 (= mapRes!35293 (and tp!67151 e!548019))))

(declare-fun mapValue!35293 () ValueCell!10613)

(declare-fun mapRest!35293 () (Array (_ BitVec 32) ValueCell!10613))

(declare-fun mapKey!35293 () (_ BitVec 32))

(assert (=> mapNonEmpty!35293 (= (arr!29076 _values!1425) (store mapRest!35293 mapKey!35293 mapValue!35293))))

(declare-fun b!972237 () Bool)

(declare-fun e!548022 () Bool)

(assert (=> b!972237 (= e!548022 (and e!548018 mapRes!35293))))

(declare-fun condMapEmpty!35293 () Bool)

(declare-fun mapDefault!35293 () ValueCell!10613)

