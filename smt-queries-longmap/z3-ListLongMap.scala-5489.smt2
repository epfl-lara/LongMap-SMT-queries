; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72700 () Bool)

(assert start!72700)

(declare-fun mapIsEmpty!25253 () Bool)

(declare-fun mapRes!25253 () Bool)

(assert (=> mapIsEmpty!25253 mapRes!25253))

(declare-fun b!843765 () Bool)

(declare-fun res!573372 () Bool)

(declare-fun e!470856 () Bool)

(assert (=> b!843765 (=> (not res!573372) (not e!470856))))

(declare-datatypes ((array!47777 0))(
  ( (array!47778 (arr!22920 (Array (_ BitVec 32) (_ BitVec 64))) (size!23362 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47777)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47777 (_ BitVec 32)) Bool)

(assert (=> b!843765 (= res!573372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!843766 () Bool)

(assert (=> b!843766 (= e!470856 false)))

(declare-fun lt!380984 () Bool)

(declare-datatypes ((List!16276 0))(
  ( (Nil!16273) (Cons!16272 (h!17403 (_ BitVec 64)) (t!22638 List!16276)) )
))
(declare-fun arrayNoDuplicates!0 (array!47777 (_ BitVec 32) List!16276) Bool)

(assert (=> b!843766 (= lt!380984 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16273))))

(declare-fun res!573373 () Bool)

(assert (=> start!72700 (=> (not res!573373) (not e!470856))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72700 (= res!573373 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23362 _keys!868))))))

(assert (=> start!72700 e!470856))

(assert (=> start!72700 true))

(declare-fun array_inv!18302 (array!47777) Bool)

(assert (=> start!72700 (array_inv!18302 _keys!868)))

(declare-datatypes ((V!26073 0))(
  ( (V!26074 (val!7932 Int)) )
))
(declare-datatypes ((ValueCell!7445 0))(
  ( (ValueCellFull!7445 (v!10351 V!26073)) (EmptyCell!7445) )
))
(declare-datatypes ((array!47779 0))(
  ( (array!47780 (arr!22921 (Array (_ BitVec 32) ValueCell!7445)) (size!23363 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47779)

(declare-fun e!470857 () Bool)

(declare-fun array_inv!18303 (array!47779) Bool)

(assert (=> start!72700 (and (array_inv!18303 _values!688) e!470857)))

(declare-fun b!843767 () Bool)

(declare-fun res!573375 () Bool)

(assert (=> b!843767 (=> (not res!573375) (not e!470856))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!843767 (= res!573375 (and (= (size!23363 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23362 _keys!868) (size!23363 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!843768 () Bool)

(declare-fun res!573374 () Bool)

(assert (=> b!843768 (=> (not res!573374) (not e!470856))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843768 (= res!573374 (validMask!0 mask!1196))))

(declare-fun b!843769 () Bool)

(declare-fun e!470859 () Bool)

(declare-fun tp_is_empty!15769 () Bool)

(assert (=> b!843769 (= e!470859 tp_is_empty!15769)))

(declare-fun b!843770 () Bool)

(declare-fun e!470858 () Bool)

(assert (=> b!843770 (= e!470857 (and e!470858 mapRes!25253))))

(declare-fun condMapEmpty!25253 () Bool)

(declare-fun mapDefault!25253 () ValueCell!7445)

(assert (=> b!843770 (= condMapEmpty!25253 (= (arr!22921 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7445)) mapDefault!25253)))))

(declare-fun mapNonEmpty!25253 () Bool)

(declare-fun tp!48572 () Bool)

(assert (=> mapNonEmpty!25253 (= mapRes!25253 (and tp!48572 e!470859))))

(declare-fun mapValue!25253 () ValueCell!7445)

(declare-fun mapKey!25253 () (_ BitVec 32))

(declare-fun mapRest!25253 () (Array (_ BitVec 32) ValueCell!7445))

(assert (=> mapNonEmpty!25253 (= (arr!22921 _values!688) (store mapRest!25253 mapKey!25253 mapValue!25253))))

(declare-fun b!843771 () Bool)

(assert (=> b!843771 (= e!470858 tp_is_empty!15769)))

(assert (= (and start!72700 res!573373) b!843768))

(assert (= (and b!843768 res!573374) b!843767))

(assert (= (and b!843767 res!573375) b!843765))

(assert (= (and b!843765 res!573372) b!843766))

(assert (= (and b!843770 condMapEmpty!25253) mapIsEmpty!25253))

(assert (= (and b!843770 (not condMapEmpty!25253)) mapNonEmpty!25253))

(get-info :version)

(assert (= (and mapNonEmpty!25253 ((_ is ValueCellFull!7445) mapValue!25253)) b!843769))

(assert (= (and b!843770 ((_ is ValueCellFull!7445) mapDefault!25253)) b!843771))

(assert (= start!72700 b!843770))

(declare-fun m!785687 () Bool)

(assert (=> b!843765 m!785687))

(declare-fun m!785689 () Bool)

(assert (=> mapNonEmpty!25253 m!785689))

(declare-fun m!785691 () Bool)

(assert (=> b!843768 m!785691))

(declare-fun m!785693 () Bool)

(assert (=> b!843766 m!785693))

(declare-fun m!785695 () Bool)

(assert (=> start!72700 m!785695))

(declare-fun m!785697 () Bool)

(assert (=> start!72700 m!785697))

(check-sat (not b!843765) (not start!72700) (not b!843768) (not mapNonEmpty!25253) tp_is_empty!15769 (not b!843766))
(check-sat)
