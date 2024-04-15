; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37638 () Bool)

(assert start!37638)

(declare-fun res!219765 () Bool)

(declare-fun e!233804 () Bool)

(assert (=> start!37638 (=> (not res!219765) (not e!233804))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37638 (= res!219765 (validMask!0 mask!970))))

(assert (=> start!37638 e!233804))

(assert (=> start!37638 true))

(declare-datatypes ((V!13675 0))(
  ( (V!13676 (val!4758 Int)) )
))
(declare-datatypes ((ValueCell!4370 0))(
  ( (ValueCellFull!4370 (v!6949 V!13675)) (EmptyCell!4370) )
))
(declare-datatypes ((array!22741 0))(
  ( (array!22742 (arr!10839 (Array (_ BitVec 32) ValueCell!4370)) (size!11192 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22741)

(declare-fun e!233806 () Bool)

(declare-fun array_inv!7978 (array!22741) Bool)

(assert (=> start!37638 (and (array_inv!7978 _values!506) e!233806)))

(declare-datatypes ((array!22743 0))(
  ( (array!22744 (arr!10840 (Array (_ BitVec 32) (_ BitVec 64))) (size!11193 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22743)

(declare-fun array_inv!7979 (array!22743) Bool)

(assert (=> start!37638 (array_inv!7979 _keys!658)))

(declare-fun b!385223 () Bool)

(declare-fun e!233807 () Bool)

(declare-fun mapRes!15705 () Bool)

(assert (=> b!385223 (= e!233806 (and e!233807 mapRes!15705))))

(declare-fun condMapEmpty!15705 () Bool)

(declare-fun mapDefault!15705 () ValueCell!4370)

(assert (=> b!385223 (= condMapEmpty!15705 (= (arr!10839 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4370)) mapDefault!15705)))))

(declare-fun mapIsEmpty!15705 () Bool)

(assert (=> mapIsEmpty!15705 mapRes!15705))

(declare-fun b!385224 () Bool)

(declare-fun tp_is_empty!9427 () Bool)

(assert (=> b!385224 (= e!233807 tp_is_empty!9427)))

(declare-fun mapNonEmpty!15705 () Bool)

(declare-fun tp!31032 () Bool)

(declare-fun e!233805 () Bool)

(assert (=> mapNonEmpty!15705 (= mapRes!15705 (and tp!31032 e!233805))))

(declare-fun mapValue!15705 () ValueCell!4370)

(declare-fun mapKey!15705 () (_ BitVec 32))

(declare-fun mapRest!15705 () (Array (_ BitVec 32) ValueCell!4370))

(assert (=> mapNonEmpty!15705 (= (arr!10839 _values!506) (store mapRest!15705 mapKey!15705 mapValue!15705))))

(declare-fun b!385225 () Bool)

(assert (=> b!385225 (= e!233804 false)))

(declare-fun lt!181389 () Bool)

(declare-datatypes ((List!6214 0))(
  ( (Nil!6211) (Cons!6210 (h!7066 (_ BitVec 64)) (t!11355 List!6214)) )
))
(declare-fun arrayNoDuplicates!0 (array!22743 (_ BitVec 32) List!6214) Bool)

(assert (=> b!385225 (= lt!181389 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6211))))

(declare-fun b!385226 () Bool)

(assert (=> b!385226 (= e!233805 tp_is_empty!9427)))

(declare-fun b!385227 () Bool)

(declare-fun res!219766 () Bool)

(assert (=> b!385227 (=> (not res!219766) (not e!233804))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!385227 (= res!219766 (and (= (size!11192 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11193 _keys!658) (size!11192 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!385228 () Bool)

(declare-fun res!219767 () Bool)

(assert (=> b!385228 (=> (not res!219767) (not e!233804))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22743 (_ BitVec 32)) Bool)

(assert (=> b!385228 (= res!219767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(assert (= (and start!37638 res!219765) b!385227))

(assert (= (and b!385227 res!219766) b!385228))

(assert (= (and b!385228 res!219767) b!385225))

(assert (= (and b!385223 condMapEmpty!15705) mapIsEmpty!15705))

(assert (= (and b!385223 (not condMapEmpty!15705)) mapNonEmpty!15705))

(get-info :version)

(assert (= (and mapNonEmpty!15705 ((_ is ValueCellFull!4370) mapValue!15705)) b!385226))

(assert (= (and b!385223 ((_ is ValueCellFull!4370) mapDefault!15705)) b!385224))

(assert (= start!37638 b!385223))

(declare-fun m!381383 () Bool)

(assert (=> start!37638 m!381383))

(declare-fun m!381385 () Bool)

(assert (=> start!37638 m!381385))

(declare-fun m!381387 () Bool)

(assert (=> start!37638 m!381387))

(declare-fun m!381389 () Bool)

(assert (=> mapNonEmpty!15705 m!381389))

(declare-fun m!381391 () Bool)

(assert (=> b!385225 m!381391))

(declare-fun m!381393 () Bool)

(assert (=> b!385228 m!381393))

(check-sat tp_is_empty!9427 (not start!37638) (not mapNonEmpty!15705) (not b!385225) (not b!385228))
(check-sat)
