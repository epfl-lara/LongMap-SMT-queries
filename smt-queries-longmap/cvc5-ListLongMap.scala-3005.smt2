; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42348 () Bool)

(assert start!42348)

(declare-fun b_free!11839 () Bool)

(declare-fun b_next!11839 () Bool)

(assert (=> start!42348 (= b_free!11839 (not b_next!11839))))

(declare-fun tp!41547 () Bool)

(declare-fun b_and!20285 () Bool)

(assert (=> start!42348 (= tp!41547 b_and!20285)))

(declare-fun b!472492 () Bool)

(declare-fun e!277059 () Bool)

(declare-fun tp_is_empty!13267 () Bool)

(assert (=> b!472492 (= e!277059 tp_is_empty!13267)))

(declare-fun res!282241 () Bool)

(declare-fun e!277060 () Bool)

(assert (=> start!42348 (=> (not res!282241) (not e!277060))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42348 (= res!282241 (validMask!0 mask!1365))))

(assert (=> start!42348 e!277060))

(assert (=> start!42348 tp_is_empty!13267))

(assert (=> start!42348 tp!41547))

(assert (=> start!42348 true))

(declare-datatypes ((array!30291 0))(
  ( (array!30292 (arr!14566 (Array (_ BitVec 32) (_ BitVec 64))) (size!14918 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30291)

(declare-fun array_inv!10502 (array!30291) Bool)

(assert (=> start!42348 (array_inv!10502 _keys!1025)))

(declare-datatypes ((V!18795 0))(
  ( (V!18796 (val!6678 Int)) )
))
(declare-datatypes ((ValueCell!6290 0))(
  ( (ValueCellFull!6290 (v!8969 V!18795)) (EmptyCell!6290) )
))
(declare-datatypes ((array!30293 0))(
  ( (array!30294 (arr!14567 (Array (_ BitVec 32) ValueCell!6290)) (size!14919 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30293)

(declare-fun e!277058 () Bool)

(declare-fun array_inv!10503 (array!30293) Bool)

(assert (=> start!42348 (and (array_inv!10503 _values!833) e!277058)))

(declare-fun mapIsEmpty!21610 () Bool)

(declare-fun mapRes!21610 () Bool)

(assert (=> mapIsEmpty!21610 mapRes!21610))

(declare-fun b!472493 () Bool)

(declare-fun e!277063 () Bool)

(assert (=> b!472493 (= e!277063 tp_is_empty!13267)))

(declare-fun mapNonEmpty!21610 () Bool)

(declare-fun tp!41548 () Bool)

(assert (=> mapNonEmpty!21610 (= mapRes!21610 (and tp!41548 e!277063))))

(declare-fun mapKey!21610 () (_ BitVec 32))

(declare-fun mapValue!21610 () ValueCell!6290)

(declare-fun mapRest!21610 () (Array (_ BitVec 32) ValueCell!6290))

(assert (=> mapNonEmpty!21610 (= (arr!14567 _values!833) (store mapRest!21610 mapKey!21610 mapValue!21610))))

(declare-fun b!472494 () Bool)

(assert (=> b!472494 (= e!277058 (and e!277059 mapRes!21610))))

(declare-fun condMapEmpty!21610 () Bool)

(declare-fun mapDefault!21610 () ValueCell!6290)

