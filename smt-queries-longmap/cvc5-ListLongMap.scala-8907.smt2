; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108092 () Bool)

(assert start!108092)

(declare-fun b_free!27805 () Bool)

(declare-fun b_next!27805 () Bool)

(assert (=> start!108092 (= b_free!27805 (not b_next!27805))))

(declare-fun tp!98369 () Bool)

(declare-fun b_and!45861 () Bool)

(assert (=> start!108092 (= tp!98369 b_and!45861)))

(declare-fun mapIsEmpty!51563 () Bool)

(declare-fun mapRes!51563 () Bool)

(assert (=> mapIsEmpty!51563 mapRes!51563))

(declare-fun b!1276523 () Bool)

(declare-fun res!848331 () Bool)

(declare-fun e!728943 () Bool)

(assert (=> b!1276523 (=> (not res!848331) (not e!728943))))

(declare-datatypes ((array!83804 0))(
  ( (array!83805 (arr!40413 (Array (_ BitVec 32) (_ BitVec 64))) (size!40963 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83804)

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83804 (_ BitVec 32)) Bool)

(assert (=> b!1276523 (= res!848331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun mapNonEmpty!51563 () Bool)

(declare-fun tp!98368 () Bool)

(declare-fun e!728945 () Bool)

(assert (=> mapNonEmpty!51563 (= mapRes!51563 (and tp!98368 e!728945))))

(declare-datatypes ((V!49577 0))(
  ( (V!49578 (val!16752 Int)) )
))
(declare-datatypes ((ValueCell!15779 0))(
  ( (ValueCellFull!15779 (v!19349 V!49577)) (EmptyCell!15779) )
))
(declare-fun mapRest!51563 () (Array (_ BitVec 32) ValueCell!15779))

(declare-fun mapValue!51563 () ValueCell!15779)

(declare-fun mapKey!51563 () (_ BitVec 32))

(declare-datatypes ((array!83806 0))(
  ( (array!83807 (arr!40414 (Array (_ BitVec 32) ValueCell!15779)) (size!40964 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83806)

(assert (=> mapNonEmpty!51563 (= (arr!40414 _values!1187) (store mapRest!51563 mapKey!51563 mapValue!51563))))

(declare-fun b!1276524 () Bool)

(declare-fun e!728946 () Bool)

(declare-fun e!728944 () Bool)

(assert (=> b!1276524 (= e!728946 (and e!728944 mapRes!51563))))

(declare-fun condMapEmpty!51563 () Bool)

(declare-fun mapDefault!51563 () ValueCell!15779)

