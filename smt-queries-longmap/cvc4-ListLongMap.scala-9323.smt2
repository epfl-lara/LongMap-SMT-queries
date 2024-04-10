; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111378 () Bool)

(assert start!111378)

(declare-fun b_free!30035 () Bool)

(declare-fun b_next!30035 () Bool)

(assert (=> start!111378 (= b_free!30035 (not b_next!30035))))

(declare-fun tp!105580 () Bool)

(declare-fun b_and!48255 () Bool)

(assert (=> start!111378 (= tp!105580 b_and!48255)))

(declare-fun res!874684 () Bool)

(declare-fun e!752104 () Bool)

(assert (=> start!111378 (=> (not res!874684) (not e!752104))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111378 (= res!874684 (validMask!0 mask!2019))))

(assert (=> start!111378 e!752104))

(declare-datatypes ((array!88662 0))(
  ( (array!88663 (arr!42805 (Array (_ BitVec 32) (_ BitVec 64))) (size!43355 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88662)

(declare-fun array_inv!32329 (array!88662) Bool)

(assert (=> start!111378 (array_inv!32329 _keys!1609)))

(assert (=> start!111378 true))

(declare-fun tp_is_empty!35855 () Bool)

(assert (=> start!111378 tp_is_empty!35855))

(declare-datatypes ((V!52909 0))(
  ( (V!52910 (val!18002 Int)) )
))
(declare-datatypes ((ValueCell!17029 0))(
  ( (ValueCellFull!17029 (v!20632 V!52909)) (EmptyCell!17029) )
))
(declare-datatypes ((array!88664 0))(
  ( (array!88665 (arr!42806 (Array (_ BitVec 32) ValueCell!17029)) (size!43356 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88664)

(declare-fun e!752101 () Bool)

(declare-fun array_inv!32330 (array!88664) Bool)

(assert (=> start!111378 (and (array_inv!32330 _values!1337) e!752101)))

(assert (=> start!111378 tp!105580))

(declare-fun b!1317940 () Bool)

(declare-fun e!752103 () Bool)

(assert (=> b!1317940 (= e!752103 tp_is_empty!35855)))

(declare-fun b!1317941 () Bool)

(declare-fun e!752102 () Bool)

(assert (=> b!1317941 (= e!752102 tp_is_empty!35855)))

(declare-fun b!1317942 () Bool)

(declare-fun res!874681 () Bool)

(assert (=> b!1317942 (=> (not res!874681) (not e!752104))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88662 (_ BitVec 32)) Bool)

(assert (=> b!1317942 (= res!874681 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1317943 () Bool)

(declare-fun res!874682 () Bool)

(assert (=> b!1317943 (=> (not res!874682) (not e!752104))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1317943 (= res!874682 (and (= (size!43356 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43355 _keys!1609) (size!43356 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1317944 () Bool)

(assert (=> b!1317944 (= e!752104 false)))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!52909)

(declare-fun minValue!1279 () V!52909)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun lt!586428 () Bool)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23170 0))(
  ( (tuple2!23171 (_1!11596 (_ BitVec 64)) (_2!11596 V!52909)) )
))
(declare-datatypes ((List!30328 0))(
  ( (Nil!30325) (Cons!30324 (h!31533 tuple2!23170) (t!43936 List!30328)) )
))
(declare-datatypes ((ListLongMap!20827 0))(
  ( (ListLongMap!20828 (toList!10429 List!30328)) )
))
(declare-fun contains!8584 (ListLongMap!20827 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5442 (array!88662 array!88664 (_ BitVec 32) (_ BitVec 32) V!52909 V!52909 (_ BitVec 32) Int) ListLongMap!20827)

(assert (=> b!1317944 (= lt!586428 (contains!8584 (getCurrentListMap!5442 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1317945 () Bool)

(declare-fun res!874685 () Bool)

(assert (=> b!1317945 (=> (not res!874685) (not e!752104))))

(assert (=> b!1317945 (= res!874685 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43355 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!55430 () Bool)

(declare-fun mapRes!55430 () Bool)

(assert (=> mapIsEmpty!55430 mapRes!55430))

(declare-fun mapNonEmpty!55430 () Bool)

(declare-fun tp!105581 () Bool)

(assert (=> mapNonEmpty!55430 (= mapRes!55430 (and tp!105581 e!752102))))

(declare-fun mapRest!55430 () (Array (_ BitVec 32) ValueCell!17029))

(declare-fun mapKey!55430 () (_ BitVec 32))

(declare-fun mapValue!55430 () ValueCell!17029)

(assert (=> mapNonEmpty!55430 (= (arr!42806 _values!1337) (store mapRest!55430 mapKey!55430 mapValue!55430))))

(declare-fun b!1317946 () Bool)

(declare-fun res!874683 () Bool)

(assert (=> b!1317946 (=> (not res!874683) (not e!752104))))

(declare-datatypes ((List!30329 0))(
  ( (Nil!30326) (Cons!30325 (h!31534 (_ BitVec 64)) (t!43937 List!30329)) )
))
(declare-fun arrayNoDuplicates!0 (array!88662 (_ BitVec 32) List!30329) Bool)

(assert (=> b!1317946 (= res!874683 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30326))))

(declare-fun b!1317947 () Bool)

(assert (=> b!1317947 (= e!752101 (and e!752103 mapRes!55430))))

(declare-fun condMapEmpty!55430 () Bool)

(declare-fun mapDefault!55430 () ValueCell!17029)

