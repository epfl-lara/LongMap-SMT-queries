; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107954 () Bool)

(assert start!107954)

(declare-fun b!1275434 () Bool)

(declare-fun e!728110 () Bool)

(declare-fun tp_is_empty!33257 () Bool)

(assert (=> b!1275434 (= e!728110 tp_is_empty!33257)))

(declare-fun b!1275435 () Bool)

(declare-fun e!728107 () Bool)

(assert (=> b!1275435 (= e!728107 tp_is_empty!33257)))

(declare-fun b!1275436 () Bool)

(declare-fun e!728108 () Bool)

(declare-datatypes ((array!83620 0))(
  ( (array!83621 (arr!40325 (Array (_ BitVec 32) (_ BitVec 64))) (size!40875 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83620)

(assert (=> b!1275436 (= e!728108 (and (bvsle #b00000000000000000000000000000000 (size!40875 _keys!1427)) (bvsge (size!40875 _keys!1427) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!51404 () Bool)

(declare-fun mapRes!51404 () Bool)

(declare-fun tp!98162 () Bool)

(assert (=> mapNonEmpty!51404 (= mapRes!51404 (and tp!98162 e!728107))))

(declare-datatypes ((V!49445 0))(
  ( (V!49446 (val!16703 Int)) )
))
(declare-datatypes ((ValueCell!15730 0))(
  ( (ValueCellFull!15730 (v!19299 V!49445)) (EmptyCell!15730) )
))
(declare-fun mapRest!51404 () (Array (_ BitVec 32) ValueCell!15730))

(declare-fun mapKey!51404 () (_ BitVec 32))

(declare-fun mapValue!51404 () ValueCell!15730)

(declare-datatypes ((array!83622 0))(
  ( (array!83623 (arr!40326 (Array (_ BitVec 32) ValueCell!15730)) (size!40876 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83622)

(assert (=> mapNonEmpty!51404 (= (arr!40326 _values!1187) (store mapRest!51404 mapKey!51404 mapValue!51404))))

(declare-fun res!847746 () Bool)

(assert (=> start!107954 (=> (not res!847746) (not e!728108))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107954 (= res!847746 (validMask!0 mask!1805))))

(assert (=> start!107954 e!728108))

(assert (=> start!107954 true))

(declare-fun e!728106 () Bool)

(declare-fun array_inv!30653 (array!83622) Bool)

(assert (=> start!107954 (and (array_inv!30653 _values!1187) e!728106)))

(declare-fun array_inv!30654 (array!83620) Bool)

(assert (=> start!107954 (array_inv!30654 _keys!1427)))

(declare-fun mapIsEmpty!51404 () Bool)

(assert (=> mapIsEmpty!51404 mapRes!51404))

(declare-fun b!1275437 () Bool)

(declare-fun res!847747 () Bool)

(assert (=> b!1275437 (=> (not res!847747) (not e!728108))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1275437 (= res!847747 (and (= (size!40876 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40875 _keys!1427) (size!40876 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1275438 () Bool)

(declare-fun res!847745 () Bool)

(assert (=> b!1275438 (=> (not res!847745) (not e!728108))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83620 (_ BitVec 32)) Bool)

(assert (=> b!1275438 (= res!847745 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1275439 () Bool)

(assert (=> b!1275439 (= e!728106 (and e!728110 mapRes!51404))))

(declare-fun condMapEmpty!51404 () Bool)

(declare-fun mapDefault!51404 () ValueCell!15730)

