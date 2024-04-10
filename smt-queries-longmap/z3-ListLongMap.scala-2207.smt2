; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36658 () Bool)

(assert start!36658)

(declare-fun res!204552 () Bool)

(declare-fun e!224038 () Bool)

(assert (=> start!36658 (=> (not res!204552) (not e!224038))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36658 (= res!204552 (validMask!0 mask!970))))

(assert (=> start!36658 e!224038))

(assert (=> start!36658 true))

(declare-datatypes ((V!12413 0))(
  ( (V!12414 (val!4285 Int)) )
))
(declare-datatypes ((ValueCell!3897 0))(
  ( (ValueCellFull!3897 (v!6481 V!12413)) (EmptyCell!3897) )
))
(declare-datatypes ((array!20917 0))(
  ( (array!20918 (arr!9930 (Array (_ BitVec 32) ValueCell!3897)) (size!10282 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20917)

(declare-fun e!224037 () Bool)

(declare-fun array_inv!7350 (array!20917) Bool)

(assert (=> start!36658 (and (array_inv!7350 _values!506) e!224037)))

(declare-datatypes ((array!20919 0))(
  ( (array!20920 (arr!9931 (Array (_ BitVec 32) (_ BitVec 64))) (size!10283 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20919)

(declare-fun array_inv!7351 (array!20919) Bool)

(assert (=> start!36658 (array_inv!7351 _keys!658)))

(declare-fun b!365827 () Bool)

(declare-fun res!204550 () Bool)

(assert (=> b!365827 (=> (not res!204550) (not e!224038))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!365827 (= res!204550 (and (= (size!10282 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10283 _keys!658) (size!10282 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!14277 () Bool)

(declare-fun mapRes!14277 () Bool)

(assert (=> mapIsEmpty!14277 mapRes!14277))

(declare-fun b!365828 () Bool)

(declare-fun e!224039 () Bool)

(declare-fun tp_is_empty!8481 () Bool)

(assert (=> b!365828 (= e!224039 tp_is_empty!8481)))

(declare-fun b!365829 () Bool)

(assert (=> b!365829 (= e!224038 false)))

(declare-fun lt!169211 () Bool)

(declare-datatypes ((List!5535 0))(
  ( (Nil!5532) (Cons!5531 (h!6387 (_ BitVec 64)) (t!10685 List!5535)) )
))
(declare-fun arrayNoDuplicates!0 (array!20919 (_ BitVec 32) List!5535) Bool)

(assert (=> b!365829 (= lt!169211 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5532))))

(declare-fun mapNonEmpty!14277 () Bool)

(declare-fun tp!28353 () Bool)

(declare-fun e!224036 () Bool)

(assert (=> mapNonEmpty!14277 (= mapRes!14277 (and tp!28353 e!224036))))

(declare-fun mapRest!14277 () (Array (_ BitVec 32) ValueCell!3897))

(declare-fun mapValue!14277 () ValueCell!3897)

(declare-fun mapKey!14277 () (_ BitVec 32))

(assert (=> mapNonEmpty!14277 (= (arr!9930 _values!506) (store mapRest!14277 mapKey!14277 mapValue!14277))))

(declare-fun b!365830 () Bool)

(assert (=> b!365830 (= e!224036 tp_is_empty!8481)))

(declare-fun b!365831 () Bool)

(assert (=> b!365831 (= e!224037 (and e!224039 mapRes!14277))))

(declare-fun condMapEmpty!14277 () Bool)

(declare-fun mapDefault!14277 () ValueCell!3897)

(assert (=> b!365831 (= condMapEmpty!14277 (= (arr!9930 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3897)) mapDefault!14277)))))

(declare-fun b!365832 () Bool)

(declare-fun res!204551 () Bool)

(assert (=> b!365832 (=> (not res!204551) (not e!224038))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20919 (_ BitVec 32)) Bool)

(assert (=> b!365832 (= res!204551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(assert (= (and start!36658 res!204552) b!365827))

(assert (= (and b!365827 res!204550) b!365832))

(assert (= (and b!365832 res!204551) b!365829))

(assert (= (and b!365831 condMapEmpty!14277) mapIsEmpty!14277))

(assert (= (and b!365831 (not condMapEmpty!14277)) mapNonEmpty!14277))

(get-info :version)

(assert (= (and mapNonEmpty!14277 ((_ is ValueCellFull!3897) mapValue!14277)) b!365830))

(assert (= (and b!365831 ((_ is ValueCellFull!3897) mapDefault!14277)) b!365828))

(assert (= start!36658 b!365831))

(declare-fun m!363393 () Bool)

(assert (=> start!36658 m!363393))

(declare-fun m!363395 () Bool)

(assert (=> start!36658 m!363395))

(declare-fun m!363397 () Bool)

(assert (=> start!36658 m!363397))

(declare-fun m!363399 () Bool)

(assert (=> b!365829 m!363399))

(declare-fun m!363401 () Bool)

(assert (=> mapNonEmpty!14277 m!363401))

(declare-fun m!363403 () Bool)

(assert (=> b!365832 m!363403))

(check-sat (not start!36658) (not mapNonEmpty!14277) tp_is_empty!8481 (not b!365829) (not b!365832))
(check-sat)
