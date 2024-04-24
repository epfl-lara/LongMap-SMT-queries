; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34432 () Bool)

(assert start!34432)

(declare-fun b_free!7369 () Bool)

(declare-fun b_next!7369 () Bool)

(assert (=> start!34432 (= b_free!7369 (not b_next!7369))))

(declare-fun tp!25653 () Bool)

(declare-fun b_and!14591 () Bool)

(assert (=> start!34432 (= tp!25653 b_and!14591)))

(declare-fun b!343976 () Bool)

(declare-fun e!210890 () Bool)

(assert (=> b!343976 (= e!210890 false)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!18228 0))(
  ( (array!18229 (arr!8630 (Array (_ BitVec 32) (_ BitVec 64))) (size!8982 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18228)

(declare-datatypes ((SeekEntryResult!3281 0))(
  ( (MissingZero!3281 (index!15303 (_ BitVec 32))) (Found!3281 (index!15304 (_ BitVec 32))) (Intermediate!3281 (undefined!4093 Bool) (index!15305 (_ BitVec 32)) (x!34200 (_ BitVec 32))) (Undefined!3281) (MissingVacant!3281 (index!15306 (_ BitVec 32))) )
))
(declare-fun lt!162646 () SeekEntryResult!3281)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18228 (_ BitVec 32)) SeekEntryResult!3281)

(assert (=> b!343976 (= lt!162646 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!343977 () Bool)

(declare-fun e!210888 () Bool)

(declare-fun tp_is_empty!7321 () Bool)

(assert (=> b!343977 (= e!210888 tp_is_empty!7321)))

(declare-fun res!190213 () Bool)

(assert (=> start!34432 (=> (not res!190213) (not e!210890))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34432 (= res!190213 (validMask!0 mask!2385))))

(assert (=> start!34432 e!210890))

(assert (=> start!34432 true))

(assert (=> start!34432 tp_is_empty!7321))

(assert (=> start!34432 tp!25653))

(declare-datatypes ((V!10739 0))(
  ( (V!10740 (val!3705 Int)) )
))
(declare-datatypes ((ValueCell!3317 0))(
  ( (ValueCellFull!3317 (v!5882 V!10739)) (EmptyCell!3317) )
))
(declare-datatypes ((array!18230 0))(
  ( (array!18231 (arr!8631 (Array (_ BitVec 32) ValueCell!3317)) (size!8983 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18230)

(declare-fun e!210887 () Bool)

(declare-fun array_inv!6378 (array!18230) Bool)

(assert (=> start!34432 (and (array_inv!6378 _values!1525) e!210887)))

(declare-fun array_inv!6379 (array!18228) Bool)

(assert (=> start!34432 (array_inv!6379 _keys!1895)))

(declare-fun b!343978 () Bool)

(declare-fun e!210889 () Bool)

(assert (=> b!343978 (= e!210889 tp_is_empty!7321)))

(declare-fun b!343979 () Bool)

(declare-fun res!190210 () Bool)

(assert (=> b!343979 (=> (not res!190210) (not e!210890))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!343979 (= res!190210 (and (= (size!8983 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8982 _keys!1895) (size!8983 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!12420 () Bool)

(declare-fun mapRes!12420 () Bool)

(declare-fun tp!25652 () Bool)

(assert (=> mapNonEmpty!12420 (= mapRes!12420 (and tp!25652 e!210889))))

(declare-fun mapValue!12420 () ValueCell!3317)

(declare-fun mapKey!12420 () (_ BitVec 32))

(declare-fun mapRest!12420 () (Array (_ BitVec 32) ValueCell!3317))

(assert (=> mapNonEmpty!12420 (= (arr!8631 _values!1525) (store mapRest!12420 mapKey!12420 mapValue!12420))))

(declare-fun b!343980 () Bool)

(declare-fun res!190209 () Bool)

(assert (=> b!343980 (=> (not res!190209) (not e!210890))))

(declare-fun zeroValue!1467 () V!10739)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10739)

(declare-datatypes ((tuple2!5286 0))(
  ( (tuple2!5287 (_1!2654 (_ BitVec 64)) (_2!2654 V!10739)) )
))
(declare-datatypes ((List!4890 0))(
  ( (Nil!4887) (Cons!4886 (h!5742 tuple2!5286) (t!9998 List!4890)) )
))
(declare-datatypes ((ListLongMap!4201 0))(
  ( (ListLongMap!4202 (toList!2116 List!4890)) )
))
(declare-fun contains!2193 (ListLongMap!4201 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1645 (array!18228 array!18230 (_ BitVec 32) (_ BitVec 32) V!10739 V!10739 (_ BitVec 32) Int) ListLongMap!4201)

(assert (=> b!343980 (= res!190209 (not (contains!2193 (getCurrentListMap!1645 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapIsEmpty!12420 () Bool)

(assert (=> mapIsEmpty!12420 mapRes!12420))

(declare-fun b!343981 () Bool)

(assert (=> b!343981 (= e!210887 (and e!210888 mapRes!12420))))

(declare-fun condMapEmpty!12420 () Bool)

(declare-fun mapDefault!12420 () ValueCell!3317)

(assert (=> b!343981 (= condMapEmpty!12420 (= (arr!8631 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3317)) mapDefault!12420)))))

(declare-fun b!343982 () Bool)

(declare-fun res!190212 () Bool)

(assert (=> b!343982 (=> (not res!190212) (not e!210890))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!343982 (= res!190212 (validKeyInArray!0 k0!1348))))

(declare-fun b!343983 () Bool)

(declare-fun res!190211 () Bool)

(assert (=> b!343983 (=> (not res!190211) (not e!210890))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18228 (_ BitVec 32)) Bool)

(assert (=> b!343983 (= res!190211 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!343984 () Bool)

(declare-fun res!190214 () Bool)

(assert (=> b!343984 (=> (not res!190214) (not e!210890))))

(declare-datatypes ((List!4891 0))(
  ( (Nil!4888) (Cons!4887 (h!5743 (_ BitVec 64)) (t!9999 List!4891)) )
))
(declare-fun arrayNoDuplicates!0 (array!18228 (_ BitVec 32) List!4891) Bool)

(assert (=> b!343984 (= res!190214 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4888))))

(assert (= (and start!34432 res!190213) b!343979))

(assert (= (and b!343979 res!190210) b!343983))

(assert (= (and b!343983 res!190211) b!343984))

(assert (= (and b!343984 res!190214) b!343982))

(assert (= (and b!343982 res!190212) b!343980))

(assert (= (and b!343980 res!190209) b!343976))

(assert (= (and b!343981 condMapEmpty!12420) mapIsEmpty!12420))

(assert (= (and b!343981 (not condMapEmpty!12420)) mapNonEmpty!12420))

(get-info :version)

(assert (= (and mapNonEmpty!12420 ((_ is ValueCellFull!3317) mapValue!12420)) b!343978))

(assert (= (and b!343981 ((_ is ValueCellFull!3317) mapDefault!12420)) b!343977))

(assert (= start!34432 b!343981))

(declare-fun m!345981 () Bool)

(assert (=> b!343976 m!345981))

(declare-fun m!345983 () Bool)

(assert (=> b!343984 m!345983))

(declare-fun m!345985 () Bool)

(assert (=> b!343982 m!345985))

(declare-fun m!345987 () Bool)

(assert (=> mapNonEmpty!12420 m!345987))

(declare-fun m!345989 () Bool)

(assert (=> b!343983 m!345989))

(declare-fun m!345991 () Bool)

(assert (=> start!34432 m!345991))

(declare-fun m!345993 () Bool)

(assert (=> start!34432 m!345993))

(declare-fun m!345995 () Bool)

(assert (=> start!34432 m!345995))

(declare-fun m!345997 () Bool)

(assert (=> b!343980 m!345997))

(assert (=> b!343980 m!345997))

(declare-fun m!345999 () Bool)

(assert (=> b!343980 m!345999))

(check-sat (not b!343976) (not start!34432) (not b_next!7369) (not b!343983) (not mapNonEmpty!12420) b_and!14591 tp_is_empty!7321 (not b!343980) (not b!343984) (not b!343982))
(check-sat b_and!14591 (not b_next!7369))
