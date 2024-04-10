; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112688 () Bool)

(assert start!112688)

(declare-fun b_free!31025 () Bool)

(declare-fun b_next!31025 () Bool)

(assert (=> start!112688 (= b_free!31025 (not b_next!31025))))

(declare-fun tp!108716 () Bool)

(declare-fun b_and!49987 () Bool)

(assert (=> start!112688 (= tp!108716 b_and!49987)))

(declare-fun b!1336785 () Bool)

(declare-fun res!887152 () Bool)

(declare-fun e!761212 () Bool)

(assert (=> b!1336785 (=> (not res!887152) (not e!761212))))

(declare-datatypes ((array!90728 0))(
  ( (array!90729 (arr!43829 (Array (_ BitVec 32) (_ BitVec 64))) (size!44379 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90728)

(declare-datatypes ((List!31059 0))(
  ( (Nil!31056) (Cons!31055 (h!32264 (_ BitVec 64)) (t!45365 List!31059)) )
))
(declare-fun arrayNoDuplicates!0 (array!90728 (_ BitVec 32) List!31059) Bool)

(assert (=> b!1336785 (= res!887152 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31056))))

(declare-fun b!1336786 () Bool)

(declare-fun e!761214 () Bool)

(declare-fun tp_is_empty!36935 () Bool)

(assert (=> b!1336786 (= e!761214 tp_is_empty!36935)))

(declare-fun b!1336787 () Bool)

(declare-fun e!761211 () Bool)

(assert (=> b!1336787 (= e!761211 tp_is_empty!36935)))

(declare-fun mapNonEmpty!57080 () Bool)

(declare-fun mapRes!57080 () Bool)

(declare-fun tp!108715 () Bool)

(assert (=> mapNonEmpty!57080 (= mapRes!57080 (and tp!108715 e!761211))))

(declare-datatypes ((V!54349 0))(
  ( (V!54350 (val!18542 Int)) )
))
(declare-datatypes ((ValueCell!17569 0))(
  ( (ValueCellFull!17569 (v!21182 V!54349)) (EmptyCell!17569) )
))
(declare-datatypes ((array!90730 0))(
  ( (array!90731 (arr!43830 (Array (_ BitVec 32) ValueCell!17569)) (size!44380 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90730)

(declare-fun mapValue!57080 () ValueCell!17569)

(declare-fun mapKey!57080 () (_ BitVec 32))

(declare-fun mapRest!57080 () (Array (_ BitVec 32) ValueCell!17569))

(assert (=> mapNonEmpty!57080 (= (arr!43830 _values!1320) (store mapRest!57080 mapKey!57080 mapValue!57080))))

(declare-fun b!1336788 () Bool)

(declare-fun res!887158 () Bool)

(assert (=> b!1336788 (=> (not res!887158) (not e!761212))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1336788 (= res!887158 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44379 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1336789 () Bool)

(declare-fun res!887156 () Bool)

(assert (=> b!1336789 (=> (not res!887156) (not e!761212))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1336789 (= res!887156 (validKeyInArray!0 (select (arr!43829 _keys!1590) from!1980)))))

(declare-fun b!1336790 () Bool)

(declare-fun res!887159 () Bool)

(assert (=> b!1336790 (=> (not res!887159) (not e!761212))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90728 (_ BitVec 32)) Bool)

(assert (=> b!1336790 (= res!887159 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1336791 () Bool)

(assert (=> b!1336791 (= e!761212 (not true))))

(declare-datatypes ((tuple2!23916 0))(
  ( (tuple2!23917 (_1!11969 (_ BitVec 64)) (_2!11969 V!54349)) )
))
(declare-datatypes ((List!31060 0))(
  ( (Nil!31057) (Cons!31056 (h!32265 tuple2!23916) (t!45366 List!31060)) )
))
(declare-datatypes ((ListLongMap!21573 0))(
  ( (ListLongMap!21574 (toList!10802 List!31060)) )
))
(declare-fun lt!592855 () ListLongMap!21573)

(declare-fun contains!8967 (ListLongMap!21573 (_ BitVec 64)) Bool)

(assert (=> b!1336791 (contains!8967 lt!592855 k!1153)))

(declare-fun lt!592854 () V!54349)

(declare-datatypes ((Unit!43934 0))(
  ( (Unit!43935) )
))
(declare-fun lt!592852 () Unit!43934)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!322 ((_ BitVec 64) (_ BitVec 64) V!54349 ListLongMap!21573) Unit!43934)

(assert (=> b!1336791 (= lt!592852 (lemmaInListMapAfterAddingDiffThenInBefore!322 k!1153 (select (arr!43829 _keys!1590) from!1980) lt!592854 lt!592855))))

(declare-fun lt!592853 () ListLongMap!21573)

(assert (=> b!1336791 (contains!8967 lt!592853 k!1153)))

(declare-fun minValue!1262 () V!54349)

(declare-fun lt!592856 () Unit!43934)

(assert (=> b!1336791 (= lt!592856 (lemmaInListMapAfterAddingDiffThenInBefore!322 k!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!592853))))

(declare-fun +!4743 (ListLongMap!21573 tuple2!23916) ListLongMap!21573)

(assert (=> b!1336791 (= lt!592853 (+!4743 lt!592855 (tuple2!23917 (select (arr!43829 _keys!1590) from!1980) lt!592854)))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun get!22116 (ValueCell!17569 V!54349) V!54349)

(declare-fun dynLambda!3682 (Int (_ BitVec 64)) V!54349)

(assert (=> b!1336791 (= lt!592854 (get!22116 (select (arr!43830 _values!1320) from!1980) (dynLambda!3682 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1262 () V!54349)

(declare-fun getCurrentListMapNoExtraKeys!6385 (array!90728 array!90730 (_ BitVec 32) (_ BitVec 32) V!54349 V!54349 (_ BitVec 32) Int) ListLongMap!21573)

(assert (=> b!1336791 (= lt!592855 (getCurrentListMapNoExtraKeys!6385 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1336792 () Bool)

(declare-fun e!761213 () Bool)

(assert (=> b!1336792 (= e!761213 (and e!761214 mapRes!57080))))

(declare-fun condMapEmpty!57080 () Bool)

(declare-fun mapDefault!57080 () ValueCell!17569)

