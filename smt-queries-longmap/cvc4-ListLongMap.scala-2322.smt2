; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37398 () Bool)

(assert start!37398)

(declare-fun b_free!8525 () Bool)

(declare-fun b_next!8525 () Bool)

(assert (=> start!37398 (= b_free!8525 (not b_next!8525))))

(declare-fun tp!30291 () Bool)

(declare-fun b_and!15767 () Bool)

(assert (=> start!37398 (= tp!30291 b_and!15767)))

(declare-fun b!380265 () Bool)

(declare-fun e!231298 () Bool)

(declare-fun e!231300 () Bool)

(assert (=> b!380265 (= e!231298 e!231300)))

(declare-fun res!215808 () Bool)

(assert (=> b!380265 (=> (not res!215808) (not e!231300))))

(declare-datatypes ((array!22265 0))(
  ( (array!22266 (arr!10601 (Array (_ BitVec 32) (_ BitVec 64))) (size!10953 (_ BitVec 32))) )
))
(declare-fun lt!177905 () array!22265)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22265 (_ BitVec 32)) Bool)

(assert (=> b!380265 (= res!215808 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!177905 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!22265)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!380265 (= lt!177905 (array!22266 (store (arr!10601 _keys!658) i!548 k!778) (size!10953 _keys!658)))))

(declare-fun b!380266 () Bool)

(declare-fun e!231295 () Bool)

(assert (=> b!380266 (= e!231300 (not e!231295))))

(declare-fun res!215813 () Bool)

(assert (=> b!380266 (=> res!215813 e!231295)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!380266 (= res!215813 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!13335 0))(
  ( (V!13336 (val!4631 Int)) )
))
(declare-datatypes ((tuple2!6206 0))(
  ( (tuple2!6207 (_1!3114 (_ BitVec 64)) (_2!3114 V!13335)) )
))
(declare-datatypes ((List!6041 0))(
  ( (Nil!6038) (Cons!6037 (h!6893 tuple2!6206) (t!11191 List!6041)) )
))
(declare-datatypes ((ListLongMap!5119 0))(
  ( (ListLongMap!5120 (toList!2575 List!6041)) )
))
(declare-fun lt!177900 () ListLongMap!5119)

