; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104532 () Bool)

(assert start!104532)

(declare-fun mapIsEmpty!48697 () Bool)

(declare-fun mapRes!48697 () Bool)

(assert (=> mapIsEmpty!48697 mapRes!48697))

(declare-fun b!1246989 () Bool)

(declare-fun e!707312 () Bool)

(declare-fun tp_is_empty!31305 () Bool)

(assert (=> b!1246989 (= e!707312 tp_is_empty!31305)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun b!1246990 () Bool)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((array!80300 0))(
  ( (array!80301 (arr!38724 (Array (_ BitVec 32) (_ BitVec 64))) (size!39260 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80300)

(declare-datatypes ((V!47105 0))(
  ( (V!47106 (val!15715 Int)) )
))
(declare-datatypes ((ValueCell!14889 0))(
  ( (ValueCellFull!14889 (v!18410 V!47105)) (EmptyCell!14889) )
))
(declare-datatypes ((array!80302 0))(
  ( (array!80303 (arr!38725 (Array (_ BitVec 32) ValueCell!14889)) (size!39261 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80302)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun e!707311 () Bool)

(assert (=> b!1246990 (= e!707311 (and (= (size!39261 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39260 _keys!1118) (size!39261 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (size!39260 _keys!1118) (bvadd #b00000000000000000000000000000001 mask!1466)) (bvsgt #b00000000000000000000000000000000 (size!39260 _keys!1118))))))

(declare-fun mapNonEmpty!48697 () Bool)

(declare-fun tp!92798 () Bool)

(declare-fun e!707310 () Bool)

(assert (=> mapNonEmpty!48697 (= mapRes!48697 (and tp!92798 e!707310))))

(declare-fun mapRest!48697 () (Array (_ BitVec 32) ValueCell!14889))

(declare-fun mapValue!48697 () ValueCell!14889)

(declare-fun mapKey!48697 () (_ BitVec 32))

(assert (=> mapNonEmpty!48697 (= (arr!38725 _values!914) (store mapRest!48697 mapKey!48697 mapValue!48697))))

(declare-fun b!1246991 () Bool)

(assert (=> b!1246991 (= e!707310 tp_is_empty!31305)))

(declare-fun b!1246992 () Bool)

(declare-fun e!707308 () Bool)

(assert (=> b!1246992 (= e!707308 (and e!707312 mapRes!48697))))

(declare-fun condMapEmpty!48697 () Bool)

(declare-fun mapDefault!48697 () ValueCell!14889)

(assert (=> b!1246992 (= condMapEmpty!48697 (= (arr!38725 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14889)) mapDefault!48697)))))

(declare-fun res!832138 () Bool)

(assert (=> start!104532 (=> (not res!832138) (not e!707311))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104532 (= res!832138 (validMask!0 mask!1466))))

(assert (=> start!104532 e!707311))

(assert (=> start!104532 true))

(declare-fun array_inv!29571 (array!80300) Bool)

(assert (=> start!104532 (array_inv!29571 _keys!1118)))

(declare-fun array_inv!29572 (array!80302) Bool)

(assert (=> start!104532 (and (array_inv!29572 _values!914) e!707308)))

(assert (= (and start!104532 res!832138) b!1246990))

(assert (= (and b!1246992 condMapEmpty!48697) mapIsEmpty!48697))

(assert (= (and b!1246992 (not condMapEmpty!48697)) mapNonEmpty!48697))

(get-info :version)

(assert (= (and mapNonEmpty!48697 ((_ is ValueCellFull!14889) mapValue!48697)) b!1246991))

(assert (= (and b!1246992 ((_ is ValueCellFull!14889) mapDefault!48697)) b!1246989))

(assert (= start!104532 b!1246992))

(declare-fun m!1148671 () Bool)

(assert (=> mapNonEmpty!48697 m!1148671))

(declare-fun m!1148673 () Bool)

(assert (=> start!104532 m!1148673))

(declare-fun m!1148675 () Bool)

(assert (=> start!104532 m!1148675))

(declare-fun m!1148677 () Bool)

(assert (=> start!104532 m!1148677))

(check-sat (not start!104532) (not mapNonEmpty!48697) tp_is_empty!31305)
(check-sat)
(get-model)

(declare-fun d!137713 () Bool)

(assert (=> d!137713 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!104532 d!137713))

(declare-fun d!137715 () Bool)

(assert (=> d!137715 (= (array_inv!29571 _keys!1118) (bvsge (size!39260 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!104532 d!137715))

(declare-fun d!137717 () Bool)

(assert (=> d!137717 (= (array_inv!29572 _values!914) (bvsge (size!39261 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!104532 d!137717))

(declare-fun mapIsEmpty!48703 () Bool)

(declare-fun mapRes!48703 () Bool)

(assert (=> mapIsEmpty!48703 mapRes!48703))

(declare-fun mapNonEmpty!48703 () Bool)

(declare-fun tp!92804 () Bool)

(declare-fun e!707333 () Bool)

(assert (=> mapNonEmpty!48703 (= mapRes!48703 (and tp!92804 e!707333))))

(declare-fun mapRest!48703 () (Array (_ BitVec 32) ValueCell!14889))

(declare-fun mapKey!48703 () (_ BitVec 32))

(declare-fun mapValue!48703 () ValueCell!14889)

(assert (=> mapNonEmpty!48703 (= mapRest!48697 (store mapRest!48703 mapKey!48703 mapValue!48703))))

(declare-fun b!1247011 () Bool)

(assert (=> b!1247011 (= e!707333 tp_is_empty!31305)))

(declare-fun b!1247012 () Bool)

(declare-fun e!707332 () Bool)

(assert (=> b!1247012 (= e!707332 tp_is_empty!31305)))

(declare-fun condMapEmpty!48703 () Bool)

(declare-fun mapDefault!48703 () ValueCell!14889)

(assert (=> mapNonEmpty!48697 (= condMapEmpty!48703 (= mapRest!48697 ((as const (Array (_ BitVec 32) ValueCell!14889)) mapDefault!48703)))))

(assert (=> mapNonEmpty!48697 (= tp!92798 (and e!707332 mapRes!48703))))

(assert (= (and mapNonEmpty!48697 condMapEmpty!48703) mapIsEmpty!48703))

(assert (= (and mapNonEmpty!48697 (not condMapEmpty!48703)) mapNonEmpty!48703))

(assert (= (and mapNonEmpty!48703 ((_ is ValueCellFull!14889) mapValue!48703)) b!1247011))

(assert (= (and mapNonEmpty!48697 ((_ is ValueCellFull!14889) mapDefault!48703)) b!1247012))

(declare-fun m!1148687 () Bool)

(assert (=> mapNonEmpty!48703 m!1148687))

(check-sat (not mapNonEmpty!48703) tp_is_empty!31305)
(check-sat)
