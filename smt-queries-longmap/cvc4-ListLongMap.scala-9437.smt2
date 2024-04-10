; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112234 () Bool)

(assert start!112234)

(declare-fun b_free!30629 () Bool)

(declare-fun b_next!30629 () Bool)

(assert (=> start!112234 (= b_free!30629 (not b_next!30629))))

(declare-fun tp!107523 () Bool)

(declare-fun b_and!49313 () Bool)

(assert (=> start!112234 (= tp!107523 b_and!49313)))

(declare-fun res!882152 () Bool)

(declare-fun e!757917 () Bool)

(assert (=> start!112234 (=> (not res!882152) (not e!757917))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112234 (= res!882152 (validMask!0 mask!1998))))

(assert (=> start!112234 e!757917))

(declare-datatypes ((V!53821 0))(
  ( (V!53822 (val!18344 Int)) )
))
(declare-datatypes ((ValueCell!17371 0))(
  ( (ValueCellFull!17371 (v!20981 V!53821)) (EmptyCell!17371) )
))
(declare-datatypes ((array!89970 0))(
  ( (array!89971 (arr!43451 (Array (_ BitVec 32) ValueCell!17371)) (size!44001 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89970)

(declare-fun e!757919 () Bool)

(declare-fun array_inv!32785 (array!89970) Bool)

(assert (=> start!112234 (and (array_inv!32785 _values!1320) e!757919)))

(assert (=> start!112234 true))

(declare-datatypes ((array!89972 0))(
  ( (array!89973 (arr!43452 (Array (_ BitVec 32) (_ BitVec 64))) (size!44002 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89972)

(declare-fun array_inv!32786 (array!89972) Bool)

(assert (=> start!112234 (array_inv!32786 _keys!1590)))

(assert (=> start!112234 tp!107523))

(declare-fun tp_is_empty!36539 () Bool)

(assert (=> start!112234 tp_is_empty!36539))

(declare-fun b!1329513 () Bool)

(declare-fun e!757918 () Bool)

(assert (=> b!1329513 (= e!757918 tp_is_empty!36539)))

(declare-fun b!1329514 () Bool)

(declare-fun res!882153 () Bool)

(assert (=> b!1329514 (=> (not res!882153) (not e!757917))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!53821)

(declare-fun zeroValue!1262 () V!53821)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23618 0))(
  ( (tuple2!23619 (_1!11820 (_ BitVec 64)) (_2!11820 V!53821)) )
))
(declare-datatypes ((List!30770 0))(
  ( (Nil!30767) (Cons!30766 (h!31975 tuple2!23618) (t!44812 List!30770)) )
))
(declare-datatypes ((ListLongMap!21275 0))(
  ( (ListLongMap!21276 (toList!10653 List!30770)) )
))
(declare-fun contains!8817 (ListLongMap!21275 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5643 (array!89972 array!89970 (_ BitVec 32) (_ BitVec 32) V!53821 V!53821 (_ BitVec 32) Int) ListLongMap!21275)

(assert (=> b!1329514 (= res!882153 (contains!8817 (getCurrentListMap!5643 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun mapNonEmpty!56482 () Bool)

(declare-fun mapRes!56482 () Bool)

(declare-fun tp!107524 () Bool)

(assert (=> mapNonEmpty!56482 (= mapRes!56482 (and tp!107524 e!757918))))

(declare-fun mapValue!56482 () ValueCell!17371)

(declare-fun mapKey!56482 () (_ BitVec 32))

(declare-fun mapRest!56482 () (Array (_ BitVec 32) ValueCell!17371))

(assert (=> mapNonEmpty!56482 (= (arr!43451 _values!1320) (store mapRest!56482 mapKey!56482 mapValue!56482))))

(declare-fun b!1329515 () Bool)

(declare-fun res!882156 () Bool)

(assert (=> b!1329515 (=> (not res!882156) (not e!757917))))

(assert (=> b!1329515 (= res!882156 (and (= (size!44001 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44002 _keys!1590) (size!44001 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1329516 () Bool)

(declare-fun res!882150 () Bool)

(assert (=> b!1329516 (=> (not res!882150) (not e!757917))))

(assert (=> b!1329516 (= res!882150 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1329517 () Bool)

(assert (=> b!1329517 (= e!757917 (not true))))

(declare-fun lt!590967 () ListLongMap!21275)

(assert (=> b!1329517 (contains!8817 lt!590967 k!1153)))

(declare-datatypes ((Unit!43753 0))(
  ( (Unit!43754) )
))
(declare-fun lt!590968 () Unit!43753)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!239 ((_ BitVec 64) (_ BitVec 64) V!53821 ListLongMap!21275) Unit!43753)

(assert (=> b!1329517 (= lt!590968 (lemmaInListMapAfterAddingDiffThenInBefore!239 k!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!590967))))

(declare-fun +!4652 (ListLongMap!21275 tuple2!23618) ListLongMap!21275)

(declare-fun getCurrentListMapNoExtraKeys!6290 (array!89972 array!89970 (_ BitVec 32) (_ BitVec 32) V!53821 V!53821 (_ BitVec 32) Int) ListLongMap!21275)

(declare-fun get!21890 (ValueCell!17371 V!53821) V!53821)

(declare-fun dynLambda!3591 (Int (_ BitVec 64)) V!53821)

(assert (=> b!1329517 (= lt!590967 (+!4652 (getCurrentListMapNoExtraKeys!6290 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23619 (select (arr!43452 _keys!1590) from!1980) (get!21890 (select (arr!43451 _values!1320) from!1980) (dynLambda!3591 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapIsEmpty!56482 () Bool)

(assert (=> mapIsEmpty!56482 mapRes!56482))

(declare-fun b!1329518 () Bool)

(declare-fun res!882151 () Bool)

(assert (=> b!1329518 (=> (not res!882151) (not e!757917))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1329518 (= res!882151 (validKeyInArray!0 (select (arr!43452 _keys!1590) from!1980)))))

(declare-fun b!1329519 () Bool)

(declare-fun e!757920 () Bool)

(assert (=> b!1329519 (= e!757919 (and e!757920 mapRes!56482))))

(declare-fun condMapEmpty!56482 () Bool)

(declare-fun mapDefault!56482 () ValueCell!17371)

