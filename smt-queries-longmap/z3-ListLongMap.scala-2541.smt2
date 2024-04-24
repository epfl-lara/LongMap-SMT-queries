; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39050 () Bool)

(assert start!39050)

(declare-fun b_free!9331 () Bool)

(declare-fun b_next!9331 () Bool)

(assert (=> start!39050 (= b_free!9331 (not b_next!9331))))

(declare-fun tp!33522 () Bool)

(declare-fun b_and!16731 () Bool)

(assert (=> start!39050 (= tp!33522 b_and!16731)))

(declare-fun b!410003 () Bool)

(declare-fun res!237583 () Bool)

(declare-fun e!245819 () Bool)

(assert (=> b!410003 (=> (not res!237583) (not e!245819))))

(declare-datatypes ((array!24832 0))(
  ( (array!24833 (arr!11865 (Array (_ BitVec 32) (_ BitVec 64))) (size!12217 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24832)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24832 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!410003 (= res!237583 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!410004 () Bool)

(declare-fun res!237588 () Bool)

(assert (=> b!410004 (=> (not res!237588) (not e!245819))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15083 0))(
  ( (V!15084 (val!5286 Int)) )
))
(declare-datatypes ((ValueCell!4898 0))(
  ( (ValueCellFull!4898 (v!7534 V!15083)) (EmptyCell!4898) )
))
(declare-datatypes ((array!24834 0))(
  ( (array!24835 (arr!11866 (Array (_ BitVec 32) ValueCell!4898)) (size!12218 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24834)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!410004 (= res!237588 (and (= (size!12218 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12217 _keys!709) (size!12218 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!410005 () Bool)

(declare-fun res!237586 () Bool)

(declare-fun e!245824 () Bool)

(assert (=> b!410005 (=> (not res!237586) (not e!245824))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!410005 (= res!237586 (bvsle from!863 i!563))))

(declare-fun b!410006 () Bool)

(declare-fun res!237580 () Bool)

(assert (=> b!410006 (=> (not res!237580) (not e!245819))))

(assert (=> b!410006 (= res!237580 (or (= (select (arr!11865 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11865 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!410007 () Bool)

(declare-fun res!237587 () Bool)

(assert (=> b!410007 (=> (not res!237587) (not e!245824))))

(declare-fun lt!189048 () array!24832)

(declare-datatypes ((List!6747 0))(
  ( (Nil!6744) (Cons!6743 (h!7599 (_ BitVec 64)) (t!11913 List!6747)) )
))
(declare-fun arrayNoDuplicates!0 (array!24832 (_ BitVec 32) List!6747) Bool)

(assert (=> b!410007 (= res!237587 (arrayNoDuplicates!0 lt!189048 #b00000000000000000000000000000000 Nil!6744))))

(declare-fun b!410009 () Bool)

(declare-fun res!237584 () Bool)

(assert (=> b!410009 (=> (not res!237584) (not e!245819))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!410009 (= res!237584 (validMask!0 mask!1025))))

(declare-fun b!410010 () Bool)

(assert (=> b!410010 (= e!245824 false)))

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15083)

(declare-fun minValue!515 () V!15083)

(declare-datatypes ((tuple2!6730 0))(
  ( (tuple2!6731 (_1!3376 (_ BitVec 64)) (_2!3376 V!15083)) )
))
(declare-datatypes ((List!6748 0))(
  ( (Nil!6745) (Cons!6744 (h!7600 tuple2!6730) (t!11914 List!6748)) )
))
(declare-datatypes ((ListLongMap!5645 0))(
  ( (ListLongMap!5646 (toList!2838 List!6748)) )
))
(declare-fun lt!189047 () ListLongMap!5645)

(declare-fun getCurrentListMapNoExtraKeys!1090 (array!24832 array!24834 (_ BitVec 32) (_ BitVec 32) V!15083 V!15083 (_ BitVec 32) Int) ListLongMap!5645)

(assert (=> b!410010 (= lt!189047 (getCurrentListMapNoExtraKeys!1090 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!410011 () Bool)

(declare-fun e!245822 () Bool)

(declare-fun tp_is_empty!10483 () Bool)

(assert (=> b!410011 (= e!245822 tp_is_empty!10483)))

(declare-fun b!410012 () Bool)

(declare-fun res!237582 () Bool)

(assert (=> b!410012 (=> (not res!237582) (not e!245819))))

(assert (=> b!410012 (= res!237582 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12217 _keys!709))))))

(declare-fun mapNonEmpty!17346 () Bool)

(declare-fun mapRes!17346 () Bool)

(declare-fun tp!33521 () Bool)

(assert (=> mapNonEmpty!17346 (= mapRes!17346 (and tp!33521 e!245822))))

(declare-fun mapKey!17346 () (_ BitVec 32))

(declare-fun mapValue!17346 () ValueCell!4898)

(declare-fun mapRest!17346 () (Array (_ BitVec 32) ValueCell!4898))

(assert (=> mapNonEmpty!17346 (= (arr!11866 _values!549) (store mapRest!17346 mapKey!17346 mapValue!17346))))

(declare-fun b!410013 () Bool)

(declare-fun res!237579 () Bool)

(assert (=> b!410013 (=> (not res!237579) (not e!245819))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24832 (_ BitVec 32)) Bool)

(assert (=> b!410013 (= res!237579 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!410014 () Bool)

(declare-fun e!245820 () Bool)

(assert (=> b!410014 (= e!245820 tp_is_empty!10483)))

(declare-fun mapIsEmpty!17346 () Bool)

(assert (=> mapIsEmpty!17346 mapRes!17346))

(declare-fun b!410015 () Bool)

(declare-fun e!245823 () Bool)

(assert (=> b!410015 (= e!245823 (and e!245820 mapRes!17346))))

(declare-fun condMapEmpty!17346 () Bool)

(declare-fun mapDefault!17346 () ValueCell!4898)

(assert (=> b!410015 (= condMapEmpty!17346 (= (arr!11866 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4898)) mapDefault!17346)))))

(declare-fun res!237578 () Bool)

(assert (=> start!39050 (=> (not res!237578) (not e!245819))))

(assert (=> start!39050 (= res!237578 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12217 _keys!709))))))

(assert (=> start!39050 e!245819))

(assert (=> start!39050 tp_is_empty!10483))

(assert (=> start!39050 tp!33522))

(assert (=> start!39050 true))

(declare-fun array_inv!8742 (array!24834) Bool)

(assert (=> start!39050 (and (array_inv!8742 _values!549) e!245823)))

(declare-fun array_inv!8743 (array!24832) Bool)

(assert (=> start!39050 (array_inv!8743 _keys!709)))

(declare-fun b!410008 () Bool)

(declare-fun res!237577 () Bool)

(assert (=> b!410008 (=> (not res!237577) (not e!245819))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!410008 (= res!237577 (validKeyInArray!0 k0!794))))

(declare-fun b!410016 () Bool)

(declare-fun res!237585 () Bool)

(assert (=> b!410016 (=> (not res!237585) (not e!245819))))

(assert (=> b!410016 (= res!237585 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6744))))

(declare-fun b!410017 () Bool)

(assert (=> b!410017 (= e!245819 e!245824)))

(declare-fun res!237581 () Bool)

(assert (=> b!410017 (=> (not res!237581) (not e!245824))))

(assert (=> b!410017 (= res!237581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189048 mask!1025))))

(assert (=> b!410017 (= lt!189048 (array!24833 (store (arr!11865 _keys!709) i!563 k0!794) (size!12217 _keys!709)))))

(assert (= (and start!39050 res!237578) b!410009))

(assert (= (and b!410009 res!237584) b!410004))

(assert (= (and b!410004 res!237588) b!410013))

(assert (= (and b!410013 res!237579) b!410016))

(assert (= (and b!410016 res!237585) b!410012))

(assert (= (and b!410012 res!237582) b!410008))

(assert (= (and b!410008 res!237577) b!410006))

(assert (= (and b!410006 res!237580) b!410003))

(assert (= (and b!410003 res!237583) b!410017))

(assert (= (and b!410017 res!237581) b!410007))

(assert (= (and b!410007 res!237587) b!410005))

(assert (= (and b!410005 res!237586) b!410010))

(assert (= (and b!410015 condMapEmpty!17346) mapIsEmpty!17346))

(assert (= (and b!410015 (not condMapEmpty!17346)) mapNonEmpty!17346))

(get-info :version)

(assert (= (and mapNonEmpty!17346 ((_ is ValueCellFull!4898) mapValue!17346)) b!410011))

(assert (= (and b!410015 ((_ is ValueCellFull!4898) mapDefault!17346)) b!410014))

(assert (= start!39050 b!410015))

(declare-fun m!400929 () Bool)

(assert (=> b!410003 m!400929))

(declare-fun m!400931 () Bool)

(assert (=> b!410006 m!400931))

(declare-fun m!400933 () Bool)

(assert (=> b!410007 m!400933))

(declare-fun m!400935 () Bool)

(assert (=> b!410010 m!400935))

(declare-fun m!400937 () Bool)

(assert (=> b!410009 m!400937))

(declare-fun m!400939 () Bool)

(assert (=> mapNonEmpty!17346 m!400939))

(declare-fun m!400941 () Bool)

(assert (=> b!410013 m!400941))

(declare-fun m!400943 () Bool)

(assert (=> start!39050 m!400943))

(declare-fun m!400945 () Bool)

(assert (=> start!39050 m!400945))

(declare-fun m!400947 () Bool)

(assert (=> b!410008 m!400947))

(declare-fun m!400949 () Bool)

(assert (=> b!410016 m!400949))

(declare-fun m!400951 () Bool)

(assert (=> b!410017 m!400951))

(declare-fun m!400953 () Bool)

(assert (=> b!410017 m!400953))

(check-sat (not b!410009) (not b_next!9331) (not b!410013) b_and!16731 (not b!410008) (not b!410007) (not b!410017) tp_is_empty!10483 (not b!410003) (not start!39050) (not b!410016) (not mapNonEmpty!17346) (not b!410010))
(check-sat b_and!16731 (not b_next!9331))
