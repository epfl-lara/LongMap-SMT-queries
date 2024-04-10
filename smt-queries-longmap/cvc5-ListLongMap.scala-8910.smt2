; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108110 () Bool)

(assert start!108110)

(declare-fun b_free!27823 () Bool)

(declare-fun b_next!27823 () Bool)

(assert (=> start!108110 (= b_free!27823 (not b_next!27823))))

(declare-fun tp!98423 () Bool)

(declare-fun b_and!45879 () Bool)

(assert (=> start!108110 (= tp!98423 b_and!45879)))

(declare-fun b!1276712 () Bool)

(declare-fun res!848439 () Bool)

(declare-fun e!729080 () Bool)

(assert (=> b!1276712 (=> (not res!848439) (not e!729080))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((V!49601 0))(
  ( (V!49602 (val!16761 Int)) )
))
(declare-datatypes ((ValueCell!15788 0))(
  ( (ValueCellFull!15788 (v!19358 V!49601)) (EmptyCell!15788) )
))
(declare-datatypes ((array!83838 0))(
  ( (array!83839 (arr!40430 (Array (_ BitVec 32) ValueCell!15788)) (size!40980 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83838)

(declare-datatypes ((array!83840 0))(
  ( (array!83841 (arr!40431 (Array (_ BitVec 32) (_ BitVec 64))) (size!40981 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83840)

(assert (=> b!1276712 (= res!848439 (and (= (size!40980 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40981 _keys!1427) (size!40980 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1276713 () Bool)

(declare-fun e!729081 () Bool)

(declare-fun e!729077 () Bool)

(declare-fun mapRes!51590 () Bool)

(assert (=> b!1276713 (= e!729081 (and e!729077 mapRes!51590))))

(declare-fun condMapEmpty!51590 () Bool)

(declare-fun mapDefault!51590 () ValueCell!15788)

