; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34176 () Bool)

(assert start!34176)

(declare-fun b_free!7213 () Bool)

(declare-fun b_next!7213 () Bool)

(assert (=> start!34176 (= b_free!7213 (not b_next!7213))))

(declare-fun tp!25173 () Bool)

(declare-fun b_and!14387 () Bool)

(assert (=> start!34176 (= tp!25173 b_and!14387)))

(declare-fun res!188206 () Bool)

(declare-fun e!208902 () Bool)

(assert (=> start!34176 (=> (not res!188206) (not e!208902))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34176 (= res!188206 (validMask!0 mask!2385))))

(assert (=> start!34176 e!208902))

(assert (=> start!34176 true))

(declare-fun tp_is_empty!7165 () Bool)

(assert (=> start!34176 tp_is_empty!7165))

(assert (=> start!34176 tp!25173))

(declare-datatypes ((V!10531 0))(
  ( (V!10532 (val!3627 Int)) )
))
(declare-datatypes ((ValueCell!3239 0))(
  ( (ValueCellFull!3239 (v!5793 V!10531)) (EmptyCell!3239) )
))
(declare-datatypes ((array!17905 0))(
  ( (array!17906 (arr!8473 (Array (_ BitVec 32) ValueCell!3239)) (size!8826 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17905)

(declare-fun e!208905 () Bool)

(declare-fun array_inv!6300 (array!17905) Bool)

(assert (=> start!34176 (and (array_inv!6300 _values!1525) e!208905)))

(declare-datatypes ((array!17907 0))(
  ( (array!17908 (arr!8474 (Array (_ BitVec 32) (_ BitVec 64))) (size!8827 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17907)

(declare-fun array_inv!6301 (array!17907) Bool)

(assert (=> start!34176 (array_inv!6301 _keys!1895)))

(declare-fun b!340583 () Bool)

(declare-fun e!208901 () Bool)

(assert (=> b!340583 (= e!208901 tp_is_empty!7165)))

(declare-fun b!340584 () Bool)

(declare-fun e!208903 () Bool)

(assert (=> b!340584 (= e!208902 e!208903)))

(declare-fun res!188200 () Bool)

(assert (=> b!340584 (=> (not res!188200) (not e!208903))))

(declare-datatypes ((SeekEntryResult!3262 0))(
  ( (MissingZero!3262 (index!15227 (_ BitVec 32))) (Found!3262 (index!15228 (_ BitVec 32))) (Intermediate!3262 (undefined!4074 Bool) (index!15229 (_ BitVec 32)) (x!33931 (_ BitVec 32))) (Undefined!3262) (MissingVacant!3262 (index!15230 (_ BitVec 32))) )
))
(declare-fun lt!161429 () SeekEntryResult!3262)

(get-info :version)

(assert (=> b!340584 (= res!188200 (and (not ((_ is Found!3262) lt!161429)) (not ((_ is MissingZero!3262) lt!161429)) ((_ is MissingVacant!3262) lt!161429)))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17907 (_ BitVec 32)) SeekEntryResult!3262)

(assert (=> b!340584 (= lt!161429 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!340585 () Bool)

(declare-fun res!188201 () Bool)

(assert (=> b!340585 (=> (not res!188201) (not e!208903))))

(declare-fun arrayContainsKey!0 (array!17907 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!340585 (= res!188201 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!340586 () Bool)

(declare-fun res!188202 () Bool)

(assert (=> b!340586 (=> (not res!188202) (not e!208902))))

(declare-fun zeroValue!1467 () V!10531)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10531)

(declare-datatypes ((tuple2!5200 0))(
  ( (tuple2!5201 (_1!2611 (_ BitVec 64)) (_2!2611 V!10531)) )
))
(declare-datatypes ((List!4824 0))(
  ( (Nil!4821) (Cons!4820 (h!5676 tuple2!5200) (t!9923 List!4824)) )
))
(declare-datatypes ((ListLongMap!4103 0))(
  ( (ListLongMap!4104 (toList!2067 List!4824)) )
))
(declare-fun contains!2132 (ListLongMap!4103 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1573 (array!17907 array!17905 (_ BitVec 32) (_ BitVec 32) V!10531 V!10531 (_ BitVec 32) Int) ListLongMap!4103)

(assert (=> b!340586 (= res!188202 (not (contains!2132 (getCurrentListMap!1573 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!340587 () Bool)

(declare-fun res!188205 () Bool)

(assert (=> b!340587 (=> (not res!188205) (not e!208902))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17907 (_ BitVec 32)) Bool)

(assert (=> b!340587 (= res!188205 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!340588 () Bool)

(declare-fun res!188203 () Bool)

(assert (=> b!340588 (=> (not res!188203) (not e!208902))))

(assert (=> b!340588 (= res!188203 (and (= (size!8826 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8827 _keys!1895) (size!8826 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!340589 () Bool)

(declare-fun res!188204 () Bool)

(assert (=> b!340589 (=> (not res!188204) (not e!208902))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!340589 (= res!188204 (validKeyInArray!0 k0!1348))))

(declare-fun mapIsEmpty!12174 () Bool)

(declare-fun mapRes!12174 () Bool)

(assert (=> mapIsEmpty!12174 mapRes!12174))

(declare-fun mapNonEmpty!12174 () Bool)

(declare-fun tp!25172 () Bool)

(declare-fun e!208904 () Bool)

(assert (=> mapNonEmpty!12174 (= mapRes!12174 (and tp!25172 e!208904))))

(declare-fun mapKey!12174 () (_ BitVec 32))

(declare-fun mapValue!12174 () ValueCell!3239)

(declare-fun mapRest!12174 () (Array (_ BitVec 32) ValueCell!3239))

(assert (=> mapNonEmpty!12174 (= (arr!8473 _values!1525) (store mapRest!12174 mapKey!12174 mapValue!12174))))

(declare-fun b!340590 () Bool)

(assert (=> b!340590 (= e!208904 tp_is_empty!7165)))

(declare-fun b!340591 () Bool)

(assert (=> b!340591 (= e!208903 false)))

(declare-fun lt!161430 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17907 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!340591 (= lt!161430 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!340592 () Bool)

(declare-fun res!188207 () Bool)

(assert (=> b!340592 (=> (not res!188207) (not e!208902))))

(declare-datatypes ((List!4825 0))(
  ( (Nil!4822) (Cons!4821 (h!5677 (_ BitVec 64)) (t!9924 List!4825)) )
))
(declare-fun arrayNoDuplicates!0 (array!17907 (_ BitVec 32) List!4825) Bool)

(assert (=> b!340592 (= res!188207 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4822))))

(declare-fun b!340593 () Bool)

(assert (=> b!340593 (= e!208905 (and e!208901 mapRes!12174))))

(declare-fun condMapEmpty!12174 () Bool)

(declare-fun mapDefault!12174 () ValueCell!3239)

(assert (=> b!340593 (= condMapEmpty!12174 (= (arr!8473 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3239)) mapDefault!12174)))))

(assert (= (and start!34176 res!188206) b!340588))

(assert (= (and b!340588 res!188203) b!340587))

(assert (= (and b!340587 res!188205) b!340592))

(assert (= (and b!340592 res!188207) b!340589))

(assert (= (and b!340589 res!188204) b!340586))

(assert (= (and b!340586 res!188202) b!340584))

(assert (= (and b!340584 res!188200) b!340585))

(assert (= (and b!340585 res!188201) b!340591))

(assert (= (and b!340593 condMapEmpty!12174) mapIsEmpty!12174))

(assert (= (and b!340593 (not condMapEmpty!12174)) mapNonEmpty!12174))

(assert (= (and mapNonEmpty!12174 ((_ is ValueCellFull!3239) mapValue!12174)) b!340590))

(assert (= (and b!340593 ((_ is ValueCellFull!3239) mapDefault!12174)) b!340583))

(assert (= start!34176 b!340593))

(declare-fun m!342717 () Bool)

(assert (=> b!340586 m!342717))

(assert (=> b!340586 m!342717))

(declare-fun m!342719 () Bool)

(assert (=> b!340586 m!342719))

(declare-fun m!342721 () Bool)

(assert (=> start!34176 m!342721))

(declare-fun m!342723 () Bool)

(assert (=> start!34176 m!342723))

(declare-fun m!342725 () Bool)

(assert (=> start!34176 m!342725))

(declare-fun m!342727 () Bool)

(assert (=> b!340589 m!342727))

(declare-fun m!342729 () Bool)

(assert (=> mapNonEmpty!12174 m!342729))

(declare-fun m!342731 () Bool)

(assert (=> b!340591 m!342731))

(declare-fun m!342733 () Bool)

(assert (=> b!340584 m!342733))

(declare-fun m!342735 () Bool)

(assert (=> b!340587 m!342735))

(declare-fun m!342737 () Bool)

(assert (=> b!340592 m!342737))

(declare-fun m!342739 () Bool)

(assert (=> b!340585 m!342739))

(check-sat (not b!340589) (not b_next!7213) (not mapNonEmpty!12174) (not b!340584) (not b!340585) b_and!14387 (not b!340592) (not b!340591) (not start!34176) tp_is_empty!7165 (not b!340586) (not b!340587))
(check-sat b_and!14387 (not b_next!7213))
