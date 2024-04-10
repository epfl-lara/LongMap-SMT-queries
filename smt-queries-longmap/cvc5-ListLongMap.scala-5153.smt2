; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69882 () Bool)

(assert start!69882)

(declare-fun b!812502 () Bool)

(declare-fun e!450046 () Bool)

(declare-fun tp_is_empty!14035 () Bool)

(assert (=> b!812502 (= e!450046 tp_is_empty!14035)))

(declare-fun mapIsEmpty!22627 () Bool)

(declare-fun mapRes!22627 () Bool)

(assert (=> mapIsEmpty!22627 mapRes!22627))

(declare-fun b!812503 () Bool)

(declare-fun res!555209 () Bool)

(declare-fun e!450048 () Bool)

(assert (=> b!812503 (=> (not res!555209) (not e!450048))))

(declare-datatypes ((array!44292 0))(
  ( (array!44293 (arr!21208 (Array (_ BitVec 32) (_ BitVec 64))) (size!21629 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44292)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!23715 0))(
  ( (V!23716 (val!7065 Int)) )
))
(declare-datatypes ((ValueCell!6602 0))(
  ( (ValueCellFull!6602 (v!9492 V!23715)) (EmptyCell!6602) )
))
(declare-datatypes ((array!44294 0))(
  ( (array!44295 (arr!21209 (Array (_ BitVec 32) ValueCell!6602)) (size!21630 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44294)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!812503 (= res!555209 (and (= (size!21630 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21629 _keys!976) (size!21630 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!812504 () Bool)

(assert (=> b!812504 (= e!450048 false)))

(declare-fun lt!364149 () Bool)

(declare-datatypes ((List!15099 0))(
  ( (Nil!15096) (Cons!15095 (h!16224 (_ BitVec 64)) (t!21414 List!15099)) )
))
(declare-fun arrayNoDuplicates!0 (array!44292 (_ BitVec 32) List!15099) Bool)

(assert (=> b!812504 (= lt!364149 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15096))))

(declare-fun b!812505 () Bool)

(declare-fun res!555208 () Bool)

(assert (=> b!812505 (=> (not res!555208) (not e!450048))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44292 (_ BitVec 32)) Bool)

(assert (=> b!812505 (= res!555208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!555210 () Bool)

(assert (=> start!69882 (=> (not res!555210) (not e!450048))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69882 (= res!555210 (validMask!0 mask!1312))))

(assert (=> start!69882 e!450048))

(declare-fun array_inv!16991 (array!44292) Bool)

(assert (=> start!69882 (array_inv!16991 _keys!976)))

(assert (=> start!69882 true))

(declare-fun e!450045 () Bool)

(declare-fun array_inv!16992 (array!44294) Bool)

(assert (=> start!69882 (and (array_inv!16992 _values!788) e!450045)))

(declare-fun mapNonEmpty!22627 () Bool)

(declare-fun tp!43735 () Bool)

(assert (=> mapNonEmpty!22627 (= mapRes!22627 (and tp!43735 e!450046))))

(declare-fun mapKey!22627 () (_ BitVec 32))

(declare-fun mapValue!22627 () ValueCell!6602)

(declare-fun mapRest!22627 () (Array (_ BitVec 32) ValueCell!6602))

(assert (=> mapNonEmpty!22627 (= (arr!21209 _values!788) (store mapRest!22627 mapKey!22627 mapValue!22627))))

(declare-fun b!812506 () Bool)

(declare-fun e!450044 () Bool)

(assert (=> b!812506 (= e!450045 (and e!450044 mapRes!22627))))

(declare-fun condMapEmpty!22627 () Bool)

(declare-fun mapDefault!22627 () ValueCell!6602)

