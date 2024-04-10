; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37376 () Bool)

(assert start!37376)

(declare-fun b_free!8503 () Bool)

(declare-fun b_next!8503 () Bool)

(assert (=> start!37376 (= b_free!8503 (not b_next!8503))))

(declare-fun tp!30225 () Bool)

(declare-fun b_and!15745 () Bool)

(assert (=> start!37376 (= tp!30225 b_and!15745)))

(declare-fun b!379770 () Bool)

(declare-fun res!215415 () Bool)

(declare-fun e!231038 () Bool)

(assert (=> b!379770 (=> (not res!215415) (not e!231038))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!379770 (= res!215415 (validKeyInArray!0 k!778))))

(declare-fun b!379771 () Bool)

(declare-fun e!231031 () Bool)

(declare-fun e!231037 () Bool)

(assert (=> b!379771 (= e!231031 e!231037)))

(declare-fun res!215418 () Bool)

(assert (=> b!379771 (=> res!215418 e!231037)))

(assert (=> b!379771 (= res!215418 (= k!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!13307 0))(
  ( (V!13308 (val!4620 Int)) )
))
(declare-datatypes ((tuple2!6186 0))(
  ( (tuple2!6187 (_1!3104 (_ BitVec 64)) (_2!3104 V!13307)) )
))
(declare-datatypes ((List!6021 0))(
  ( (Nil!6018) (Cons!6017 (h!6873 tuple2!6186) (t!11171 List!6021)) )
))
(declare-datatypes ((ListLongMap!5099 0))(
  ( (ListLongMap!5100 (toList!2565 List!6021)) )
))
(declare-fun lt!177479 () ListLongMap!5099)

(declare-fun lt!177478 () ListLongMap!5099)

(assert (=> b!379771 (= lt!177479 lt!177478)))

(declare-fun lt!177472 () ListLongMap!5099)

(declare-fun lt!177476 () tuple2!6186)

(declare-fun +!911 (ListLongMap!5099 tuple2!6186) ListLongMap!5099)

(assert (=> b!379771 (= lt!177478 (+!911 lt!177472 lt!177476))))

(declare-fun lt!177471 () ListLongMap!5099)

(declare-fun lt!177480 () ListLongMap!5099)

(assert (=> b!379771 (= lt!177471 lt!177480)))

(declare-fun lt!177481 () ListLongMap!5099)

(assert (=> b!379771 (= lt!177480 (+!911 lt!177481 lt!177476))))

(declare-fun lt!177477 () ListLongMap!5099)

(assert (=> b!379771 (= lt!177471 (+!911 lt!177477 lt!177476))))

(declare-fun minValue!472 () V!13307)

(assert (=> b!379771 (= lt!177476 (tuple2!6187 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!379772 () Bool)

(declare-fun e!231034 () Bool)

(declare-fun tp_is_empty!9151 () Bool)

(assert (=> b!379772 (= e!231034 tp_is_empty!9151)))

(declare-fun mapNonEmpty!15291 () Bool)

(declare-fun mapRes!15291 () Bool)

(declare-fun tp!30224 () Bool)

(assert (=> mapNonEmpty!15291 (= mapRes!15291 (and tp!30224 e!231034))))

(declare-datatypes ((ValueCell!4232 0))(
  ( (ValueCellFull!4232 (v!6817 V!13307)) (EmptyCell!4232) )
))
(declare-fun mapRest!15291 () (Array (_ BitVec 32) ValueCell!4232))

(declare-datatypes ((array!22223 0))(
  ( (array!22224 (arr!10580 (Array (_ BitVec 32) ValueCell!4232)) (size!10932 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22223)

(declare-fun mapKey!15291 () (_ BitVec 32))

(declare-fun mapValue!15291 () ValueCell!4232)

(assert (=> mapNonEmpty!15291 (= (arr!10580 _values!506) (store mapRest!15291 mapKey!15291 mapValue!15291))))

(declare-fun b!379773 () Bool)

(declare-fun res!215423 () Bool)

(assert (=> b!379773 (=> (not res!215423) (not e!231038))))

(declare-datatypes ((array!22225 0))(
  ( (array!22226 (arr!10581 (Array (_ BitVec 32) (_ BitVec 64))) (size!10933 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22225)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!379773 (= res!215423 (or (= (select (arr!10581 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10581 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!379774 () Bool)

(declare-fun res!215422 () Bool)

(assert (=> b!379774 (=> (not res!215422) (not e!231038))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22225 (_ BitVec 32)) Bool)

(assert (=> b!379774 (= res!215422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!379775 () Bool)

(declare-fun res!215419 () Bool)

(declare-fun e!231036 () Bool)

(assert (=> b!379775 (=> (not res!215419) (not e!231036))))

(declare-fun lt!177483 () array!22225)

(declare-datatypes ((List!6022 0))(
  ( (Nil!6019) (Cons!6018 (h!6874 (_ BitVec 64)) (t!11172 List!6022)) )
))
(declare-fun arrayNoDuplicates!0 (array!22225 (_ BitVec 32) List!6022) Bool)

(assert (=> b!379775 (= res!215419 (arrayNoDuplicates!0 lt!177483 #b00000000000000000000000000000000 Nil!6019))))

(declare-fun b!379776 () Bool)

(declare-fun res!215420 () Bool)

(assert (=> b!379776 (=> (not res!215420) (not e!231038))))

(assert (=> b!379776 (= res!215420 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10933 _keys!658))))))

(declare-fun b!379777 () Bool)

(assert (=> b!379777 (= e!231038 e!231036)))

(declare-fun res!215416 () Bool)

(assert (=> b!379777 (=> (not res!215416) (not e!231036))))

(assert (=> b!379777 (= res!215416 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!177483 mask!970))))

(assert (=> b!379777 (= lt!177483 (array!22226 (store (arr!10581 _keys!658) i!548 k!778) (size!10933 _keys!658)))))

(declare-fun res!215414 () Bool)

(assert (=> start!37376 (=> (not res!215414) (not e!231038))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37376 (= res!215414 (validMask!0 mask!970))))

(assert (=> start!37376 e!231038))

(declare-fun e!231032 () Bool)

(declare-fun array_inv!7788 (array!22223) Bool)

(assert (=> start!37376 (and (array_inv!7788 _values!506) e!231032)))

(assert (=> start!37376 tp!30225))

(assert (=> start!37376 true))

(assert (=> start!37376 tp_is_empty!9151))

(declare-fun array_inv!7789 (array!22225) Bool)

(assert (=> start!37376 (array_inv!7789 _keys!658)))

(declare-fun b!379778 () Bool)

(declare-fun res!215412 () Bool)

(assert (=> b!379778 (=> (not res!215412) (not e!231038))))

(declare-fun arrayContainsKey!0 (array!22225 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!379778 (= res!215412 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!379779 () Bool)

(declare-fun res!215413 () Bool)

(assert (=> b!379779 (=> (not res!215413) (not e!231038))))

(assert (=> b!379779 (= res!215413 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6019))))

(declare-fun b!379780 () Bool)

(declare-fun e!231033 () Bool)

(assert (=> b!379780 (= e!231033 tp_is_empty!9151)))

(declare-fun b!379781 () Bool)

(assert (=> b!379781 (= e!231037 true)))

(declare-fun lt!177475 () tuple2!6186)

(assert (=> b!379781 (= lt!177480 (+!911 lt!177478 lt!177475))))

(declare-fun v!373 () V!13307)

(declare-datatypes ((Unit!11716 0))(
  ( (Unit!11717) )
))
(declare-fun lt!177474 () Unit!11716)

(declare-fun addCommutativeForDiffKeys!308 (ListLongMap!5099 (_ BitVec 64) V!13307 (_ BitVec 64) V!13307) Unit!11716)

(assert (=> b!379781 (= lt!177474 (addCommutativeForDiffKeys!308 lt!177472 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!379782 () Bool)

(declare-fun res!215421 () Bool)

(assert (=> b!379782 (=> (not res!215421) (not e!231038))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!379782 (= res!215421 (and (= (size!10932 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10933 _keys!658) (size!10932 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!15291 () Bool)

(assert (=> mapIsEmpty!15291 mapRes!15291))

(declare-fun b!379783 () Bool)

(assert (=> b!379783 (= e!231032 (and e!231033 mapRes!15291))))

(declare-fun condMapEmpty!15291 () Bool)

(declare-fun mapDefault!15291 () ValueCell!4232)

