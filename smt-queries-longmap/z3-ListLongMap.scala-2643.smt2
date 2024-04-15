; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39662 () Bool)

(assert start!39662)

(declare-fun b_free!9943 () Bool)

(declare-fun b_next!9943 () Bool)

(assert (=> start!39662 (= b_free!9943 (not b_next!9943))))

(declare-fun tp!35357 () Bool)

(declare-fun b_and!17573 () Bool)

(assert (=> start!39662 (= tp!35357 b_and!17573)))

(declare-fun b!425776 () Bool)

(declare-fun res!249461 () Bool)

(declare-fun e!252655 () Bool)

(assert (=> b!425776 (=> (not res!249461) (not e!252655))))

(declare-datatypes ((array!26019 0))(
  ( (array!26020 (arr!12459 (Array (_ BitVec 32) (_ BitVec 64))) (size!12812 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26019)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!425776 (= res!249461 (or (= (select (arr!12459 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12459 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18264 () Bool)

(declare-fun mapRes!18264 () Bool)

(declare-fun tp!35358 () Bool)

(declare-fun e!252657 () Bool)

(assert (=> mapNonEmpty!18264 (= mapRes!18264 (and tp!35358 e!252657))))

(declare-datatypes ((V!15899 0))(
  ( (V!15900 (val!5592 Int)) )
))
(declare-datatypes ((ValueCell!5204 0))(
  ( (ValueCellFull!5204 (v!7833 V!15899)) (EmptyCell!5204) )
))
(declare-datatypes ((array!26021 0))(
  ( (array!26022 (arr!12460 (Array (_ BitVec 32) ValueCell!5204)) (size!12813 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26021)

(declare-fun mapRest!18264 () (Array (_ BitVec 32) ValueCell!5204))

(declare-fun mapValue!18264 () ValueCell!5204)

(declare-fun mapKey!18264 () (_ BitVec 32))

(assert (=> mapNonEmpty!18264 (= (arr!12460 _values!549) (store mapRest!18264 mapKey!18264 mapValue!18264))))

(declare-fun b!425777 () Bool)

(declare-fun e!252654 () Bool)

(declare-fun e!252658 () Bool)

(assert (=> b!425777 (= e!252654 e!252658)))

(declare-fun res!249459 () Bool)

(assert (=> b!425777 (=> (not res!249459) (not e!252658))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!425777 (= res!249459 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!15899)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!194606 () array!26019)

(declare-fun zeroValue!515 () V!15899)

(declare-datatypes ((tuple2!7340 0))(
  ( (tuple2!7341 (_1!3681 (_ BitVec 64)) (_2!3681 V!15899)) )
))
(declare-datatypes ((List!7342 0))(
  ( (Nil!7339) (Cons!7338 (h!8194 tuple2!7340) (t!12777 List!7342)) )
))
(declare-datatypes ((ListLongMap!6243 0))(
  ( (ListLongMap!6244 (toList!3137 List!7342)) )
))
(declare-fun lt!194605 () ListLongMap!6243)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!194609 () array!26021)

(declare-fun getCurrentListMapNoExtraKeys!1345 (array!26019 array!26021 (_ BitVec 32) (_ BitVec 32) V!15899 V!15899 (_ BitVec 32) Int) ListLongMap!6243)

(assert (=> b!425777 (= lt!194605 (getCurrentListMapNoExtraKeys!1345 lt!194606 lt!194609 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15899)

(assert (=> b!425777 (= lt!194609 (array!26022 (store (arr!12460 _values!549) i!563 (ValueCellFull!5204 v!412)) (size!12813 _values!549)))))

(declare-fun lt!194607 () ListLongMap!6243)

(assert (=> b!425777 (= lt!194607 (getCurrentListMapNoExtraKeys!1345 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!425778 () Bool)

(declare-fun res!249458 () Bool)

(assert (=> b!425778 (=> (not res!249458) (not e!252655))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!425778 (= res!249458 (validKeyInArray!0 k0!794))))

(declare-fun b!425779 () Bool)

(declare-fun res!249452 () Bool)

(assert (=> b!425779 (=> (not res!249452) (not e!252654))))

(assert (=> b!425779 (= res!249452 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!18264 () Bool)

(assert (=> mapIsEmpty!18264 mapRes!18264))

(declare-fun res!249462 () Bool)

(assert (=> start!39662 (=> (not res!249462) (not e!252655))))

(assert (=> start!39662 (= res!249462 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12812 _keys!709))))))

(assert (=> start!39662 e!252655))

(declare-fun tp_is_empty!11095 () Bool)

(assert (=> start!39662 tp_is_empty!11095))

(assert (=> start!39662 tp!35357))

(assert (=> start!39662 true))

(declare-fun e!252659 () Bool)

(declare-fun array_inv!9110 (array!26021) Bool)

(assert (=> start!39662 (and (array_inv!9110 _values!549) e!252659)))

(declare-fun array_inv!9111 (array!26019) Bool)

(assert (=> start!39662 (array_inv!9111 _keys!709)))

(declare-fun b!425780 () Bool)

(declare-fun e!252660 () Bool)

(assert (=> b!425780 (= e!252659 (and e!252660 mapRes!18264))))

(declare-fun condMapEmpty!18264 () Bool)

(declare-fun mapDefault!18264 () ValueCell!5204)

(assert (=> b!425780 (= condMapEmpty!18264 (= (arr!12460 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5204)) mapDefault!18264)))))

(declare-fun b!425781 () Bool)

(declare-fun res!249455 () Bool)

(assert (=> b!425781 (=> (not res!249455) (not e!252655))))

(declare-fun arrayContainsKey!0 (array!26019 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!425781 (= res!249455 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!425782 () Bool)

(declare-fun res!249451 () Bool)

(assert (=> b!425782 (=> (not res!249451) (not e!252655))))

(declare-datatypes ((List!7343 0))(
  ( (Nil!7340) (Cons!7339 (h!8195 (_ BitVec 64)) (t!12778 List!7343)) )
))
(declare-fun arrayNoDuplicates!0 (array!26019 (_ BitVec 32) List!7343) Bool)

(assert (=> b!425782 (= res!249451 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7340))))

(declare-fun b!425783 () Bool)

(assert (=> b!425783 (= e!252660 tp_is_empty!11095)))

(declare-fun b!425784 () Bool)

(declare-fun res!249460 () Bool)

(assert (=> b!425784 (=> (not res!249460) (not e!252655))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!425784 (= res!249460 (validMask!0 mask!1025))))

(declare-fun b!425785 () Bool)

(declare-fun res!249454 () Bool)

(assert (=> b!425785 (=> (not res!249454) (not e!252654))))

(assert (=> b!425785 (= res!249454 (arrayNoDuplicates!0 lt!194606 #b00000000000000000000000000000000 Nil!7340))))

(declare-fun b!425786 () Bool)

(assert (=> b!425786 (= e!252658 (not true))))

(declare-fun +!1318 (ListLongMap!6243 tuple2!7340) ListLongMap!6243)

(assert (=> b!425786 (= (getCurrentListMapNoExtraKeys!1345 lt!194606 lt!194609 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1318 (getCurrentListMapNoExtraKeys!1345 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7341 k0!794 v!412)))))

(declare-datatypes ((Unit!12482 0))(
  ( (Unit!12483) )
))
(declare-fun lt!194608 () Unit!12482)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!489 (array!26019 array!26021 (_ BitVec 32) (_ BitVec 32) V!15899 V!15899 (_ BitVec 32) (_ BitVec 64) V!15899 (_ BitVec 32) Int) Unit!12482)

(assert (=> b!425786 (= lt!194608 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!489 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!425787 () Bool)

(assert (=> b!425787 (= e!252657 tp_is_empty!11095)))

(declare-fun b!425788 () Bool)

(declare-fun res!249456 () Bool)

(assert (=> b!425788 (=> (not res!249456) (not e!252655))))

(assert (=> b!425788 (= res!249456 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12812 _keys!709))))))

(declare-fun b!425789 () Bool)

(declare-fun res!249450 () Bool)

(assert (=> b!425789 (=> (not res!249450) (not e!252655))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26019 (_ BitVec 32)) Bool)

(assert (=> b!425789 (= res!249450 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!425790 () Bool)

(declare-fun res!249457 () Bool)

(assert (=> b!425790 (=> (not res!249457) (not e!252655))))

(assert (=> b!425790 (= res!249457 (and (= (size!12813 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12812 _keys!709) (size!12813 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!425791 () Bool)

(assert (=> b!425791 (= e!252655 e!252654)))

(declare-fun res!249453 () Bool)

(assert (=> b!425791 (=> (not res!249453) (not e!252654))))

(assert (=> b!425791 (= res!249453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194606 mask!1025))))

(assert (=> b!425791 (= lt!194606 (array!26020 (store (arr!12459 _keys!709) i!563 k0!794) (size!12812 _keys!709)))))

(assert (= (and start!39662 res!249462) b!425784))

(assert (= (and b!425784 res!249460) b!425790))

(assert (= (and b!425790 res!249457) b!425789))

(assert (= (and b!425789 res!249450) b!425782))

(assert (= (and b!425782 res!249451) b!425788))

(assert (= (and b!425788 res!249456) b!425778))

(assert (= (and b!425778 res!249458) b!425776))

(assert (= (and b!425776 res!249461) b!425781))

(assert (= (and b!425781 res!249455) b!425791))

(assert (= (and b!425791 res!249453) b!425785))

(assert (= (and b!425785 res!249454) b!425779))

(assert (= (and b!425779 res!249452) b!425777))

(assert (= (and b!425777 res!249459) b!425786))

(assert (= (and b!425780 condMapEmpty!18264) mapIsEmpty!18264))

(assert (= (and b!425780 (not condMapEmpty!18264)) mapNonEmpty!18264))

(get-info :version)

(assert (= (and mapNonEmpty!18264 ((_ is ValueCellFull!5204) mapValue!18264)) b!425787))

(assert (= (and b!425780 ((_ is ValueCellFull!5204) mapDefault!18264)) b!425783))

(assert (= start!39662 b!425780))

(declare-fun m!414087 () Bool)

(assert (=> b!425791 m!414087))

(declare-fun m!414089 () Bool)

(assert (=> b!425791 m!414089))

(declare-fun m!414091 () Bool)

(assert (=> b!425777 m!414091))

(declare-fun m!414093 () Bool)

(assert (=> b!425777 m!414093))

(declare-fun m!414095 () Bool)

(assert (=> b!425777 m!414095))

(declare-fun m!414097 () Bool)

(assert (=> b!425789 m!414097))

(declare-fun m!414099 () Bool)

(assert (=> b!425781 m!414099))

(declare-fun m!414101 () Bool)

(assert (=> b!425776 m!414101))

(declare-fun m!414103 () Bool)

(assert (=> b!425786 m!414103))

(declare-fun m!414105 () Bool)

(assert (=> b!425786 m!414105))

(assert (=> b!425786 m!414105))

(declare-fun m!414107 () Bool)

(assert (=> b!425786 m!414107))

(declare-fun m!414109 () Bool)

(assert (=> b!425786 m!414109))

(declare-fun m!414111 () Bool)

(assert (=> b!425782 m!414111))

(declare-fun m!414113 () Bool)

(assert (=> b!425778 m!414113))

(declare-fun m!414115 () Bool)

(assert (=> b!425784 m!414115))

(declare-fun m!414117 () Bool)

(assert (=> start!39662 m!414117))

(declare-fun m!414119 () Bool)

(assert (=> start!39662 m!414119))

(declare-fun m!414121 () Bool)

(assert (=> mapNonEmpty!18264 m!414121))

(declare-fun m!414123 () Bool)

(assert (=> b!425785 m!414123))

(check-sat (not b!425789) (not b!425777) (not b!425785) b_and!17573 (not b!425782) (not mapNonEmpty!18264) (not start!39662) (not b_next!9943) tp_is_empty!11095 (not b!425784) (not b!425791) (not b!425786) (not b!425778) (not b!425781))
(check-sat b_and!17573 (not b_next!9943))
