; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133606 () Bool)

(assert start!133606)

(declare-fun b_free!32023 () Bool)

(declare-fun b_next!32023 () Bool)

(assert (=> start!133606 (= b_free!32023 (not b_next!32023))))

(declare-fun tp!113192 () Bool)

(declare-fun b_and!51557 () Bool)

(assert (=> start!133606 (= tp!113192 b_and!51557)))

(declare-fun b!1562118 () Bool)

(declare-fun res!1068051 () Bool)

(declare-fun e!870507 () Bool)

(assert (=> b!1562118 (=> (not res!1068051) (not e!870507))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!104096 0))(
  ( (array!104097 (arr!50240 (Array (_ BitVec 32) (_ BitVec 64))) (size!50790 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104096)

(assert (=> b!1562118 (= res!1068051 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50790 _keys!637)) (bvslt from!782 (size!50790 _keys!637))))))

(declare-fun b!1562119 () Bool)

(declare-fun e!870506 () Bool)

(declare-fun tp_is_empty!38689 () Bool)

(assert (=> b!1562119 (= e!870506 tp_is_empty!38689)))

(declare-fun b!1562120 () Bool)

(declare-fun res!1068053 () Bool)

(assert (=> b!1562120 (=> (not res!1068053) (not e!870507))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!59793 0))(
  ( (V!59794 (val!19428 Int)) )
))
(declare-datatypes ((ValueCell!18314 0))(
  ( (ValueCellFull!18314 (v!22180 V!59793)) (EmptyCell!18314) )
))
(declare-datatypes ((array!104098 0))(
  ( (array!104099 (arr!50241 (Array (_ BitVec 32) ValueCell!18314)) (size!50791 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104098)

(assert (=> b!1562120 (= res!1068053 (and (= (size!50791 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50790 _keys!637) (size!50791 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!59409 () Bool)

(declare-fun mapRes!59409 () Bool)

(declare-fun tp!113193 () Bool)

(assert (=> mapNonEmpty!59409 (= mapRes!59409 (and tp!113193 e!870506))))

(declare-fun mapRest!59409 () (Array (_ BitVec 32) ValueCell!18314))

(declare-fun mapValue!59409 () ValueCell!18314)

(declare-fun mapKey!59409 () (_ BitVec 32))

(assert (=> mapNonEmpty!59409 (= (arr!50241 _values!487) (store mapRest!59409 mapKey!59409 mapValue!59409))))

(declare-fun b!1562121 () Bool)

(declare-fun e!870504 () Bool)

(declare-fun e!870508 () Bool)

(assert (=> b!1562121 (= e!870504 (and e!870508 mapRes!59409))))

(declare-fun condMapEmpty!59409 () Bool)

(declare-fun mapDefault!59409 () ValueCell!18314)

