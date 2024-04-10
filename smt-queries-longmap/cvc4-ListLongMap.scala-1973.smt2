; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34704 () Bool)

(assert start!34704)

(declare-fun b_free!7511 () Bool)

(declare-fun b_next!7511 () Bool)

(assert (=> start!34704 (= b_free!7511 (not b_next!7511))))

(declare-fun tp!26096 () Bool)

(declare-fun b_and!14731 () Bool)

(assert (=> start!34704 (= tp!26096 b_and!14731)))

(declare-fun res!191901 () Bool)

(declare-fun e!212561 () Bool)

(assert (=> start!34704 (=> (not res!191901) (not e!212561))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34704 (= res!191901 (validMask!0 mask!2385))))

(assert (=> start!34704 e!212561))

(assert (=> start!34704 true))

(declare-fun tp_is_empty!7463 () Bool)

(assert (=> start!34704 tp_is_empty!7463))

(assert (=> start!34704 tp!26096))

(declare-datatypes ((V!10927 0))(
  ( (V!10928 (val!3776 Int)) )
))
(declare-datatypes ((ValueCell!3388 0))(
  ( (ValueCellFull!3388 (v!5958 V!10927)) (EmptyCell!3388) )
))
(declare-datatypes ((array!18519 0))(
  ( (array!18520 (arr!8770 (Array (_ BitVec 32) ValueCell!3388)) (size!9122 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18519)

(declare-fun e!212557 () Bool)

(declare-fun array_inv!6498 (array!18519) Bool)

(assert (=> start!34704 (and (array_inv!6498 _values!1525) e!212557)))

(declare-datatypes ((array!18521 0))(
  ( (array!18522 (arr!8771 (Array (_ BitVec 32) (_ BitVec 64))) (size!9123 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18521)

(declare-fun array_inv!6499 (array!18521) Bool)

(assert (=> start!34704 (array_inv!6499 _keys!1895)))

(declare-fun mapIsEmpty!12651 () Bool)

(declare-fun mapRes!12651 () Bool)

(assert (=> mapIsEmpty!12651 mapRes!12651))

(declare-fun mapNonEmpty!12651 () Bool)

(declare-fun tp!26097 () Bool)

(declare-fun e!212562 () Bool)

(assert (=> mapNonEmpty!12651 (= mapRes!12651 (and tp!26097 e!212562))))

(declare-fun mapKey!12651 () (_ BitVec 32))

(declare-fun mapValue!12651 () ValueCell!3388)

(declare-fun mapRest!12651 () (Array (_ BitVec 32) ValueCell!3388))

(assert (=> mapNonEmpty!12651 (= (arr!8770 _values!1525) (store mapRest!12651 mapKey!12651 mapValue!12651))))

(declare-fun b!346847 () Bool)

(declare-fun e!212558 () Bool)

(assert (=> b!346847 (= e!212558 (not true))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18521 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!346847 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((SeekEntryResult!3384 0))(
  ( (MissingZero!3384 (index!15715 (_ BitVec 32))) (Found!3384 (index!15716 (_ BitVec 32))) (Intermediate!3384 (undefined!4196 Bool) (index!15717 (_ BitVec 32)) (x!34550 (_ BitVec 32))) (Undefined!3384) (MissingVacant!3384 (index!15718 (_ BitVec 32))) )
))
(declare-fun lt!163444 () SeekEntryResult!3384)

(declare-datatypes ((Unit!10769 0))(
  ( (Unit!10770) )
))
(declare-fun lt!163443 () Unit!10769)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18521 (_ BitVec 64) (_ BitVec 32)) Unit!10769)

(assert (=> b!346847 (= lt!163443 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k!1348 (index!15716 lt!163444)))))

(declare-fun b!346848 () Bool)

(declare-fun res!191904 () Bool)

(assert (=> b!346848 (=> (not res!191904) (not e!212561))))

(declare-datatypes ((List!5088 0))(
  ( (Nil!5085) (Cons!5084 (h!5940 (_ BitVec 64)) (t!10216 List!5088)) )
))
(declare-fun arrayNoDuplicates!0 (array!18521 (_ BitVec 32) List!5088) Bool)

(assert (=> b!346848 (= res!191904 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5085))))

(declare-fun b!346849 () Bool)

(declare-fun res!191906 () Bool)

(assert (=> b!346849 (=> (not res!191906) (not e!212558))))

(assert (=> b!346849 (= res!191906 (arrayContainsKey!0 _keys!1895 k!1348 (index!15716 lt!163444)))))

(declare-fun b!346850 () Bool)

(assert (=> b!346850 (= e!212562 tp_is_empty!7463)))

(declare-fun b!346851 () Bool)

(declare-fun res!191905 () Bool)

(assert (=> b!346851 (=> (not res!191905) (not e!212561))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!346851 (= res!191905 (and (= (size!9122 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9123 _keys!1895) (size!9122 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!346852 () Bool)

(declare-fun res!191900 () Bool)

(assert (=> b!346852 (=> (not res!191900) (not e!212561))))

(declare-fun zeroValue!1467 () V!10927)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10927)

(declare-datatypes ((tuple2!5466 0))(
  ( (tuple2!5467 (_1!2744 (_ BitVec 64)) (_2!2744 V!10927)) )
))
(declare-datatypes ((List!5089 0))(
  ( (Nil!5086) (Cons!5085 (h!5941 tuple2!5466) (t!10217 List!5089)) )
))
(declare-datatypes ((ListLongMap!4379 0))(
  ( (ListLongMap!4380 (toList!2205 List!5089)) )
))
(declare-fun contains!2269 (ListLongMap!4379 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1726 (array!18521 array!18519 (_ BitVec 32) (_ BitVec 32) V!10927 V!10927 (_ BitVec 32) Int) ListLongMap!4379)

(assert (=> b!346852 (= res!191900 (not (contains!2269 (getCurrentListMap!1726 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!346853 () Bool)

(declare-fun e!212560 () Bool)

(assert (=> b!346853 (= e!212560 tp_is_empty!7463)))

(declare-fun b!346854 () Bool)

(declare-fun res!191903 () Bool)

(assert (=> b!346854 (=> (not res!191903) (not e!212561))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!346854 (= res!191903 (validKeyInArray!0 k!1348))))

(declare-fun b!346855 () Bool)

(assert (=> b!346855 (= e!212557 (and e!212560 mapRes!12651))))

(declare-fun condMapEmpty!12651 () Bool)

(declare-fun mapDefault!12651 () ValueCell!3388)

