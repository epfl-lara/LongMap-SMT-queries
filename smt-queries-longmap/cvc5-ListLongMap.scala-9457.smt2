; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112350 () Bool)

(assert start!112350)

(declare-fun b_free!30745 () Bool)

(declare-fun b_next!30745 () Bool)

(assert (=> start!112350 (= b_free!30745 (not b_next!30745))))

(declare-fun tp!107871 () Bool)

(declare-fun b_and!49545 () Bool)

(assert (=> start!112350 (= tp!107871 b_and!49545)))

(declare-fun b!1331717 () Bool)

(declare-fun res!883718 () Bool)

(declare-fun e!758791 () Bool)

(assert (=> b!1331717 (=> (not res!883718) (not e!758791))))

(declare-datatypes ((V!53977 0))(
  ( (V!53978 (val!18402 Int)) )
))
(declare-datatypes ((ValueCell!17429 0))(
  ( (ValueCellFull!17429 (v!21039 V!53977)) (EmptyCell!17429) )
))
(declare-datatypes ((array!90190 0))(
  ( (array!90191 (arr!43561 (Array (_ BitVec 32) ValueCell!17429)) (size!44111 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90190)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90192 0))(
  ( (array!90193 (arr!43562 (Array (_ BitVec 32) (_ BitVec 64))) (size!44112 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90192)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!53977)

(declare-fun zeroValue!1262 () V!53977)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23708 0))(
  ( (tuple2!23709 (_1!11865 (_ BitVec 64)) (_2!11865 V!53977)) )
))
(declare-datatypes ((List!30856 0))(
  ( (Nil!30853) (Cons!30852 (h!32061 tuple2!23708) (t!45014 List!30856)) )
))
(declare-datatypes ((ListLongMap!21365 0))(
  ( (ListLongMap!21366 (toList!10698 List!30856)) )
))
(declare-fun contains!8862 (ListLongMap!21365 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5681 (array!90192 array!90190 (_ BitVec 32) (_ BitVec 32) V!53977 V!53977 (_ BitVec 32) Int) ListLongMap!21365)

(assert (=> b!1331717 (= res!883718 (contains!8862 (getCurrentListMap!5681 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1331718 () Bool)

(assert (=> b!1331718 (= e!758791 (not true))))

(declare-fun lt!591670 () ListLongMap!21365)

(declare-fun +!4692 (ListLongMap!21365 tuple2!23708) ListLongMap!21365)

(assert (=> b!1331718 (contains!8862 (+!4692 lt!591670 (tuple2!23709 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k!1153)))

(declare-datatypes ((Unit!43833 0))(
  ( (Unit!43834) )
))
(declare-fun lt!591666 () Unit!43833)

(declare-fun addStillContains!1171 (ListLongMap!21365 (_ BitVec 64) V!53977 (_ BitVec 64)) Unit!43833)

(assert (=> b!1331718 (= lt!591666 (addStillContains!1171 lt!591670 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k!1153))))

(assert (=> b!1331718 (contains!8862 lt!591670 k!1153)))

(declare-fun lt!591665 () V!53977)

(declare-fun lt!591667 () Unit!43833)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!279 ((_ BitVec 64) (_ BitVec 64) V!53977 ListLongMap!21365) Unit!43833)

(assert (=> b!1331718 (= lt!591667 (lemmaInListMapAfterAddingDiffThenInBefore!279 k!1153 (select (arr!43562 _keys!1590) from!1980) lt!591665 lt!591670))))

(declare-fun lt!591668 () ListLongMap!21365)

(assert (=> b!1331718 (contains!8862 lt!591668 k!1153)))

(declare-fun lt!591669 () Unit!43833)

(assert (=> b!1331718 (= lt!591669 (lemmaInListMapAfterAddingDiffThenInBefore!279 k!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591668))))

(assert (=> b!1331718 (= lt!591668 (+!4692 lt!591670 (tuple2!23709 (select (arr!43562 _keys!1590) from!1980) lt!591665)))))

(declare-fun get!21970 (ValueCell!17429 V!53977) V!53977)

(declare-fun dynLambda!3631 (Int (_ BitVec 64)) V!53977)

(assert (=> b!1331718 (= lt!591665 (get!21970 (select (arr!43561 _values!1320) from!1980) (dynLambda!3631 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6330 (array!90192 array!90190 (_ BitVec 32) (_ BitVec 32) V!53977 V!53977 (_ BitVec 32) Int) ListLongMap!21365)

(assert (=> b!1331718 (= lt!591670 (getCurrentListMapNoExtraKeys!6330 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1331719 () Bool)

(declare-fun res!883715 () Bool)

(assert (=> b!1331719 (=> (not res!883715) (not e!758791))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90192 (_ BitVec 32)) Bool)

(assert (=> b!1331719 (= res!883715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1331720 () Bool)

(declare-fun res!883721 () Bool)

(assert (=> b!1331720 (=> (not res!883721) (not e!758791))))

(declare-datatypes ((List!30857 0))(
  ( (Nil!30854) (Cons!30853 (h!32062 (_ BitVec 64)) (t!45015 List!30857)) )
))
(declare-fun arrayNoDuplicates!0 (array!90192 (_ BitVec 32) List!30857) Bool)

(assert (=> b!1331720 (= res!883721 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30854))))

(declare-fun b!1331721 () Bool)

(declare-fun res!883722 () Bool)

(assert (=> b!1331721 (=> (not res!883722) (not e!758791))))

(assert (=> b!1331721 (= res!883722 (not (= (select (arr!43562 _keys!1590) from!1980) k!1153)))))

(declare-fun res!883714 () Bool)

(assert (=> start!112350 (=> (not res!883714) (not e!758791))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112350 (= res!883714 (validMask!0 mask!1998))))

(assert (=> start!112350 e!758791))

(declare-fun e!758787 () Bool)

(declare-fun array_inv!32857 (array!90190) Bool)

(assert (=> start!112350 (and (array_inv!32857 _values!1320) e!758787)))

(assert (=> start!112350 true))

(declare-fun array_inv!32858 (array!90192) Bool)

(assert (=> start!112350 (array_inv!32858 _keys!1590)))

(assert (=> start!112350 tp!107871))

(declare-fun tp_is_empty!36655 () Bool)

(assert (=> start!112350 tp_is_empty!36655))

(declare-fun b!1331722 () Bool)

(declare-fun e!758788 () Bool)

(assert (=> b!1331722 (= e!758788 tp_is_empty!36655)))

(declare-fun b!1331723 () Bool)

(declare-fun res!883720 () Bool)

(assert (=> b!1331723 (=> (not res!883720) (not e!758791))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1331723 (= res!883720 (validKeyInArray!0 (select (arr!43562 _keys!1590) from!1980)))))

(declare-fun b!1331724 () Bool)

(declare-fun res!883716 () Bool)

(assert (=> b!1331724 (=> (not res!883716) (not e!758791))))

(assert (=> b!1331724 (= res!883716 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!56656 () Bool)

(declare-fun mapRes!56656 () Bool)

(assert (=> mapIsEmpty!56656 mapRes!56656))

(declare-fun b!1331725 () Bool)

(declare-fun res!883717 () Bool)

(assert (=> b!1331725 (=> (not res!883717) (not e!758791))))

(assert (=> b!1331725 (= res!883717 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44112 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1331726 () Bool)

(assert (=> b!1331726 (= e!758787 (and e!758788 mapRes!56656))))

(declare-fun condMapEmpty!56656 () Bool)

(declare-fun mapDefault!56656 () ValueCell!17429)

