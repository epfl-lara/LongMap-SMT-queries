; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111882 () Bool)

(assert start!111882)

(declare-fun b_free!30481 () Bool)

(declare-fun b_next!30481 () Bool)

(assert (=> start!111882 (= b_free!30481 (not b_next!30481))))

(declare-fun tp!106922 () Bool)

(declare-fun b_and!49057 () Bool)

(assert (=> start!111882 (= tp!106922 b_and!49057)))

(declare-fun b!1325698 () Bool)

(declare-fun res!879851 () Bool)

(declare-fun e!755703 () Bool)

(assert (=> b!1325698 (=> (not res!879851) (not e!755703))))

(declare-datatypes ((array!89510 0))(
  ( (array!89511 (arr!43228 (Array (_ BitVec 32) (_ BitVec 64))) (size!43778 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89510)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!53505 0))(
  ( (V!53506 (val!18225 Int)) )
))
(declare-fun zeroValue!1279 () V!53505)

(declare-datatypes ((ValueCell!17252 0))(
  ( (ValueCellFull!17252 (v!20858 V!53505)) (EmptyCell!17252) )
))
(declare-datatypes ((array!89512 0))(
  ( (array!89513 (arr!43229 (Array (_ BitVec 32) ValueCell!17252)) (size!43779 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89512)

(declare-fun minValue!1279 () V!53505)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23506 0))(
  ( (tuple2!23507 (_1!11764 (_ BitVec 64)) (_2!11764 V!53505)) )
))
(declare-datatypes ((List!30646 0))(
  ( (Nil!30643) (Cons!30642 (h!31851 tuple2!23506) (t!44598 List!30646)) )
))
(declare-datatypes ((ListLongMap!21163 0))(
  ( (ListLongMap!21164 (toList!10597 List!30646)) )
))
(declare-fun contains!8754 (ListLongMap!21163 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5591 (array!89510 array!89512 (_ BitVec 32) (_ BitVec 32) V!53505 V!53505 (_ BitVec 32) Int) ListLongMap!21163)

(assert (=> b!1325698 (= res!879851 (contains!8754 (getCurrentListMap!5591 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1325699 () Bool)

(assert (=> b!1325699 (= e!755703 (not true))))

(declare-fun lt!589826 () ListLongMap!21163)

(assert (=> b!1325699 (contains!8754 lt!589826 k!1164)))

(declare-datatypes ((Unit!43668 0))(
  ( (Unit!43669) )
))
(declare-fun lt!589827 () Unit!43668)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!212 ((_ BitVec 64) (_ BitVec 64) V!53505 ListLongMap!21163) Unit!43668)

(assert (=> b!1325699 (= lt!589827 (lemmaInListMapAfterAddingDiffThenInBefore!212 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589826))))

(declare-fun +!4620 (ListLongMap!21163 tuple2!23506) ListLongMap!21163)

(declare-fun getCurrentListMapNoExtraKeys!6258 (array!89510 array!89512 (_ BitVec 32) (_ BitVec 32) V!53505 V!53505 (_ BitVec 32) Int) ListLongMap!21163)

(declare-fun get!21775 (ValueCell!17252 V!53505) V!53505)

(declare-fun dynLambda!3559 (Int (_ BitVec 64)) V!53505)

(assert (=> b!1325699 (= lt!589826 (+!4620 (+!4620 (getCurrentListMapNoExtraKeys!6258 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23507 (select (arr!43228 _keys!1609) from!2000) (get!21775 (select (arr!43229 _values!1337) from!2000) (dynLambda!3559 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23507 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun mapNonEmpty!56103 () Bool)

(declare-fun mapRes!56103 () Bool)

(declare-fun tp!106923 () Bool)

(declare-fun e!755706 () Bool)

(assert (=> mapNonEmpty!56103 (= mapRes!56103 (and tp!106923 e!755706))))

(declare-fun mapValue!56103 () ValueCell!17252)

(declare-fun mapKey!56103 () (_ BitVec 32))

(declare-fun mapRest!56103 () (Array (_ BitVec 32) ValueCell!17252))

(assert (=> mapNonEmpty!56103 (= (arr!43229 _values!1337) (store mapRest!56103 mapKey!56103 mapValue!56103))))

(declare-fun b!1325700 () Bool)

(declare-fun res!879856 () Bool)

(assert (=> b!1325700 (=> (not res!879856) (not e!755703))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89510 (_ BitVec 32)) Bool)

(assert (=> b!1325700 (= res!879856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1325701 () Bool)

(declare-fun e!755705 () Bool)

(declare-fun tp_is_empty!36301 () Bool)

(assert (=> b!1325701 (= e!755705 tp_is_empty!36301)))

(declare-fun mapIsEmpty!56103 () Bool)

(assert (=> mapIsEmpty!56103 mapRes!56103))

(declare-fun res!879852 () Bool)

(assert (=> start!111882 (=> (not res!879852) (not e!755703))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111882 (= res!879852 (validMask!0 mask!2019))))

(assert (=> start!111882 e!755703))

(declare-fun array_inv!32629 (array!89510) Bool)

(assert (=> start!111882 (array_inv!32629 _keys!1609)))

(assert (=> start!111882 true))

(assert (=> start!111882 tp_is_empty!36301))

(declare-fun e!755704 () Bool)

(declare-fun array_inv!32630 (array!89512) Bool)

(assert (=> start!111882 (and (array_inv!32630 _values!1337) e!755704)))

(assert (=> start!111882 tp!106922))

(declare-fun b!1325702 () Bool)

(declare-fun res!879853 () Bool)

(assert (=> b!1325702 (=> (not res!879853) (not e!755703))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1325702 (= res!879853 (validKeyInArray!0 (select (arr!43228 _keys!1609) from!2000)))))

(declare-fun b!1325703 () Bool)

(declare-fun res!879855 () Bool)

(assert (=> b!1325703 (=> (not res!879855) (not e!755703))))

(assert (=> b!1325703 (= res!879855 (and (= (size!43779 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43778 _keys!1609) (size!43779 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1325704 () Bool)

(declare-fun res!879850 () Bool)

(assert (=> b!1325704 (=> (not res!879850) (not e!755703))))

(assert (=> b!1325704 (= res!879850 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43778 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1325705 () Bool)

(declare-fun res!879849 () Bool)

(assert (=> b!1325705 (=> (not res!879849) (not e!755703))))

(assert (=> b!1325705 (= res!879849 (not (= (select (arr!43228 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1325706 () Bool)

(declare-fun res!879854 () Bool)

(assert (=> b!1325706 (=> (not res!879854) (not e!755703))))

(declare-datatypes ((List!30647 0))(
  ( (Nil!30644) (Cons!30643 (h!31852 (_ BitVec 64)) (t!44599 List!30647)) )
))
(declare-fun arrayNoDuplicates!0 (array!89510 (_ BitVec 32) List!30647) Bool)

(assert (=> b!1325706 (= res!879854 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30644))))

(declare-fun b!1325707 () Bool)

(assert (=> b!1325707 (= e!755704 (and e!755705 mapRes!56103))))

(declare-fun condMapEmpty!56103 () Bool)

(declare-fun mapDefault!56103 () ValueCell!17252)

