; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112306 () Bool)

(assert start!112306)

(declare-fun b_free!30701 () Bool)

(declare-fun b_next!30701 () Bool)

(assert (=> start!112306 (= b_free!30701 (not b_next!30701))))

(declare-fun tp!107739 () Bool)

(declare-fun b_and!49457 () Bool)

(assert (=> start!112306 (= tp!107739 b_and!49457)))

(declare-fun b!1330881 () Bool)

(declare-fun res!883123 () Bool)

(declare-fun e!758459 () Bool)

(assert (=> b!1330881 (=> (not res!883123) (not e!758459))))

(declare-datatypes ((V!53917 0))(
  ( (V!53918 (val!18380 Int)) )
))
(declare-datatypes ((ValueCell!17407 0))(
  ( (ValueCellFull!17407 (v!21017 V!53917)) (EmptyCell!17407) )
))
(declare-datatypes ((array!90106 0))(
  ( (array!90107 (arr!43519 (Array (_ BitVec 32) ValueCell!17407)) (size!44069 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90106)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90108 0))(
  ( (array!90109 (arr!43520 (Array (_ BitVec 32) (_ BitVec 64))) (size!44070 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90108)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!53917)

(declare-fun zeroValue!1262 () V!53917)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23672 0))(
  ( (tuple2!23673 (_1!11847 (_ BitVec 64)) (_2!11847 V!53917)) )
))
(declare-datatypes ((List!30822 0))(
  ( (Nil!30819) (Cons!30818 (h!32027 tuple2!23672) (t!44936 List!30822)) )
))
(declare-datatypes ((ListLongMap!21329 0))(
  ( (ListLongMap!21330 (toList!10680 List!30822)) )
))
(declare-fun contains!8844 (ListLongMap!21329 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5666 (array!90108 array!90106 (_ BitVec 32) (_ BitVec 32) V!53917 V!53917 (_ BitVec 32) Int) ListLongMap!21329)

(assert (=> b!1330881 (= res!883123 (contains!8844 (getCurrentListMap!5666 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1330882 () Bool)

(declare-fun res!883127 () Bool)

(assert (=> b!1330882 (=> (not res!883127) (not e!758459))))

(assert (=> b!1330882 (= res!883127 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1330883 () Bool)

(declare-fun res!883126 () Bool)

(assert (=> b!1330883 (=> (not res!883126) (not e!758459))))

(declare-datatypes ((List!30823 0))(
  ( (Nil!30820) (Cons!30819 (h!32028 (_ BitVec 64)) (t!44937 List!30823)) )
))
(declare-fun arrayNoDuplicates!0 (array!90108 (_ BitVec 32) List!30823) Bool)

(assert (=> b!1330883 (= res!883126 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30820))))

(declare-fun b!1330884 () Bool)

(declare-fun res!883120 () Bool)

(assert (=> b!1330884 (=> (not res!883120) (not e!758459))))

(assert (=> b!1330884 (= res!883120 (and (= (size!44069 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44070 _keys!1590) (size!44069 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56590 () Bool)

(declare-fun mapRes!56590 () Bool)

(declare-fun tp!107740 () Bool)

(declare-fun e!758461 () Bool)

(assert (=> mapNonEmpty!56590 (= mapRes!56590 (and tp!107740 e!758461))))

(declare-fun mapKey!56590 () (_ BitVec 32))

(declare-fun mapValue!56590 () ValueCell!17407)

(declare-fun mapRest!56590 () (Array (_ BitVec 32) ValueCell!17407))

(assert (=> mapNonEmpty!56590 (= (arr!43519 _values!1320) (store mapRest!56590 mapKey!56590 mapValue!56590))))

(declare-fun b!1330885 () Bool)

(declare-fun tp_is_empty!36611 () Bool)

(assert (=> b!1330885 (= e!758461 tp_is_empty!36611)))

(declare-fun b!1330886 () Bool)

(assert (=> b!1330886 (= e!758459 (not true))))

(declare-fun lt!591319 () ListLongMap!21329)

(assert (=> b!1330886 (contains!8844 lt!591319 k!1153)))

(declare-fun lt!591316 () V!53917)

(declare-datatypes ((Unit!43803 0))(
  ( (Unit!43804) )
))
(declare-fun lt!591317 () Unit!43803)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!264 ((_ BitVec 64) (_ BitVec 64) V!53917 ListLongMap!21329) Unit!43803)

(assert (=> b!1330886 (= lt!591317 (lemmaInListMapAfterAddingDiffThenInBefore!264 k!1153 (select (arr!43520 _keys!1590) from!1980) lt!591316 lt!591319))))

(declare-fun lt!591318 () ListLongMap!21329)

(assert (=> b!1330886 (contains!8844 lt!591318 k!1153)))

(declare-fun lt!591315 () Unit!43803)

(assert (=> b!1330886 (= lt!591315 (lemmaInListMapAfterAddingDiffThenInBefore!264 k!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591318))))

(declare-fun +!4677 (ListLongMap!21329 tuple2!23672) ListLongMap!21329)

(assert (=> b!1330886 (= lt!591318 (+!4677 lt!591319 (tuple2!23673 (select (arr!43520 _keys!1590) from!1980) lt!591316)))))

(declare-fun get!21939 (ValueCell!17407 V!53917) V!53917)

(declare-fun dynLambda!3616 (Int (_ BitVec 64)) V!53917)

(assert (=> b!1330886 (= lt!591316 (get!21939 (select (arr!43519 _values!1320) from!1980) (dynLambda!3616 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6315 (array!90108 array!90106 (_ BitVec 32) (_ BitVec 32) V!53917 V!53917 (_ BitVec 32) Int) ListLongMap!21329)

(assert (=> b!1330886 (= lt!591319 (getCurrentListMapNoExtraKeys!6315 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1330887 () Bool)

(declare-fun res!883125 () Bool)

(assert (=> b!1330887 (=> (not res!883125) (not e!758459))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1330887 (= res!883125 (validKeyInArray!0 (select (arr!43520 _keys!1590) from!1980)))))

(declare-fun b!1330888 () Bool)

(declare-fun res!883128 () Bool)

(assert (=> b!1330888 (=> (not res!883128) (not e!758459))))

(assert (=> b!1330888 (= res!883128 (not (= (select (arr!43520 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1330889 () Bool)

(declare-fun e!758460 () Bool)

(declare-fun e!758457 () Bool)

(assert (=> b!1330889 (= e!758460 (and e!758457 mapRes!56590))))

(declare-fun condMapEmpty!56590 () Bool)

(declare-fun mapDefault!56590 () ValueCell!17407)

