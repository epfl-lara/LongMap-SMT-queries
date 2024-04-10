; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133492 () Bool)

(assert start!133492)

(declare-fun b!1560594 () Bool)

(declare-fun e!869643 () Bool)

(declare-fun tp_is_empty!38575 () Bool)

(assert (=> b!1560594 (= e!869643 tp_is_empty!38575)))

(declare-fun mapIsEmpty!59238 () Bool)

(declare-fun mapRes!59238 () Bool)

(assert (=> mapIsEmpty!59238 mapRes!59238))

(declare-fun mapNonEmpty!59238 () Bool)

(declare-fun tp!112893 () Bool)

(assert (=> mapNonEmpty!59238 (= mapRes!59238 (and tp!112893 e!869643))))

(declare-datatypes ((V!59641 0))(
  ( (V!59642 (val!19371 Int)) )
))
(declare-datatypes ((ValueCell!18257 0))(
  ( (ValueCellFull!18257 (v!22123 V!59641)) (EmptyCell!18257) )
))
(declare-fun mapValue!59238 () ValueCell!18257)

(declare-fun mapKey!59238 () (_ BitVec 32))

(declare-datatypes ((array!103872 0))(
  ( (array!103873 (arr!50128 (Array (_ BitVec 32) ValueCell!18257)) (size!50678 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103872)

(declare-fun mapRest!59238 () (Array (_ BitVec 32) ValueCell!18257))

(assert (=> mapNonEmpty!59238 (= (arr!50128 _values!487) (store mapRest!59238 mapKey!59238 mapValue!59238))))

(declare-fun b!1560595 () Bool)

(declare-fun res!1067117 () Bool)

(declare-fun e!869642 () Bool)

(assert (=> b!1560595 (=> (not res!1067117) (not e!869642))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-datatypes ((array!103874 0))(
  ( (array!103875 (arr!50129 (Array (_ BitVec 32) (_ BitVec 64))) (size!50679 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103874)

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1560595 (= res!1067117 (and (= (size!50678 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50679 _keys!637) (size!50678 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1560596 () Bool)

(declare-fun e!869640 () Bool)

(declare-fun e!869641 () Bool)

(assert (=> b!1560596 (= e!869640 (and e!869641 mapRes!59238))))

(declare-fun condMapEmpty!59238 () Bool)

(declare-fun mapDefault!59238 () ValueCell!18257)

