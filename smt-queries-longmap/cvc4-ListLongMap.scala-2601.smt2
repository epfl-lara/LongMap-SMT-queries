; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39428 () Bool)

(assert start!39428)

(declare-fun b_free!9695 () Bool)

(declare-fun b_next!9695 () Bool)

(assert (=> start!39428 (= b_free!9695 (not b_next!9695))))

(declare-fun tp!34614 () Bool)

(declare-fun b_and!17265 () Bool)

(assert (=> start!39428 (= tp!34614 b_and!17265)))

(declare-fun b!419790 () Bool)

(declare-fun res!244791 () Bool)

(declare-fun e!250138 () Bool)

(assert (=> b!419790 (=> (not res!244791) (not e!250138))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!419790 (= res!244791 (validMask!0 mask!1025))))

(declare-fun b!419791 () Bool)

(declare-fun res!244779 () Bool)

(assert (=> b!419791 (=> (not res!244779) (not e!250138))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!25543 0))(
  ( (array!25544 (arr!12221 (Array (_ BitVec 32) (_ BitVec 64))) (size!12573 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25543)

(assert (=> b!419791 (= res!244779 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12573 _keys!709))))))

(declare-fun mapNonEmpty!17892 () Bool)

(declare-fun mapRes!17892 () Bool)

(declare-fun tp!34613 () Bool)

(declare-fun e!250133 () Bool)

(assert (=> mapNonEmpty!17892 (= mapRes!17892 (and tp!34613 e!250133))))

(declare-datatypes ((V!15567 0))(
  ( (V!15568 (val!5468 Int)) )
))
(declare-datatypes ((ValueCell!5080 0))(
  ( (ValueCellFull!5080 (v!7715 V!15567)) (EmptyCell!5080) )
))
(declare-fun mapRest!17892 () (Array (_ BitVec 32) ValueCell!5080))

(declare-datatypes ((array!25545 0))(
  ( (array!25546 (arr!12222 (Array (_ BitVec 32) ValueCell!5080)) (size!12574 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25545)

(declare-fun mapKey!17892 () (_ BitVec 32))

(declare-fun mapValue!17892 () ValueCell!5080)

(assert (=> mapNonEmpty!17892 (= (arr!12222 _values!549) (store mapRest!17892 mapKey!17892 mapValue!17892))))

(declare-fun bm!29260 () Bool)

(declare-fun minValue!515 () V!15567)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15567)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!7160 0))(
  ( (tuple2!7161 (_1!3591 (_ BitVec 64)) (_2!3591 V!15567)) )
))
(declare-datatypes ((List!7168 0))(
  ( (Nil!7165) (Cons!7164 (h!8020 tuple2!7160) (t!12528 List!7168)) )
))
(declare-datatypes ((ListLongMap!6073 0))(
  ( (ListLongMap!6074 (toList!3052 List!7168)) )
))
(declare-fun call!29264 () ListLongMap!6073)

(declare-fun lt!192546 () array!25545)

(declare-fun lt!192551 () array!25543)

(declare-fun c!55256 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1257 (array!25543 array!25545 (_ BitVec 32) (_ BitVec 32) V!15567 V!15567 (_ BitVec 32) Int) ListLongMap!6073)

