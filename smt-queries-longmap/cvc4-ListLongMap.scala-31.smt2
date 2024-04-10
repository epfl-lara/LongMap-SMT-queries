; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!622 () Bool)

(assert start!622)

(declare-fun b_free!95 () Bool)

(declare-fun b_next!95 () Bool)

(assert (=> start!622 (= b_free!95 (not b_next!95))))

(declare-fun tp!502 () Bool)

(declare-fun b_and!233 () Bool)

(assert (=> start!622 (= tp!502 b_and!233)))

(declare-fun mapIsEmpty!218 () Bool)

(declare-fun mapRes!218 () Bool)

(assert (=> mapIsEmpty!218 mapRes!218))

(declare-fun b!3931 () Bool)

(declare-fun e!2011 () Bool)

(declare-fun tp_is_empty!173 () Bool)

(assert (=> b!3931 (= e!2011 tp_is_empty!173)))

(declare-fun res!5450 () Bool)

(declare-fun e!2014 () Bool)

(assert (=> start!622 (=> (not res!5450) (not e!2014))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!622 (= res!5450 (validMask!0 mask!2250))))

(assert (=> start!622 e!2014))

(assert (=> start!622 tp!502))

(assert (=> start!622 true))

(declare-datatypes ((V!407 0))(
  ( (V!408 (val!92 Int)) )
))
(declare-datatypes ((ValueCell!70 0))(
  ( (ValueCellFull!70 (v!1179 V!407)) (EmptyCell!70) )
))
(declare-datatypes ((array!281 0))(
  ( (array!282 (arr!133 (Array (_ BitVec 32) ValueCell!70)) (size!195 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!281)

(declare-fun e!2013 () Bool)

(declare-fun array_inv!95 (array!281) Bool)

(assert (=> start!622 (and (array_inv!95 _values!1492) e!2013)))

(assert (=> start!622 tp_is_empty!173))

(declare-datatypes ((array!283 0))(
  ( (array!284 (arr!134 (Array (_ BitVec 32) (_ BitVec 64))) (size!196 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!283)

(declare-fun array_inv!96 (array!283) Bool)

(assert (=> start!622 (array_inv!96 _keys!1806)))

(declare-fun b!3932 () Bool)

(declare-fun res!5451 () Bool)

(assert (=> b!3932 (=> (not res!5451) (not e!2014))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!283 (_ BitVec 32)) Bool)

(assert (=> b!3932 (= res!5451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun mapNonEmpty!218 () Bool)

(declare-fun tp!503 () Bool)

(declare-fun e!2012 () Bool)

(assert (=> mapNonEmpty!218 (= mapRes!218 (and tp!503 e!2012))))

(declare-fun mapRest!218 () (Array (_ BitVec 32) ValueCell!70))

(declare-fun mapValue!218 () ValueCell!70)

(declare-fun mapKey!218 () (_ BitVec 32))

(assert (=> mapNonEmpty!218 (= (arr!133 _values!1492) (store mapRest!218 mapKey!218 mapValue!218))))

(declare-fun b!3933 () Bool)

(declare-fun res!5449 () Bool)

(assert (=> b!3933 (=> (not res!5449) (not e!2014))))

(declare-datatypes ((List!79 0))(
  ( (Nil!76) (Cons!75 (h!641 (_ BitVec 64)) (t!2206 List!79)) )
))
(declare-fun arrayNoDuplicates!0 (array!283 (_ BitVec 32) List!79) Bool)

(assert (=> b!3933 (= res!5449 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!76))))

(declare-fun b!3934 () Bool)

(assert (=> b!3934 (= e!2012 tp_is_empty!173)))

(declare-fun b!3935 () Bool)

(assert (=> b!3935 (= e!2014 false)))

(declare-fun defaultEntry!1495 () Int)

(declare-fun lt!543 () Bool)

(declare-fun minValue!1434 () V!407)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!407)

(declare-datatypes ((tuple2!68 0))(
  ( (tuple2!69 (_1!34 (_ BitVec 64)) (_2!34 V!407)) )
))
(declare-datatypes ((List!80 0))(
  ( (Nil!77) (Cons!76 (h!642 tuple2!68) (t!2207 List!80)) )
))
(declare-datatypes ((ListLongMap!73 0))(
  ( (ListLongMap!74 (toList!52 List!80)) )
))
(declare-fun contains!22 (ListLongMap!73 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!11 (array!283 array!281 (_ BitVec 32) (_ BitVec 32) V!407 V!407 (_ BitVec 32) Int) ListLongMap!73)

(assert (=> b!3935 (= lt!543 (contains!22 (getCurrentListMap!11 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!3936 () Bool)

(assert (=> b!3936 (= e!2013 (and e!2011 mapRes!218))))

(declare-fun condMapEmpty!218 () Bool)

(declare-fun mapDefault!218 () ValueCell!70)

