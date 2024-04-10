; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41242 () Bool)

(assert start!41242)

(declare-fun b_free!11085 () Bool)

(declare-fun b_next!11085 () Bool)

(assert (=> start!41242 (= b_free!11085 (not b_next!11085))))

(declare-fun tp!39093 () Bool)

(declare-fun b_and!19405 () Bool)

(assert (=> start!41242 (= tp!39093 b_and!19405)))

(declare-fun b!461437 () Bool)

(declare-fun e!269113 () Bool)

(declare-fun e!269117 () Bool)

(declare-fun mapRes!20287 () Bool)

(assert (=> b!461437 (= e!269113 (and e!269117 mapRes!20287))))

(declare-fun condMapEmpty!20287 () Bool)

(declare-datatypes ((V!17669 0))(
  ( (V!17670 (val!6256 Int)) )
))
(declare-datatypes ((ValueCell!5868 0))(
  ( (ValueCellFull!5868 (v!8538 V!17669)) (EmptyCell!5868) )
))
(declare-datatypes ((array!28645 0))(
  ( (array!28646 (arr!13762 (Array (_ BitVec 32) ValueCell!5868)) (size!14114 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28645)

(declare-fun mapDefault!20287 () ValueCell!5868)

(assert (=> b!461437 (= condMapEmpty!20287 (= (arr!13762 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5868)) mapDefault!20287)))))

(declare-fun b!461438 () Bool)

(declare-fun res!276017 () Bool)

(declare-fun e!269116 () Bool)

(assert (=> b!461438 (=> (not res!276017) (not e!269116))))

(declare-datatypes ((array!28647 0))(
  ( (array!28648 (arr!13763 (Array (_ BitVec 32) (_ BitVec 64))) (size!14115 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28647)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28647 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!461438 (= res!276017 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!461439 () Bool)

(declare-fun res!276020 () Bool)

(assert (=> b!461439 (=> (not res!276020) (not e!269116))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!461439 (= res!276020 (or (= (select (arr!13763 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13763 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!461441 () Bool)

(declare-fun res!276026 () Bool)

(declare-fun e!269112 () Bool)

(assert (=> b!461441 (=> (not res!276026) (not e!269112))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!461441 (= res!276026 (bvsle from!863 i!563))))

(declare-fun b!461442 () Bool)

(declare-fun res!276019 () Bool)

(assert (=> b!461442 (=> (not res!276019) (not e!269116))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!461442 (= res!276019 (validKeyInArray!0 k0!794))))

(declare-fun b!461443 () Bool)

(declare-fun res!276022 () Bool)

(assert (=> b!461443 (=> (not res!276022) (not e!269116))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!461443 (= res!276022 (validMask!0 mask!1025))))

(declare-fun b!461444 () Bool)

(declare-fun res!276025 () Bool)

(assert (=> b!461444 (=> (not res!276025) (not e!269116))))

(declare-datatypes ((List!8326 0))(
  ( (Nil!8323) (Cons!8322 (h!9178 (_ BitVec 64)) (t!14268 List!8326)) )
))
(declare-fun arrayNoDuplicates!0 (array!28647 (_ BitVec 32) List!8326) Bool)

(assert (=> b!461444 (= res!276025 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8323))))

(declare-fun mapNonEmpty!20287 () Bool)

(declare-fun tp!39094 () Bool)

(declare-fun e!269111 () Bool)

(assert (=> mapNonEmpty!20287 (= mapRes!20287 (and tp!39094 e!269111))))

(declare-fun mapValue!20287 () ValueCell!5868)

(declare-fun mapRest!20287 () (Array (_ BitVec 32) ValueCell!5868))

(declare-fun mapKey!20287 () (_ BitVec 32))

(assert (=> mapNonEmpty!20287 (= (arr!13762 _values!549) (store mapRest!20287 mapKey!20287 mapValue!20287))))

(declare-fun b!461445 () Bool)

(assert (=> b!461445 (= e!269116 e!269112)))

(declare-fun res!276014 () Bool)

(assert (=> b!461445 (=> (not res!276014) (not e!269112))))

(declare-fun lt!208992 () array!28647)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28647 (_ BitVec 32)) Bool)

(assert (=> b!461445 (= res!276014 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!208992 mask!1025))))

(assert (=> b!461445 (= lt!208992 (array!28648 (store (arr!13763 _keys!709) i!563 k0!794) (size!14115 _keys!709)))))

(declare-fun b!461446 () Bool)

(declare-fun res!276023 () Bool)

(assert (=> b!461446 (=> (not res!276023) (not e!269116))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!461446 (= res!276023 (and (= (size!14114 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14115 _keys!709) (size!14114 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!461447 () Bool)

(declare-fun e!269114 () Bool)

(assert (=> b!461447 (= e!269112 e!269114)))

(declare-fun res!276024 () Bool)

(assert (=> b!461447 (=> (not res!276024) (not e!269114))))

(assert (=> b!461447 (= res!276024 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!17669)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17669)

(declare-fun lt!208989 () array!28645)

(declare-datatypes ((tuple2!8254 0))(
  ( (tuple2!8255 (_1!4138 (_ BitVec 64)) (_2!4138 V!17669)) )
))
(declare-datatypes ((List!8327 0))(
  ( (Nil!8324) (Cons!8323 (h!9179 tuple2!8254) (t!14269 List!8327)) )
))
(declare-datatypes ((ListLongMap!7167 0))(
  ( (ListLongMap!7168 (toList!3599 List!8327)) )
))
(declare-fun lt!208988 () ListLongMap!7167)

(declare-fun getCurrentListMapNoExtraKeys!1779 (array!28647 array!28645 (_ BitVec 32) (_ BitVec 32) V!17669 V!17669 (_ BitVec 32) Int) ListLongMap!7167)

(assert (=> b!461447 (= lt!208988 (getCurrentListMapNoExtraKeys!1779 lt!208992 lt!208989 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17669)

(assert (=> b!461447 (= lt!208989 (array!28646 (store (arr!13762 _values!549) i!563 (ValueCellFull!5868 v!412)) (size!14114 _values!549)))))

(declare-fun lt!208990 () ListLongMap!7167)

(assert (=> b!461447 (= lt!208990 (getCurrentListMapNoExtraKeys!1779 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!461448 () Bool)

(declare-fun tp_is_empty!12423 () Bool)

(assert (=> b!461448 (= e!269111 tp_is_empty!12423)))

(declare-fun b!461449 () Bool)

(declare-fun res!276018 () Bool)

(assert (=> b!461449 (=> (not res!276018) (not e!269116))))

(assert (=> b!461449 (= res!276018 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14115 _keys!709))))))

(declare-fun b!461440 () Bool)

(assert (=> b!461440 (= e!269114 (not true))))

(declare-fun +!1633 (ListLongMap!7167 tuple2!8254) ListLongMap!7167)

(assert (=> b!461440 (= (getCurrentListMapNoExtraKeys!1779 lt!208992 lt!208989 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1633 (getCurrentListMapNoExtraKeys!1779 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8255 k0!794 v!412)))))

(declare-datatypes ((Unit!13432 0))(
  ( (Unit!13433) )
))
(declare-fun lt!208991 () Unit!13432)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!789 (array!28647 array!28645 (_ BitVec 32) (_ BitVec 32) V!17669 V!17669 (_ BitVec 32) (_ BitVec 64) V!17669 (_ BitVec 32) Int) Unit!13432)

(assert (=> b!461440 (= lt!208991 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!789 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!276016 () Bool)

(assert (=> start!41242 (=> (not res!276016) (not e!269116))))

(assert (=> start!41242 (= res!276016 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14115 _keys!709))))))

(assert (=> start!41242 e!269116))

(assert (=> start!41242 tp_is_empty!12423))

(assert (=> start!41242 tp!39093))

(assert (=> start!41242 true))

(declare-fun array_inv!9956 (array!28645) Bool)

(assert (=> start!41242 (and (array_inv!9956 _values!549) e!269113)))

(declare-fun array_inv!9957 (array!28647) Bool)

(assert (=> start!41242 (array_inv!9957 _keys!709)))

(declare-fun b!461450 () Bool)

(declare-fun res!276015 () Bool)

(assert (=> b!461450 (=> (not res!276015) (not e!269112))))

(assert (=> b!461450 (= res!276015 (arrayNoDuplicates!0 lt!208992 #b00000000000000000000000000000000 Nil!8323))))

(declare-fun b!461451 () Bool)

(declare-fun res!276021 () Bool)

(assert (=> b!461451 (=> (not res!276021) (not e!269116))))

(assert (=> b!461451 (= res!276021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!461452 () Bool)

(assert (=> b!461452 (= e!269117 tp_is_empty!12423)))

(declare-fun mapIsEmpty!20287 () Bool)

(assert (=> mapIsEmpty!20287 mapRes!20287))

(assert (= (and start!41242 res!276016) b!461443))

(assert (= (and b!461443 res!276022) b!461446))

(assert (= (and b!461446 res!276023) b!461451))

(assert (= (and b!461451 res!276021) b!461444))

(assert (= (and b!461444 res!276025) b!461449))

(assert (= (and b!461449 res!276018) b!461442))

(assert (= (and b!461442 res!276019) b!461439))

(assert (= (and b!461439 res!276020) b!461438))

(assert (= (and b!461438 res!276017) b!461445))

(assert (= (and b!461445 res!276014) b!461450))

(assert (= (and b!461450 res!276015) b!461441))

(assert (= (and b!461441 res!276026) b!461447))

(assert (= (and b!461447 res!276024) b!461440))

(assert (= (and b!461437 condMapEmpty!20287) mapIsEmpty!20287))

(assert (= (and b!461437 (not condMapEmpty!20287)) mapNonEmpty!20287))

(get-info :version)

(assert (= (and mapNonEmpty!20287 ((_ is ValueCellFull!5868) mapValue!20287)) b!461448))

(assert (= (and b!461437 ((_ is ValueCellFull!5868) mapDefault!20287)) b!461452))

(assert (= start!41242 b!461437))

(declare-fun m!444593 () Bool)

(assert (=> b!461445 m!444593))

(declare-fun m!444595 () Bool)

(assert (=> b!461445 m!444595))

(declare-fun m!444597 () Bool)

(assert (=> b!461444 m!444597))

(declare-fun m!444599 () Bool)

(assert (=> b!461450 m!444599))

(declare-fun m!444601 () Bool)

(assert (=> b!461447 m!444601))

(declare-fun m!444603 () Bool)

(assert (=> b!461447 m!444603))

(declare-fun m!444605 () Bool)

(assert (=> b!461447 m!444605))

(declare-fun m!444607 () Bool)

(assert (=> b!461439 m!444607))

(declare-fun m!444609 () Bool)

(assert (=> b!461442 m!444609))

(declare-fun m!444611 () Bool)

(assert (=> b!461438 m!444611))

(declare-fun m!444613 () Bool)

(assert (=> start!41242 m!444613))

(declare-fun m!444615 () Bool)

(assert (=> start!41242 m!444615))

(declare-fun m!444617 () Bool)

(assert (=> b!461443 m!444617))

(declare-fun m!444619 () Bool)

(assert (=> mapNonEmpty!20287 m!444619))

(declare-fun m!444621 () Bool)

(assert (=> b!461440 m!444621))

(declare-fun m!444623 () Bool)

(assert (=> b!461440 m!444623))

(assert (=> b!461440 m!444623))

(declare-fun m!444625 () Bool)

(assert (=> b!461440 m!444625))

(declare-fun m!444627 () Bool)

(assert (=> b!461440 m!444627))

(declare-fun m!444629 () Bool)

(assert (=> b!461451 m!444629))

(check-sat (not b!461445) (not b!461447) (not b!461451) (not b!461438) tp_is_empty!12423 (not b!461444) (not b!461442) (not b!461440) (not b!461450) (not b_next!11085) (not start!41242) b_and!19405 (not b!461443) (not mapNonEmpty!20287))
(check-sat b_and!19405 (not b_next!11085))
