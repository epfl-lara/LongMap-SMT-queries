; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39500 () Bool)

(assert start!39500)

(declare-fun b_free!9781 () Bool)

(declare-fun b_next!9781 () Bool)

(assert (=> start!39500 (= b_free!9781 (not b_next!9781))))

(declare-fun tp!34872 () Bool)

(declare-fun b_and!17451 () Bool)

(assert (=> start!39500 (= tp!34872 b_and!17451)))

(declare-fun mapNonEmpty!18021 () Bool)

(declare-fun mapRes!18021 () Bool)

(declare-fun tp!34871 () Bool)

(declare-fun e!251256 () Bool)

(assert (=> mapNonEmpty!18021 (= mapRes!18021 (and tp!34871 e!251256))))

(declare-fun mapKey!18021 () (_ BitVec 32))

(declare-datatypes ((V!15683 0))(
  ( (V!15684 (val!5511 Int)) )
))
(declare-datatypes ((ValueCell!5123 0))(
  ( (ValueCellFull!5123 (v!7759 V!15683)) (EmptyCell!5123) )
))
(declare-fun mapRest!18021 () (Array (_ BitVec 32) ValueCell!5123))

(declare-datatypes ((array!25720 0))(
  ( (array!25721 (arr!12309 (Array (_ BitVec 32) ValueCell!5123)) (size!12661 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25720)

(declare-fun mapValue!18021 () ValueCell!5123)

(assert (=> mapNonEmpty!18021 (= (arr!12309 _values!549) (store mapRest!18021 mapKey!18021 mapValue!18021))))

(declare-fun b!422270 () Bool)

(declare-fun e!251258 () Bool)

(declare-fun e!251259 () Bool)

(assert (=> b!422270 (= e!251258 e!251259)))

(declare-fun res!246584 () Bool)

(assert (=> b!422270 (=> (not res!246584) (not e!251259))))

(declare-datatypes ((array!25722 0))(
  ( (array!25723 (arr!12310 (Array (_ BitVec 32) (_ BitVec 64))) (size!12662 (_ BitVec 32))) )
))
(declare-fun lt!193965 () array!25722)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25722 (_ BitVec 32)) Bool)

(assert (=> b!422270 (= res!246584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193965 mask!1025))))

(declare-fun _keys!709 () array!25722)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!422270 (= lt!193965 (array!25723 (store (arr!12310 _keys!709) i!563 k0!794) (size!12662 _keys!709)))))

(declare-fun b!422271 () Bool)

(declare-fun e!251260 () Bool)

(declare-fun tp_is_empty!10933 () Bool)

(assert (=> b!422271 (= e!251260 tp_is_empty!10933)))

(declare-fun b!422272 () Bool)

(declare-fun res!246586 () Bool)

(assert (=> b!422272 (=> (not res!246586) (not e!251258))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!422272 (= res!246586 (validMask!0 mask!1025))))

(declare-fun b!422273 () Bool)

(declare-fun res!246579 () Bool)

(assert (=> b!422273 (=> (not res!246579) (not e!251258))))

(declare-datatypes ((List!7121 0))(
  ( (Nil!7118) (Cons!7117 (h!7973 (_ BitVec 64)) (t!12557 List!7121)) )
))
(declare-fun arrayNoDuplicates!0 (array!25722 (_ BitVec 32) List!7121) Bool)

(assert (=> b!422273 (= res!246579 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7118))))

(declare-fun b!422274 () Bool)

(declare-fun e!251255 () Bool)

(assert (=> b!422274 (= e!251255 (and e!251260 mapRes!18021))))

(declare-fun condMapEmpty!18021 () Bool)

(declare-fun mapDefault!18021 () ValueCell!5123)

(assert (=> b!422274 (= condMapEmpty!18021 (= (arr!12309 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5123)) mapDefault!18021)))))

(declare-fun res!246581 () Bool)

(assert (=> start!39500 (=> (not res!246581) (not e!251258))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39500 (= res!246581 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12662 _keys!709))))))

(assert (=> start!39500 e!251258))

(assert (=> start!39500 tp_is_empty!10933))

(assert (=> start!39500 tp!34872))

(assert (=> start!39500 true))

(declare-fun array_inv!9046 (array!25720) Bool)

(assert (=> start!39500 (and (array_inv!9046 _values!549) e!251255)))

(declare-fun array_inv!9047 (array!25722) Bool)

(assert (=> start!39500 (array_inv!9047 _keys!709)))

(declare-fun b!422275 () Bool)

(declare-fun res!246583 () Bool)

