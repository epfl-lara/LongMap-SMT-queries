; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112368 () Bool)

(assert start!112368)

(declare-fun b_free!30763 () Bool)

(declare-fun b_next!30763 () Bool)

(assert (=> start!112368 (= b_free!30763 (not b_next!30763))))

(declare-fun tp!107925 () Bool)

(declare-fun b_and!49581 () Bool)

(assert (=> start!112368 (= tp!107925 b_and!49581)))

(declare-fun b!1332059 () Bool)

(declare-fun res!883964 () Bool)

(declare-fun e!758925 () Bool)

(assert (=> b!1332059 (=> (not res!883964) (not e!758925))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((array!90226 0))(
  ( (array!90227 (arr!43579 (Array (_ BitVec 32) (_ BitVec 64))) (size!44129 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90226)

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1332059 (= res!883964 (not (= (select (arr!43579 _keys!1590) from!1980) k!1153)))))

(declare-fun mapIsEmpty!56683 () Bool)

(declare-fun mapRes!56683 () Bool)

(assert (=> mapIsEmpty!56683 mapRes!56683))

(declare-fun res!883958 () Bool)

(assert (=> start!112368 (=> (not res!883958) (not e!758925))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112368 (= res!883958 (validMask!0 mask!1998))))

(assert (=> start!112368 e!758925))

(declare-datatypes ((V!54001 0))(
  ( (V!54002 (val!18411 Int)) )
))
(declare-datatypes ((ValueCell!17438 0))(
  ( (ValueCellFull!17438 (v!21048 V!54001)) (EmptyCell!17438) )
))
(declare-datatypes ((array!90228 0))(
  ( (array!90229 (arr!43580 (Array (_ BitVec 32) ValueCell!17438)) (size!44130 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90228)

(declare-fun e!758922 () Bool)

(declare-fun array_inv!32869 (array!90228) Bool)

(assert (=> start!112368 (and (array_inv!32869 _values!1320) e!758922)))

(assert (=> start!112368 true))

(declare-fun array_inv!32870 (array!90226) Bool)

(assert (=> start!112368 (array_inv!32870 _keys!1590)))

(assert (=> start!112368 tp!107925))

(declare-fun tp_is_empty!36673 () Bool)

(assert (=> start!112368 tp_is_empty!36673))

(declare-fun b!1332060 () Bool)

(declare-fun res!883957 () Bool)

(assert (=> b!1332060 (=> (not res!883957) (not e!758925))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1332060 (= res!883957 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1332061 () Bool)

(declare-fun res!883963 () Bool)

(assert (=> b!1332061 (=> (not res!883963) (not e!758925))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54001)

(declare-fun zeroValue!1262 () V!54001)

(declare-datatypes ((tuple2!23724 0))(
  ( (tuple2!23725 (_1!11873 (_ BitVec 64)) (_2!11873 V!54001)) )
))
(declare-datatypes ((List!30870 0))(
  ( (Nil!30867) (Cons!30866 (h!32075 tuple2!23724) (t!45046 List!30870)) )
))
(declare-datatypes ((ListLongMap!21381 0))(
  ( (ListLongMap!21382 (toList!10706 List!30870)) )
))
(declare-fun contains!8870 (ListLongMap!21381 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5687 (array!90226 array!90228 (_ BitVec 32) (_ BitVec 32) V!54001 V!54001 (_ BitVec 32) Int) ListLongMap!21381)

(assert (=> b!1332061 (= res!883963 (contains!8870 (getCurrentListMap!5687 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1332062 () Bool)

(declare-fun res!883959 () Bool)

(assert (=> b!1332062 (=> (not res!883959) (not e!758925))))

(assert (=> b!1332062 (= res!883959 (and (= (size!44130 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44129 _keys!1590) (size!44130 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56683 () Bool)

(declare-fun tp!107926 () Bool)

(declare-fun e!758926 () Bool)

(assert (=> mapNonEmpty!56683 (= mapRes!56683 (and tp!107926 e!758926))))

(declare-fun mapKey!56683 () (_ BitVec 32))

(declare-fun mapRest!56683 () (Array (_ BitVec 32) ValueCell!17438))

(declare-fun mapValue!56683 () ValueCell!17438)

(assert (=> mapNonEmpty!56683 (= (arr!43580 _values!1320) (store mapRest!56683 mapKey!56683 mapValue!56683))))

(declare-fun b!1332063 () Bool)

(declare-fun e!758923 () Bool)

(assert (=> b!1332063 (= e!758923 tp_is_empty!36673)))

(declare-fun b!1332064 () Bool)

(declare-fun res!883962 () Bool)

(assert (=> b!1332064 (=> (not res!883962) (not e!758925))))

(assert (=> b!1332064 (= res!883962 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44129 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1332065 () Bool)

(assert (=> b!1332065 (= e!758925 (not true))))

(declare-fun lt!591830 () ListLongMap!21381)

(declare-fun +!4700 (ListLongMap!21381 tuple2!23724) ListLongMap!21381)

(assert (=> b!1332065 (contains!8870 (+!4700 lt!591830 (tuple2!23725 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k!1153)))

(declare-datatypes ((Unit!43849 0))(
  ( (Unit!43850) )
))
(declare-fun lt!591829 () Unit!43849)

(declare-fun addStillContains!1179 (ListLongMap!21381 (_ BitVec 64) V!54001 (_ BitVec 64)) Unit!43849)

(assert (=> b!1332065 (= lt!591829 (addStillContains!1179 lt!591830 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k!1153))))

(assert (=> b!1332065 (contains!8870 lt!591830 k!1153)))

(declare-fun lt!591828 () Unit!43849)

(declare-fun lt!591831 () V!54001)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!287 ((_ BitVec 64) (_ BitVec 64) V!54001 ListLongMap!21381) Unit!43849)

(assert (=> b!1332065 (= lt!591828 (lemmaInListMapAfterAddingDiffThenInBefore!287 k!1153 (select (arr!43579 _keys!1590) from!1980) lt!591831 lt!591830))))

(declare-fun lt!591827 () ListLongMap!21381)

(assert (=> b!1332065 (contains!8870 lt!591827 k!1153)))

(declare-fun lt!591832 () Unit!43849)

(assert (=> b!1332065 (= lt!591832 (lemmaInListMapAfterAddingDiffThenInBefore!287 k!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591827))))

(assert (=> b!1332065 (= lt!591827 (+!4700 lt!591830 (tuple2!23725 (select (arr!43579 _keys!1590) from!1980) lt!591831)))))

(declare-fun get!21984 (ValueCell!17438 V!54001) V!54001)

(declare-fun dynLambda!3639 (Int (_ BitVec 64)) V!54001)

(assert (=> b!1332065 (= lt!591831 (get!21984 (select (arr!43580 _values!1320) from!1980) (dynLambda!3639 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6338 (array!90226 array!90228 (_ BitVec 32) (_ BitVec 32) V!54001 V!54001 (_ BitVec 32) Int) ListLongMap!21381)

(assert (=> b!1332065 (= lt!591830 (getCurrentListMapNoExtraKeys!6338 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1332066 () Bool)

(declare-fun res!883961 () Bool)

(assert (=> b!1332066 (=> (not res!883961) (not e!758925))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90226 (_ BitVec 32)) Bool)

(assert (=> b!1332066 (= res!883961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1332067 () Bool)

(declare-fun res!883960 () Bool)

(assert (=> b!1332067 (=> (not res!883960) (not e!758925))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1332067 (= res!883960 (validKeyInArray!0 (select (arr!43579 _keys!1590) from!1980)))))

(declare-fun b!1332068 () Bool)

(assert (=> b!1332068 (= e!758922 (and e!758923 mapRes!56683))))

(declare-fun condMapEmpty!56683 () Bool)

(declare-fun mapDefault!56683 () ValueCell!17438)

