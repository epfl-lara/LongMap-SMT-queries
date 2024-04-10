; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112224 () Bool)

(assert start!112224)

(declare-fun b_free!30619 () Bool)

(declare-fun b_next!30619 () Bool)

(assert (=> start!112224 (= b_free!30619 (not b_next!30619))))

(declare-fun tp!107493 () Bool)

(declare-fun b_and!49293 () Bool)

(assert (=> start!112224 (= tp!107493 b_and!49293)))

(declare-fun b!1329323 () Bool)

(declare-fun e!757846 () Bool)

(declare-fun tp_is_empty!36529 () Bool)

(assert (=> b!1329323 (= e!757846 tp_is_empty!36529)))

(declare-fun b!1329324 () Bool)

(declare-fun res!882015 () Bool)

(declare-fun e!757842 () Bool)

(assert (=> b!1329324 (=> (not res!882015) (not e!757842))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1329324 (= res!882015 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!882020 () Bool)

(assert (=> start!112224 (=> (not res!882020) (not e!757842))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112224 (= res!882020 (validMask!0 mask!1998))))

(assert (=> start!112224 e!757842))

(declare-datatypes ((V!53809 0))(
  ( (V!53810 (val!18339 Int)) )
))
(declare-datatypes ((ValueCell!17366 0))(
  ( (ValueCellFull!17366 (v!20976 V!53809)) (EmptyCell!17366) )
))
(declare-datatypes ((array!89950 0))(
  ( (array!89951 (arr!43441 (Array (_ BitVec 32) ValueCell!17366)) (size!43991 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89950)

(declare-fun e!757844 () Bool)

(declare-fun array_inv!32777 (array!89950) Bool)

(assert (=> start!112224 (and (array_inv!32777 _values!1320) e!757844)))

(assert (=> start!112224 true))

(declare-datatypes ((array!89952 0))(
  ( (array!89953 (arr!43442 (Array (_ BitVec 32) (_ BitVec 64))) (size!43992 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89952)

(declare-fun array_inv!32778 (array!89952) Bool)

(assert (=> start!112224 (array_inv!32778 _keys!1590)))

(assert (=> start!112224 tp!107493))

(assert (=> start!112224 tp_is_empty!36529))

(declare-fun b!1329325 () Bool)

(assert (=> b!1329325 (= e!757842 (not true))))

(declare-datatypes ((tuple2!23610 0))(
  ( (tuple2!23611 (_1!11816 (_ BitVec 64)) (_2!11816 V!53809)) )
))
(declare-datatypes ((List!30764 0))(
  ( (Nil!30761) (Cons!30760 (h!31969 tuple2!23610) (t!44796 List!30764)) )
))
(declare-datatypes ((ListLongMap!21267 0))(
  ( (ListLongMap!21268 (toList!10649 List!30764)) )
))
(declare-fun lt!590938 () ListLongMap!21267)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun contains!8813 (ListLongMap!21267 (_ BitVec 64)) Bool)

(assert (=> b!1329325 (contains!8813 lt!590938 k!1153)))

(declare-datatypes ((Unit!43747 0))(
  ( (Unit!43748) )
))
(declare-fun lt!590937 () Unit!43747)

(declare-fun minValue!1262 () V!53809)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!236 ((_ BitVec 64) (_ BitVec 64) V!53809 ListLongMap!21267) Unit!43747)

(assert (=> b!1329325 (= lt!590937 (lemmaInListMapAfterAddingDiffThenInBefore!236 k!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!590938))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun zeroValue!1262 () V!53809)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun +!4649 (ListLongMap!21267 tuple2!23610) ListLongMap!21267)

(declare-fun getCurrentListMapNoExtraKeys!6287 (array!89952 array!89950 (_ BitVec 32) (_ BitVec 32) V!53809 V!53809 (_ BitVec 32) Int) ListLongMap!21267)

(declare-fun get!21885 (ValueCell!17366 V!53809) V!53809)

(declare-fun dynLambda!3588 (Int (_ BitVec 64)) V!53809)

(assert (=> b!1329325 (= lt!590938 (+!4649 (getCurrentListMapNoExtraKeys!6287 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23611 (select (arr!43442 _keys!1590) from!1980) (get!21885 (select (arr!43441 _values!1320) from!1980) (dynLambda!3588 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1329326 () Bool)

(declare-fun res!882021 () Bool)

(assert (=> b!1329326 (=> (not res!882021) (not e!757842))))

(assert (=> b!1329326 (= res!882021 (and (= (size!43991 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43992 _keys!1590) (size!43991 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1329327 () Bool)

(declare-fun res!882017 () Bool)

(assert (=> b!1329327 (=> (not res!882017) (not e!757842))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1329327 (= res!882017 (validKeyInArray!0 (select (arr!43442 _keys!1590) from!1980)))))

(declare-fun b!1329328 () Bool)

(declare-fun res!882013 () Bool)

(assert (=> b!1329328 (=> (not res!882013) (not e!757842))))

(assert (=> b!1329328 (= res!882013 (not (= (select (arr!43442 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1329329 () Bool)

(declare-fun res!882018 () Bool)

(assert (=> b!1329329 (=> (not res!882018) (not e!757842))))

(assert (=> b!1329329 (= res!882018 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43992 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!56467 () Bool)

(declare-fun mapRes!56467 () Bool)

(declare-fun tp!107494 () Bool)

(assert (=> mapNonEmpty!56467 (= mapRes!56467 (and tp!107494 e!757846))))

(declare-fun mapKey!56467 () (_ BitVec 32))

(declare-fun mapRest!56467 () (Array (_ BitVec 32) ValueCell!17366))

(declare-fun mapValue!56467 () ValueCell!17366)

(assert (=> mapNonEmpty!56467 (= (arr!43441 _values!1320) (store mapRest!56467 mapKey!56467 mapValue!56467))))

(declare-fun b!1329330 () Bool)

(declare-fun res!882016 () Bool)

(assert (=> b!1329330 (=> (not res!882016) (not e!757842))))

(declare-fun getCurrentListMap!5639 (array!89952 array!89950 (_ BitVec 32) (_ BitVec 32) V!53809 V!53809 (_ BitVec 32) Int) ListLongMap!21267)

(assert (=> b!1329330 (= res!882016 (contains!8813 (getCurrentListMap!5639 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1329331 () Bool)

(declare-fun e!757845 () Bool)

(assert (=> b!1329331 (= e!757845 tp_is_empty!36529)))

(declare-fun b!1329332 () Bool)

(assert (=> b!1329332 (= e!757844 (and e!757845 mapRes!56467))))

(declare-fun condMapEmpty!56467 () Bool)

(declare-fun mapDefault!56467 () ValueCell!17366)

