; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83906 () Bool)

(assert start!83906)

(declare-fun b_free!19715 () Bool)

(declare-fun b_next!19715 () Bool)

(assert (=> start!83906 (= b_free!19715 (not b_next!19715))))

(declare-fun tp!68586 () Bool)

(declare-fun b_and!31519 () Bool)

(assert (=> start!83906 (= tp!68586 b_and!31519)))

(declare-fun b!980556 () Bool)

(declare-fun res!656233 () Bool)

(declare-fun e!552689 () Bool)

(assert (=> b!980556 (=> (not res!656233) (not e!552689))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61425 0))(
  ( (array!61426 (arr!29570 (Array (_ BitVec 32) (_ BitVec 64))) (size!30049 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61425)

(assert (=> b!980556 (= res!656233 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30049 _keys!1544))))))

(declare-fun b!980558 () Bool)

(declare-fun e!552686 () Bool)

(assert (=> b!980558 (= e!552686 true)))

(declare-datatypes ((V!35261 0))(
  ( (V!35262 (val!11405 Int)) )
))
(declare-datatypes ((tuple2!14628 0))(
  ( (tuple2!14629 (_1!7325 (_ BitVec 64)) (_2!7325 V!35261)) )
))
(declare-fun lt!435419 () tuple2!14628)

(declare-datatypes ((List!20494 0))(
  ( (Nil!20491) (Cons!20490 (h!21652 tuple2!14628) (t!29165 List!20494)) )
))
(declare-datatypes ((ListLongMap!13325 0))(
  ( (ListLongMap!13326 (toList!6678 List!20494)) )
))
(declare-fun lt!435413 () ListLongMap!13325)

(declare-fun lt!435414 () ListLongMap!13325)

(declare-fun lt!435415 () tuple2!14628)

(declare-fun +!2983 (ListLongMap!13325 tuple2!14628) ListLongMap!13325)

(assert (=> b!980558 (= lt!435413 (+!2983 (+!2983 lt!435414 lt!435415) lt!435419))))

(declare-fun lt!435410 () V!35261)

(declare-fun zeroValue!1220 () V!35261)

(declare-datatypes ((Unit!32605 0))(
  ( (Unit!32606) )
))
(declare-fun lt!435416 () Unit!32605)

(declare-fun addCommutativeForDiffKeys!611 (ListLongMap!13325 (_ BitVec 64) V!35261 (_ BitVec 64) V!35261) Unit!32605)

(assert (=> b!980558 (= lt!435416 (addCommutativeForDiffKeys!611 lt!435414 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29570 _keys!1544) from!1932) lt!435410))))

(declare-fun b!980559 () Bool)

(declare-fun res!656236 () Bool)

(assert (=> b!980559 (=> (not res!656236) (not e!552689))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!980559 (= res!656236 (validKeyInArray!0 (select (arr!29570 _keys!1544) from!1932)))))

(declare-fun b!980560 () Bool)

(declare-fun res!656230 () Bool)

(assert (=> b!980560 (=> (not res!656230) (not e!552689))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!980560 (= res!656230 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!36092 () Bool)

(declare-fun mapRes!36092 () Bool)

(assert (=> mapIsEmpty!36092 mapRes!36092))

(declare-fun mapNonEmpty!36092 () Bool)

(declare-fun tp!68587 () Bool)

(declare-fun e!552690 () Bool)

(assert (=> mapNonEmpty!36092 (= mapRes!36092 (and tp!68587 e!552690))))

(declare-datatypes ((ValueCell!10873 0))(
  ( (ValueCellFull!10873 (v!13967 V!35261)) (EmptyCell!10873) )
))
(declare-datatypes ((array!61427 0))(
  ( (array!61428 (arr!29571 (Array (_ BitVec 32) ValueCell!10873)) (size!30050 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61427)

(declare-fun mapKey!36092 () (_ BitVec 32))

(declare-fun mapRest!36092 () (Array (_ BitVec 32) ValueCell!10873))

(declare-fun mapValue!36092 () ValueCell!10873)

(assert (=> mapNonEmpty!36092 (= (arr!29571 _values!1278) (store mapRest!36092 mapKey!36092 mapValue!36092))))

(declare-fun b!980561 () Bool)

(declare-fun res!656234 () Bool)

(assert (=> b!980561 (=> (not res!656234) (not e!552689))))

(declare-datatypes ((List!20495 0))(
  ( (Nil!20492) (Cons!20491 (h!21653 (_ BitVec 64)) (t!29166 List!20495)) )
))
(declare-fun arrayNoDuplicates!0 (array!61425 (_ BitVec 32) List!20495) Bool)

(assert (=> b!980561 (= res!656234 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20492))))

(declare-fun b!980562 () Bool)

(declare-fun e!552687 () Bool)

(declare-fun e!552688 () Bool)

(assert (=> b!980562 (= e!552687 (and e!552688 mapRes!36092))))

(declare-fun condMapEmpty!36092 () Bool)

(declare-fun mapDefault!36092 () ValueCell!10873)

