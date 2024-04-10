; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112252 () Bool)

(assert start!112252)

(declare-fun b_free!30647 () Bool)

(declare-fun b_next!30647 () Bool)

(assert (=> start!112252 (= b_free!30647 (not b_next!30647))))

(declare-fun tp!107578 () Bool)

(declare-fun b_and!49349 () Bool)

(assert (=> start!112252 (= tp!107578 b_and!49349)))

(declare-fun b!1329855 () Bool)

(declare-fun res!882399 () Bool)

(declare-fun e!758054 () Bool)

(assert (=> b!1329855 (=> (not res!882399) (not e!758054))))

(declare-datatypes ((array!90004 0))(
  ( (array!90005 (arr!43468 (Array (_ BitVec 32) (_ BitVec 64))) (size!44018 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90004)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90004 (_ BitVec 32)) Bool)

(assert (=> b!1329855 (= res!882399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1329856 () Bool)

(declare-fun res!882391 () Bool)

(assert (=> b!1329856 (=> (not res!882391) (not e!758054))))

(declare-datatypes ((List!30783 0))(
  ( (Nil!30780) (Cons!30779 (h!31988 (_ BitVec 64)) (t!44843 List!30783)) )
))
(declare-fun arrayNoDuplicates!0 (array!90004 (_ BitVec 32) List!30783) Bool)

(assert (=> b!1329856 (= res!882391 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30780))))

(declare-fun b!1329857 () Bool)

(declare-fun res!882394 () Bool)

(assert (=> b!1329857 (=> (not res!882394) (not e!758054))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1329857 (= res!882394 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44018 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!56509 () Bool)

(declare-fun mapRes!56509 () Bool)

(assert (=> mapIsEmpty!56509 mapRes!56509))

(declare-fun b!1329858 () Bool)

(assert (=> b!1329858 (= e!758054 (not true))))

(declare-datatypes ((V!53845 0))(
  ( (V!53846 (val!18353 Int)) )
))
(declare-datatypes ((tuple2!23632 0))(
  ( (tuple2!23633 (_1!11827 (_ BitVec 64)) (_2!11827 V!53845)) )
))
(declare-datatypes ((List!30784 0))(
  ( (Nil!30781) (Cons!30780 (h!31989 tuple2!23632) (t!44844 List!30784)) )
))
(declare-datatypes ((ListLongMap!21289 0))(
  ( (ListLongMap!21290 (toList!10660 List!30784)) )
))
(declare-fun lt!591022 () ListLongMap!21289)

(declare-fun contains!8824 (ListLongMap!21289 (_ BitVec 64)) Bool)

(assert (=> b!1329858 (contains!8824 lt!591022 k!1153)))

(declare-datatypes ((Unit!43767 0))(
  ( (Unit!43768) )
))
(declare-fun lt!591021 () Unit!43767)

(declare-fun minValue!1262 () V!53845)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!246 ((_ BitVec 64) (_ BitVec 64) V!53845 ListLongMap!21289) Unit!43767)

(assert (=> b!1329858 (= lt!591021 (lemmaInListMapAfterAddingDiffThenInBefore!246 k!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591022))))

(declare-datatypes ((ValueCell!17380 0))(
  ( (ValueCellFull!17380 (v!20990 V!53845)) (EmptyCell!17380) )
))
(declare-datatypes ((array!90006 0))(
  ( (array!90007 (arr!43469 (Array (_ BitVec 32) ValueCell!17380)) (size!44019 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90006)

(declare-fun defaultEntry!1323 () Int)

(declare-fun zeroValue!1262 () V!53845)

(declare-fun +!4659 (ListLongMap!21289 tuple2!23632) ListLongMap!21289)

(declare-fun getCurrentListMapNoExtraKeys!6297 (array!90004 array!90006 (_ BitVec 32) (_ BitVec 32) V!53845 V!53845 (_ BitVec 32) Int) ListLongMap!21289)

(declare-fun get!21903 (ValueCell!17380 V!53845) V!53845)

(declare-fun dynLambda!3598 (Int (_ BitVec 64)) V!53845)

(assert (=> b!1329858 (= lt!591022 (+!4659 (getCurrentListMapNoExtraKeys!6297 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23633 (select (arr!43468 _keys!1590) from!1980) (get!21903 (select (arr!43469 _values!1320) from!1980) (dynLambda!3598 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapNonEmpty!56509 () Bool)

(declare-fun tp!107577 () Bool)

(declare-fun e!758056 () Bool)

(assert (=> mapNonEmpty!56509 (= mapRes!56509 (and tp!107577 e!758056))))

(declare-fun mapRest!56509 () (Array (_ BitVec 32) ValueCell!17380))

(declare-fun mapKey!56509 () (_ BitVec 32))

(declare-fun mapValue!56509 () ValueCell!17380)

(assert (=> mapNonEmpty!56509 (= (arr!43469 _values!1320) (store mapRest!56509 mapKey!56509 mapValue!56509))))

(declare-fun b!1329859 () Bool)

(declare-fun res!882397 () Bool)

(assert (=> b!1329859 (=> (not res!882397) (not e!758054))))

(assert (=> b!1329859 (= res!882397 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1329860 () Bool)

(declare-fun e!758055 () Bool)

(declare-fun e!758052 () Bool)

(assert (=> b!1329860 (= e!758055 (and e!758052 mapRes!56509))))

(declare-fun condMapEmpty!56509 () Bool)

(declare-fun mapDefault!56509 () ValueCell!17380)

