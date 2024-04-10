; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41000 () Bool)

(assert start!41000)

(declare-fun b_free!10935 () Bool)

(declare-fun b_next!10935 () Bool)

(assert (=> start!41000 (= b_free!10935 (not b_next!10935))))

(declare-fun tp!38631 () Bool)

(declare-fun b_and!19077 () Bool)

(assert (=> start!41000 (= tp!38631 b_and!19077)))

(declare-fun mapNonEmpty!20050 () Bool)

(declare-fun mapRes!20050 () Bool)

(declare-fun tp!38632 () Bool)

(declare-fun e!266801 () Bool)

(assert (=> mapNonEmpty!20050 (= mapRes!20050 (and tp!38632 e!266801))))

(declare-datatypes ((V!17469 0))(
  ( (V!17470 (val!6181 Int)) )
))
(declare-datatypes ((ValueCell!5793 0))(
  ( (ValueCellFull!5793 (v!8447 V!17469)) (EmptyCell!5793) )
))
(declare-fun mapValue!20050 () ValueCell!5793)

(declare-datatypes ((array!28347 0))(
  ( (array!28348 (arr!13617 (Array (_ BitVec 32) ValueCell!5793)) (size!13969 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28347)

(declare-fun mapRest!20050 () (Array (_ BitVec 32) ValueCell!5793))

(declare-fun mapKey!20050 () (_ BitVec 32))

(assert (=> mapNonEmpty!20050 (= (arr!13617 _values!549) (store mapRest!20050 mapKey!20050 mapValue!20050))))

(declare-fun b!456690 () Bool)

(declare-fun res!272577 () Bool)

(declare-fun e!266800 () Bool)

(assert (=> b!456690 (=> (not res!272577) (not e!266800))))

(declare-datatypes ((array!28349 0))(
  ( (array!28350 (arr!13618 (Array (_ BitVec 32) (_ BitVec 64))) (size!13970 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28349)

(declare-datatypes ((List!8215 0))(
  ( (Nil!8212) (Cons!8211 (h!9067 (_ BitVec 64)) (t!14043 List!8215)) )
))
(declare-fun arrayNoDuplicates!0 (array!28349 (_ BitVec 32) List!8215) Bool)

(assert (=> b!456690 (= res!272577 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8212))))

(declare-fun mapIsEmpty!20050 () Bool)

(assert (=> mapIsEmpty!20050 mapRes!20050))

(declare-fun b!456691 () Bool)

(declare-fun e!266797 () Bool)

(declare-fun e!266799 () Bool)

(assert (=> b!456691 (= e!266797 (not e!266799))))

(declare-fun res!272583 () Bool)

(assert (=> b!456691 (=> res!272583 e!266799)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!456691 (= res!272583 (not (validKeyInArray!0 (select (arr!13618 _keys!709) from!863))))))

(declare-fun minValue!515 () V!17469)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17469)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!206629 () array!28347)

(declare-fun lt!206627 () array!28349)

(declare-fun v!412 () V!17469)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!8144 0))(
  ( (tuple2!8145 (_1!4083 (_ BitVec 64)) (_2!4083 V!17469)) )
))
(declare-datatypes ((List!8216 0))(
  ( (Nil!8213) (Cons!8212 (h!9068 tuple2!8144) (t!14044 List!8216)) )
))
(declare-datatypes ((ListLongMap!7057 0))(
  ( (ListLongMap!7058 (toList!3544 List!8216)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1727 (array!28349 array!28347 (_ BitVec 32) (_ BitVec 32) V!17469 V!17469 (_ BitVec 32) Int) ListLongMap!7057)

(declare-fun +!1580 (ListLongMap!7057 tuple2!8144) ListLongMap!7057)

(assert (=> b!456691 (= (getCurrentListMapNoExtraKeys!1727 lt!206627 lt!206629 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1580 (getCurrentListMapNoExtraKeys!1727 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8145 k0!794 v!412)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!13282 0))(
  ( (Unit!13283) )
))
(declare-fun lt!206630 () Unit!13282)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!740 (array!28349 array!28347 (_ BitVec 32) (_ BitVec 32) V!17469 V!17469 (_ BitVec 32) (_ BitVec 64) V!17469 (_ BitVec 32) Int) Unit!13282)

(assert (=> b!456691 (= lt!206630 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!740 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!272584 () Bool)

(assert (=> start!41000 (=> (not res!272584) (not e!266800))))

(assert (=> start!41000 (= res!272584 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13970 _keys!709))))))

(assert (=> start!41000 e!266800))

(declare-fun tp_is_empty!12273 () Bool)

(assert (=> start!41000 tp_is_empty!12273))

(assert (=> start!41000 tp!38631))

(assert (=> start!41000 true))

(declare-fun e!266796 () Bool)

(declare-fun array_inv!9864 (array!28347) Bool)

(assert (=> start!41000 (and (array_inv!9864 _values!549) e!266796)))

(declare-fun array_inv!9865 (array!28349) Bool)

(assert (=> start!41000 (array_inv!9865 _keys!709)))

(declare-fun b!456692 () Bool)

(declare-fun res!272576 () Bool)

(assert (=> b!456692 (=> (not res!272576) (not e!266800))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28349 (_ BitVec 32)) Bool)

(assert (=> b!456692 (= res!272576 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!456693 () Bool)

(declare-fun res!272579 () Bool)

(assert (=> b!456693 (=> (not res!272579) (not e!266800))))

(declare-fun arrayContainsKey!0 (array!28349 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!456693 (= res!272579 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!456694 () Bool)

(assert (=> b!456694 (= e!266801 tp_is_empty!12273)))

(declare-fun b!456695 () Bool)

(assert (=> b!456695 (= e!266799 (bvslt i!563 (size!13969 _values!549)))))

(declare-fun b!456696 () Bool)

(declare-fun res!272581 () Bool)

(assert (=> b!456696 (=> (not res!272581) (not e!266800))))

(assert (=> b!456696 (= res!272581 (validKeyInArray!0 k0!794))))

(declare-fun b!456697 () Bool)

(declare-fun e!266802 () Bool)

(assert (=> b!456697 (= e!266802 tp_is_empty!12273)))

(declare-fun b!456698 () Bool)

(declare-fun res!272580 () Bool)

(assert (=> b!456698 (=> (not res!272580) (not e!266800))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!456698 (= res!272580 (validMask!0 mask!1025))))

(declare-fun b!456699 () Bool)

(declare-fun e!266798 () Bool)

(assert (=> b!456699 (= e!266798 e!266797)))

(declare-fun res!272572 () Bool)

(assert (=> b!456699 (=> (not res!272572) (not e!266797))))

(assert (=> b!456699 (= res!272572 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!206628 () ListLongMap!7057)

(assert (=> b!456699 (= lt!206628 (getCurrentListMapNoExtraKeys!1727 lt!206627 lt!206629 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!456699 (= lt!206629 (array!28348 (store (arr!13617 _values!549) i!563 (ValueCellFull!5793 v!412)) (size!13969 _values!549)))))

(declare-fun lt!206626 () ListLongMap!7057)

(assert (=> b!456699 (= lt!206626 (getCurrentListMapNoExtraKeys!1727 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!456700 () Bool)

(declare-fun res!272575 () Bool)

(assert (=> b!456700 (=> (not res!272575) (not e!266798))))

(assert (=> b!456700 (= res!272575 (arrayNoDuplicates!0 lt!206627 #b00000000000000000000000000000000 Nil!8212))))

(declare-fun b!456701 () Bool)

(declare-fun res!272578 () Bool)

(assert (=> b!456701 (=> (not res!272578) (not e!266800))))

(assert (=> b!456701 (= res!272578 (or (= (select (arr!13618 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13618 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!456702 () Bool)

(assert (=> b!456702 (= e!266800 e!266798)))

(declare-fun res!272573 () Bool)

(assert (=> b!456702 (=> (not res!272573) (not e!266798))))

(assert (=> b!456702 (= res!272573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206627 mask!1025))))

(assert (=> b!456702 (= lt!206627 (array!28350 (store (arr!13618 _keys!709) i!563 k0!794) (size!13970 _keys!709)))))

(declare-fun b!456703 () Bool)

(declare-fun res!272582 () Bool)

(assert (=> b!456703 (=> (not res!272582) (not e!266800))))

(assert (=> b!456703 (= res!272582 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13970 _keys!709))))))

(declare-fun b!456704 () Bool)

(declare-fun res!272585 () Bool)

(assert (=> b!456704 (=> (not res!272585) (not e!266800))))

(assert (=> b!456704 (= res!272585 (and (= (size!13969 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13970 _keys!709) (size!13969 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!456705 () Bool)

(assert (=> b!456705 (= e!266796 (and e!266802 mapRes!20050))))

(declare-fun condMapEmpty!20050 () Bool)

(declare-fun mapDefault!20050 () ValueCell!5793)

(assert (=> b!456705 (= condMapEmpty!20050 (= (arr!13617 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5793)) mapDefault!20050)))))

(declare-fun b!456706 () Bool)

(declare-fun res!272574 () Bool)

(assert (=> b!456706 (=> (not res!272574) (not e!266798))))

(assert (=> b!456706 (= res!272574 (bvsle from!863 i!563))))

(assert (= (and start!41000 res!272584) b!456698))

(assert (= (and b!456698 res!272580) b!456704))

(assert (= (and b!456704 res!272585) b!456692))

(assert (= (and b!456692 res!272576) b!456690))

(assert (= (and b!456690 res!272577) b!456703))

(assert (= (and b!456703 res!272582) b!456696))

(assert (= (and b!456696 res!272581) b!456701))

(assert (= (and b!456701 res!272578) b!456693))

(assert (= (and b!456693 res!272579) b!456702))

(assert (= (and b!456702 res!272573) b!456700))

(assert (= (and b!456700 res!272575) b!456706))

(assert (= (and b!456706 res!272574) b!456699))

(assert (= (and b!456699 res!272572) b!456691))

(assert (= (and b!456691 (not res!272583)) b!456695))

(assert (= (and b!456705 condMapEmpty!20050) mapIsEmpty!20050))

(assert (= (and b!456705 (not condMapEmpty!20050)) mapNonEmpty!20050))

(get-info :version)

(assert (= (and mapNonEmpty!20050 ((_ is ValueCellFull!5793) mapValue!20050)) b!456694))

(assert (= (and b!456705 ((_ is ValueCellFull!5793) mapDefault!20050)) b!456697))

(assert (= start!41000 b!456705))

(declare-fun m!440101 () Bool)

(assert (=> b!456696 m!440101))

(declare-fun m!440103 () Bool)

(assert (=> b!456690 m!440103))

(declare-fun m!440105 () Bool)

(assert (=> start!41000 m!440105))

(declare-fun m!440107 () Bool)

(assert (=> start!41000 m!440107))

(declare-fun m!440109 () Bool)

(assert (=> b!456701 m!440109))

(declare-fun m!440111 () Bool)

(assert (=> b!456692 m!440111))

(declare-fun m!440113 () Bool)

(assert (=> b!456702 m!440113))

(declare-fun m!440115 () Bool)

(assert (=> b!456702 m!440115))

(declare-fun m!440117 () Bool)

(assert (=> b!456699 m!440117))

(declare-fun m!440119 () Bool)

(assert (=> b!456699 m!440119))

(declare-fun m!440121 () Bool)

(assert (=> b!456699 m!440121))

(declare-fun m!440123 () Bool)

(assert (=> b!456691 m!440123))

(declare-fun m!440125 () Bool)

(assert (=> b!456691 m!440125))

(declare-fun m!440127 () Bool)

(assert (=> b!456691 m!440127))

(assert (=> b!456691 m!440127))

(declare-fun m!440129 () Bool)

(assert (=> b!456691 m!440129))

(assert (=> b!456691 m!440123))

(declare-fun m!440131 () Bool)

(assert (=> b!456691 m!440131))

(declare-fun m!440133 () Bool)

(assert (=> b!456691 m!440133))

(declare-fun m!440135 () Bool)

(assert (=> mapNonEmpty!20050 m!440135))

(declare-fun m!440137 () Bool)

(assert (=> b!456698 m!440137))

(declare-fun m!440139 () Bool)

(assert (=> b!456693 m!440139))

(declare-fun m!440141 () Bool)

(assert (=> b!456700 m!440141))

(check-sat (not b!456700) (not b!456696) (not mapNonEmpty!20050) (not b!456702) (not b!456693) (not b!456691) (not b!456690) b_and!19077 (not b!456699) (not start!41000) (not b_next!10935) tp_is_empty!12273 (not b!456698) (not b!456692))
(check-sat b_and!19077 (not b_next!10935))
