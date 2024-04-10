; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69878 () Bool)

(assert start!69878)

(declare-fun b!812466 () Bool)

(declare-fun e!450015 () Bool)

(declare-fun e!450014 () Bool)

(declare-fun mapRes!22621 () Bool)

(assert (=> b!812466 (= e!450015 (and e!450014 mapRes!22621))))

(declare-fun condMapEmpty!22621 () Bool)

(declare-datatypes ((V!23709 0))(
  ( (V!23710 (val!7063 Int)) )
))
(declare-datatypes ((ValueCell!6600 0))(
  ( (ValueCellFull!6600 (v!9490 V!23709)) (EmptyCell!6600) )
))
(declare-datatypes ((array!44286 0))(
  ( (array!44287 (arr!21205 (Array (_ BitVec 32) ValueCell!6600)) (size!21626 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44286)

(declare-fun mapDefault!22621 () ValueCell!6600)

(assert (=> b!812466 (= condMapEmpty!22621 (= (arr!21205 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6600)) mapDefault!22621)))))

(declare-fun b!812467 () Bool)

(declare-fun e!450016 () Bool)

(declare-fun tp_is_empty!14031 () Bool)

(assert (=> b!812467 (= e!450016 tp_is_empty!14031)))

(declare-fun b!812468 () Bool)

(declare-fun res!555190 () Bool)

(declare-fun e!450017 () Bool)

(assert (=> b!812468 (=> (not res!555190) (not e!450017))))

(declare-datatypes ((array!44288 0))(
  ( (array!44289 (arr!21206 (Array (_ BitVec 32) (_ BitVec 64))) (size!21627 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44288)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44288 (_ BitVec 32)) Bool)

(assert (=> b!812468 (= res!555190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!555192 () Bool)

(assert (=> start!69878 (=> (not res!555192) (not e!450017))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69878 (= res!555192 (validMask!0 mask!1312))))

(assert (=> start!69878 e!450017))

(declare-fun array_inv!16989 (array!44288) Bool)

(assert (=> start!69878 (array_inv!16989 _keys!976)))

(assert (=> start!69878 true))

(declare-fun array_inv!16990 (array!44286) Bool)

(assert (=> start!69878 (and (array_inv!16990 _values!788) e!450015)))

(declare-fun b!812469 () Bool)

(declare-fun res!555191 () Bool)

(assert (=> b!812469 (=> (not res!555191) (not e!450017))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!812469 (= res!555191 (and (= (size!21626 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21627 _keys!976) (size!21626 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!812470 () Bool)

(assert (=> b!812470 (= e!450017 false)))

(declare-fun lt!364143 () Bool)

(declare-datatypes ((List!15098 0))(
  ( (Nil!15095) (Cons!15094 (h!16223 (_ BitVec 64)) (t!21413 List!15098)) )
))
(declare-fun arrayNoDuplicates!0 (array!44288 (_ BitVec 32) List!15098) Bool)

(assert (=> b!812470 (= lt!364143 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15095))))

(declare-fun b!812471 () Bool)

(assert (=> b!812471 (= e!450014 tp_is_empty!14031)))

(declare-fun mapIsEmpty!22621 () Bool)

(assert (=> mapIsEmpty!22621 mapRes!22621))

(declare-fun mapNonEmpty!22621 () Bool)

(declare-fun tp!43729 () Bool)

(assert (=> mapNonEmpty!22621 (= mapRes!22621 (and tp!43729 e!450016))))

(declare-fun mapValue!22621 () ValueCell!6600)

(declare-fun mapRest!22621 () (Array (_ BitVec 32) ValueCell!6600))

(declare-fun mapKey!22621 () (_ BitVec 32))

(assert (=> mapNonEmpty!22621 (= (arr!21205 _values!788) (store mapRest!22621 mapKey!22621 mapValue!22621))))

(assert (= (and start!69878 res!555192) b!812469))

(assert (= (and b!812469 res!555191) b!812468))

(assert (= (and b!812468 res!555190) b!812470))

(assert (= (and b!812466 condMapEmpty!22621) mapIsEmpty!22621))

(assert (= (and b!812466 (not condMapEmpty!22621)) mapNonEmpty!22621))

(get-info :version)

(assert (= (and mapNonEmpty!22621 ((_ is ValueCellFull!6600) mapValue!22621)) b!812467))

(assert (= (and b!812466 ((_ is ValueCellFull!6600) mapDefault!22621)) b!812471))

(assert (= start!69878 b!812466))

(declare-fun m!754845 () Bool)

(assert (=> b!812468 m!754845))

(declare-fun m!754847 () Bool)

(assert (=> start!69878 m!754847))

(declare-fun m!754849 () Bool)

(assert (=> start!69878 m!754849))

(declare-fun m!754851 () Bool)

(assert (=> start!69878 m!754851))

(declare-fun m!754853 () Bool)

(assert (=> b!812470 m!754853))

(declare-fun m!754855 () Bool)

(assert (=> mapNonEmpty!22621 m!754855))

(check-sat (not b!812470) (not b!812468) (not start!69878) (not mapNonEmpty!22621) tp_is_empty!14031)
(check-sat)
