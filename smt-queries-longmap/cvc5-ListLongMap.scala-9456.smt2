; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112344 () Bool)

(assert start!112344)

(declare-fun b_free!30739 () Bool)

(declare-fun b_next!30739 () Bool)

(assert (=> start!112344 (= b_free!30739 (not b_next!30739))))

(declare-fun tp!107854 () Bool)

(declare-fun b_and!49533 () Bool)

(assert (=> start!112344 (= tp!107854 b_and!49533)))

(declare-fun b!1331603 () Bool)

(declare-fun e!758742 () Bool)

(assert (=> b!1331603 (= e!758742 (not true))))

(declare-datatypes ((V!53969 0))(
  ( (V!53970 (val!18399 Int)) )
))
(declare-datatypes ((tuple2!23702 0))(
  ( (tuple2!23703 (_1!11862 (_ BitVec 64)) (_2!11862 V!53969)) )
))
(declare-datatypes ((List!30851 0))(
  ( (Nil!30848) (Cons!30847 (h!32056 tuple2!23702) (t!45003 List!30851)) )
))
(declare-datatypes ((ListLongMap!21359 0))(
  ( (ListLongMap!21360 (toList!10695 List!30851)) )
))
(declare-fun lt!591612 () ListLongMap!21359)

(declare-fun minValue!1262 () V!53969)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun contains!8859 (ListLongMap!21359 (_ BitVec 64)) Bool)

(declare-fun +!4689 (ListLongMap!21359 tuple2!23702) ListLongMap!21359)

(assert (=> b!1331603 (contains!8859 (+!4689 lt!591612 (tuple2!23703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k!1153)))

(declare-datatypes ((Unit!43827 0))(
  ( (Unit!43828) )
))
(declare-fun lt!591616 () Unit!43827)

(declare-fun addStillContains!1168 (ListLongMap!21359 (_ BitVec 64) V!53969 (_ BitVec 64)) Unit!43827)

(assert (=> b!1331603 (= lt!591616 (addStillContains!1168 lt!591612 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k!1153))))

(assert (=> b!1331603 (contains!8859 lt!591612 k!1153)))

(declare-fun lt!591614 () V!53969)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((array!90178 0))(
  ( (array!90179 (arr!43555 (Array (_ BitVec 32) (_ BitVec 64))) (size!44105 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90178)

(declare-fun lt!591611 () Unit!43827)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!276 ((_ BitVec 64) (_ BitVec 64) V!53969 ListLongMap!21359) Unit!43827)

(assert (=> b!1331603 (= lt!591611 (lemmaInListMapAfterAddingDiffThenInBefore!276 k!1153 (select (arr!43555 _keys!1590) from!1980) lt!591614 lt!591612))))

(declare-fun lt!591613 () ListLongMap!21359)

(assert (=> b!1331603 (contains!8859 lt!591613 k!1153)))

(declare-fun lt!591615 () Unit!43827)

(assert (=> b!1331603 (= lt!591615 (lemmaInListMapAfterAddingDiffThenInBefore!276 k!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591613))))

(assert (=> b!1331603 (= lt!591613 (+!4689 lt!591612 (tuple2!23703 (select (arr!43555 _keys!1590) from!1980) lt!591614)))))

(declare-datatypes ((ValueCell!17426 0))(
  ( (ValueCellFull!17426 (v!21036 V!53969)) (EmptyCell!17426) )
))
(declare-datatypes ((array!90180 0))(
  ( (array!90181 (arr!43556 (Array (_ BitVec 32) ValueCell!17426)) (size!44106 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90180)

(declare-fun defaultEntry!1323 () Int)

(declare-fun get!21965 (ValueCell!17426 V!53969) V!53969)

(declare-fun dynLambda!3628 (Int (_ BitVec 64)) V!53969)

(assert (=> b!1331603 (= lt!591614 (get!21965 (select (arr!43556 _values!1320) from!1980) (dynLambda!3628 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun zeroValue!1262 () V!53969)

(declare-fun getCurrentListMapNoExtraKeys!6327 (array!90178 array!90180 (_ BitVec 32) (_ BitVec 32) V!53969 V!53969 (_ BitVec 32) Int) ListLongMap!21359)

(assert (=> b!1331603 (= lt!591612 (getCurrentListMapNoExtraKeys!6327 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1331604 () Bool)

(declare-fun res!883633 () Bool)

(assert (=> b!1331604 (=> (not res!883633) (not e!758742))))

(assert (=> b!1331604 (= res!883633 (and (= (size!44106 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44105 _keys!1590) (size!44106 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1331605 () Bool)

(declare-fun res!883640 () Bool)

(assert (=> b!1331605 (=> (not res!883640) (not e!758742))))

(assert (=> b!1331605 (= res!883640 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!56647 () Bool)

(declare-fun mapRes!56647 () Bool)

(declare-fun tp!107853 () Bool)

(declare-fun e!758743 () Bool)

(assert (=> mapNonEmpty!56647 (= mapRes!56647 (and tp!107853 e!758743))))

(declare-fun mapValue!56647 () ValueCell!17426)

(declare-fun mapKey!56647 () (_ BitVec 32))

(declare-fun mapRest!56647 () (Array (_ BitVec 32) ValueCell!17426))

(assert (=> mapNonEmpty!56647 (= (arr!43556 _values!1320) (store mapRest!56647 mapKey!56647 mapValue!56647))))

(declare-fun res!883641 () Bool)

(assert (=> start!112344 (=> (not res!883641) (not e!758742))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112344 (= res!883641 (validMask!0 mask!1998))))

(assert (=> start!112344 e!758742))

(declare-fun e!758745 () Bool)

(declare-fun array_inv!32851 (array!90180) Bool)

(assert (=> start!112344 (and (array_inv!32851 _values!1320) e!758745)))

(assert (=> start!112344 true))

(declare-fun array_inv!32852 (array!90178) Bool)

(assert (=> start!112344 (array_inv!32852 _keys!1590)))

(assert (=> start!112344 tp!107854))

(declare-fun tp_is_empty!36649 () Bool)

(assert (=> start!112344 tp_is_empty!36649))

(declare-fun b!1331606 () Bool)

(declare-fun res!883637 () Bool)

(assert (=> b!1331606 (=> (not res!883637) (not e!758742))))

(assert (=> b!1331606 (= res!883637 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44105 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1331607 () Bool)

(declare-fun res!883639 () Bool)

(assert (=> b!1331607 (=> (not res!883639) (not e!758742))))

(declare-datatypes ((List!30852 0))(
  ( (Nil!30849) (Cons!30848 (h!32057 (_ BitVec 64)) (t!45004 List!30852)) )
))
(declare-fun arrayNoDuplicates!0 (array!90178 (_ BitVec 32) List!30852) Bool)

(assert (=> b!1331607 (= res!883639 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30849))))

(declare-fun b!1331608 () Bool)

(declare-fun res!883636 () Bool)

(assert (=> b!1331608 (=> (not res!883636) (not e!758742))))

(assert (=> b!1331608 (= res!883636 (not (= (select (arr!43555 _keys!1590) from!1980) k!1153)))))

(declare-fun mapIsEmpty!56647 () Bool)

(assert (=> mapIsEmpty!56647 mapRes!56647))

(declare-fun b!1331609 () Bool)

(declare-fun e!758746 () Bool)

(assert (=> b!1331609 (= e!758745 (and e!758746 mapRes!56647))))

(declare-fun condMapEmpty!56647 () Bool)

(declare-fun mapDefault!56647 () ValueCell!17426)