(assert (=> b!422275 (=> (not res!246583) (not e!251258))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!422275 (= res!246583 (and (= (size!12661 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12662 _keys!709) (size!12661 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!422276 () Bool)

(declare-fun res!246585 () Bool)

(assert (=> b!422276 (=> (not res!246585) (not e!251258))))

(assert (=> b!422276 (= res!246585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!422277 () Bool)

(assert (=> b!422277 (= e!251256 tp_is_empty!10933)))

(declare-fun b!422278 () Bool)

(assert (=> b!422278 (= e!251259 false)))

(declare-datatypes ((tuple2!7120 0))(
  ( (tuple2!7121 (_1!3571 (_ BitVec 64)) (_2!3571 V!15683)) )
))
(declare-datatypes ((List!7122 0))(
  ( (Nil!7119) (Cons!7118 (h!7974 tuple2!7120) (t!12558 List!7122)) )
))
(declare-datatypes ((ListLongMap!6035 0))(
  ( (ListLongMap!6036 (toList!3033 List!7122)) )
))
(declare-fun lt!193964 () ListLongMap!6035)

(declare-fun minValue!515 () V!15683)

(declare-fun zeroValue!515 () V!15683)

(declare-fun v!412 () V!15683)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1279 (array!25722 array!25720 (_ BitVec 32) (_ BitVec 32) V!15683 V!15683 (_ BitVec 32) Int) ListLongMap!6035)

(assert (=> b!422278 (= lt!193964 (getCurrentListMapNoExtraKeys!1279 lt!193965 (array!25721 (store (arr!12309 _values!549) i!563 (ValueCellFull!5123 v!412)) (size!12661 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!193963 () ListLongMap!6035)

(assert (=> b!422278 (= lt!193963 (getCurrentListMapNoExtraKeys!1279 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!422279 () Bool)

(declare-fun res!246578 () Bool)

(assert (=> b!422279 (=> (not res!246578) (not e!251258))))

(assert (=> b!422279 (= res!246578 (or (= (select (arr!12310 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12310 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!422280 () Bool)

(declare-fun res!246577 () Bool)

(assert (=> b!422280 (=> (not res!246577) (not e!251259))))

(assert (=> b!422280 (= res!246577 (arrayNoDuplicates!0 lt!193965 #b00000000000000000000000000000000 Nil!7118))))

(declare-fun b!422281 () Bool)

(declare-fun res!246587 () Bool)

(assert (=> b!422281 (=> (not res!246587) (not e!251258))))

(declare-fun arrayContainsKey!0 (array!25722 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!422281 (= res!246587 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!422282 () Bool)

(declare-fun res!246588 () Bool)

(assert (=> b!422282 (=> (not res!246588) (not e!251259))))

(assert (=> b!422282 (= res!246588 (bvsle from!863 i!563))))

(declare-fun b!422283 () Bool)

(declare-fun res!246582 () Bool)

(assert (=> b!422283 (=> (not res!246582) (not e!251258))))

(assert (=> b!422283 (= res!246582 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12662 _keys!709))))))

(declare-fun b!422284 () Bool)

(declare-fun res!246580 () Bool)

(assert (=> b!422284 (=> (not res!246580) (not e!251258))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!422284 (= res!246580 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!18021 () Bool)

(assert (=> mapIsEmpty!18021 mapRes!18021))

(assert (= (and start!39500 res!246581) b!422272))

(assert (= (and b!422272 res!246586) b!422275))

(assert (= (and b!422275 res!246583) b!422276))

(assert (= (and b!422276 res!246585) b!422273))

(assert (= (and b!422273 res!246579) b!422283))

(assert (= (and b!422283 res!246582) b!422284))

(assert (= (and b!422284 res!246580) b!422279))

(assert (= (and b!422279 res!246578) b!422281))

(assert (= (and b!422281 res!246587) b!422270))

(assert (= (and b!422270 res!246584) b!422280))

(assert (= (and b!422280 res!246577) b!422282))

(assert (= (and b!422282 res!246588) b!422278))

(assert (= (and b!422274 condMapEmpty!18021) mapIsEmpty!18021))

(assert (= (and b!422274 (not condMapEmpty!18021)) mapNonEmpty!18021))

(get-info :version)

(assert (= (and mapNonEmpty!18021 ((_ is ValueCellFull!5123) mapValue!18021)) b!422277))

(assert (= (and b!422274 ((_ is ValueCellFull!5123) mapDefault!18021)) b!422271))

(assert (= start!39500 b!422274))

(declare-fun m!412391 () Bool)

(assert (=> b!422270 m!412391))

(declare-fun m!412393 () Bool)

(assert (=> b!422270 m!412393))

(declare-fun m!412395 () Bool)

(assert (=> start!39500 m!412395))

(declare-fun m!412397 () Bool)

(assert (=> start!39500 m!412397))

(declare-fun m!412399 () Bool)

(assert (=> b!422279 m!412399))

(declare-fun m!412401 () Bool)

(assert (=> b!422276 m!412401))

(declare-fun m!412403 () Bool)

(assert (=> b!422272 m!412403))

(declare-fun m!412405 () Bool)

(assert (=> mapNonEmpty!18021 m!412405))

(declare-fun m!412407 () Bool)

(assert (=> b!422273 m!412407))

(declare-fun m!412409 () Bool)

(assert (=> b!422278 m!412409))

(declare-fun m!412411 () Bool)

(assert (=> b!422278 m!412411))

(declare-fun m!412413 () Bool)

(assert (=> b!422278 m!412413))

(declare-fun m!412415 () Bool)

(assert (=> b!422281 m!412415))

(declare-fun m!412417 () Bool)

(assert (=> b!422284 m!412417))

(declare-fun m!412419 () Bool)

(assert (=> b!422280 m!412419))

(check-sat (not b!422272) (not b!422280) (not b!422270) tp_is_empty!10933 (not b_next!9781) (not b!422284) (not b!422278) (not b!422273) (not start!39500) (not b!422281) b_and!17451 (not mapNonEmpty!18021) (not b!422276))
(check-sat b_and!17451 (not b_next!9781))
