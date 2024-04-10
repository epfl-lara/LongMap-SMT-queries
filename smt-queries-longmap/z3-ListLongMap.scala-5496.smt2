; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72762 () Bool)

(assert start!72762)

(declare-fun b!844466 () Bool)

(declare-fun e!471336 () Bool)

(declare-fun tp_is_empty!15813 () Bool)

(assert (=> b!844466 (= e!471336 tp_is_empty!15813)))

(declare-fun res!573747 () Bool)

(declare-fun e!471337 () Bool)

(assert (=> start!72762 (=> (not res!573747) (not e!471337))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47858 0))(
  ( (array!47859 (arr!22960 (Array (_ BitVec 32) (_ BitVec 64))) (size!23400 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47858)

(assert (=> start!72762 (= res!573747 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23400 _keys!868))))))

(assert (=> start!72762 e!471337))

(assert (=> start!72762 true))

(declare-fun array_inv!18258 (array!47858) Bool)

(assert (=> start!72762 (array_inv!18258 _keys!868)))

(declare-datatypes ((V!26131 0))(
  ( (V!26132 (val!7954 Int)) )
))
(declare-datatypes ((ValueCell!7467 0))(
  ( (ValueCellFull!7467 (v!10379 V!26131)) (EmptyCell!7467) )
))
(declare-datatypes ((array!47860 0))(
  ( (array!47861 (arr!22961 (Array (_ BitVec 32) ValueCell!7467)) (size!23401 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47860)

(declare-fun e!471334 () Bool)

(declare-fun array_inv!18259 (array!47860) Bool)

(assert (=> start!72762 (and (array_inv!18259 _values!688) e!471334)))

(declare-fun b!844467 () Bool)

(declare-fun e!471333 () Bool)

(assert (=> b!844467 (= e!471333 tp_is_empty!15813)))

(declare-fun b!844468 () Bool)

(assert (=> b!844468 (= e!471337 false)))

(declare-fun lt!381286 () Bool)

(declare-datatypes ((List!16273 0))(
  ( (Nil!16270) (Cons!16269 (h!17400 (_ BitVec 64)) (t!22644 List!16273)) )
))
(declare-fun arrayNoDuplicates!0 (array!47858 (_ BitVec 32) List!16273) Bool)

(assert (=> b!844468 (= lt!381286 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16270))))

(declare-fun mapIsEmpty!25319 () Bool)

(declare-fun mapRes!25319 () Bool)

(assert (=> mapIsEmpty!25319 mapRes!25319))

(declare-fun b!844469 () Bool)

(assert (=> b!844469 (= e!471334 (and e!471336 mapRes!25319))))

(declare-fun condMapEmpty!25319 () Bool)

(declare-fun mapDefault!25319 () ValueCell!7467)

(assert (=> b!844469 (= condMapEmpty!25319 (= (arr!22961 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7467)) mapDefault!25319)))))

(declare-fun b!844470 () Bool)

(declare-fun res!573746 () Bool)

(assert (=> b!844470 (=> (not res!573746) (not e!471337))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!844470 (= res!573746 (and (= (size!23401 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23400 _keys!868) (size!23401 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!844471 () Bool)

(declare-fun res!573749 () Bool)

(assert (=> b!844471 (=> (not res!573749) (not e!471337))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47858 (_ BitVec 32)) Bool)

(assert (=> b!844471 (= res!573749 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!25319 () Bool)

(declare-fun tp!48637 () Bool)

(assert (=> mapNonEmpty!25319 (= mapRes!25319 (and tp!48637 e!471333))))

(declare-fun mapValue!25319 () ValueCell!7467)

(declare-fun mapRest!25319 () (Array (_ BitVec 32) ValueCell!7467))

(declare-fun mapKey!25319 () (_ BitVec 32))

(assert (=> mapNonEmpty!25319 (= (arr!22961 _values!688) (store mapRest!25319 mapKey!25319 mapValue!25319))))

(declare-fun b!844472 () Bool)

(declare-fun res!573748 () Bool)

(assert (=> b!844472 (=> (not res!573748) (not e!471337))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844472 (= res!573748 (validMask!0 mask!1196))))

(assert (= (and start!72762 res!573747) b!844472))

(assert (= (and b!844472 res!573748) b!844470))

(assert (= (and b!844470 res!573746) b!844471))

(assert (= (and b!844471 res!573749) b!844468))

(assert (= (and b!844469 condMapEmpty!25319) mapIsEmpty!25319))

(assert (= (and b!844469 (not condMapEmpty!25319)) mapNonEmpty!25319))

(get-info :version)

(assert (= (and mapNonEmpty!25319 ((_ is ValueCellFull!7467) mapValue!25319)) b!844467))

(assert (= (and b!844469 ((_ is ValueCellFull!7467) mapDefault!25319)) b!844466))

(assert (= start!72762 b!844469))

(declare-fun m!786705 () Bool)

(assert (=> b!844468 m!786705))

(declare-fun m!786707 () Bool)

(assert (=> mapNonEmpty!25319 m!786707))

(declare-fun m!786709 () Bool)

(assert (=> start!72762 m!786709))

(declare-fun m!786711 () Bool)

(assert (=> start!72762 m!786711))

(declare-fun m!786713 () Bool)

(assert (=> b!844472 m!786713))

(declare-fun m!786715 () Bool)

(assert (=> b!844471 m!786715))

(check-sat (not mapNonEmpty!25319) (not b!844468) (not b!844471) (not start!72762) tp_is_empty!15813 (not b!844472))
(check-sat)
