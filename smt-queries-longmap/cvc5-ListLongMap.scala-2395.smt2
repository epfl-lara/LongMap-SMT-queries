; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37922 () Bool)

(assert start!37922)

(declare-fun b_free!8935 () Bool)

(declare-fun b_next!8935 () Bool)

(assert (=> start!37922 (= b_free!8935 (not b_next!8935))))

(declare-fun tp!31569 () Bool)

(declare-fun b_and!16225 () Bool)

(assert (=> start!37922 (= tp!31569 b_and!16225)))

(declare-fun b!389847 () Bool)

(declare-fun e!236186 () Bool)

(declare-fun e!236189 () Bool)

(assert (=> b!389847 (= e!236186 e!236189)))

(declare-fun res!222996 () Bool)

(assert (=> b!389847 (=> (not res!222996) (not e!236189))))

(declare-datatypes ((array!23111 0))(
  ( (array!23112 (arr!11020 (Array (_ BitVec 32) (_ BitVec 64))) (size!11372 (_ BitVec 32))) )
))
(declare-fun lt!183458 () array!23111)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23111 (_ BitVec 32)) Bool)

(assert (=> b!389847 (= res!222996 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!183458 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!23111)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!389847 (= lt!183458 (array!23112 (store (arr!11020 _keys!658) i!548 k!778) (size!11372 _keys!658)))))

(declare-fun b!389848 () Bool)

(declare-fun e!236187 () Bool)

(declare-fun tp_is_empty!9607 () Bool)

(assert (=> b!389848 (= e!236187 tp_is_empty!9607)))

(declare-fun b!389849 () Bool)

(declare-fun res!222993 () Bool)

