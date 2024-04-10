; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134074 () Bool)

(assert start!134074)

(declare-fun b_free!32201 () Bool)

(declare-fun b_next!32201 () Bool)

(assert (=> start!134074 (= b_free!32201 (not b_next!32201))))

(declare-fun tp!113921 () Bool)

(declare-fun b_and!51845 () Bool)

(assert (=> start!134074 (= tp!113921 b_and!51845)))

(declare-fun b!1566973 () Bool)

(declare-fun res!1070961 () Bool)

(declare-fun e!873461 () Bool)

(assert (=> b!1566973 (=> (not res!1070961) (not e!873461))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!104652 0))(
  ( (array!104653 (arr!50511 (Array (_ BitVec 32) (_ BitVec 64))) (size!51061 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104652)

(assert (=> b!1566973 (= res!1070961 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51061 _keys!637)) (bvslt from!782 (size!51061 _keys!637))))))

(declare-fun mapNonEmpty!59871 () Bool)

(declare-fun mapRes!59871 () Bool)

(declare-fun tp!113922 () Bool)

(declare-fun e!873458 () Bool)

(assert (=> mapNonEmpty!59871 (= mapRes!59871 (and tp!113922 e!873458))))

(declare-datatypes ((V!60181 0))(
  ( (V!60182 (val!19574 Int)) )
))
(declare-datatypes ((ValueCell!18460 0))(
  ( (ValueCellFull!18460 (v!22333 V!60181)) (EmptyCell!18460) )
))
(declare-fun mapValue!59871 () ValueCell!18460)

(declare-datatypes ((array!104654 0))(
  ( (array!104655 (arr!50512 (Array (_ BitVec 32) ValueCell!18460)) (size!51062 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104654)

(declare-fun mapKey!59871 () (_ BitVec 32))

(declare-fun mapRest!59871 () (Array (_ BitVec 32) ValueCell!18460))

(assert (=> mapNonEmpty!59871 (= (arr!50512 _values!487) (store mapRest!59871 mapKey!59871 mapValue!59871))))

(declare-fun b!1566974 () Bool)

(declare-fun res!1070962 () Bool)

(assert (=> b!1566974 (=> (not res!1070962) (not e!873461))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1566974 (= res!1070962 (not (validKeyInArray!0 (select (arr!50511 _keys!637) from!782))))))

(declare-fun b!1566975 () Bool)

(declare-fun e!873460 () Bool)

(declare-fun e!873463 () Bool)

(assert (=> b!1566975 (= e!873460 (and e!873463 mapRes!59871))))

(declare-fun condMapEmpty!59871 () Bool)

(declare-fun mapDefault!59871 () ValueCell!18460)

