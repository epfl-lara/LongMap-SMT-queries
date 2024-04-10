; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109378 () Bool)

(assert start!109378)

(declare-fun b_free!28867 () Bool)

(declare-fun b_next!28867 () Bool)

(assert (=> start!109378 (= b_free!28867 (not b_next!28867))))

(declare-fun tp!101719 () Bool)

(declare-fun b_and!46957 () Bool)

(assert (=> start!109378 (= tp!101719 b_and!46957)))

(declare-fun b!1294734 () Bool)

(declare-fun res!860456 () Bool)

(declare-fun e!738784 () Bool)

(assert (=> b!1294734 (=> (not res!860456) (not e!738784))))

(declare-datatypes ((array!86034 0))(
  ( (array!86035 (arr!41518 (Array (_ BitVec 32) (_ BitVec 64))) (size!42068 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86034)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1294734 (= res!860456 (not (validKeyInArray!0 (select (arr!41518 _keys!1741) from!2144))))))

(declare-fun mapNonEmpty!53321 () Bool)

(declare-fun mapRes!53321 () Bool)

(declare-fun tp!101720 () Bool)

(declare-fun e!738787 () Bool)

(assert (=> mapNonEmpty!53321 (= mapRes!53321 (and tp!101720 e!738787))))

(declare-datatypes ((V!51113 0))(
  ( (V!51114 (val!17328 Int)) )
))
(declare-datatypes ((ValueCell!16355 0))(
  ( (ValueCellFull!16355 (v!19931 V!51113)) (EmptyCell!16355) )
))
(declare-fun mapRest!53321 () (Array (_ BitVec 32) ValueCell!16355))

(declare-fun mapValue!53321 () ValueCell!16355)

(declare-fun mapKey!53321 () (_ BitVec 32))

(declare-datatypes ((array!86036 0))(
  ( (array!86037 (arr!41519 (Array (_ BitVec 32) ValueCell!16355)) (size!42069 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86036)

(assert (=> mapNonEmpty!53321 (= (arr!41519 _values!1445) (store mapRest!53321 mapKey!53321 mapValue!53321))))

(declare-fun b!1294735 () Bool)

(declare-fun e!738786 () Bool)

(declare-fun e!738788 () Bool)

(assert (=> b!1294735 (= e!738786 (and e!738788 mapRes!53321))))

(declare-fun condMapEmpty!53321 () Bool)

(declare-fun mapDefault!53321 () ValueCell!16355)

