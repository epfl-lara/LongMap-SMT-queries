; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108034 () Bool)

(assert start!108034)

(declare-fun res!848045 () Bool)

(declare-fun e!728558 () Bool)

(assert (=> start!108034 (=> (not res!848045) (not e!728558))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108034 (= res!848045 (validMask!0 mask!1805))))

(assert (=> start!108034 e!728558))

(assert (=> start!108034 true))

(declare-datatypes ((V!49513 0))(
  ( (V!49514 (val!16728 Int)) )
))
(declare-datatypes ((ValueCell!15755 0))(
  ( (ValueCellFull!15755 (v!19325 V!49513)) (EmptyCell!15755) )
))
(declare-datatypes ((array!83708 0))(
  ( (array!83709 (arr!40366 (Array (_ BitVec 32) ValueCell!15755)) (size!40916 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83708)

(declare-fun e!728557 () Bool)

(declare-fun array_inv!30679 (array!83708) Bool)

(assert (=> start!108034 (and (array_inv!30679 _values!1187) e!728557)))

(declare-datatypes ((array!83710 0))(
  ( (array!83711 (arr!40367 (Array (_ BitVec 32) (_ BitVec 64))) (size!40917 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83710)

(declare-fun array_inv!30680 (array!83710) Bool)

(assert (=> start!108034 (array_inv!30680 _keys!1427)))

(declare-fun mapIsEmpty!51488 () Bool)

(declare-fun mapRes!51488 () Bool)

(assert (=> mapIsEmpty!51488 mapRes!51488))

(declare-fun mapNonEmpty!51488 () Bool)

(declare-fun tp!98246 () Bool)

(declare-fun e!728555 () Bool)

(assert (=> mapNonEmpty!51488 (= mapRes!51488 (and tp!98246 e!728555))))

(declare-fun mapValue!51488 () ValueCell!15755)

(declare-fun mapRest!51488 () (Array (_ BitVec 32) ValueCell!15755))

(declare-fun mapKey!51488 () (_ BitVec 32))

(assert (=> mapNonEmpty!51488 (= (arr!40366 _values!1187) (store mapRest!51488 mapKey!51488 mapValue!51488))))

(declare-fun b!1276000 () Bool)

(assert (=> b!1276000 (= e!728558 false)))

(declare-fun lt!575428 () Bool)

(declare-datatypes ((List!28631 0))(
  ( (Nil!28628) (Cons!28627 (h!29836 (_ BitVec 64)) (t!42167 List!28631)) )
))
(declare-fun arrayNoDuplicates!0 (array!83710 (_ BitVec 32) List!28631) Bool)

(assert (=> b!1276000 (= lt!575428 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28628))))

(declare-fun b!1276001 () Bool)

(declare-fun res!848044 () Bool)

(assert (=> b!1276001 (=> (not res!848044) (not e!728558))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83710 (_ BitVec 32)) Bool)

(assert (=> b!1276001 (= res!848044 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1276002 () Bool)

(declare-fun e!728556 () Bool)

(assert (=> b!1276002 (= e!728557 (and e!728556 mapRes!51488))))

(declare-fun condMapEmpty!51488 () Bool)

(declare-fun mapDefault!51488 () ValueCell!15755)

