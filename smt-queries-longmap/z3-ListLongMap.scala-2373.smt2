; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37702 () Bool)

(assert start!37702)

(declare-fun b_free!8805 () Bool)

(declare-fun b_next!8805 () Bool)

(assert (=> start!37702 (= b_free!8805 (not b_next!8805))))

(declare-fun tp!31166 () Bool)

(declare-fun b_and!16047 () Bool)

(assert (=> start!37702 (= tp!31166 b_and!16047)))

(declare-fun mapNonEmpty!15780 () Bool)

(declare-fun mapRes!15780 () Bool)

(declare-fun tp!31167 () Bool)

(declare-fun e!234412 () Bool)

(assert (=> mapNonEmpty!15780 (= mapRes!15780 (and tp!31167 e!234412))))

(declare-datatypes ((V!13741 0))(
  ( (V!13742 (val!4783 Int)) )
))
(declare-datatypes ((ValueCell!4395 0))(
  ( (ValueCellFull!4395 (v!6980 V!13741)) (EmptyCell!4395) )
))
(declare-datatypes ((array!22849 0))(
  ( (array!22850 (arr!10893 (Array (_ BitVec 32) ValueCell!4395)) (size!11245 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22849)

(declare-fun mapValue!15780 () ValueCell!4395)

(declare-fun mapRest!15780 () (Array (_ BitVec 32) ValueCell!4395))

(declare-fun mapKey!15780 () (_ BitVec 32))

(assert (=> mapNonEmpty!15780 (= (arr!10893 _values!506) (store mapRest!15780 mapKey!15780 mapValue!15780))))

(declare-fun b!386402 () Bool)

(declare-fun res!220581 () Bool)

(declare-fun e!234416 () Bool)

(assert (=> b!386402 (=> (not res!220581) (not e!234416))))

(declare-datatypes ((array!22851 0))(
  ( (array!22852 (arr!10894 (Array (_ BitVec 32) (_ BitVec 64))) (size!11246 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22851)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!386402 (= res!220581 (or (= (select (arr!10894 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10894 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!386403 () Bool)

(declare-fun res!220578 () Bool)

(assert (=> b!386403 (=> (not res!220578) (not e!234416))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22851 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!386403 (= res!220578 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!386404 () Bool)

(declare-fun res!220586 () Bool)

(assert (=> b!386404 (=> (not res!220586) (not e!234416))))

(declare-datatypes ((List!6275 0))(
  ( (Nil!6272) (Cons!6271 (h!7127 (_ BitVec 64)) (t!11425 List!6275)) )
))
(declare-fun arrayNoDuplicates!0 (array!22851 (_ BitVec 32) List!6275) Bool)

(assert (=> b!386404 (= res!220586 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6272))))

(declare-fun b!386405 () Bool)

(declare-fun res!220585 () Bool)

(assert (=> b!386405 (=> (not res!220585) (not e!234416))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!386405 (= res!220585 (validKeyInArray!0 k0!778))))

(declare-fun b!386406 () Bool)

(declare-fun tp_is_empty!9477 () Bool)

(assert (=> b!386406 (= e!234412 tp_is_empty!9477)))

(declare-fun b!386407 () Bool)

(declare-fun e!234411 () Bool)

(declare-fun e!234415 () Bool)

(assert (=> b!386407 (= e!234411 (and e!234415 mapRes!15780))))

(declare-fun condMapEmpty!15780 () Bool)

(declare-fun mapDefault!15780 () ValueCell!4395)

(assert (=> b!386407 (= condMapEmpty!15780 (= (arr!10893 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4395)) mapDefault!15780)))))

(declare-fun b!386408 () Bool)

(declare-fun res!220584 () Bool)

(assert (=> b!386408 (=> (not res!220584) (not e!234416))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22851 (_ BitVec 32)) Bool)

(assert (=> b!386408 (= res!220584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!220582 () Bool)

(assert (=> start!37702 (=> (not res!220582) (not e!234416))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37702 (= res!220582 (validMask!0 mask!970))))

(assert (=> start!37702 e!234416))

(declare-fun array_inv!8014 (array!22849) Bool)

(assert (=> start!37702 (and (array_inv!8014 _values!506) e!234411)))

(assert (=> start!37702 tp!31166))

(assert (=> start!37702 true))

(assert (=> start!37702 tp_is_empty!9477))

(declare-fun array_inv!8015 (array!22851) Bool)

(assert (=> start!37702 (array_inv!8015 _keys!658)))

(declare-fun b!386409 () Bool)

(declare-fun res!220583 () Bool)

(declare-fun e!234414 () Bool)

(assert (=> b!386409 (=> (not res!220583) (not e!234414))))

(declare-fun lt!181798 () array!22851)

(assert (=> b!386409 (= res!220583 (arrayNoDuplicates!0 lt!181798 #b00000000000000000000000000000000 Nil!6272))))

(declare-fun b!386410 () Bool)

(assert (=> b!386410 (= e!234416 e!234414)))

(declare-fun res!220580 () Bool)

(assert (=> b!386410 (=> (not res!220580) (not e!234414))))

(assert (=> b!386410 (= res!220580 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181798 mask!970))))

(assert (=> b!386410 (= lt!181798 (array!22852 (store (arr!10894 _keys!658) i!548 k0!778) (size!11246 _keys!658)))))

(declare-fun mapIsEmpty!15780 () Bool)

(assert (=> mapIsEmpty!15780 mapRes!15780))

(declare-fun b!386411 () Bool)

(assert (=> b!386411 (= e!234415 tp_is_empty!9477)))

(declare-fun b!386412 () Bool)

(assert (=> b!386412 (= e!234414 false)))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13741)

(declare-datatypes ((tuple2!6428 0))(
  ( (tuple2!6429 (_1!3225 (_ BitVec 64)) (_2!3225 V!13741)) )
))
(declare-datatypes ((List!6276 0))(
  ( (Nil!6273) (Cons!6272 (h!7128 tuple2!6428) (t!11426 List!6276)) )
))
(declare-datatypes ((ListLongMap!5341 0))(
  ( (ListLongMap!5342 (toList!2686 List!6276)) )
))
(declare-fun lt!181800 () ListLongMap!5341)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!13741)

(declare-fun minValue!472 () V!13741)

(declare-fun getCurrentListMapNoExtraKeys!915 (array!22851 array!22849 (_ BitVec 32) (_ BitVec 32) V!13741 V!13741 (_ BitVec 32) Int) ListLongMap!5341)

(assert (=> b!386412 (= lt!181800 (getCurrentListMapNoExtraKeys!915 lt!181798 (array!22850 (store (arr!10893 _values!506) i!548 (ValueCellFull!4395 v!373)) (size!11245 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181799 () ListLongMap!5341)

(assert (=> b!386412 (= lt!181799 (getCurrentListMapNoExtraKeys!915 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!386413 () Bool)

(declare-fun res!220579 () Bool)

(assert (=> b!386413 (=> (not res!220579) (not e!234416))))

(assert (=> b!386413 (= res!220579 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11246 _keys!658))))))

(declare-fun b!386414 () Bool)

(declare-fun res!220577 () Bool)

(assert (=> b!386414 (=> (not res!220577) (not e!234416))))

(assert (=> b!386414 (= res!220577 (and (= (size!11245 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11246 _keys!658) (size!11245 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(assert (= (and start!37702 res!220582) b!386414))

(assert (= (and b!386414 res!220577) b!386408))

(assert (= (and b!386408 res!220584) b!386404))

(assert (= (and b!386404 res!220586) b!386413))

(assert (= (and b!386413 res!220579) b!386405))

(assert (= (and b!386405 res!220585) b!386402))

(assert (= (and b!386402 res!220581) b!386403))

(assert (= (and b!386403 res!220578) b!386410))

(assert (= (and b!386410 res!220580) b!386409))

(assert (= (and b!386409 res!220583) b!386412))

(assert (= (and b!386407 condMapEmpty!15780) mapIsEmpty!15780))

(assert (= (and b!386407 (not condMapEmpty!15780)) mapNonEmpty!15780))

(get-info :version)

(assert (= (and mapNonEmpty!15780 ((_ is ValueCellFull!4395) mapValue!15780)) b!386406))

(assert (= (and b!386407 ((_ is ValueCellFull!4395) mapDefault!15780)) b!386411))

(assert (= start!37702 b!386407))

(declare-fun m!382755 () Bool)

(assert (=> mapNonEmpty!15780 m!382755))

(declare-fun m!382757 () Bool)

(assert (=> b!386408 m!382757))

(declare-fun m!382759 () Bool)

(assert (=> b!386403 m!382759))

(declare-fun m!382761 () Bool)

(assert (=> start!37702 m!382761))

(declare-fun m!382763 () Bool)

(assert (=> start!37702 m!382763))

(declare-fun m!382765 () Bool)

(assert (=> start!37702 m!382765))

(declare-fun m!382767 () Bool)

(assert (=> b!386405 m!382767))

(declare-fun m!382769 () Bool)

(assert (=> b!386410 m!382769))

(declare-fun m!382771 () Bool)

(assert (=> b!386410 m!382771))

(declare-fun m!382773 () Bool)

(assert (=> b!386404 m!382773))

(declare-fun m!382775 () Bool)

(assert (=> b!386402 m!382775))

(declare-fun m!382777 () Bool)

(assert (=> b!386412 m!382777))

(declare-fun m!382779 () Bool)

(assert (=> b!386412 m!382779))

(declare-fun m!382781 () Bool)

(assert (=> b!386412 m!382781))

(declare-fun m!382783 () Bool)

(assert (=> b!386409 m!382783))

(check-sat (not b!386409) (not b!386410) (not b!386404) (not b_next!8805) (not b!386403) (not mapNonEmpty!15780) (not b!386408) b_and!16047 tp_is_empty!9477 (not b!386405) (not b!386412) (not start!37702))
(check-sat b_and!16047 (not b_next!8805))
