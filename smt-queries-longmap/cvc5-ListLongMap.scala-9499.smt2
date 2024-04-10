; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112660 () Bool)

(assert start!112660)

(declare-fun b_free!30997 () Bool)

(declare-fun b_next!30997 () Bool)

(assert (=> start!112660 (= b_free!30997 (not b_next!30997))))

(declare-fun tp!108631 () Bool)

(declare-fun b_and!49931 () Bool)

(assert (=> start!112660 (= tp!108631 b_and!49931)))

(declare-fun b!1336253 () Bool)

(declare-fun e!761003 () Bool)

(assert (=> b!1336253 (= e!761003 (not true))))

(declare-datatypes ((V!54313 0))(
  ( (V!54314 (val!18528 Int)) )
))
(declare-datatypes ((tuple2!23896 0))(
  ( (tuple2!23897 (_1!11959 (_ BitVec 64)) (_2!11959 V!54313)) )
))
(declare-datatypes ((List!31038 0))(
  ( (Nil!31035) (Cons!31034 (h!32243 tuple2!23896) (t!45316 List!31038)) )
))
(declare-datatypes ((ListLongMap!21553 0))(
  ( (ListLongMap!21554 (toList!10792 List!31038)) )
))
(declare-fun lt!592745 () ListLongMap!21553)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun contains!8957 (ListLongMap!21553 (_ BitVec 64)) Bool)

(assert (=> b!1336253 (contains!8957 lt!592745 k!1153)))

(declare-datatypes ((Unit!43918 0))(
  ( (Unit!43919) )
))
(declare-fun lt!592744 () Unit!43918)

(declare-fun minValue!1262 () V!54313)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!314 ((_ BitVec 64) (_ BitVec 64) V!54313 ListLongMap!21553) Unit!43918)

(assert (=> b!1336253 (= lt!592744 (lemmaInListMapAfterAddingDiffThenInBefore!314 k!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!592745))))

(declare-datatypes ((ValueCell!17555 0))(
  ( (ValueCellFull!17555 (v!21168 V!54313)) (EmptyCell!17555) )
))
(declare-datatypes ((array!90674 0))(
  ( (array!90675 (arr!43802 (Array (_ BitVec 32) ValueCell!17555)) (size!44352 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90674)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90676 0))(
  ( (array!90677 (arr!43803 (Array (_ BitVec 32) (_ BitVec 64))) (size!44353 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90676)

(declare-fun defaultEntry!1323 () Int)

(declare-fun zeroValue!1262 () V!54313)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun +!4735 (ListLongMap!21553 tuple2!23896) ListLongMap!21553)

(declare-fun getCurrentListMapNoExtraKeys!6377 (array!90676 array!90674 (_ BitVec 32) (_ BitVec 32) V!54313 V!54313 (_ BitVec 32) Int) ListLongMap!21553)

(declare-fun get!22100 (ValueCell!17555 V!54313) V!54313)

(declare-fun dynLambda!3674 (Int (_ BitVec 64)) V!54313)

(assert (=> b!1336253 (= lt!592745 (+!4735 (getCurrentListMapNoExtraKeys!6377 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23897 (select (arr!43803 _keys!1590) from!1980) (get!22100 (select (arr!43802 _values!1320) from!1980) (dynLambda!3674 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1336254 () Bool)

(declare-fun res!886777 () Bool)

(assert (=> b!1336254 (=> (not res!886777) (not e!761003))))

(declare-fun getCurrentListMap!5764 (array!90676 array!90674 (_ BitVec 32) (_ BitVec 32) V!54313 V!54313 (_ BitVec 32) Int) ListLongMap!21553)

(assert (=> b!1336254 (= res!886777 (contains!8957 (getCurrentListMap!5764 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1336255 () Bool)

(declare-fun res!886779 () Bool)

(assert (=> b!1336255 (=> (not res!886779) (not e!761003))))

(declare-datatypes ((List!31039 0))(
  ( (Nil!31036) (Cons!31035 (h!32244 (_ BitVec 64)) (t!45317 List!31039)) )
))
(declare-fun arrayNoDuplicates!0 (array!90676 (_ BitVec 32) List!31039) Bool)

(assert (=> b!1336255 (= res!886779 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31036))))

(declare-fun b!1336256 () Bool)

(declare-fun res!886776 () Bool)

(assert (=> b!1336256 (=> (not res!886776) (not e!761003))))

(assert (=> b!1336256 (= res!886776 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!57038 () Bool)

(declare-fun mapRes!57038 () Bool)

(assert (=> mapIsEmpty!57038 mapRes!57038))

(declare-fun b!1336257 () Bool)

(declare-fun res!886774 () Bool)

(assert (=> b!1336257 (=> (not res!886774) (not e!761003))))

(assert (=> b!1336257 (= res!886774 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44353 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!886778 () Bool)

(assert (=> start!112660 (=> (not res!886778) (not e!761003))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112660 (= res!886778 (validMask!0 mask!1998))))

(assert (=> start!112660 e!761003))

(declare-fun e!761005 () Bool)

(declare-fun array_inv!33033 (array!90674) Bool)

(assert (=> start!112660 (and (array_inv!33033 _values!1320) e!761005)))

(assert (=> start!112660 true))

(declare-fun array_inv!33034 (array!90676) Bool)

(assert (=> start!112660 (array_inv!33034 _keys!1590)))

(assert (=> start!112660 tp!108631))

(declare-fun tp_is_empty!36907 () Bool)

(assert (=> start!112660 tp_is_empty!36907))

(declare-fun b!1336258 () Bool)

(declare-fun e!761001 () Bool)

(assert (=> b!1336258 (= e!761001 tp_is_empty!36907)))

(declare-fun b!1336259 () Bool)

(declare-fun e!761004 () Bool)

(assert (=> b!1336259 (= e!761004 tp_is_empty!36907)))

(declare-fun b!1336260 () Bool)

(declare-fun res!886775 () Bool)

(assert (=> b!1336260 (=> (not res!886775) (not e!761003))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1336260 (= res!886775 (validKeyInArray!0 (select (arr!43803 _keys!1590) from!1980)))))

(declare-fun b!1336261 () Bool)

(assert (=> b!1336261 (= e!761005 (and e!761001 mapRes!57038))))

(declare-fun condMapEmpty!57038 () Bool)

(declare-fun mapDefault!57038 () ValueCell!17555)

