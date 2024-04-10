; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112446 () Bool)

(assert start!112446)

(declare-fun b_free!30841 () Bool)

(declare-fun b_next!30841 () Bool)

(assert (=> start!112446 (= b_free!30841 (not b_next!30841))))

(declare-fun tp!108160 () Bool)

(declare-fun b_and!49683 () Bool)

(assert (=> start!112446 (= tp!108160 b_and!49683)))

(declare-fun b!1333190 () Bool)

(declare-fun e!759508 () Bool)

(declare-fun tp_is_empty!36751 () Bool)

(assert (=> b!1333190 (= e!759508 tp_is_empty!36751)))

(declare-fun res!884717 () Bool)

(declare-fun e!759510 () Bool)

(assert (=> start!112446 (=> (not res!884717) (not e!759510))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112446 (= res!884717 (validMask!0 mask!1998))))

(assert (=> start!112446 e!759510))

(declare-datatypes ((V!54105 0))(
  ( (V!54106 (val!18450 Int)) )
))
(declare-datatypes ((ValueCell!17477 0))(
  ( (ValueCellFull!17477 (v!21087 V!54105)) (EmptyCell!17477) )
))
(declare-datatypes ((array!90376 0))(
  ( (array!90377 (arr!43654 (Array (_ BitVec 32) ValueCell!17477)) (size!44204 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90376)

(declare-fun e!759507 () Bool)

(declare-fun array_inv!32925 (array!90376) Bool)

(assert (=> start!112446 (and (array_inv!32925 _values!1320) e!759507)))

(assert (=> start!112446 true))

(declare-datatypes ((array!90378 0))(
  ( (array!90379 (arr!43655 (Array (_ BitVec 32) (_ BitVec 64))) (size!44205 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90378)

(declare-fun array_inv!32926 (array!90378) Bool)

(assert (=> start!112446 (array_inv!32926 _keys!1590)))

(assert (=> start!112446 tp!108160))

(assert (=> start!112446 tp_is_empty!36751))

(declare-fun b!1333191 () Bool)

(declare-fun res!884721 () Bool)

(assert (=> b!1333191 (=> (not res!884721) (not e!759510))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90378 (_ BitVec 32)) Bool)

(assert (=> b!1333191 (= res!884721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1333192 () Bool)

(declare-fun res!884713 () Bool)

(assert (=> b!1333192 (=> (not res!884713) (not e!759510))))

(declare-datatypes ((List!30924 0))(
  ( (Nil!30921) (Cons!30920 (h!32129 (_ BitVec 64)) (t!45124 List!30924)) )
))
(declare-fun arrayNoDuplicates!0 (array!90378 (_ BitVec 32) List!30924) Bool)

(assert (=> b!1333192 (= res!884713 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30921))))

(declare-fun b!1333193 () Bool)

(declare-fun res!884718 () Bool)

(assert (=> b!1333193 (=> (not res!884718) (not e!759510))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1333193 (= res!884718 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44205 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1333194 () Bool)

(declare-fun res!884720 () Bool)

(assert (=> b!1333194 (=> (not res!884720) (not e!759510))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1333194 (= res!884720 (validKeyInArray!0 (select (arr!43655 _keys!1590) from!1980)))))

(declare-fun b!1333195 () Bool)

(declare-fun res!884716 () Bool)

(assert (=> b!1333195 (=> (not res!884716) (not e!759510))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54105)

(declare-fun zeroValue!1262 () V!54105)

(declare-datatypes ((tuple2!23780 0))(
  ( (tuple2!23781 (_1!11901 (_ BitVec 64)) (_2!11901 V!54105)) )
))
(declare-datatypes ((List!30925 0))(
  ( (Nil!30922) (Cons!30921 (h!32130 tuple2!23780) (t!45125 List!30925)) )
))
(declare-datatypes ((ListLongMap!21437 0))(
  ( (ListLongMap!21438 (toList!10734 List!30925)) )
))
(declare-fun contains!8898 (ListLongMap!21437 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5715 (array!90378 array!90376 (_ BitVec 32) (_ BitVec 32) V!54105 V!54105 (_ BitVec 32) Int) ListLongMap!21437)

(assert (=> b!1333195 (= res!884716 (contains!8898 (getCurrentListMap!5715 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1333196 () Bool)

(assert (=> b!1333196 (= e!759510 false)))

(declare-fun lt!592105 () Bool)

(declare-fun +!4708 (ListLongMap!21437 tuple2!23780) ListLongMap!21437)

(declare-fun getCurrentListMapNoExtraKeys!6346 (array!90378 array!90376 (_ BitVec 32) (_ BitVec 32) V!54105 V!54105 (_ BitVec 32) Int) ListLongMap!21437)

(declare-fun get!22018 (ValueCell!17477 V!54105) V!54105)

(declare-fun dynLambda!3647 (Int (_ BitVec 64)) V!54105)

(assert (=> b!1333196 (= lt!592105 (contains!8898 (+!4708 (getCurrentListMapNoExtraKeys!6346 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23781 (select (arr!43655 _keys!1590) from!1980) (get!22018 (select (arr!43654 _values!1320) from!1980) (dynLambda!3647 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) k!1153))))

(declare-fun b!1333197 () Bool)

(declare-fun res!884719 () Bool)

(assert (=> b!1333197 (=> (not res!884719) (not e!759510))))

(assert (=> b!1333197 (= res!884719 (and (= (size!44204 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44205 _keys!1590) (size!44204 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!56800 () Bool)

(declare-fun mapRes!56800 () Bool)

(assert (=> mapIsEmpty!56800 mapRes!56800))

(declare-fun mapNonEmpty!56800 () Bool)

(declare-fun tp!108159 () Bool)

(assert (=> mapNonEmpty!56800 (= mapRes!56800 (and tp!108159 e!759508))))

(declare-fun mapRest!56800 () (Array (_ BitVec 32) ValueCell!17477))

(declare-fun mapKey!56800 () (_ BitVec 32))

(declare-fun mapValue!56800 () ValueCell!17477)

(assert (=> mapNonEmpty!56800 (= (arr!43654 _values!1320) (store mapRest!56800 mapKey!56800 mapValue!56800))))

(declare-fun b!1333198 () Bool)

(declare-fun res!884714 () Bool)

(assert (=> b!1333198 (=> (not res!884714) (not e!759510))))

(assert (=> b!1333198 (= res!884714 (not (= (select (arr!43655 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1333199 () Bool)

(declare-fun res!884715 () Bool)

(assert (=> b!1333199 (=> (not res!884715) (not e!759510))))

(assert (=> b!1333199 (= res!884715 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun b!1333200 () Bool)

(declare-fun e!759509 () Bool)

(assert (=> b!1333200 (= e!759507 (and e!759509 mapRes!56800))))

(declare-fun condMapEmpty!56800 () Bool)

(declare-fun mapDefault!56800 () ValueCell!17477)

