; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69932 () Bool)

(assert start!69932)

(declare-fun b_free!12385 () Bool)

(declare-fun b_next!12385 () Bool)

(assert (=> start!69932 (= b_free!12385 (not b_next!12385))))

(declare-fun tp!43867 () Bool)

(declare-fun b_and!21127 () Bool)

(assert (=> start!69932 (= tp!43867 b_and!21127)))

(declare-fun b!812878 () Bool)

(declare-fun e!450374 () Bool)

(assert (=> b!812878 (= e!450374 false)))

(declare-datatypes ((V!23795 0))(
  ( (V!23796 (val!7095 Int)) )
))
(declare-fun zeroValueBefore!34 () V!23795)

(declare-datatypes ((array!44407 0))(
  ( (array!44408 (arr!21265 (Array (_ BitVec 32) (_ BitVec 64))) (size!21686 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44407)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!23795)

(declare-datatypes ((ValueCell!6632 0))(
  ( (ValueCellFull!6632 (v!9516 V!23795)) (EmptyCell!6632) )
))
(declare-datatypes ((array!44409 0))(
  ( (array!44410 (arr!21266 (Array (_ BitVec 32) ValueCell!6632)) (size!21687 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44409)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9342 0))(
  ( (tuple2!9343 (_1!4682 (_ BitVec 64)) (_2!4682 V!23795)) )
))
(declare-datatypes ((List!15165 0))(
  ( (Nil!15162) (Cons!15161 (h!16290 tuple2!9342) (t!21471 List!15165)) )
))
(declare-datatypes ((ListLongMap!8155 0))(
  ( (ListLongMap!8156 (toList!4093 List!15165)) )
))
(declare-fun lt!363996 () ListLongMap!8155)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2158 (array!44407 array!44409 (_ BitVec 32) (_ BitVec 32) V!23795 V!23795 (_ BitVec 32) Int) ListLongMap!8155)

(assert (=> b!812878 (= lt!363996 (getCurrentListMapNoExtraKeys!2158 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!812879 () Bool)

(declare-fun e!450372 () Bool)

(declare-fun e!450375 () Bool)

(declare-fun mapRes!22720 () Bool)

(assert (=> b!812879 (= e!450372 (and e!450375 mapRes!22720))))

(declare-fun condMapEmpty!22720 () Bool)

(declare-fun mapDefault!22720 () ValueCell!6632)

(assert (=> b!812879 (= condMapEmpty!22720 (= (arr!21266 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6632)) mapDefault!22720)))))

(declare-fun mapIsEmpty!22720 () Bool)

(assert (=> mapIsEmpty!22720 mapRes!22720))

(declare-fun mapNonEmpty!22720 () Bool)

(declare-fun tp!43866 () Bool)

(declare-fun e!450371 () Bool)

(assert (=> mapNonEmpty!22720 (= mapRes!22720 (and tp!43866 e!450371))))

(declare-fun mapValue!22720 () ValueCell!6632)

(declare-fun mapKey!22720 () (_ BitVec 32))

(declare-fun mapRest!22720 () (Array (_ BitVec 32) ValueCell!6632))

(assert (=> mapNonEmpty!22720 (= (arr!21266 _values!788) (store mapRest!22720 mapKey!22720 mapValue!22720))))

(declare-fun b!812881 () Bool)

(declare-fun tp_is_empty!14095 () Bool)

(assert (=> b!812881 (= e!450375 tp_is_empty!14095)))

(declare-fun b!812882 () Bool)

(declare-fun res!555434 () Bool)

(assert (=> b!812882 (=> (not res!555434) (not e!450374))))

(declare-datatypes ((List!15166 0))(
  ( (Nil!15163) (Cons!15162 (h!16291 (_ BitVec 64)) (t!21472 List!15166)) )
))
(declare-fun arrayNoDuplicates!0 (array!44407 (_ BitVec 32) List!15166) Bool)

(assert (=> b!812882 (= res!555434 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15163))))

(declare-fun b!812883 () Bool)

(declare-fun res!555436 () Bool)

(assert (=> b!812883 (=> (not res!555436) (not e!450374))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!812883 (= res!555436 (and (= (size!21687 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21686 _keys!976) (size!21687 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!812884 () Bool)

(assert (=> b!812884 (= e!450371 tp_is_empty!14095)))

(declare-fun b!812880 () Bool)

(declare-fun res!555435 () Bool)

(assert (=> b!812880 (=> (not res!555435) (not e!450374))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44407 (_ BitVec 32)) Bool)

(assert (=> b!812880 (= res!555435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!555437 () Bool)

(assert (=> start!69932 (=> (not res!555437) (not e!450374))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69932 (= res!555437 (validMask!0 mask!1312))))

(assert (=> start!69932 e!450374))

(assert (=> start!69932 tp_is_empty!14095))

(declare-fun array_inv!17113 (array!44407) Bool)

(assert (=> start!69932 (array_inv!17113 _keys!976)))

(assert (=> start!69932 true))

(declare-fun array_inv!17114 (array!44409) Bool)

(assert (=> start!69932 (and (array_inv!17114 _values!788) e!450372)))

(assert (=> start!69932 tp!43867))

(assert (= (and start!69932 res!555437) b!812883))

(assert (= (and b!812883 res!555436) b!812880))

(assert (= (and b!812880 res!555435) b!812882))

(assert (= (and b!812882 res!555434) b!812878))

(assert (= (and b!812879 condMapEmpty!22720) mapIsEmpty!22720))

(assert (= (and b!812879 (not condMapEmpty!22720)) mapNonEmpty!22720))

(get-info :version)

(assert (= (and mapNonEmpty!22720 ((_ is ValueCellFull!6632) mapValue!22720)) b!812884))

(assert (= (and b!812879 ((_ is ValueCellFull!6632) mapDefault!22720)) b!812881))

(assert (= start!69932 b!812879))

(declare-fun m!754519 () Bool)

(assert (=> mapNonEmpty!22720 m!754519))

(declare-fun m!754521 () Bool)

(assert (=> b!812882 m!754521))

(declare-fun m!754523 () Bool)

(assert (=> start!69932 m!754523))

(declare-fun m!754525 () Bool)

(assert (=> start!69932 m!754525))

(declare-fun m!754527 () Bool)

(assert (=> start!69932 m!754527))

(declare-fun m!754529 () Bool)

(assert (=> b!812880 m!754529))

(declare-fun m!754531 () Bool)

(assert (=> b!812878 m!754531))

(check-sat (not b!812882) (not b_next!12385) (not mapNonEmpty!22720) b_and!21127 (not b!812878) (not b!812880) tp_is_empty!14095 (not start!69932))
(check-sat b_and!21127 (not b_next!12385))
