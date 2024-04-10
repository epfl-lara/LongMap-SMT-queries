; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133460 () Bool)

(assert start!133460)

(declare-fun b!1560276 () Bool)

(declare-fun e!869404 () Bool)

(declare-fun tp_is_empty!38543 () Bool)

(assert (=> b!1560276 (= e!869404 tp_is_empty!38543)))

(declare-fun b!1560278 () Bool)

(declare-fun res!1066947 () Bool)

(declare-fun e!869400 () Bool)

(assert (=> b!1560278 (=> (not res!1066947) (not e!869400))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!103810 0))(
  ( (array!103811 (arr!50097 (Array (_ BitVec 32) (_ BitVec 64))) (size!50647 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103810)

(assert (=> b!1560278 (= res!1066947 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50647 _keys!637)) (bvsge from!782 (size!50647 _keys!637))))))

(declare-fun b!1560279 () Bool)

(declare-fun res!1066943 () Bool)

(assert (=> b!1560279 (=> (not res!1066943) (not e!869400))))

(declare-datatypes ((List!36390 0))(
  ( (Nil!36387) (Cons!36386 (h!37832 (_ BitVec 64)) (t!51123 List!36390)) )
))
(declare-fun arrayNoDuplicates!0 (array!103810 (_ BitVec 32) List!36390) Bool)

(assert (=> b!1560279 (= res!1066943 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36387))))

(declare-fun mapNonEmpty!59190 () Bool)

(declare-fun mapRes!59190 () Bool)

(declare-fun tp!112845 () Bool)

(assert (=> mapNonEmpty!59190 (= mapRes!59190 (and tp!112845 e!869404))))

(declare-datatypes ((V!59597 0))(
  ( (V!59598 (val!19355 Int)) )
))
(declare-datatypes ((ValueCell!18241 0))(
  ( (ValueCellFull!18241 (v!22107 V!59597)) (EmptyCell!18241) )
))
(declare-fun mapValue!59190 () ValueCell!18241)

(declare-fun mapKey!59190 () (_ BitVec 32))

(declare-datatypes ((array!103812 0))(
  ( (array!103813 (arr!50098 (Array (_ BitVec 32) ValueCell!18241)) (size!50648 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103812)

(declare-fun mapRest!59190 () (Array (_ BitVec 32) ValueCell!18241))

(assert (=> mapNonEmpty!59190 (= (arr!50098 _values!487) (store mapRest!59190 mapKey!59190 mapValue!59190))))

(declare-fun b!1560280 () Bool)

(declare-fun e!869402 () Bool)

(declare-fun e!869401 () Bool)

(assert (=> b!1560280 (= e!869402 (and e!869401 mapRes!59190))))

(declare-fun condMapEmpty!59190 () Bool)

(declare-fun mapDefault!59190 () ValueCell!18241)

