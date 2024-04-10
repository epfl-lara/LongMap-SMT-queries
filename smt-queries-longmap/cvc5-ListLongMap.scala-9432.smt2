; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112200 () Bool)

(assert start!112200)

(declare-fun b_free!30595 () Bool)

(declare-fun b_next!30595 () Bool)

(assert (=> start!112200 (= b_free!30595 (not b_next!30595))))

(declare-fun tp!107422 () Bool)

(declare-fun b_and!49245 () Bool)

(assert (=> start!112200 (= tp!107422 b_and!49245)))

(declare-fun res!881690 () Bool)

(declare-fun e!757664 () Bool)

(assert (=> start!112200 (=> (not res!881690) (not e!757664))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112200 (= res!881690 (validMask!0 mask!1998))))

(assert (=> start!112200 e!757664))

(declare-datatypes ((V!53777 0))(
  ( (V!53778 (val!18327 Int)) )
))
(declare-datatypes ((ValueCell!17354 0))(
  ( (ValueCellFull!17354 (v!20964 V!53777)) (EmptyCell!17354) )
))
(declare-datatypes ((array!89902 0))(
  ( (array!89903 (arr!43417 (Array (_ BitVec 32) ValueCell!17354)) (size!43967 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89902)

(declare-fun e!757665 () Bool)

(declare-fun array_inv!32759 (array!89902) Bool)

(assert (=> start!112200 (and (array_inv!32759 _values!1320) e!757665)))

(assert (=> start!112200 true))

(declare-datatypes ((array!89904 0))(
  ( (array!89905 (arr!43418 (Array (_ BitVec 32) (_ BitVec 64))) (size!43968 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89904)

(declare-fun array_inv!32760 (array!89904) Bool)

(assert (=> start!112200 (array_inv!32760 _keys!1590)))

(assert (=> start!112200 tp!107422))

(declare-fun tp_is_empty!36505 () Bool)

(assert (=> start!112200 tp_is_empty!36505))

(declare-fun mapNonEmpty!56431 () Bool)

(declare-fun mapRes!56431 () Bool)

(declare-fun tp!107421 () Bool)

(declare-fun e!757666 () Bool)

(assert (=> mapNonEmpty!56431 (= mapRes!56431 (and tp!107421 e!757666))))

(declare-fun mapValue!56431 () ValueCell!17354)

(declare-fun mapRest!56431 () (Array (_ BitVec 32) ValueCell!17354))

(declare-fun mapKey!56431 () (_ BitVec 32))

(assert (=> mapNonEmpty!56431 (= (arr!43417 _values!1320) (store mapRest!56431 mapKey!56431 mapValue!56431))))

(declare-fun b!1328867 () Bool)

(declare-fun res!881696 () Bool)

(assert (=> b!1328867 (=> (not res!881696) (not e!757664))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1328867 (= res!881696 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43968 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1328868 () Bool)

(declare-fun res!881694 () Bool)

(assert (=> b!1328868 (=> (not res!881694) (not e!757664))))

(assert (=> b!1328868 (= res!881694 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1328869 () Bool)

(assert (=> b!1328869 (= e!757664 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun lt!590881 () Bool)

(declare-fun minValue!1262 () V!53777)

(declare-fun zeroValue!1262 () V!53777)

(declare-datatypes ((tuple2!23590 0))(
  ( (tuple2!23591 (_1!11806 (_ BitVec 64)) (_2!11806 V!53777)) )
))
(declare-datatypes ((List!30747 0))(
  ( (Nil!30744) (Cons!30743 (h!31952 tuple2!23590) (t!44755 List!30747)) )
))
(declare-datatypes ((ListLongMap!21247 0))(
  ( (ListLongMap!21248 (toList!10639 List!30747)) )
))
(declare-fun contains!8803 (ListLongMap!21247 (_ BitVec 64)) Bool)

(declare-fun +!4641 (ListLongMap!21247 tuple2!23590) ListLongMap!21247)

(declare-fun getCurrentListMapNoExtraKeys!6279 (array!89904 array!89902 (_ BitVec 32) (_ BitVec 32) V!53777 V!53777 (_ BitVec 32) Int) ListLongMap!21247)

(declare-fun get!21869 (ValueCell!17354 V!53777) V!53777)

(declare-fun dynLambda!3580 (Int (_ BitVec 64)) V!53777)

(assert (=> b!1328869 (= lt!590881 (contains!8803 (+!4641 (+!4641 (getCurrentListMapNoExtraKeys!6279 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23591 (select (arr!43418 _keys!1590) from!1980) (get!21869 (select (arr!43417 _values!1320) from!1980) (dynLambda!3580 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23591 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k!1153))))

(declare-fun b!1328870 () Bool)

(declare-fun res!881692 () Bool)

(assert (=> b!1328870 (=> (not res!881692) (not e!757664))))

(assert (=> b!1328870 (= res!881692 (not (= (select (arr!43418 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1328871 () Bool)

(declare-fun res!881689 () Bool)

(assert (=> b!1328871 (=> (not res!881689) (not e!757664))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89904 (_ BitVec 32)) Bool)

(assert (=> b!1328871 (= res!881689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1328872 () Bool)

(declare-fun res!881697 () Bool)

(assert (=> b!1328872 (=> (not res!881697) (not e!757664))))

(declare-fun getCurrentListMap!5630 (array!89904 array!89902 (_ BitVec 32) (_ BitVec 32) V!53777 V!53777 (_ BitVec 32) Int) ListLongMap!21247)

(assert (=> b!1328872 (= res!881697 (contains!8803 (getCurrentListMap!5630 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1328873 () Bool)

(declare-fun res!881693 () Bool)

(assert (=> b!1328873 (=> (not res!881693) (not e!757664))))

(assert (=> b!1328873 (= res!881693 (and (= (size!43967 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43968 _keys!1590) (size!43967 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1328874 () Bool)

(declare-fun e!757663 () Bool)

(assert (=> b!1328874 (= e!757665 (and e!757663 mapRes!56431))))

(declare-fun condMapEmpty!56431 () Bool)

(declare-fun mapDefault!56431 () ValueCell!17354)

