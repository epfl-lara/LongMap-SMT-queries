; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83352 () Bool)

(assert start!83352)

(declare-fun b_free!19345 () Bool)

(declare-fun b_next!19345 () Bool)

(assert (=> start!83352 (= b_free!19345 (not b_next!19345))))

(declare-fun tp!67313 () Bool)

(declare-fun b_and!30911 () Bool)

(assert (=> start!83352 (= tp!67313 b_and!30911)))

(declare-fun b!973176 () Bool)

(declare-fun e!548538 () Bool)

(declare-fun e!548537 () Bool)

(assert (=> b!973176 (= e!548538 e!548537)))

(declare-fun res!651420 () Bool)

(assert (=> b!973176 (=> (not res!651420) (not e!548537))))

(declare-fun lt!432343 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!973176 (= res!651420 (validKeyInArray!0 lt!432343))))

(declare-datatypes ((array!60527 0))(
  ( (array!60528 (arr!29127 (Array (_ BitVec 32) (_ BitVec 64))) (size!29606 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60527)

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!973176 (= lt!432343 (select (arr!29127 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34641 0))(
  ( (V!34642 (val!11172 Int)) )
))
(declare-datatypes ((tuple2!14338 0))(
  ( (tuple2!14339 (_1!7180 (_ BitVec 64)) (_2!7180 V!34641)) )
))
(declare-datatypes ((List!20199 0))(
  ( (Nil!20196) (Cons!20195 (h!21357 tuple2!14338) (t!28642 List!20199)) )
))
(declare-datatypes ((ListLongMap!13035 0))(
  ( (ListLongMap!13036 (toList!6533 List!20199)) )
))
(declare-fun lt!432347 () ListLongMap!13035)

(declare-fun zeroValue!1367 () V!34641)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34641)

(declare-datatypes ((ValueCell!10640 0))(
  ( (ValueCellFull!10640 (v!13731 V!34641)) (EmptyCell!10640) )
))
(declare-datatypes ((array!60529 0))(
  ( (array!60530 (arr!29128 (Array (_ BitVec 32) ValueCell!10640)) (size!29607 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60529)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3766 (array!60527 array!60529 (_ BitVec 32) (_ BitVec 32) V!34641 V!34641 (_ BitVec 32) Int) ListLongMap!13035)

(assert (=> b!973176 (= lt!432347 (getCurrentListMap!3766 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973177 () Bool)

(declare-fun e!548539 () Bool)

(assert (=> b!973177 (= e!548539 e!548538)))

(declare-fun res!651415 () Bool)

(assert (=> b!973177 (=> (not res!651415) (not e!548538))))

(declare-fun lt!432341 () ListLongMap!13035)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun contains!5626 (ListLongMap!13035 (_ BitVec 64)) Bool)

(assert (=> b!973177 (= res!651415 (contains!5626 lt!432341 (select (arr!29127 _keys!1717) i!822)))))

(assert (=> b!973177 (= lt!432341 (getCurrentListMap!3766 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun b!973178 () Bool)

(assert (=> b!973178 (= e!548537 (not true))))

(declare-fun lt!432342 () tuple2!14338)

(declare-fun +!2902 (ListLongMap!13035 tuple2!14338) ListLongMap!13035)

(assert (=> b!973178 (contains!5626 (+!2902 lt!432341 lt!432342) (select (arr!29127 _keys!1717) i!822))))

(declare-datatypes ((Unit!32425 0))(
  ( (Unit!32426) )
))
(declare-fun lt!432346 () Unit!32425)

(declare-fun lt!432345 () V!34641)

(declare-fun addStillContains!598 (ListLongMap!13035 (_ BitVec 64) V!34641 (_ BitVec 64)) Unit!32425)

(assert (=> b!973178 (= lt!432346 (addStillContains!598 lt!432341 lt!432343 lt!432345 (select (arr!29127 _keys!1717) i!822)))))

(assert (=> b!973178 (= lt!432347 (+!2902 (getCurrentListMap!3766 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) lt!432342))))

(assert (=> b!973178 (= lt!432342 (tuple2!14339 lt!432343 lt!432345))))

(declare-fun get!15097 (ValueCell!10640 V!34641) V!34641)

(declare-fun dynLambda!1691 (Int (_ BitVec 64)) V!34641)

(assert (=> b!973178 (= lt!432345 (get!15097 (select (arr!29128 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1691 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!432344 () Unit!32425)

(declare-fun lemmaListMapRecursiveValidKeyArray!268 (array!60527 array!60529 (_ BitVec 32) (_ BitVec 32) V!34641 V!34641 (_ BitVec 32) Int) Unit!32425)

(assert (=> b!973178 (= lt!432344 (lemmaListMapRecursiveValidKeyArray!268 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun res!651417 () Bool)

(assert (=> start!83352 (=> (not res!651417) (not e!548539))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83352 (= res!651417 (validMask!0 mask!2147))))

(assert (=> start!83352 e!548539))

(assert (=> start!83352 true))

(declare-fun e!548533 () Bool)

(declare-fun array_inv!22533 (array!60529) Bool)

(assert (=> start!83352 (and (array_inv!22533 _values!1425) e!548533)))

(declare-fun tp_is_empty!22243 () Bool)

(assert (=> start!83352 tp_is_empty!22243))

(assert (=> start!83352 tp!67313))

(declare-fun array_inv!22534 (array!60527) Bool)

(assert (=> start!83352 (array_inv!22534 _keys!1717)))

(declare-fun b!973179 () Bool)

(declare-fun res!651419 () Bool)

(assert (=> b!973179 (=> (not res!651419) (not e!548539))))

(declare-datatypes ((List!20200 0))(
  ( (Nil!20197) (Cons!20196 (h!21358 (_ BitVec 64)) (t!28643 List!20200)) )
))
(declare-fun arrayNoDuplicates!0 (array!60527 (_ BitVec 32) List!20200) Bool)

(assert (=> b!973179 (= res!651419 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20197))))

(declare-fun b!973180 () Bool)

(declare-fun res!651418 () Bool)

(assert (=> b!973180 (=> (not res!651418) (not e!548539))))

(assert (=> b!973180 (= res!651418 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29606 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29606 _keys!1717))))))

(declare-fun b!973181 () Bool)

(declare-fun e!548534 () Bool)

(declare-fun mapRes!35374 () Bool)

(assert (=> b!973181 (= e!548533 (and e!548534 mapRes!35374))))

(declare-fun condMapEmpty!35374 () Bool)

(declare-fun mapDefault!35374 () ValueCell!10640)

