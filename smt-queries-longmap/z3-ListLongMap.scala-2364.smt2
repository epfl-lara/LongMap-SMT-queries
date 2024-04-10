; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37648 () Bool)

(assert start!37648)

(declare-fun b!385458 () Bool)

(declare-fun e!233947 () Bool)

(declare-fun e!233948 () Bool)

(declare-fun mapRes!15699 () Bool)

(assert (=> b!385458 (= e!233947 (and e!233948 mapRes!15699))))

(declare-fun condMapEmpty!15699 () Bool)

(declare-datatypes ((V!13669 0))(
  ( (V!13670 (val!4756 Int)) )
))
(declare-datatypes ((ValueCell!4368 0))(
  ( (ValueCellFull!4368 (v!6953 V!13669)) (EmptyCell!4368) )
))
(declare-datatypes ((array!22747 0))(
  ( (array!22748 (arr!10842 (Array (_ BitVec 32) ValueCell!4368)) (size!11194 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22747)

(declare-fun mapDefault!15699 () ValueCell!4368)

(assert (=> b!385458 (= condMapEmpty!15699 (= (arr!10842 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4368)) mapDefault!15699)))))

(declare-fun b!385459 () Bool)

(declare-fun res!219876 () Bool)

(declare-fun e!233951 () Bool)

(assert (=> b!385459 (=> (not res!219876) (not e!233951))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((array!22749 0))(
  ( (array!22750 (arr!10843 (Array (_ BitVec 32) (_ BitVec 64))) (size!11195 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22749)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!385459 (= res!219876 (and (= (size!11194 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11195 _keys!658) (size!11194 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!385460 () Bool)

(declare-fun tp_is_empty!9423 () Bool)

(assert (=> b!385460 (= e!233948 tp_is_empty!9423)))

(declare-fun b!385461 () Bool)

(declare-fun res!219877 () Bool)

(assert (=> b!385461 (=> (not res!219877) (not e!233951))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22749 (_ BitVec 32)) Bool)

(assert (=> b!385461 (= res!219877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!15699 () Bool)

(assert (=> mapIsEmpty!15699 mapRes!15699))

(declare-fun b!385462 () Bool)

(declare-fun e!233949 () Bool)

(assert (=> b!385462 (= e!233949 tp_is_empty!9423)))

(declare-fun res!219878 () Bool)

(assert (=> start!37648 (=> (not res!219878) (not e!233951))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37648 (= res!219878 (validMask!0 mask!970))))

(assert (=> start!37648 e!233951))

(assert (=> start!37648 true))

(declare-fun array_inv!7980 (array!22747) Bool)

(assert (=> start!37648 (and (array_inv!7980 _values!506) e!233947)))

(declare-fun array_inv!7981 (array!22749) Bool)

(assert (=> start!37648 (array_inv!7981 _keys!658)))

(declare-fun b!385463 () Bool)

(assert (=> b!385463 (= e!233951 false)))

(declare-fun lt!181617 () Bool)

(declare-datatypes ((List!6243 0))(
  ( (Nil!6240) (Cons!6239 (h!7095 (_ BitVec 64)) (t!11393 List!6243)) )
))
(declare-fun arrayNoDuplicates!0 (array!22749 (_ BitVec 32) List!6243) Bool)

(assert (=> b!385463 (= lt!181617 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6240))))

(declare-fun mapNonEmpty!15699 () Bool)

(declare-fun tp!31026 () Bool)

(assert (=> mapNonEmpty!15699 (= mapRes!15699 (and tp!31026 e!233949))))

(declare-fun mapRest!15699 () (Array (_ BitVec 32) ValueCell!4368))

(declare-fun mapKey!15699 () (_ BitVec 32))

(declare-fun mapValue!15699 () ValueCell!4368)

(assert (=> mapNonEmpty!15699 (= (arr!10842 _values!506) (store mapRest!15699 mapKey!15699 mapValue!15699))))

(assert (= (and start!37648 res!219878) b!385459))

(assert (= (and b!385459 res!219876) b!385461))

(assert (= (and b!385461 res!219877) b!385463))

(assert (= (and b!385458 condMapEmpty!15699) mapIsEmpty!15699))

(assert (= (and b!385458 (not condMapEmpty!15699)) mapNonEmpty!15699))

(get-info :version)

(assert (= (and mapNonEmpty!15699 ((_ is ValueCellFull!4368) mapValue!15699)) b!385462))

(assert (= (and b!385458 ((_ is ValueCellFull!4368) mapDefault!15699)) b!385460))

(assert (= start!37648 b!385458))

(declare-fun m!382083 () Bool)

(assert (=> b!385461 m!382083))

(declare-fun m!382085 () Bool)

(assert (=> start!37648 m!382085))

(declare-fun m!382087 () Bool)

(assert (=> start!37648 m!382087))

(declare-fun m!382089 () Bool)

(assert (=> start!37648 m!382089))

(declare-fun m!382091 () Bool)

(assert (=> b!385463 m!382091))

(declare-fun m!382093 () Bool)

(assert (=> mapNonEmpty!15699 m!382093))

(check-sat (not mapNonEmpty!15699) tp_is_empty!9423 (not start!37648) (not b!385461) (not b!385463))
(check-sat)
