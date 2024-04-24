; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37308 () Bool)

(assert start!37308)

(declare-fun b_free!8449 () Bool)

(declare-fun b_next!8449 () Bool)

(assert (=> start!37308 (= b_free!8449 (not b_next!8449))))

(declare-fun tp!30063 () Bool)

(declare-fun b_and!15705 () Bool)

(assert (=> start!37308 (= tp!30063 b_and!15705)))

(declare-fun b!378506 () Bool)

(declare-fun res!214439 () Bool)

(declare-fun e!230353 () Bool)

(assert (=> b!378506 (=> (not res!214439) (not e!230353))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!378506 (= res!214439 (validKeyInArray!0 k0!778))))

(declare-fun b!378507 () Bool)

(declare-fun e!230356 () Bool)

(assert (=> b!378507 (= e!230353 e!230356)))

(declare-fun res!214445 () Bool)

(assert (=> b!378507 (=> (not res!214445) (not e!230356))))

(declare-datatypes ((array!22108 0))(
  ( (array!22109 (arr!10522 (Array (_ BitVec 32) (_ BitVec 64))) (size!10874 (_ BitVec 32))) )
))
(declare-fun lt!176442 () array!22108)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22108 (_ BitVec 32)) Bool)

(assert (=> b!378507 (= res!214445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!176442 mask!970))))

(declare-fun _keys!658 () array!22108)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!378507 (= lt!176442 (array!22109 (store (arr!10522 _keys!658) i!548 k0!778) (size!10874 _keys!658)))))

(declare-fun b!378508 () Bool)

(declare-fun e!230358 () Bool)

(assert (=> b!378508 (= e!230356 (not e!230358))))

(declare-fun res!214447 () Bool)

