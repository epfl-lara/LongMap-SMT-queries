; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34768 () Bool)

(assert start!34768)

(declare-fun b_free!7567 () Bool)

(declare-fun b_next!7567 () Bool)

(assert (=> start!34768 (= b_free!7567 (not b_next!7567))))

(declare-fun tp!26267 () Bool)

(declare-fun b_and!14763 () Bool)

(assert (=> start!34768 (= tp!26267 b_and!14763)))

(declare-fun b!347640 () Bool)

(declare-fun e!213006 () Bool)

(declare-fun tp_is_empty!7519 () Bool)

(assert (=> b!347640 (= e!213006 tp_is_empty!7519)))

(declare-fun res!192505 () Bool)

(declare-fun e!213003 () Bool)

(assert (=> start!34768 (=> (not res!192505) (not e!213003))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34768 (= res!192505 (validMask!0 mask!2385))))

(assert (=> start!34768 e!213003))

(assert (=> start!34768 true))

(assert (=> start!34768 tp_is_empty!7519))

(assert (=> start!34768 tp!26267))

(declare-datatypes ((V!11003 0))(
  ( (V!11004 (val!3804 Int)) )
))
(declare-datatypes ((ValueCell!3416 0))(
  ( (ValueCellFull!3416 (v!5981 V!11003)) (EmptyCell!3416) )
))
(declare-datatypes ((array!18611 0))(
  ( (array!18612 (arr!8815 (Array (_ BitVec 32) ValueCell!3416)) (size!9168 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18611)

(declare-fun e!213005 () Bool)

(declare-fun array_inv!6544 (array!18611) Bool)

(assert (=> start!34768 (and (array_inv!6544 _values!1525) e!213005)))

(declare-datatypes ((array!18613 0))(
  ( (array!18614 (arr!8816 (Array (_ BitVec 32) (_ BitVec 64))) (size!9169 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18613)

(declare-fun array_inv!6545 (array!18613) Bool)

(assert (=> start!34768 (array_inv!6545 _keys!1895)))

(declare-fun b!347641 () Bool)

(declare-fun res!192509 () Bool)

(assert (=> b!347641 (=> (not res!192509) (not e!213003))))

(declare-datatypes ((List!5076 0))(
  ( (Nil!5073) (Cons!5072 (h!5928 (_ BitVec 64)) (t!10197 List!5076)) )
))
(declare-fun arrayNoDuplicates!0 (array!18613 (_ BitVec 32) List!5076) Bool)

(assert (=> b!347641 (= res!192509 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5073))))

(declare-fun mapIsEmpty!12738 () Bool)

(declare-fun mapRes!12738 () Bool)

(assert (=> mapIsEmpty!12738 mapRes!12738))

(declare-fun b!347642 () Bool)

(declare-fun e!213004 () Bool)

(assert (=> b!347642 (= e!213004 (not true))))

(declare-datatypes ((tuple2!5460 0))(
  ( (tuple2!5461 (_1!2741 (_ BitVec 64)) (_2!2741 V!11003)) )
))
(declare-datatypes ((List!5077 0))(
  ( (Nil!5074) (Cons!5073 (h!5929 tuple2!5460) (t!10198 List!5077)) )
))
(declare-datatypes ((ListLongMap!4363 0))(
  ( (ListLongMap!4364 (toList!2197 List!5077)) )
))
(declare-fun lt!163516 () ListLongMap!4363)

(declare-datatypes ((SeekEntryResult!3397 0))(
  ( (MissingZero!3397 (index!15767 (_ BitVec 32))) (Found!3397 (index!15768 (_ BitVec 32))) (Intermediate!3397 (undefined!4209 Bool) (index!15769 (_ BitVec 32)) (x!34648 (_ BitVec 32))) (Undefined!3397) (MissingVacant!3397 (index!15770 (_ BitVec 32))) )
))
(declare-fun lt!163517 () SeekEntryResult!3397)

(declare-fun contains!2273 (ListLongMap!4363 (_ BitVec 64)) Bool)

(assert (=> b!347642 (contains!2273 lt!163516 (select (arr!8816 _keys!1895) (index!15768 lt!163517)))))

(declare-datatypes ((Unit!10784 0))(
  ( (Unit!10785) )
))
(declare-fun lt!163515 () Unit!10784)

(declare-fun zeroValue!1467 () V!11003)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11003)

(declare-fun lemmaValidKeyInArrayIsInListMap!177 (array!18613 array!18611 (_ BitVec 32) (_ BitVec 32) V!11003 V!11003 (_ BitVec 32) Int) Unit!10784)

(assert (=> b!347642 (= lt!163515 (lemmaValidKeyInArrayIsInListMap!177 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!15768 lt!163517) defaultEntry!1528))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18613 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!347642 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-fun lt!163518 () Unit!10784)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18613 (_ BitVec 64) (_ BitVec 32)) Unit!10784)

(assert (=> b!347642 (= lt!163518 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!15768 lt!163517)))))

(declare-fun mapNonEmpty!12738 () Bool)

(declare-fun tp!26268 () Bool)

(assert (=> mapNonEmpty!12738 (= mapRes!12738 (and tp!26268 e!213006))))

(declare-fun mapKey!12738 () (_ BitVec 32))

(declare-fun mapRest!12738 () (Array (_ BitVec 32) ValueCell!3416))

(declare-fun mapValue!12738 () ValueCell!3416)

(assert (=> mapNonEmpty!12738 (= (arr!8815 _values!1525) (store mapRest!12738 mapKey!12738 mapValue!12738))))

(declare-fun b!347643 () Bool)

(declare-fun res!192506 () Bool)

(assert (=> b!347643 (=> (not res!192506) (not e!213003))))

(assert (=> b!347643 (= res!192506 (and (= (size!9168 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9169 _keys!1895) (size!9168 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!347644 () Bool)

(declare-fun e!213007 () Bool)

(assert (=> b!347644 (= e!213003 e!213007)))

(declare-fun res!192511 () Bool)

(assert (=> b!347644 (=> (not res!192511) (not e!213007))))

(assert (=> b!347644 (= res!192511 (not (contains!2273 lt!163516 k0!1348)))))

(declare-fun getCurrentListMap!1703 (array!18613 array!18611 (_ BitVec 32) (_ BitVec 32) V!11003 V!11003 (_ BitVec 32) Int) ListLongMap!4363)

(assert (=> b!347644 (= lt!163516 (getCurrentListMap!1703 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!347645 () Bool)

(declare-fun res!192508 () Bool)

(assert (=> b!347645 (=> (not res!192508) (not e!213003))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!347645 (= res!192508 (validKeyInArray!0 k0!1348))))

(declare-fun b!347646 () Bool)

(declare-fun e!213009 () Bool)

(assert (=> b!347646 (= e!213005 (and e!213009 mapRes!12738))))

(declare-fun condMapEmpty!12738 () Bool)

(declare-fun mapDefault!12738 () ValueCell!3416)

(assert (=> b!347646 (= condMapEmpty!12738 (= (arr!8815 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3416)) mapDefault!12738)))))

(declare-fun b!347647 () Bool)

(assert (=> b!347647 (= e!213009 tp_is_empty!7519)))

(declare-fun b!347648 () Bool)

(declare-fun res!192507 () Bool)

(assert (=> b!347648 (=> (not res!192507) (not e!213003))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18613 (_ BitVec 32)) Bool)

(assert (=> b!347648 (= res!192507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!347649 () Bool)

(declare-fun res!192510 () Bool)

(assert (=> b!347649 (=> (not res!192510) (not e!213004))))

(assert (=> b!347649 (= res!192510 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15768 lt!163517)))))

(declare-fun b!347650 () Bool)

(assert (=> b!347650 (= e!213007 e!213004)))

(declare-fun res!192504 () Bool)

(assert (=> b!347650 (=> (not res!192504) (not e!213004))))

(get-info :version)

(assert (=> b!347650 (= res!192504 (and ((_ is Found!3397) lt!163517) (= (select (arr!8816 _keys!1895) (index!15768 lt!163517)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18613 (_ BitVec 32)) SeekEntryResult!3397)

(assert (=> b!347650 (= lt!163517 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(assert (= (and start!34768 res!192505) b!347643))

(assert (= (and b!347643 res!192506) b!347648))

(assert (= (and b!347648 res!192507) b!347641))

(assert (= (and b!347641 res!192509) b!347645))

(assert (= (and b!347645 res!192508) b!347644))

(assert (= (and b!347644 res!192511) b!347650))

(assert (= (and b!347650 res!192504) b!347649))

(assert (= (and b!347649 res!192510) b!347642))

(assert (= (and b!347646 condMapEmpty!12738) mapIsEmpty!12738))

(assert (= (and b!347646 (not condMapEmpty!12738)) mapNonEmpty!12738))

(assert (= (and mapNonEmpty!12738 ((_ is ValueCellFull!3416) mapValue!12738)) b!347640))

(assert (= (and b!347646 ((_ is ValueCellFull!3416) mapDefault!12738)) b!347647))

(assert (= start!34768 b!347646))

(declare-fun m!348051 () Bool)

(assert (=> mapNonEmpty!12738 m!348051))

(declare-fun m!348053 () Bool)

(assert (=> b!347642 m!348053))

(declare-fun m!348055 () Bool)

(assert (=> b!347642 m!348055))

(declare-fun m!348057 () Bool)

(assert (=> b!347642 m!348057))

(assert (=> b!347642 m!348053))

(declare-fun m!348059 () Bool)

(assert (=> b!347642 m!348059))

(declare-fun m!348061 () Bool)

(assert (=> b!347642 m!348061))

(declare-fun m!348063 () Bool)

(assert (=> b!347645 m!348063))

(declare-fun m!348065 () Bool)

(assert (=> b!347649 m!348065))

(assert (=> b!347650 m!348053))

(declare-fun m!348067 () Bool)

(assert (=> b!347650 m!348067))

(declare-fun m!348069 () Bool)

(assert (=> b!347641 m!348069))

(declare-fun m!348071 () Bool)

(assert (=> b!347648 m!348071))

(declare-fun m!348073 () Bool)

(assert (=> b!347644 m!348073))

(declare-fun m!348075 () Bool)

(assert (=> b!347644 m!348075))

(declare-fun m!348077 () Bool)

(assert (=> start!34768 m!348077))

(declare-fun m!348079 () Bool)

(assert (=> start!34768 m!348079))

(declare-fun m!348081 () Bool)

(assert (=> start!34768 m!348081))

(check-sat (not b!347650) (not b!347642) b_and!14763 (not mapNonEmpty!12738) (not b!347648) (not start!34768) (not b!347644) (not b!347645) tp_is_empty!7519 (not b_next!7567) (not b!347649) (not b!347641))
(check-sat b_and!14763 (not b_next!7567))
