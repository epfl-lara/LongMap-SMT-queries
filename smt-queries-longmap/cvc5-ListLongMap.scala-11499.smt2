; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133802 () Bool)

(assert start!133802)

(declare-fun mapIsEmpty!59691 () Bool)

(declare-fun mapRes!59691 () Bool)

(assert (=> mapIsEmpty!59691 mapRes!59691))

(declare-fun b!1564567 () Bool)

(declare-fun e!872023 () Bool)

(declare-fun tp_is_empty!38875 () Bool)

(assert (=> b!1564567 (= e!872023 tp_is_empty!38875)))

(declare-fun b!1564568 () Bool)

(declare-fun e!872019 () Bool)

(assert (=> b!1564568 (= e!872019 tp_is_empty!38875)))

(declare-fun b!1564569 () Bool)

(declare-fun e!872020 () Bool)

(declare-datatypes ((V!60041 0))(
  ( (V!60042 (val!19521 Int)) )
))
(declare-datatypes ((tuple2!25190 0))(
  ( (tuple2!25191 (_1!12606 (_ BitVec 64)) (_2!12606 V!60041)) )
))
(declare-datatypes ((List!36576 0))(
  ( (Nil!36573) (Cons!36572 (h!38018 tuple2!25190) (t!51423 List!36576)) )
))
(declare-datatypes ((ListLongMap!22625 0))(
  ( (ListLongMap!22626 (toList!11328 List!36576)) )
))
(declare-fun isEmpty!1141 (ListLongMap!22625) Bool)

(assert (=> b!1564569 (= e!872020 (not (isEmpty!1141 (ListLongMap!22626 Nil!36573))))))

(declare-fun mapNonEmpty!59691 () Bool)

(declare-fun tp!113616 () Bool)

(assert (=> mapNonEmpty!59691 (= mapRes!59691 (and tp!113616 e!872023))))

(declare-fun mapKey!59691 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18407 0))(
  ( (ValueCellFull!18407 (v!22273 V!60041)) (EmptyCell!18407) )
))
(declare-fun mapValue!59691 () ValueCell!18407)

(declare-datatypes ((array!104440 0))(
  ( (array!104441 (arr!50411 (Array (_ BitVec 32) ValueCell!18407)) (size!50961 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104440)

(declare-fun mapRest!59691 () (Array (_ BitVec 32) ValueCell!18407))

(assert (=> mapNonEmpty!59691 (= (arr!50411 _values!487) (store mapRest!59691 mapKey!59691 mapValue!59691))))

(declare-fun b!1564570 () Bool)

(declare-fun e!872021 () Bool)

(assert (=> b!1564570 (= e!872021 (and e!872019 mapRes!59691))))

(declare-fun condMapEmpty!59691 () Bool)

(declare-fun mapDefault!59691 () ValueCell!18407)

