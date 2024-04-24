; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39020 () Bool)

(assert start!39020)

(declare-fun b_free!9301 () Bool)

(declare-fun b_next!9301 () Bool)

(assert (=> start!39020 (= b_free!9301 (not b_next!9301))))

(declare-fun tp!33431 () Bool)

(declare-fun b_and!16701 () Bool)

(assert (=> start!39020 (= tp!33431 b_and!16701)))

(declare-fun b!409328 () Bool)

(declare-fun res!237048 () Bool)

(declare-fun e!245554 () Bool)

(assert (=> b!409328 (=> (not res!237048) (not e!245554))))

(declare-datatypes ((array!24776 0))(
  ( (array!24777 (arr!11837 (Array (_ BitVec 32) (_ BitVec 64))) (size!12189 (_ BitVec 32))) )
))
(declare-fun lt!188958 () array!24776)

(declare-datatypes ((List!6724 0))(
  ( (Nil!6721) (Cons!6720 (h!7576 (_ BitVec 64)) (t!11890 List!6724)) )
))
(declare-fun arrayNoDuplicates!0 (array!24776 (_ BitVec 32) List!6724) Bool)

(assert (=> b!409328 (= res!237048 (arrayNoDuplicates!0 lt!188958 #b00000000000000000000000000000000 Nil!6721))))

(declare-fun b!409329 () Bool)

(declare-fun res!237044 () Bool)

(declare-fun e!245551 () Bool)

(assert (=> b!409329 (=> (not res!237044) (not e!245551))))

(declare-fun _keys!709 () array!24776)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!409329 (= res!237044 (or (= (select (arr!11837 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11837 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!409330 () Bool)

(declare-fun res!237043 () Bool)

(assert (=> b!409330 (=> (not res!237043) (not e!245551))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24776 (_ BitVec 32)) Bool)

(assert (=> b!409330 (= res!237043 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!409332 () Bool)

(declare-fun e!245552 () Bool)

(declare-fun e!245549 () Bool)

(declare-fun mapRes!17301 () Bool)

(assert (=> b!409332 (= e!245552 (and e!245549 mapRes!17301))))

(declare-fun condMapEmpty!17301 () Bool)

(declare-datatypes ((V!15043 0))(
  ( (V!15044 (val!5271 Int)) )
))
(declare-datatypes ((ValueCell!4883 0))(
  ( (ValueCellFull!4883 (v!7519 V!15043)) (EmptyCell!4883) )
))
(declare-datatypes ((array!24778 0))(
  ( (array!24779 (arr!11838 (Array (_ BitVec 32) ValueCell!4883)) (size!12190 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24778)

(declare-fun mapDefault!17301 () ValueCell!4883)

(assert (=> b!409332 (= condMapEmpty!17301 (= (arr!11838 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4883)) mapDefault!17301)))))

(declare-fun mapIsEmpty!17301 () Bool)

(assert (=> mapIsEmpty!17301 mapRes!17301))

(declare-fun b!409333 () Bool)

(declare-fun res!237037 () Bool)

(assert (=> b!409333 (=> (not res!237037) (not e!245551))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!409333 (= res!237037 (validMask!0 mask!1025))))

(declare-fun b!409334 () Bool)

(assert (=> b!409334 (= e!245554 false)))

(declare-fun minValue!515 () V!15043)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15043)

(declare-datatypes ((tuple2!6706 0))(
  ( (tuple2!6707 (_1!3364 (_ BitVec 64)) (_2!3364 V!15043)) )
))
(declare-datatypes ((List!6725 0))(
  ( (Nil!6722) (Cons!6721 (h!7577 tuple2!6706) (t!11891 List!6725)) )
))
(declare-datatypes ((ListLongMap!5621 0))(
  ( (ListLongMap!5622 (toList!2826 List!6725)) )
))
(declare-fun lt!188957 () ListLongMap!5621)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1078 (array!24776 array!24778 (_ BitVec 32) (_ BitVec 32) V!15043 V!15043 (_ BitVec 32) Int) ListLongMap!5621)

(assert (=> b!409334 (= lt!188957 (getCurrentListMapNoExtraKeys!1078 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!409335 () Bool)

(declare-fun e!245550 () Bool)

(declare-fun tp_is_empty!10453 () Bool)

(assert (=> b!409335 (= e!245550 tp_is_empty!10453)))

(declare-fun b!409336 () Bool)

(declare-fun res!237046 () Bool)

(assert (=> b!409336 (=> (not res!237046) (not e!245551))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24776 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!409336 (= res!237046 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!237045 () Bool)

(assert (=> start!39020 (=> (not res!237045) (not e!245551))))

(assert (=> start!39020 (= res!237045 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12189 _keys!709))))))

(assert (=> start!39020 e!245551))

(assert (=> start!39020 tp_is_empty!10453))

(assert (=> start!39020 tp!33431))

(assert (=> start!39020 true))

(declare-fun array_inv!8722 (array!24778) Bool)

(assert (=> start!39020 (and (array_inv!8722 _values!549) e!245552)))

(declare-fun array_inv!8723 (array!24776) Bool)

(assert (=> start!39020 (array_inv!8723 _keys!709)))

(declare-fun b!409331 () Bool)

(declare-fun res!237041 () Bool)

(assert (=> b!409331 (=> (not res!237041) (not e!245551))))

(assert (=> b!409331 (= res!237041 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12189 _keys!709))))))

(declare-fun b!409337 () Bool)

(assert (=> b!409337 (= e!245549 tp_is_empty!10453)))

(declare-fun b!409338 () Bool)

(assert (=> b!409338 (= e!245551 e!245554)))

(declare-fun res!237042 () Bool)

(assert (=> b!409338 (=> (not res!237042) (not e!245554))))

(assert (=> b!409338 (= res!237042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188958 mask!1025))))

(assert (=> b!409338 (= lt!188958 (array!24777 (store (arr!11837 _keys!709) i!563 k0!794) (size!12189 _keys!709)))))

(declare-fun b!409339 () Bool)

(declare-fun res!237040 () Bool)

(assert (=> b!409339 (=> (not res!237040) (not e!245554))))

(assert (=> b!409339 (= res!237040 (bvsle from!863 i!563))))

(declare-fun b!409340 () Bool)

(declare-fun res!237039 () Bool)

(assert (=> b!409340 (=> (not res!237039) (not e!245551))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!409340 (= res!237039 (validKeyInArray!0 k0!794))))

(declare-fun b!409341 () Bool)

(declare-fun res!237038 () Bool)

(assert (=> b!409341 (=> (not res!237038) (not e!245551))))

(assert (=> b!409341 (= res!237038 (and (= (size!12190 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12189 _keys!709) (size!12190 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!409342 () Bool)

(declare-fun res!237047 () Bool)

(assert (=> b!409342 (=> (not res!237047) (not e!245551))))

(assert (=> b!409342 (= res!237047 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6721))))

(declare-fun mapNonEmpty!17301 () Bool)

(declare-fun tp!33432 () Bool)

(assert (=> mapNonEmpty!17301 (= mapRes!17301 (and tp!33432 e!245550))))

(declare-fun mapRest!17301 () (Array (_ BitVec 32) ValueCell!4883))

(declare-fun mapValue!17301 () ValueCell!4883)

(declare-fun mapKey!17301 () (_ BitVec 32))

(assert (=> mapNonEmpty!17301 (= (arr!11838 _values!549) (store mapRest!17301 mapKey!17301 mapValue!17301))))

(assert (= (and start!39020 res!237045) b!409333))

(assert (= (and b!409333 res!237037) b!409341))

(assert (= (and b!409341 res!237038) b!409330))

(assert (= (and b!409330 res!237043) b!409342))

(assert (= (and b!409342 res!237047) b!409331))

(assert (= (and b!409331 res!237041) b!409340))

(assert (= (and b!409340 res!237039) b!409329))

(assert (= (and b!409329 res!237044) b!409336))

(assert (= (and b!409336 res!237046) b!409338))

(assert (= (and b!409338 res!237042) b!409328))

(assert (= (and b!409328 res!237048) b!409339))

(assert (= (and b!409339 res!237040) b!409334))

(assert (= (and b!409332 condMapEmpty!17301) mapIsEmpty!17301))

(assert (= (and b!409332 (not condMapEmpty!17301)) mapNonEmpty!17301))

(get-info :version)

(assert (= (and mapNonEmpty!17301 ((_ is ValueCellFull!4883) mapValue!17301)) b!409335))

(assert (= (and b!409332 ((_ is ValueCellFull!4883) mapDefault!17301)) b!409337))

(assert (= start!39020 b!409332))

(declare-fun m!400539 () Bool)

(assert (=> start!39020 m!400539))

(declare-fun m!400541 () Bool)

(assert (=> start!39020 m!400541))

(declare-fun m!400543 () Bool)

(assert (=> b!409338 m!400543))

(declare-fun m!400545 () Bool)

(assert (=> b!409338 m!400545))

(declare-fun m!400547 () Bool)

(assert (=> b!409333 m!400547))

(declare-fun m!400549 () Bool)

(assert (=> b!409330 m!400549))

(declare-fun m!400551 () Bool)

(assert (=> b!409334 m!400551))

(declare-fun m!400553 () Bool)

(assert (=> b!409336 m!400553))

(declare-fun m!400555 () Bool)

(assert (=> b!409340 m!400555))

(declare-fun m!400557 () Bool)

(assert (=> b!409328 m!400557))

(declare-fun m!400559 () Bool)

(assert (=> mapNonEmpty!17301 m!400559))

(declare-fun m!400561 () Bool)

(assert (=> b!409329 m!400561))

(declare-fun m!400563 () Bool)

(assert (=> b!409342 m!400563))

(check-sat (not b!409340) (not b!409328) (not b!409333) (not b_next!9301) (not b!409342) (not b!409338) (not start!39020) tp_is_empty!10453 (not mapNonEmpty!17301) b_and!16701 (not b!409336) (not b!409334) (not b!409330))
(check-sat b_and!16701 (not b_next!9301))
