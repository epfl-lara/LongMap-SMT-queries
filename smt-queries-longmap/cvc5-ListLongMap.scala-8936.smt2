; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108342 () Bool)

(assert start!108342)

(declare-fun mapIsEmpty!51845 () Bool)

(declare-fun mapRes!51845 () Bool)

(assert (=> mapIsEmpty!51845 mapRes!51845))

(declare-fun b!1278749 () Bool)

(declare-fun res!849506 () Bool)

(declare-fun e!730533 () Bool)

(assert (=> b!1278749 (=> (not res!849506) (not e!730533))))

(declare-datatypes ((array!84150 0))(
  ( (array!84151 (arr!40579 (Array (_ BitVec 32) (_ BitVec 64))) (size!41129 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84150)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84150 (_ BitVec 32)) Bool)

(assert (=> b!1278749 (= res!849506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1278750 () Bool)

(declare-fun res!849504 () Bool)

(assert (=> b!1278750 (=> (not res!849504) (not e!730533))))

(declare-datatypes ((V!49809 0))(
  ( (V!49810 (val!16839 Int)) )
))
(declare-datatypes ((ValueCell!15866 0))(
  ( (ValueCellFull!15866 (v!19439 V!49809)) (EmptyCell!15866) )
))
(declare-datatypes ((array!84152 0))(
  ( (array!84153 (arr!40580 (Array (_ BitVec 32) ValueCell!15866)) (size!41130 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84152)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1278750 (= res!849504 (and (= (size!41130 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41129 _keys!1741) (size!41130 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1278751 () Bool)

(assert (=> b!1278751 (= e!730533 false)))

(declare-fun lt!575924 () Bool)

(declare-datatypes ((List!28749 0))(
  ( (Nil!28746) (Cons!28745 (h!29954 (_ BitVec 64)) (t!42289 List!28749)) )
))
(declare-fun arrayNoDuplicates!0 (array!84150 (_ BitVec 32) List!28749) Bool)

(assert (=> b!1278751 (= lt!575924 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28746))))

(declare-fun mapNonEmpty!51845 () Bool)

(declare-fun tp!98819 () Bool)

(declare-fun e!730531 () Bool)

(assert (=> mapNonEmpty!51845 (= mapRes!51845 (and tp!98819 e!730531))))

(declare-fun mapValue!51845 () ValueCell!15866)

(declare-fun mapKey!51845 () (_ BitVec 32))

(declare-fun mapRest!51845 () (Array (_ BitVec 32) ValueCell!15866))

(assert (=> mapNonEmpty!51845 (= (arr!40580 _values!1445) (store mapRest!51845 mapKey!51845 mapValue!51845))))

(declare-fun b!1278752 () Bool)

(declare-fun e!730535 () Bool)

(declare-fun e!730532 () Bool)

(assert (=> b!1278752 (= e!730535 (and e!730532 mapRes!51845))))

(declare-fun condMapEmpty!51845 () Bool)

(declare-fun mapDefault!51845 () ValueCell!15866)

