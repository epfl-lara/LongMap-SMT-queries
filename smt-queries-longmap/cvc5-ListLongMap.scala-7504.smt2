; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95104 () Bool)

(assert start!95104)

(declare-fun b_free!22201 () Bool)

(declare-fun b_next!22201 () Bool)

(assert (=> start!95104 (= b_free!22201 (not b_next!22201))))

(declare-fun tp!78085 () Bool)

(declare-fun b_and!35121 () Bool)

(assert (=> start!95104 (= tp!78085 b_and!35121)))

(declare-fun mapNonEmpty!40747 () Bool)

(declare-fun mapRes!40747 () Bool)

(declare-fun tp!78086 () Bool)

(declare-fun e!614405 () Bool)

(assert (=> mapNonEmpty!40747 (= mapRes!40747 (and tp!78086 e!614405))))

(declare-fun mapKey!40747 () (_ BitVec 32))

(declare-datatypes ((V!39817 0))(
  ( (V!39818 (val!13056 Int)) )
))
(declare-datatypes ((ValueCell!12302 0))(
  ( (ValueCellFull!12302 (v!15679 V!39817)) (EmptyCell!12302) )
))
(declare-fun mapRest!40747 () (Array (_ BitVec 32) ValueCell!12302))

(declare-datatypes ((array!68989 0))(
  ( (array!68990 (arr!33182 (Array (_ BitVec 32) ValueCell!12302)) (size!33718 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68989)

(declare-fun mapValue!40747 () ValueCell!12302)

(assert (=> mapNonEmpty!40747 (= (arr!33182 _values!955) (store mapRest!40747 mapKey!40747 mapValue!40747))))

(declare-fun b!1075111 () Bool)

(declare-fun e!614407 () Bool)

(declare-fun tp_is_empty!26011 () Bool)

(assert (=> b!1075111 (= e!614407 tp_is_empty!26011)))

(declare-fun b!1075112 () Bool)

(declare-fun res!716779 () Bool)

(declare-fun e!614409 () Bool)

(assert (=> b!1075112 (=> (not res!716779) (not e!614409))))

(declare-datatypes ((array!68991 0))(
  ( (array!68992 (arr!33183 (Array (_ BitVec 32) (_ BitVec 64))) (size!33719 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68991)

(declare-datatypes ((List!23169 0))(
  ( (Nil!23166) (Cons!23165 (h!24374 (_ BitVec 64)) (t!32518 List!23169)) )
))
(declare-fun arrayNoDuplicates!0 (array!68991 (_ BitVec 32) List!23169) Bool)

(assert (=> b!1075112 (= res!716779 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23166))))

(declare-fun b!1075113 () Bool)

(assert (=> b!1075113 (= e!614405 tp_is_empty!26011)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39817)

(declare-fun b!1075115 () Bool)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39817)

(declare-fun e!614408 () Bool)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((tuple2!16634 0))(
  ( (tuple2!16635 (_1!8328 (_ BitVec 64)) (_2!8328 V!39817)) )
))
(declare-datatypes ((List!23170 0))(
  ( (Nil!23167) (Cons!23166 (h!24375 tuple2!16634) (t!32519 List!23170)) )
))
(declare-datatypes ((ListLongMap!14603 0))(
  ( (ListLongMap!14604 (toList!7317 List!23170)) )
))
(declare-fun contains!6344 (ListLongMap!14603 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4186 (array!68991 array!68989 (_ BitVec 32) (_ BitVec 32) V!39817 V!39817 (_ BitVec 32) Int) ListLongMap!14603)

(assert (=> b!1075115 (= e!614408 (not (contains!6344 (getCurrentListMap!4186 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1075116 () Bool)

(declare-fun res!716781 () Bool)

(assert (=> b!1075116 (=> (not res!716781) (not e!614409))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1075116 (= res!716781 (and (= (size!33718 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33719 _keys!1163) (size!33718 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!40747 () Bool)

(assert (=> mapIsEmpty!40747 mapRes!40747))

(declare-fun b!1075117 () Bool)

(declare-fun res!716780 () Bool)

(assert (=> b!1075117 (=> (not res!716780) (not e!614409))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68991 (_ BitVec 32)) Bool)

(assert (=> b!1075117 (= res!716780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1075118 () Bool)

(declare-fun e!614406 () Bool)

(assert (=> b!1075118 (= e!614406 (and e!614407 mapRes!40747))))

(declare-fun condMapEmpty!40747 () Bool)

(declare-fun mapDefault!40747 () ValueCell!12302)

