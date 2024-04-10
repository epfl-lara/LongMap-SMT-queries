; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113084 () Bool)

(assert start!113084)

(declare-fun b_free!31135 () Bool)

(declare-fun b_next!31135 () Bool)

(assert (=> start!113084 (= b_free!31135 (not b_next!31135))))

(declare-fun tp!109210 () Bool)

(declare-fun b_and!50177 () Bool)

(assert (=> start!113084 (= tp!109210 b_and!50177)))

(declare-fun b!1340459 () Bool)

(declare-fun res!889221 () Bool)

(declare-fun e!763489 () Bool)

(assert (=> b!1340459 (=> (not res!889221) (not e!763489))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((array!91122 0))(
  ( (array!91123 (arr!44017 (Array (_ BitVec 32) (_ BitVec 64))) (size!44567 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91122)

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1340459 (= res!889221 (not (= (select (arr!44017 _keys!1571) from!1960) k!1142)))))

(declare-fun b!1340460 () Bool)

(declare-fun res!889225 () Bool)

(assert (=> b!1340460 (=> (not res!889225) (not e!763489))))

(declare-datatypes ((List!31155 0))(
  ( (Nil!31152) (Cons!31151 (h!32360 (_ BitVec 64)) (t!45501 List!31155)) )
))
(declare-fun arrayNoDuplicates!0 (array!91122 (_ BitVec 32) List!31155) Bool)

(assert (=> b!1340460 (= res!889225 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31152))))

(declare-fun b!1340461 () Bool)

(declare-fun res!889222 () Bool)

(assert (=> b!1340461 (=> (not res!889222) (not e!763489))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1340461 (= res!889222 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1340462 () Bool)

(assert (=> b!1340462 (= e!763489 (not true))))

(declare-datatypes ((V!54617 0))(
  ( (V!54618 (val!18642 Int)) )
))
(declare-datatypes ((tuple2!23992 0))(
  ( (tuple2!23993 (_1!12007 (_ BitVec 64)) (_2!12007 V!54617)) )
))
(declare-datatypes ((List!31156 0))(
  ( (Nil!31153) (Cons!31152 (h!32361 tuple2!23992) (t!45502 List!31156)) )
))
(declare-datatypes ((ListLongMap!21649 0))(
  ( (ListLongMap!21650 (toList!10840 List!31156)) )
))
(declare-fun lt!593990 () ListLongMap!21649)

(declare-fun contains!9016 (ListLongMap!21649 (_ BitVec 64)) Bool)

(assert (=> b!1340462 (contains!9016 lt!593990 k!1142)))

(declare-fun zeroValue!1245 () V!54617)

(declare-datatypes ((Unit!43991 0))(
  ( (Unit!43992) )
))
(declare-fun lt!593991 () Unit!43991)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!326 ((_ BitVec 64) (_ BitVec 64) V!54617 ListLongMap!21649) Unit!43991)

(assert (=> b!1340462 (= lt!593991 (lemmaInListMapAfterAddingDiffThenInBefore!326 k!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!593990))))

(declare-fun minValue!1245 () V!54617)

(declare-fun defaultEntry!1306 () Int)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17669 0))(
  ( (ValueCellFull!17669 (v!21290 V!54617)) (EmptyCell!17669) )
))
(declare-datatypes ((array!91124 0))(
  ( (array!91125 (arr!44018 (Array (_ BitVec 32) ValueCell!17669)) (size!44568 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91124)

(declare-fun +!4757 (ListLongMap!21649 tuple2!23992) ListLongMap!21649)

(declare-fun getCurrentListMapNoExtraKeys!6399 (array!91122 array!91124 (_ BitVec 32) (_ BitVec 32) V!54617 V!54617 (_ BitVec 32) Int) ListLongMap!21649)

(declare-fun get!22208 (ValueCell!17669 V!54617) V!54617)

(declare-fun dynLambda!3696 (Int (_ BitVec 64)) V!54617)

(assert (=> b!1340462 (= lt!593990 (+!4757 (getCurrentListMapNoExtraKeys!6399 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!23993 (select (arr!44017 _keys!1571) from!1960) (get!22208 (select (arr!44018 _values!1303) from!1960) (dynLambda!3696 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1340463 () Bool)

(declare-fun res!889227 () Bool)

(assert (=> b!1340463 (=> (not res!889227) (not e!763489))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1340463 (= res!889227 (validKeyInArray!0 (select (arr!44017 _keys!1571) from!1960)))))

(declare-fun b!1340464 () Bool)

(declare-fun res!889219 () Bool)

(assert (=> b!1340464 (=> (not res!889219) (not e!763489))))

(declare-fun getCurrentListMap!5808 (array!91122 array!91124 (_ BitVec 32) (_ BitVec 32) V!54617 V!54617 (_ BitVec 32) Int) ListLongMap!21649)

(assert (=> b!1340464 (= res!889219 (contains!9016 (getCurrentListMap!5808 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1340465 () Bool)

(declare-fun res!889223 () Bool)

(assert (=> b!1340465 (=> (not res!889223) (not e!763489))))

(assert (=> b!1340465 (= res!889223 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44567 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1340466 () Bool)

(declare-fun res!889226 () Bool)

(assert (=> b!1340466 (=> (not res!889226) (not e!763489))))

(assert (=> b!1340466 (= res!889226 (and (= (size!44568 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44567 _keys!1571) (size!44568 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1340467 () Bool)

(declare-fun e!763493 () Bool)

(declare-fun e!763492 () Bool)

(declare-fun mapRes!57409 () Bool)

(assert (=> b!1340467 (= e!763493 (and e!763492 mapRes!57409))))

(declare-fun condMapEmpty!57409 () Bool)

(declare-fun mapDefault!57409 () ValueCell!17669)

