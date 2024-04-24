; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70048 () Bool)

(assert start!70048)

(declare-fun res!555555 () Bool)

(declare-fun e!450626 () Bool)

(assert (=> start!70048 (=> (not res!555555) (not e!450626))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70048 (= res!555555 (validMask!0 mask!1312))))

(assert (=> start!70048 e!450626))

(declare-datatypes ((array!44293 0))(
  ( (array!44294 (arr!21204 (Array (_ BitVec 32) (_ BitVec 64))) (size!21624 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44293)

(declare-fun array_inv!17045 (array!44293) Bool)

(assert (=> start!70048 (array_inv!17045 _keys!976)))

(assert (=> start!70048 true))

(declare-datatypes ((V!23715 0))(
  ( (V!23716 (val!7065 Int)) )
))
(declare-datatypes ((ValueCell!6602 0))(
  ( (ValueCellFull!6602 (v!9492 V!23715)) (EmptyCell!6602) )
))
(declare-datatypes ((array!44295 0))(
  ( (array!44296 (arr!21205 (Array (_ BitVec 32) ValueCell!6602)) (size!21625 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44295)

(declare-fun e!450622 () Bool)

(declare-fun array_inv!17046 (array!44295) Bool)

(assert (=> start!70048 (and (array_inv!17046 _values!788) e!450622)))

(declare-fun mapIsEmpty!22627 () Bool)

(declare-fun mapRes!22627 () Bool)

(assert (=> mapIsEmpty!22627 mapRes!22627))

(declare-fun b!813396 () Bool)

(assert (=> b!813396 (= e!450626 false)))

(declare-fun lt!364503 () Bool)

(declare-datatypes ((List!15000 0))(
  ( (Nil!14997) (Cons!14996 (h!16131 (_ BitVec 64)) (t!21307 List!15000)) )
))
(declare-fun arrayNoDuplicates!0 (array!44293 (_ BitVec 32) List!15000) Bool)

(assert (=> b!813396 (= lt!364503 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!14997))))

(declare-fun b!813397 () Bool)

(declare-fun res!555554 () Bool)

(assert (=> b!813397 (=> (not res!555554) (not e!450626))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44293 (_ BitVec 32)) Bool)

(assert (=> b!813397 (= res!555554 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!22627 () Bool)

(declare-fun tp!43735 () Bool)

(declare-fun e!450625 () Bool)

(assert (=> mapNonEmpty!22627 (= mapRes!22627 (and tp!43735 e!450625))))

(declare-fun mapKey!22627 () (_ BitVec 32))

(declare-fun mapValue!22627 () ValueCell!6602)

(declare-fun mapRest!22627 () (Array (_ BitVec 32) ValueCell!6602))

(assert (=> mapNonEmpty!22627 (= (arr!21205 _values!788) (store mapRest!22627 mapKey!22627 mapValue!22627))))

(declare-fun b!813398 () Bool)

(declare-fun e!450624 () Bool)

(assert (=> b!813398 (= e!450622 (and e!450624 mapRes!22627))))

(declare-fun condMapEmpty!22627 () Bool)

(declare-fun mapDefault!22627 () ValueCell!6602)

(assert (=> b!813398 (= condMapEmpty!22627 (= (arr!21205 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6602)) mapDefault!22627)))))

(declare-fun b!813399 () Bool)

(declare-fun tp_is_empty!14035 () Bool)

(assert (=> b!813399 (= e!450625 tp_is_empty!14035)))

(declare-fun b!813400 () Bool)

(assert (=> b!813400 (= e!450624 tp_is_empty!14035)))

(declare-fun b!813401 () Bool)

(declare-fun res!555556 () Bool)

(assert (=> b!813401 (=> (not res!555556) (not e!450626))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!813401 (= res!555556 (and (= (size!21625 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21624 _keys!976) (size!21625 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!70048 res!555555) b!813401))

(assert (= (and b!813401 res!555556) b!813397))

(assert (= (and b!813397 res!555554) b!813396))

(assert (= (and b!813398 condMapEmpty!22627) mapIsEmpty!22627))

(assert (= (and b!813398 (not condMapEmpty!22627)) mapNonEmpty!22627))

(get-info :version)

(assert (= (and mapNonEmpty!22627 ((_ is ValueCellFull!6602) mapValue!22627)) b!813399))

(assert (= (and b!813398 ((_ is ValueCellFull!6602) mapDefault!22627)) b!813400))

(assert (= start!70048 b!813398))

(declare-fun m!756151 () Bool)

(assert (=> start!70048 m!756151))

(declare-fun m!756153 () Bool)

(assert (=> start!70048 m!756153))

(declare-fun m!756155 () Bool)

(assert (=> start!70048 m!756155))

(declare-fun m!756157 () Bool)

(assert (=> b!813396 m!756157))

(declare-fun m!756159 () Bool)

(assert (=> b!813397 m!756159))

(declare-fun m!756161 () Bool)

(assert (=> mapNonEmpty!22627 m!756161))

(check-sat tp_is_empty!14035 (not b!813397) (not start!70048) (not mapNonEmpty!22627) (not b!813396))
(check-sat)
