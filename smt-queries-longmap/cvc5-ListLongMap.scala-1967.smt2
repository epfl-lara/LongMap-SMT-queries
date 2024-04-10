; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34604 () Bool)

(assert start!34604)

(declare-fun b_free!7471 () Bool)

(declare-fun b_next!7471 () Bool)

(assert (=> start!34604 (= b_free!7471 (not b_next!7471))))

(declare-fun tp!25968 () Bool)

(declare-fun b_and!14685 () Bool)

(assert (=> start!34604 (= tp!25968 b_and!14685)))

(declare-fun b!345807 () Bool)

(declare-fun e!211947 () Bool)

(declare-fun tp_is_empty!7423 () Bool)

(assert (=> b!345807 (= e!211947 tp_is_empty!7423)))

(declare-fun b!345808 () Bool)

(declare-fun res!191286 () Bool)

(declare-fun e!211949 () Bool)

(assert (=> b!345808 (=> (not res!191286) (not e!211949))))

(declare-datatypes ((array!18433 0))(
  ( (array!18434 (arr!8730 (Array (_ BitVec 32) (_ BitVec 64))) (size!9082 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18433)

(declare-datatypes ((List!5054 0))(
  ( (Nil!5051) (Cons!5050 (h!5906 (_ BitVec 64)) (t!10176 List!5054)) )
))
(declare-fun arrayNoDuplicates!0 (array!18433 (_ BitVec 32) List!5054) Bool)

(assert (=> b!345808 (= res!191286 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5051))))

(declare-fun b!345809 () Bool)

(declare-fun e!211945 () Bool)

(declare-datatypes ((SeekEntryResult!3365 0))(
  ( (MissingZero!3365 (index!15639 (_ BitVec 32))) (Found!3365 (index!15640 (_ BitVec 32))) (Intermediate!3365 (undefined!4177 Bool) (index!15641 (_ BitVec 32)) (x!34453 (_ BitVec 32))) (Undefined!3365) (MissingVacant!3365 (index!15642 (_ BitVec 32))) )
))
(declare-fun lt!163069 () SeekEntryResult!3365)

(assert (=> b!345809 (= e!211945 (bvslt (index!15640 lt!163069) #b00000000000000000000000000000000))))

(declare-fun b!345810 () Bool)

(declare-fun res!191288 () Bool)

(assert (=> b!345810 (=> (not res!191288) (not e!211949))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!10875 0))(
  ( (V!10876 (val!3756 Int)) )
))
(declare-fun zeroValue!1467 () V!10875)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3368 0))(
  ( (ValueCellFull!3368 (v!5935 V!10875)) (EmptyCell!3368) )
))
(declare-datatypes ((array!18435 0))(
  ( (array!18436 (arr!8731 (Array (_ BitVec 32) ValueCell!3368)) (size!9083 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18435)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10875)

(declare-datatypes ((tuple2!5430 0))(
  ( (tuple2!5431 (_1!2726 (_ BitVec 64)) (_2!2726 V!10875)) )
))
(declare-datatypes ((List!5055 0))(
  ( (Nil!5052) (Cons!5051 (h!5907 tuple2!5430) (t!10177 List!5055)) )
))
(declare-datatypes ((ListLongMap!4343 0))(
  ( (ListLongMap!4344 (toList!2187 List!5055)) )
))
(declare-fun contains!2248 (ListLongMap!4343 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1708 (array!18433 array!18435 (_ BitVec 32) (_ BitVec 32) V!10875 V!10875 (_ BitVec 32) Int) ListLongMap!4343)

(assert (=> b!345810 (= res!191288 (not (contains!2248 (getCurrentListMap!1708 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun mapIsEmpty!12582 () Bool)

(declare-fun mapRes!12582 () Bool)

(assert (=> mapIsEmpty!12582 mapRes!12582))

(declare-fun b!345811 () Bool)

(assert (=> b!345811 (= e!211949 e!211945)))

(declare-fun res!191287 () Bool)

(assert (=> b!345811 (=> (not res!191287) (not e!211945))))

(assert (=> b!345811 (= res!191287 (and (is-Found!3365 lt!163069) (= (select (arr!8730 _keys!1895) (index!15640 lt!163069)) k!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18433 (_ BitVec 32)) SeekEntryResult!3365)

(assert (=> b!345811 (= lt!163069 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun res!191291 () Bool)

(assert (=> start!34604 (=> (not res!191291) (not e!211949))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34604 (= res!191291 (validMask!0 mask!2385))))

(assert (=> start!34604 e!211949))

(assert (=> start!34604 true))

(assert (=> start!34604 tp_is_empty!7423))

(assert (=> start!34604 tp!25968))

(declare-fun e!211946 () Bool)

(declare-fun array_inv!6462 (array!18435) Bool)

(assert (=> start!34604 (and (array_inv!6462 _values!1525) e!211946)))

(declare-fun array_inv!6463 (array!18433) Bool)

(assert (=> start!34604 (array_inv!6463 _keys!1895)))

(declare-fun b!345806 () Bool)

(assert (=> b!345806 (= e!211946 (and e!211947 mapRes!12582))))

(declare-fun condMapEmpty!12582 () Bool)

(declare-fun mapDefault!12582 () ValueCell!3368)