(assert (=> b!389849 (=> (not res!222993) (not e!236186))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13915 0))(
  ( (V!13916 (val!4848 Int)) )
))
(declare-datatypes ((ValueCell!4460 0))(
  ( (ValueCellFull!4460 (v!7061 V!13915)) (EmptyCell!4460) )
))
(declare-datatypes ((array!23113 0))(
  ( (array!23114 (arr!11021 (Array (_ BitVec 32) ValueCell!4460)) (size!11373 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23113)

(assert (=> b!389849 (= res!222993 (and (= (size!11373 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11372 _keys!658) (size!11373 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!389850 () Bool)

(declare-fun res!222990 () Bool)

(assert (=> b!389850 (=> (not res!222990) (not e!236186))))

(declare-datatypes ((List!6374 0))(
  ( (Nil!6371) (Cons!6370 (h!7226 (_ BitVec 64)) (t!11532 List!6374)) )
))
(declare-fun arrayNoDuplicates!0 (array!23111 (_ BitVec 32) List!6374) Bool)

(assert (=> b!389850 (= res!222990 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6371))))

(declare-fun b!389851 () Bool)

(declare-fun e!236190 () Bool)

(assert (=> b!389851 (= e!236190 tp_is_empty!9607)))

(declare-fun b!389852 () Bool)

(declare-fun res!222994 () Bool)

(assert (=> b!389852 (=> (not res!222994) (not e!236186))))

(declare-fun arrayContainsKey!0 (array!23111 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!389852 (= res!222994 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!15987 () Bool)

(declare-fun mapRes!15987 () Bool)

(declare-fun tp!31568 () Bool)

(assert (=> mapNonEmpty!15987 (= mapRes!15987 (and tp!31568 e!236190))))

(declare-fun mapKey!15987 () (_ BitVec 32))

(declare-fun mapRest!15987 () (Array (_ BitVec 32) ValueCell!4460))

(declare-fun mapValue!15987 () ValueCell!4460)

(assert (=> mapNonEmpty!15987 (= (arr!11021 _values!506) (store mapRest!15987 mapKey!15987 mapValue!15987))))

(declare-fun b!389853 () Bool)

(declare-fun res!222992 () Bool)

(assert (=> b!389853 (=> (not res!222992) (not e!236186))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!389853 (= res!222992 (validKeyInArray!0 k!778))))

(declare-fun b!389854 () Bool)

(declare-fun res!222989 () Bool)

(assert (=> b!389854 (=> (not res!222989) (not e!236186))))

(assert (=> b!389854 (= res!222989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!389855 () Bool)

(declare-fun e!236183 () Bool)

(assert (=> b!389855 (= e!236189 (not e!236183))))

(declare-fun res!222997 () Bool)

(assert (=> b!389855 (=> res!222997 e!236183)))

(assert (=> b!389855 (= res!222997 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6520 0))(
  ( (tuple2!6521 (_1!3271 (_ BitVec 64)) (_2!3271 V!13915)) )
))
(declare-datatypes ((List!6375 0))(
  ( (Nil!6372) (Cons!6371 (h!7227 tuple2!6520) (t!11533 List!6375)) )
))
(declare-datatypes ((ListLongMap!5433 0))(
  ( (ListLongMap!5434 (toList!2732 List!6375)) )
))
(declare-fun lt!183464 () ListLongMap!5433)

(declare-fun zeroValue!472 () V!13915)

(declare-fun minValue!472 () V!13915)

(declare-fun getCurrentListMap!2081 (array!23111 array!23113 (_ BitVec 32) (_ BitVec 32) V!13915 V!13915 (_ BitVec 32) Int) ListLongMap!5433)

(assert (=> b!389855 (= lt!183464 (getCurrentListMap!2081 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183457 () array!23113)

(declare-fun lt!183461 () ListLongMap!5433)

(assert (=> b!389855 (= lt!183461 (getCurrentListMap!2081 lt!183458 lt!183457 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183449 () ListLongMap!5433)

(declare-fun lt!183455 () ListLongMap!5433)

(assert (=> b!389855 (and (= lt!183449 lt!183455) (= lt!183455 lt!183449))))

(declare-fun lt!183465 () ListLongMap!5433)

(declare-fun lt!183456 () tuple2!6520)

(declare-fun +!1027 (ListLongMap!5433 tuple2!6520) ListLongMap!5433)

(assert (=> b!389855 (= lt!183455 (+!1027 lt!183465 lt!183456))))

(declare-fun v!373 () V!13915)

(assert (=> b!389855 (= lt!183456 (tuple2!6521 k!778 v!373))))

(declare-datatypes ((Unit!11936 0))(
  ( (Unit!11937) )
))
(declare-fun lt!183462 () Unit!11936)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!245 (array!23111 array!23113 (_ BitVec 32) (_ BitVec 32) V!13915 V!13915 (_ BitVec 32) (_ BitVec 64) V!13915 (_ BitVec 32) Int) Unit!11936)

(assert (=> b!389855 (= lt!183462 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!245 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!961 (array!23111 array!23113 (_ BitVec 32) (_ BitVec 32) V!13915 V!13915 (_ BitVec 32) Int) ListLongMap!5433)

(assert (=> b!389855 (= lt!183449 (getCurrentListMapNoExtraKeys!961 lt!183458 lt!183457 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!389855 (= lt!183457 (array!23114 (store (arr!11021 _values!506) i!548 (ValueCellFull!4460 v!373)) (size!11373 _values!506)))))

(assert (=> b!389855 (= lt!183465 (getCurrentListMapNoExtraKeys!961 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun res!222991 () Bool)

(assert (=> start!37922 (=> (not res!222991) (not e!236186))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37922 (= res!222991 (validMask!0 mask!970))))

(assert (=> start!37922 e!236186))

(declare-fun e!236184 () Bool)

(declare-fun array_inv!8098 (array!23113) Bool)

(assert (=> start!37922 (and (array_inv!8098 _values!506) e!236184)))

(assert (=> start!37922 tp!31569))

(assert (=> start!37922 true))

(assert (=> start!37922 tp_is_empty!9607))

(declare-fun array_inv!8099 (array!23111) Bool)

(assert (=> start!37922 (array_inv!8099 _keys!658)))

(declare-fun b!389856 () Bool)

(assert (=> b!389856 (= e!236184 (and e!236187 mapRes!15987))))

(declare-fun condMapEmpty!15987 () Bool)

(declare-fun mapDefault!15987 () ValueCell!4460)

