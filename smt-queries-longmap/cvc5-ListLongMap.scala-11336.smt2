; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131920 () Bool)

(assert start!131920)

(declare-fun b_free!31633 () Bool)

(declare-fun b_next!31633 () Bool)

(assert (=> start!131920 (= b_free!31633 (not b_next!31633))))

(declare-fun tp!111150 () Bool)

(declare-fun b_and!51043 () Bool)

(assert (=> start!131920 (= tp!111150 b_and!51043)))

(declare-fun b!1544683 () Bool)

(declare-fun res!1059507 () Bool)

(declare-fun e!859795 () Bool)

(assert (=> b!1544683 (=> (not res!1059507) (not e!859795))))

(declare-datatypes ((array!103026 0))(
  ( (array!103027 (arr!49715 (Array (_ BitVec 32) (_ BitVec 64))) (size!50265 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103026)

(declare-datatypes ((List!35966 0))(
  ( (Nil!35963) (Cons!35962 (h!37407 (_ BitVec 64)) (t!50660 List!35966)) )
))
(declare-fun arrayNoDuplicates!0 (array!103026 (_ BitVec 32) List!35966) Bool)

(assert (=> b!1544683 (= res!1059507 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35963))))

(declare-fun mapIsEmpty!58567 () Bool)

(declare-fun mapRes!58567 () Bool)

(assert (=> mapIsEmpty!58567 mapRes!58567))

(declare-fun b!1544684 () Bool)

(declare-fun res!1059503 () Bool)

(assert (=> b!1544684 (=> (not res!1059503) (not e!859795))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1544684 (= res!1059503 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50265 _keys!618))))))

(declare-fun b!1544685 () Bool)

(declare-fun e!859800 () Bool)

(declare-fun e!859796 () Bool)

(assert (=> b!1544685 (= e!859800 (and e!859796 mapRes!58567))))

(declare-fun condMapEmpty!58567 () Bool)

(declare-datatypes ((V!58989 0))(
  ( (V!58990 (val!19032 Int)) )
))
(declare-datatypes ((ValueCell!18044 0))(
  ( (ValueCellFull!18044 (v!21833 V!58989)) (EmptyCell!18044) )
))
(declare-datatypes ((array!103028 0))(
  ( (array!103029 (arr!49716 (Array (_ BitVec 32) ValueCell!18044)) (size!50266 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103028)

(declare-fun mapDefault!58567 () ValueCell!18044)

