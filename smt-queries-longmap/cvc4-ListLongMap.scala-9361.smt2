; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111606 () Bool)

(assert start!111606)

(declare-fun b_free!30263 () Bool)

(declare-fun b_next!30263 () Bool)

(assert (=> start!111606 (= b_free!30263 (not b_next!30263))))

(declare-fun tp!106265 () Bool)

(declare-fun b_and!48685 () Bool)

(assert (=> start!111606 (= tp!106265 b_and!48685)))

(declare-fun b!1321820 () Bool)

(declare-fun res!877333 () Bool)

(declare-fun e!753813 () Bool)

(assert (=> b!1321820 (=> (not res!877333) (not e!753813))))

(declare-datatypes ((array!89090 0))(
  ( (array!89091 (arr!43019 (Array (_ BitVec 32) (_ BitVec 64))) (size!43569 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89090)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!53213 0))(
  ( (V!53214 (val!18116 Int)) )
))
(declare-fun zeroValue!1279 () V!53213)

(declare-datatypes ((ValueCell!17143 0))(
  ( (ValueCellFull!17143 (v!20746 V!53213)) (EmptyCell!17143) )
))
(declare-datatypes ((array!89092 0))(
  ( (array!89093 (arr!43020 (Array (_ BitVec 32) ValueCell!17143)) (size!43570 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89092)

(declare-fun minValue!1279 () V!53213)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23334 0))(
  ( (tuple2!23335 (_1!11678 (_ BitVec 64)) (_2!11678 V!53213)) )
))
(declare-datatypes ((List!30483 0))(
  ( (Nil!30480) (Cons!30479 (h!31688 tuple2!23334) (t!44295 List!30483)) )
))
(declare-datatypes ((ListLongMap!20991 0))(
  ( (ListLongMap!20992 (toList!10511 List!30483)) )
))
(declare-fun contains!8666 (ListLongMap!20991 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5512 (array!89090 array!89092 (_ BitVec 32) (_ BitVec 32) V!53213 V!53213 (_ BitVec 32) Int) ListLongMap!20991)

(assert (=> b!1321820 (= res!877333 (contains!8666 (getCurrentListMap!5512 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun res!877335 () Bool)

(assert (=> start!111606 (=> (not res!877335) (not e!753813))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111606 (= res!877335 (validMask!0 mask!2019))))

(assert (=> start!111606 e!753813))

(declare-fun array_inv!32479 (array!89090) Bool)

(assert (=> start!111606 (array_inv!32479 _keys!1609)))

(assert (=> start!111606 true))

(declare-fun tp_is_empty!36083 () Bool)

(assert (=> start!111606 tp_is_empty!36083))

(declare-fun e!753812 () Bool)

(declare-fun array_inv!32480 (array!89092) Bool)

(assert (=> start!111606 (and (array_inv!32480 _values!1337) e!753812)))

(assert (=> start!111606 tp!106265))

(declare-fun b!1321821 () Bool)

(declare-fun res!877337 () Bool)

(assert (=> b!1321821 (=> (not res!877337) (not e!753813))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89090 (_ BitVec 32)) Bool)

(assert (=> b!1321821 (= res!877337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1321822 () Bool)

(declare-fun res!877334 () Bool)

(assert (=> b!1321822 (=> (not res!877334) (not e!753813))))

(assert (=> b!1321822 (= res!877334 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43569 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1321823 () Bool)

(assert (=> b!1321823 (= e!753813 (not true))))

(declare-fun lt!587696 () ListLongMap!20991)

(assert (=> b!1321823 (contains!8666 lt!587696 k!1164)))

(declare-fun lt!587693 () V!53213)

(declare-datatypes ((Unit!43554 0))(
  ( (Unit!43555) )
))
(declare-fun lt!587695 () Unit!43554)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!163 ((_ BitVec 64) (_ BitVec 64) V!53213 ListLongMap!20991) Unit!43554)

(assert (=> b!1321823 (= lt!587695 (lemmaInListMapAfterAddingDiffThenInBefore!163 k!1164 (select (arr!43019 _keys!1609) from!2000) lt!587693 lt!587696))))

(declare-fun lt!587692 () ListLongMap!20991)

(assert (=> b!1321823 (contains!8666 lt!587692 k!1164)))

(declare-fun lt!587691 () Unit!43554)

(assert (=> b!1321823 (= lt!587691 (lemmaInListMapAfterAddingDiffThenInBefore!163 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587692))))

(declare-fun lt!587694 () ListLongMap!20991)

(assert (=> b!1321823 (contains!8666 lt!587694 k!1164)))

(declare-fun lt!587697 () Unit!43554)

(assert (=> b!1321823 (= lt!587697 (lemmaInListMapAfterAddingDiffThenInBefore!163 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587694))))

(declare-fun +!4567 (ListLongMap!20991 tuple2!23334) ListLongMap!20991)

(assert (=> b!1321823 (= lt!587694 (+!4567 lt!587692 (tuple2!23335 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (=> b!1321823 (= lt!587692 (+!4567 lt!587696 (tuple2!23335 (select (arr!43019 _keys!1609) from!2000) lt!587693)))))

(declare-fun get!21645 (ValueCell!17143 V!53213) V!53213)

(declare-fun dynLambda!3506 (Int (_ BitVec 64)) V!53213)

(assert (=> b!1321823 (= lt!587693 (get!21645 (select (arr!43020 _values!1337) from!2000) (dynLambda!3506 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6202 (array!89090 array!89092 (_ BitVec 32) (_ BitVec 32) V!53213 V!53213 (_ BitVec 32) Int) ListLongMap!20991)

(assert (=> b!1321823 (= lt!587696 (getCurrentListMapNoExtraKeys!6202 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1321824 () Bool)

(declare-fun e!753811 () Bool)

(declare-fun mapRes!55772 () Bool)

(assert (=> b!1321824 (= e!753812 (and e!753811 mapRes!55772))))

(declare-fun condMapEmpty!55772 () Bool)

(declare-fun mapDefault!55772 () ValueCell!17143)

