; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70136 () Bool)

(assert start!70136)

(declare-fun b_free!12403 () Bool)

(declare-fun b_next!12403 () Bool)

(assert (=> start!70136 (= b_free!12403 (not b_next!12403))))

(declare-fun tp!43921 () Bool)

(declare-fun b_and!21181 () Bool)

(assert (=> start!70136 (= tp!43921 b_and!21181)))

(declare-fun b!814207 () Bool)

(declare-fun res!555994 () Bool)

(declare-fun e!451234 () Bool)

(assert (=> b!814207 (=> (not res!555994) (not e!451234))))

(declare-datatypes ((array!44443 0))(
  ( (array!44444 (arr!21278 (Array (_ BitVec 32) (_ BitVec 64))) (size!21698 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44443)

(declare-datatypes ((List!15045 0))(
  ( (Nil!15042) (Cons!15041 (h!16176 (_ BitVec 64)) (t!21352 List!15045)) )
))
(declare-fun arrayNoDuplicates!0 (array!44443 (_ BitVec 32) List!15045) Bool)

(assert (=> b!814207 (= res!555994 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15042))))

(declare-fun b!814208 () Bool)

(declare-fun res!555996 () Bool)

(assert (=> b!814208 (=> (not res!555996) (not e!451234))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!23819 0))(
  ( (V!23820 (val!7104 Int)) )
))
(declare-datatypes ((ValueCell!6641 0))(
  ( (ValueCellFull!6641 (v!9531 V!23819)) (EmptyCell!6641) )
))
(declare-datatypes ((array!44445 0))(
  ( (array!44446 (arr!21279 (Array (_ BitVec 32) ValueCell!6641)) (size!21699 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44445)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!814208 (= res!555996 (and (= (size!21699 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21698 _keys!976) (size!21699 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!814209 () Bool)

(declare-fun res!555995 () Bool)

(assert (=> b!814209 (=> (not res!555995) (not e!451234))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44443 (_ BitVec 32)) Bool)

(assert (=> b!814209 (= res!555995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!22747 () Bool)

(declare-fun mapRes!22747 () Bool)

(assert (=> mapIsEmpty!22747 mapRes!22747))

(declare-fun b!814210 () Bool)

(declare-fun e!451237 () Bool)

(declare-fun e!451235 () Bool)

(assert (=> b!814210 (= e!451237 (and e!451235 mapRes!22747))))

(declare-fun condMapEmpty!22747 () Bool)

(declare-fun mapDefault!22747 () ValueCell!6641)

(assert (=> b!814210 (= condMapEmpty!22747 (= (arr!21279 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6641)) mapDefault!22747)))))

(declare-fun b!814211 () Bool)

(declare-fun tp_is_empty!14113 () Bool)

(assert (=> b!814211 (= e!451235 tp_is_empty!14113)))

(declare-fun b!814213 () Bool)

(declare-fun e!451238 () Bool)

(assert (=> b!814213 (= e!451238 tp_is_empty!14113)))

(declare-fun mapNonEmpty!22747 () Bool)

(declare-fun tp!43920 () Bool)

(assert (=> mapNonEmpty!22747 (= mapRes!22747 (and tp!43920 e!451238))))

(declare-fun mapKey!22747 () (_ BitVec 32))

(declare-fun mapRest!22747 () (Array (_ BitVec 32) ValueCell!6641))

(declare-fun mapValue!22747 () ValueCell!6641)

(assert (=> mapNonEmpty!22747 (= (arr!21279 _values!788) (store mapRest!22747 mapKey!22747 mapValue!22747))))

(declare-fun b!814212 () Bool)

(assert (=> b!814212 (= e!451234 false)))

(declare-fun zeroValueBefore!34 () V!23819)

(declare-fun minValue!754 () V!23819)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9226 0))(
  ( (tuple2!9227 (_1!4624 (_ BitVec 64)) (_2!4624 V!23819)) )
))
(declare-datatypes ((List!15046 0))(
  ( (Nil!15043) (Cons!15042 (h!16177 tuple2!9226) (t!21353 List!15046)) )
))
(declare-datatypes ((ListLongMap!8051 0))(
  ( (ListLongMap!8052 (toList!4041 List!15046)) )
))
(declare-fun lt!364620 () ListLongMap!8051)

(declare-fun getCurrentListMapNoExtraKeys!2148 (array!44443 array!44445 (_ BitVec 32) (_ BitVec 32) V!23819 V!23819 (_ BitVec 32) Int) ListLongMap!8051)

(assert (=> b!814212 (= lt!364620 (getCurrentListMapNoExtraKeys!2148 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!555997 () Bool)

(assert (=> start!70136 (=> (not res!555997) (not e!451234))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70136 (= res!555997 (validMask!0 mask!1312))))

(assert (=> start!70136 e!451234))

(assert (=> start!70136 tp_is_empty!14113))

(declare-fun array_inv!17093 (array!44443) Bool)

(assert (=> start!70136 (array_inv!17093 _keys!976)))

(assert (=> start!70136 true))

(declare-fun array_inv!17094 (array!44445) Bool)

(assert (=> start!70136 (and (array_inv!17094 _values!788) e!451237)))

(assert (=> start!70136 tp!43921))

(assert (= (and start!70136 res!555997) b!814208))

(assert (= (and b!814208 res!555996) b!814209))

(assert (= (and b!814209 res!555995) b!814207))

(assert (= (and b!814207 res!555994) b!814212))

(assert (= (and b!814210 condMapEmpty!22747) mapIsEmpty!22747))

(assert (= (and b!814210 (not condMapEmpty!22747)) mapNonEmpty!22747))

(get-info :version)

(assert (= (and mapNonEmpty!22747 ((_ is ValueCellFull!6641) mapValue!22747)) b!814213))

(assert (= (and b!814210 ((_ is ValueCellFull!6641) mapDefault!22747)) b!814211))

(assert (= start!70136 b!814210))

(declare-fun m!756679 () Bool)

(assert (=> mapNonEmpty!22747 m!756679))

(declare-fun m!756681 () Bool)

(assert (=> b!814207 m!756681))

(declare-fun m!756683 () Bool)

(assert (=> b!814212 m!756683))

(declare-fun m!756685 () Bool)

(assert (=> start!70136 m!756685))

(declare-fun m!756687 () Bool)

(assert (=> start!70136 m!756687))

(declare-fun m!756689 () Bool)

(assert (=> start!70136 m!756689))

(declare-fun m!756691 () Bool)

(assert (=> b!814209 m!756691))

(check-sat b_and!21181 (not start!70136) tp_is_empty!14113 (not b!814209) (not mapNonEmpty!22747) (not b_next!12403) (not b!814207) (not b!814212))
(check-sat b_and!21181 (not b_next!12403))
