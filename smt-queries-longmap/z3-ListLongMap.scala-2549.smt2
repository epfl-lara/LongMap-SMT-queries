; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39098 () Bool)

(assert start!39098)

(declare-fun b_free!9379 () Bool)

(declare-fun b_next!9379 () Bool)

(assert (=> start!39098 (= b_free!9379 (not b_next!9379))))

(declare-fun tp!33665 () Bool)

(declare-fun b_and!16779 () Bool)

(assert (=> start!39098 (= tp!33665 b_and!16779)))

(declare-fun b!411083 () Bool)

(declare-fun e!246256 () Bool)

(declare-fun e!246252 () Bool)

(assert (=> b!411083 (= e!246256 e!246252)))

(declare-fun res!238445 () Bool)

(assert (=> b!411083 (=> (not res!238445) (not e!246252))))

(declare-datatypes ((array!24926 0))(
  ( (array!24927 (arr!11912 (Array (_ BitVec 32) (_ BitVec 64))) (size!12264 (_ BitVec 32))) )
))
(declare-fun lt!189239 () array!24926)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24926 (_ BitVec 32)) Bool)

(assert (=> b!411083 (= res!238445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189239 mask!1025))))

(declare-fun _keys!709 () array!24926)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!411083 (= lt!189239 (array!24927 (store (arr!11912 _keys!709) i!563 k0!794) (size!12264 _keys!709)))))

(declare-fun b!411084 () Bool)

(declare-fun res!238446 () Bool)

(assert (=> b!411084 (=> (not res!238446) (not e!246256))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!411084 (= res!238446 (validKeyInArray!0 k0!794))))

(declare-fun b!411085 () Bool)

(declare-fun res!238441 () Bool)

