; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70134 () Bool)

(assert start!70134)

(declare-fun b_free!12541 () Bool)

(declare-fun b_next!12541 () Bool)

(assert (=> start!70134 (= b_free!12541 (not b_next!12541))))

(declare-fun tp!44341 () Bool)

(declare-fun b_and!21321 () Bool)

(assert (=> start!70134 (= tp!44341 b_and!21321)))

(declare-fun b!814920 () Bool)

(declare-fun e!451796 () Bool)

(assert (=> b!814920 (= e!451796 (not true))))

(declare-datatypes ((V!24003 0))(
  ( (V!24004 (val!7173 Int)) )
))
(declare-datatypes ((tuple2!9402 0))(
  ( (tuple2!9403 (_1!4712 (_ BitVec 64)) (_2!4712 V!24003)) )
))
(declare-datatypes ((List!15235 0))(
  ( (Nil!15232) (Cons!15231 (h!16360 tuple2!9402) (t!21554 List!15235)) )
))
(declare-datatypes ((ListLongMap!8225 0))(
  ( (ListLongMap!8226 (toList!4128 List!15235)) )
))
(declare-fun lt!364828 () ListLongMap!8225)

(declare-fun lt!364826 () ListLongMap!8225)

(assert (=> b!814920 (= lt!364828 lt!364826)))

(declare-fun zeroValueBefore!34 () V!24003)

(declare-datatypes ((array!44706 0))(
  ( (array!44707 (arr!21412 (Array (_ BitVec 32) (_ BitVec 64))) (size!21833 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44706)

(declare-datatypes ((Unit!27754 0))(
  ( (Unit!27755) )
))
(declare-fun lt!364827 () Unit!27754)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!24003)

(declare-datatypes ((ValueCell!6710 0))(
  ( (ValueCellFull!6710 (v!9600 V!24003)) (EmptyCell!6710) )
))
(declare-datatypes ((array!44708 0))(
  ( (array!44709 (arr!21413 (Array (_ BitVec 32) ValueCell!6710)) (size!21834 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44708)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun zeroValueAfter!34 () V!24003)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!288 (array!44706 array!44708 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24003 V!24003 V!24003 V!24003 (_ BitVec 32) Int) Unit!27754)

(assert (=> b!814920 (= lt!364827 (lemmaNoChangeToArrayThenSameMapNoExtras!288 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2178 (array!44706 array!44708 (_ BitVec 32) (_ BitVec 32) V!24003 V!24003 (_ BitVec 32) Int) ListLongMap!8225)

(assert (=> b!814920 (= lt!364826 (getCurrentListMapNoExtraKeys!2178 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!814920 (= lt!364828 (getCurrentListMapNoExtraKeys!2178 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!556534 () Bool)

(assert (=> start!70134 (=> (not res!556534) (not e!451796))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70134 (= res!556534 (validMask!0 mask!1312))))

(assert (=> start!70134 e!451796))

(declare-fun tp_is_empty!14251 () Bool)

(assert (=> start!70134 tp_is_empty!14251))

(declare-fun array_inv!17131 (array!44706) Bool)

(assert (=> start!70134 (array_inv!17131 _keys!976)))

(assert (=> start!70134 true))

(declare-fun e!451798 () Bool)

(declare-fun array_inv!17132 (array!44708) Bool)

(assert (=> start!70134 (and (array_inv!17132 _values!788) e!451798)))

(assert (=> start!70134 tp!44341))

(declare-fun b!814921 () Bool)

(declare-fun res!556536 () Bool)

(assert (=> b!814921 (=> (not res!556536) (not e!451796))))

(assert (=> b!814921 (= res!556536 (and (= (size!21834 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21833 _keys!976) (size!21834 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!22960 () Bool)

(declare-fun mapRes!22960 () Bool)

(declare-fun tp!44340 () Bool)

(declare-fun e!451797 () Bool)

(assert (=> mapNonEmpty!22960 (= mapRes!22960 (and tp!44340 e!451797))))

(declare-fun mapKey!22960 () (_ BitVec 32))

(declare-fun mapValue!22960 () ValueCell!6710)

(declare-fun mapRest!22960 () (Array (_ BitVec 32) ValueCell!6710))

(assert (=> mapNonEmpty!22960 (= (arr!21413 _values!788) (store mapRest!22960 mapKey!22960 mapValue!22960))))

(declare-fun b!814922 () Bool)

(assert (=> b!814922 (= e!451797 tp_is_empty!14251)))

(declare-fun mapIsEmpty!22960 () Bool)

(assert (=> mapIsEmpty!22960 mapRes!22960))

(declare-fun b!814923 () Bool)

(declare-fun res!556537 () Bool)

(assert (=> b!814923 (=> (not res!556537) (not e!451796))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44706 (_ BitVec 32)) Bool)

(assert (=> b!814923 (= res!556537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!814924 () Bool)

(declare-fun e!451794 () Bool)

(assert (=> b!814924 (= e!451798 (and e!451794 mapRes!22960))))

(declare-fun condMapEmpty!22960 () Bool)

(declare-fun mapDefault!22960 () ValueCell!6710)

