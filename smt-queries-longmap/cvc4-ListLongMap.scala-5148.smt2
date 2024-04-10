; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69834 () Bool)

(assert start!69834)

(declare-fun b!812180 () Bool)

(declare-fun res!555034 () Bool)

(declare-fun e!449790 () Bool)

(assert (=> b!812180 (=> (not res!555034) (not e!449790))))

(declare-datatypes ((array!44242 0))(
  ( (array!44243 (arr!21185 (Array (_ BitVec 32) (_ BitVec 64))) (size!21606 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44242)

(assert (=> b!812180 (= res!555034 (and (bvsle #b00000000000000000000000000000000 (size!21606 _keys!976)) (bvslt (size!21606 _keys!976) #b01111111111111111111111111111111)))))

(declare-fun b!812181 () Bool)

(declare-datatypes ((List!15091 0))(
  ( (Nil!15088) (Cons!15087 (h!16216 (_ BitVec 64)) (t!21406 List!15091)) )
))
(declare-fun noDuplicate!1292 (List!15091) Bool)

(assert (=> b!812181 (= e!449790 (not (noDuplicate!1292 Nil!15088)))))

(declare-fun res!555032 () Bool)

(assert (=> start!69834 (=> (not res!555032) (not e!449790))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69834 (= res!555032 (validMask!0 mask!1312))))

(assert (=> start!69834 e!449790))

(declare-fun array_inv!16975 (array!44242) Bool)

(assert (=> start!69834 (array_inv!16975 _keys!976)))

(assert (=> start!69834 true))

(declare-datatypes ((V!23679 0))(
  ( (V!23680 (val!7052 Int)) )
))
(declare-datatypes ((ValueCell!6589 0))(
  ( (ValueCellFull!6589 (v!9478 V!23679)) (EmptyCell!6589) )
))
(declare-datatypes ((array!44244 0))(
  ( (array!44245 (arr!21186 (Array (_ BitVec 32) ValueCell!6589)) (size!21607 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44244)

(declare-fun e!449792 () Bool)

(declare-fun array_inv!16976 (array!44244) Bool)

(assert (=> start!69834 (and (array_inv!16976 _values!788) e!449792)))

(declare-fun mapIsEmpty!22582 () Bool)

(declare-fun mapRes!22582 () Bool)

(assert (=> mapIsEmpty!22582 mapRes!22582))

(declare-fun b!812182 () Bool)

(declare-fun res!555031 () Bool)

(assert (=> b!812182 (=> (not res!555031) (not e!449790))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!812182 (= res!555031 (and (= (size!21607 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21606 _keys!976) (size!21607 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!812183 () Bool)

(declare-fun res!555033 () Bool)

(assert (=> b!812183 (=> (not res!555033) (not e!449790))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44242 (_ BitVec 32)) Bool)

(assert (=> b!812183 (= res!555033 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!812184 () Bool)

(declare-fun e!449793 () Bool)

(declare-fun tp_is_empty!14009 () Bool)

(assert (=> b!812184 (= e!449793 tp_is_empty!14009)))

(declare-fun mapNonEmpty!22582 () Bool)

(declare-fun tp!43690 () Bool)

(assert (=> mapNonEmpty!22582 (= mapRes!22582 (and tp!43690 e!449793))))

(declare-fun mapValue!22582 () ValueCell!6589)

(declare-fun mapRest!22582 () (Array (_ BitVec 32) ValueCell!6589))

(declare-fun mapKey!22582 () (_ BitVec 32))

(assert (=> mapNonEmpty!22582 (= (arr!21186 _values!788) (store mapRest!22582 mapKey!22582 mapValue!22582))))

(declare-fun b!812185 () Bool)

(declare-fun e!449794 () Bool)

(assert (=> b!812185 (= e!449792 (and e!449794 mapRes!22582))))

(declare-fun condMapEmpty!22582 () Bool)

(declare-fun mapDefault!22582 () ValueCell!6589)

