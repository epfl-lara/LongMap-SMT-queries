; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108046 () Bool)

(assert start!108046)

(declare-fun mapNonEmpty!51506 () Bool)

(declare-fun mapRes!51506 () Bool)

(declare-fun tp!98264 () Bool)

(declare-fun e!728649 () Bool)

(assert (=> mapNonEmpty!51506 (= mapRes!51506 (and tp!98264 e!728649))))

(declare-fun mapKey!51506 () (_ BitVec 32))

(declare-datatypes ((V!49529 0))(
  ( (V!49530 (val!16734 Int)) )
))
(declare-datatypes ((ValueCell!15761 0))(
  ( (ValueCellFull!15761 (v!19331 V!49529)) (EmptyCell!15761) )
))
(declare-fun mapValue!51506 () ValueCell!15761)

(declare-datatypes ((array!83732 0))(
  ( (array!83733 (arr!40378 (Array (_ BitVec 32) ValueCell!15761)) (size!40928 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83732)

(declare-fun mapRest!51506 () (Array (_ BitVec 32) ValueCell!15761))

(assert (=> mapNonEmpty!51506 (= (arr!40378 _values!1187) (store mapRest!51506 mapKey!51506 mapValue!51506))))

(declare-fun b!1276110 () Bool)

(declare-fun e!728646 () Bool)

(declare-fun tp_is_empty!33319 () Bool)

(assert (=> b!1276110 (= e!728646 tp_is_empty!33319)))

(declare-fun b!1276111 () Bool)

(declare-fun res!848101 () Bool)

(declare-fun e!728648 () Bool)

(assert (=> b!1276111 (=> (not res!848101) (not e!728648))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((array!83734 0))(
  ( (array!83735 (arr!40379 (Array (_ BitVec 32) (_ BitVec 64))) (size!40929 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83734)

(declare-fun mask!1805 () (_ BitVec 32))

(assert (=> b!1276111 (= res!848101 (and (= (size!40928 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40929 _keys!1427) (size!40928 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1276112 () Bool)

(declare-fun e!728647 () Bool)

(assert (=> b!1276112 (= e!728647 (and e!728646 mapRes!51506))))

(declare-fun condMapEmpty!51506 () Bool)

(declare-fun mapDefault!51506 () ValueCell!15761)

