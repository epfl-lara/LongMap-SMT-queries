; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108322 () Bool)

(assert start!108322)

(declare-fun mapIsEmpty!51815 () Bool)

(declare-fun mapRes!51815 () Bool)

(assert (=> mapIsEmpty!51815 mapRes!51815))

(declare-fun mapNonEmpty!51815 () Bool)

(declare-fun tp!98789 () Bool)

(declare-fun e!730382 () Bool)

(assert (=> mapNonEmpty!51815 (= mapRes!51815 (and tp!98789 e!730382))))

(declare-datatypes ((V!49781 0))(
  ( (V!49782 (val!16829 Int)) )
))
(declare-datatypes ((ValueCell!15856 0))(
  ( (ValueCellFull!15856 (v!19429 V!49781)) (EmptyCell!15856) )
))
(declare-fun mapValue!51815 () ValueCell!15856)

(declare-datatypes ((array!84112 0))(
  ( (array!84113 (arr!40560 (Array (_ BitVec 32) ValueCell!15856)) (size!41110 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84112)

(declare-fun mapRest!51815 () (Array (_ BitVec 32) ValueCell!15856))

(declare-fun mapKey!51815 () (_ BitVec 32))

(assert (=> mapNonEmpty!51815 (= (arr!40560 _values!1445) (store mapRest!51815 mapKey!51815 mapValue!51815))))

(declare-fun b!1278569 () Bool)

(declare-fun e!730381 () Bool)

(assert (=> b!1278569 (= e!730381 false)))

(declare-fun lt!575894 () Bool)

(declare-datatypes ((array!84114 0))(
  ( (array!84115 (arr!40561 (Array (_ BitVec 32) (_ BitVec 64))) (size!41111 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84114)

(declare-datatypes ((List!28743 0))(
  ( (Nil!28740) (Cons!28739 (h!29948 (_ BitVec 64)) (t!42283 List!28743)) )
))
(declare-fun arrayNoDuplicates!0 (array!84114 (_ BitVec 32) List!28743) Bool)

(assert (=> b!1278569 (= lt!575894 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28740))))

(declare-fun b!1278570 () Bool)

(declare-fun e!730383 () Bool)

(declare-fun tp_is_empty!33509 () Bool)

(assert (=> b!1278570 (= e!730383 tp_is_empty!33509)))

(declare-fun res!849416 () Bool)

(assert (=> start!108322 (=> (not res!849416) (not e!730381))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108322 (= res!849416 (validMask!0 mask!2175))))

(assert (=> start!108322 e!730381))

(assert (=> start!108322 true))

(declare-fun e!730385 () Bool)

(declare-fun array_inv!30807 (array!84112) Bool)

(assert (=> start!108322 (and (array_inv!30807 _values!1445) e!730385)))

(declare-fun array_inv!30808 (array!84114) Bool)

(assert (=> start!108322 (array_inv!30808 _keys!1741)))

(declare-fun b!1278571 () Bool)

(assert (=> b!1278571 (= e!730385 (and e!730383 mapRes!51815))))

(declare-fun condMapEmpty!51815 () Bool)

(declare-fun mapDefault!51815 () ValueCell!15856)

