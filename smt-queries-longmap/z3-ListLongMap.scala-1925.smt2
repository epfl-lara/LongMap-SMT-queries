; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34182 () Bool)

(assert start!34182)

(declare-fun b_free!7219 () Bool)

(declare-fun b_next!7219 () Bool)

(assert (=> start!34182 (= b_free!7219 (not b_next!7219))))

(declare-fun tp!25190 () Bool)

(declare-fun b_and!14393 () Bool)

(assert (=> start!34182 (= tp!25190 b_and!14393)))

(declare-fun b!340682 () Bool)

(declare-fun res!188279 () Bool)

(declare-fun e!208956 () Bool)

(assert (=> b!340682 (=> (not res!188279) (not e!208956))))

(declare-datatypes ((array!17917 0))(
  ( (array!17918 (arr!8479 (Array (_ BitVec 32) (_ BitVec 64))) (size!8832 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17917)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17917 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!340682 (= res!188279 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun res!188278 () Bool)

(declare-fun e!208960 () Bool)

(assert (=> start!34182 (=> (not res!188278) (not e!208960))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34182 (= res!188278 (validMask!0 mask!2385))))

(assert (=> start!34182 e!208960))

(assert (=> start!34182 true))

(declare-fun tp_is_empty!7171 () Bool)

(assert (=> start!34182 tp_is_empty!7171))

(assert (=> start!34182 tp!25190))

(declare-datatypes ((V!10539 0))(
  ( (V!10540 (val!3630 Int)) )
))
(declare-datatypes ((ValueCell!3242 0))(
  ( (ValueCellFull!3242 (v!5796 V!10539)) (EmptyCell!3242) )
))
(declare-datatypes ((array!17919 0))(
  ( (array!17920 (arr!8480 (Array (_ BitVec 32) ValueCell!3242)) (size!8833 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17919)

(declare-fun e!208957 () Bool)

(declare-fun array_inv!6306 (array!17919) Bool)

(assert (=> start!34182 (and (array_inv!6306 _values!1525) e!208957)))

(declare-fun array_inv!6307 (array!17917) Bool)

(assert (=> start!34182 (array_inv!6307 _keys!1895)))

(declare-fun mapIsEmpty!12183 () Bool)

(declare-fun mapRes!12183 () Bool)

(assert (=> mapIsEmpty!12183 mapRes!12183))

(declare-fun b!340683 () Bool)

(declare-fun res!188276 () Bool)

(assert (=> b!340683 (=> (not res!188276) (not e!208960))))

(declare-datatypes ((List!4830 0))(
  ( (Nil!4827) (Cons!4826 (h!5682 (_ BitVec 64)) (t!9929 List!4830)) )
))
(declare-fun arrayNoDuplicates!0 (array!17917 (_ BitVec 32) List!4830) Bool)

(assert (=> b!340683 (= res!188276 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4827))))

(declare-fun b!340684 () Bool)

(declare-fun res!188273 () Bool)

(assert (=> b!340684 (=> (not res!188273) (not e!208960))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!340684 (= res!188273 (validKeyInArray!0 k0!1348))))

(declare-fun b!340685 () Bool)

(declare-fun e!208959 () Bool)

(assert (=> b!340685 (= e!208957 (and e!208959 mapRes!12183))))

(declare-fun condMapEmpty!12183 () Bool)

(declare-fun mapDefault!12183 () ValueCell!3242)

(assert (=> b!340685 (= condMapEmpty!12183 (= (arr!8480 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3242)) mapDefault!12183)))))

(declare-fun b!340686 () Bool)

(declare-fun res!188272 () Bool)

(assert (=> b!340686 (=> (not res!188272) (not e!208960))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!340686 (= res!188272 (and (= (size!8833 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8832 _keys!1895) (size!8833 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!340687 () Bool)

(declare-fun res!188277 () Bool)

(assert (=> b!340687 (=> (not res!188277) (not e!208960))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17917 (_ BitVec 32)) Bool)

(assert (=> b!340687 (= res!188277 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!340688 () Bool)

(assert (=> b!340688 (= e!208959 tp_is_empty!7171)))

(declare-fun b!340689 () Bool)

(assert (=> b!340689 (= e!208956 false)))

(declare-fun lt!161447 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17917 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!340689 (= lt!161447 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!340690 () Bool)

(declare-fun e!208955 () Bool)

(assert (=> b!340690 (= e!208955 tp_is_empty!7171)))

(declare-fun b!340691 () Bool)

(declare-fun res!188275 () Bool)

(assert (=> b!340691 (=> (not res!188275) (not e!208960))))

(declare-fun zeroValue!1467 () V!10539)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10539)

(declare-datatypes ((tuple2!5206 0))(
  ( (tuple2!5207 (_1!2614 (_ BitVec 64)) (_2!2614 V!10539)) )
))
(declare-datatypes ((List!4831 0))(
  ( (Nil!4828) (Cons!4827 (h!5683 tuple2!5206) (t!9930 List!4831)) )
))
(declare-datatypes ((ListLongMap!4109 0))(
  ( (ListLongMap!4110 (toList!2070 List!4831)) )
))
(declare-fun contains!2135 (ListLongMap!4109 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1576 (array!17917 array!17919 (_ BitVec 32) (_ BitVec 32) V!10539 V!10539 (_ BitVec 32) Int) ListLongMap!4109)

(assert (=> b!340691 (= res!188275 (not (contains!2135 (getCurrentListMap!1576 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!340692 () Bool)

(assert (=> b!340692 (= e!208960 e!208956)))

(declare-fun res!188274 () Bool)

(assert (=> b!340692 (=> (not res!188274) (not e!208956))))

(declare-datatypes ((SeekEntryResult!3265 0))(
  ( (MissingZero!3265 (index!15239 (_ BitVec 32))) (Found!3265 (index!15240 (_ BitVec 32))) (Intermediate!3265 (undefined!4077 Bool) (index!15241 (_ BitVec 32)) (x!33942 (_ BitVec 32))) (Undefined!3265) (MissingVacant!3265 (index!15242 (_ BitVec 32))) )
))
(declare-fun lt!161448 () SeekEntryResult!3265)

(get-info :version)

(assert (=> b!340692 (= res!188274 (and (not ((_ is Found!3265) lt!161448)) (not ((_ is MissingZero!3265) lt!161448)) ((_ is MissingVacant!3265) lt!161448)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17917 (_ BitVec 32)) SeekEntryResult!3265)

(assert (=> b!340692 (= lt!161448 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12183 () Bool)

(declare-fun tp!25191 () Bool)

(assert (=> mapNonEmpty!12183 (= mapRes!12183 (and tp!25191 e!208955))))

(declare-fun mapRest!12183 () (Array (_ BitVec 32) ValueCell!3242))

(declare-fun mapKey!12183 () (_ BitVec 32))

(declare-fun mapValue!12183 () ValueCell!3242)

(assert (=> mapNonEmpty!12183 (= (arr!8480 _values!1525) (store mapRest!12183 mapKey!12183 mapValue!12183))))

(assert (= (and start!34182 res!188278) b!340686))

(assert (= (and b!340686 res!188272) b!340687))

(assert (= (and b!340687 res!188277) b!340683))

(assert (= (and b!340683 res!188276) b!340684))

(assert (= (and b!340684 res!188273) b!340691))

(assert (= (and b!340691 res!188275) b!340692))

(assert (= (and b!340692 res!188274) b!340682))

(assert (= (and b!340682 res!188279) b!340689))

(assert (= (and b!340685 condMapEmpty!12183) mapIsEmpty!12183))

(assert (= (and b!340685 (not condMapEmpty!12183)) mapNonEmpty!12183))

(assert (= (and mapNonEmpty!12183 ((_ is ValueCellFull!3242) mapValue!12183)) b!340690))

(assert (= (and b!340685 ((_ is ValueCellFull!3242) mapDefault!12183)) b!340688))

(assert (= start!34182 b!340685))

(declare-fun m!342789 () Bool)

(assert (=> b!340692 m!342789))

(declare-fun m!342791 () Bool)

(assert (=> mapNonEmpty!12183 m!342791))

(declare-fun m!342793 () Bool)

(assert (=> start!34182 m!342793))

(declare-fun m!342795 () Bool)

(assert (=> start!34182 m!342795))

(declare-fun m!342797 () Bool)

(assert (=> start!34182 m!342797))

(declare-fun m!342799 () Bool)

(assert (=> b!340687 m!342799))

(declare-fun m!342801 () Bool)

(assert (=> b!340682 m!342801))

(declare-fun m!342803 () Bool)

(assert (=> b!340683 m!342803))

(declare-fun m!342805 () Bool)

(assert (=> b!340691 m!342805))

(assert (=> b!340691 m!342805))

(declare-fun m!342807 () Bool)

(assert (=> b!340691 m!342807))

(declare-fun m!342809 () Bool)

(assert (=> b!340684 m!342809))

(declare-fun m!342811 () Bool)

(assert (=> b!340689 m!342811))

(check-sat (not b!340683) (not b_next!7219) tp_is_empty!7171 (not mapNonEmpty!12183) (not b!340689) (not b!340692) b_and!14393 (not b!340687) (not start!34182) (not b!340682) (not b!340684) (not b!340691))
(check-sat b_and!14393 (not b_next!7219))
