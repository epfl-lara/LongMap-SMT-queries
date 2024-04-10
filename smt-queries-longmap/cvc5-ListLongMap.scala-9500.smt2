; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112666 () Bool)

(assert start!112666)

(declare-fun b_free!31003 () Bool)

(declare-fun b_next!31003 () Bool)

(assert (=> start!112666 (= b_free!31003 (not b_next!31003))))

(declare-fun tp!108650 () Bool)

(declare-fun b_and!49943 () Bool)

(assert (=> start!112666 (= tp!108650 b_and!49943)))

(declare-fun b!1336367 () Bool)

(declare-fun res!886857 () Bool)

(declare-fun e!761049 () Bool)

(assert (=> b!1336367 (=> (not res!886857) (not e!761049))))

(declare-datatypes ((array!90686 0))(
  ( (array!90687 (arr!43808 (Array (_ BitVec 32) (_ BitVec 64))) (size!44358 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90686)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90686 (_ BitVec 32)) Bool)

(assert (=> b!1336367 (= res!886857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun res!886860 () Bool)

(assert (=> start!112666 (=> (not res!886860) (not e!761049))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112666 (= res!886860 (validMask!0 mask!1998))))

(assert (=> start!112666 e!761049))

(declare-datatypes ((V!54321 0))(
  ( (V!54322 (val!18531 Int)) )
))
(declare-datatypes ((ValueCell!17558 0))(
  ( (ValueCellFull!17558 (v!21171 V!54321)) (EmptyCell!17558) )
))
(declare-datatypes ((array!90688 0))(
  ( (array!90689 (arr!43809 (Array (_ BitVec 32) ValueCell!17558)) (size!44359 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90688)

(declare-fun e!761046 () Bool)

(declare-fun array_inv!33037 (array!90688) Bool)

(assert (=> start!112666 (and (array_inv!33037 _values!1320) e!761046)))

(assert (=> start!112666 true))

(declare-fun array_inv!33038 (array!90686) Bool)

(assert (=> start!112666 (array_inv!33038 _keys!1590)))

(assert (=> start!112666 tp!108650))

(declare-fun tp_is_empty!36913 () Bool)

(assert (=> start!112666 tp_is_empty!36913))

(declare-fun b!1336368 () Bool)

(declare-fun res!886861 () Bool)

(assert (=> b!1336368 (=> (not res!886861) (not e!761049))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1336368 (= res!886861 (not (= (select (arr!43808 _keys!1590) from!1980) k!1153)))))

(declare-fun mapIsEmpty!57047 () Bool)

(declare-fun mapRes!57047 () Bool)

(assert (=> mapIsEmpty!57047 mapRes!57047))

(declare-fun b!1336369 () Bool)

(declare-fun res!886856 () Bool)

(assert (=> b!1336369 (=> (not res!886856) (not e!761049))))

(declare-datatypes ((List!31043 0))(
  ( (Nil!31040) (Cons!31039 (h!32248 (_ BitVec 64)) (t!45327 List!31043)) )
))
(declare-fun arrayNoDuplicates!0 (array!90686 (_ BitVec 32) List!31043) Bool)

(assert (=> b!1336369 (= res!886856 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31040))))

(declare-fun b!1336370 () Bool)

(declare-fun e!761047 () Bool)

(assert (=> b!1336370 (= e!761047 tp_is_empty!36913)))

(declare-fun b!1336371 () Bool)

(declare-fun res!886862 () Bool)

(assert (=> b!1336371 (=> (not res!886862) (not e!761049))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1336371 (= res!886862 (validKeyInArray!0 (select (arr!43808 _keys!1590) from!1980)))))

(declare-fun b!1336372 () Bool)

(declare-fun res!886858 () Bool)

(assert (=> b!1336372 (=> (not res!886858) (not e!761049))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1336372 (= res!886858 (and (= (size!44359 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44358 _keys!1590) (size!44359 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1336373 () Bool)

(declare-fun res!886854 () Bool)

(assert (=> b!1336373 (=> (not res!886854) (not e!761049))))

(assert (=> b!1336373 (= res!886854 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44358 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1336374 () Bool)

(declare-fun res!886859 () Bool)

(assert (=> b!1336374 (=> (not res!886859) (not e!761049))))

(assert (=> b!1336374 (= res!886859 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1336375 () Bool)

(assert (=> b!1336375 (= e!761046 (and e!761047 mapRes!57047))))

(declare-fun condMapEmpty!57047 () Bool)

(declare-fun mapDefault!57047 () ValueCell!17558)

