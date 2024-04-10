; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83442 () Bool)

(assert start!83442)

(declare-fun b!974617 () Bool)

(declare-fun res!652413 () Bool)

(declare-fun e!549321 () Bool)

(assert (=> b!974617 (=> (not res!652413) (not e!549321))))

(declare-datatypes ((array!60705 0))(
  ( (array!60706 (arr!29216 (Array (_ BitVec 32) (_ BitVec 64))) (size!29695 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60705)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60705 (_ BitVec 32)) Bool)

(assert (=> b!974617 (= res!652413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!974618 () Bool)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!974618 (= e!549321 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29695 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29695 _keys!1717)) (bvslt i!822 #b00000000000000000000000000000000)))))

(declare-fun b!974619 () Bool)

(declare-fun e!549323 () Bool)

(declare-fun tp_is_empty!22333 () Bool)

(assert (=> b!974619 (= e!549323 tp_is_empty!22333)))

(declare-fun b!974620 () Bool)

(declare-fun e!549322 () Bool)

(assert (=> b!974620 (= e!549322 tp_is_empty!22333)))

(declare-fun res!652414 () Bool)

(assert (=> start!83442 (=> (not res!652414) (not e!549321))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83442 (= res!652414 (validMask!0 mask!2147))))

(assert (=> start!83442 e!549321))

(assert (=> start!83442 true))

(declare-datatypes ((V!34761 0))(
  ( (V!34762 (val!11217 Int)) )
))
(declare-datatypes ((ValueCell!10685 0))(
  ( (ValueCellFull!10685 (v!13776 V!34761)) (EmptyCell!10685) )
))
(declare-datatypes ((array!60707 0))(
  ( (array!60708 (arr!29217 (Array (_ BitVec 32) ValueCell!10685)) (size!29696 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60707)

(declare-fun e!549325 () Bool)

(declare-fun array_inv!22595 (array!60707) Bool)

(assert (=> start!83442 (and (array_inv!22595 _values!1425) e!549325)))

(declare-fun array_inv!22596 (array!60705) Bool)

(assert (=> start!83442 (array_inv!22596 _keys!1717)))

(declare-fun mapNonEmpty!35509 () Bool)

(declare-fun mapRes!35509 () Bool)

(declare-fun tp!67581 () Bool)

(assert (=> mapNonEmpty!35509 (= mapRes!35509 (and tp!67581 e!549322))))

(declare-fun mapKey!35509 () (_ BitVec 32))

(declare-fun mapValue!35509 () ValueCell!10685)

(declare-fun mapRest!35509 () (Array (_ BitVec 32) ValueCell!10685))

(assert (=> mapNonEmpty!35509 (= (arr!29217 _values!1425) (store mapRest!35509 mapKey!35509 mapValue!35509))))

(declare-fun b!974621 () Bool)

(assert (=> b!974621 (= e!549325 (and e!549323 mapRes!35509))))

(declare-fun condMapEmpty!35509 () Bool)

(declare-fun mapDefault!35509 () ValueCell!10685)

