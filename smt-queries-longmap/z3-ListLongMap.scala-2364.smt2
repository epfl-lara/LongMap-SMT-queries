; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37632 () Bool)

(assert start!37632)

(declare-fun res!219738 () Bool)

(declare-fun e!233762 () Bool)

(assert (=> start!37632 (=> (not res!219738) (not e!233762))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37632 (= res!219738 (validMask!0 mask!970))))

(assert (=> start!37632 e!233762))

(assert (=> start!37632 true))

(declare-datatypes ((V!13667 0))(
  ( (V!13668 (val!4755 Int)) )
))
(declare-datatypes ((ValueCell!4367 0))(
  ( (ValueCellFull!4367 (v!6946 V!13667)) (EmptyCell!4367) )
))
(declare-datatypes ((array!22729 0))(
  ( (array!22730 (arr!10833 (Array (_ BitVec 32) ValueCell!4367)) (size!11186 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22729)

(declare-fun e!233758 () Bool)

(declare-fun array_inv!7974 (array!22729) Bool)

(assert (=> start!37632 (and (array_inv!7974 _values!506) e!233758)))

(declare-datatypes ((array!22731 0))(
  ( (array!22732 (arr!10834 (Array (_ BitVec 32) (_ BitVec 64))) (size!11187 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22731)

(declare-fun array_inv!7975 (array!22731) Bool)

(assert (=> start!37632 (array_inv!7975 _keys!658)))

(declare-fun b!385169 () Bool)

(declare-fun e!233760 () Bool)

(declare-fun tp_is_empty!9421 () Bool)

(assert (=> b!385169 (= e!233760 tp_is_empty!9421)))

(declare-fun b!385170 () Bool)

(declare-fun res!219739 () Bool)

(assert (=> b!385170 (=> (not res!219739) (not e!233762))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22731 (_ BitVec 32)) Bool)

(assert (=> b!385170 (= res!219739 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!385171 () Bool)

(declare-fun e!233761 () Bool)

(assert (=> b!385171 (= e!233761 tp_is_empty!9421)))

(declare-fun b!385172 () Bool)

(declare-fun mapRes!15696 () Bool)

(assert (=> b!385172 (= e!233758 (and e!233761 mapRes!15696))))

(declare-fun condMapEmpty!15696 () Bool)

(declare-fun mapDefault!15696 () ValueCell!4367)

(assert (=> b!385172 (= condMapEmpty!15696 (= (arr!10833 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4367)) mapDefault!15696)))))

(declare-fun mapNonEmpty!15696 () Bool)

(declare-fun tp!31023 () Bool)

(assert (=> mapNonEmpty!15696 (= mapRes!15696 (and tp!31023 e!233760))))

(declare-fun mapKey!15696 () (_ BitVec 32))

(declare-fun mapValue!15696 () ValueCell!4367)

(declare-fun mapRest!15696 () (Array (_ BitVec 32) ValueCell!4367))

(assert (=> mapNonEmpty!15696 (= (arr!10833 _values!506) (store mapRest!15696 mapKey!15696 mapValue!15696))))

(declare-fun b!385173 () Bool)

(declare-fun res!219740 () Bool)

(assert (=> b!385173 (=> (not res!219740) (not e!233762))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!385173 (= res!219740 (and (= (size!11186 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11187 _keys!658) (size!11186 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!15696 () Bool)

(assert (=> mapIsEmpty!15696 mapRes!15696))

(declare-fun b!385174 () Bool)

(assert (=> b!385174 (= e!233762 false)))

(declare-fun lt!181380 () Bool)

(declare-datatypes ((List!6212 0))(
  ( (Nil!6209) (Cons!6208 (h!7064 (_ BitVec 64)) (t!11353 List!6212)) )
))
(declare-fun arrayNoDuplicates!0 (array!22731 (_ BitVec 32) List!6212) Bool)

(assert (=> b!385174 (= lt!181380 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6209))))

(assert (= (and start!37632 res!219738) b!385173))

(assert (= (and b!385173 res!219740) b!385170))

(assert (= (and b!385170 res!219739) b!385174))

(assert (= (and b!385172 condMapEmpty!15696) mapIsEmpty!15696))

(assert (= (and b!385172 (not condMapEmpty!15696)) mapNonEmpty!15696))

(get-info :version)

(assert (= (and mapNonEmpty!15696 ((_ is ValueCellFull!4367) mapValue!15696)) b!385169))

(assert (= (and b!385172 ((_ is ValueCellFull!4367) mapDefault!15696)) b!385171))

(assert (= start!37632 b!385172))

(declare-fun m!381347 () Bool)

(assert (=> start!37632 m!381347))

(declare-fun m!381349 () Bool)

(assert (=> start!37632 m!381349))

(declare-fun m!381351 () Bool)

(assert (=> start!37632 m!381351))

(declare-fun m!381353 () Bool)

(assert (=> b!385170 m!381353))

(declare-fun m!381355 () Bool)

(assert (=> mapNonEmpty!15696 m!381355))

(declare-fun m!381357 () Bool)

(assert (=> b!385174 m!381357))

(check-sat (not b!385170) (not start!37632) (not mapNonEmpty!15696) (not b!385174) tp_is_empty!9421)
(check-sat)
