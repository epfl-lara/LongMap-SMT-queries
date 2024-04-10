; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83448 () Bool)

(assert start!83448)

(declare-fun b_free!19435 () Bool)

(declare-fun b_next!19435 () Bool)

(assert (=> start!83448 (= b_free!19435 (not b_next!19435))))

(declare-fun tp!67592 () Bool)

(declare-fun b_and!31037 () Bool)

(assert (=> start!83448 (= tp!67592 b_and!31037)))

(declare-fun mapIsEmpty!35518 () Bool)

(declare-fun mapRes!35518 () Bool)

(assert (=> mapIsEmpty!35518 mapRes!35518))

(declare-fun b!974684 () Bool)

(declare-fun e!549368 () Bool)

(declare-fun tp_is_empty!22339 () Bool)

(assert (=> b!974684 (= e!549368 tp_is_empty!22339)))

(declare-fun b!974685 () Bool)

(declare-fun res!652457 () Bool)

(declare-fun e!549370 () Bool)

(assert (=> b!974685 (=> (not res!652457) (not e!549370))))

(declare-datatypes ((array!60717 0))(
  ( (array!60718 (arr!29222 (Array (_ BitVec 32) (_ BitVec 64))) (size!29701 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60717)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!974685 (= res!652457 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29701 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29701 _keys!1717))))))

(declare-fun res!652454 () Bool)

(assert (=> start!83448 (=> (not res!652454) (not e!549370))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83448 (= res!652454 (validMask!0 mask!2147))))

(assert (=> start!83448 e!549370))

(assert (=> start!83448 true))

(declare-datatypes ((V!34769 0))(
  ( (V!34770 (val!11220 Int)) )
))
(declare-datatypes ((ValueCell!10688 0))(
  ( (ValueCellFull!10688 (v!13779 V!34769)) (EmptyCell!10688) )
))
(declare-datatypes ((array!60719 0))(
  ( (array!60720 (arr!29223 (Array (_ BitVec 32) ValueCell!10688)) (size!29702 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60719)

(declare-fun e!549369 () Bool)

(declare-fun array_inv!22601 (array!60719) Bool)

(assert (=> start!83448 (and (array_inv!22601 _values!1425) e!549369)))

(assert (=> start!83448 tp_is_empty!22339))

(assert (=> start!83448 tp!67592))

(declare-fun array_inv!22602 (array!60717) Bool)

(assert (=> start!83448 (array_inv!22602 _keys!1717)))

(declare-fun b!974686 () Bool)

(declare-fun res!652458 () Bool)

(assert (=> b!974686 (=> (not res!652458) (not e!549370))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!974686 (= res!652458 (validKeyInArray!0 (select (arr!29222 _keys!1717) i!822)))))

(declare-fun b!974687 () Bool)

(declare-fun res!652455 () Bool)

(assert (=> b!974687 (=> (not res!652455) (not e!549370))))

(declare-datatypes ((List!20276 0))(
  ( (Nil!20273) (Cons!20272 (h!21434 (_ BitVec 64)) (t!28753 List!20276)) )
))
(declare-fun arrayNoDuplicates!0 (array!60717 (_ BitVec 32) List!20276) Bool)

(assert (=> b!974687 (= res!652455 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20273))))

(declare-fun b!974688 () Bool)

(declare-fun res!652456 () Bool)

(assert (=> b!974688 (=> (not res!652456) (not e!549370))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60717 (_ BitVec 32)) Bool)

(assert (=> b!974688 (= res!652456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapNonEmpty!35518 () Bool)

(declare-fun tp!67593 () Bool)

(assert (=> mapNonEmpty!35518 (= mapRes!35518 (and tp!67593 e!549368))))

(declare-fun mapKey!35518 () (_ BitVec 32))

(declare-fun mapRest!35518 () (Array (_ BitVec 32) ValueCell!10688))

(declare-fun mapValue!35518 () ValueCell!10688)

(assert (=> mapNonEmpty!35518 (= (arr!29223 _values!1425) (store mapRest!35518 mapKey!35518 mapValue!35518))))

(declare-fun b!974689 () Bool)

(declare-fun res!652453 () Bool)

(assert (=> b!974689 (=> (not res!652453) (not e!549370))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!974689 (= res!652453 (and (= (size!29702 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29701 _keys!1717) (size!29702 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!974690 () Bool)

(declare-fun e!549367 () Bool)

(assert (=> b!974690 (= e!549369 (and e!549367 mapRes!35518))))

(declare-fun condMapEmpty!35518 () Bool)

(declare-fun mapDefault!35518 () ValueCell!10688)

