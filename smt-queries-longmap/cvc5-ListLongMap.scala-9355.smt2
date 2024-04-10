; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111566 () Bool)

(assert start!111566)

(declare-fun b_free!30223 () Bool)

(declare-fun b_next!30223 () Bool)

(assert (=> start!111566 (= b_free!30223 (not b_next!30223))))

(declare-fun tp!106144 () Bool)

(declare-fun b_and!48605 () Bool)

(assert (=> start!111566 (= tp!106144 b_and!48605)))

(declare-fun b!1321120 () Bool)

(declare-fun res!876857 () Bool)

(declare-fun e!753514 () Bool)

(assert (=> b!1321120 (=> (not res!876857) (not e!753514))))

(declare-datatypes ((array!89014 0))(
  ( (array!89015 (arr!42981 (Array (_ BitVec 32) (_ BitVec 64))) (size!43531 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89014)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1321120 (= res!876857 (not (= (select (arr!42981 _keys!1609) from!2000) k!1164)))))

(declare-fun mapIsEmpty!55712 () Bool)

(declare-fun mapRes!55712 () Bool)

(assert (=> mapIsEmpty!55712 mapRes!55712))

(declare-fun b!1321121 () Bool)

(declare-fun res!876856 () Bool)

(assert (=> b!1321121 (=> (not res!876856) (not e!753514))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1321121 (= res!876856 (validKeyInArray!0 (select (arr!42981 _keys!1609) from!2000)))))

(declare-fun b!1321122 () Bool)

(declare-fun res!876854 () Bool)

(assert (=> b!1321122 (=> (not res!876854) (not e!753514))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1321122 (= res!876854 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43531 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1321123 () Bool)

(declare-fun res!876853 () Bool)

(assert (=> b!1321123 (=> (not res!876853) (not e!753514))))

(declare-datatypes ((V!53161 0))(
  ( (V!53162 (val!18096 Int)) )
))
(declare-fun zeroValue!1279 () V!53161)

(declare-datatypes ((ValueCell!17123 0))(
  ( (ValueCellFull!17123 (v!20726 V!53161)) (EmptyCell!17123) )
))
(declare-datatypes ((array!89016 0))(
  ( (array!89017 (arr!42982 (Array (_ BitVec 32) ValueCell!17123)) (size!43532 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89016)

(declare-fun minValue!1279 () V!53161)

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23306 0))(
  ( (tuple2!23307 (_1!11664 (_ BitVec 64)) (_2!11664 V!53161)) )
))
(declare-datatypes ((List!30455 0))(
  ( (Nil!30452) (Cons!30451 (h!31660 tuple2!23306) (t!44227 List!30455)) )
))
(declare-datatypes ((ListLongMap!20963 0))(
  ( (ListLongMap!20964 (toList!10497 List!30455)) )
))
(declare-fun contains!8652 (ListLongMap!20963 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5500 (array!89014 array!89016 (_ BitVec 32) (_ BitVec 32) V!53161 V!53161 (_ BitVec 32) Int) ListLongMap!20963)

(assert (=> b!1321123 (= res!876853 (contains!8652 (getCurrentListMap!5500 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1321124 () Bool)

(assert (=> b!1321124 (= e!753514 (not true))))

(declare-fun lt!587273 () ListLongMap!20963)

(assert (=> b!1321124 (contains!8652 lt!587273 k!1164)))

(declare-datatypes ((Unit!43528 0))(
  ( (Unit!43529) )
))
(declare-fun lt!587271 () Unit!43528)

(declare-fun lt!587272 () V!53161)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!150 ((_ BitVec 64) (_ BitVec 64) V!53161 ListLongMap!20963) Unit!43528)

(assert (=> b!1321124 (= lt!587271 (lemmaInListMapAfterAddingDiffThenInBefore!150 k!1164 (select (arr!42981 _keys!1609) from!2000) lt!587272 lt!587273))))

(declare-fun lt!587277 () ListLongMap!20963)

(assert (=> b!1321124 (contains!8652 lt!587277 k!1164)))

(declare-fun lt!587276 () Unit!43528)

(assert (=> b!1321124 (= lt!587276 (lemmaInListMapAfterAddingDiffThenInBefore!150 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587277))))

(declare-fun lt!587274 () ListLongMap!20963)

(assert (=> b!1321124 (contains!8652 lt!587274 k!1164)))

(declare-fun lt!587275 () Unit!43528)

(assert (=> b!1321124 (= lt!587275 (lemmaInListMapAfterAddingDiffThenInBefore!150 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587274))))

(declare-fun +!4554 (ListLongMap!20963 tuple2!23306) ListLongMap!20963)

(assert (=> b!1321124 (= lt!587274 (+!4554 lt!587277 (tuple2!23307 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (=> b!1321124 (= lt!587277 (+!4554 lt!587273 (tuple2!23307 (select (arr!42981 _keys!1609) from!2000) lt!587272)))))

(declare-fun get!21620 (ValueCell!17123 V!53161) V!53161)

(declare-fun dynLambda!3493 (Int (_ BitVec 64)) V!53161)

(assert (=> b!1321124 (= lt!587272 (get!21620 (select (arr!42982 _values!1337) from!2000) (dynLambda!3493 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6189 (array!89014 array!89016 (_ BitVec 32) (_ BitVec 32) V!53161 V!53161 (_ BitVec 32) Int) ListLongMap!20963)

(assert (=> b!1321124 (= lt!587273 (getCurrentListMapNoExtraKeys!6189 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1321125 () Bool)

(declare-fun e!753511 () Bool)

(declare-fun tp_is_empty!36043 () Bool)

(assert (=> b!1321125 (= e!753511 tp_is_empty!36043)))

(declare-fun b!1321126 () Bool)

(declare-fun res!876855 () Bool)

(assert (=> b!1321126 (=> (not res!876855) (not e!753514))))

(assert (=> b!1321126 (= res!876855 (and (= (size!43532 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43531 _keys!1609) (size!43532 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1321127 () Bool)

(declare-fun e!753513 () Bool)

(assert (=> b!1321127 (= e!753513 tp_is_empty!36043)))

(declare-fun res!876859 () Bool)

(assert (=> start!111566 (=> (not res!876859) (not e!753514))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111566 (= res!876859 (validMask!0 mask!2019))))

(assert (=> start!111566 e!753514))

(declare-fun array_inv!32447 (array!89014) Bool)

(assert (=> start!111566 (array_inv!32447 _keys!1609)))

(assert (=> start!111566 true))

(assert (=> start!111566 tp_is_empty!36043))

(declare-fun e!753510 () Bool)

(declare-fun array_inv!32448 (array!89016) Bool)

(assert (=> start!111566 (and (array_inv!32448 _values!1337) e!753510)))

(assert (=> start!111566 tp!106144))

(declare-fun b!1321128 () Bool)

(declare-fun res!876858 () Bool)

(assert (=> b!1321128 (=> (not res!876858) (not e!753514))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89014 (_ BitVec 32)) Bool)

(assert (=> b!1321128 (= res!876858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1321129 () Bool)

(assert (=> b!1321129 (= e!753510 (and e!753511 mapRes!55712))))

(declare-fun condMapEmpty!55712 () Bool)

(declare-fun mapDefault!55712 () ValueCell!17123)

