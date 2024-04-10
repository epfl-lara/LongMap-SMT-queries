; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108010 () Bool)

(assert start!108010)

(declare-fun b!1275784 () Bool)

(declare-fun res!847938 () Bool)

(declare-fun e!728375 () Bool)

(assert (=> b!1275784 (=> (not res!847938) (not e!728375))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((array!83668 0))(
  ( (array!83669 (arr!40346 (Array (_ BitVec 32) (_ BitVec 64))) (size!40896 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83668)

(declare-datatypes ((V!49481 0))(
  ( (V!49482 (val!16716 Int)) )
))
(declare-datatypes ((ValueCell!15743 0))(
  ( (ValueCellFull!15743 (v!19313 V!49481)) (EmptyCell!15743) )
))
(declare-datatypes ((array!83670 0))(
  ( (array!83671 (arr!40347 (Array (_ BitVec 32) ValueCell!15743)) (size!40897 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83670)

(assert (=> b!1275784 (= res!847938 (and (= (size!40897 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40896 _keys!1427) (size!40897 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1275785 () Bool)

(declare-fun e!728377 () Bool)

(declare-fun e!728379 () Bool)

(declare-fun mapRes!51452 () Bool)

(assert (=> b!1275785 (= e!728377 (and e!728379 mapRes!51452))))

(declare-fun condMapEmpty!51452 () Bool)

(declare-fun mapDefault!51452 () ValueCell!15743)

