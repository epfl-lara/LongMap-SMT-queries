; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37560 () Bool)

(assert start!37560)

(declare-fun b_free!8701 () Bool)

(declare-fun b_next!8701 () Bool)

(assert (=> start!37560 (= b_free!8701 (not b_next!8701))))

(declare-fun tp!30818 () Bool)

(declare-fun b_and!15917 () Bool)

(assert (=> start!37560 (= tp!30818 b_and!15917)))

(declare-fun b!383727 () Bool)

(declare-fun res!218623 () Bool)

(declare-fun e!233006 () Bool)

(assert (=> b!383727 (=> (not res!218623) (not e!233006))))

(declare-datatypes ((array!22587 0))(
  ( (array!22588 (arr!10762 (Array (_ BitVec 32) (_ BitVec 64))) (size!11115 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22587)

(declare-datatypes ((List!6154 0))(
  ( (Nil!6151) (Cons!6150 (h!7006 (_ BitVec 64)) (t!11295 List!6154)) )
))
(declare-fun arrayNoDuplicates!0 (array!22587 (_ BitVec 32) List!6154) Bool)

(assert (=> b!383727 (= res!218623 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6151))))

(declare-fun b!383728 () Bool)

(declare-fun res!218626 () Bool)

(declare-fun e!233010 () Bool)

(assert (=> b!383728 (=> (not res!218626) (not e!233010))))

(declare-fun lt!180324 () array!22587)

(assert (=> b!383728 (= res!218626 (arrayNoDuplicates!0 lt!180324 #b00000000000000000000000000000000 Nil!6151))))

(declare-fun b!383729 () Bool)

(declare-fun res!218630 () Bool)

(assert (=> b!383729 (=> (not res!218630) (not e!233006))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun mask!970 () (_ BitVec 32))

(declare-datatypes ((V!13571 0))(
  ( (V!13572 (val!4719 Int)) )
))
(declare-datatypes ((ValueCell!4331 0))(
  ( (ValueCellFull!4331 (v!6910 V!13571)) (EmptyCell!4331) )
))
(declare-datatypes ((array!22589 0))(
  ( (array!22590 (arr!10763 (Array (_ BitVec 32) ValueCell!4331)) (size!11116 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22589)

(assert (=> b!383729 (= res!218630 (and (= (size!11116 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11115 _keys!658) (size!11116 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!15588 () Bool)

(declare-fun mapRes!15588 () Bool)

(declare-fun tp!30819 () Bool)

(declare-fun e!233008 () Bool)

(assert (=> mapNonEmpty!15588 (= mapRes!15588 (and tp!30819 e!233008))))

(declare-fun mapKey!15588 () (_ BitVec 32))

(declare-fun mapRest!15588 () (Array (_ BitVec 32) ValueCell!4331))

(declare-fun mapValue!15588 () ValueCell!4331)

(assert (=> mapNonEmpty!15588 (= (arr!10763 _values!506) (store mapRest!15588 mapKey!15588 mapValue!15588))))

(declare-fun b!383730 () Bool)

(declare-fun e!233011 () Bool)

(declare-fun tp_is_empty!9349 () Bool)

(assert (=> b!383730 (= e!233011 tp_is_empty!9349)))

(declare-fun b!383731 () Bool)

(declare-fun e!233007 () Bool)

(assert (=> b!383731 (= e!233007 (and e!233011 mapRes!15588))))

(declare-fun condMapEmpty!15588 () Bool)

(declare-fun mapDefault!15588 () ValueCell!4331)

(assert (=> b!383731 (= condMapEmpty!15588 (= (arr!10763 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4331)) mapDefault!15588)))))

(declare-fun mapIsEmpty!15588 () Bool)

(assert (=> mapIsEmpty!15588 mapRes!15588))

(declare-fun b!383732 () Bool)

(assert (=> b!383732 (= e!233008 tp_is_empty!9349)))

(declare-fun b!383733 () Bool)

(declare-fun res!218628 () Bool)

(assert (=> b!383733 (=> (not res!218628) (not e!233006))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22587 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!383733 (= res!218628 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun res!218621 () Bool)

(assert (=> start!37560 (=> (not res!218621) (not e!233006))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37560 (= res!218621 (validMask!0 mask!970))))

(assert (=> start!37560 e!233006))

(declare-fun array_inv!7924 (array!22589) Bool)

(assert (=> start!37560 (and (array_inv!7924 _values!506) e!233007)))

(assert (=> start!37560 tp!30818))

(assert (=> start!37560 true))

(assert (=> start!37560 tp_is_empty!9349))

(declare-fun array_inv!7925 (array!22587) Bool)

(assert (=> start!37560 (array_inv!7925 _keys!658)))

(declare-fun b!383734 () Bool)

(declare-fun res!218624 () Bool)

(assert (=> b!383734 (=> (not res!218624) (not e!233006))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!383734 (= res!218624 (validKeyInArray!0 k0!778))))

(declare-fun b!383735 () Bool)

(declare-fun e!233012 () Bool)

(assert (=> b!383735 (= e!233012 true)))

(declare-datatypes ((tuple2!6332 0))(
  ( (tuple2!6333 (_1!3177 (_ BitVec 64)) (_2!3177 V!13571)) )
))
(declare-datatypes ((List!6155 0))(
  ( (Nil!6152) (Cons!6151 (h!7007 tuple2!6332) (t!11296 List!6155)) )
))
(declare-datatypes ((ListLongMap!5235 0))(
  ( (ListLongMap!5236 (toList!2633 List!6155)) )
))
(declare-fun lt!180328 () ListLongMap!5235)

(declare-fun lt!180327 () ListLongMap!5235)

(declare-fun lt!180322 () tuple2!6332)

(declare-fun +!990 (ListLongMap!5235 tuple2!6332) ListLongMap!5235)

(assert (=> b!383735 (= lt!180328 (+!990 lt!180327 lt!180322))))

(declare-fun lt!180326 () ListLongMap!5235)

(declare-fun lt!180320 () ListLongMap!5235)

(assert (=> b!383735 (= lt!180326 lt!180320)))

(declare-fun b!383736 () Bool)

(declare-fun res!218629 () Bool)

(assert (=> b!383736 (=> (not res!218629) (not e!233006))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!383736 (= res!218629 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11115 _keys!658))))))

(declare-fun b!383737 () Bool)

(declare-fun res!218625 () Bool)

(assert (=> b!383737 (=> (not res!218625) (not e!233006))))

(assert (=> b!383737 (= res!218625 (or (= (select (arr!10762 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10762 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!383738 () Bool)

(declare-fun res!218620 () Bool)

(assert (=> b!383738 (=> (not res!218620) (not e!233006))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22587 (_ BitVec 32)) Bool)

(assert (=> b!383738 (= res!218620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!383739 () Bool)

(assert (=> b!383739 (= e!233006 e!233010)))

(declare-fun res!218627 () Bool)

(assert (=> b!383739 (=> (not res!218627) (not e!233010))))

(assert (=> b!383739 (= res!218627 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!180324 mask!970))))

(assert (=> b!383739 (= lt!180324 (array!22588 (store (arr!10762 _keys!658) i!548 k0!778) (size!11115 _keys!658)))))

(declare-fun b!383740 () Bool)

(assert (=> b!383740 (= e!233010 (not e!233012))))

(declare-fun res!218622 () Bool)

(assert (=> b!383740 (=> res!218622 e!233012)))

(declare-fun lt!180321 () Bool)

(assert (=> b!383740 (= res!218622 (or (and (not lt!180321) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!180321) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!180321)))))

(assert (=> b!383740 (= lt!180321 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13571)

(declare-fun minValue!472 () V!13571)

(declare-fun getCurrentListMap!2012 (array!22587 array!22589 (_ BitVec 32) (_ BitVec 32) V!13571 V!13571 (_ BitVec 32) Int) ListLongMap!5235)

(assert (=> b!383740 (= lt!180327 (getCurrentListMap!2012 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180329 () array!22589)

(assert (=> b!383740 (= lt!180326 (getCurrentListMap!2012 lt!180324 lt!180329 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180323 () ListLongMap!5235)

(assert (=> b!383740 (and (= lt!180320 lt!180323) (= lt!180323 lt!180320))))

(declare-fun lt!180330 () ListLongMap!5235)

(assert (=> b!383740 (= lt!180323 (+!990 lt!180330 lt!180322))))

(declare-fun v!373 () V!13571)

(assert (=> b!383740 (= lt!180322 (tuple2!6333 k0!778 v!373))))

(declare-datatypes ((Unit!11830 0))(
  ( (Unit!11831) )
))
(declare-fun lt!180325 () Unit!11830)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!205 (array!22587 array!22589 (_ BitVec 32) (_ BitVec 32) V!13571 V!13571 (_ BitVec 32) (_ BitVec 64) V!13571 (_ BitVec 32) Int) Unit!11830)

(assert (=> b!383740 (= lt!180325 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!205 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!877 (array!22587 array!22589 (_ BitVec 32) (_ BitVec 32) V!13571 V!13571 (_ BitVec 32) Int) ListLongMap!5235)

(assert (=> b!383740 (= lt!180320 (getCurrentListMapNoExtraKeys!877 lt!180324 lt!180329 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!383740 (= lt!180329 (array!22590 (store (arr!10763 _values!506) i!548 (ValueCellFull!4331 v!373)) (size!11116 _values!506)))))

(assert (=> b!383740 (= lt!180330 (getCurrentListMapNoExtraKeys!877 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and start!37560 res!218621) b!383729))

(assert (= (and b!383729 res!218630) b!383738))

(assert (= (and b!383738 res!218620) b!383727))

(assert (= (and b!383727 res!218623) b!383736))

(assert (= (and b!383736 res!218629) b!383734))

(assert (= (and b!383734 res!218624) b!383737))

(assert (= (and b!383737 res!218625) b!383733))

(assert (= (and b!383733 res!218628) b!383739))

(assert (= (and b!383739 res!218627) b!383728))

(assert (= (and b!383728 res!218626) b!383740))

(assert (= (and b!383740 (not res!218622)) b!383735))

(assert (= (and b!383731 condMapEmpty!15588) mapIsEmpty!15588))

(assert (= (and b!383731 (not condMapEmpty!15588)) mapNonEmpty!15588))

(get-info :version)

(assert (= (and mapNonEmpty!15588 ((_ is ValueCellFull!4331) mapValue!15588)) b!383732))

(assert (= (and b!383731 ((_ is ValueCellFull!4331) mapDefault!15588)) b!383730))

(assert (= start!37560 b!383731))

(declare-fun m!379991 () Bool)

(assert (=> b!383728 m!379991))

(declare-fun m!379993 () Bool)

(assert (=> b!383727 m!379993))

(declare-fun m!379995 () Bool)

(assert (=> b!383738 m!379995))

(declare-fun m!379997 () Bool)

(assert (=> start!37560 m!379997))

(declare-fun m!379999 () Bool)

(assert (=> start!37560 m!379999))

(declare-fun m!380001 () Bool)

(assert (=> start!37560 m!380001))

(declare-fun m!380003 () Bool)

(assert (=> b!383733 m!380003))

(declare-fun m!380005 () Bool)

(assert (=> b!383734 m!380005))

(declare-fun m!380007 () Bool)

(assert (=> mapNonEmpty!15588 m!380007))

(declare-fun m!380009 () Bool)

(assert (=> b!383735 m!380009))

(declare-fun m!380011 () Bool)

(assert (=> b!383737 m!380011))

(declare-fun m!380013 () Bool)

(assert (=> b!383739 m!380013))

(declare-fun m!380015 () Bool)

(assert (=> b!383739 m!380015))

(declare-fun m!380017 () Bool)

(assert (=> b!383740 m!380017))

(declare-fun m!380019 () Bool)

(assert (=> b!383740 m!380019))

(declare-fun m!380021 () Bool)

(assert (=> b!383740 m!380021))

(declare-fun m!380023 () Bool)

(assert (=> b!383740 m!380023))

(declare-fun m!380025 () Bool)

(assert (=> b!383740 m!380025))

(declare-fun m!380027 () Bool)

(assert (=> b!383740 m!380027))

(declare-fun m!380029 () Bool)

(assert (=> b!383740 m!380029))

(check-sat (not b!383735) (not b!383728) (not b_next!8701) (not start!37560) (not b!383727) (not b!383738) (not b!383734) tp_is_empty!9349 (not mapNonEmpty!15588) b_and!15917 (not b!383739) (not b!383733) (not b!383740))
(check-sat b_and!15917 (not b_next!8701))
