; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70052 () Bool)

(assert start!70052)

(declare-fun b_free!12493 () Bool)

(declare-fun b_next!12493 () Bool)

(assert (=> start!70052 (= b_free!12493 (not b_next!12493))))

(declare-fun tp!44193 () Bool)

(declare-fun b_and!21239 () Bool)

(assert (=> start!70052 (= tp!44193 b_and!21239)))

(declare-fun b!814085 () Bool)

(declare-fun res!556109 () Bool)

(declare-fun e!451230 () Bool)

(assert (=> b!814085 (=> (not res!556109) (not e!451230))))

(declare-datatypes ((array!44605 0))(
  ( (array!44606 (arr!21363 (Array (_ BitVec 32) (_ BitVec 64))) (size!21784 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44605)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!23939 0))(
  ( (V!23940 (val!7149 Int)) )
))
(declare-datatypes ((ValueCell!6686 0))(
  ( (ValueCellFull!6686 (v!9570 V!23939)) (EmptyCell!6686) )
))
(declare-datatypes ((array!44607 0))(
  ( (array!44608 (arr!21364 (Array (_ BitVec 32) ValueCell!6686)) (size!21785 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44607)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(assert (=> b!814085 (= res!556109 (and (= (size!21785 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21784 _keys!976) (size!21785 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!814086 () Bool)

(declare-fun e!451233 () Bool)

(declare-fun tp_is_empty!14203 () Bool)

(assert (=> b!814086 (= e!451233 tp_is_empty!14203)))

(declare-fun b!814087 () Bool)

(assert (=> b!814087 (= e!451230 (not true))))

(declare-datatypes ((tuple2!9400 0))(
  ( (tuple2!9401 (_1!4711 (_ BitVec 64)) (_2!4711 V!23939)) )
))
(declare-datatypes ((List!15227 0))(
  ( (Nil!15224) (Cons!15223 (h!16352 tuple2!9400) (t!21535 List!15227)) )
))
(declare-datatypes ((ListLongMap!8213 0))(
  ( (ListLongMap!8214 (toList!4122 List!15227)) )
))
(declare-fun lt!364328 () ListLongMap!8213)

(declare-fun lt!364327 () ListLongMap!8213)

(assert (=> b!814087 (= lt!364328 lt!364327)))

(declare-fun zeroValueBefore!34 () V!23939)

(declare-fun zeroValueAfter!34 () V!23939)

(declare-fun minValue!754 () V!23939)

(declare-datatypes ((Unit!27678 0))(
  ( (Unit!27679) )
))
(declare-fun lt!364329 () Unit!27678)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!280 (array!44605 array!44607 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!23939 V!23939 V!23939 V!23939 (_ BitVec 32) Int) Unit!27678)

(assert (=> b!814087 (= lt!364329 (lemmaNoChangeToArrayThenSameMapNoExtras!280 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2187 (array!44605 array!44607 (_ BitVec 32) (_ BitVec 32) V!23939 V!23939 (_ BitVec 32) Int) ListLongMap!8213)

(assert (=> b!814087 (= lt!364327 (getCurrentListMapNoExtraKeys!2187 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!814087 (= lt!364328 (getCurrentListMapNoExtraKeys!2187 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!556110 () Bool)

(assert (=> start!70052 (=> (not res!556110) (not e!451230))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70052 (= res!556110 (validMask!0 mask!1312))))

(assert (=> start!70052 e!451230))

(assert (=> start!70052 tp_is_empty!14203))

(declare-fun array_inv!17179 (array!44605) Bool)

(assert (=> start!70052 (array_inv!17179 _keys!976)))

(assert (=> start!70052 true))

(declare-fun e!451232 () Bool)

(declare-fun array_inv!17180 (array!44607) Bool)

(assert (=> start!70052 (and (array_inv!17180 _values!788) e!451232)))

(assert (=> start!70052 tp!44193))

(declare-fun mapIsEmpty!22885 () Bool)

(declare-fun mapRes!22885 () Bool)

(assert (=> mapIsEmpty!22885 mapRes!22885))

(declare-fun mapNonEmpty!22885 () Bool)

(declare-fun tp!44194 () Bool)

(assert (=> mapNonEmpty!22885 (= mapRes!22885 (and tp!44194 e!451233))))

(declare-fun mapRest!22885 () (Array (_ BitVec 32) ValueCell!6686))

(declare-fun mapKey!22885 () (_ BitVec 32))

(declare-fun mapValue!22885 () ValueCell!6686)

(assert (=> mapNonEmpty!22885 (= (arr!21364 _values!788) (store mapRest!22885 mapKey!22885 mapValue!22885))))

(declare-fun b!814088 () Bool)

(declare-fun res!556111 () Bool)

(assert (=> b!814088 (=> (not res!556111) (not e!451230))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44605 (_ BitVec 32)) Bool)

(assert (=> b!814088 (= res!556111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!814089 () Bool)

(declare-fun e!451231 () Bool)

(assert (=> b!814089 (= e!451232 (and e!451231 mapRes!22885))))

(declare-fun condMapEmpty!22885 () Bool)

(declare-fun mapDefault!22885 () ValueCell!6686)

(assert (=> b!814089 (= condMapEmpty!22885 (= (arr!21364 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6686)) mapDefault!22885)))))

(declare-fun b!814090 () Bool)

(assert (=> b!814090 (= e!451231 tp_is_empty!14203)))

(declare-fun b!814091 () Bool)

(declare-fun res!556112 () Bool)

(assert (=> b!814091 (=> (not res!556112) (not e!451230))))

(declare-datatypes ((List!15228 0))(
  ( (Nil!15225) (Cons!15224 (h!16353 (_ BitVec 64)) (t!21536 List!15228)) )
))
(declare-fun arrayNoDuplicates!0 (array!44605 (_ BitVec 32) List!15228) Bool)

(assert (=> b!814091 (= res!556112 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15225))))

(assert (= (and start!70052 res!556110) b!814085))

(assert (= (and b!814085 res!556109) b!814088))

(assert (= (and b!814088 res!556111) b!814091))

(assert (= (and b!814091 res!556112) b!814087))

(assert (= (and b!814089 condMapEmpty!22885) mapIsEmpty!22885))

(assert (= (and b!814089 (not condMapEmpty!22885)) mapNonEmpty!22885))

(get-info :version)

(assert (= (and mapNonEmpty!22885 ((_ is ValueCellFull!6686) mapValue!22885)) b!814086))

(assert (= (and b!814089 ((_ is ValueCellFull!6686) mapDefault!22885)) b!814090))

(assert (= start!70052 b!814089))

(declare-fun m!755409 () Bool)

(assert (=> b!814091 m!755409))

(declare-fun m!755411 () Bool)

(assert (=> mapNonEmpty!22885 m!755411))

(declare-fun m!755413 () Bool)

(assert (=> b!814087 m!755413))

(declare-fun m!755415 () Bool)

(assert (=> b!814087 m!755415))

(declare-fun m!755417 () Bool)

(assert (=> b!814087 m!755417))

(declare-fun m!755419 () Bool)

(assert (=> start!70052 m!755419))

(declare-fun m!755421 () Bool)

(assert (=> start!70052 m!755421))

(declare-fun m!755423 () Bool)

(assert (=> start!70052 m!755423))

(declare-fun m!755425 () Bool)

(assert (=> b!814088 m!755425))

(check-sat (not b!814091) (not b!814088) (not start!70052) (not b_next!12493) (not b!814087) tp_is_empty!14203 (not mapNonEmpty!22885) b_and!21239)
(check-sat b_and!21239 (not b_next!12493))
