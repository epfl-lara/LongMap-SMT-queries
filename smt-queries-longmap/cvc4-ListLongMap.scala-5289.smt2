; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70928 () Bool)

(assert start!70928)

(declare-fun b_free!13145 () Bool)

(declare-fun b_next!13145 () Bool)

(assert (=> start!70928 (= b_free!13145 (not b_next!13145))))

(declare-fun tp!46186 () Bool)

(declare-fun b_and!22041 () Bool)

(assert (=> start!70928 (= tp!46186 b_and!22041)))

(declare-fun b!823759 () Bool)

(declare-fun e!458199 () Bool)

(declare-fun tp_is_empty!14855 () Bool)

(assert (=> b!823759 (= e!458199 tp_is_empty!14855)))

(declare-fun b!823761 () Bool)

(declare-fun res!561704 () Bool)

(declare-fun e!458200 () Bool)

(assert (=> b!823761 (=> (not res!561704) (not e!458200))))

(declare-datatypes ((array!45900 0))(
  ( (array!45901 (arr!21998 (Array (_ BitVec 32) (_ BitVec 64))) (size!22419 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45900)

(declare-datatypes ((List!15697 0))(
  ( (Nil!15694) (Cons!15693 (h!16822 (_ BitVec 64)) (t!22038 List!15697)) )
))
(declare-fun arrayNoDuplicates!0 (array!45900 (_ BitVec 32) List!15697) Bool)

(assert (=> b!823761 (= res!561704 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15694))))

(declare-fun mapIsEmpty!23899 () Bool)

(declare-fun mapRes!23899 () Bool)

(assert (=> mapIsEmpty!23899 mapRes!23899))

(declare-fun b!823762 () Bool)

(declare-fun res!561702 () Bool)

(assert (=> b!823762 (=> (not res!561702) (not e!458200))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45900 (_ BitVec 32)) Bool)

(assert (=> b!823762 (= res!561702 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!23899 () Bool)

(declare-fun tp!46185 () Bool)

(declare-fun e!458203 () Bool)

(assert (=> mapNonEmpty!23899 (= mapRes!23899 (and tp!46185 e!458203))))

(declare-fun mapKey!23899 () (_ BitVec 32))

(declare-datatypes ((V!24807 0))(
  ( (V!24808 (val!7475 Int)) )
))
(declare-datatypes ((ValueCell!7012 0))(
  ( (ValueCellFull!7012 (v!9908 V!24807)) (EmptyCell!7012) )
))
(declare-fun mapValue!23899 () ValueCell!7012)

(declare-datatypes ((array!45902 0))(
  ( (array!45903 (arr!21999 (Array (_ BitVec 32) ValueCell!7012)) (size!22420 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45902)

(declare-fun mapRest!23899 () (Array (_ BitVec 32) ValueCell!7012))

(assert (=> mapNonEmpty!23899 (= (arr!21999 _values!788) (store mapRest!23899 mapKey!23899 mapValue!23899))))

(declare-fun b!823763 () Bool)

(declare-fun res!561701 () Bool)

(assert (=> b!823763 (=> (not res!561701) (not e!458200))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!823763 (= res!561701 (and (= (size!22420 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22419 _keys!976) (size!22420 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!823760 () Bool)

(assert (=> b!823760 (= e!458203 tp_is_empty!14855)))

(declare-fun res!561703 () Bool)

(assert (=> start!70928 (=> (not res!561703) (not e!458200))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70928 (= res!561703 (validMask!0 mask!1312))))

(assert (=> start!70928 e!458200))

(assert (=> start!70928 tp_is_empty!14855))

(declare-fun array_inv!17557 (array!45900) Bool)

(assert (=> start!70928 (array_inv!17557 _keys!976)))

(assert (=> start!70928 true))

(declare-fun e!458202 () Bool)

(declare-fun array_inv!17558 (array!45902) Bool)

(assert (=> start!70928 (and (array_inv!17558 _values!788) e!458202)))

(assert (=> start!70928 tp!46186))

(declare-fun b!823764 () Bool)

(assert (=> b!823764 (= e!458202 (and e!458199 mapRes!23899))))

(declare-fun condMapEmpty!23899 () Bool)

(declare-fun mapDefault!23899 () ValueCell!7012)

