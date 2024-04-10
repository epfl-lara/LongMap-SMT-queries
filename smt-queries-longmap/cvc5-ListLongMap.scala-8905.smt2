; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108080 () Bool)

(assert start!108080)

(declare-fun b_free!27793 () Bool)

(declare-fun b_next!27793 () Bool)

(assert (=> start!108080 (= b_free!27793 (not b_next!27793))))

(declare-fun tp!98333 () Bool)

(declare-fun b_and!45849 () Bool)

(assert (=> start!108080 (= tp!98333 b_and!45849)))

(declare-fun b!1276397 () Bool)

(declare-fun res!848259 () Bool)

(declare-fun e!728854 () Bool)

(assert (=> b!1276397 (=> (not res!848259) (not e!728854))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((array!83780 0))(
  ( (array!83781 (arr!40401 (Array (_ BitVec 32) (_ BitVec 64))) (size!40951 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83780)

(declare-datatypes ((V!49561 0))(
  ( (V!49562 (val!16746 Int)) )
))
(declare-datatypes ((ValueCell!15773 0))(
  ( (ValueCellFull!15773 (v!19343 V!49561)) (EmptyCell!15773) )
))
(declare-datatypes ((array!83782 0))(
  ( (array!83783 (arr!40402 (Array (_ BitVec 32) ValueCell!15773)) (size!40952 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83782)

(assert (=> b!1276397 (= res!848259 (and (= (size!40952 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40951 _keys!1427) (size!40952 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!51545 () Bool)

(declare-fun mapRes!51545 () Bool)

(assert (=> mapIsEmpty!51545 mapRes!51545))

(declare-fun res!848262 () Bool)

(assert (=> start!108080 (=> (not res!848262) (not e!728854))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108080 (= res!848262 (validMask!0 mask!1805))))

(assert (=> start!108080 e!728854))

(assert (=> start!108080 true))

(assert (=> start!108080 tp!98333))

(declare-fun tp_is_empty!33343 () Bool)

(assert (=> start!108080 tp_is_empty!33343))

(declare-fun e!728853 () Bool)

(declare-fun array_inv!30705 (array!83782) Bool)

(assert (=> start!108080 (and (array_inv!30705 _values!1187) e!728853)))

(declare-fun array_inv!30706 (array!83780) Bool)

(assert (=> start!108080 (array_inv!30706 _keys!1427)))

(declare-fun mapNonEmpty!51545 () Bool)

(declare-fun tp!98332 () Bool)

(declare-fun e!728855 () Bool)

(assert (=> mapNonEmpty!51545 (= mapRes!51545 (and tp!98332 e!728855))))

(declare-fun mapValue!51545 () ValueCell!15773)

(declare-fun mapKey!51545 () (_ BitVec 32))

(declare-fun mapRest!51545 () (Array (_ BitVec 32) ValueCell!15773))

(assert (=> mapNonEmpty!51545 (= (arr!40402 _values!1187) (store mapRest!51545 mapKey!51545 mapValue!51545))))

(declare-fun b!1276398 () Bool)

(declare-fun e!728856 () Bool)

(assert (=> b!1276398 (= e!728856 tp_is_empty!33343)))

(declare-fun b!1276399 () Bool)

(declare-fun res!848260 () Bool)

(assert (=> b!1276399 (=> (not res!848260) (not e!728854))))

(declare-datatypes ((List!28652 0))(
  ( (Nil!28649) (Cons!28648 (h!29857 (_ BitVec 64)) (t!42188 List!28652)) )
))
(declare-fun arrayNoDuplicates!0 (array!83780 (_ BitVec 32) List!28652) Bool)

(assert (=> b!1276399 (= res!848260 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28649))))

(declare-fun b!1276400 () Bool)

(assert (=> b!1276400 (= e!728855 tp_is_empty!33343)))

(declare-fun b!1276401 () Bool)

(assert (=> b!1276401 (= e!728853 (and e!728856 mapRes!51545))))

(declare-fun condMapEmpty!51545 () Bool)

(declare-fun mapDefault!51545 () ValueCell!15773)