(assert (=> bm!29260 (= call!29264 (getCurrentListMapNoExtraKeys!1257 (ite c!55256 _keys!709 lt!192551) (ite c!55256 _values!549 lt!192546) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419792 () Bool)

(declare-fun e!250136 () Bool)

(declare-fun tp_is_empty!10847 () Bool)

(assert (=> b!419792 (= e!250136 tp_is_empty!10847)))

(declare-fun b!419793 () Bool)

(declare-fun res!244783 () Bool)

(declare-fun e!250135 () Bool)

(assert (=> b!419793 (=> (not res!244783) (not e!250135))))

(declare-datatypes ((List!7169 0))(
  ( (Nil!7166) (Cons!7165 (h!8021 (_ BitVec 64)) (t!12529 List!7169)) )
))
(declare-fun arrayNoDuplicates!0 (array!25543 (_ BitVec 32) List!7169) Bool)

(assert (=> b!419793 (= res!244783 (arrayNoDuplicates!0 lt!192551 #b00000000000000000000000000000000 Nil!7166))))

(declare-fun res!244780 () Bool)

(assert (=> start!39428 (=> (not res!244780) (not e!250138))))

(assert (=> start!39428 (= res!244780 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12573 _keys!709))))))

(assert (=> start!39428 e!250138))

(assert (=> start!39428 tp_is_empty!10847))

(assert (=> start!39428 tp!34614))

(assert (=> start!39428 true))

(declare-fun e!250134 () Bool)

(declare-fun array_inv!8912 (array!25545) Bool)

(assert (=> start!39428 (and (array_inv!8912 _values!549) e!250134)))

(declare-fun array_inv!8913 (array!25543) Bool)

(assert (=> start!39428 (array_inv!8913 _keys!709)))

(declare-fun b!419794 () Bool)

(declare-fun e!250139 () Bool)

(assert (=> b!419794 (= e!250135 e!250139)))

(declare-fun res!244778 () Bool)

(assert (=> b!419794 (=> (not res!244778) (not e!250139))))

(assert (=> b!419794 (= res!244778 (= from!863 i!563))))

(declare-fun lt!192550 () ListLongMap!6073)

(assert (=> b!419794 (= lt!192550 (getCurrentListMapNoExtraKeys!1257 lt!192551 lt!192546 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15567)

(assert (=> b!419794 (= lt!192546 (array!25546 (store (arr!12222 _values!549) i!563 (ValueCellFull!5080 v!412)) (size!12574 _values!549)))))

(declare-fun lt!192544 () ListLongMap!6073)

(assert (=> b!419794 (= lt!192544 (getCurrentListMapNoExtraKeys!1257 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!419795 () Bool)

(declare-fun res!244790 () Bool)

(assert (=> b!419795 (=> (not res!244790) (not e!250138))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25543 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!419795 (= res!244790 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!419796 () Bool)

(declare-fun e!250137 () Bool)

(assert (=> b!419796 (= e!250137 true)))

(declare-fun lt!192545 () ListLongMap!6073)

(declare-fun lt!192541 () tuple2!7160)

(declare-fun lt!192543 () V!15567)

(declare-fun +!1249 (ListLongMap!6073 tuple2!7160) ListLongMap!6073)

(assert (=> b!419796 (= (+!1249 lt!192545 lt!192541) (+!1249 (+!1249 lt!192545 (tuple2!7161 k!794 lt!192543)) lt!192541))))

(declare-fun lt!192549 () V!15567)

(assert (=> b!419796 (= lt!192541 (tuple2!7161 k!794 lt!192549))))

(declare-datatypes ((Unit!12404 0))(
  ( (Unit!12405) )
))
(declare-fun lt!192548 () Unit!12404)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!47 (ListLongMap!6073 (_ BitVec 64) V!15567 V!15567) Unit!12404)

(assert (=> b!419796 (= lt!192548 (addSameAsAddTwiceSameKeyDiffValues!47 lt!192545 k!794 lt!192543 lt!192549))))

(declare-fun lt!192547 () V!15567)

(declare-fun get!6063 (ValueCell!5080 V!15567) V!15567)

(assert (=> b!419796 (= lt!192543 (get!6063 (select (arr!12222 _values!549) from!863) lt!192547))))

(assert (=> b!419796 (= lt!192550 (+!1249 lt!192545 (tuple2!7161 (select (arr!12221 lt!192551) from!863) lt!192549)))))

(assert (=> b!419796 (= lt!192549 (get!6063 (select (store (arr!12222 _values!549) i!563 (ValueCellFull!5080 v!412)) from!863) lt!192547))))

(declare-fun dynLambda!718 (Int (_ BitVec 64)) V!15567)

(assert (=> b!419796 (= lt!192547 (dynLambda!718 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!419796 (= lt!192545 (getCurrentListMapNoExtraKeys!1257 lt!192551 lt!192546 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419797 () Bool)

(declare-fun e!250140 () Bool)

(declare-fun call!29263 () ListLongMap!6073)

(assert (=> b!419797 (= e!250140 (= call!29264 call!29263))))

(declare-fun b!419798 () Bool)

(assert (=> b!419798 (= e!250138 e!250135)))

(declare-fun res!244787 () Bool)

(assert (=> b!419798 (=> (not res!244787) (not e!250135))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25543 (_ BitVec 32)) Bool)

(assert (=> b!419798 (= res!244787 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!192551 mask!1025))))

(assert (=> b!419798 (= lt!192551 (array!25544 (store (arr!12221 _keys!709) i!563 k!794) (size!12573 _keys!709)))))

(declare-fun b!419799 () Bool)

(declare-fun res!244784 () Bool)

(assert (=> b!419799 (=> (not res!244784) (not e!250138))))

(assert (=> b!419799 (= res!244784 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!17892 () Bool)

(assert (=> mapIsEmpty!17892 mapRes!17892))

(declare-fun b!419800 () Bool)

(assert (=> b!419800 (= e!250133 tp_is_empty!10847)))

(declare-fun b!419801 () Bool)

(declare-fun res!244789 () Bool)

(assert (=> b!419801 (=> (not res!244789) (not e!250138))))

(assert (=> b!419801 (= res!244789 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7166))))

(declare-fun b!419802 () Bool)

(assert (=> b!419802 (= e!250139 (not e!250137))))

(declare-fun res!244782 () Bool)

(assert (=> b!419802 (=> res!244782 e!250137)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!419802 (= res!244782 (validKeyInArray!0 (select (arr!12221 _keys!709) from!863)))))

(assert (=> b!419802 e!250140))

(assert (=> b!419802 (= c!55256 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!192542 () Unit!12404)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!452 (array!25543 array!25545 (_ BitVec 32) (_ BitVec 32) V!15567 V!15567 (_ BitVec 32) (_ BitVec 64) V!15567 (_ BitVec 32) Int) Unit!12404)

(assert (=> b!419802 (= lt!192542 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!452 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419803 () Bool)

(declare-fun res!244788 () Bool)

(assert (=> b!419803 (=> (not res!244788) (not e!250138))))

(assert (=> b!419803 (= res!244788 (validKeyInArray!0 k!794))))

(declare-fun b!419804 () Bool)

(declare-fun res!244786 () Bool)

(assert (=> b!419804 (=> (not res!244786) (not e!250138))))

(assert (=> b!419804 (= res!244786 (or (= (select (arr!12221 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12221 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!29261 () Bool)

(assert (=> bm!29261 (= call!29263 (getCurrentListMapNoExtraKeys!1257 (ite c!55256 lt!192551 _keys!709) (ite c!55256 lt!192546 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419805 () Bool)

(assert (=> b!419805 (= e!250134 (and e!250136 mapRes!17892))))

(declare-fun condMapEmpty!17892 () Bool)

(declare-fun mapDefault!17892 () ValueCell!5080)

