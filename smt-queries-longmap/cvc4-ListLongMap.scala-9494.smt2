; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112576 () Bool)

(assert start!112576)

(declare-fun b_free!30971 () Bool)

(declare-fun b_next!30971 () Bool)

(assert (=> start!112576 (= b_free!30971 (not b_next!30971))))

(declare-fun tp!108549 () Bool)

(declare-fun b_and!49879 () Bool)

(assert (=> start!112576 (= tp!108549 b_and!49879)))

(declare-fun b!1335393 () Bool)

(declare-fun res!886268 () Bool)

(declare-fun e!760564 () Bool)

(assert (=> b!1335393 (=> (not res!886268) (not e!760564))))

(declare-datatypes ((V!54277 0))(
  ( (V!54278 (val!18515 Int)) )
))
(declare-datatypes ((ValueCell!17542 0))(
  ( (ValueCellFull!17542 (v!21152 V!54277)) (EmptyCell!17542) )
))
(declare-datatypes ((array!90622 0))(
  ( (array!90623 (arr!43777 (Array (_ BitVec 32) ValueCell!17542)) (size!44327 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90622)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90624 0))(
  ( (array!90625 (arr!43778 (Array (_ BitVec 32) (_ BitVec 64))) (size!44328 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90624)

(assert (=> b!1335393 (= res!886268 (and (= (size!44327 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44328 _keys!1590) (size!44327 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1335394 () Bool)

(declare-fun e!760567 () Bool)

(declare-fun tp_is_empty!36881 () Bool)

(assert (=> b!1335394 (= e!760567 tp_is_empty!36881)))

(declare-fun b!1335395 () Bool)

(declare-fun res!886269 () Bool)

(assert (=> b!1335395 (=> (not res!886269) (not e!760564))))

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun from!1980 () (_ BitVec 32))

(assert (=> b!1335395 (= res!886269 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44328 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!886266 () Bool)

(assert (=> start!112576 (=> (not res!886266) (not e!760564))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112576 (= res!886266 (validMask!0 mask!1998))))

(assert (=> start!112576 e!760564))

(declare-fun e!760566 () Bool)

(declare-fun array_inv!33015 (array!90622) Bool)

(assert (=> start!112576 (and (array_inv!33015 _values!1320) e!760566)))

(assert (=> start!112576 true))

(declare-fun array_inv!33016 (array!90624) Bool)

(assert (=> start!112576 (array_inv!33016 _keys!1590)))

(assert (=> start!112576 tp!108549))

(assert (=> start!112576 tp_is_empty!36881))

(declare-fun b!1335396 () Bool)

(declare-fun e!760563 () Bool)

(assert (=> b!1335396 (= e!760563 tp_is_empty!36881)))

(declare-fun b!1335397 () Bool)

(declare-fun res!886267 () Bool)

(assert (=> b!1335397 (=> (not res!886267) (not e!760564))))

(declare-datatypes ((List!31017 0))(
  ( (Nil!31014) (Cons!31013 (h!32222 (_ BitVec 64)) (t!45281 List!31017)) )
))
(declare-fun arrayNoDuplicates!0 (array!90624 (_ BitVec 32) List!31017) Bool)

(assert (=> b!1335397 (= res!886267 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31014))))

(declare-fun b!1335398 () Bool)

(declare-fun mapRes!56995 () Bool)

(assert (=> b!1335398 (= e!760566 (and e!760563 mapRes!56995))))

(declare-fun condMapEmpty!56995 () Bool)

(declare-fun mapDefault!56995 () ValueCell!17542)

