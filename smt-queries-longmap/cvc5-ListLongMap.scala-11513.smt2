; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133962 () Bool)

(assert start!133962)

(declare-fun b_free!32185 () Bool)

(declare-fun b_next!32185 () Bool)

(assert (=> start!133962 (= b_free!32185 (not b_next!32185))))

(declare-fun tp!113856 () Bool)

(declare-fun b_and!51811 () Bool)

(assert (=> start!133962 (= tp!113856 b_and!51811)))

(declare-fun b!1566074 () Bool)

(declare-fun res!1070512 () Bool)

(declare-fun e!872899 () Bool)

(assert (=> b!1566074 (=> (not res!1070512) (not e!872899))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!104604 0))(
  ( (array!104605 (arr!50489 (Array (_ BitVec 32) (_ BitVec 64))) (size!51039 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104604)

(assert (=> b!1566074 (= res!1070512 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51039 _keys!637)) (bvslt from!782 (size!51039 _keys!637))))))

(declare-fun b!1566075 () Bool)

(declare-fun e!872900 () Bool)

(assert (=> b!1566075 (= e!872899 (not e!872900))))

(declare-fun res!1070506 () Bool)

(assert (=> b!1566075 (=> (not res!1070506) (not e!872900))))

(declare-datatypes ((V!60153 0))(
  ( (V!60154 (val!19563 Int)) )
))
(declare-datatypes ((tuple2!25240 0))(
  ( (tuple2!25241 (_1!12631 (_ BitVec 64)) (_2!12631 V!60153)) )
))
(declare-datatypes ((List!36628 0))(
  ( (Nil!36625) (Cons!36624 (h!38070 tuple2!25240) (t!51527 List!36628)) )
))
(declare-datatypes ((ListLongMap!22675 0))(
  ( (ListLongMap!22676 (toList!11353 List!36628)) )
))
(declare-fun lt!672542 () ListLongMap!22675)

(declare-fun contains!10344 (ListLongMap!22675 (_ BitVec 64)) Bool)

(assert (=> b!1566075 (= res!1070506 (not (contains!10344 lt!672542 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1566075 (not (contains!10344 lt!672542 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!672541 () V!60153)

(declare-fun lt!672539 () ListLongMap!22675)

(declare-fun +!5083 (ListLongMap!22675 tuple2!25240) ListLongMap!22675)

(assert (=> b!1566075 (= lt!672542 (+!5083 lt!672539 (tuple2!25241 (select (arr!50489 _keys!637) from!782) lt!672541)))))

(declare-datatypes ((Unit!52030 0))(
  ( (Unit!52031) )
))
(declare-fun lt!672540 () Unit!52030)

(declare-fun addStillNotContains!573 (ListLongMap!22675 (_ BitVec 64) V!60153 (_ BitVec 64)) Unit!52030)

(assert (=> b!1566075 (= lt!672540 (addStillNotContains!573 lt!672539 (select (arr!50489 _keys!637) from!782) lt!672541 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((ValueCell!18449 0))(
  ( (ValueCellFull!18449 (v!22319 V!60153)) (EmptyCell!18449) )
))
(declare-datatypes ((array!104606 0))(
  ( (array!104607 (arr!50490 (Array (_ BitVec 32) ValueCell!18449)) (size!51040 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104606)

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26360 (ValueCell!18449 V!60153) V!60153)

(declare-fun dynLambda!3867 (Int (_ BitVec 64)) V!60153)

(assert (=> b!1566075 (= lt!672541 (get!26360 (select (arr!50490 _values!487) from!782) (dynLambda!3867 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!60153)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!60153)

(declare-fun getCurrentListMapNoExtraKeys!6718 (array!104604 array!104606 (_ BitVec 32) (_ BitVec 32) V!60153 V!60153 (_ BitVec 32) Int) ListLongMap!22675)

(assert (=> b!1566075 (= lt!672539 (getCurrentListMapNoExtraKeys!6718 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1566076 () Bool)

(declare-fun res!1070509 () Bool)

(assert (=> b!1566076 (=> (not res!1070509) (not e!872899))))

(assert (=> b!1566076 (= res!1070509 (and (= (size!51040 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51039 _keys!637) (size!51040 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1566077 () Bool)

(declare-fun e!872902 () Bool)

(declare-fun e!872901 () Bool)

(declare-fun mapRes!59830 () Bool)

(assert (=> b!1566077 (= e!872902 (and e!872901 mapRes!59830))))

(declare-fun condMapEmpty!59830 () Bool)

(declare-fun mapDefault!59830 () ValueCell!18449)

