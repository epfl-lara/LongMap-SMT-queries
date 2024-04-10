; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108650 () Bool)

(assert start!108650)

(declare-fun b_free!28163 () Bool)

(declare-fun b_next!28163 () Bool)

(assert (=> start!108650 (= b_free!28163 (not b_next!28163))))

(declare-fun tp!99605 () Bool)

(declare-fun b_and!46229 () Bool)

(assert (=> start!108650 (= tp!99605 b_and!46229)))

(declare-fun mapIsEmpty!52262 () Bool)

(declare-fun mapRes!52262 () Bool)

(assert (=> mapIsEmpty!52262 mapRes!52262))

(declare-fun res!851868 () Bool)

(declare-fun e!732785 () Bool)

(assert (=> start!108650 (=> (not res!851868) (not e!732785))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108650 (= res!851868 (validMask!0 mask!2175))))

(assert (=> start!108650 e!732785))

(declare-fun tp_is_empty!33803 () Bool)

(assert (=> start!108650 tp_is_empty!33803))

(assert (=> start!108650 true))

(declare-datatypes ((V!50173 0))(
  ( (V!50174 (val!16976 Int)) )
))
(declare-datatypes ((ValueCell!16003 0))(
  ( (ValueCellFull!16003 (v!19578 V!50173)) (EmptyCell!16003) )
))
(declare-datatypes ((array!84676 0))(
  ( (array!84677 (arr!40840 (Array (_ BitVec 32) ValueCell!16003)) (size!41390 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84676)

(declare-fun e!732784 () Bool)

(declare-fun array_inv!30983 (array!84676) Bool)

(assert (=> start!108650 (and (array_inv!30983 _values!1445) e!732784)))

(declare-datatypes ((array!84678 0))(
  ( (array!84679 (arr!40841 (Array (_ BitVec 32) (_ BitVec 64))) (size!41391 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84678)

(declare-fun array_inv!30984 (array!84678) Bool)

(assert (=> start!108650 (array_inv!30984 _keys!1741)))

(assert (=> start!108650 tp!99605))

(declare-fun b!1282493 () Bool)

(declare-fun e!732783 () Bool)

(assert (=> b!1282493 (= e!732783 tp_is_empty!33803)))

(declare-fun b!1282494 () Bool)

(declare-fun res!851871 () Bool)

(assert (=> b!1282494 (=> (not res!851871) (not e!732785))))

(declare-datatypes ((List!28934 0))(
  ( (Nil!28931) (Cons!28930 (h!30139 (_ BitVec 64)) (t!42478 List!28934)) )
))
(declare-fun arrayNoDuplicates!0 (array!84678 (_ BitVec 32) List!28934) Bool)

(assert (=> b!1282494 (= res!851871 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28931))))

(declare-fun b!1282495 () Bool)

(declare-fun res!851867 () Bool)

(assert (=> b!1282495 (=> (not res!851867) (not e!732785))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1282495 (= res!851867 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41391 _keys!1741))))))

(declare-fun mapNonEmpty!52262 () Bool)

(declare-fun tp!99604 () Bool)

(declare-fun e!732782 () Bool)

(assert (=> mapNonEmpty!52262 (= mapRes!52262 (and tp!99604 e!732782))))

(declare-fun mapRest!52262 () (Array (_ BitVec 32) ValueCell!16003))

(declare-fun mapKey!52262 () (_ BitVec 32))

(declare-fun mapValue!52262 () ValueCell!16003)

(assert (=> mapNonEmpty!52262 (= (arr!40840 _values!1445) (store mapRest!52262 mapKey!52262 mapValue!52262))))

(declare-fun b!1282496 () Bool)

(assert (=> b!1282496 (= e!732784 (and e!732783 mapRes!52262))))

(declare-fun condMapEmpty!52262 () Bool)

(declare-fun mapDefault!52262 () ValueCell!16003)

