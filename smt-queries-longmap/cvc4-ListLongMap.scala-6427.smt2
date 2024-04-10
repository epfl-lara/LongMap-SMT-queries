; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82362 () Bool)

(assert start!82362)

(declare-fun b_free!18629 () Bool)

(declare-fun b_next!18629 () Bool)

(assert (=> start!82362 (= b_free!18629 (not b_next!18629))))

(declare-fun tp!64856 () Bool)

(declare-fun b_and!30117 () Bool)

(assert (=> start!82362 (= tp!64856 b_and!30117)))

(declare-fun mapNonEmpty!33991 () Bool)

(declare-fun mapRes!33991 () Bool)

(declare-fun tp!64857 () Bool)

(declare-fun e!541332 () Bool)

(assert (=> mapNonEmpty!33991 (= mapRes!33991 (and tp!64857 e!541332))))

(declare-datatypes ((V!33437 0))(
  ( (V!33438 (val!10721 Int)) )
))
(declare-datatypes ((ValueCell!10189 0))(
  ( (ValueCellFull!10189 (v!13278 V!33437)) (EmptyCell!10189) )
))
(declare-fun mapRest!33991 () (Array (_ BitVec 32) ValueCell!10189))

(declare-fun mapKey!33991 () (_ BitVec 32))

(declare-fun mapValue!33991 () ValueCell!10189)

(declare-datatypes ((array!58773 0))(
  ( (array!58774 (arr!28260 (Array (_ BitVec 32) ValueCell!10189)) (size!28739 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58773)

(assert (=> mapNonEmpty!33991 (= (arr!28260 _values!1386) (store mapRest!33991 mapKey!33991 mapValue!33991))))

(declare-fun b!960315 () Bool)

(declare-fun res!642819 () Bool)

(declare-fun e!541334 () Bool)

(assert (=> b!960315 (=> (not res!642819) (not e!541334))))

(declare-datatypes ((array!58775 0))(
  ( (array!58776 (arr!28261 (Array (_ BitVec 32) (_ BitVec 64))) (size!28740 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58775)

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58775 (_ BitVec 32)) Bool)

(assert (=> b!960315 (= res!642819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!960316 () Bool)

(declare-fun e!541331 () Bool)

(declare-fun e!541335 () Bool)

(assert (=> b!960316 (= e!541331 (and e!541335 mapRes!33991))))

(declare-fun condMapEmpty!33991 () Bool)

(declare-fun mapDefault!33991 () ValueCell!10189)

