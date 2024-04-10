; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133600 () Bool)

(assert start!133600)

(declare-fun b_free!32017 () Bool)

(declare-fun b_next!32017 () Bool)

(assert (=> start!133600 (= b_free!32017 (not b_next!32017))))

(declare-fun tp!113175 () Bool)

(declare-fun b_and!51545 () Bool)

(assert (=> start!133600 (= tp!113175 b_and!51545)))

(declare-fun b!1562031 () Bool)

(declare-fun res!1067998 () Bool)

(declare-fun e!870461 () Bool)

(assert (=> b!1562031 (=> (not res!1067998) (not e!870461))))

(declare-datatypes ((array!104084 0))(
  ( (array!104085 (arr!50234 (Array (_ BitVec 32) (_ BitVec 64))) (size!50784 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104084)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1562031 (= res!1067998 (validKeyInArray!0 (select (arr!50234 _keys!637) from!782)))))

(declare-fun mapNonEmpty!59400 () Bool)

(declare-fun mapRes!59400 () Bool)

(declare-fun tp!113174 () Bool)

(declare-fun e!870463 () Bool)

(assert (=> mapNonEmpty!59400 (= mapRes!59400 (and tp!113174 e!870463))))

(declare-datatypes ((V!59785 0))(
  ( (V!59786 (val!19425 Int)) )
))
(declare-datatypes ((ValueCell!18311 0))(
  ( (ValueCellFull!18311 (v!22177 V!59785)) (EmptyCell!18311) )
))
(declare-fun mapRest!59400 () (Array (_ BitVec 32) ValueCell!18311))

(declare-fun mapKey!59400 () (_ BitVec 32))

(declare-datatypes ((array!104086 0))(
  ( (array!104087 (arr!50235 (Array (_ BitVec 32) ValueCell!18311)) (size!50785 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104086)

(declare-fun mapValue!59400 () ValueCell!18311)

(assert (=> mapNonEmpty!59400 (= (arr!50235 _values!487) (store mapRest!59400 mapKey!59400 mapValue!59400))))

(declare-fun res!1067999 () Bool)

(assert (=> start!133600 (=> (not res!1067999) (not e!870461))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133600 (= res!1067999 (validMask!0 mask!947))))

(assert (=> start!133600 e!870461))

(assert (=> start!133600 tp!113175))

(declare-fun tp_is_empty!38683 () Bool)

(assert (=> start!133600 tp_is_empty!38683))

(assert (=> start!133600 true))

(declare-fun array_inv!39045 (array!104084) Bool)

(assert (=> start!133600 (array_inv!39045 _keys!637)))

(declare-fun e!870460 () Bool)

(declare-fun array_inv!39046 (array!104086) Bool)

(assert (=> start!133600 (and (array_inv!39046 _values!487) e!870460)))

(declare-fun b!1562032 () Bool)

(declare-fun e!870459 () Bool)

(assert (=> b!1562032 (= e!870460 (and e!870459 mapRes!59400))))

(declare-fun condMapEmpty!59400 () Bool)

(declare-fun mapDefault!59400 () ValueCell!18311)

