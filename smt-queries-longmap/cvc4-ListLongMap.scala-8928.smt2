; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108260 () Bool)

(assert start!108260)

(declare-fun b!1278217 () Bool)

(declare-fun res!849227 () Bool)

(declare-fun e!730116 () Bool)

(assert (=> b!1278217 (=> (not res!849227) (not e!730116))))

(declare-datatypes ((array!84060 0))(
  ( (array!84061 (arr!40538 (Array (_ BitVec 32) (_ BitVec 64))) (size!41088 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84060)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84060 (_ BitVec 32)) Bool)

(assert (=> b!1278217 (= res!849227 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1278218 () Bool)

(declare-fun e!730113 () Bool)

(declare-fun tp_is_empty!33485 () Bool)

(assert (=> b!1278218 (= e!730113 tp_is_empty!33485)))

(declare-fun b!1278219 () Bool)

(declare-fun e!730115 () Bool)

(declare-fun e!730114 () Bool)

(declare-fun mapRes!51767 () Bool)

(assert (=> b!1278219 (= e!730115 (and e!730114 mapRes!51767))))

(declare-fun condMapEmpty!51767 () Bool)

(declare-datatypes ((V!49749 0))(
  ( (V!49750 (val!16817 Int)) )
))
(declare-datatypes ((ValueCell!15844 0))(
  ( (ValueCellFull!15844 (v!19416 V!49749)) (EmptyCell!15844) )
))
(declare-datatypes ((array!84062 0))(
  ( (array!84063 (arr!40539 (Array (_ BitVec 32) ValueCell!15844)) (size!41089 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84062)

(declare-fun mapDefault!51767 () ValueCell!15844)

