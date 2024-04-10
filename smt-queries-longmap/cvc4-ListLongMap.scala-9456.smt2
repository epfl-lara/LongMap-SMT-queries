; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112348 () Bool)

(assert start!112348)

(declare-fun b_free!30743 () Bool)

(declare-fun b_next!30743 () Bool)

(assert (=> start!112348 (= b_free!30743 (not b_next!30743))))

(declare-fun tp!107866 () Bool)

(declare-fun b_and!49541 () Bool)

(assert (=> start!112348 (= tp!107866 b_and!49541)))

(declare-fun b!1331679 () Bool)

(declare-fun e!758774 () Bool)

(assert (=> b!1331679 (= e!758774 (not true))))

(declare-datatypes ((V!53973 0))(
  ( (V!53974 (val!18401 Int)) )
))
(declare-datatypes ((tuple2!23706 0))(
  ( (tuple2!23707 (_1!11864 (_ BitVec 64)) (_2!11864 V!53973)) )
))
(declare-datatypes ((List!30855 0))(
  ( (Nil!30852) (Cons!30851 (h!32060 tuple2!23706) (t!45011 List!30855)) )
))
(declare-datatypes ((ListLongMap!21363 0))(
  ( (ListLongMap!21364 (toList!10697 List!30855)) )
))
(declare-fun lt!591650 () ListLongMap!21363)

(declare-fun minValue!1262 () V!53973)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun contains!8861 (ListLongMap!21363 (_ BitVec 64)) Bool)

(declare-fun +!4691 (ListLongMap!21363 tuple2!23706) ListLongMap!21363)

