; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43470 () Bool)

(assert start!43470)

(declare-fun b_free!12249 () Bool)

(declare-fun b_next!12249 () Bool)

(assert (=> start!43470 (= b_free!12249 (not b_next!12249))))

(declare-fun tp!43030 () Bool)

(declare-fun b_and!21009 () Bool)

(assert (=> start!43470 (= tp!43030 b_and!21009)))

(declare-fun b!481582 () Bool)

(declare-fun e!283353 () Bool)

(declare-fun tp_is_empty!13761 () Bool)

(assert (=> b!481582 (= e!283353 tp_is_empty!13761)))

(declare-fun b!481583 () Bool)

(declare-fun res!287104 () Bool)

(declare-fun e!283348 () Bool)

(assert (=> b!481583 (=> (not res!287104) (not e!283348))))

(declare-datatypes ((array!31185 0))(
  ( (array!31186 (arr!14995 (Array (_ BitVec 32) (_ BitVec 64))) (size!15353 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31185)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31185 (_ BitVec 32)) Bool)

(assert (=> b!481583 (= res!287104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun mapIsEmpty!22351 () Bool)

(declare-fun mapRes!22351 () Bool)

(assert (=> mapIsEmpty!22351 mapRes!22351))

(declare-fun b!481584 () Bool)

(declare-fun res!287107 () Bool)

(assert (=> b!481584 (=> (not res!287107) (not e!283348))))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19419 0))(
  ( (V!19420 (val!6928 Int)) )
))
(declare-fun zeroValue!1458 () V!19419)

(declare-datatypes ((ValueCell!6519 0))(
  ( (ValueCellFull!6519 (v!9221 V!19419)) (EmptyCell!6519) )
))
(declare-datatypes ((array!31187 0))(
  ( (array!31188 (arr!14996 (Array (_ BitVec 32) ValueCell!6519)) (size!15354 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31187)

(declare-fun minValue!1458 () V!19419)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9092 0))(
  ( (tuple2!9093 (_1!4557 (_ BitVec 64)) (_2!4557 V!19419)) )
))
(declare-datatypes ((List!9170 0))(
  ( (Nil!9167) (Cons!9166 (h!10022 tuple2!9092) (t!15384 List!9170)) )
))
(declare-datatypes ((ListLongMap!8005 0))(
  ( (ListLongMap!8006 (toList!4018 List!9170)) )
))
(declare-fun contains!2632 (ListLongMap!8005 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2337 (array!31185 array!31187 (_ BitVec 32) (_ BitVec 32) V!19419 V!19419 (_ BitVec 32) Int) ListLongMap!8005)

(assert (=> b!481584 (= res!287107 (contains!2632 (getCurrentListMap!2337 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!481585 () Bool)

(declare-fun res!287106 () Bool)

(assert (=> b!481585 (=> (not res!287106) (not e!283348))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!481585 (= res!287106 (validKeyInArray!0 k0!1332))))

(declare-fun b!481586 () Bool)

(declare-fun e!283351 () Bool)

(assert (=> b!481586 (= e!283351 tp_is_empty!13761)))

(declare-fun b!481588 () Bool)

(declare-fun e!283350 () Bool)

(assert (=> b!481588 (= e!283350 (and e!283351 mapRes!22351))))

(declare-fun condMapEmpty!22351 () Bool)

(declare-fun mapDefault!22351 () ValueCell!6519)

(assert (=> b!481588 (= condMapEmpty!22351 (= (arr!14996 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6519)) mapDefault!22351)))))

(declare-fun b!481589 () Bool)

(declare-fun res!287103 () Bool)

(assert (=> b!481589 (=> (not res!287103) (not e!283348))))

(assert (=> b!481589 (= res!287103 (and (= (size!15354 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15353 _keys!1874) (size!15354 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!481590 () Bool)

(assert (=> b!481590 (= e!283348 (not (= (size!15353 _keys!1874) (bvadd #b00000000000000000000000000000001 mask!2352))))))

(declare-fun lt!218568 () (_ BitVec 32))

(assert (=> b!481590 (arrayForallSeekEntryOrOpenFound!0 lt!218568 _keys!1874 mask!2352)))

(declare-datatypes ((Unit!14128 0))(
  ( (Unit!14129) )
))
(declare-fun lt!218569 () Unit!14128)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31185 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14128)

(assert (=> b!481590 (= lt!218569 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218568))))

(declare-fun arrayScanForKey!0 (array!31185 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!481590 (= lt!218568 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun e!283352 () Bool)

(assert (=> b!481590 e!283352))

(declare-fun c!57927 () Bool)

(assert (=> b!481590 (= c!57927 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218567 () Unit!14128)

(declare-fun lemmaKeyInListMapIsInArray!135 (array!31185 array!31187 (_ BitVec 32) (_ BitVec 32) V!19419 V!19419 (_ BitVec 64) Int) Unit!14128)

(assert (=> b!481590 (= lt!218567 (lemmaKeyInListMapIsInArray!135 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!481591 () Bool)

(declare-fun res!287102 () Bool)

(assert (=> b!481591 (=> (not res!287102) (not e!283348))))

(declare-datatypes ((List!9171 0))(
  ( (Nil!9168) (Cons!9167 (h!10023 (_ BitVec 64)) (t!15385 List!9171)) )
))
(declare-fun arrayNoDuplicates!0 (array!31185 (_ BitVec 32) List!9171) Bool)

(assert (=> b!481591 (= res!287102 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9168))))

(declare-fun b!481592 () Bool)

(declare-fun arrayContainsKey!0 (array!31185 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!481592 (= e!283352 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!22351 () Bool)

(declare-fun tp!43029 () Bool)

(assert (=> mapNonEmpty!22351 (= mapRes!22351 (and tp!43029 e!283353))))

(declare-fun mapRest!22351 () (Array (_ BitVec 32) ValueCell!6519))

(declare-fun mapValue!22351 () ValueCell!6519)

(declare-fun mapKey!22351 () (_ BitVec 32))

(assert (=> mapNonEmpty!22351 (= (arr!14996 _values!1516) (store mapRest!22351 mapKey!22351 mapValue!22351))))

(declare-fun b!481587 () Bool)

(assert (=> b!481587 (= e!283352 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!287105 () Bool)

(assert (=> start!43470 (=> (not res!287105) (not e!283348))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43470 (= res!287105 (validMask!0 mask!2352))))

(assert (=> start!43470 e!283348))

(assert (=> start!43470 true))

(assert (=> start!43470 tp_is_empty!13761))

(declare-fun array_inv!10814 (array!31187) Bool)

(assert (=> start!43470 (and (array_inv!10814 _values!1516) e!283350)))

(assert (=> start!43470 tp!43030))

(declare-fun array_inv!10815 (array!31185) Bool)

(assert (=> start!43470 (array_inv!10815 _keys!1874)))

(assert (= (and start!43470 res!287105) b!481589))

(assert (= (and b!481589 res!287103) b!481583))

(assert (= (and b!481583 res!287104) b!481591))

(assert (= (and b!481591 res!287102) b!481584))

(assert (= (and b!481584 res!287107) b!481585))

(assert (= (and b!481585 res!287106) b!481590))

(assert (= (and b!481590 c!57927) b!481592))

(assert (= (and b!481590 (not c!57927)) b!481587))

(assert (= (and b!481588 condMapEmpty!22351) mapIsEmpty!22351))

(assert (= (and b!481588 (not condMapEmpty!22351)) mapNonEmpty!22351))

(get-info :version)

(assert (= (and mapNonEmpty!22351 ((_ is ValueCellFull!6519) mapValue!22351)) b!481582))

(assert (= (and b!481588 ((_ is ValueCellFull!6519) mapDefault!22351)) b!481586))

(assert (= start!43470 b!481588))

(declare-fun m!463011 () Bool)

(assert (=> b!481590 m!463011))

(declare-fun m!463013 () Bool)

(assert (=> b!481590 m!463013))

(declare-fun m!463015 () Bool)

(assert (=> b!481590 m!463015))

(declare-fun m!463017 () Bool)

(assert (=> b!481590 m!463017))

(declare-fun m!463019 () Bool)

(assert (=> b!481585 m!463019))

(declare-fun m!463021 () Bool)

(assert (=> b!481584 m!463021))

(assert (=> b!481584 m!463021))

(declare-fun m!463023 () Bool)

(assert (=> b!481584 m!463023))

(declare-fun m!463025 () Bool)

(assert (=> b!481591 m!463025))

(declare-fun m!463027 () Bool)

(assert (=> b!481583 m!463027))

(declare-fun m!463029 () Bool)

(assert (=> mapNonEmpty!22351 m!463029))

(declare-fun m!463031 () Bool)

(assert (=> b!481592 m!463031))

(declare-fun m!463033 () Bool)

(assert (=> start!43470 m!463033))

(declare-fun m!463035 () Bool)

(assert (=> start!43470 m!463035))

(declare-fun m!463037 () Bool)

(assert (=> start!43470 m!463037))

(check-sat (not b!481590) b_and!21009 (not start!43470) (not b!481591) (not mapNonEmpty!22351) (not b_next!12249) (not b!481584) (not b!481583) (not b!481592) (not b!481585) tp_is_empty!13761)
(check-sat b_and!21009 (not b_next!12249))
