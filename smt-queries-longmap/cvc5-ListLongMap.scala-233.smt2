; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4080 () Bool)

(assert start!4080)

(declare-fun b_free!985 () Bool)

(declare-fun b_next!985 () Bool)

(assert (=> start!4080 (= b_free!985 (not b_next!985))))

(declare-fun tp!4375 () Bool)

(declare-fun b_and!1795 () Bool)

(assert (=> start!4080 (= tp!4375 b_and!1795)))

(declare-fun mapIsEmpty!1537 () Bool)

(declare-fun mapRes!1537 () Bool)

(assert (=> mapIsEmpty!1537 mapRes!1537))

(declare-fun res!18156 () Bool)

(declare-fun e!19396 () Bool)

(assert (=> start!4080 (=> (not res!18156) (not e!19396))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4080 (= res!18156 (validMask!0 mask!2294))))

(assert (=> start!4080 e!19396))

(assert (=> start!4080 true))

(assert (=> start!4080 tp!4375))

(declare-datatypes ((V!1611 0))(
  ( (V!1612 (val!696 Int)) )
))
(declare-datatypes ((ValueCell!470 0))(
  ( (ValueCellFull!470 (v!1785 V!1611)) (EmptyCell!470) )
))
(declare-datatypes ((array!1907 0))(
  ( (array!1908 (arr!907 (Array (_ BitVec 32) ValueCell!470)) (size!1008 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1907)

(declare-fun e!19399 () Bool)

(declare-fun array_inv!635 (array!1907) Bool)

(assert (=> start!4080 (and (array_inv!635 _values!1501) e!19399)))

(declare-datatypes ((array!1909 0))(
  ( (array!1910 (arr!908 (Array (_ BitVec 32) (_ BitVec 64))) (size!1009 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1909)

(declare-fun array_inv!636 (array!1909) Bool)

(assert (=> start!4080 (array_inv!636 _keys!1833)))

(declare-fun tp_is_empty!1339 () Bool)

(assert (=> start!4080 tp_is_empty!1339))

(declare-fun mapNonEmpty!1537 () Bool)

(declare-fun tp!4374 () Bool)

(declare-fun e!19398 () Bool)

(assert (=> mapNonEmpty!1537 (= mapRes!1537 (and tp!4374 e!19398))))

(declare-fun mapRest!1537 () (Array (_ BitVec 32) ValueCell!470))

(declare-fun mapKey!1537 () (_ BitVec 32))

(declare-fun mapValue!1537 () ValueCell!470)

(assert (=> mapNonEmpty!1537 (= (arr!907 _values!1501) (store mapRest!1537 mapKey!1537 mapValue!1537))))

(declare-fun b!30165 () Bool)

(declare-fun res!18154 () Bool)

(assert (=> b!30165 (=> (not res!18154) (not e!19396))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1909 (_ BitVec 32)) Bool)

(assert (=> b!30165 (= res!18154 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!30166 () Bool)

(declare-fun e!19397 () Bool)

(assert (=> b!30166 (= e!19397 tp_is_empty!1339)))

(declare-fun b!30167 () Bool)

(declare-fun res!18150 () Bool)

(assert (=> b!30167 (=> (not res!18150) (not e!19396))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1611)

(declare-fun minValue!1443 () V!1611)

(declare-datatypes ((tuple2!1152 0))(
  ( (tuple2!1153 (_1!587 (_ BitVec 64)) (_2!587 V!1611)) )
))
(declare-datatypes ((List!748 0))(
  ( (Nil!745) (Cons!744 (h!1311 tuple2!1152) (t!3441 List!748)) )
))
(declare-datatypes ((ListLongMap!729 0))(
  ( (ListLongMap!730 (toList!380 List!748)) )
))
(declare-fun contains!320 (ListLongMap!729 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!208 (array!1909 array!1907 (_ BitVec 32) (_ BitVec 32) V!1611 V!1611 (_ BitVec 32) Int) ListLongMap!729)

(assert (=> b!30167 (= res!18150 (not (contains!320 (getCurrentListMap!208 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun b!30168 () Bool)

(declare-fun res!18152 () Bool)

(assert (=> b!30168 (=> (not res!18152) (not e!19396))))

(assert (=> b!30168 (= res!18152 (and (= (size!1008 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1009 _keys!1833) (size!1008 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!30169 () Bool)

(assert (=> b!30169 (= e!19399 (and e!19397 mapRes!1537))))

(declare-fun condMapEmpty!1537 () Bool)

(declare-fun mapDefault!1537 () ValueCell!470)

