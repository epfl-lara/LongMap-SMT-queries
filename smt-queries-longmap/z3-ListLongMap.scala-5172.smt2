; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70020 () Bool)

(assert start!70020)

(declare-fun b_free!12441 () Bool)

(declare-fun b_next!12441 () Bool)

(assert (=> start!70020 (= b_free!12441 (not b_next!12441))))

(declare-fun tp!44037 () Bool)

(declare-fun b_and!21213 () Bool)

(assert (=> start!70020 (= tp!44037 b_and!21213)))

(declare-fun b!813785 () Bool)

(declare-fun e!450993 () Bool)

(declare-fun tp_is_empty!14151 () Bool)

(assert (=> b!813785 (= e!450993 tp_is_empty!14151)))

(declare-fun mapNonEmpty!22807 () Bool)

(declare-fun mapRes!22807 () Bool)

(declare-fun tp!44038 () Bool)

(declare-fun e!450991 () Bool)

(assert (=> mapNonEmpty!22807 (= mapRes!22807 (and tp!44038 e!450991))))

(declare-datatypes ((V!23869 0))(
  ( (V!23870 (val!7123 Int)) )
))
(declare-datatypes ((ValueCell!6660 0))(
  ( (ValueCellFull!6660 (v!9550 V!23869)) (EmptyCell!6660) )
))
(declare-datatypes ((array!44510 0))(
  ( (array!44511 (arr!21315 (Array (_ BitVec 32) ValueCell!6660)) (size!21736 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44510)

(declare-fun mapKey!22807 () (_ BitVec 32))

(declare-fun mapValue!22807 () ValueCell!6660)

(declare-fun mapRest!22807 () (Array (_ BitVec 32) ValueCell!6660))

(assert (=> mapNonEmpty!22807 (= (arr!21315 _values!788) (store mapRest!22807 mapKey!22807 mapValue!22807))))

(declare-fun b!813786 () Bool)

(declare-fun e!450992 () Bool)

(assert (=> b!813786 (= e!450992 false)))

(declare-fun zeroValueAfter!34 () V!23869)

(declare-fun minValue!754 () V!23869)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((tuple2!9328 0))(
  ( (tuple2!9329 (_1!4675 (_ BitVec 64)) (_2!4675 V!23869)) )
))
(declare-datatypes ((List!15162 0))(
  ( (Nil!15159) (Cons!15158 (h!16287 tuple2!9328) (t!21479 List!15162)) )
))
(declare-datatypes ((ListLongMap!8151 0))(
  ( (ListLongMap!8152 (toList!4091 List!15162)) )
))
(declare-fun lt!364394 () ListLongMap!8151)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((array!44512 0))(
  ( (array!44513 (arr!21316 (Array (_ BitVec 32) (_ BitVec 64))) (size!21737 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44512)

(declare-fun getCurrentListMapNoExtraKeys!2141 (array!44512 array!44510 (_ BitVec 32) (_ BitVec 32) V!23869 V!23869 (_ BitVec 32) Int) ListLongMap!8151)

(assert (=> b!813786 (= lt!364394 (getCurrentListMapNoExtraKeys!2141 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!23869)

(declare-fun lt!364395 () ListLongMap!8151)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!813786 (= lt!364395 (getCurrentListMapNoExtraKeys!2141 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!813787 () Bool)

(assert (=> b!813787 (= e!450991 tp_is_empty!14151)))

(declare-fun b!813788 () Bool)

(declare-fun res!555904 () Bool)

(assert (=> b!813788 (=> (not res!555904) (not e!450992))))

(declare-datatypes ((List!15163 0))(
  ( (Nil!15160) (Cons!15159 (h!16288 (_ BitVec 64)) (t!21480 List!15163)) )
))
(declare-fun arrayNoDuplicates!0 (array!44512 (_ BitVec 32) List!15163) Bool)

(assert (=> b!813788 (= res!555904 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15160))))

(declare-fun mapIsEmpty!22807 () Bool)

(assert (=> mapIsEmpty!22807 mapRes!22807))

(declare-fun b!813789 () Bool)

(declare-fun res!555906 () Bool)

(assert (=> b!813789 (=> (not res!555906) (not e!450992))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44512 (_ BitVec 32)) Bool)

(assert (=> b!813789 (= res!555906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!555905 () Bool)

(assert (=> start!70020 (=> (not res!555905) (not e!450992))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70020 (= res!555905 (validMask!0 mask!1312))))

(assert (=> start!70020 e!450992))

(assert (=> start!70020 tp_is_empty!14151))

(declare-fun array_inv!17067 (array!44512) Bool)

(assert (=> start!70020 (array_inv!17067 _keys!976)))

(assert (=> start!70020 true))

(declare-fun e!450990 () Bool)

(declare-fun array_inv!17068 (array!44510) Bool)

(assert (=> start!70020 (and (array_inv!17068 _values!788) e!450990)))

(assert (=> start!70020 tp!44037))

(declare-fun b!813790 () Bool)

(declare-fun res!555903 () Bool)

(assert (=> b!813790 (=> (not res!555903) (not e!450992))))

(assert (=> b!813790 (= res!555903 (and (= (size!21736 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21737 _keys!976) (size!21736 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!813791 () Bool)

(assert (=> b!813791 (= e!450990 (and e!450993 mapRes!22807))))

(declare-fun condMapEmpty!22807 () Bool)

(declare-fun mapDefault!22807 () ValueCell!6660)

(assert (=> b!813791 (= condMapEmpty!22807 (= (arr!21315 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6660)) mapDefault!22807)))))

(assert (= (and start!70020 res!555905) b!813790))

(assert (= (and b!813790 res!555903) b!813789))

(assert (= (and b!813789 res!555906) b!813788))

(assert (= (and b!813788 res!555904) b!813786))

(assert (= (and b!813791 condMapEmpty!22807) mapIsEmpty!22807))

(assert (= (and b!813791 (not condMapEmpty!22807)) mapNonEmpty!22807))

(get-info :version)

(assert (= (and mapNonEmpty!22807 ((_ is ValueCellFull!6660) mapValue!22807)) b!813787))

(assert (= (and b!813791 ((_ is ValueCellFull!6660) mapDefault!22807)) b!813785))

(assert (= start!70020 b!813791))

(declare-fun m!755733 () Bool)

(assert (=> b!813789 m!755733))

(declare-fun m!755735 () Bool)

(assert (=> b!813786 m!755735))

(declare-fun m!755737 () Bool)

(assert (=> b!813786 m!755737))

(declare-fun m!755739 () Bool)

(assert (=> start!70020 m!755739))

(declare-fun m!755741 () Bool)

(assert (=> start!70020 m!755741))

(declare-fun m!755743 () Bool)

(assert (=> start!70020 m!755743))

(declare-fun m!755745 () Bool)

(assert (=> b!813788 m!755745))

(declare-fun m!755747 () Bool)

(assert (=> mapNonEmpty!22807 m!755747))

(check-sat (not b!813786) tp_is_empty!14151 (not b_next!12441) (not start!70020) (not b!813789) (not b!813788) b_and!21213 (not mapNonEmpty!22807))
(check-sat b_and!21213 (not b_next!12441))
