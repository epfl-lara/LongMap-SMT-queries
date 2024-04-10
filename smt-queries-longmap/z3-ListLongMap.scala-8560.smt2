; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104526 () Bool)

(assert start!104526)

(declare-fun b!1246953 () Bool)

(declare-fun e!707265 () Bool)

(declare-fun tp_is_empty!31299 () Bool)

(assert (=> b!1246953 (= e!707265 tp_is_empty!31299)))

(declare-fun mapNonEmpty!48688 () Bool)

(declare-fun mapRes!48688 () Bool)

(declare-fun tp!92789 () Bool)

(declare-fun e!707267 () Bool)

(assert (=> mapNonEmpty!48688 (= mapRes!48688 (and tp!92789 e!707267))))

(declare-fun mapKey!48688 () (_ BitVec 32))

(declare-datatypes ((V!47097 0))(
  ( (V!47098 (val!15712 Int)) )
))
(declare-datatypes ((ValueCell!14886 0))(
  ( (ValueCellFull!14886 (v!18407 V!47097)) (EmptyCell!14886) )
))
(declare-fun mapValue!48688 () ValueCell!14886)

(declare-datatypes ((array!80288 0))(
  ( (array!80289 (arr!38718 (Array (_ BitVec 32) ValueCell!14886)) (size!39254 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80288)

(declare-fun mapRest!48688 () (Array (_ BitVec 32) ValueCell!14886))

(assert (=> mapNonEmpty!48688 (= (arr!38718 _values!914) (store mapRest!48688 mapKey!48688 mapValue!48688))))

(declare-fun res!832129 () Bool)

(declare-fun e!707266 () Bool)

(assert (=> start!104526 (=> (not res!832129) (not e!707266))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104526 (= res!832129 (validMask!0 mask!1466))))

(assert (=> start!104526 e!707266))

(assert (=> start!104526 true))

(declare-datatypes ((array!80290 0))(
  ( (array!80291 (arr!38719 (Array (_ BitVec 32) (_ BitVec 64))) (size!39255 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80290)

(declare-fun array_inv!29565 (array!80290) Bool)

(assert (=> start!104526 (array_inv!29565 _keys!1118)))

(declare-fun e!707263 () Bool)

(declare-fun array_inv!29566 (array!80288) Bool)

(assert (=> start!104526 (and (array_inv!29566 _values!914) e!707263)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun b!1246954 () Bool)

(assert (=> b!1246954 (= e!707266 (and (= (size!39254 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39255 _keys!1118) (size!39254 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (size!39255 _keys!1118) (bvadd #b00000000000000000000000000000001 mask!1466)))))))

(declare-fun b!1246955 () Bool)

(assert (=> b!1246955 (= e!707263 (and e!707265 mapRes!48688))))

(declare-fun condMapEmpty!48688 () Bool)

(declare-fun mapDefault!48688 () ValueCell!14886)

(assert (=> b!1246955 (= condMapEmpty!48688 (= (arr!38718 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14886)) mapDefault!48688)))))

(declare-fun mapIsEmpty!48688 () Bool)

(assert (=> mapIsEmpty!48688 mapRes!48688))

(declare-fun b!1246956 () Bool)

(assert (=> b!1246956 (= e!707267 tp_is_empty!31299)))

(assert (= (and start!104526 res!832129) b!1246954))

(assert (= (and b!1246955 condMapEmpty!48688) mapIsEmpty!48688))

(assert (= (and b!1246955 (not condMapEmpty!48688)) mapNonEmpty!48688))

(get-info :version)

(assert (= (and mapNonEmpty!48688 ((_ is ValueCellFull!14886) mapValue!48688)) b!1246956))

(assert (= (and b!1246955 ((_ is ValueCellFull!14886) mapDefault!48688)) b!1246953))

(assert (= start!104526 b!1246955))

(declare-fun m!1148647 () Bool)

(assert (=> mapNonEmpty!48688 m!1148647))

(declare-fun m!1148649 () Bool)

(assert (=> start!104526 m!1148649))

(declare-fun m!1148651 () Bool)

(assert (=> start!104526 m!1148651))

(declare-fun m!1148653 () Bool)

(assert (=> start!104526 m!1148653))

(check-sat (not start!104526) (not mapNonEmpty!48688) tp_is_empty!31299)
(check-sat)
