; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97868 () Bool)

(assert start!97868)

(declare-fun b_free!23569 () Bool)

(declare-fun b_next!23569 () Bool)

(assert (=> start!97868 (= b_free!23569 (not b_next!23569))))

(declare-fun tp!83411 () Bool)

(declare-fun b_and!37921 () Bool)

(assert (=> start!97868 (= tp!83411 b_and!37921)))

(declare-fun b!1120442 () Bool)

(declare-fun e!638011 () Bool)

(declare-fun tp_is_empty!28099 () Bool)

(assert (=> b!1120442 (= e!638011 tp_is_empty!28099)))

(declare-fun b!1120443 () Bool)

(declare-fun e!638012 () Bool)

(assert (=> b!1120443 (= e!638012 true)))

(declare-datatypes ((V!42593 0))(
  ( (V!42594 (val!14106 Int)) )
))
(declare-fun zeroValue!944 () V!42593)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!17698 0))(
  ( (tuple2!17699 (_1!8860 (_ BitVec 64)) (_2!8860 V!42593)) )
))
(declare-datatypes ((List!24483 0))(
  ( (Nil!24480) (Cons!24479 (h!25688 tuple2!17698) (t!35044 List!24483)) )
))
(declare-datatypes ((ListLongMap!15667 0))(
  ( (ListLongMap!15668 (toList!7849 List!24483)) )
))
(declare-fun lt!498028 () ListLongMap!15667)

(declare-datatypes ((ValueCell!13340 0))(
  ( (ValueCellFull!13340 (v!16739 V!42593)) (EmptyCell!13340) )
))
(declare-datatypes ((array!73079 0))(
  ( (array!73080 (arr!35192 (Array (_ BitVec 32) ValueCell!13340)) (size!35728 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73079)

(declare-fun minValue!944 () V!42593)

(declare-datatypes ((array!73081 0))(
  ( (array!73082 (arr!35193 (Array (_ BitVec 32) (_ BitVec 64))) (size!35729 (_ BitVec 32))) )
))
(declare-fun lt!498026 () array!73081)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4339 (array!73081 array!73079 (_ BitVec 32) (_ BitVec 32) V!42593 V!42593 (_ BitVec 32) Int) ListLongMap!15667)

(declare-fun dynLambda!2443 (Int (_ BitVec 64)) V!42593)

(assert (=> b!1120443 (= lt!498028 (getCurrentListMapNoExtraKeys!4339 lt!498026 (array!73080 (store (arr!35192 _values!996) i!673 (ValueCellFull!13340 (dynLambda!2443 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35728 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _keys!1208 () array!73081)

(declare-fun lt!498029 () ListLongMap!15667)

(assert (=> b!1120443 (= lt!498029 (getCurrentListMapNoExtraKeys!4339 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1120444 () Bool)

(declare-fun res!748510 () Bool)

(declare-fun e!638014 () Bool)

(assert (=> b!1120444 (=> (not res!748510) (not e!638014))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1120444 (= res!748510 (validKeyInArray!0 k!934))))

(declare-fun b!1120445 () Bool)

(declare-fun res!748504 () Bool)

(declare-fun e!638016 () Bool)

(assert (=> b!1120445 (=> (not res!748504) (not e!638016))))

(declare-datatypes ((List!24484 0))(
  ( (Nil!24481) (Cons!24480 (h!25689 (_ BitVec 64)) (t!35045 List!24484)) )
))
(declare-fun arrayNoDuplicates!0 (array!73081 (_ BitVec 32) List!24484) Bool)

(assert (=> b!1120445 (= res!748504 (arrayNoDuplicates!0 lt!498026 #b00000000000000000000000000000000 Nil!24481))))

(declare-fun b!1120446 () Bool)

(declare-fun res!748506 () Bool)

(assert (=> b!1120446 (=> (not res!748506) (not e!638014))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73081 (_ BitVec 32)) Bool)

(assert (=> b!1120446 (= res!748506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!748511 () Bool)

(assert (=> start!97868 (=> (not res!748511) (not e!638014))))

(assert (=> start!97868 (= res!748511 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35729 _keys!1208))))))

(assert (=> start!97868 e!638014))

(assert (=> start!97868 tp_is_empty!28099))

(declare-fun array_inv!27028 (array!73081) Bool)

(assert (=> start!97868 (array_inv!27028 _keys!1208)))

(assert (=> start!97868 true))

(assert (=> start!97868 tp!83411))

(declare-fun e!638013 () Bool)

(declare-fun array_inv!27029 (array!73079) Bool)

(assert (=> start!97868 (and (array_inv!27029 _values!996) e!638013)))

(declare-fun b!1120447 () Bool)

(declare-fun res!748513 () Bool)

(assert (=> b!1120447 (=> (not res!748513) (not e!638014))))

(assert (=> b!1120447 (= res!748513 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24481))))

(declare-fun b!1120448 () Bool)

(declare-fun res!748507 () Bool)

(assert (=> b!1120448 (=> (not res!748507) (not e!638014))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1120448 (= res!748507 (validMask!0 mask!1564))))

(declare-fun b!1120449 () Bool)

(assert (=> b!1120449 (= e!638014 e!638016)))

(declare-fun res!748509 () Bool)

(assert (=> b!1120449 (=> (not res!748509) (not e!638016))))

(assert (=> b!1120449 (= res!748509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498026 mask!1564))))

(assert (=> b!1120449 (= lt!498026 (array!73082 (store (arr!35193 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35729 _keys!1208)))))

(declare-fun mapIsEmpty!43966 () Bool)

(declare-fun mapRes!43966 () Bool)

(assert (=> mapIsEmpty!43966 mapRes!43966))

(declare-fun b!1120450 () Bool)

(declare-fun e!638015 () Bool)

(assert (=> b!1120450 (= e!638013 (and e!638015 mapRes!43966))))

(declare-fun condMapEmpty!43966 () Bool)

(declare-fun mapDefault!43966 () ValueCell!13340)

