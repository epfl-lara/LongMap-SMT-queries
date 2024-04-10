; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82020 () Bool)

(assert start!82020)

(declare-fun b_free!18443 () Bool)

(declare-fun b_next!18443 () Bool)

(assert (=> start!82020 (= b_free!18443 (not b_next!18443))))

(declare-fun tp!64136 () Bool)

(declare-fun b_and!29929 () Bool)

(assert (=> start!82020 (= tp!64136 b_and!29929)))

(declare-fun b!956587 () Bool)

(declare-fun res!640491 () Bool)

(declare-fun e!539053 () Bool)

(assert (=> b!956587 (=> (not res!640491) (not e!539053))))

(declare-datatypes ((array!58215 0))(
  ( (array!58216 (arr!27987 (Array (_ BitVec 32) (_ BitVec 64))) (size!28466 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58215)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58215 (_ BitVec 32)) Bool)

(assert (=> b!956587 (= res!640491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!956588 () Bool)

(declare-fun e!539049 () Bool)

(declare-fun tp_is_empty!21059 () Bool)

(assert (=> b!956588 (= e!539049 tp_is_empty!21059)))

(declare-fun b!956589 () Bool)

(declare-fun res!640487 () Bool)

(assert (=> b!956589 (=> (not res!640487) (not e!539053))))

(declare-fun i!735 () (_ BitVec 32))

(assert (=> b!956589 (= res!640487 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28466 _keys!1441))))))

(declare-fun b!956590 () Bool)

(declare-fun res!640490 () Bool)

(assert (=> b!956590 (=> (not res!640490) (not e!539053))))

(declare-datatypes ((List!19489 0))(
  ( (Nil!19486) (Cons!19485 (h!20647 (_ BitVec 64)) (t!27850 List!19489)) )
))
(declare-fun arrayNoDuplicates!0 (array!58215 (_ BitVec 32) List!19489) Bool)

(assert (=> b!956590 (= res!640490 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19486))))

(declare-fun mapIsEmpty!33550 () Bool)

(declare-fun mapRes!33550 () Bool)

(assert (=> mapIsEmpty!33550 mapRes!33550))

(declare-fun b!956591 () Bool)

(declare-fun e!539050 () Bool)

(assert (=> b!956591 (= e!539050 tp_is_empty!21059)))

(declare-fun b!956592 () Bool)

(declare-fun res!640489 () Bool)

(assert (=> b!956592 (=> (not res!640489) (not e!539053))))

(declare-datatypes ((V!33061 0))(
  ( (V!33062 (val!10580 Int)) )
))
(declare-datatypes ((ValueCell!10048 0))(
  ( (ValueCellFull!10048 (v!13135 V!33061)) (EmptyCell!10048) )
))
(declare-datatypes ((array!58217 0))(
  ( (array!58218 (arr!27988 (Array (_ BitVec 32) ValueCell!10048)) (size!28467 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58217)

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!956592 (= res!640489 (and (= (size!28467 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28466 _keys!1441) (size!28467 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun res!640488 () Bool)

(assert (=> start!82020 (=> (not res!640488) (not e!539053))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82020 (= res!640488 (validMask!0 mask!1823))))

(assert (=> start!82020 e!539053))

(assert (=> start!82020 true))

(assert (=> start!82020 tp_is_empty!21059))

(declare-fun array_inv!21713 (array!58215) Bool)

(assert (=> start!82020 (array_inv!21713 _keys!1441)))

(declare-fun e!539052 () Bool)

(declare-fun array_inv!21714 (array!58217) Bool)

(assert (=> start!82020 (and (array_inv!21714 _values!1197) e!539052)))

(assert (=> start!82020 tp!64136))

(declare-fun b!956593 () Bool)

(declare-fun res!640486 () Bool)

(assert (=> b!956593 (=> (not res!640486) (not e!539053))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!956593 (= res!640486 (validKeyInArray!0 (select (arr!27987 _keys!1441) i!735)))))

(declare-fun zeroValue!1139 () V!33061)

(declare-fun b!956594 () Bool)

(declare-fun minValue!1139 () V!33061)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13690 0))(
  ( (tuple2!13691 (_1!6856 (_ BitVec 64)) (_2!6856 V!33061)) )
))
(declare-datatypes ((List!19490 0))(
  ( (Nil!19487) (Cons!19486 (h!20648 tuple2!13690) (t!27851 List!19490)) )
))
(declare-datatypes ((ListLongMap!12387 0))(
  ( (ListLongMap!12388 (toList!6209 List!19490)) )
))
(declare-fun contains!5307 (ListLongMap!12387 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3442 (array!58215 array!58217 (_ BitVec 32) (_ BitVec 32) V!33061 V!33061 (_ BitVec 32) Int) ListLongMap!12387)

(assert (=> b!956594 (= e!539053 (not (contains!5307 (getCurrentListMap!3442 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27987 _keys!1441) i!735))))))

(declare-fun mapNonEmpty!33550 () Bool)

(declare-fun tp!64137 () Bool)

(assert (=> mapNonEmpty!33550 (= mapRes!33550 (and tp!64137 e!539049))))

(declare-fun mapValue!33550 () ValueCell!10048)

(declare-fun mapRest!33550 () (Array (_ BitVec 32) ValueCell!10048))

(declare-fun mapKey!33550 () (_ BitVec 32))

(assert (=> mapNonEmpty!33550 (= (arr!27988 _values!1197) (store mapRest!33550 mapKey!33550 mapValue!33550))))

(declare-fun b!956595 () Bool)

(assert (=> b!956595 (= e!539052 (and e!539050 mapRes!33550))))

(declare-fun condMapEmpty!33550 () Bool)

(declare-fun mapDefault!33550 () ValueCell!10048)

