; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97782 () Bool)

(assert start!97782)

(declare-fun b_free!23483 () Bool)

(declare-fun b_next!23483 () Bool)

(assert (=> start!97782 (= b_free!23483 (not b_next!23483))))

(declare-fun tp!83152 () Bool)

(declare-fun b_and!37757 () Bool)

(assert (=> start!97782 (= tp!83152 b_and!37757)))

(declare-fun b!1118558 () Bool)

(declare-fun res!747084 () Bool)

(declare-fun e!637110 () Bool)

(assert (=> b!1118558 (=> (not res!747084) (not e!637110))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1118558 (= res!747084 (validMask!0 mask!1564))))

(declare-fun b!1118559 () Bool)

(declare-fun res!747089 () Bool)

(assert (=> b!1118559 (=> (not res!747089) (not e!637110))))

(declare-datatypes ((array!72917 0))(
  ( (array!72918 (arr!35111 (Array (_ BitVec 32) (_ BitVec 64))) (size!35647 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72917)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1118559 (= res!747089 (= (select (arr!35111 _keys!1208) i!673) k!934))))

(declare-fun b!1118560 () Bool)

(declare-fun e!637109 () Bool)

(assert (=> b!1118560 (= e!637109 true)))

(declare-datatypes ((V!42477 0))(
  ( (V!42478 (val!14063 Int)) )
))
(declare-fun zeroValue!944 () V!42477)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13297 0))(
  ( (ValueCellFull!13297 (v!16696 V!42477)) (EmptyCell!13297) )
))
(declare-datatypes ((array!72919 0))(
  ( (array!72920 (arr!35112 (Array (_ BitVec 32) ValueCell!13297)) (size!35648 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72919)

(declare-fun minValue!944 () V!42477)

(declare-datatypes ((tuple2!17640 0))(
  ( (tuple2!17641 (_1!8831 (_ BitVec 64)) (_2!8831 V!42477)) )
))
(declare-datatypes ((List!24426 0))(
  ( (Nil!24423) (Cons!24422 (h!25631 tuple2!17640) (t!34907 List!24426)) )
))
(declare-datatypes ((ListLongMap!15609 0))(
  ( (ListLongMap!15610 (toList!7820 List!24426)) )
))
(declare-fun lt!497522 () ListLongMap!15609)

(declare-fun getCurrentListMapNoExtraKeys!4310 (array!72917 array!72919 (_ BitVec 32) (_ BitVec 32) V!42477 V!42477 (_ BitVec 32) Int) ListLongMap!15609)

(assert (=> b!1118560 (= lt!497522 (getCurrentListMapNoExtraKeys!4310 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!43837 () Bool)

(declare-fun mapRes!43837 () Bool)

(assert (=> mapIsEmpty!43837 mapRes!43837))

(declare-fun b!1118561 () Bool)

(declare-fun res!747090 () Bool)

(assert (=> b!1118561 (=> (not res!747090) (not e!637110))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1118561 (= res!747090 (validKeyInArray!0 k!934))))

(declare-fun b!1118562 () Bool)

(declare-fun e!637108 () Bool)

(declare-fun tp_is_empty!28013 () Bool)

(assert (=> b!1118562 (= e!637108 tp_is_empty!28013)))

(declare-fun b!1118563 () Bool)

(declare-fun e!637111 () Bool)

(assert (=> b!1118563 (= e!637111 tp_is_empty!28013)))

(declare-fun b!1118564 () Bool)

(declare-fun res!747091 () Bool)

(assert (=> b!1118564 (=> (not res!747091) (not e!637110))))

(declare-datatypes ((List!24427 0))(
  ( (Nil!24424) (Cons!24423 (h!25632 (_ BitVec 64)) (t!34908 List!24427)) )
))
(declare-fun arrayNoDuplicates!0 (array!72917 (_ BitVec 32) List!24427) Bool)

(assert (=> b!1118564 (= res!747091 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24424))))

(declare-fun b!1118565 () Bool)

(declare-fun res!747092 () Bool)

(assert (=> b!1118565 (=> (not res!747092) (not e!637110))))

(assert (=> b!1118565 (= res!747092 (and (= (size!35648 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35647 _keys!1208) (size!35648 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!747087 () Bool)

(assert (=> start!97782 (=> (not res!747087) (not e!637110))))

(assert (=> start!97782 (= res!747087 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35647 _keys!1208))))))

(assert (=> start!97782 e!637110))

(assert (=> start!97782 tp_is_empty!28013))

(declare-fun array_inv!26978 (array!72917) Bool)

(assert (=> start!97782 (array_inv!26978 _keys!1208)))

(assert (=> start!97782 true))

(assert (=> start!97782 tp!83152))

(declare-fun e!637112 () Bool)

(declare-fun array_inv!26979 (array!72919) Bool)

(assert (=> start!97782 (and (array_inv!26979 _values!996) e!637112)))

(declare-fun b!1118566 () Bool)

(declare-fun e!637113 () Bool)

(assert (=> b!1118566 (= e!637110 e!637113)))

(declare-fun res!747086 () Bool)

(assert (=> b!1118566 (=> (not res!747086) (not e!637113))))

(declare-fun lt!497521 () array!72917)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72917 (_ BitVec 32)) Bool)

(assert (=> b!1118566 (= res!747086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497521 mask!1564))))

(assert (=> b!1118566 (= lt!497521 (array!72918 (store (arr!35111 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35647 _keys!1208)))))

(declare-fun b!1118567 () Bool)

(assert (=> b!1118567 (= e!637112 (and e!637111 mapRes!43837))))

(declare-fun condMapEmpty!43837 () Bool)

(declare-fun mapDefault!43837 () ValueCell!13297)