(assert (=> b!411085 (=> (not res!238441) (not e!246256))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15147 0))(
  ( (V!15148 (val!5310 Int)) )
))
(declare-datatypes ((ValueCell!4922 0))(
  ( (ValueCellFull!4922 (v!7558 V!15147)) (EmptyCell!4922) )
))
(declare-datatypes ((array!24928 0))(
  ( (array!24929 (arr!11913 (Array (_ BitVec 32) ValueCell!4922)) (size!12265 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24928)

(assert (=> b!411085 (= res!238441 (and (= (size!12265 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12264 _keys!709) (size!12265 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!411087 () Bool)

(declare-fun res!238452 () Bool)

(assert (=> b!411087 (=> (not res!238452) (not e!246256))))

(assert (=> b!411087 (= res!238452 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!411088 () Bool)

(declare-fun e!246251 () Bool)

(declare-fun tp_is_empty!10531 () Bool)

(assert (=> b!411088 (= e!246251 tp_is_empty!10531)))

(declare-fun b!411089 () Bool)

(declare-fun e!246253 () Bool)

(assert (=> b!411089 (= e!246253 tp_is_empty!10531)))

(declare-fun b!411090 () Bool)

(declare-fun res!238448 () Bool)

(assert (=> b!411090 (=> (not res!238448) (not e!246256))))

(assert (=> b!411090 (= res!238448 (or (= (select (arr!11912 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11912 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!411091 () Bool)

(declare-fun res!238444 () Bool)

(assert (=> b!411091 (=> (not res!238444) (not e!246256))))

(declare-fun arrayContainsKey!0 (array!24926 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!411091 (= res!238444 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!411092 () Bool)

(declare-fun res!238447 () Bool)

(assert (=> b!411092 (=> (not res!238447) (not e!246252))))

(declare-datatypes ((List!6775 0))(
  ( (Nil!6772) (Cons!6771 (h!7627 (_ BitVec 64)) (t!11941 List!6775)) )
))
(declare-fun arrayNoDuplicates!0 (array!24926 (_ BitVec 32) List!6775) Bool)

(assert (=> b!411092 (= res!238447 (arrayNoDuplicates!0 lt!189239 #b00000000000000000000000000000000 Nil!6772))))

(declare-fun b!411093 () Bool)

(declare-fun res!238450 () Bool)

(assert (=> b!411093 (=> (not res!238450) (not e!246252))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!411093 (= res!238450 (bvsle from!863 i!563))))

(declare-fun b!411094 () Bool)

(assert (=> b!411094 (= e!246252 false)))

(declare-fun minValue!515 () V!15147)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15147)

(declare-datatypes ((tuple2!6758 0))(
  ( (tuple2!6759 (_1!3390 (_ BitVec 64)) (_2!3390 V!15147)) )
))
(declare-datatypes ((List!6776 0))(
  ( (Nil!6773) (Cons!6772 (h!7628 tuple2!6758) (t!11942 List!6776)) )
))
(declare-datatypes ((ListLongMap!5673 0))(
  ( (ListLongMap!5674 (toList!2852 List!6776)) )
))
(declare-fun lt!189240 () ListLongMap!5673)

(declare-fun v!412 () V!15147)

(declare-fun getCurrentListMapNoExtraKeys!1104 (array!24926 array!24928 (_ BitVec 32) (_ BitVec 32) V!15147 V!15147 (_ BitVec 32) Int) ListLongMap!5673)

(assert (=> b!411094 (= lt!189240 (getCurrentListMapNoExtraKeys!1104 lt!189239 (array!24929 (store (arr!11913 _values!549) i!563 (ValueCellFull!4922 v!412)) (size!12265 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189238 () ListLongMap!5673)

(assert (=> b!411094 (= lt!189238 (getCurrentListMapNoExtraKeys!1104 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!411095 () Bool)

(declare-fun res!238443 () Bool)

(assert (=> b!411095 (=> (not res!238443) (not e!246256))))

(assert (=> b!411095 (= res!238443 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12264 _keys!709))))))

(declare-fun mapNonEmpty!17418 () Bool)

(declare-fun mapRes!17418 () Bool)

(declare-fun tp!33666 () Bool)

(assert (=> mapNonEmpty!17418 (= mapRes!17418 (and tp!33666 e!246253))))

(declare-fun mapRest!17418 () (Array (_ BitVec 32) ValueCell!4922))

(declare-fun mapValue!17418 () ValueCell!4922)

(declare-fun mapKey!17418 () (_ BitVec 32))

(assert (=> mapNonEmpty!17418 (= (arr!11913 _values!549) (store mapRest!17418 mapKey!17418 mapValue!17418))))

(declare-fun b!411096 () Bool)

(declare-fun e!246255 () Bool)

(assert (=> b!411096 (= e!246255 (and e!246251 mapRes!17418))))

(declare-fun condMapEmpty!17418 () Bool)

(declare-fun mapDefault!17418 () ValueCell!4922)

(assert (=> b!411096 (= condMapEmpty!17418 (= (arr!11913 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4922)) mapDefault!17418)))))

(declare-fun res!238451 () Bool)

(assert (=> start!39098 (=> (not res!238451) (not e!246256))))

(assert (=> start!39098 (= res!238451 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12264 _keys!709))))))

(assert (=> start!39098 e!246256))

(assert (=> start!39098 tp_is_empty!10531))

(assert (=> start!39098 tp!33665))

(assert (=> start!39098 true))

(declare-fun array_inv!8768 (array!24928) Bool)

(assert (=> start!39098 (and (array_inv!8768 _values!549) e!246255)))

(declare-fun array_inv!8769 (array!24926) Bool)

(assert (=> start!39098 (array_inv!8769 _keys!709)))

(declare-fun b!411086 () Bool)

(declare-fun res!238442 () Bool)

(assert (=> b!411086 (=> (not res!238442) (not e!246256))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!411086 (= res!238442 (validMask!0 mask!1025))))

(declare-fun b!411097 () Bool)

(declare-fun res!238449 () Bool)

(assert (=> b!411097 (=> (not res!238449) (not e!246256))))

(assert (=> b!411097 (= res!238449 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6772))))

(declare-fun mapIsEmpty!17418 () Bool)

(assert (=> mapIsEmpty!17418 mapRes!17418))

(assert (= (and start!39098 res!238451) b!411086))

(assert (= (and b!411086 res!238442) b!411085))

(assert (= (and b!411085 res!238441) b!411087))

(assert (= (and b!411087 res!238452) b!411097))

(assert (= (and b!411097 res!238449) b!411095))

(assert (= (and b!411095 res!238443) b!411084))

(assert (= (and b!411084 res!238446) b!411090))

(assert (= (and b!411090 res!238448) b!411091))

(assert (= (and b!411091 res!238444) b!411083))

(assert (= (and b!411083 res!238445) b!411092))

(assert (= (and b!411092 res!238447) b!411093))

(assert (= (and b!411093 res!238450) b!411094))

(assert (= (and b!411096 condMapEmpty!17418) mapIsEmpty!17418))

(assert (= (and b!411096 (not condMapEmpty!17418)) mapNonEmpty!17418))

(get-info :version)

(assert (= (and mapNonEmpty!17418 ((_ is ValueCellFull!4922) mapValue!17418)) b!411089))

(assert (= (and b!411096 ((_ is ValueCellFull!4922) mapDefault!17418)) b!411088))

(assert (= start!39098 b!411096))

(declare-fun m!401613 () Bool)

(assert (=> b!411097 m!401613))

(declare-fun m!401615 () Bool)

(assert (=> b!411092 m!401615))

(declare-fun m!401617 () Bool)

(assert (=> b!411091 m!401617))

(declare-fun m!401619 () Bool)

(assert (=> b!411083 m!401619))

(declare-fun m!401621 () Bool)

(assert (=> b!411083 m!401621))

(declare-fun m!401623 () Bool)

(assert (=> b!411084 m!401623))

(declare-fun m!401625 () Bool)

(assert (=> b!411086 m!401625))

(declare-fun m!401627 () Bool)

(assert (=> b!411087 m!401627))

(declare-fun m!401629 () Bool)

(assert (=> b!411094 m!401629))

(declare-fun m!401631 () Bool)

(assert (=> b!411094 m!401631))

(declare-fun m!401633 () Bool)

(assert (=> b!411094 m!401633))

(declare-fun m!401635 () Bool)

(assert (=> b!411090 m!401635))

(declare-fun m!401637 () Bool)

(assert (=> start!39098 m!401637))

(declare-fun m!401639 () Bool)

(assert (=> start!39098 m!401639))

(declare-fun m!401641 () Bool)

(assert (=> mapNonEmpty!17418 m!401641))

(check-sat (not b!411097) (not b!411083) (not b!411084) (not b!411086) (not b!411087) (not b!411094) (not mapNonEmpty!17418) (not b!411092) b_and!16779 tp_is_empty!10531 (not b!411091) (not b_next!9379) (not start!39098))
(check-sat b_and!16779 (not b_next!9379))
