; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37520 () Bool)

(assert start!37520)

(declare-fun b_free!8647 () Bool)

(declare-fun b_next!8647 () Bool)

(assert (=> start!37520 (= b_free!8647 (not b_next!8647))))

(declare-fun tp!30657 () Bool)

(declare-fun b_and!15889 () Bool)

(assert (=> start!37520 (= tp!30657 b_and!15889)))

(declare-fun b!382864 () Bool)

(declare-fun res!217861 () Bool)

(declare-fun e!232617 () Bool)

(assert (=> b!382864 (=> (not res!217861) (not e!232617))))

(declare-datatypes ((array!22499 0))(
  ( (array!22500 (arr!10718 (Array (_ BitVec 32) (_ BitVec 64))) (size!11070 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22499)

(declare-datatypes ((List!6142 0))(
  ( (Nil!6139) (Cons!6138 (h!6994 (_ BitVec 64)) (t!11292 List!6142)) )
))
(declare-fun arrayNoDuplicates!0 (array!22499 (_ BitVec 32) List!6142) Bool)

(assert (=> b!382864 (= res!217861 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6139))))

(declare-fun mapNonEmpty!15507 () Bool)

(declare-fun mapRes!15507 () Bool)

(declare-fun tp!30656 () Bool)

(declare-fun e!232618 () Bool)

(assert (=> mapNonEmpty!15507 (= mapRes!15507 (and tp!30656 e!232618))))

(declare-fun mapKey!15507 () (_ BitVec 32))

(declare-datatypes ((V!13499 0))(
  ( (V!13500 (val!4692 Int)) )
))
(declare-datatypes ((ValueCell!4304 0))(
  ( (ValueCellFull!4304 (v!6889 V!13499)) (EmptyCell!4304) )
))
(declare-datatypes ((array!22501 0))(
  ( (array!22502 (arr!10719 (Array (_ BitVec 32) ValueCell!4304)) (size!11071 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22501)

(declare-fun mapRest!15507 () (Array (_ BitVec 32) ValueCell!4304))

(declare-fun mapValue!15507 () ValueCell!4304)

(assert (=> mapNonEmpty!15507 (= (arr!10719 _values!506) (store mapRest!15507 mapKey!15507 mapValue!15507))))

(declare-fun b!382865 () Bool)

(declare-fun res!217868 () Bool)

(assert (=> b!382865 (=> (not res!217868) (not e!232617))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!382865 (= res!217868 (or (= (select (arr!10718 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10718 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!382866 () Bool)

(declare-fun tp_is_empty!9295 () Bool)

(assert (=> b!382866 (= e!232618 tp_is_empty!9295)))

(declare-fun b!382867 () Bool)

(declare-fun res!217860 () Bool)

(assert (=> b!382867 (=> (not res!217860) (not e!232617))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22499 (_ BitVec 32)) Bool)

(assert (=> b!382867 (= res!217860 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!382868 () Bool)

(declare-fun res!217858 () Bool)

(assert (=> b!382868 (=> (not res!217858) (not e!232617))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!382868 (= res!217858 (validKeyInArray!0 k!778))))

(declare-fun b!382869 () Bool)

(declare-fun res!217862 () Bool)

(declare-fun e!232614 () Bool)

(assert (=> b!382869 (=> (not res!217862) (not e!232614))))

(declare-fun lt!179703 () array!22499)

(assert (=> b!382869 (= res!217862 (arrayNoDuplicates!0 lt!179703 #b00000000000000000000000000000000 Nil!6139))))

(declare-fun mapIsEmpty!15507 () Bool)

(assert (=> mapIsEmpty!15507 mapRes!15507))

(declare-fun b!382870 () Bool)

(declare-fun e!232613 () Bool)

(assert (=> b!382870 (= e!232614 (not e!232613))))

(declare-fun res!217864 () Bool)

(assert (=> b!382870 (=> res!217864 e!232613)))

(declare-fun lt!179698 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!382870 (= res!217864 (or (and (not lt!179698) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179698) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179698)))))

(assert (=> b!382870 (= lt!179698 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13499)

(declare-datatypes ((tuple2!6310 0))(
  ( (tuple2!6311 (_1!3166 (_ BitVec 64)) (_2!3166 V!13499)) )
))
(declare-datatypes ((List!6143 0))(
  ( (Nil!6140) (Cons!6139 (h!6995 tuple2!6310) (t!11293 List!6143)) )
))
(declare-datatypes ((ListLongMap!5223 0))(
  ( (ListLongMap!5224 (toList!2627 List!6143)) )
))
(declare-fun lt!179700 () ListLongMap!5223)

(declare-fun minValue!472 () V!13499)

(declare-fun getCurrentListMap!2032 (array!22499 array!22501 (_ BitVec 32) (_ BitVec 32) V!13499 V!13499 (_ BitVec 32) Int) ListLongMap!5223)

(assert (=> b!382870 (= lt!179700 (getCurrentListMap!2032 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179697 () array!22501)

(declare-fun lt!179696 () ListLongMap!5223)

(assert (=> b!382870 (= lt!179696 (getCurrentListMap!2032 lt!179703 lt!179697 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179702 () ListLongMap!5223)

(declare-fun lt!179699 () ListLongMap!5223)

(assert (=> b!382870 (and (= lt!179702 lt!179699) (= lt!179699 lt!179702))))

(declare-fun v!373 () V!13499)

(declare-fun lt!179695 () ListLongMap!5223)

(declare-fun +!962 (ListLongMap!5223 tuple2!6310) ListLongMap!5223)

(assert (=> b!382870 (= lt!179699 (+!962 lt!179695 (tuple2!6311 k!778 v!373)))))

(declare-datatypes ((Unit!11818 0))(
  ( (Unit!11819) )
))
(declare-fun lt!179701 () Unit!11818)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!190 (array!22499 array!22501 (_ BitVec 32) (_ BitVec 32) V!13499 V!13499 (_ BitVec 32) (_ BitVec 64) V!13499 (_ BitVec 32) Int) Unit!11818)

(assert (=> b!382870 (= lt!179701 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!190 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!866 (array!22499 array!22501 (_ BitVec 32) (_ BitVec 32) V!13499 V!13499 (_ BitVec 32) Int) ListLongMap!5223)

(assert (=> b!382870 (= lt!179702 (getCurrentListMapNoExtraKeys!866 lt!179703 lt!179697 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!382870 (= lt!179697 (array!22502 (store (arr!10719 _values!506) i!548 (ValueCellFull!4304 v!373)) (size!11071 _values!506)))))

(assert (=> b!382870 (= lt!179695 (getCurrentListMapNoExtraKeys!866 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!382871 () Bool)

(declare-fun e!232619 () Bool)

(declare-fun e!232616 () Bool)

(assert (=> b!382871 (= e!232619 (and e!232616 mapRes!15507))))

(declare-fun condMapEmpty!15507 () Bool)

(declare-fun mapDefault!15507 () ValueCell!4304)

