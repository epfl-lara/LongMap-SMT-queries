; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70054 () Bool)

(assert start!70054)

(declare-fun mapNonEmpty!22636 () Bool)

(declare-fun mapRes!22636 () Bool)

(declare-fun tp!43744 () Bool)

(declare-fun e!450670 () Bool)

(assert (=> mapNonEmpty!22636 (= mapRes!22636 (and tp!43744 e!450670))))

(declare-datatypes ((V!23723 0))(
  ( (V!23724 (val!7068 Int)) )
))
(declare-datatypes ((ValueCell!6605 0))(
  ( (ValueCellFull!6605 (v!9495 V!23723)) (EmptyCell!6605) )
))
(declare-fun mapValue!22636 () ValueCell!6605)

(declare-fun mapKey!22636 () (_ BitVec 32))

(declare-datatypes ((array!44305 0))(
  ( (array!44306 (arr!21210 (Array (_ BitVec 32) ValueCell!6605)) (size!21630 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44305)

(declare-fun mapRest!22636 () (Array (_ BitVec 32) ValueCell!6605))

(assert (=> mapNonEmpty!22636 (= (arr!21210 _values!788) (store mapRest!22636 mapKey!22636 mapValue!22636))))

(declare-fun mapIsEmpty!22636 () Bool)

(assert (=> mapIsEmpty!22636 mapRes!22636))

(declare-fun res!555581 () Bool)

(declare-fun e!450669 () Bool)

(assert (=> start!70054 (=> (not res!555581) (not e!450669))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70054 (= res!555581 (validMask!0 mask!1312))))

(assert (=> start!70054 e!450669))

(declare-datatypes ((array!44307 0))(
  ( (array!44308 (arr!21211 (Array (_ BitVec 32) (_ BitVec 64))) (size!21631 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44307)

(declare-fun array_inv!17051 (array!44307) Bool)

(assert (=> start!70054 (array_inv!17051 _keys!976)))

(assert (=> start!70054 true))

(declare-fun e!450671 () Bool)

(declare-fun array_inv!17052 (array!44305) Bool)

(assert (=> start!70054 (and (array_inv!17052 _values!788) e!450671)))

(declare-fun b!813450 () Bool)

(declare-fun tp_is_empty!14041 () Bool)

(assert (=> b!813450 (= e!450670 tp_is_empty!14041)))

(declare-fun b!813451 () Bool)

(declare-fun e!450667 () Bool)

(assert (=> b!813451 (= e!450671 (and e!450667 mapRes!22636))))

(declare-fun condMapEmpty!22636 () Bool)

(declare-fun mapDefault!22636 () ValueCell!6605)

(assert (=> b!813451 (= condMapEmpty!22636 (= (arr!21210 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6605)) mapDefault!22636)))))

(declare-fun b!813452 () Bool)

(declare-fun res!555583 () Bool)

(assert (=> b!813452 (=> (not res!555583) (not e!450669))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44307 (_ BitVec 32)) Bool)

(assert (=> b!813452 (= res!555583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!813453 () Bool)

(assert (=> b!813453 (= e!450667 tp_is_empty!14041)))

(declare-fun b!813454 () Bool)

(declare-fun res!555582 () Bool)

(assert (=> b!813454 (=> (not res!555582) (not e!450669))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!813454 (= res!555582 (and (= (size!21630 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21631 _keys!976) (size!21630 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!813455 () Bool)

(assert (=> b!813455 (= e!450669 false)))

(declare-fun lt!364512 () Bool)

(declare-datatypes ((List!15002 0))(
  ( (Nil!14999) (Cons!14998 (h!16133 (_ BitVec 64)) (t!21309 List!15002)) )
))
(declare-fun arrayNoDuplicates!0 (array!44307 (_ BitVec 32) List!15002) Bool)

(assert (=> b!813455 (= lt!364512 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!14999))))

(assert (= (and start!70054 res!555581) b!813454))

(assert (= (and b!813454 res!555582) b!813452))

(assert (= (and b!813452 res!555583) b!813455))

(assert (= (and b!813451 condMapEmpty!22636) mapIsEmpty!22636))

(assert (= (and b!813451 (not condMapEmpty!22636)) mapNonEmpty!22636))

(get-info :version)

(assert (= (and mapNonEmpty!22636 ((_ is ValueCellFull!6605) mapValue!22636)) b!813450))

(assert (= (and b!813451 ((_ is ValueCellFull!6605) mapDefault!22636)) b!813453))

(assert (= start!70054 b!813451))

(declare-fun m!756187 () Bool)

(assert (=> mapNonEmpty!22636 m!756187))

(declare-fun m!756189 () Bool)

(assert (=> start!70054 m!756189))

(declare-fun m!756191 () Bool)

(assert (=> start!70054 m!756191))

(declare-fun m!756193 () Bool)

(assert (=> start!70054 m!756193))

(declare-fun m!756195 () Bool)

(assert (=> b!813452 m!756195))

(declare-fun m!756197 () Bool)

(assert (=> b!813455 m!756197))

(check-sat (not b!813452) tp_is_empty!14041 (not start!70054) (not mapNonEmpty!22636) (not b!813455))
(check-sat)
