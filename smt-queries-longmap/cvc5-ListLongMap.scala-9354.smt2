; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111560 () Bool)

(assert start!111560)

(declare-fun b_free!30217 () Bool)

(declare-fun b_next!30217 () Bool)

(assert (=> start!111560 (= b_free!30217 (not b_next!30217))))

(declare-fun tp!106126 () Bool)

(declare-fun b_and!48593 () Bool)

(assert (=> start!111560 (= tp!106126 b_and!48593)))

(declare-fun b!1321015 () Bool)

(declare-fun res!876785 () Bool)

(declare-fun e!753465 () Bool)

(assert (=> b!1321015 (=> (not res!876785) (not e!753465))))

(declare-datatypes ((array!89004 0))(
  ( (array!89005 (arr!42976 (Array (_ BitVec 32) (_ BitVec 64))) (size!43526 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89004)

(declare-datatypes ((List!30451 0))(
  ( (Nil!30448) (Cons!30447 (h!31656 (_ BitVec 64)) (t!44217 List!30451)) )
))
(declare-fun arrayNoDuplicates!0 (array!89004 (_ BitVec 32) List!30451) Bool)

(assert (=> b!1321015 (= res!876785 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30448))))

(declare-fun b!1321016 () Bool)

(declare-fun res!876781 () Bool)

(assert (=> b!1321016 (=> (not res!876781) (not e!753465))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1321016 (= res!876781 (validKeyInArray!0 (select (arr!42976 _keys!1609) from!2000)))))

(declare-fun b!1321017 () Bool)

(declare-fun res!876788 () Bool)

(assert (=> b!1321017 (=> (not res!876788) (not e!753465))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89004 (_ BitVec 32)) Bool)

(assert (=> b!1321017 (= res!876788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1321019 () Bool)

(declare-fun res!876784 () Bool)

(assert (=> b!1321019 (=> (not res!876784) (not e!753465))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53153 0))(
  ( (V!53154 (val!18093 Int)) )
))
(declare-datatypes ((ValueCell!17120 0))(
  ( (ValueCellFull!17120 (v!20723 V!53153)) (EmptyCell!17120) )
))
(declare-datatypes ((array!89006 0))(
  ( (array!89007 (arr!42977 (Array (_ BitVec 32) ValueCell!17120)) (size!43527 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89006)

(assert (=> b!1321019 (= res!876784 (and (= (size!43527 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43526 _keys!1609) (size!43527 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1321020 () Bool)

(declare-fun res!876786 () Bool)

(assert (=> b!1321020 (=> (not res!876786) (not e!753465))))

(declare-fun zeroValue!1279 () V!53153)

(declare-fun minValue!1279 () V!53153)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23302 0))(
  ( (tuple2!23303 (_1!11662 (_ BitVec 64)) (_2!11662 V!53153)) )
))
(declare-datatypes ((List!30452 0))(
  ( (Nil!30449) (Cons!30448 (h!31657 tuple2!23302) (t!44218 List!30452)) )
))
(declare-datatypes ((ListLongMap!20959 0))(
  ( (ListLongMap!20960 (toList!10495 List!30452)) )
))
(declare-fun contains!8650 (ListLongMap!20959 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5498 (array!89004 array!89006 (_ BitVec 32) (_ BitVec 32) V!53153 V!53153 (_ BitVec 32) Int) ListLongMap!20959)

(assert (=> b!1321020 (= res!876786 (contains!8650 (getCurrentListMap!5498 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun mapIsEmpty!55703 () Bool)

(declare-fun mapRes!55703 () Bool)

(assert (=> mapIsEmpty!55703 mapRes!55703))

(declare-fun b!1321021 () Bool)

(assert (=> b!1321021 (= e!753465 (not true))))

(declare-fun lt!587213 () ListLongMap!20959)

(assert (=> b!1321021 (contains!8650 lt!587213 k!1164)))

(declare-fun lt!587214 () V!53153)

(declare-datatypes ((Unit!43524 0))(
  ( (Unit!43525) )
))
(declare-fun lt!587208 () Unit!43524)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!148 ((_ BitVec 64) (_ BitVec 64) V!53153 ListLongMap!20959) Unit!43524)

(assert (=> b!1321021 (= lt!587208 (lemmaInListMapAfterAddingDiffThenInBefore!148 k!1164 (select (arr!42976 _keys!1609) from!2000) lt!587214 lt!587213))))

(declare-fun lt!587212 () ListLongMap!20959)

(assert (=> b!1321021 (contains!8650 lt!587212 k!1164)))

(declare-fun lt!587209 () Unit!43524)

(assert (=> b!1321021 (= lt!587209 (lemmaInListMapAfterAddingDiffThenInBefore!148 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587212))))

(declare-fun lt!587210 () ListLongMap!20959)

(assert (=> b!1321021 (contains!8650 lt!587210 k!1164)))

(declare-fun lt!587211 () Unit!43524)

(assert (=> b!1321021 (= lt!587211 (lemmaInListMapAfterAddingDiffThenInBefore!148 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587210))))

(declare-fun +!4552 (ListLongMap!20959 tuple2!23302) ListLongMap!20959)

(assert (=> b!1321021 (= lt!587210 (+!4552 lt!587212 (tuple2!23303 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (=> b!1321021 (= lt!587212 (+!4552 lt!587213 (tuple2!23303 (select (arr!42976 _keys!1609) from!2000) lt!587214)))))

(declare-fun get!21616 (ValueCell!17120 V!53153) V!53153)

(declare-fun dynLambda!3491 (Int (_ BitVec 64)) V!53153)

(assert (=> b!1321021 (= lt!587214 (get!21616 (select (arr!42977 _values!1337) from!2000) (dynLambda!3491 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6187 (array!89004 array!89006 (_ BitVec 32) (_ BitVec 32) V!53153 V!53153 (_ BitVec 32) Int) ListLongMap!20959)

(assert (=> b!1321021 (= lt!587213 (getCurrentListMapNoExtraKeys!6187 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1321022 () Bool)

(declare-fun res!876783 () Bool)

(assert (=> b!1321022 (=> (not res!876783) (not e!753465))))

(assert (=> b!1321022 (= res!876783 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43526 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!55703 () Bool)

(declare-fun tp!106127 () Bool)

(declare-fun e!753467 () Bool)

(assert (=> mapNonEmpty!55703 (= mapRes!55703 (and tp!106127 e!753467))))

(declare-fun mapValue!55703 () ValueCell!17120)

(declare-fun mapKey!55703 () (_ BitVec 32))

(declare-fun mapRest!55703 () (Array (_ BitVec 32) ValueCell!17120))

(assert (=> mapNonEmpty!55703 (= (arr!42977 _values!1337) (store mapRest!55703 mapKey!55703 mapValue!55703))))

(declare-fun b!1321023 () Bool)

(declare-fun e!753468 () Bool)

(declare-fun e!753469 () Bool)

(assert (=> b!1321023 (= e!753468 (and e!753469 mapRes!55703))))

(declare-fun condMapEmpty!55703 () Bool)

(declare-fun mapDefault!55703 () ValueCell!17120)

