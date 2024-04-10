; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112246 () Bool)

(assert start!112246)

(declare-fun b_free!30641 () Bool)

(declare-fun b_next!30641 () Bool)

(assert (=> start!112246 (= b_free!30641 (not b_next!30641))))

(declare-fun tp!107560 () Bool)

(declare-fun b_and!49337 () Bool)

(assert (=> start!112246 (= tp!107560 b_and!49337)))

(declare-fun b!1329741 () Bool)

(declare-fun res!882312 () Bool)

(declare-fun e!758009 () Bool)

(assert (=> b!1329741 (=> (not res!882312) (not e!758009))))

(declare-datatypes ((V!53837 0))(
  ( (V!53838 (val!18350 Int)) )
))
(declare-datatypes ((ValueCell!17377 0))(
  ( (ValueCellFull!17377 (v!20987 V!53837)) (EmptyCell!17377) )
))
(declare-datatypes ((array!89994 0))(
  ( (array!89995 (arr!43463 (Array (_ BitVec 32) ValueCell!17377)) (size!44013 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89994)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!89996 0))(
  ( (array!89997 (arr!43464 (Array (_ BitVec 32) (_ BitVec 64))) (size!44014 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89996)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!53837)

(declare-fun zeroValue!1262 () V!53837)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23628 0))(
  ( (tuple2!23629 (_1!11825 (_ BitVec 64)) (_2!11825 V!53837)) )
))
(declare-datatypes ((List!30779 0))(
  ( (Nil!30776) (Cons!30775 (h!31984 tuple2!23628) (t!44833 List!30779)) )
))
(declare-datatypes ((ListLongMap!21285 0))(
  ( (ListLongMap!21286 (toList!10658 List!30779)) )
))
(declare-fun contains!8822 (ListLongMap!21285 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5647 (array!89996 array!89994 (_ BitVec 32) (_ BitVec 32) V!53837 V!53837 (_ BitVec 32) Int) ListLongMap!21285)

(assert (=> b!1329741 (= res!882312 (contains!8822 (getCurrentListMap!5647 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun mapIsEmpty!56500 () Bool)

(declare-fun mapRes!56500 () Bool)

(assert (=> mapIsEmpty!56500 mapRes!56500))

(declare-fun b!1329742 () Bool)

(declare-fun res!882310 () Bool)

(assert (=> b!1329742 (=> (not res!882310) (not e!758009))))

(assert (=> b!1329742 (= res!882310 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1329743 () Bool)

(declare-fun res!882318 () Bool)

(assert (=> b!1329743 (=> (not res!882318) (not e!758009))))

(declare-datatypes ((List!30780 0))(
  ( (Nil!30777) (Cons!30776 (h!31985 (_ BitVec 64)) (t!44834 List!30780)) )
))
(declare-fun arrayNoDuplicates!0 (array!89996 (_ BitVec 32) List!30780) Bool)

(assert (=> b!1329743 (= res!882318 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30777))))

(declare-fun b!1329744 () Bool)

(declare-fun res!882316 () Bool)

(assert (=> b!1329744 (=> (not res!882316) (not e!758009))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89996 (_ BitVec 32)) Bool)

(assert (=> b!1329744 (= res!882316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1329745 () Bool)

(declare-fun res!882315 () Bool)

(assert (=> b!1329745 (=> (not res!882315) (not e!758009))))

(assert (=> b!1329745 (= res!882315 (and (= (size!44013 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44014 _keys!1590) (size!44013 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1329746 () Bool)

(assert (=> b!1329746 (= e!758009 (not true))))

(declare-fun lt!591004 () ListLongMap!21285)

(assert (=> b!1329746 (contains!8822 lt!591004 k!1153)))

(declare-datatypes ((Unit!43763 0))(
  ( (Unit!43764) )
))
(declare-fun lt!591003 () Unit!43763)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!244 ((_ BitVec 64) (_ BitVec 64) V!53837 ListLongMap!21285) Unit!43763)

(assert (=> b!1329746 (= lt!591003 (lemmaInListMapAfterAddingDiffThenInBefore!244 k!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591004))))

(declare-fun +!4657 (ListLongMap!21285 tuple2!23628) ListLongMap!21285)

(declare-fun getCurrentListMapNoExtraKeys!6295 (array!89996 array!89994 (_ BitVec 32) (_ BitVec 32) V!53837 V!53837 (_ BitVec 32) Int) ListLongMap!21285)

(declare-fun get!21899 (ValueCell!17377 V!53837) V!53837)

(declare-fun dynLambda!3596 (Int (_ BitVec 64)) V!53837)

(assert (=> b!1329746 (= lt!591004 (+!4657 (getCurrentListMapNoExtraKeys!6295 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23629 (select (arr!43464 _keys!1590) from!1980) (get!21899 (select (arr!43463 _values!1320) from!1980) (dynLambda!3596 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1329747 () Bool)

(declare-fun res!882314 () Bool)

(assert (=> b!1329747 (=> (not res!882314) (not e!758009))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1329747 (= res!882314 (validKeyInArray!0 (select (arr!43464 _keys!1590) from!1980)))))

(declare-fun mapNonEmpty!56500 () Bool)

(declare-fun tp!107559 () Bool)

(declare-fun e!758010 () Bool)

(assert (=> mapNonEmpty!56500 (= mapRes!56500 (and tp!107559 e!758010))))

(declare-fun mapKey!56500 () (_ BitVec 32))

(declare-fun mapValue!56500 () ValueCell!17377)

(declare-fun mapRest!56500 () (Array (_ BitVec 32) ValueCell!17377))

(assert (=> mapNonEmpty!56500 (= (arr!43463 _values!1320) (store mapRest!56500 mapKey!56500 mapValue!56500))))

(declare-fun res!882311 () Bool)

(assert (=> start!112246 (=> (not res!882311) (not e!758009))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112246 (= res!882311 (validMask!0 mask!1998))))

(assert (=> start!112246 e!758009))

(declare-fun e!758007 () Bool)

(declare-fun array_inv!32795 (array!89994) Bool)

(assert (=> start!112246 (and (array_inv!32795 _values!1320) e!758007)))

(assert (=> start!112246 true))

(declare-fun array_inv!32796 (array!89996) Bool)

(assert (=> start!112246 (array_inv!32796 _keys!1590)))

(assert (=> start!112246 tp!107560))

(declare-fun tp_is_empty!36551 () Bool)

(assert (=> start!112246 tp_is_empty!36551))

(declare-fun b!1329748 () Bool)

(declare-fun res!882317 () Bool)

(assert (=> b!1329748 (=> (not res!882317) (not e!758009))))

(assert (=> b!1329748 (= res!882317 (not (= (select (arr!43464 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1329749 () Bool)

(declare-fun res!882313 () Bool)

(assert (=> b!1329749 (=> (not res!882313) (not e!758009))))

(assert (=> b!1329749 (= res!882313 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44014 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1329750 () Bool)

(declare-fun e!758008 () Bool)

(assert (=> b!1329750 (= e!758008 tp_is_empty!36551)))

(declare-fun b!1329751 () Bool)

(assert (=> b!1329751 (= e!758007 (and e!758008 mapRes!56500))))

(declare-fun condMapEmpty!56500 () Bool)

(declare-fun mapDefault!56500 () ValueCell!17377)

