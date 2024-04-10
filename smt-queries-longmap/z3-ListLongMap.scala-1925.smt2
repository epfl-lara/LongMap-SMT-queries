; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34198 () Bool)

(assert start!34198)

(declare-fun b_free!7221 () Bool)

(declare-fun b_next!7221 () Bool)

(assert (=> start!34198 (= b_free!7221 (not b_next!7221))))

(declare-fun tp!25196 () Bool)

(declare-fun b_and!14421 () Bool)

(assert (=> start!34198 (= tp!25196 b_and!14421)))

(declare-fun b!340990 () Bool)

(declare-fun e!209151 () Bool)

(declare-fun e!209152 () Bool)

(declare-fun mapRes!12186 () Bool)

(assert (=> b!340990 (= e!209151 (and e!209152 mapRes!12186))))

(declare-fun condMapEmpty!12186 () Bool)

(declare-datatypes ((V!10541 0))(
  ( (V!10542 (val!3631 Int)) )
))
(declare-datatypes ((ValueCell!3243 0))(
  ( (ValueCellFull!3243 (v!5803 V!10541)) (EmptyCell!3243) )
))
(declare-datatypes ((array!17945 0))(
  ( (array!17946 (arr!8493 (Array (_ BitVec 32) ValueCell!3243)) (size!8845 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17945)

(declare-fun mapDefault!12186 () ValueCell!3243)

(assert (=> b!340990 (= condMapEmpty!12186 (= (arr!8493 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3243)) mapDefault!12186)))))

(declare-fun b!340991 () Bool)

(declare-fun res!188432 () Bool)

(declare-fun e!209154 () Bool)

(assert (=> b!340991 (=> (not res!188432) (not e!209154))))

(declare-datatypes ((array!17947 0))(
  ( (array!17948 (arr!8494 (Array (_ BitVec 32) (_ BitVec 64))) (size!8846 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17947)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17947 (_ BitVec 32)) Bool)

(assert (=> b!340991 (= res!188432 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun res!188428 () Bool)

(assert (=> start!34198 (=> (not res!188428) (not e!209154))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34198 (= res!188428 (validMask!0 mask!2385))))

(assert (=> start!34198 e!209154))

(assert (=> start!34198 true))

(declare-fun tp_is_empty!7173 () Bool)

(assert (=> start!34198 tp_is_empty!7173))

(assert (=> start!34198 tp!25196))

(declare-fun array_inv!6292 (array!17945) Bool)

(assert (=> start!34198 (and (array_inv!6292 _values!1525) e!209151)))

(declare-fun array_inv!6293 (array!17947) Bool)

(assert (=> start!34198 (array_inv!6293 _keys!1895)))

(declare-fun b!340992 () Bool)

(declare-fun e!209153 () Bool)

(assert (=> b!340992 (= e!209153 tp_is_empty!7173)))

(declare-fun b!340993 () Bool)

(declare-fun res!188427 () Bool)

(declare-fun e!209150 () Bool)

(assert (=> b!340993 (=> (not res!188427) (not e!209150))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17947 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!340993 (= res!188427 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!12186 () Bool)

(declare-fun tp!25197 () Bool)

(assert (=> mapNonEmpty!12186 (= mapRes!12186 (and tp!25197 e!209153))))

(declare-fun mapKey!12186 () (_ BitVec 32))

(declare-fun mapValue!12186 () ValueCell!3243)

(declare-fun mapRest!12186 () (Array (_ BitVec 32) ValueCell!3243))

(assert (=> mapNonEmpty!12186 (= (arr!8493 _values!1525) (store mapRest!12186 mapKey!12186 mapValue!12186))))

(declare-fun b!340994 () Bool)

(assert (=> b!340994 (= e!209154 e!209150)))

(declare-fun res!188430 () Bool)

(assert (=> b!340994 (=> (not res!188430) (not e!209150))))

(declare-datatypes ((SeekEntryResult!3282 0))(
  ( (MissingZero!3282 (index!15307 (_ BitVec 32))) (Found!3282 (index!15308 (_ BitVec 32))) (Intermediate!3282 (undefined!4094 Bool) (index!15309 (_ BitVec 32)) (x!33964 (_ BitVec 32))) (Undefined!3282) (MissingVacant!3282 (index!15310 (_ BitVec 32))) )
))
(declare-fun lt!161688 () SeekEntryResult!3282)

(get-info :version)

(assert (=> b!340994 (= res!188430 (and (not ((_ is Found!3282) lt!161688)) (not ((_ is MissingZero!3282) lt!161688)) ((_ is MissingVacant!3282) lt!161688)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17947 (_ BitVec 32)) SeekEntryResult!3282)

(assert (=> b!340994 (= lt!161688 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12186 () Bool)

(assert (=> mapIsEmpty!12186 mapRes!12186))

(declare-fun b!340995 () Bool)

(declare-fun res!188431 () Bool)

(assert (=> b!340995 (=> (not res!188431) (not e!209154))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!340995 (= res!188431 (validKeyInArray!0 k0!1348))))

(declare-fun b!340996 () Bool)

(declare-fun res!188429 () Bool)

(assert (=> b!340996 (=> (not res!188429) (not e!209154))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!340996 (= res!188429 (and (= (size!8845 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8846 _keys!1895) (size!8845 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!340997 () Bool)

(assert (=> b!340997 (= e!209152 tp_is_empty!7173)))

(declare-fun b!340998 () Bool)

(declare-fun res!188426 () Bool)

(assert (=> b!340998 (=> (not res!188426) (not e!209154))))

(declare-datatypes ((List!4887 0))(
  ( (Nil!4884) (Cons!4883 (h!5739 (_ BitVec 64)) (t!9995 List!4887)) )
))
(declare-fun arrayNoDuplicates!0 (array!17947 (_ BitVec 32) List!4887) Bool)

(assert (=> b!340998 (= res!188426 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4884))))

(declare-fun b!340999 () Bool)

(assert (=> b!340999 (= e!209150 false)))

(declare-fun lt!161689 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17947 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!340999 (= lt!161689 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!341000 () Bool)

(declare-fun res!188425 () Bool)

(assert (=> b!341000 (=> (not res!188425) (not e!209154))))

(declare-fun zeroValue!1467 () V!10541)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10541)

(declare-datatypes ((tuple2!5268 0))(
  ( (tuple2!5269 (_1!2645 (_ BitVec 64)) (_2!2645 V!10541)) )
))
(declare-datatypes ((List!4888 0))(
  ( (Nil!4885) (Cons!4884 (h!5740 tuple2!5268) (t!9996 List!4888)) )
))
(declare-datatypes ((ListLongMap!4181 0))(
  ( (ListLongMap!4182 (toList!2106 List!4888)) )
))
(declare-fun contains!2160 (ListLongMap!4181 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1627 (array!17947 array!17945 (_ BitVec 32) (_ BitVec 32) V!10541 V!10541 (_ BitVec 32) Int) ListLongMap!4181)

(assert (=> b!341000 (= res!188425 (not (contains!2160 (getCurrentListMap!1627 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(assert (= (and start!34198 res!188428) b!340996))

(assert (= (and b!340996 res!188429) b!340991))

(assert (= (and b!340991 res!188432) b!340998))

(assert (= (and b!340998 res!188426) b!340995))

(assert (= (and b!340995 res!188431) b!341000))

(assert (= (and b!341000 res!188425) b!340994))

(assert (= (and b!340994 res!188430) b!340993))

(assert (= (and b!340993 res!188427) b!340999))

(assert (= (and b!340990 condMapEmpty!12186) mapIsEmpty!12186))

(assert (= (and b!340990 (not condMapEmpty!12186)) mapNonEmpty!12186))

(assert (= (and mapNonEmpty!12186 ((_ is ValueCellFull!3243) mapValue!12186)) b!340992))

(assert (= (and b!340990 ((_ is ValueCellFull!3243) mapDefault!12186)) b!340997))

(assert (= start!34198 b!340990))

(declare-fun m!343543 () Bool)

(assert (=> b!340994 m!343543))

(declare-fun m!343545 () Bool)

(assert (=> start!34198 m!343545))

(declare-fun m!343547 () Bool)

(assert (=> start!34198 m!343547))

(declare-fun m!343549 () Bool)

(assert (=> start!34198 m!343549))

(declare-fun m!343551 () Bool)

(assert (=> b!340993 m!343551))

(declare-fun m!343553 () Bool)

(assert (=> mapNonEmpty!12186 m!343553))

(declare-fun m!343555 () Bool)

(assert (=> b!340999 m!343555))

(declare-fun m!343557 () Bool)

(assert (=> b!340998 m!343557))

(declare-fun m!343559 () Bool)

(assert (=> b!340991 m!343559))

(declare-fun m!343561 () Bool)

(assert (=> b!341000 m!343561))

(assert (=> b!341000 m!343561))

(declare-fun m!343563 () Bool)

(assert (=> b!341000 m!343563))

(declare-fun m!343565 () Bool)

(assert (=> b!340995 m!343565))

(check-sat (not b!340991) (not b!340994) (not b!340999) (not start!34198) (not mapNonEmpty!12186) b_and!14421 (not b_next!7221) (not b!340995) (not b!340998) (not b!341000) (not b!340993) tp_is_empty!7173)
(check-sat b_and!14421 (not b_next!7221))
