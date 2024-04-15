; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34444 () Bool)

(assert start!34444)

(declare-fun b_free!7381 () Bool)

(declare-fun b_next!7381 () Bool)

(assert (=> start!34444 (= b_free!7381 (not b_next!7381))))

(declare-fun tp!25689 () Bool)

(declare-fun b_and!14563 () Bool)

(assert (=> start!34444 (= tp!25689 b_and!14563)))

(declare-fun res!190195 () Bool)

(declare-fun e!210835 () Bool)

(assert (=> start!34444 (=> (not res!190195) (not e!210835))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34444 (= res!190195 (validMask!0 mask!2385))))

(assert (=> start!34444 e!210835))

(assert (=> start!34444 true))

(declare-fun tp_is_empty!7333 () Bool)

(assert (=> start!34444 tp_is_empty!7333))

(assert (=> start!34444 tp!25689))

(declare-datatypes ((V!10755 0))(
  ( (V!10756 (val!3711 Int)) )
))
(declare-datatypes ((ValueCell!3323 0))(
  ( (ValueCellFull!3323 (v!5881 V!10755)) (EmptyCell!3323) )
))
(declare-datatypes ((array!18247 0))(
  ( (array!18248 (arr!8640 (Array (_ BitVec 32) ValueCell!3323)) (size!8993 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18247)

(declare-fun e!210836 () Bool)

(declare-fun array_inv!6422 (array!18247) Bool)

(assert (=> start!34444 (and (array_inv!6422 _values!1525) e!210836)))

(declare-datatypes ((array!18249 0))(
  ( (array!18250 (arr!8641 (Array (_ BitVec 32) (_ BitVec 64))) (size!8994 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18249)

(declare-fun array_inv!6423 (array!18249) Bool)

(assert (=> start!34444 (array_inv!6423 _keys!1895)))

(declare-fun mapIsEmpty!12438 () Bool)

(declare-fun mapRes!12438 () Bool)

(assert (=> mapIsEmpty!12438 mapRes!12438))

(declare-fun b!343916 () Bool)

(declare-fun res!190196 () Bool)

(assert (=> b!343916 (=> (not res!190196) (not e!210835))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!343916 (= res!190196 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!12438 () Bool)

(declare-fun tp!25688 () Bool)

(declare-fun e!210834 () Bool)

(assert (=> mapNonEmpty!12438 (= mapRes!12438 (and tp!25688 e!210834))))

(declare-fun mapValue!12438 () ValueCell!3323)

(declare-fun mapKey!12438 () (_ BitVec 32))

(declare-fun mapRest!12438 () (Array (_ BitVec 32) ValueCell!3323))

(assert (=> mapNonEmpty!12438 (= (arr!8640 _values!1525) (store mapRest!12438 mapKey!12438 mapValue!12438))))

(declare-fun b!343917 () Bool)

(assert (=> b!343917 (= e!210834 tp_is_empty!7333)))

(declare-fun b!343918 () Bool)

(assert (=> b!343918 (= e!210835 false)))

(declare-datatypes ((SeekEntryResult!3330 0))(
  ( (MissingZero!3330 (index!15499 (_ BitVec 32))) (Found!3330 (index!15500 (_ BitVec 32))) (Intermediate!3330 (undefined!4142 Bool) (index!15501 (_ BitVec 32)) (x!34263 (_ BitVec 32))) (Undefined!3330) (MissingVacant!3330 (index!15502 (_ BitVec 32))) )
))
(declare-fun lt!162411 () SeekEntryResult!3330)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18249 (_ BitVec 32)) SeekEntryResult!3330)

(assert (=> b!343918 (= lt!162411 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!343919 () Bool)

(declare-fun res!190194 () Bool)

(assert (=> b!343919 (=> (not res!190194) (not e!210835))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18249 (_ BitVec 32)) Bool)

(assert (=> b!343919 (= res!190194 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!343920 () Bool)

(declare-fun res!190191 () Bool)

(assert (=> b!343920 (=> (not res!190191) (not e!210835))))

(declare-fun zeroValue!1467 () V!10755)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10755)

(declare-datatypes ((tuple2!5326 0))(
  ( (tuple2!5327 (_1!2674 (_ BitVec 64)) (_2!2674 V!10755)) )
))
(declare-datatypes ((List!4949 0))(
  ( (Nil!4946) (Cons!4945 (h!5801 tuple2!5326) (t!10056 List!4949)) )
))
(declare-datatypes ((ListLongMap!4229 0))(
  ( (ListLongMap!4230 (toList!2130 List!4949)) )
))
(declare-fun contains!2199 (ListLongMap!4229 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1636 (array!18249 array!18247 (_ BitVec 32) (_ BitVec 32) V!10755 V!10755 (_ BitVec 32) Int) ListLongMap!4229)

(assert (=> b!343920 (= res!190191 (not (contains!2199 (getCurrentListMap!1636 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!343921 () Bool)

(declare-fun res!190193 () Bool)

(assert (=> b!343921 (=> (not res!190193) (not e!210835))))

(assert (=> b!343921 (= res!190193 (and (= (size!8993 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8994 _keys!1895) (size!8993 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!343922 () Bool)

(declare-fun res!190192 () Bool)

(assert (=> b!343922 (=> (not res!190192) (not e!210835))))

(declare-datatypes ((List!4950 0))(
  ( (Nil!4947) (Cons!4946 (h!5802 (_ BitVec 64)) (t!10057 List!4950)) )
))
(declare-fun arrayNoDuplicates!0 (array!18249 (_ BitVec 32) List!4950) Bool)

(assert (=> b!343922 (= res!190192 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4947))))

(declare-fun b!343923 () Bool)

(declare-fun e!210837 () Bool)

(assert (=> b!343923 (= e!210836 (and e!210837 mapRes!12438))))

(declare-fun condMapEmpty!12438 () Bool)

(declare-fun mapDefault!12438 () ValueCell!3323)

(assert (=> b!343923 (= condMapEmpty!12438 (= (arr!8640 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3323)) mapDefault!12438)))))

(declare-fun b!343924 () Bool)

(assert (=> b!343924 (= e!210837 tp_is_empty!7333)))

(assert (= (and start!34444 res!190195) b!343921))

(assert (= (and b!343921 res!190193) b!343919))

(assert (= (and b!343919 res!190194) b!343922))

(assert (= (and b!343922 res!190192) b!343916))

(assert (= (and b!343916 res!190196) b!343920))

(assert (= (and b!343920 res!190191) b!343918))

(assert (= (and b!343923 condMapEmpty!12438) mapIsEmpty!12438))

(assert (= (and b!343923 (not condMapEmpty!12438)) mapNonEmpty!12438))

(get-info :version)

(assert (= (and mapNonEmpty!12438 ((_ is ValueCellFull!3323) mapValue!12438)) b!343917))

(assert (= (and b!343923 ((_ is ValueCellFull!3323) mapDefault!12438)) b!343924))

(assert (= start!34444 b!343923))

(declare-fun m!345147 () Bool)

(assert (=> b!343918 m!345147))

(declare-fun m!345149 () Bool)

(assert (=> b!343919 m!345149))

(declare-fun m!345151 () Bool)

(assert (=> b!343916 m!345151))

(declare-fun m!345153 () Bool)

(assert (=> b!343922 m!345153))

(declare-fun m!345155 () Bool)

(assert (=> b!343920 m!345155))

(assert (=> b!343920 m!345155))

(declare-fun m!345157 () Bool)

(assert (=> b!343920 m!345157))

(declare-fun m!345159 () Bool)

(assert (=> mapNonEmpty!12438 m!345159))

(declare-fun m!345161 () Bool)

(assert (=> start!34444 m!345161))

(declare-fun m!345163 () Bool)

(assert (=> start!34444 m!345163))

(declare-fun m!345165 () Bool)

(assert (=> start!34444 m!345165))

(check-sat (not b!343920) (not start!34444) (not b!343918) (not mapNonEmpty!12438) (not b!343922) (not b_next!7381) (not b!343919) b_and!14563 (not b!343916) tp_is_empty!7333)
(check-sat b_and!14563 (not b_next!7381))
