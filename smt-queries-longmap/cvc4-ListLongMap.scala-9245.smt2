; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110822 () Bool)

(assert start!110822)

(declare-fun b_free!29657 () Bool)

(declare-fun b_next!29657 () Bool)

(assert (=> start!110822 (= b_free!29657 (not b_next!29657))))

(declare-fun tp!104293 () Bool)

(declare-fun b_and!47865 () Bool)

(assert (=> start!110822 (= tp!104293 b_and!47865)))

(declare-fun b!1311740 () Bool)

(declare-fun res!870833 () Bool)

(declare-fun e!748291 () Bool)

(assert (=> b!1311740 (=> (not res!870833) (not e!748291))))

(declare-datatypes ((array!87762 0))(
  ( (array!87763 (arr!42361 (Array (_ BitVec 32) (_ BitVec 64))) (size!42911 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87762)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1311740 (= res!870833 (validKeyInArray!0 (select (arr!42361 _keys!1628) from!2020)))))

(declare-fun b!1311741 () Bool)

(declare-fun res!870826 () Bool)

(assert (=> b!1311741 (=> (not res!870826) (not e!748291))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1311741 (= res!870826 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1311742 () Bool)

(declare-fun res!870834 () Bool)

(assert (=> b!1311742 (=> (not res!870834) (not e!748291))))

(declare-fun k!1175 () (_ BitVec 64))

(assert (=> b!1311742 (= res!870834 (not (= (select (arr!42361 _keys!1628) from!2020) k!1175)))))

(declare-fun b!1311743 () Bool)

(declare-fun res!870828 () Bool)

(assert (=> b!1311743 (=> (not res!870828) (not e!748291))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87762 (_ BitVec 32)) Bool)

(assert (=> b!1311743 (= res!870828 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1311744 () Bool)

(assert (=> b!1311744 (= e!748291 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((V!52285 0))(
  ( (V!52286 (val!17768 Int)) )
))
(declare-fun minValue!1296 () V!52285)

(declare-datatypes ((ValueCell!16795 0))(
  ( (ValueCellFull!16795 (v!20395 V!52285)) (EmptyCell!16795) )
))
(declare-datatypes ((array!87764 0))(
  ( (array!87765 (arr!42362 (Array (_ BitVec 32) ValueCell!16795)) (size!42912 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87764)

(declare-fun zeroValue!1296 () V!52285)

(declare-datatypes ((tuple2!22900 0))(
  ( (tuple2!22901 (_1!11461 (_ BitVec 64)) (_2!11461 V!52285)) )
))
(declare-datatypes ((List!30039 0))(
  ( (Nil!30036) (Cons!30035 (h!31244 tuple2!22900) (t!43645 List!30039)) )
))
(declare-datatypes ((ListLongMap!20557 0))(
  ( (ListLongMap!20558 (toList!10294 List!30039)) )
))
(declare-fun contains!8444 (ListLongMap!20557 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5307 (array!87762 array!87764 (_ BitVec 32) (_ BitVec 32) V!52285 V!52285 (_ BitVec 32) Int) ListLongMap!20557)

(assert (=> b!1311744 (contains!8444 (getCurrentListMap!5307 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k!1175)))

(declare-datatypes ((Unit!43354 0))(
  ( (Unit!43355) )
))
(declare-fun lt!585504 () Unit!43354)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!4 (array!87762 array!87764 (_ BitVec 32) (_ BitVec 32) V!52285 V!52285 (_ BitVec 64) (_ BitVec 32) Int) Unit!43354)

(assert (=> b!1311744 (= lt!585504 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!4 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1311745 () Bool)

(declare-fun res!870827 () Bool)

(assert (=> b!1311745 (=> (not res!870827) (not e!748291))))

(assert (=> b!1311745 (= res!870827 (contains!8444 (getCurrentListMap!5307 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun mapNonEmpty!54709 () Bool)

(declare-fun mapRes!54709 () Bool)

(declare-fun tp!104292 () Bool)

(declare-fun e!748288 () Bool)

(assert (=> mapNonEmpty!54709 (= mapRes!54709 (and tp!104292 e!748288))))

(declare-fun mapRest!54709 () (Array (_ BitVec 32) ValueCell!16795))

(declare-fun mapValue!54709 () ValueCell!16795)

(declare-fun mapKey!54709 () (_ BitVec 32))

(assert (=> mapNonEmpty!54709 (= (arr!42362 _values!1354) (store mapRest!54709 mapKey!54709 mapValue!54709))))

(declare-fun b!1311746 () Bool)

(declare-fun e!748289 () Bool)

(declare-fun tp_is_empty!35387 () Bool)

(assert (=> b!1311746 (= e!748289 tp_is_empty!35387)))

(declare-fun mapIsEmpty!54709 () Bool)

(assert (=> mapIsEmpty!54709 mapRes!54709))

(declare-fun res!870829 () Bool)

(assert (=> start!110822 (=> (not res!870829) (not e!748291))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110822 (= res!870829 (validMask!0 mask!2040))))

(assert (=> start!110822 e!748291))

(assert (=> start!110822 tp!104293))

(declare-fun array_inv!32013 (array!87762) Bool)

(assert (=> start!110822 (array_inv!32013 _keys!1628)))

(assert (=> start!110822 true))

(assert (=> start!110822 tp_is_empty!35387))

(declare-fun e!748292 () Bool)

(declare-fun array_inv!32014 (array!87764) Bool)

(assert (=> start!110822 (and (array_inv!32014 _values!1354) e!748292)))

(declare-fun b!1311739 () Bool)

(assert (=> b!1311739 (= e!748288 tp_is_empty!35387)))

(declare-fun b!1311747 () Bool)

(declare-fun res!870832 () Bool)

(assert (=> b!1311747 (=> (not res!870832) (not e!748291))))

(declare-datatypes ((List!30040 0))(
  ( (Nil!30037) (Cons!30036 (h!31245 (_ BitVec 64)) (t!43646 List!30040)) )
))
(declare-fun arrayNoDuplicates!0 (array!87762 (_ BitVec 32) List!30040) Bool)

(assert (=> b!1311747 (= res!870832 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30037))))

(declare-fun b!1311748 () Bool)

(declare-fun res!870831 () Bool)

(assert (=> b!1311748 (=> (not res!870831) (not e!748291))))

(assert (=> b!1311748 (= res!870831 (and (= (size!42912 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42911 _keys!1628) (size!42912 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1311749 () Bool)

(assert (=> b!1311749 (= e!748292 (and e!748289 mapRes!54709))))

(declare-fun condMapEmpty!54709 () Bool)

(declare-fun mapDefault!54709 () ValueCell!16795)

