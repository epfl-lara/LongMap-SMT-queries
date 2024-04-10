; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37400 () Bool)

(assert start!37400)

(declare-fun b_free!8527 () Bool)

(declare-fun b_next!8527 () Bool)

(assert (=> start!37400 (= b_free!8527 (not b_next!8527))))

(declare-fun tp!30297 () Bool)

(declare-fun b_and!15769 () Bool)

(assert (=> start!37400 (= tp!30297 b_and!15769)))

(declare-fun b!380310 () Bool)

(declare-fun e!231320 () Bool)

(declare-fun tp_is_empty!9175 () Bool)

(assert (=> b!380310 (= e!231320 tp_is_empty!9175)))

(declare-fun b!380311 () Bool)

(declare-fun e!231326 () Bool)

(declare-fun e!231319 () Bool)

(assert (=> b!380311 (= e!231326 (not e!231319))))

(declare-fun res!215847 () Bool)

(assert (=> b!380311 (=> res!215847 e!231319)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!380311 (= res!215847 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!13339 0))(
  ( (V!13340 (val!4632 Int)) )
))
(declare-datatypes ((ValueCell!4244 0))(
  ( (ValueCellFull!4244 (v!6829 V!13339)) (EmptyCell!4244) )
))
(declare-datatypes ((array!22269 0))(
  ( (array!22270 (arr!10603 (Array (_ BitVec 32) ValueCell!4244)) (size!10955 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22269)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13339)

(declare-datatypes ((array!22271 0))(
  ( (array!22272 (arr!10604 (Array (_ BitVec 32) (_ BitVec 64))) (size!10956 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22271)

(declare-datatypes ((tuple2!6208 0))(
  ( (tuple2!6209 (_1!3115 (_ BitVec 64)) (_2!3115 V!13339)) )
))
(declare-datatypes ((List!6043 0))(
  ( (Nil!6040) (Cons!6039 (h!6895 tuple2!6208) (t!11193 List!6043)) )
))
(declare-datatypes ((ListLongMap!5121 0))(
  ( (ListLongMap!5122 (toList!2576 List!6043)) )
))
(declare-fun lt!177949 () ListLongMap!5121)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13339)

(declare-fun getCurrentListMap!1992 (array!22271 array!22269 (_ BitVec 32) (_ BitVec 32) V!13339 V!13339 (_ BitVec 32) Int) ListLongMap!5121)

(assert (=> b!380311 (= lt!177949 (getCurrentListMap!1992 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177945 () array!22269)

(declare-fun lt!177942 () ListLongMap!5121)

(declare-fun lt!177940 () array!22271)

(assert (=> b!380311 (= lt!177942 (getCurrentListMap!1992 lt!177940 lt!177945 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177943 () ListLongMap!5121)

(declare-fun lt!177939 () ListLongMap!5121)

(assert (=> b!380311 (and (= lt!177943 lt!177939) (= lt!177939 lt!177943))))

(declare-fun lt!177948 () ListLongMap!5121)

(declare-fun lt!177950 () tuple2!6208)

(declare-fun +!922 (ListLongMap!5121 tuple2!6208) ListLongMap!5121)

(assert (=> b!380311 (= lt!177939 (+!922 lt!177948 lt!177950))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun v!373 () V!13339)

(assert (=> b!380311 (= lt!177950 (tuple2!6209 k!778 v!373))))

(declare-datatypes ((Unit!11738 0))(
  ( (Unit!11739) )
))
(declare-fun lt!177951 () Unit!11738)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!150 (array!22271 array!22269 (_ BitVec 32) (_ BitVec 32) V!13339 V!13339 (_ BitVec 32) (_ BitVec 64) V!13339 (_ BitVec 32) Int) Unit!11738)

(assert (=> b!380311 (= lt!177951 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!150 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!826 (array!22271 array!22269 (_ BitVec 32) (_ BitVec 32) V!13339 V!13339 (_ BitVec 32) Int) ListLongMap!5121)

(assert (=> b!380311 (= lt!177943 (getCurrentListMapNoExtraKeys!826 lt!177940 lt!177945 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!380311 (= lt!177945 (array!22270 (store (arr!10603 _values!506) i!548 (ValueCellFull!4244 v!373)) (size!10955 _values!506)))))

(assert (=> b!380311 (= lt!177948 (getCurrentListMapNoExtraKeys!826 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!380312 () Bool)

(declare-fun res!215852 () Bool)

(declare-fun e!231322 () Bool)

(assert (=> b!380312 (=> (not res!215852) (not e!231322))))

(assert (=> b!380312 (= res!215852 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10956 _keys!658))))))

(declare-fun b!380313 () Bool)

(declare-fun res!215851 () Bool)

(assert (=> b!380313 (=> (not res!215851) (not e!231322))))

(assert (=> b!380313 (= res!215851 (or (= (select (arr!10604 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10604 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!380314 () Bool)

(declare-fun res!215853 () Bool)

(assert (=> b!380314 (=> (not res!215853) (not e!231322))))

(declare-fun arrayContainsKey!0 (array!22271 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!380314 (= res!215853 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!380315 () Bool)

(declare-fun res!215845 () Bool)

(assert (=> b!380315 (=> (not res!215845) (not e!231326))))

(declare-datatypes ((List!6044 0))(
  ( (Nil!6041) (Cons!6040 (h!6896 (_ BitVec 64)) (t!11194 List!6044)) )
))
(declare-fun arrayNoDuplicates!0 (array!22271 (_ BitVec 32) List!6044) Bool)

(assert (=> b!380315 (= res!215845 (arrayNoDuplicates!0 lt!177940 #b00000000000000000000000000000000 Nil!6041))))

(declare-fun res!215849 () Bool)

(assert (=> start!37400 (=> (not res!215849) (not e!231322))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37400 (= res!215849 (validMask!0 mask!970))))

(assert (=> start!37400 e!231322))

(declare-fun e!231321 () Bool)

(declare-fun array_inv!7806 (array!22269) Bool)

(assert (=> start!37400 (and (array_inv!7806 _values!506) e!231321)))

(assert (=> start!37400 tp!30297))

(assert (=> start!37400 true))

(assert (=> start!37400 tp_is_empty!9175))

(declare-fun array_inv!7807 (array!22271) Bool)

(assert (=> start!37400 (array_inv!7807 _keys!658)))

(declare-fun b!380316 () Bool)

(declare-fun res!215844 () Bool)

(assert (=> b!380316 (=> (not res!215844) (not e!231322))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22271 (_ BitVec 32)) Bool)

(assert (=> b!380316 (= res!215844 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!380317 () Bool)

(declare-fun res!215850 () Bool)

(assert (=> b!380317 (=> (not res!215850) (not e!231322))))

(assert (=> b!380317 (= res!215850 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6041))))

(declare-fun b!380318 () Bool)

(declare-fun res!215846 () Bool)

(assert (=> b!380318 (=> (not res!215846) (not e!231322))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!380318 (= res!215846 (validKeyInArray!0 k!778))))

(declare-fun b!380319 () Bool)

(declare-fun e!231324 () Bool)

(assert (=> b!380319 (= e!231324 true)))

(declare-fun lt!177944 () ListLongMap!5121)

(declare-fun lt!177941 () ListLongMap!5121)

(assert (=> b!380319 (= lt!177944 (+!922 lt!177941 lt!177950))))

(declare-fun lt!177946 () Unit!11738)

(declare-fun addCommutativeForDiffKeys!319 (ListLongMap!5121 (_ BitVec 64) V!13339 (_ BitVec 64) V!13339) Unit!11738)

(assert (=> b!380319 (= lt!177946 (addCommutativeForDiffKeys!319 lt!177948 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!380320 () Bool)

(assert (=> b!380320 (= e!231322 e!231326)))

(declare-fun res!215855 () Bool)

(assert (=> b!380320 (=> (not res!215855) (not e!231326))))

(assert (=> b!380320 (= res!215855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!177940 mask!970))))

(assert (=> b!380320 (= lt!177940 (array!22272 (store (arr!10604 _keys!658) i!548 k!778) (size!10956 _keys!658)))))

(declare-fun b!380321 () Bool)

(assert (=> b!380321 (= e!231319 e!231324)))

(declare-fun res!215848 () Bool)

(assert (=> b!380321 (=> res!215848 e!231324)))

(assert (=> b!380321 (= res!215848 (= k!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!380321 (= lt!177949 lt!177941)))

(declare-fun lt!177947 () tuple2!6208)

(assert (=> b!380321 (= lt!177941 (+!922 lt!177948 lt!177947))))

(assert (=> b!380321 (= lt!177942 lt!177944)))

(assert (=> b!380321 (= lt!177944 (+!922 lt!177939 lt!177947))))

(assert (=> b!380321 (= lt!177942 (+!922 lt!177943 lt!177947))))

(assert (=> b!380321 (= lt!177947 (tuple2!6209 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun mapNonEmpty!15327 () Bool)

(declare-fun mapRes!15327 () Bool)

(declare-fun tp!30296 () Bool)

(assert (=> mapNonEmpty!15327 (= mapRes!15327 (and tp!30296 e!231320))))

(declare-fun mapRest!15327 () (Array (_ BitVec 32) ValueCell!4244))

(declare-fun mapKey!15327 () (_ BitVec 32))

(declare-fun mapValue!15327 () ValueCell!4244)

(assert (=> mapNonEmpty!15327 (= (arr!10603 _values!506) (store mapRest!15327 mapKey!15327 mapValue!15327))))

(declare-fun b!380322 () Bool)

(declare-fun e!231325 () Bool)

(assert (=> b!380322 (= e!231325 tp_is_empty!9175)))

(declare-fun b!380323 () Bool)

(declare-fun res!215854 () Bool)

(assert (=> b!380323 (=> (not res!215854) (not e!231322))))

(assert (=> b!380323 (= res!215854 (and (= (size!10955 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10956 _keys!658) (size!10955 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!380324 () Bool)

(assert (=> b!380324 (= e!231321 (and e!231325 mapRes!15327))))

(declare-fun condMapEmpty!15327 () Bool)

(declare-fun mapDefault!15327 () ValueCell!4244)