(declare-datatypes ((ValueCell!4243 0))(
  ( (ValueCellFull!4243 (v!6828 V!13335)) (EmptyCell!4243) )
))
(declare-datatypes ((array!22267 0))(
  ( (array!22268 (arr!10602 (Array (_ BitVec 32) ValueCell!4243)) (size!10954 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22267)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13335)

(declare-fun minValue!472 () V!13335)

(declare-fun getCurrentListMap!1991 (array!22265 array!22267 (_ BitVec 32) (_ BitVec 32) V!13335 V!13335 (_ BitVec 32) Int) ListLongMap!5119)

(assert (=> b!380266 (= lt!177900 (getCurrentListMap!1991 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177909 () array!22267)

(declare-fun lt!177903 () ListLongMap!5119)

(assert (=> b!380266 (= lt!177903 (getCurrentListMap!1991 lt!177905 lt!177909 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177910 () ListLongMap!5119)

(declare-fun lt!177902 () ListLongMap!5119)

(assert (=> b!380266 (and (= lt!177910 lt!177902) (= lt!177902 lt!177910))))

(declare-fun lt!177907 () ListLongMap!5119)

(declare-fun lt!177911 () tuple2!6206)

(declare-fun +!921 (ListLongMap!5119 tuple2!6206) ListLongMap!5119)

(assert (=> b!380266 (= lt!177902 (+!921 lt!177907 lt!177911))))

(declare-fun v!373 () V!13335)

(assert (=> b!380266 (= lt!177911 (tuple2!6207 k!778 v!373))))

(declare-datatypes ((Unit!11736 0))(
  ( (Unit!11737) )
))
(declare-fun lt!177901 () Unit!11736)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!149 (array!22265 array!22267 (_ BitVec 32) (_ BitVec 32) V!13335 V!13335 (_ BitVec 32) (_ BitVec 64) V!13335 (_ BitVec 32) Int) Unit!11736)

(assert (=> b!380266 (= lt!177901 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!149 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!825 (array!22265 array!22267 (_ BitVec 32) (_ BitVec 32) V!13335 V!13335 (_ BitVec 32) Int) ListLongMap!5119)

(assert (=> b!380266 (= lt!177910 (getCurrentListMapNoExtraKeys!825 lt!177905 lt!177909 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!380266 (= lt!177909 (array!22268 (store (arr!10602 _values!506) i!548 (ValueCellFull!4243 v!373)) (size!10954 _values!506)))))

(assert (=> b!380266 (= lt!177907 (getCurrentListMapNoExtraKeys!825 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!15324 () Bool)

(declare-fun mapRes!15324 () Bool)

(declare-fun tp!30290 () Bool)

(declare-fun e!231297 () Bool)

(assert (=> mapNonEmpty!15324 (= mapRes!15324 (and tp!30290 e!231297))))

(declare-fun mapRest!15324 () (Array (_ BitVec 32) ValueCell!4243))

(declare-fun mapKey!15324 () (_ BitVec 32))

(declare-fun mapValue!15324 () ValueCell!4243)

(assert (=> mapNonEmpty!15324 (= (arr!10602 _values!506) (store mapRest!15324 mapKey!15324 mapValue!15324))))

(declare-fun b!380267 () Bool)

(declare-fun e!231296 () Bool)

(declare-fun tp_is_empty!9173 () Bool)

(assert (=> b!380267 (= e!231296 tp_is_empty!9173)))

(declare-fun b!380269 () Bool)

(declare-fun e!231299 () Bool)

(assert (=> b!380269 (= e!231295 e!231299)))

(declare-fun res!215809 () Bool)

(assert (=> b!380269 (=> res!215809 e!231299)))

(assert (=> b!380269 (= res!215809 (= k!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!177912 () ListLongMap!5119)

(assert (=> b!380269 (= lt!177900 lt!177912)))

(declare-fun lt!177908 () tuple2!6206)

(assert (=> b!380269 (= lt!177912 (+!921 lt!177907 lt!177908))))

(declare-fun lt!177904 () ListLongMap!5119)

(assert (=> b!380269 (= lt!177903 lt!177904)))

(assert (=> b!380269 (= lt!177904 (+!921 lt!177902 lt!177908))))

(assert (=> b!380269 (= lt!177903 (+!921 lt!177910 lt!177908))))

(assert (=> b!380269 (= lt!177908 (tuple2!6207 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!380270 () Bool)

(assert (=> b!380270 (= e!231299 true)))

(assert (=> b!380270 (= lt!177904 (+!921 lt!177912 lt!177911))))

(declare-fun lt!177906 () Unit!11736)

(declare-fun addCommutativeForDiffKeys!318 (ListLongMap!5119 (_ BitVec 64) V!13335 (_ BitVec 64) V!13335) Unit!11736)

(assert (=> b!380270 (= lt!177906 (addCommutativeForDiffKeys!318 lt!177907 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!380271 () Bool)

(declare-fun res!215812 () Bool)

(assert (=> b!380271 (=> (not res!215812) (not e!231298))))

(assert (=> b!380271 (= res!215812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!380272 () Bool)

(declare-fun res!215811 () Bool)

(assert (=> b!380272 (=> (not res!215811) (not e!231298))))

(assert (=> b!380272 (= res!215811 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10953 _keys!658))))))

(declare-fun b!380273 () Bool)

(declare-fun res!215814 () Bool)

(assert (=> b!380273 (=> (not res!215814) (not e!231298))))

(declare-fun arrayContainsKey!0 (array!22265 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!380273 (= res!215814 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!380274 () Bool)

(declare-fun res!215817 () Bool)

(assert (=> b!380274 (=> (not res!215817) (not e!231298))))

(assert (=> b!380274 (= res!215817 (or (= (select (arr!10601 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10601 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!215816 () Bool)

(assert (=> start!37398 (=> (not res!215816) (not e!231298))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37398 (= res!215816 (validMask!0 mask!970))))

(assert (=> start!37398 e!231298))

(declare-fun e!231302 () Bool)

(declare-fun array_inv!7804 (array!22267) Bool)

(assert (=> start!37398 (and (array_inv!7804 _values!506) e!231302)))

(assert (=> start!37398 tp!30291))

(assert (=> start!37398 true))

(assert (=> start!37398 tp_is_empty!9173))

(declare-fun array_inv!7805 (array!22265) Bool)

(assert (=> start!37398 (array_inv!7805 _keys!658)))

(declare-fun b!380268 () Bool)

(declare-fun res!215815 () Bool)

(assert (=> b!380268 (=> (not res!215815) (not e!231300))))

(declare-datatypes ((List!6042 0))(
  ( (Nil!6039) (Cons!6038 (h!6894 (_ BitVec 64)) (t!11192 List!6042)) )
))
(declare-fun arrayNoDuplicates!0 (array!22265 (_ BitVec 32) List!6042) Bool)

(assert (=> b!380268 (= res!215815 (arrayNoDuplicates!0 lt!177905 #b00000000000000000000000000000000 Nil!6039))))

(declare-fun b!380275 () Bool)

(assert (=> b!380275 (= e!231297 tp_is_empty!9173)))

(declare-fun b!380276 () Bool)

(assert (=> b!380276 (= e!231302 (and e!231296 mapRes!15324))))

(declare-fun condMapEmpty!15324 () Bool)

(declare-fun mapDefault!15324 () ValueCell!4243)

