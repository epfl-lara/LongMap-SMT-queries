; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84528 () Bool)

(assert start!84528)

(declare-fun b_free!20023 () Bool)

(declare-fun b_next!20023 () Bool)

(assert (=> start!84528 (= b_free!20023 (not b_next!20023))))

(declare-fun tp!69854 () Bool)

(declare-fun b_and!32117 () Bool)

(assert (=> start!84528 (= tp!69854 b_and!32117)))

(declare-fun b!988672 () Bool)

(declare-fun res!661265 () Bool)

(declare-fun e!557491 () Bool)

(assert (=> b!988672 (=> (not res!661265) (not e!557491))))

(declare-datatypes ((array!62437 0))(
  ( (array!62438 (arr!30073 (Array (_ BitVec 32) (_ BitVec 64))) (size!30552 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62437)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62437 (_ BitVec 32)) Bool)

(assert (=> b!988672 (= res!661265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!988673 () Bool)

(declare-fun res!661263 () Bool)

(assert (=> b!988673 (=> (not res!661263) (not e!557491))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!988673 (= res!661263 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30552 _keys!1544))))))

(declare-fun mapIsEmpty!36897 () Bool)

(declare-fun mapRes!36897 () Bool)

(assert (=> mapIsEmpty!36897 mapRes!36897))

(declare-fun mapNonEmpty!36897 () Bool)

(declare-fun tp!69853 () Bool)

(declare-fun e!557490 () Bool)

(assert (=> mapNonEmpty!36897 (= mapRes!36897 (and tp!69853 e!557490))))

(declare-datatypes ((V!35969 0))(
  ( (V!35970 (val!11670 Int)) )
))
(declare-datatypes ((ValueCell!11138 0))(
  ( (ValueCellFull!11138 (v!14237 V!35969)) (EmptyCell!11138) )
))
(declare-datatypes ((array!62439 0))(
  ( (array!62440 (arr!30074 (Array (_ BitVec 32) ValueCell!11138)) (size!30553 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62439)

(declare-fun mapKey!36897 () (_ BitVec 32))

(declare-fun mapRest!36897 () (Array (_ BitVec 32) ValueCell!11138))

(declare-fun mapValue!36897 () ValueCell!11138)

(assert (=> mapNonEmpty!36897 (= (arr!30074 _values!1278) (store mapRest!36897 mapKey!36897 mapValue!36897))))

(declare-fun b!988674 () Bool)

(declare-fun res!661266 () Bool)

(assert (=> b!988674 (=> (not res!661266) (not e!557491))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!988674 (= res!661266 (and (= (size!30553 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30552 _keys!1544) (size!30553 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!988675 () Bool)

(declare-fun tp_is_empty!23239 () Bool)

(assert (=> b!988675 (= e!557490 tp_is_empty!23239)))

(declare-fun b!988676 () Bool)

(declare-fun res!661260 () Bool)

(assert (=> b!988676 (=> (not res!661260) (not e!557491))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!988676 (= res!661260 (validKeyInArray!0 (select (arr!30073 _keys!1544) from!1932)))))

(declare-fun b!988677 () Bool)

(declare-fun e!557493 () Bool)

(assert (=> b!988677 (= e!557493 tp_is_empty!23239)))

(declare-fun b!988678 () Bool)

(declare-fun res!661261 () Bool)

(assert (=> b!988678 (=> (not res!661261) (not e!557491))))

(assert (=> b!988678 (= res!661261 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!988679 () Bool)

(assert (=> b!988679 (= e!557491 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!30073 _keys!1544) from!1932)))))

(declare-fun minValue!1220 () V!35969)

(declare-fun zeroValue!1220 () V!35969)

(declare-fun defaultEntry!1281 () Int)

(declare-datatypes ((tuple2!14870 0))(
  ( (tuple2!14871 (_1!7446 (_ BitVec 64)) (_2!7446 V!35969)) )
))
(declare-datatypes ((List!20801 0))(
  ( (Nil!20798) (Cons!20797 (h!21959 tuple2!14870) (t!29738 List!20801)) )
))
(declare-datatypes ((ListLongMap!13567 0))(
  ( (ListLongMap!13568 (toList!6799 List!20801)) )
))
(declare-fun lt!438541 () ListLongMap!13567)

(declare-fun getCurrentListMapNoExtraKeys!3490 (array!62437 array!62439 (_ BitVec 32) (_ BitVec 32) V!35969 V!35969 (_ BitVec 32) Int) ListLongMap!13567)

(assert (=> b!988679 (= lt!438541 (getCurrentListMapNoExtraKeys!3490 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!988680 () Bool)

(declare-fun e!557492 () Bool)

(assert (=> b!988680 (= e!557492 (and e!557493 mapRes!36897))))

(declare-fun condMapEmpty!36897 () Bool)

(declare-fun mapDefault!36897 () ValueCell!11138)

