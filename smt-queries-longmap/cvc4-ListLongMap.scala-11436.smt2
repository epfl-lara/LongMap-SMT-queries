; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133418 () Bool)

(assert start!133418)

(declare-fun mapNonEmpty!59127 () Bool)

(declare-fun mapRes!59127 () Bool)

(declare-fun tp!112782 () Bool)

(declare-fun e!869089 () Bool)

(assert (=> mapNonEmpty!59127 (= mapRes!59127 (and tp!112782 e!869089))))

(declare-fun mapKey!59127 () (_ BitVec 32))

(declare-datatypes ((V!59541 0))(
  ( (V!59542 (val!19334 Int)) )
))
(declare-datatypes ((ValueCell!18220 0))(
  ( (ValueCellFull!18220 (v!22086 V!59541)) (EmptyCell!18220) )
))
(declare-fun mapValue!59127 () ValueCell!18220)

(declare-datatypes ((array!103728 0))(
  ( (array!103729 (arr!50056 (Array (_ BitVec 32) ValueCell!18220)) (size!50606 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103728)

(declare-fun mapRest!59127 () (Array (_ BitVec 32) ValueCell!18220))

(assert (=> mapNonEmpty!59127 (= (arr!50056 _values!487) (store mapRest!59127 mapKey!59127 mapValue!59127))))

(declare-fun b!1559709 () Bool)

(declare-fun res!1066565 () Bool)

(declare-fun e!869087 () Bool)

(assert (=> b!1559709 (=> (not res!1066565) (not e!869087))))

(declare-datatypes ((tuple2!25008 0))(
  ( (tuple2!25009 (_1!12515 (_ BitVec 64)) (_2!12515 V!59541)) )
))
(declare-datatypes ((List!36359 0))(
  ( (Nil!36356) (Cons!36355 (h!37801 tuple2!25008) (t!51092 List!36359)) )
))
(declare-datatypes ((ListLongMap!22443 0))(
  ( (ListLongMap!22444 (toList!11237 List!36359)) )
))
(declare-fun contains!10227 (ListLongMap!22443 (_ BitVec 64)) Bool)

(assert (=> b!1559709 (= res!1066565 (not (contains!10227 (ListLongMap!22444 Nil!36356) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1559710 () Bool)

(declare-fun res!1066569 () Bool)

(assert (=> b!1559710 (=> (not res!1066569) (not e!869087))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-datatypes ((array!103730 0))(
  ( (array!103731 (arr!50057 (Array (_ BitVec 32) (_ BitVec 64))) (size!50607 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103730)

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1559710 (= res!1066569 (and (= (size!50606 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50607 _keys!637) (size!50606 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1559711 () Bool)

(declare-fun tp_is_empty!38501 () Bool)

(assert (=> b!1559711 (= e!869089 tp_is_empty!38501)))

(declare-fun res!1066567 () Bool)

(assert (=> start!133418 (=> (not res!1066567) (not e!869087))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133418 (= res!1066567 (validMask!0 mask!947))))

(assert (=> start!133418 e!869087))

(assert (=> start!133418 true))

(declare-fun array_inv!38911 (array!103730) Bool)

(assert (=> start!133418 (array_inv!38911 _keys!637)))

(declare-fun e!869085 () Bool)

(declare-fun array_inv!38912 (array!103728) Bool)

(assert (=> start!133418 (and (array_inv!38912 _values!487) e!869085)))

(declare-fun mapIsEmpty!59127 () Bool)

(assert (=> mapIsEmpty!59127 mapRes!59127))

(declare-fun b!1559712 () Bool)

(declare-fun res!1066564 () Bool)

(assert (=> b!1559712 (=> (not res!1066564) (not e!869087))))

(declare-datatypes ((List!36360 0))(
  ( (Nil!36357) (Cons!36356 (h!37802 (_ BitVec 64)) (t!51093 List!36360)) )
))
(declare-fun arrayNoDuplicates!0 (array!103730 (_ BitVec 32) List!36360) Bool)

(assert (=> b!1559712 (= res!1066564 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36357))))

(declare-fun b!1559713 () Bool)

(assert (=> b!1559713 (= e!869087 false)))

(declare-fun lt!670908 () Bool)

(assert (=> b!1559713 (= lt!670908 (contains!10227 (ListLongMap!22444 Nil!36356) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1559714 () Bool)

(declare-fun res!1066568 () Bool)

(assert (=> b!1559714 (=> (not res!1066568) (not e!869087))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103730 (_ BitVec 32)) Bool)

(assert (=> b!1559714 (= res!1066568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1559715 () Bool)

(declare-fun e!869088 () Bool)

(assert (=> b!1559715 (= e!869088 tp_is_empty!38501)))

(declare-fun b!1559716 () Bool)

(assert (=> b!1559716 (= e!869085 (and e!869088 mapRes!59127))))

(declare-fun condMapEmpty!59127 () Bool)

(declare-fun mapDefault!59127 () ValueCell!18220)

