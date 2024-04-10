; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111164 () Bool)

(assert start!111164)

(declare-fun b_free!29999 () Bool)

(declare-fun b_next!29999 () Bool)

(assert (=> start!111164 (= b_free!29999 (not b_next!29999))))

(declare-fun tp!105318 () Bool)

(declare-fun b_and!48207 () Bool)

(assert (=> start!111164 (= tp!105318 b_and!48207)))

(declare-fun b!1316230 () Bool)

(declare-fun res!873780 () Bool)

(declare-fun e!750853 () Bool)

(assert (=> b!1316230 (=> (not res!873780) (not e!750853))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1316230 (= res!873780 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1316231 () Bool)

(declare-fun e!750855 () Bool)

(declare-fun tp_is_empty!35729 () Bool)

(assert (=> b!1316231 (= e!750855 tp_is_empty!35729)))

(declare-fun b!1316232 () Bool)

(declare-fun e!750857 () Bool)

(assert (=> b!1316232 (= e!750857 tp_is_empty!35729)))

(declare-fun b!1316233 () Bool)

(declare-fun res!873779 () Bool)

(assert (=> b!1316233 (=> (not res!873779) (not e!750853))))

(declare-datatypes ((array!88416 0))(
  ( (array!88417 (arr!42688 (Array (_ BitVec 32) (_ BitVec 64))) (size!43238 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88416)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1316233 (= res!873779 (not (= (select (arr!42688 _keys!1628) from!2020) k!1175)))))

(declare-fun b!1316234 () Bool)

(declare-fun res!873786 () Bool)

(assert (=> b!1316234 (=> (not res!873786) (not e!750853))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52741 0))(
  ( (V!52742 (val!17939 Int)) )
))
(declare-fun minValue!1296 () V!52741)

(declare-datatypes ((ValueCell!16966 0))(
  ( (ValueCellFull!16966 (v!20566 V!52741)) (EmptyCell!16966) )
))
(declare-datatypes ((array!88418 0))(
  ( (array!88419 (arr!42689 (Array (_ BitVec 32) ValueCell!16966)) (size!43239 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88418)

(declare-fun zeroValue!1296 () V!52741)

(declare-datatypes ((tuple2!23146 0))(
  ( (tuple2!23147 (_1!11584 (_ BitVec 64)) (_2!11584 V!52741)) )
))
(declare-datatypes ((List!30284 0))(
  ( (Nil!30281) (Cons!30280 (h!31489 tuple2!23146) (t!43890 List!30284)) )
))
(declare-datatypes ((ListLongMap!20803 0))(
  ( (ListLongMap!20804 (toList!10417 List!30284)) )
))
(declare-fun contains!8567 (ListLongMap!20803 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5430 (array!88416 array!88418 (_ BitVec 32) (_ BitVec 32) V!52741 V!52741 (_ BitVec 32) Int) ListLongMap!20803)

(assert (=> b!1316234 (= res!873786 (contains!8567 (getCurrentListMap!5430 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun mapNonEmpty!55222 () Bool)

(declare-fun mapRes!55222 () Bool)

(declare-fun tp!105319 () Bool)

(assert (=> mapNonEmpty!55222 (= mapRes!55222 (and tp!105319 e!750857))))

(declare-fun mapRest!55222 () (Array (_ BitVec 32) ValueCell!16966))

(declare-fun mapKey!55222 () (_ BitVec 32))

(declare-fun mapValue!55222 () ValueCell!16966)

(assert (=> mapNonEmpty!55222 (= (arr!42689 _values!1354) (store mapRest!55222 mapKey!55222 mapValue!55222))))

(declare-fun res!873782 () Bool)

(assert (=> start!111164 (=> (not res!873782) (not e!750853))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111164 (= res!873782 (validMask!0 mask!2040))))

(assert (=> start!111164 e!750853))

(assert (=> start!111164 tp!105318))

(declare-fun array_inv!32239 (array!88416) Bool)

(assert (=> start!111164 (array_inv!32239 _keys!1628)))

(assert (=> start!111164 true))

(assert (=> start!111164 tp_is_empty!35729))

(declare-fun e!750856 () Bool)

(declare-fun array_inv!32240 (array!88418) Bool)

(assert (=> start!111164 (and (array_inv!32240 _values!1354) e!750856)))

(declare-fun b!1316235 () Bool)

(declare-fun res!873785 () Bool)

(assert (=> b!1316235 (=> (not res!873785) (not e!750853))))

(declare-datatypes ((List!30285 0))(
  ( (Nil!30282) (Cons!30281 (h!31490 (_ BitVec 64)) (t!43891 List!30285)) )
))
(declare-fun arrayNoDuplicates!0 (array!88416 (_ BitVec 32) List!30285) Bool)

(assert (=> b!1316235 (= res!873785 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30282))))

(declare-fun b!1316236 () Bool)

(assert (=> b!1316236 (= e!750856 (and e!750855 mapRes!55222))))

(declare-fun condMapEmpty!55222 () Bool)

(declare-fun mapDefault!55222 () ValueCell!16966)

