; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107064 () Bool)

(assert start!107064)

(declare-fun b_free!27569 () Bool)

(declare-fun b_next!27569 () Bool)

(assert (=> start!107064 (= b_free!27569 (not b_next!27569))))

(declare-fun tp!96933 () Bool)

(declare-fun b_and!45601 () Bool)

(assert (=> start!107064 (= tp!96933 b_and!45601)))

(declare-fun b!1269363 () Bool)

(declare-fun res!844759 () Bool)

(declare-fun e!723482 () Bool)

(assert (=> b!1269363 (=> (not res!844759) (not e!723482))))

(declare-datatypes ((V!48863 0))(
  ( (V!48864 (val!16451 Int)) )
))
(declare-datatypes ((ValueCell!15523 0))(
  ( (ValueCellFull!15523 (v!19088 V!48863)) (EmptyCell!15523) )
))
(declare-datatypes ((array!82770 0))(
  ( (array!82771 (arr!39922 (Array (_ BitVec 32) ValueCell!15523)) (size!40458 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82770)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82772 0))(
  ( (array!82773 (arr!39923 (Array (_ BitVec 32) (_ BitVec 64))) (size!40459 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82772)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1269363 (= res!844759 (and (= (size!40458 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40459 _keys!1364) (size!40458 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1269364 () Bool)

(declare-fun e!723483 () Bool)

(declare-fun e!723481 () Bool)

(declare-fun mapRes!50710 () Bool)

(assert (=> b!1269364 (= e!723483 (and e!723481 mapRes!50710))))

(declare-fun condMapEmpty!50710 () Bool)

(declare-fun mapDefault!50710 () ValueCell!15523)

