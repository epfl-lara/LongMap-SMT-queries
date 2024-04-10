; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112398 () Bool)

(assert start!112398)

(declare-fun b_free!30793 () Bool)

(declare-fun b_next!30793 () Bool)

(assert (=> start!112398 (= b_free!30793 (not b_next!30793))))

(declare-fun tp!108016 () Bool)

(declare-fun b_and!49635 () Bool)

(assert (=> start!112398 (= tp!108016 b_and!49635)))

(declare-fun mapIsEmpty!56728 () Bool)

(declare-fun mapRes!56728 () Bool)

(assert (=> mapIsEmpty!56728 mapRes!56728))

(declare-fun b!1332579 () Bool)

(declare-fun e!759149 () Bool)

(declare-fun tp_is_empty!36703 () Bool)

(assert (=> b!1332579 (= e!759149 tp_is_empty!36703)))

(declare-fun b!1332580 () Bool)

(declare-fun res!884320 () Bool)

(declare-fun e!759151 () Bool)

(assert (=> b!1332580 (=> (not res!884320) (not e!759151))))

(declare-datatypes ((array!90286 0))(
  ( (array!90287 (arr!43609 (Array (_ BitVec 32) (_ BitVec 64))) (size!44159 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90286)

(declare-datatypes ((List!30892 0))(
  ( (Nil!30889) (Cons!30888 (h!32097 (_ BitVec 64)) (t!45090 List!30892)) )
))
(declare-fun arrayNoDuplicates!0 (array!90286 (_ BitVec 32) List!30892) Bool)

(assert (=> b!1332580 (= res!884320 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30889))))

(declare-fun mapNonEmpty!56728 () Bool)

(declare-fun tp!108015 () Bool)

(assert (=> mapNonEmpty!56728 (= mapRes!56728 (and tp!108015 e!759149))))

(declare-datatypes ((V!54041 0))(
  ( (V!54042 (val!18426 Int)) )
))
(declare-datatypes ((ValueCell!17453 0))(
  ( (ValueCellFull!17453 (v!21063 V!54041)) (EmptyCell!17453) )
))
(declare-datatypes ((array!90288 0))(
  ( (array!90289 (arr!43610 (Array (_ BitVec 32) ValueCell!17453)) (size!44160 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90288)

(declare-fun mapKey!56728 () (_ BitVec 32))

(declare-fun mapRest!56728 () (Array (_ BitVec 32) ValueCell!17453))

(declare-fun mapValue!56728 () ValueCell!17453)

(assert (=> mapNonEmpty!56728 (= (arr!43610 _values!1320) (store mapRest!56728 mapKey!56728 mapValue!56728))))

(declare-fun b!1332582 () Bool)

(declare-fun res!884321 () Bool)

(assert (=> b!1332582 (=> (not res!884321) (not e!759151))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1332582 (= res!884321 (and (= (size!44160 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44159 _keys!1590) (size!44160 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1332583 () Bool)

(assert (=> b!1332583 (= e!759151 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun zeroValue!1262 () V!54041)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun minValue!1262 () V!54041)

(declare-fun lt!592042 () Bool)

(declare-datatypes ((tuple2!23748 0))(
  ( (tuple2!23749 (_1!11885 (_ BitVec 64)) (_2!11885 V!54041)) )
))
(declare-datatypes ((List!30893 0))(
  ( (Nil!30890) (Cons!30889 (h!32098 tuple2!23748) (t!45091 List!30893)) )
))
(declare-datatypes ((ListLongMap!21405 0))(
  ( (ListLongMap!21406 (toList!10718 List!30893)) )
))
(declare-fun contains!8882 (ListLongMap!21405 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5699 (array!90286 array!90288 (_ BitVec 32) (_ BitVec 32) V!54041 V!54041 (_ BitVec 32) Int) ListLongMap!21405)

(assert (=> b!1332583 (= lt!592042 (contains!8882 (getCurrentListMap!5699 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1332584 () Bool)

(declare-fun res!884322 () Bool)

(assert (=> b!1332584 (=> (not res!884322) (not e!759151))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90286 (_ BitVec 32)) Bool)

(assert (=> b!1332584 (= res!884322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1332585 () Bool)

(declare-fun res!884319 () Bool)

(assert (=> b!1332585 (=> (not res!884319) (not e!759151))))

(assert (=> b!1332585 (= res!884319 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44159 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1332586 () Bool)

(declare-fun e!759150 () Bool)

(assert (=> b!1332586 (= e!759150 tp_is_empty!36703)))

(declare-fun res!884318 () Bool)

(assert (=> start!112398 (=> (not res!884318) (not e!759151))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112398 (= res!884318 (validMask!0 mask!1998))))

(assert (=> start!112398 e!759151))

(declare-fun e!759147 () Bool)

(declare-fun array_inv!32895 (array!90288) Bool)

(assert (=> start!112398 (and (array_inv!32895 _values!1320) e!759147)))

(assert (=> start!112398 true))

(declare-fun array_inv!32896 (array!90286) Bool)

(assert (=> start!112398 (array_inv!32896 _keys!1590)))

(assert (=> start!112398 tp!108016))

(assert (=> start!112398 tp_is_empty!36703))

(declare-fun b!1332581 () Bool)

(assert (=> b!1332581 (= e!759147 (and e!759150 mapRes!56728))))

(declare-fun condMapEmpty!56728 () Bool)

(declare-fun mapDefault!56728 () ValueCell!17453)