(assert (=> b!1331679 (contains!8861 (+!4691 lt!591650 (tuple2!23707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k!1153)))

(declare-datatypes ((Unit!43831 0))(
  ( (Unit!43832) )
))
(declare-fun lt!591647 () Unit!43831)

(declare-fun addStillContains!1170 (ListLongMap!21363 (_ BitVec 64) V!53973 (_ BitVec 64)) Unit!43831)

(assert (=> b!1331679 (= lt!591647 (addStillContains!1170 lt!591650 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k!1153))))

(assert (=> b!1331679 (contains!8861 lt!591650 k!1153)))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun lt!591651 () V!53973)

(declare-fun lt!591652 () Unit!43831)

(declare-datatypes ((array!90186 0))(
  ( (array!90187 (arr!43559 (Array (_ BitVec 32) (_ BitVec 64))) (size!44109 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90186)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!278 ((_ BitVec 64) (_ BitVec 64) V!53973 ListLongMap!21363) Unit!43831)

(assert (=> b!1331679 (= lt!591652 (lemmaInListMapAfterAddingDiffThenInBefore!278 k!1153 (select (arr!43559 _keys!1590) from!1980) lt!591651 lt!591650))))

(declare-fun lt!591649 () ListLongMap!21363)

(assert (=> b!1331679 (contains!8861 lt!591649 k!1153)))

(declare-fun lt!591648 () Unit!43831)

(assert (=> b!1331679 (= lt!591648 (lemmaInListMapAfterAddingDiffThenInBefore!278 k!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591649))))

(assert (=> b!1331679 (= lt!591649 (+!4691 lt!591650 (tuple2!23707 (select (arr!43559 _keys!1590) from!1980) lt!591651)))))

(declare-datatypes ((ValueCell!17428 0))(
  ( (ValueCellFull!17428 (v!21038 V!53973)) (EmptyCell!17428) )
))
(declare-datatypes ((array!90188 0))(
  ( (array!90189 (arr!43560 (Array (_ BitVec 32) ValueCell!17428)) (size!44110 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90188)

(declare-fun defaultEntry!1323 () Int)

(declare-fun get!21967 (ValueCell!17428 V!53973) V!53973)

(declare-fun dynLambda!3630 (Int (_ BitVec 64)) V!53973)

(assert (=> b!1331679 (= lt!591651 (get!21967 (select (arr!43560 _values!1320) from!1980) (dynLambda!3630 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun zeroValue!1262 () V!53973)

(declare-fun getCurrentListMapNoExtraKeys!6329 (array!90186 array!90188 (_ BitVec 32) (_ BitVec 32) V!53973 V!53973 (_ BitVec 32) Int) ListLongMap!21363)

(assert (=> b!1331679 (= lt!591650 (getCurrentListMapNoExtraKeys!6329 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1331680 () Bool)

(declare-fun e!758776 () Bool)

(declare-fun tp_is_empty!36653 () Bool)

(assert (=> b!1331680 (= e!758776 tp_is_empty!36653)))

(declare-fun b!1331681 () Bool)

(declare-fun res!883694 () Bool)

(assert (=> b!1331681 (=> (not res!883694) (not e!758774))))

(assert (=> b!1331681 (= res!883694 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!883688 () Bool)

(assert (=> start!112348 (=> (not res!883688) (not e!758774))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112348 (= res!883688 (validMask!0 mask!1998))))

(assert (=> start!112348 e!758774))

(declare-fun e!758775 () Bool)

(declare-fun array_inv!32855 (array!90188) Bool)

(assert (=> start!112348 (and (array_inv!32855 _values!1320) e!758775)))

(assert (=> start!112348 true))

(declare-fun array_inv!32856 (array!90186) Bool)

(assert (=> start!112348 (array_inv!32856 _keys!1590)))

(assert (=> start!112348 tp!107866))

(assert (=> start!112348 tp_is_empty!36653))

(declare-fun b!1331682 () Bool)

(declare-fun res!883692 () Bool)

(assert (=> b!1331682 (=> (not res!883692) (not e!758774))))

(assert (=> b!1331682 (= res!883692 (not (= (select (arr!43559 _keys!1590) from!1980) k!1153)))))

(declare-fun mapNonEmpty!56653 () Bool)

(declare-fun mapRes!56653 () Bool)

(declare-fun tp!107865 () Bool)

(assert (=> mapNonEmpty!56653 (= mapRes!56653 (and tp!107865 e!758776))))

(declare-fun mapValue!56653 () ValueCell!17428)

(declare-fun mapKey!56653 () (_ BitVec 32))

(declare-fun mapRest!56653 () (Array (_ BitVec 32) ValueCell!17428))

(assert (=> mapNonEmpty!56653 (= (arr!43560 _values!1320) (store mapRest!56653 mapKey!56653 mapValue!56653))))

(declare-fun mapIsEmpty!56653 () Bool)

(assert (=> mapIsEmpty!56653 mapRes!56653))

(declare-fun b!1331683 () Bool)

(declare-fun res!883689 () Bool)

(assert (=> b!1331683 (=> (not res!883689) (not e!758774))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90186 (_ BitVec 32)) Bool)

(assert (=> b!1331683 (= res!883689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1331684 () Bool)

(declare-fun res!883693 () Bool)

(assert (=> b!1331684 (=> (not res!883693) (not e!758774))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1331684 (= res!883693 (validKeyInArray!0 (select (arr!43559 _keys!1590) from!1980)))))

(declare-fun b!1331685 () Bool)

(declare-fun res!883695 () Bool)

(assert (=> b!1331685 (=> (not res!883695) (not e!758774))))

(assert (=> b!1331685 (= res!883695 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44109 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1331686 () Bool)

(declare-fun res!883690 () Bool)

(assert (=> b!1331686 (=> (not res!883690) (not e!758774))))

(declare-fun getCurrentListMap!5680 (array!90186 array!90188 (_ BitVec 32) (_ BitVec 32) V!53973 V!53973 (_ BitVec 32) Int) ListLongMap!21363)

(assert (=> b!1331686 (= res!883690 (contains!8861 (getCurrentListMap!5680 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1331687 () Bool)

(declare-fun res!883691 () Bool)

(assert (=> b!1331687 (=> (not res!883691) (not e!758774))))

(assert (=> b!1331687 (= res!883691 (and (= (size!44110 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44109 _keys!1590) (size!44110 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1331688 () Bool)

(declare-fun e!758772 () Bool)

(assert (=> b!1331688 (= e!758775 (and e!758772 mapRes!56653))))

(declare-fun condMapEmpty!56653 () Bool)

(declare-fun mapDefault!56653 () ValueCell!17428)

