; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39074 () Bool)

(assert start!39074)

(declare-fun b_free!9355 () Bool)

(declare-fun b_next!9355 () Bool)

(assert (=> start!39074 (= b_free!9355 (not b_next!9355))))

(declare-fun tp!33593 () Bool)

(declare-fun b_and!16755 () Bool)

(assert (=> start!39074 (= tp!33593 b_and!16755)))

(declare-fun b!410543 () Bool)

(declare-fun e!246035 () Bool)

(declare-fun tp_is_empty!10507 () Bool)

(assert (=> b!410543 (= e!246035 tp_is_empty!10507)))

(declare-fun b!410544 () Bool)

(declare-fun res!238010 () Bool)

(declare-fun e!246037 () Bool)

(assert (=> b!410544 (=> (not res!238010) (not e!246037))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!410544 (= res!238010 (bvsle from!863 i!563))))

(declare-fun b!410545 () Bool)

(declare-fun e!246036 () Bool)

(declare-fun mapRes!17382 () Bool)

(assert (=> b!410545 (= e!246036 (and e!246035 mapRes!17382))))

(declare-fun condMapEmpty!17382 () Bool)

(declare-datatypes ((V!15115 0))(
  ( (V!15116 (val!5298 Int)) )
))
(declare-datatypes ((ValueCell!4910 0))(
  ( (ValueCellFull!4910 (v!7546 V!15115)) (EmptyCell!4910) )
))
(declare-datatypes ((array!24880 0))(
  ( (array!24881 (arr!11889 (Array (_ BitVec 32) ValueCell!4910)) (size!12241 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24880)

(declare-fun mapDefault!17382 () ValueCell!4910)

(assert (=> b!410545 (= condMapEmpty!17382 (= (arr!11889 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4910)) mapDefault!17382)))))

(declare-fun b!410546 () Bool)

(declare-fun res!238012 () Bool)

(declare-fun e!246039 () Bool)

(assert (=> b!410546 (=> (not res!238012) (not e!246039))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!410546 (= res!238012 (validMask!0 mask!1025))))

(declare-fun b!410547 () Bool)

(declare-fun e!246038 () Bool)

(assert (=> b!410547 (= e!246038 tp_is_empty!10507)))

(declare-fun b!410548 () Bool)

(declare-fun res!238019 () Bool)

(assert (=> b!410548 (=> (not res!238019) (not e!246039))))

(declare-datatypes ((array!24882 0))(
  ( (array!24883 (arr!11890 (Array (_ BitVec 32) (_ BitVec 64))) (size!12242 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24882)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24882 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!410548 (= res!238019 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17382 () Bool)

(declare-fun tp!33594 () Bool)

(assert (=> mapNonEmpty!17382 (= mapRes!17382 (and tp!33594 e!246038))))

(declare-fun mapRest!17382 () (Array (_ BitVec 32) ValueCell!4910))

(declare-fun mapValue!17382 () ValueCell!4910)

(declare-fun mapKey!17382 () (_ BitVec 32))

(assert (=> mapNonEmpty!17382 (= (arr!11889 _values!549) (store mapRest!17382 mapKey!17382 mapValue!17382))))

(declare-fun b!410549 () Bool)

(declare-fun res!238020 () Bool)

(assert (=> b!410549 (=> (not res!238020) (not e!246039))))

(assert (=> b!410549 (= res!238020 (or (= (select (arr!11890 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11890 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!410550 () Bool)

(declare-fun res!238018 () Bool)

(assert (=> b!410550 (=> (not res!238018) (not e!246039))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!410550 (= res!238018 (and (= (size!12241 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12242 _keys!709) (size!12241 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!410551 () Bool)

(declare-fun res!238015 () Bool)

(assert (=> b!410551 (=> (not res!238015) (not e!246039))))

(declare-datatypes ((List!6762 0))(
  ( (Nil!6759) (Cons!6758 (h!7614 (_ BitVec 64)) (t!11928 List!6762)) )
))
(declare-fun arrayNoDuplicates!0 (array!24882 (_ BitVec 32) List!6762) Bool)

(assert (=> b!410551 (= res!238015 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6759))))

(declare-fun b!410552 () Bool)

(declare-fun res!238016 () Bool)

(assert (=> b!410552 (=> (not res!238016) (not e!246039))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!410552 (= res!238016 (validKeyInArray!0 k0!794))))

(declare-fun res!238017 () Bool)

(assert (=> start!39074 (=> (not res!238017) (not e!246039))))

(assert (=> start!39074 (= res!238017 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12242 _keys!709))))))

(assert (=> start!39074 e!246039))

(assert (=> start!39074 tp_is_empty!10507))

(assert (=> start!39074 tp!33593))

(assert (=> start!39074 true))

(declare-fun array_inv!8756 (array!24880) Bool)

(assert (=> start!39074 (and (array_inv!8756 _values!549) e!246036)))

(declare-fun array_inv!8757 (array!24882) Bool)

(assert (=> start!39074 (array_inv!8757 _keys!709)))

(declare-fun b!410553 () Bool)

(declare-fun res!238014 () Bool)

(assert (=> b!410553 (=> (not res!238014) (not e!246039))))

(assert (=> b!410553 (= res!238014 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12242 _keys!709))))))

(declare-fun b!410554 () Bool)

(assert (=> b!410554 (= e!246037 false)))

(declare-fun minValue!515 () V!15115)

(declare-fun zeroValue!515 () V!15115)

(declare-fun lt!189132 () array!24882)

(declare-datatypes ((tuple2!6744 0))(
  ( (tuple2!6745 (_1!3383 (_ BitVec 64)) (_2!3383 V!15115)) )
))
(declare-datatypes ((List!6763 0))(
  ( (Nil!6760) (Cons!6759 (h!7615 tuple2!6744) (t!11929 List!6763)) )
))
(declare-datatypes ((ListLongMap!5659 0))(
  ( (ListLongMap!5660 (toList!2845 List!6763)) )
))
(declare-fun lt!189130 () ListLongMap!5659)

(declare-fun v!412 () V!15115)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1097 (array!24882 array!24880 (_ BitVec 32) (_ BitVec 32) V!15115 V!15115 (_ BitVec 32) Int) ListLongMap!5659)

(assert (=> b!410554 (= lt!189130 (getCurrentListMapNoExtraKeys!1097 lt!189132 (array!24881 (store (arr!11889 _values!549) i!563 (ValueCellFull!4910 v!412)) (size!12241 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189131 () ListLongMap!5659)

(assert (=> b!410554 (= lt!189131 (getCurrentListMapNoExtraKeys!1097 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!410555 () Bool)

(declare-fun res!238013 () Bool)

(assert (=> b!410555 (=> (not res!238013) (not e!246037))))

(assert (=> b!410555 (= res!238013 (arrayNoDuplicates!0 lt!189132 #b00000000000000000000000000000000 Nil!6759))))

(declare-fun b!410556 () Bool)

(assert (=> b!410556 (= e!246039 e!246037)))

(declare-fun res!238011 () Bool)

(assert (=> b!410556 (=> (not res!238011) (not e!246037))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24882 (_ BitVec 32)) Bool)

(assert (=> b!410556 (= res!238011 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189132 mask!1025))))

(assert (=> b!410556 (= lt!189132 (array!24883 (store (arr!11890 _keys!709) i!563 k0!794) (size!12242 _keys!709)))))

(declare-fun mapIsEmpty!17382 () Bool)

(assert (=> mapIsEmpty!17382 mapRes!17382))

(declare-fun b!410557 () Bool)

(declare-fun res!238009 () Bool)

(assert (=> b!410557 (=> (not res!238009) (not e!246039))))

(assert (=> b!410557 (= res!238009 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!39074 res!238017) b!410546))

(assert (= (and b!410546 res!238012) b!410550))

(assert (= (and b!410550 res!238018) b!410557))

(assert (= (and b!410557 res!238009) b!410551))

(assert (= (and b!410551 res!238015) b!410553))

(assert (= (and b!410553 res!238014) b!410552))

(assert (= (and b!410552 res!238016) b!410549))

(assert (= (and b!410549 res!238020) b!410548))

(assert (= (and b!410548 res!238019) b!410556))

(assert (= (and b!410556 res!238011) b!410555))

(assert (= (and b!410555 res!238013) b!410544))

(assert (= (and b!410544 res!238010) b!410554))

(assert (= (and b!410545 condMapEmpty!17382) mapIsEmpty!17382))

(assert (= (and b!410545 (not condMapEmpty!17382)) mapNonEmpty!17382))

(get-info :version)

(assert (= (and mapNonEmpty!17382 ((_ is ValueCellFull!4910) mapValue!17382)) b!410547))

(assert (= (and b!410545 ((_ is ValueCellFull!4910) mapDefault!17382)) b!410543))

(assert (= start!39074 b!410545))

(declare-fun m!401253 () Bool)

(assert (=> b!410549 m!401253))

(declare-fun m!401255 () Bool)

(assert (=> start!39074 m!401255))

(declare-fun m!401257 () Bool)

(assert (=> start!39074 m!401257))

(declare-fun m!401259 () Bool)

(assert (=> b!410556 m!401259))

(declare-fun m!401261 () Bool)

(assert (=> b!410556 m!401261))

(declare-fun m!401263 () Bool)

(assert (=> b!410548 m!401263))

(declare-fun m!401265 () Bool)

(assert (=> b!410546 m!401265))

(declare-fun m!401267 () Bool)

(assert (=> b!410557 m!401267))

(declare-fun m!401269 () Bool)

(assert (=> b!410552 m!401269))

(declare-fun m!401271 () Bool)

(assert (=> b!410554 m!401271))

(declare-fun m!401273 () Bool)

(assert (=> b!410554 m!401273))

(declare-fun m!401275 () Bool)

(assert (=> b!410554 m!401275))

(declare-fun m!401277 () Bool)

(assert (=> b!410551 m!401277))

(declare-fun m!401279 () Bool)

(assert (=> mapNonEmpty!17382 m!401279))

(declare-fun m!401281 () Bool)

(assert (=> b!410555 m!401281))

(check-sat (not b!410551) (not b!410556) (not b_next!9355) (not b!410557) (not b!410555) (not b!410548) (not b!410546) (not b!410552) (not b!410554) (not start!39074) (not mapNonEmpty!17382) tp_is_empty!10507 b_and!16755)
(check-sat b_and!16755 (not b_next!9355))
