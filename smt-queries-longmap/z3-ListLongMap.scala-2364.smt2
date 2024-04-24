; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37632 () Bool)

(assert start!37632)

(declare-fun b!385391 () Bool)

(declare-fun e!233902 () Bool)

(assert (=> b!385391 (= e!233902 false)))

(declare-fun lt!181633 () Bool)

(declare-datatypes ((array!22732 0))(
  ( (array!22733 (arr!10834 (Array (_ BitVec 32) (_ BitVec 64))) (size!11186 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22732)

(declare-datatypes ((List!6112 0))(
  ( (Nil!6109) (Cons!6108 (h!6964 (_ BitVec 64)) (t!11254 List!6112)) )
))
(declare-fun arrayNoDuplicates!0 (array!22732 (_ BitVec 32) List!6112) Bool)

(assert (=> b!385391 (= lt!181633 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6109))))

(declare-fun mapIsEmpty!15696 () Bool)

(declare-fun mapRes!15696 () Bool)

(assert (=> mapIsEmpty!15696 mapRes!15696))

(declare-fun b!385392 () Bool)

(declare-fun e!233901 () Bool)

(declare-fun tp_is_empty!9421 () Bool)

(assert (=> b!385392 (= e!233901 tp_is_empty!9421)))

(declare-fun b!385393 () Bool)

(declare-fun e!233903 () Bool)

(assert (=> b!385393 (= e!233903 tp_is_empty!9421)))

(declare-fun res!219864 () Bool)

(assert (=> start!37632 (=> (not res!219864) (not e!233902))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37632 (= res!219864 (validMask!0 mask!970))))

(assert (=> start!37632 e!233902))

(assert (=> start!37632 true))

(declare-datatypes ((V!13667 0))(
  ( (V!13668 (val!4755 Int)) )
))
(declare-datatypes ((ValueCell!4367 0))(
  ( (ValueCellFull!4367 (v!6953 V!13667)) (EmptyCell!4367) )
))
(declare-datatypes ((array!22734 0))(
  ( (array!22735 (arr!10835 (Array (_ BitVec 32) ValueCell!4367)) (size!11187 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22734)

(declare-fun e!233900 () Bool)

(declare-fun array_inv!8012 (array!22734) Bool)

(assert (=> start!37632 (and (array_inv!8012 _values!506) e!233900)))

(declare-fun array_inv!8013 (array!22732) Bool)

(assert (=> start!37632 (array_inv!8013 _keys!658)))

(declare-fun b!385394 () Bool)

(declare-fun res!219866 () Bool)

(assert (=> b!385394 (=> (not res!219866) (not e!233902))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22732 (_ BitVec 32)) Bool)

(assert (=> b!385394 (= res!219866 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!385395 () Bool)

(assert (=> b!385395 (= e!233900 (and e!233901 mapRes!15696))))

(declare-fun condMapEmpty!15696 () Bool)

(declare-fun mapDefault!15696 () ValueCell!4367)

(assert (=> b!385395 (= condMapEmpty!15696 (= (arr!10835 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4367)) mapDefault!15696)))))

(declare-fun b!385396 () Bool)

(declare-fun res!219865 () Bool)

(assert (=> b!385396 (=> (not res!219865) (not e!233902))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!385396 (= res!219865 (and (= (size!11187 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11186 _keys!658) (size!11187 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!15696 () Bool)

(declare-fun tp!31023 () Bool)

(assert (=> mapNonEmpty!15696 (= mapRes!15696 (and tp!31023 e!233903))))

(declare-fun mapValue!15696 () ValueCell!4367)

(declare-fun mapKey!15696 () (_ BitVec 32))

(declare-fun mapRest!15696 () (Array (_ BitVec 32) ValueCell!4367))

(assert (=> mapNonEmpty!15696 (= (arr!10835 _values!506) (store mapRest!15696 mapKey!15696 mapValue!15696))))

(assert (= (and start!37632 res!219864) b!385396))

(assert (= (and b!385396 res!219865) b!385394))

(assert (= (and b!385394 res!219866) b!385391))

(assert (= (and b!385395 condMapEmpty!15696) mapIsEmpty!15696))

(assert (= (and b!385395 (not condMapEmpty!15696)) mapNonEmpty!15696))

(get-info :version)

(assert (= (and mapNonEmpty!15696 ((_ is ValueCellFull!4367) mapValue!15696)) b!385393))

(assert (= (and b!385395 ((_ is ValueCellFull!4367) mapDefault!15696)) b!385392))

(assert (= start!37632 b!385395))

(declare-fun m!382301 () Bool)

(assert (=> b!385391 m!382301))

(declare-fun m!382303 () Bool)

(assert (=> start!37632 m!382303))

(declare-fun m!382305 () Bool)

(assert (=> start!37632 m!382305))

(declare-fun m!382307 () Bool)

(assert (=> start!37632 m!382307))

(declare-fun m!382309 () Bool)

(assert (=> b!385394 m!382309))

(declare-fun m!382311 () Bool)

(assert (=> mapNonEmpty!15696 m!382311))

(check-sat tp_is_empty!9421 (not start!37632) (not mapNonEmpty!15696) (not b!385391) (not b!385394))
(check-sat)
