; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77866 () Bool)

(assert start!77866)

(declare-fun b_free!16425 () Bool)

(declare-fun b_next!16425 () Bool)

(assert (=> start!77866 (= b_free!16425 (not b_next!16425))))

(declare-fun tp!57540 () Bool)

(declare-fun b_and!26993 () Bool)

(assert (=> start!77866 (= tp!57540 b_and!26993)))

(declare-fun b!909223 () Bool)

(declare-fun res!613687 () Bool)

(declare-fun e!509627 () Bool)

(assert (=> b!909223 (=> (not res!613687) (not e!509627))))

(declare-datatypes ((V!30089 0))(
  ( (V!30090 (val!9472 Int)) )
))
(declare-datatypes ((ValueCell!8940 0))(
  ( (ValueCellFull!8940 (v!11979 V!30089)) (EmptyCell!8940) )
))
(declare-datatypes ((array!53714 0))(
  ( (array!53715 (arr!25815 (Array (_ BitVec 32) ValueCell!8940)) (size!26274 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53714)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-datatypes ((array!53716 0))(
  ( (array!53717 (arr!25816 (Array (_ BitVec 32) (_ BitVec 64))) (size!26275 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53716)

(declare-fun mask!1756 () (_ BitVec 32))

(assert (=> b!909223 (= res!613687 (and (= (size!26274 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26275 _keys!1386) (size!26274 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!909224 () Bool)

(declare-fun res!613689 () Bool)

(assert (=> b!909224 (=> (not res!613689) (not e!509627))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53716 (_ BitVec 32)) Bool)

(assert (=> b!909224 (= res!613689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!909225 () Bool)

(assert (=> b!909225 (= e!509627 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30089)

(declare-fun lt!409964 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30089)

(declare-datatypes ((tuple2!12346 0))(
  ( (tuple2!12347 (_1!6184 (_ BitVec 64)) (_2!6184 V!30089)) )
))
(declare-datatypes ((List!18139 0))(
  ( (Nil!18136) (Cons!18135 (h!19281 tuple2!12346) (t!25720 List!18139)) )
))
(declare-datatypes ((ListLongMap!11043 0))(
  ( (ListLongMap!11044 (toList!5537 List!18139)) )
))
(declare-fun contains!4579 (ListLongMap!11043 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2799 (array!53716 array!53714 (_ BitVec 32) (_ BitVec 32) V!30089 V!30089 (_ BitVec 32) Int) ListLongMap!11043)

(assert (=> b!909225 (= lt!409964 (contains!4579 (getCurrentListMap!2799 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!909226 () Bool)

(declare-fun e!509630 () Bool)

(declare-fun tp_is_empty!18843 () Bool)

(assert (=> b!909226 (= e!509630 tp_is_empty!18843)))

(declare-fun res!613688 () Bool)

(assert (=> start!77866 (=> (not res!613688) (not e!509627))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77866 (= res!613688 (validMask!0 mask!1756))))

(assert (=> start!77866 e!509627))

(declare-fun e!509629 () Bool)

(declare-fun array_inv!20200 (array!53714) Bool)

(assert (=> start!77866 (and (array_inv!20200 _values!1152) e!509629)))

(assert (=> start!77866 tp!57540))

(assert (=> start!77866 true))

(assert (=> start!77866 tp_is_empty!18843))

(declare-fun array_inv!20201 (array!53716) Bool)

(assert (=> start!77866 (array_inv!20201 _keys!1386)))

(declare-fun mapNonEmpty!29980 () Bool)

(declare-fun mapRes!29980 () Bool)

(declare-fun tp!57539 () Bool)

(assert (=> mapNonEmpty!29980 (= mapRes!29980 (and tp!57539 e!509630))))

(declare-fun mapRest!29980 () (Array (_ BitVec 32) ValueCell!8940))

(declare-fun mapKey!29980 () (_ BitVec 32))

(declare-fun mapValue!29980 () ValueCell!8940)

(assert (=> mapNonEmpty!29980 (= (arr!25815 _values!1152) (store mapRest!29980 mapKey!29980 mapValue!29980))))

(declare-fun b!909227 () Bool)

(declare-fun e!509628 () Bool)

(assert (=> b!909227 (= e!509629 (and e!509628 mapRes!29980))))

(declare-fun condMapEmpty!29980 () Bool)

(declare-fun mapDefault!29980 () ValueCell!8940)

(assert (=> b!909227 (= condMapEmpty!29980 (= (arr!25815 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8940)) mapDefault!29980)))))

(declare-fun mapIsEmpty!29980 () Bool)

(assert (=> mapIsEmpty!29980 mapRes!29980))

(declare-fun b!909228 () Bool)

(assert (=> b!909228 (= e!509628 tp_is_empty!18843)))

(declare-fun b!909229 () Bool)

(declare-fun res!613686 () Bool)

(assert (=> b!909229 (=> (not res!613686) (not e!509627))))

(declare-datatypes ((List!18140 0))(
  ( (Nil!18137) (Cons!18136 (h!19282 (_ BitVec 64)) (t!25721 List!18140)) )
))
(declare-fun arrayNoDuplicates!0 (array!53716 (_ BitVec 32) List!18140) Bool)

(assert (=> b!909229 (= res!613686 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18137))))

(assert (= (and start!77866 res!613688) b!909223))

(assert (= (and b!909223 res!613687) b!909224))

(assert (= (and b!909224 res!613689) b!909229))

(assert (= (and b!909229 res!613686) b!909225))

(assert (= (and b!909227 condMapEmpty!29980) mapIsEmpty!29980))

(assert (= (and b!909227 (not condMapEmpty!29980)) mapNonEmpty!29980))

(get-info :version)

(assert (= (and mapNonEmpty!29980 ((_ is ValueCellFull!8940) mapValue!29980)) b!909226))

(assert (= (and b!909227 ((_ is ValueCellFull!8940) mapDefault!29980)) b!909228))

(assert (= start!77866 b!909227))

(declare-fun m!844521 () Bool)

(assert (=> b!909225 m!844521))

(assert (=> b!909225 m!844521))

(declare-fun m!844523 () Bool)

(assert (=> b!909225 m!844523))

(declare-fun m!844525 () Bool)

(assert (=> b!909224 m!844525))

(declare-fun m!844527 () Bool)

(assert (=> start!77866 m!844527))

(declare-fun m!844529 () Bool)

(assert (=> start!77866 m!844529))

(declare-fun m!844531 () Bool)

(assert (=> start!77866 m!844531))

(declare-fun m!844533 () Bool)

(assert (=> mapNonEmpty!29980 m!844533))

(declare-fun m!844535 () Bool)

(assert (=> b!909229 m!844535))

(check-sat (not b!909224) (not mapNonEmpty!29980) (not b!909225) (not b_next!16425) tp_is_empty!18843 (not b!909229) (not start!77866) b_and!26993)
(check-sat b_and!26993 (not b_next!16425))
