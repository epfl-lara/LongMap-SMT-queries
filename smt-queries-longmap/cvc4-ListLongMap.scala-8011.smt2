; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98910 () Bool)

(assert start!98910)

(declare-fun b_free!24515 () Bool)

(declare-fun b_next!24515 () Bool)

(assert (=> start!98910 (= b_free!24515 (not b_next!24515))))

(declare-fun tp!86255 () Bool)

(declare-fun b_and!39879 () Bool)

(assert (=> start!98910 (= tp!86255 b_and!39879)))

(declare-fun b!1158702 () Bool)

(declare-fun e!658924 () Bool)

(declare-fun e!658929 () Bool)

(declare-fun mapRes!45392 () Bool)

(assert (=> b!1158702 (= e!658924 (and e!658929 mapRes!45392))))

(declare-fun condMapEmpty!45392 () Bool)

(declare-datatypes ((V!43853 0))(
  ( (V!43854 (val!14579 Int)) )
))
(declare-datatypes ((ValueCell!13813 0))(
  ( (ValueCellFull!13813 (v!17216 V!43853)) (EmptyCell!13813) )
))
(declare-datatypes ((array!74933 0))(
  ( (array!74934 (arr!36117 (Array (_ BitVec 32) ValueCell!13813)) (size!36653 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74933)

(declare-fun mapDefault!45392 () ValueCell!13813)

