; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69866 () Bool)

(assert start!69866)

(declare-fun res!555136 () Bool)

(declare-fun e!449926 () Bool)

(assert (=> start!69866 (=> (not res!555136) (not e!449926))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69866 (= res!555136 (validMask!0 mask!1312))))

(assert (=> start!69866 e!449926))

(declare-datatypes ((array!44264 0))(
  ( (array!44265 (arr!21194 (Array (_ BitVec 32) (_ BitVec 64))) (size!21615 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44264)

(declare-fun array_inv!16979 (array!44264) Bool)

(assert (=> start!69866 (array_inv!16979 _keys!976)))

(assert (=> start!69866 true))

(declare-datatypes ((V!23693 0))(
  ( (V!23694 (val!7057 Int)) )
))
(declare-datatypes ((ValueCell!6594 0))(
  ( (ValueCellFull!6594 (v!9484 V!23693)) (EmptyCell!6594) )
))
(declare-datatypes ((array!44266 0))(
  ( (array!44267 (arr!21195 (Array (_ BitVec 32) ValueCell!6594)) (size!21616 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44266)

(declare-fun e!449924 () Bool)

(declare-fun array_inv!16980 (array!44266) Bool)

(assert (=> start!69866 (and (array_inv!16980 _values!788) e!449924)))

(declare-fun b!812358 () Bool)

(declare-fun e!449925 () Bool)

(declare-fun mapRes!22603 () Bool)

(assert (=> b!812358 (= e!449924 (and e!449925 mapRes!22603))))

(declare-fun condMapEmpty!22603 () Bool)

(declare-fun mapDefault!22603 () ValueCell!6594)

(assert (=> b!812358 (= condMapEmpty!22603 (= (arr!21195 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6594)) mapDefault!22603)))))

(declare-fun b!812359 () Bool)

(assert (=> b!812359 (= e!449926 false)))

(declare-fun lt!364125 () Bool)

(declare-datatypes ((List!15094 0))(
  ( (Nil!15091) (Cons!15090 (h!16219 (_ BitVec 64)) (t!21409 List!15094)) )
))
(declare-fun arrayNoDuplicates!0 (array!44264 (_ BitVec 32) List!15094) Bool)

(assert (=> b!812359 (= lt!364125 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15091))))

(declare-fun mapNonEmpty!22603 () Bool)

(declare-fun tp!43711 () Bool)

(declare-fun e!449927 () Bool)

(assert (=> mapNonEmpty!22603 (= mapRes!22603 (and tp!43711 e!449927))))

(declare-fun mapRest!22603 () (Array (_ BitVec 32) ValueCell!6594))

(declare-fun mapKey!22603 () (_ BitVec 32))

(declare-fun mapValue!22603 () ValueCell!6594)

(assert (=> mapNonEmpty!22603 (= (arr!21195 _values!788) (store mapRest!22603 mapKey!22603 mapValue!22603))))

(declare-fun b!812360 () Bool)

(declare-fun tp_is_empty!14019 () Bool)

(assert (=> b!812360 (= e!449925 tp_is_empty!14019)))

(declare-fun b!812361 () Bool)

(declare-fun res!555137 () Bool)

(assert (=> b!812361 (=> (not res!555137) (not e!449926))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44264 (_ BitVec 32)) Bool)

(assert (=> b!812361 (= res!555137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!812362 () Bool)

(assert (=> b!812362 (= e!449927 tp_is_empty!14019)))

(declare-fun mapIsEmpty!22603 () Bool)

(assert (=> mapIsEmpty!22603 mapRes!22603))

(declare-fun b!812363 () Bool)

(declare-fun res!555138 () Bool)

(assert (=> b!812363 (=> (not res!555138) (not e!449926))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!812363 (= res!555138 (and (= (size!21616 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21615 _keys!976) (size!21616 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!69866 res!555136) b!812363))

(assert (= (and b!812363 res!555138) b!812361))

(assert (= (and b!812361 res!555137) b!812359))

(assert (= (and b!812358 condMapEmpty!22603) mapIsEmpty!22603))

(assert (= (and b!812358 (not condMapEmpty!22603)) mapNonEmpty!22603))

(get-info :version)

(assert (= (and mapNonEmpty!22603 ((_ is ValueCellFull!6594) mapValue!22603)) b!812362))

(assert (= (and b!812358 ((_ is ValueCellFull!6594) mapDefault!22603)) b!812360))

(assert (= start!69866 b!812358))

(declare-fun m!754773 () Bool)

(assert (=> start!69866 m!754773))

(declare-fun m!754775 () Bool)

(assert (=> start!69866 m!754775))

(declare-fun m!754777 () Bool)

(assert (=> start!69866 m!754777))

(declare-fun m!754779 () Bool)

(assert (=> b!812359 m!754779))

(declare-fun m!754781 () Bool)

(assert (=> mapNonEmpty!22603 m!754781))

(declare-fun m!754783 () Bool)

(assert (=> b!812361 m!754783))

(check-sat (not start!69866) (not mapNonEmpty!22603) (not b!812361) tp_is_empty!14019 (not b!812359))
(check-sat)
