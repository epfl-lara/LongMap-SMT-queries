; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34438 () Bool)

(assert start!34438)

(declare-fun b_free!7375 () Bool)

(declare-fun b_next!7375 () Bool)

(assert (=> start!34438 (= b_free!7375 (not b_next!7375))))

(declare-fun tp!25671 () Bool)

(declare-fun b_and!14557 () Bool)

(assert (=> start!34438 (= tp!25671 b_and!14557)))

(declare-fun b!343835 () Bool)

(declare-fun res!190139 () Bool)

(declare-fun e!210793 () Bool)

(assert (=> b!343835 (=> (not res!190139) (not e!210793))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!10747 0))(
  ( (V!10748 (val!3708 Int)) )
))
(declare-fun zeroValue!1467 () V!10747)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3320 0))(
  ( (ValueCellFull!3320 (v!5878 V!10747)) (EmptyCell!3320) )
))
(declare-datatypes ((array!18237 0))(
  ( (array!18238 (arr!8635 (Array (_ BitVec 32) ValueCell!3320)) (size!8988 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18237)

(declare-datatypes ((array!18239 0))(
  ( (array!18240 (arr!8636 (Array (_ BitVec 32) (_ BitVec 64))) (size!8989 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18239)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10747)

(declare-datatypes ((tuple2!5324 0))(
  ( (tuple2!5325 (_1!2673 (_ BitVec 64)) (_2!2673 V!10747)) )
))
(declare-datatypes ((List!4946 0))(
  ( (Nil!4943) (Cons!4942 (h!5798 tuple2!5324) (t!10053 List!4946)) )
))
(declare-datatypes ((ListLongMap!4227 0))(
  ( (ListLongMap!4228 (toList!2129 List!4946)) )
))
(declare-fun contains!2198 (ListLongMap!4227 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1635 (array!18239 array!18237 (_ BitVec 32) (_ BitVec 32) V!10747 V!10747 (_ BitVec 32) Int) ListLongMap!4227)

(assert (=> b!343835 (= res!190139 (not (contains!2198 (getCurrentListMap!1635 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!343836 () Bool)

(declare-fun res!190138 () Bool)

(assert (=> b!343836 (=> (not res!190138) (not e!210793))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!343836 (= res!190138 (validKeyInArray!0 k0!1348))))

(declare-fun b!343837 () Bool)

(declare-fun res!190137 () Bool)

(assert (=> b!343837 (=> (not res!190137) (not e!210793))))

(assert (=> b!343837 (= res!190137 (and (= (size!8988 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8989 _keys!1895) (size!8988 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!343838 () Bool)

(declare-fun e!210792 () Bool)

(declare-fun tp_is_empty!7327 () Bool)

(assert (=> b!343838 (= e!210792 tp_is_empty!7327)))

(declare-fun mapIsEmpty!12429 () Bool)

(declare-fun mapRes!12429 () Bool)

(assert (=> mapIsEmpty!12429 mapRes!12429))

(declare-fun b!343839 () Bool)

(declare-fun e!210789 () Bool)

(assert (=> b!343839 (= e!210789 tp_is_empty!7327)))

(declare-fun b!343841 () Bool)

(assert (=> b!343841 (= e!210793 false)))

(declare-datatypes ((SeekEntryResult!3329 0))(
  ( (MissingZero!3329 (index!15495 (_ BitVec 32))) (Found!3329 (index!15496 (_ BitVec 32))) (Intermediate!3329 (undefined!4141 Bool) (index!15497 (_ BitVec 32)) (x!34254 (_ BitVec 32))) (Undefined!3329) (MissingVacant!3329 (index!15498 (_ BitVec 32))) )
))
(declare-fun lt!162402 () SeekEntryResult!3329)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18239 (_ BitVec 32)) SeekEntryResult!3329)

(assert (=> b!343841 (= lt!162402 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12429 () Bool)

(declare-fun tp!25670 () Bool)

(assert (=> mapNonEmpty!12429 (= mapRes!12429 (and tp!25670 e!210789))))

(declare-fun mapValue!12429 () ValueCell!3320)

(declare-fun mapRest!12429 () (Array (_ BitVec 32) ValueCell!3320))

(declare-fun mapKey!12429 () (_ BitVec 32))

(assert (=> mapNonEmpty!12429 (= (arr!8635 _values!1525) (store mapRest!12429 mapKey!12429 mapValue!12429))))

(declare-fun b!343842 () Bool)

(declare-fun res!190142 () Bool)

(assert (=> b!343842 (=> (not res!190142) (not e!210793))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18239 (_ BitVec 32)) Bool)

(assert (=> b!343842 (= res!190142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!343843 () Bool)

(declare-fun e!210791 () Bool)

(assert (=> b!343843 (= e!210791 (and e!210792 mapRes!12429))))

(declare-fun condMapEmpty!12429 () Bool)

(declare-fun mapDefault!12429 () ValueCell!3320)

(assert (=> b!343843 (= condMapEmpty!12429 (= (arr!8635 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3320)) mapDefault!12429)))))

(declare-fun b!343840 () Bool)

(declare-fun res!190140 () Bool)

(assert (=> b!343840 (=> (not res!190140) (not e!210793))))

(declare-datatypes ((List!4947 0))(
  ( (Nil!4944) (Cons!4943 (h!5799 (_ BitVec 64)) (t!10054 List!4947)) )
))
(declare-fun arrayNoDuplicates!0 (array!18239 (_ BitVec 32) List!4947) Bool)

(assert (=> b!343840 (= res!190140 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4944))))

(declare-fun res!190141 () Bool)

(assert (=> start!34438 (=> (not res!190141) (not e!210793))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34438 (= res!190141 (validMask!0 mask!2385))))

(assert (=> start!34438 e!210793))

(assert (=> start!34438 true))

(assert (=> start!34438 tp_is_empty!7327))

(assert (=> start!34438 tp!25671))

(declare-fun array_inv!6420 (array!18237) Bool)

(assert (=> start!34438 (and (array_inv!6420 _values!1525) e!210791)))

(declare-fun array_inv!6421 (array!18239) Bool)

(assert (=> start!34438 (array_inv!6421 _keys!1895)))

(assert (= (and start!34438 res!190141) b!343837))

(assert (= (and b!343837 res!190137) b!343842))

(assert (= (and b!343842 res!190142) b!343840))

(assert (= (and b!343840 res!190140) b!343836))

(assert (= (and b!343836 res!190138) b!343835))

(assert (= (and b!343835 res!190139) b!343841))

(assert (= (and b!343843 condMapEmpty!12429) mapIsEmpty!12429))

(assert (= (and b!343843 (not condMapEmpty!12429)) mapNonEmpty!12429))

(get-info :version)

(assert (= (and mapNonEmpty!12429 ((_ is ValueCellFull!3320) mapValue!12429)) b!343839))

(assert (= (and b!343843 ((_ is ValueCellFull!3320) mapDefault!12429)) b!343838))

(assert (= start!34438 b!343843))

(declare-fun m!345087 () Bool)

(assert (=> start!34438 m!345087))

(declare-fun m!345089 () Bool)

(assert (=> start!34438 m!345089))

(declare-fun m!345091 () Bool)

(assert (=> start!34438 m!345091))

(declare-fun m!345093 () Bool)

(assert (=> b!343841 m!345093))

(declare-fun m!345095 () Bool)

(assert (=> b!343842 m!345095))

(declare-fun m!345097 () Bool)

(assert (=> b!343836 m!345097))

(declare-fun m!345099 () Bool)

(assert (=> b!343835 m!345099))

(assert (=> b!343835 m!345099))

(declare-fun m!345101 () Bool)

(assert (=> b!343835 m!345101))

(declare-fun m!345103 () Bool)

(assert (=> mapNonEmpty!12429 m!345103))

(declare-fun m!345105 () Bool)

(assert (=> b!343840 m!345105))

(check-sat (not b_next!7375) (not mapNonEmpty!12429) (not b!343835) (not b!343840) (not start!34438) (not b!343836) (not b!343841) b_and!14557 (not b!343842) tp_is_empty!7327)
(check-sat b_and!14557 (not b_next!7375))
