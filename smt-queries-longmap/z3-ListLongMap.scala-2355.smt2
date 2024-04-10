; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37594 () Bool)

(assert start!37594)

(declare-fun b_free!8721 () Bool)

(declare-fun b_next!8721 () Bool)

(assert (=> start!37594 (= b_free!8721 (not b_next!8721))))

(declare-fun tp!30879 () Bool)

(declare-fun b_and!15963 () Bool)

(assert (=> start!37594 (= tp!30879 b_and!15963)))

(declare-fun b!384427 () Bool)

(declare-fun res!219089 () Bool)

(declare-fun e!233402 () Bool)

(assert (=> b!384427 (=> (not res!219089) (not e!233402))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!384427 (= res!219089 (validKeyInArray!0 k0!778))))

(declare-fun b!384428 () Bool)

(declare-fun res!219095 () Bool)

(assert (=> b!384428 (=> (not res!219095) (not e!233402))))

(declare-datatypes ((array!22641 0))(
  ( (array!22642 (arr!10789 (Array (_ BitVec 32) (_ BitVec 64))) (size!11141 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22641)

(declare-datatypes ((List!6201 0))(
  ( (Nil!6198) (Cons!6197 (h!7053 (_ BitVec 64)) (t!11351 List!6201)) )
))
(declare-fun arrayNoDuplicates!0 (array!22641 (_ BitVec 32) List!6201) Bool)

(assert (=> b!384428 (= res!219095 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6198))))

(declare-fun b!384429 () Bool)

(declare-fun e!233400 () Bool)

(declare-fun tp_is_empty!9369 () Bool)

(assert (=> b!384429 (= e!233400 tp_is_empty!9369)))

(declare-fun b!384430 () Bool)

(declare-fun e!233403 () Bool)

(assert (=> b!384430 (= e!233403 tp_is_empty!9369)))

(declare-fun b!384431 () Bool)

(declare-fun e!233399 () Bool)

(declare-fun mapRes!15618 () Bool)

(assert (=> b!384431 (= e!233399 (and e!233403 mapRes!15618))))

(declare-fun condMapEmpty!15618 () Bool)

(declare-datatypes ((V!13597 0))(
  ( (V!13598 (val!4729 Int)) )
))
(declare-datatypes ((ValueCell!4341 0))(
  ( (ValueCellFull!4341 (v!6926 V!13597)) (EmptyCell!4341) )
))
(declare-datatypes ((array!22643 0))(
  ( (array!22644 (arr!10790 (Array (_ BitVec 32) ValueCell!4341)) (size!11142 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22643)

(declare-fun mapDefault!15618 () ValueCell!4341)

(assert (=> b!384431 (= condMapEmpty!15618 (= (arr!10790 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4341)) mapDefault!15618)))))

(declare-fun b!384432 () Bool)

(declare-fun e!233404 () Bool)

(assert (=> b!384432 (= e!233402 e!233404)))

(declare-fun res!219094 () Bool)

(assert (=> b!384432 (=> (not res!219094) (not e!233404))))

(declare-fun lt!180885 () array!22641)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22641 (_ BitVec 32)) Bool)

(assert (=> b!384432 (= res!219094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!180885 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!384432 (= lt!180885 (array!22642 (store (arr!10789 _keys!658) i!548 k0!778) (size!11141 _keys!658)))))

(declare-fun mapIsEmpty!15618 () Bool)

(assert (=> mapIsEmpty!15618 mapRes!15618))

(declare-fun b!384433 () Bool)

(declare-fun res!219098 () Bool)

(assert (=> b!384433 (=> (not res!219098) (not e!233402))))

(declare-fun arrayContainsKey!0 (array!22641 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!384433 (= res!219098 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!384434 () Bool)

(declare-fun e!233401 () Bool)

(assert (=> b!384434 (= e!233401 true)))

(declare-datatypes ((tuple2!6366 0))(
  ( (tuple2!6367 (_1!3194 (_ BitVec 64)) (_2!3194 V!13597)) )
))
(declare-datatypes ((List!6202 0))(
  ( (Nil!6199) (Cons!6198 (h!7054 tuple2!6366) (t!11352 List!6202)) )
))
(declare-datatypes ((ListLongMap!5279 0))(
  ( (ListLongMap!5280 (toList!2655 List!6202)) )
))
(declare-fun lt!180880 () ListLongMap!5279)

(declare-fun lt!180879 () ListLongMap!5279)

(declare-fun lt!180881 () tuple2!6366)

(declare-fun +!990 (ListLongMap!5279 tuple2!6366) ListLongMap!5279)

(assert (=> b!384434 (= lt!180880 (+!990 lt!180879 lt!180881))))

(declare-fun lt!180884 () ListLongMap!5279)

(declare-fun lt!180875 () ListLongMap!5279)

(assert (=> b!384434 (= lt!180884 lt!180875)))

(declare-fun b!384435 () Bool)

(declare-fun res!219090 () Bool)

(assert (=> b!384435 (=> (not res!219090) (not e!233402))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!384435 (= res!219090 (and (= (size!11142 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11141 _keys!658) (size!11142 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!384436 () Bool)

(declare-fun res!219092 () Bool)

(assert (=> b!384436 (=> (not res!219092) (not e!233404))))

(assert (=> b!384436 (= res!219092 (arrayNoDuplicates!0 lt!180885 #b00000000000000000000000000000000 Nil!6198))))

(declare-fun b!384437 () Bool)

(declare-fun res!219091 () Bool)

(assert (=> b!384437 (=> (not res!219091) (not e!233402))))

(assert (=> b!384437 (= res!219091 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11141 _keys!658))))))

(declare-fun b!384438 () Bool)

(declare-fun res!219097 () Bool)

(assert (=> b!384438 (=> (not res!219097) (not e!233402))))

(assert (=> b!384438 (= res!219097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!384439 () Bool)

(declare-fun res!219096 () Bool)

(assert (=> b!384439 (=> (not res!219096) (not e!233402))))

(assert (=> b!384439 (= res!219096 (or (= (select (arr!10789 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10789 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!384440 () Bool)

(assert (=> b!384440 (= e!233404 (not e!233401))))

(declare-fun res!219088 () Bool)

(assert (=> b!384440 (=> res!219088 e!233401)))

(declare-fun lt!180883 () Bool)

(assert (=> b!384440 (= res!219088 (or (and (not lt!180883) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!180883) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!180883)))))

(assert (=> b!384440 (= lt!180883 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13597)

(declare-fun minValue!472 () V!13597)

(declare-fun getCurrentListMap!2055 (array!22641 array!22643 (_ BitVec 32) (_ BitVec 32) V!13597 V!13597 (_ BitVec 32) Int) ListLongMap!5279)

(assert (=> b!384440 (= lt!180879 (getCurrentListMap!2055 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180877 () array!22643)

(assert (=> b!384440 (= lt!180884 (getCurrentListMap!2055 lt!180885 lt!180877 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180876 () ListLongMap!5279)

(assert (=> b!384440 (and (= lt!180875 lt!180876) (= lt!180876 lt!180875))))

(declare-fun lt!180882 () ListLongMap!5279)

(assert (=> b!384440 (= lt!180876 (+!990 lt!180882 lt!180881))))

(declare-fun v!373 () V!13597)

(assert (=> b!384440 (= lt!180881 (tuple2!6367 k0!778 v!373))))

(declare-datatypes ((Unit!11864 0))(
  ( (Unit!11865) )
))
(declare-fun lt!180878 () Unit!11864)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!213 (array!22641 array!22643 (_ BitVec 32) (_ BitVec 32) V!13597 V!13597 (_ BitVec 32) (_ BitVec 64) V!13597 (_ BitVec 32) Int) Unit!11864)

(assert (=> b!384440 (= lt!180878 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!213 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!889 (array!22641 array!22643 (_ BitVec 32) (_ BitVec 32) V!13597 V!13597 (_ BitVec 32) Int) ListLongMap!5279)

(assert (=> b!384440 (= lt!180875 (getCurrentListMapNoExtraKeys!889 lt!180885 lt!180877 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!384440 (= lt!180877 (array!22644 (store (arr!10790 _values!506) i!548 (ValueCellFull!4341 v!373)) (size!11142 _values!506)))))

(assert (=> b!384440 (= lt!180882 (getCurrentListMapNoExtraKeys!889 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun res!219093 () Bool)

(assert (=> start!37594 (=> (not res!219093) (not e!233402))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37594 (= res!219093 (validMask!0 mask!970))))

(assert (=> start!37594 e!233402))

(declare-fun array_inv!7944 (array!22643) Bool)

(assert (=> start!37594 (and (array_inv!7944 _values!506) e!233399)))

(assert (=> start!37594 tp!30879))

(assert (=> start!37594 true))

(assert (=> start!37594 tp_is_empty!9369))

(declare-fun array_inv!7945 (array!22641) Bool)

(assert (=> start!37594 (array_inv!7945 _keys!658)))

(declare-fun mapNonEmpty!15618 () Bool)

(declare-fun tp!30878 () Bool)

(assert (=> mapNonEmpty!15618 (= mapRes!15618 (and tp!30878 e!233400))))

(declare-fun mapKey!15618 () (_ BitVec 32))

(declare-fun mapRest!15618 () (Array (_ BitVec 32) ValueCell!4341))

(declare-fun mapValue!15618 () ValueCell!4341)

(assert (=> mapNonEmpty!15618 (= (arr!10790 _values!506) (store mapRest!15618 mapKey!15618 mapValue!15618))))

(assert (= (and start!37594 res!219093) b!384435))

(assert (= (and b!384435 res!219090) b!384438))

(assert (= (and b!384438 res!219097) b!384428))

(assert (= (and b!384428 res!219095) b!384437))

(assert (= (and b!384437 res!219091) b!384427))

(assert (= (and b!384427 res!219089) b!384439))

(assert (= (and b!384439 res!219096) b!384433))

(assert (= (and b!384433 res!219098) b!384432))

(assert (= (and b!384432 res!219094) b!384436))

(assert (= (and b!384436 res!219092) b!384440))

(assert (= (and b!384440 (not res!219088)) b!384434))

(assert (= (and b!384431 condMapEmpty!15618) mapIsEmpty!15618))

(assert (= (and b!384431 (not condMapEmpty!15618)) mapNonEmpty!15618))

(get-info :version)

(assert (= (and mapNonEmpty!15618 ((_ is ValueCellFull!4341) mapValue!15618)) b!384429))

(assert (= (and b!384431 ((_ is ValueCellFull!4341) mapDefault!15618)) b!384430))

(assert (= start!37594 b!384431))

(declare-fun m!381115 () Bool)

(assert (=> b!384432 m!381115))

(declare-fun m!381117 () Bool)

(assert (=> b!384432 m!381117))

(declare-fun m!381119 () Bool)

(assert (=> b!384434 m!381119))

(declare-fun m!381121 () Bool)

(assert (=> b!384436 m!381121))

(declare-fun m!381123 () Bool)

(assert (=> b!384439 m!381123))

(declare-fun m!381125 () Bool)

(assert (=> b!384427 m!381125))

(declare-fun m!381127 () Bool)

(assert (=> b!384428 m!381127))

(declare-fun m!381129 () Bool)

(assert (=> b!384440 m!381129))

(declare-fun m!381131 () Bool)

(assert (=> b!384440 m!381131))

(declare-fun m!381133 () Bool)

(assert (=> b!384440 m!381133))

(declare-fun m!381135 () Bool)

(assert (=> b!384440 m!381135))

(declare-fun m!381137 () Bool)

(assert (=> b!384440 m!381137))

(declare-fun m!381139 () Bool)

(assert (=> b!384440 m!381139))

(declare-fun m!381141 () Bool)

(assert (=> b!384440 m!381141))

(declare-fun m!381143 () Bool)

(assert (=> mapNonEmpty!15618 m!381143))

(declare-fun m!381145 () Bool)

(assert (=> b!384433 m!381145))

(declare-fun m!381147 () Bool)

(assert (=> start!37594 m!381147))

(declare-fun m!381149 () Bool)

(assert (=> start!37594 m!381149))

(declare-fun m!381151 () Bool)

(assert (=> start!37594 m!381151))

(declare-fun m!381153 () Bool)

(assert (=> b!384438 m!381153))

(check-sat (not b!384428) (not b!384434) (not start!37594) (not b!384433) tp_is_empty!9369 (not mapNonEmpty!15618) (not b!384427) (not b!384440) (not b!384432) (not b!384438) (not b!384436) b_and!15963 (not b_next!8721))
(check-sat b_and!15963 (not b_next!8721))
