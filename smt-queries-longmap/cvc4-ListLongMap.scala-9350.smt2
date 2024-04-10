; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111540 () Bool)

(assert start!111540)

(declare-fun b_free!30197 () Bool)

(declare-fun b_next!30197 () Bool)

(assert (=> start!111540 (= b_free!30197 (not b_next!30197))))

(declare-fun tp!106066 () Bool)

(declare-fun b_and!48553 () Bool)

(assert (=> start!111540 (= tp!106066 b_and!48553)))

(declare-fun res!876544 () Bool)

(declare-fun e!753317 () Bool)

(assert (=> start!111540 (=> (not res!876544) (not e!753317))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111540 (= res!876544 (validMask!0 mask!2019))))

(assert (=> start!111540 e!753317))

(declare-datatypes ((array!88964 0))(
  ( (array!88965 (arr!42956 (Array (_ BitVec 32) (_ BitVec 64))) (size!43506 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88964)

(declare-fun array_inv!32431 (array!88964) Bool)

(assert (=> start!111540 (array_inv!32431 _keys!1609)))

(assert (=> start!111540 true))

(declare-fun tp_is_empty!36017 () Bool)

(assert (=> start!111540 tp_is_empty!36017))

(declare-datatypes ((V!53125 0))(
  ( (V!53126 (val!18083 Int)) )
))
(declare-datatypes ((ValueCell!17110 0))(
  ( (ValueCellFull!17110 (v!20713 V!53125)) (EmptyCell!17110) )
))
(declare-datatypes ((array!88966 0))(
  ( (array!88967 (arr!42957 (Array (_ BitVec 32) ValueCell!17110)) (size!43507 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88966)

(declare-fun e!753318 () Bool)

(declare-fun array_inv!32432 (array!88966) Bool)

(assert (=> start!111540 (and (array_inv!32432 _values!1337) e!753318)))

(assert (=> start!111540 tp!106066))

(declare-fun mapIsEmpty!55673 () Bool)

(declare-fun mapRes!55673 () Bool)

(assert (=> mapIsEmpty!55673 mapRes!55673))

(declare-fun b!1320665 () Bool)

(declare-fun res!876545 () Bool)

(assert (=> b!1320665 (=> (not res!876545) (not e!753317))))

(declare-datatypes ((List!30436 0))(
  ( (Nil!30433) (Cons!30432 (h!31641 (_ BitVec 64)) (t!44182 List!30436)) )
))
(declare-fun arrayNoDuplicates!0 (array!88964 (_ BitVec 32) List!30436) Bool)

(assert (=> b!1320665 (= res!876545 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30433))))

(declare-fun b!1320666 () Bool)

(declare-fun res!876548 () Bool)

(assert (=> b!1320666 (=> (not res!876548) (not e!753317))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun minValue!1279 () V!53125)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun zeroValue!1279 () V!53125)

(declare-datatypes ((tuple2!23286 0))(
  ( (tuple2!23287 (_1!11654 (_ BitVec 64)) (_2!11654 V!53125)) )
))
(declare-datatypes ((List!30437 0))(
  ( (Nil!30434) (Cons!30433 (h!31642 tuple2!23286) (t!44183 List!30437)) )
))
(declare-datatypes ((ListLongMap!20943 0))(
  ( (ListLongMap!20944 (toList!10487 List!30437)) )
))
(declare-fun contains!8642 (ListLongMap!20943 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5491 (array!88964 array!88966 (_ BitVec 32) (_ BitVec 32) V!53125 V!53125 (_ BitVec 32) Int) ListLongMap!20943)

(assert (=> b!1320666 (= res!876548 (contains!8642 (getCurrentListMap!5491 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun mapNonEmpty!55673 () Bool)

(declare-fun tp!106067 () Bool)

(declare-fun e!753316 () Bool)

(assert (=> mapNonEmpty!55673 (= mapRes!55673 (and tp!106067 e!753316))))

(declare-fun mapKey!55673 () (_ BitVec 32))

(declare-fun mapRest!55673 () (Array (_ BitVec 32) ValueCell!17110))

(declare-fun mapValue!55673 () ValueCell!17110)

(assert (=> mapNonEmpty!55673 (= (arr!42957 _values!1337) (store mapRest!55673 mapKey!55673 mapValue!55673))))

(declare-fun b!1320667 () Bool)

(declare-fun res!876543 () Bool)

(assert (=> b!1320667 (=> (not res!876543) (not e!753317))))

(assert (=> b!1320667 (= res!876543 (not (= (select (arr!42956 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1320668 () Bool)

(assert (=> b!1320668 (= e!753316 tp_is_empty!36017)))

(declare-fun b!1320669 () Bool)

(declare-fun res!876541 () Bool)

(assert (=> b!1320669 (=> (not res!876541) (not e!753317))))

(assert (=> b!1320669 (= res!876541 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43506 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1320670 () Bool)

(assert (=> b!1320670 (= e!753317 (not true))))

(declare-fun lt!587031 () ListLongMap!20943)

(assert (=> b!1320670 (contains!8642 lt!587031 k!1164)))

(declare-datatypes ((Unit!43512 0))(
  ( (Unit!43513) )
))
(declare-fun lt!587028 () Unit!43512)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!142 ((_ BitVec 64) (_ BitVec 64) V!53125 ListLongMap!20943) Unit!43512)

(assert (=> b!1320670 (= lt!587028 (lemmaInListMapAfterAddingDiffThenInBefore!142 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587031))))

(declare-fun lt!587030 () ListLongMap!20943)

(assert (=> b!1320670 (contains!8642 lt!587030 k!1164)))

(declare-fun lt!587029 () Unit!43512)

(assert (=> b!1320670 (= lt!587029 (lemmaInListMapAfterAddingDiffThenInBefore!142 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587030))))

(declare-fun +!4546 (ListLongMap!20943 tuple2!23286) ListLongMap!20943)

(assert (=> b!1320670 (= lt!587030 (+!4546 lt!587031 (tuple2!23287 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun getCurrentListMapNoExtraKeys!6181 (array!88964 array!88966 (_ BitVec 32) (_ BitVec 32) V!53125 V!53125 (_ BitVec 32) Int) ListLongMap!20943)

(declare-fun get!21602 (ValueCell!17110 V!53125) V!53125)

(declare-fun dynLambda!3485 (Int (_ BitVec 64)) V!53125)

(assert (=> b!1320670 (= lt!587031 (+!4546 (getCurrentListMapNoExtraKeys!6181 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23287 (select (arr!42956 _keys!1609) from!2000) (get!21602 (select (arr!42957 _values!1337) from!2000) (dynLambda!3485 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1320671 () Bool)

(declare-fun res!876547 () Bool)

(assert (=> b!1320671 (=> (not res!876547) (not e!753317))))

(assert (=> b!1320671 (= res!876547 (and (= (size!43507 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43506 _keys!1609) (size!43507 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1320672 () Bool)

(declare-fun res!876542 () Bool)

(assert (=> b!1320672 (=> (not res!876542) (not e!753317))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1320672 (= res!876542 (validKeyInArray!0 (select (arr!42956 _keys!1609) from!2000)))))

(declare-fun b!1320673 () Bool)

(declare-fun res!876546 () Bool)

(assert (=> b!1320673 (=> (not res!876546) (not e!753317))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88964 (_ BitVec 32)) Bool)

(assert (=> b!1320673 (= res!876546 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1320674 () Bool)

(declare-fun e!753319 () Bool)

(assert (=> b!1320674 (= e!753319 tp_is_empty!36017)))

(declare-fun b!1320675 () Bool)

(assert (=> b!1320675 (= e!753318 (and e!753319 mapRes!55673))))

(declare-fun condMapEmpty!55673 () Bool)

(declare-fun mapDefault!55673 () ValueCell!17110)

