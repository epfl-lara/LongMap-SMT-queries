; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111558 () Bool)

(assert start!111558)

(declare-fun b_free!30215 () Bool)

(declare-fun b_next!30215 () Bool)

(assert (=> start!111558 (= b_free!30215 (not b_next!30215))))

(declare-fun tp!106120 () Bool)

(declare-fun b_and!48589 () Bool)

(assert (=> start!111558 (= tp!106120 b_and!48589)))

(declare-fun mapIsEmpty!55700 () Bool)

(declare-fun mapRes!55700 () Bool)

(assert (=> mapIsEmpty!55700 mapRes!55700))

(declare-fun b!1320980 () Bool)

(declare-fun res!876762 () Bool)

(declare-fun e!753454 () Bool)

(assert (=> b!1320980 (=> (not res!876762) (not e!753454))))

(declare-datatypes ((array!89000 0))(
  ( (array!89001 (arr!42974 (Array (_ BitVec 32) (_ BitVec 64))) (size!43524 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89000)

(declare-datatypes ((List!30449 0))(
  ( (Nil!30446) (Cons!30445 (h!31654 (_ BitVec 64)) (t!44213 List!30449)) )
))
(declare-fun arrayNoDuplicates!0 (array!89000 (_ BitVec 32) List!30449) Bool)

(assert (=> b!1320980 (= res!876762 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30446))))

(declare-fun b!1320981 () Bool)

(declare-fun res!876758 () Bool)

(assert (=> b!1320981 (=> (not res!876758) (not e!753454))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1320981 (= res!876758 (not (= (select (arr!42974 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1320982 () Bool)

(declare-fun res!876763 () Bool)

(assert (=> b!1320982 (=> (not res!876763) (not e!753454))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1320982 (= res!876763 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43524 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1320983 () Bool)

(declare-fun res!876764 () Bool)

(assert (=> b!1320983 (=> (not res!876764) (not e!753454))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1320983 (= res!876764 (validKeyInArray!0 (select (arr!42974 _keys!1609) from!2000)))))

(declare-fun mapNonEmpty!55700 () Bool)

(declare-fun tp!106121 () Bool)

(declare-fun e!753450 () Bool)

(assert (=> mapNonEmpty!55700 (= mapRes!55700 (and tp!106121 e!753450))))

(declare-fun mapKey!55700 () (_ BitVec 32))

(declare-datatypes ((V!53149 0))(
  ( (V!53150 (val!18092 Int)) )
))
(declare-datatypes ((ValueCell!17119 0))(
  ( (ValueCellFull!17119 (v!20722 V!53149)) (EmptyCell!17119) )
))
(declare-datatypes ((array!89002 0))(
  ( (array!89003 (arr!42975 (Array (_ BitVec 32) ValueCell!17119)) (size!43525 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89002)

(declare-fun mapValue!55700 () ValueCell!17119)

(declare-fun mapRest!55700 () (Array (_ BitVec 32) ValueCell!17119))

(assert (=> mapNonEmpty!55700 (= (arr!42975 _values!1337) (store mapRest!55700 mapKey!55700 mapValue!55700))))

(declare-fun b!1320984 () Bool)

(declare-fun res!876760 () Bool)

(assert (=> b!1320984 (=> (not res!876760) (not e!753454))))

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1320984 (= res!876760 (and (= (size!43525 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43524 _keys!1609) (size!43525 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1320985 () Bool)

(declare-fun tp_is_empty!36035 () Bool)

(assert (=> b!1320985 (= e!753450 tp_is_empty!36035)))

(declare-fun b!1320986 () Bool)

(declare-fun res!876759 () Bool)

(assert (=> b!1320986 (=> (not res!876759) (not e!753454))))

(declare-fun minValue!1279 () V!53149)

(declare-fun defaultEntry!1340 () Int)

(declare-fun zeroValue!1279 () V!53149)

(declare-datatypes ((tuple2!23300 0))(
  ( (tuple2!23301 (_1!11661 (_ BitVec 64)) (_2!11661 V!53149)) )
))
(declare-datatypes ((List!30450 0))(
  ( (Nil!30447) (Cons!30446 (h!31655 tuple2!23300) (t!44214 List!30450)) )
))
(declare-datatypes ((ListLongMap!20957 0))(
  ( (ListLongMap!20958 (toList!10494 List!30450)) )
))
(declare-fun contains!8649 (ListLongMap!20957 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5497 (array!89000 array!89002 (_ BitVec 32) (_ BitVec 32) V!53149 V!53149 (_ BitVec 32) Int) ListLongMap!20957)

(assert (=> b!1320986 (= res!876759 (contains!8649 (getCurrentListMap!5497 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun res!876761 () Bool)

(assert (=> start!111558 (=> (not res!876761) (not e!753454))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111558 (= res!876761 (validMask!0 mask!2019))))

(assert (=> start!111558 e!753454))

(declare-fun array_inv!32443 (array!89000) Bool)

(assert (=> start!111558 (array_inv!32443 _keys!1609)))

(assert (=> start!111558 true))

(assert (=> start!111558 tp_is_empty!36035))

(declare-fun e!753451 () Bool)

(declare-fun array_inv!32444 (array!89002) Bool)

(assert (=> start!111558 (and (array_inv!32444 _values!1337) e!753451)))

(assert (=> start!111558 tp!106120))

(declare-fun b!1320987 () Bool)

(declare-fun res!876757 () Bool)

(assert (=> b!1320987 (=> (not res!876757) (not e!753454))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89000 (_ BitVec 32)) Bool)

(assert (=> b!1320987 (= res!876757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1320988 () Bool)

(declare-fun e!753453 () Bool)

(assert (=> b!1320988 (= e!753451 (and e!753453 mapRes!55700))))

(declare-fun condMapEmpty!55700 () Bool)

(declare-fun mapDefault!55700 () ValueCell!17119)

