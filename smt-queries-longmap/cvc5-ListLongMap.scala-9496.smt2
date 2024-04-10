; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112584 () Bool)

(assert start!112584)

(declare-fun b_free!30979 () Bool)

(declare-fun b_next!30979 () Bool)

(assert (=> start!112584 (= b_free!30979 (not b_next!30979))))

(declare-fun tp!108573 () Bool)

(declare-fun b_and!49887 () Bool)

(assert (=> start!112584 (= tp!108573 b_and!49887)))

(declare-fun b!1335533 () Bool)

(declare-fun e!760627 () Bool)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((V!54289 0))(
  ( (V!54290 (val!18519 Int)) )
))
(declare-datatypes ((ValueCell!17546 0))(
  ( (ValueCellFull!17546 (v!21156 V!54289)) (EmptyCell!17546) )
))
(declare-datatypes ((array!90636 0))(
  ( (array!90637 (arr!43784 (Array (_ BitVec 32) ValueCell!17546)) (size!44334 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90636)

(assert (=> b!1335533 (= e!760627 (bvsge from!1980 (size!44334 _values!1320)))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-datatypes ((tuple2!23880 0))(
  ( (tuple2!23881 (_1!11951 (_ BitVec 64)) (_2!11951 V!54289)) )
))
(declare-datatypes ((List!31021 0))(
  ( (Nil!31018) (Cons!31017 (h!32226 tuple2!23880) (t!45285 List!31021)) )
))
(declare-datatypes ((ListLongMap!21537 0))(
  ( (ListLongMap!21538 (toList!10784 List!31021)) )
))
(declare-fun lt!592465 () ListLongMap!21537)

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90638 0))(
  ( (array!90639 (arr!43785 (Array (_ BitVec 32) (_ BitVec 64))) (size!44335 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90638)

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54289)

(declare-fun zeroValue!1262 () V!54289)

(declare-fun getCurrentListMapNoExtraKeys!6370 (array!90638 array!90636 (_ BitVec 32) (_ BitVec 32) V!54289 V!54289 (_ BitVec 32) Int) ListLongMap!21537)

(assert (=> b!1335533 (= lt!592465 (getCurrentListMapNoExtraKeys!6370 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1335534 () Bool)

(declare-fun res!886376 () Bool)

(assert (=> b!1335534 (=> (not res!886376) (not e!760627))))

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1335534 (= res!886376 (not (= (select (arr!43785 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1335535 () Bool)

(declare-fun res!886370 () Bool)

(assert (=> b!1335535 (=> (not res!886370) (not e!760627))))

(declare-datatypes ((List!31022 0))(
  ( (Nil!31019) (Cons!31018 (h!32227 (_ BitVec 64)) (t!45286 List!31022)) )
))
(declare-fun arrayNoDuplicates!0 (array!90638 (_ BitVec 32) List!31022) Bool)

(assert (=> b!1335535 (= res!886370 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31019))))

(declare-fun mapIsEmpty!57007 () Bool)

(declare-fun mapRes!57007 () Bool)

(assert (=> mapIsEmpty!57007 mapRes!57007))

(declare-fun b!1335536 () Bool)

(declare-fun res!886374 () Bool)

(assert (=> b!1335536 (=> (not res!886374) (not e!760627))))

(assert (=> b!1335536 (= res!886374 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!886371 () Bool)

(assert (=> start!112584 (=> (not res!886371) (not e!760627))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112584 (= res!886371 (validMask!0 mask!1998))))

(assert (=> start!112584 e!760627))

(declare-fun e!760623 () Bool)

(declare-fun array_inv!33019 (array!90636) Bool)

(assert (=> start!112584 (and (array_inv!33019 _values!1320) e!760623)))

(assert (=> start!112584 true))

(declare-fun array_inv!33020 (array!90638) Bool)

(assert (=> start!112584 (array_inv!33020 _keys!1590)))

(assert (=> start!112584 tp!108573))

(declare-fun tp_is_empty!36889 () Bool)

(assert (=> start!112584 tp_is_empty!36889))

(declare-fun mapNonEmpty!57007 () Bool)

(declare-fun tp!108574 () Bool)

(declare-fun e!760625 () Bool)

(assert (=> mapNonEmpty!57007 (= mapRes!57007 (and tp!108574 e!760625))))

(declare-fun mapKey!57007 () (_ BitVec 32))

(declare-fun mapRest!57007 () (Array (_ BitVec 32) ValueCell!17546))

(declare-fun mapValue!57007 () ValueCell!17546)

(assert (=> mapNonEmpty!57007 (= (arr!43784 _values!1320) (store mapRest!57007 mapKey!57007 mapValue!57007))))

(declare-fun b!1335537 () Bool)

(declare-fun res!886377 () Bool)

(assert (=> b!1335537 (=> (not res!886377) (not e!760627))))

(assert (=> b!1335537 (= res!886377 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44335 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1335538 () Bool)

(declare-fun res!886373 () Bool)

(assert (=> b!1335538 (=> (not res!886373) (not e!760627))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90638 (_ BitVec 32)) Bool)

(assert (=> b!1335538 (= res!886373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1335539 () Bool)

(declare-fun res!886375 () Bool)

(assert (=> b!1335539 (=> (not res!886375) (not e!760627))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1335539 (= res!886375 (validKeyInArray!0 (select (arr!43785 _keys!1590) from!1980)))))

(declare-fun b!1335540 () Bool)

(declare-fun e!760626 () Bool)

(assert (=> b!1335540 (= e!760623 (and e!760626 mapRes!57007))))

(declare-fun condMapEmpty!57007 () Bool)

(declare-fun mapDefault!57007 () ValueCell!17546)

