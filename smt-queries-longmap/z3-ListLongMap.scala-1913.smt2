; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34054 () Bool)

(assert start!34054)

(declare-fun b_free!7147 () Bool)

(declare-fun b_next!7147 () Bool)

(assert (=> start!34054 (= b_free!7147 (not b_next!7147))))

(declare-fun tp!24966 () Bool)

(declare-fun b_and!14315 () Bool)

(assert (=> start!34054 (= tp!24966 b_and!14315)))

(declare-fun res!187355 () Bool)

(declare-fun e!208081 () Bool)

(assert (=> start!34054 (=> (not res!187355) (not e!208081))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34054 (= res!187355 (validMask!0 mask!2385))))

(assert (=> start!34054 e!208081))

(assert (=> start!34054 true))

(declare-fun tp_is_empty!7099 () Bool)

(assert (=> start!34054 tp_is_empty!7099))

(assert (=> start!34054 tp!24966))

(declare-datatypes ((V!10443 0))(
  ( (V!10444 (val!3594 Int)) )
))
(declare-datatypes ((ValueCell!3206 0))(
  ( (ValueCellFull!3206 (v!5757 V!10443)) (EmptyCell!3206) )
))
(declare-datatypes ((array!17775 0))(
  ( (array!17776 (arr!8411 (Array (_ BitVec 32) ValueCell!3206)) (size!8764 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17775)

(declare-fun e!208080 () Bool)

(declare-fun array_inv!6264 (array!17775) Bool)

(assert (=> start!34054 (and (array_inv!6264 _values!1525) e!208080)))

(declare-datatypes ((array!17777 0))(
  ( (array!17778 (arr!8412 (Array (_ BitVec 32) (_ BitVec 64))) (size!8765 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17777)

(declare-fun array_inv!6265 (array!17777) Bool)

(assert (=> start!34054 (array_inv!6265 _keys!1895)))

(declare-fun b!339163 () Bool)

(declare-datatypes ((Unit!10547 0))(
  ( (Unit!10548) )
))
(declare-fun e!208084 () Unit!10547)

(declare-fun Unit!10549 () Unit!10547)

(assert (=> b!339163 (= e!208084 Unit!10549)))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10443)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10443)

(declare-fun lt!160972 () Unit!10547)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun lemmaArrayContainsKeyThenInListMap!286 (array!17777 array!17775 (_ BitVec 32) (_ BitVec 32) V!10443 V!10443 (_ BitVec 64) (_ BitVec 32) Int) Unit!10547)

(declare-fun arrayScanForKey!0 (array!17777 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!339163 (= lt!160972 (lemmaArrayContainsKeyThenInListMap!286 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!339163 false))

(declare-fun b!339164 () Bool)

(declare-fun e!208079 () Bool)

(declare-fun mapRes!12066 () Bool)

(assert (=> b!339164 (= e!208080 (and e!208079 mapRes!12066))))

(declare-fun condMapEmpty!12066 () Bool)

(declare-fun mapDefault!12066 () ValueCell!3206)

(assert (=> b!339164 (= condMapEmpty!12066 (= (arr!8411 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3206)) mapDefault!12066)))))

(declare-fun b!339165 () Bool)

(declare-fun res!187361 () Bool)

(assert (=> b!339165 (=> (not res!187361) (not e!208081))))

(assert (=> b!339165 (= res!187361 (and (= (size!8764 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8765 _keys!1895) (size!8764 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!339166 () Bool)

(declare-fun res!187359 () Bool)

(assert (=> b!339166 (=> (not res!187359) (not e!208081))))

(declare-datatypes ((List!4785 0))(
  ( (Nil!4782) (Cons!4781 (h!5637 (_ BitVec 64)) (t!9878 List!4785)) )
))
(declare-fun arrayNoDuplicates!0 (array!17777 (_ BitVec 32) List!4785) Bool)

(assert (=> b!339166 (= res!187359 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4782))))

(declare-fun b!339167 () Bool)

(assert (=> b!339167 (= e!208079 tp_is_empty!7099)))

(declare-fun b!339168 () Bool)

(declare-fun res!187357 () Bool)

(assert (=> b!339168 (=> (not res!187357) (not e!208081))))

(declare-datatypes ((tuple2!5160 0))(
  ( (tuple2!5161 (_1!2591 (_ BitVec 64)) (_2!2591 V!10443)) )
))
(declare-datatypes ((List!4786 0))(
  ( (Nil!4783) (Cons!4782 (h!5638 tuple2!5160) (t!9879 List!4786)) )
))
(declare-datatypes ((ListLongMap!4063 0))(
  ( (ListLongMap!4064 (toList!2047 List!4786)) )
))
(declare-fun contains!2109 (ListLongMap!4063 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1553 (array!17777 array!17775 (_ BitVec 32) (_ BitVec 32) V!10443 V!10443 (_ BitVec 32) Int) ListLongMap!4063)

(assert (=> b!339168 (= res!187357 (not (contains!2109 (getCurrentListMap!1553 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!339169 () Bool)

(declare-fun Unit!10550 () Unit!10547)

(assert (=> b!339169 (= e!208084 Unit!10550)))

(declare-fun b!339170 () Bool)

(declare-fun e!208082 () Bool)

(assert (=> b!339170 (= e!208082 false)))

(declare-fun lt!160973 () Unit!10547)

(assert (=> b!339170 (= lt!160973 e!208084)))

(declare-fun c!52487 () Bool)

(declare-fun arrayContainsKey!0 (array!17777 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!339170 (= c!52487 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!12066 () Bool)

(declare-fun tp!24965 () Bool)

(declare-fun e!208083 () Bool)

(assert (=> mapNonEmpty!12066 (= mapRes!12066 (and tp!24965 e!208083))))

(declare-fun mapRest!12066 () (Array (_ BitVec 32) ValueCell!3206))

(declare-fun mapKey!12066 () (_ BitVec 32))

(declare-fun mapValue!12066 () ValueCell!3206)

(assert (=> mapNonEmpty!12066 (= (arr!8411 _values!1525) (store mapRest!12066 mapKey!12066 mapValue!12066))))

(declare-fun b!339171 () Bool)

(declare-fun res!187356 () Bool)

(assert (=> b!339171 (=> (not res!187356) (not e!208081))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!339171 (= res!187356 (validKeyInArray!0 k0!1348))))

(declare-fun b!339172 () Bool)

(assert (=> b!339172 (= e!208081 e!208082)))

(declare-fun res!187360 () Bool)

(assert (=> b!339172 (=> (not res!187360) (not e!208082))))

(declare-datatypes ((SeekEntryResult!3247 0))(
  ( (MissingZero!3247 (index!15167 (_ BitVec 32))) (Found!3247 (index!15168 (_ BitVec 32))) (Intermediate!3247 (undefined!4059 Bool) (index!15169 (_ BitVec 32)) (x!33798 (_ BitVec 32))) (Undefined!3247) (MissingVacant!3247 (index!15170 (_ BitVec 32))) )
))
(declare-fun lt!160974 () SeekEntryResult!3247)

(get-info :version)

(assert (=> b!339172 (= res!187360 (and (not ((_ is Found!3247) lt!160974)) ((_ is MissingZero!3247) lt!160974)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17777 (_ BitVec 32)) SeekEntryResult!3247)

(assert (=> b!339172 (= lt!160974 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!339173 () Bool)

(declare-fun res!187358 () Bool)

(assert (=> b!339173 (=> (not res!187358) (not e!208081))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17777 (_ BitVec 32)) Bool)

(assert (=> b!339173 (= res!187358 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!339174 () Bool)

(assert (=> b!339174 (= e!208083 tp_is_empty!7099)))

(declare-fun mapIsEmpty!12066 () Bool)

(assert (=> mapIsEmpty!12066 mapRes!12066))

(assert (= (and start!34054 res!187355) b!339165))

(assert (= (and b!339165 res!187361) b!339173))

(assert (= (and b!339173 res!187358) b!339166))

(assert (= (and b!339166 res!187359) b!339171))

(assert (= (and b!339171 res!187356) b!339168))

(assert (= (and b!339168 res!187357) b!339172))

(assert (= (and b!339172 res!187360) b!339170))

(assert (= (and b!339170 c!52487) b!339163))

(assert (= (and b!339170 (not c!52487)) b!339169))

(assert (= (and b!339164 condMapEmpty!12066) mapIsEmpty!12066))

(assert (= (and b!339164 (not condMapEmpty!12066)) mapNonEmpty!12066))

(assert (= (and mapNonEmpty!12066 ((_ is ValueCellFull!3206) mapValue!12066)) b!339174))

(assert (= (and b!339164 ((_ is ValueCellFull!3206) mapDefault!12066)) b!339167))

(assert (= start!34054 b!339164))

(declare-fun m!341683 () Bool)

(assert (=> start!34054 m!341683))

(declare-fun m!341685 () Bool)

(assert (=> start!34054 m!341685))

(declare-fun m!341687 () Bool)

(assert (=> start!34054 m!341687))

(declare-fun m!341689 () Bool)

(assert (=> b!339168 m!341689))

(assert (=> b!339168 m!341689))

(declare-fun m!341691 () Bool)

(assert (=> b!339168 m!341691))

(declare-fun m!341693 () Bool)

(assert (=> b!339170 m!341693))

(declare-fun m!341695 () Bool)

(assert (=> b!339173 m!341695))

(declare-fun m!341697 () Bool)

(assert (=> mapNonEmpty!12066 m!341697))

(declare-fun m!341699 () Bool)

(assert (=> b!339172 m!341699))

(declare-fun m!341701 () Bool)

(assert (=> b!339163 m!341701))

(assert (=> b!339163 m!341701))

(declare-fun m!341703 () Bool)

(assert (=> b!339163 m!341703))

(declare-fun m!341705 () Bool)

(assert (=> b!339166 m!341705))

(declare-fun m!341707 () Bool)

(assert (=> b!339171 m!341707))

(check-sat (not b!339173) (not mapNonEmpty!12066) (not b!339166) (not b!339172) (not b!339170) tp_is_empty!7099 b_and!14315 (not b!339171) (not b_next!7147) (not b!339163) (not start!34054) (not b!339168))
(check-sat b_and!14315 (not b_next!7147))