(assert (=> b!378508 (=> res!214447 e!230358)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!378508 (= res!214447 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!13235 0))(
  ( (V!13236 (val!4593 Int)) )
))
(declare-datatypes ((ValueCell!4205 0))(
  ( (ValueCellFull!4205 (v!6791 V!13235)) (EmptyCell!4205) )
))
(declare-datatypes ((array!22110 0))(
  ( (array!22111 (arr!10523 (Array (_ BitVec 32) ValueCell!4205)) (size!10875 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22110)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6038 0))(
  ( (tuple2!6039 (_1!3030 (_ BitVec 64)) (_2!3030 V!13235)) )
))
(declare-datatypes ((List!5877 0))(
  ( (Nil!5874) (Cons!5873 (h!6729 tuple2!6038) (t!11019 List!5877)) )
))
(declare-datatypes ((ListLongMap!4953 0))(
  ( (ListLongMap!4954 (toList!2492 List!5877)) )
))
(declare-fun lt!176445 () ListLongMap!4953)

(declare-fun zeroValue!472 () V!13235)

(declare-fun minValue!472 () V!13235)

(declare-fun getCurrentListMap!1934 (array!22108 array!22110 (_ BitVec 32) (_ BitVec 32) V!13235 V!13235 (_ BitVec 32) Int) ListLongMap!4953)

(assert (=> b!378508 (= lt!176445 (getCurrentListMap!1934 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176441 () ListLongMap!4953)

(declare-fun lt!176448 () array!22110)

(assert (=> b!378508 (= lt!176441 (getCurrentListMap!1934 lt!176442 lt!176448 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176440 () ListLongMap!4953)

(declare-fun lt!176439 () ListLongMap!4953)

(assert (=> b!378508 (and (= lt!176440 lt!176439) (= lt!176439 lt!176440))))

(declare-fun lt!176443 () ListLongMap!4953)

(declare-fun lt!176444 () tuple2!6038)

(declare-fun +!888 (ListLongMap!4953 tuple2!6038) ListLongMap!4953)

(assert (=> b!378508 (= lt!176439 (+!888 lt!176443 lt!176444))))

(declare-fun v!373 () V!13235)

(assert (=> b!378508 (= lt!176444 (tuple2!6039 k0!778 v!373))))

(declare-datatypes ((Unit!11659 0))(
  ( (Unit!11660) )
))
(declare-fun lt!176438 () Unit!11659)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!121 (array!22108 array!22110 (_ BitVec 32) (_ BitVec 32) V!13235 V!13235 (_ BitVec 32) (_ BitVec 64) V!13235 (_ BitVec 32) Int) Unit!11659)

(assert (=> b!378508 (= lt!176438 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!121 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!781 (array!22108 array!22110 (_ BitVec 32) (_ BitVec 32) V!13235 V!13235 (_ BitVec 32) Int) ListLongMap!4953)

(assert (=> b!378508 (= lt!176440 (getCurrentListMapNoExtraKeys!781 lt!176442 lt!176448 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378508 (= lt!176448 (array!22111 (store (arr!10523 _values!506) i!548 (ValueCellFull!4205 v!373)) (size!10875 _values!506)))))

(assert (=> b!378508 (= lt!176443 (getCurrentListMapNoExtraKeys!781 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!378509 () Bool)

(declare-fun res!214443 () Bool)

(assert (=> b!378509 (=> (not res!214443) (not e!230353))))

(assert (=> b!378509 (= res!214443 (and (= (size!10875 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10874 _keys!658) (size!10875 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!378510 () Bool)

(declare-fun e!230355 () Bool)

(assert (=> b!378510 (= e!230358 e!230355)))

(declare-fun res!214438 () Bool)

(assert (=> b!378510 (=> res!214438 e!230355)))

(assert (=> b!378510 (= res!214438 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!176437 () ListLongMap!4953)

(assert (=> b!378510 (= lt!176445 lt!176437)))

(declare-fun lt!176446 () tuple2!6038)

(assert (=> b!378510 (= lt!176437 (+!888 lt!176443 lt!176446))))

(declare-fun lt!176449 () ListLongMap!4953)

(assert (=> b!378510 (= lt!176441 lt!176449)))

(assert (=> b!378510 (= lt!176449 (+!888 lt!176439 lt!176446))))

(assert (=> b!378510 (= lt!176441 (+!888 lt!176440 lt!176446))))

(assert (=> b!378510 (= lt!176446 (tuple2!6039 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!378511 () Bool)

(assert (=> b!378511 (= e!230355 true)))

(assert (=> b!378511 (= lt!176449 (+!888 lt!176437 lt!176444))))

(declare-fun lt!176447 () Unit!11659)

(declare-fun addCommutativeForDiffKeys!303 (ListLongMap!4953 (_ BitVec 64) V!13235 (_ BitVec 64) V!13235) Unit!11659)

(assert (=> b!378511 (= lt!176447 (addCommutativeForDiffKeys!303 lt!176443 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!378512 () Bool)

(declare-fun res!214441 () Bool)

(assert (=> b!378512 (=> (not res!214441) (not e!230356))))

(declare-datatypes ((List!5878 0))(
  ( (Nil!5875) (Cons!5874 (h!6730 (_ BitVec 64)) (t!11020 List!5878)) )
))
(declare-fun arrayNoDuplicates!0 (array!22108 (_ BitVec 32) List!5878) Bool)

(assert (=> b!378512 (= res!214441 (arrayNoDuplicates!0 lt!176442 #b00000000000000000000000000000000 Nil!5875))))

(declare-fun mapNonEmpty!15210 () Bool)

(declare-fun mapRes!15210 () Bool)

(declare-fun tp!30062 () Bool)

(declare-fun e!230354 () Bool)

(assert (=> mapNonEmpty!15210 (= mapRes!15210 (and tp!30062 e!230354))))

(declare-fun mapRest!15210 () (Array (_ BitVec 32) ValueCell!4205))

(declare-fun mapKey!15210 () (_ BitVec 32))

(declare-fun mapValue!15210 () ValueCell!4205)

(assert (=> mapNonEmpty!15210 (= (arr!10523 _values!506) (store mapRest!15210 mapKey!15210 mapValue!15210))))

(declare-fun mapIsEmpty!15210 () Bool)

(assert (=> mapIsEmpty!15210 mapRes!15210))

(declare-fun b!378513 () Bool)

(declare-fun res!214446 () Bool)

(assert (=> b!378513 (=> (not res!214446) (not e!230353))))

(assert (=> b!378513 (= res!214446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!378514 () Bool)

(declare-fun res!214437 () Bool)

(assert (=> b!378514 (=> (not res!214437) (not e!230353))))

(declare-fun arrayContainsKey!0 (array!22108 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!378514 (= res!214437 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!378515 () Bool)

(declare-fun res!214444 () Bool)

(assert (=> b!378515 (=> (not res!214444) (not e!230353))))

(assert (=> b!378515 (= res!214444 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5875))))

(declare-fun b!378516 () Bool)

(declare-fun res!214440 () Bool)

(assert (=> b!378516 (=> (not res!214440) (not e!230353))))

(assert (=> b!378516 (= res!214440 (or (= (select (arr!10522 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10522 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!378517 () Bool)

(declare-fun e!230352 () Bool)

(declare-fun e!230357 () Bool)

(assert (=> b!378517 (= e!230352 (and e!230357 mapRes!15210))))

(declare-fun condMapEmpty!15210 () Bool)

(declare-fun mapDefault!15210 () ValueCell!4205)

(assert (=> b!378517 (= condMapEmpty!15210 (= (arr!10523 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4205)) mapDefault!15210)))))

(declare-fun b!378518 () Bool)

(declare-fun tp_is_empty!9097 () Bool)

(assert (=> b!378518 (= e!230357 tp_is_empty!9097)))

(declare-fun b!378519 () Bool)

(assert (=> b!378519 (= e!230354 tp_is_empty!9097)))

(declare-fun res!214448 () Bool)

(assert (=> start!37308 (=> (not res!214448) (not e!230353))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37308 (= res!214448 (validMask!0 mask!970))))

(assert (=> start!37308 e!230353))

(declare-fun array_inv!7802 (array!22110) Bool)

(assert (=> start!37308 (and (array_inv!7802 _values!506) e!230352)))

(assert (=> start!37308 tp!30063))

(assert (=> start!37308 true))

(assert (=> start!37308 tp_is_empty!9097))

(declare-fun array_inv!7803 (array!22108) Bool)

(assert (=> start!37308 (array_inv!7803 _keys!658)))

(declare-fun b!378520 () Bool)

(declare-fun res!214442 () Bool)

(assert (=> b!378520 (=> (not res!214442) (not e!230353))))

(assert (=> b!378520 (= res!214442 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10874 _keys!658))))))

(assert (= (and start!37308 res!214448) b!378509))

(assert (= (and b!378509 res!214443) b!378513))

(assert (= (and b!378513 res!214446) b!378515))

(assert (= (and b!378515 res!214444) b!378520))

(assert (= (and b!378520 res!214442) b!378506))

(assert (= (and b!378506 res!214439) b!378516))

(assert (= (and b!378516 res!214440) b!378514))

(assert (= (and b!378514 res!214437) b!378507))

(assert (= (and b!378507 res!214445) b!378512))

(assert (= (and b!378512 res!214441) b!378508))

(assert (= (and b!378508 (not res!214447)) b!378510))

(assert (= (and b!378510 (not res!214438)) b!378511))

(assert (= (and b!378517 condMapEmpty!15210) mapIsEmpty!15210))

(assert (= (and b!378517 (not condMapEmpty!15210)) mapNonEmpty!15210))

(get-info :version)

(assert (= (and mapNonEmpty!15210 ((_ is ValueCellFull!4205) mapValue!15210)) b!378519))

(assert (= (and b!378517 ((_ is ValueCellFull!4205) mapDefault!15210)) b!378518))

(assert (= start!37308 b!378517))

(declare-fun m!375605 () Bool)

(assert (=> b!378514 m!375605))

(declare-fun m!375607 () Bool)

(assert (=> b!378510 m!375607))

(declare-fun m!375609 () Bool)

(assert (=> b!378510 m!375609))

(declare-fun m!375611 () Bool)

(assert (=> b!378510 m!375611))

(declare-fun m!375613 () Bool)

(assert (=> b!378516 m!375613))

(declare-fun m!375615 () Bool)

(assert (=> b!378512 m!375615))

(declare-fun m!375617 () Bool)

(assert (=> b!378513 m!375617))

(declare-fun m!375619 () Bool)

(assert (=> b!378511 m!375619))

(declare-fun m!375621 () Bool)

(assert (=> b!378511 m!375621))

(declare-fun m!375623 () Bool)

(assert (=> b!378508 m!375623))

(declare-fun m!375625 () Bool)

(assert (=> b!378508 m!375625))

(declare-fun m!375627 () Bool)

(assert (=> b!378508 m!375627))

(declare-fun m!375629 () Bool)

(assert (=> b!378508 m!375629))

(declare-fun m!375631 () Bool)

(assert (=> b!378508 m!375631))

(declare-fun m!375633 () Bool)

(assert (=> b!378508 m!375633))

(declare-fun m!375635 () Bool)

(assert (=> b!378508 m!375635))

(declare-fun m!375637 () Bool)

(assert (=> b!378507 m!375637))

(declare-fun m!375639 () Bool)

(assert (=> b!378507 m!375639))

(declare-fun m!375641 () Bool)

(assert (=> b!378515 m!375641))

(declare-fun m!375643 () Bool)

(assert (=> start!37308 m!375643))

(declare-fun m!375645 () Bool)

(assert (=> start!37308 m!375645))

(declare-fun m!375647 () Bool)

(assert (=> start!37308 m!375647))

(declare-fun m!375649 () Bool)

(assert (=> mapNonEmpty!15210 m!375649))

(declare-fun m!375651 () Bool)

(assert (=> b!378506 m!375651))

(check-sat (not mapNonEmpty!15210) (not b!378511) tp_is_empty!9097 (not b!378506) b_and!15705 (not b!378508) (not b!378512) (not b!378513) (not b!378515) (not b!378514) (not b_next!8449) (not b!378507) (not b!378510) (not start!37308))
(check-sat b_and!15705 (not b_next!8449))
