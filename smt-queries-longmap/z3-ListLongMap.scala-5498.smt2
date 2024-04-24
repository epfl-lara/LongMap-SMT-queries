; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72940 () Bool)

(assert start!72940)

(declare-fun b!845474 () Bool)

(declare-fun res!574153 () Bool)

(declare-fun e!471990 () Bool)

(assert (=> b!845474 (=> (not res!574153) (not e!471990))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845474 (= res!574153 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!25334 () Bool)

(declare-fun mapRes!25334 () Bool)

(declare-fun tp!48653 () Bool)

(declare-fun e!471991 () Bool)

(assert (=> mapNonEmpty!25334 (= mapRes!25334 (and tp!48653 e!471991))))

(declare-fun mapKey!25334 () (_ BitVec 32))

(declare-datatypes ((V!26145 0))(
  ( (V!26146 (val!7959 Int)) )
))
(declare-datatypes ((ValueCell!7472 0))(
  ( (ValueCellFull!7472 (v!10384 V!26145)) (EmptyCell!7472) )
))
(declare-datatypes ((array!47917 0))(
  ( (array!47918 (arr!22985 (Array (_ BitVec 32) ValueCell!7472)) (size!23426 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47917)

(declare-fun mapValue!25334 () ValueCell!7472)

(declare-fun mapRest!25334 () (Array (_ BitVec 32) ValueCell!7472))

(assert (=> mapNonEmpty!25334 (= (arr!22985 _values!688) (store mapRest!25334 mapKey!25334 mapValue!25334))))

(declare-fun res!574150 () Bool)

(assert (=> start!72940 (=> (not res!574150) (not e!471990))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47919 0))(
  ( (array!47920 (arr!22986 (Array (_ BitVec 32) (_ BitVec 64))) (size!23427 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47919)

(assert (=> start!72940 (= res!574150 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23427 _keys!868))))))

(assert (=> start!72940 e!471990))

(assert (=> start!72940 true))

(declare-fun array_inv!18320 (array!47919) Bool)

(assert (=> start!72940 (array_inv!18320 _keys!868)))

(declare-fun e!471994 () Bool)

(declare-fun array_inv!18321 (array!47917) Bool)

(assert (=> start!72940 (and (array_inv!18321 _values!688) e!471994)))

(declare-fun mapIsEmpty!25334 () Bool)

(assert (=> mapIsEmpty!25334 mapRes!25334))

(declare-fun b!845475 () Bool)

(declare-fun e!471993 () Bool)

(assert (=> b!845475 (= e!471994 (and e!471993 mapRes!25334))))

(declare-fun condMapEmpty!25334 () Bool)

(declare-fun mapDefault!25334 () ValueCell!7472)

(assert (=> b!845475 (= condMapEmpty!25334 (= (arr!22985 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7472)) mapDefault!25334)))))

(declare-fun b!845476 () Bool)

(assert (=> b!845476 (= e!471990 false)))

(declare-fun lt!381662 () Bool)

(declare-datatypes ((List!16203 0))(
  ( (Nil!16200) (Cons!16199 (h!17336 (_ BitVec 64)) (t!22566 List!16203)) )
))
(declare-fun arrayNoDuplicates!0 (array!47919 (_ BitVec 32) List!16203) Bool)

(assert (=> b!845476 (= lt!381662 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16200))))

(declare-fun b!845477 () Bool)

(declare-fun tp_is_empty!15823 () Bool)

(assert (=> b!845477 (= e!471991 tp_is_empty!15823)))

(declare-fun b!845478 () Bool)

(declare-fun res!574151 () Bool)

(assert (=> b!845478 (=> (not res!574151) (not e!471990))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!845478 (= res!574151 (and (= (size!23426 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23427 _keys!868) (size!23426 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!845479 () Bool)

(assert (=> b!845479 (= e!471993 tp_is_empty!15823)))

(declare-fun b!845480 () Bool)

(declare-fun res!574152 () Bool)

(assert (=> b!845480 (=> (not res!574152) (not e!471990))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47919 (_ BitVec 32)) Bool)

(assert (=> b!845480 (= res!574152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!72940 res!574150) b!845474))

(assert (= (and b!845474 res!574153) b!845478))

(assert (= (and b!845478 res!574151) b!845480))

(assert (= (and b!845480 res!574152) b!845476))

(assert (= (and b!845475 condMapEmpty!25334) mapIsEmpty!25334))

(assert (= (and b!845475 (not condMapEmpty!25334)) mapNonEmpty!25334))

(get-info :version)

(assert (= (and mapNonEmpty!25334 ((_ is ValueCellFull!7472) mapValue!25334)) b!845477))

(assert (= (and b!845475 ((_ is ValueCellFull!7472) mapDefault!25334)) b!845479))

(assert (= start!72940 b!845475))

(declare-fun m!788057 () Bool)

(assert (=> b!845480 m!788057))

(declare-fun m!788059 () Bool)

(assert (=> start!72940 m!788059))

(declare-fun m!788061 () Bool)

(assert (=> start!72940 m!788061))

(declare-fun m!788063 () Bool)

(assert (=> b!845476 m!788063))

(declare-fun m!788065 () Bool)

(assert (=> b!845474 m!788065))

(declare-fun m!788067 () Bool)

(assert (=> mapNonEmpty!25334 m!788067))

(check-sat (not b!845480) tp_is_empty!15823 (not b!845476) (not start!72940) (not mapNonEmpty!25334) (not b!845474))
(check-sat)
