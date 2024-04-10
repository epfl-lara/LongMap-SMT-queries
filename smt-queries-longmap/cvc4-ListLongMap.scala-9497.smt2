; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112594 () Bool)

(assert start!112594)

(declare-fun b_free!30989 () Bool)

(declare-fun b_next!30989 () Bool)

(assert (=> start!112594 (= b_free!30989 (not b_next!30989))))

(declare-fun tp!108603 () Bool)

(declare-fun b_and!49901 () Bool)

(assert (=> start!112594 (= tp!108603 b_and!49901)))

(declare-fun b!1335717 () Bool)

(declare-fun res!886510 () Bool)

(declare-fun e!760702 () Bool)

(assert (=> b!1335717 (=> (not res!886510) (not e!760702))))

(declare-datatypes ((array!90656 0))(
  ( (array!90657 (arr!43794 (Array (_ BitVec 32) (_ BitVec 64))) (size!44344 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90656)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90656 (_ BitVec 32)) Bool)

(assert (=> b!1335717 (= res!886510 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1335718 () Bool)

(declare-fun res!886508 () Bool)

(assert (=> b!1335718 (=> (not res!886508) (not e!760702))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1335718 (= res!886508 (not (= (select (arr!43794 _keys!1590) from!1980) k!1153)))))

(declare-fun res!886506 () Bool)

(assert (=> start!112594 (=> (not res!886506) (not e!760702))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112594 (= res!886506 (validMask!0 mask!1998))))

(assert (=> start!112594 e!760702))

(declare-datatypes ((V!54301 0))(
  ( (V!54302 (val!18524 Int)) )
))
(declare-datatypes ((ValueCell!17551 0))(
  ( (ValueCellFull!17551 (v!21161 V!54301)) (EmptyCell!17551) )
))
(declare-datatypes ((array!90658 0))(
  ( (array!90659 (arr!43795 (Array (_ BitVec 32) ValueCell!17551)) (size!44345 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90658)

(declare-fun e!760700 () Bool)

(declare-fun array_inv!33025 (array!90658) Bool)

(assert (=> start!112594 (and (array_inv!33025 _values!1320) e!760700)))

(assert (=> start!112594 true))

(declare-fun array_inv!33026 (array!90656) Bool)

(assert (=> start!112594 (array_inv!33026 _keys!1590)))

(assert (=> start!112594 tp!108603))

(declare-fun tp_is_empty!36899 () Bool)

(assert (=> start!112594 tp_is_empty!36899))

(declare-fun b!1335719 () Bool)

(declare-fun res!886511 () Bool)

(assert (=> b!1335719 (=> (not res!886511) (not e!760702))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1335719 (= res!886511 (and (= (size!44345 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44344 _keys!1590) (size!44345 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1335720 () Bool)

(declare-fun e!760698 () Bool)

(assert (=> b!1335720 (= e!760698 tp_is_empty!36899)))

(declare-fun b!1335721 () Bool)

(declare-fun res!886505 () Bool)

(assert (=> b!1335721 (=> (not res!886505) (not e!760702))))

(assert (=> b!1335721 (= res!886505 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44344 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1335722 () Bool)

(declare-fun res!886509 () Bool)

(assert (=> b!1335722 (=> (not res!886509) (not e!760702))))

(declare-datatypes ((List!31030 0))(
  ( (Nil!31027) (Cons!31026 (h!32235 (_ BitVec 64)) (t!45300 List!31030)) )
))
(declare-fun arrayNoDuplicates!0 (array!90656 (_ BitVec 32) List!31030) Bool)

(assert (=> b!1335722 (= res!886509 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31027))))

(declare-fun mapNonEmpty!57022 () Bool)

(declare-fun mapRes!57022 () Bool)

(declare-fun tp!108604 () Bool)

(declare-fun e!760699 () Bool)

(assert (=> mapNonEmpty!57022 (= mapRes!57022 (and tp!108604 e!760699))))

(declare-fun mapRest!57022 () (Array (_ BitVec 32) ValueCell!17551))

(declare-fun mapValue!57022 () ValueCell!17551)

(declare-fun mapKey!57022 () (_ BitVec 32))

(assert (=> mapNonEmpty!57022 (= (arr!43795 _values!1320) (store mapRest!57022 mapKey!57022 mapValue!57022))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun b!1335723 () Bool)

(declare-fun minValue!1262 () V!54301)

(declare-fun zeroValue!1262 () V!54301)

(declare-datatypes ((tuple2!23888 0))(
  ( (tuple2!23889 (_1!11955 (_ BitVec 64)) (_2!11955 V!54301)) )
))
(declare-datatypes ((List!31031 0))(
  ( (Nil!31028) (Cons!31027 (h!32236 tuple2!23888) (t!45301 List!31031)) )
))
(declare-datatypes ((ListLongMap!21545 0))(
  ( (ListLongMap!21546 (toList!10788 List!31031)) )
))
(declare-fun contains!8951 (ListLongMap!21545 (_ BitVec 64)) Bool)

(declare-fun +!4731 (ListLongMap!21545 tuple2!23888) ListLongMap!21545)

(declare-fun getCurrentListMapNoExtraKeys!6373 (array!90656 array!90658 (_ BitVec 32) (_ BitVec 32) V!54301 V!54301 (_ BitVec 32) Int) ListLongMap!21545)

(declare-fun get!22089 (ValueCell!17551 V!54301) V!54301)

(declare-fun dynLambda!3670 (Int (_ BitVec 64)) V!54301)

(assert (=> b!1335723 (= e!760702 (not (contains!8951 (+!4731 (+!4731 (getCurrentListMapNoExtraKeys!6373 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23889 (select (arr!43794 _keys!1590) from!1980) (get!22089 (select (arr!43795 _values!1320) from!1980) (dynLambda!3670 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23889 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k!1153)))))

(declare-fun b!1335724 () Bool)

(declare-fun res!886504 () Bool)

(assert (=> b!1335724 (=> (not res!886504) (not e!760702))))

(assert (=> b!1335724 (= res!886504 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1335725 () Bool)

(declare-fun res!886512 () Bool)

(assert (=> b!1335725 (=> (not res!886512) (not e!760702))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1335725 (= res!886512 (validKeyInArray!0 (select (arr!43794 _keys!1590) from!1980)))))

(declare-fun b!1335726 () Bool)

(declare-fun res!886507 () Bool)

(assert (=> b!1335726 (=> (not res!886507) (not e!760702))))

(declare-fun getCurrentListMap!5761 (array!90656 array!90658 (_ BitVec 32) (_ BitVec 32) V!54301 V!54301 (_ BitVec 32) Int) ListLongMap!21545)

(assert (=> b!1335726 (= res!886507 (contains!8951 (getCurrentListMap!5761 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1335727 () Bool)

(assert (=> b!1335727 (= e!760700 (and e!760698 mapRes!57022))))

(declare-fun condMapEmpty!57022 () Bool)

(declare-fun mapDefault!57022 () ValueCell!17551)

