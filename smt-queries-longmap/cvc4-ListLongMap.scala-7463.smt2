; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94690 () Bool)

(assert start!94690)

(declare-fun b_free!21959 () Bool)

(declare-fun b_next!21959 () Bool)

(assert (=> start!94690 (= b_free!21959 (not b_next!21959))))

(declare-fun tp!77332 () Bool)

(declare-fun b_and!34779 () Bool)

(assert (=> start!94690 (= tp!77332 b_and!34779)))

(declare-fun b!1070613 () Bool)

(declare-fun res!714234 () Bool)

(declare-fun e!611175 () Bool)

(assert (=> b!1070613 (=> (not res!714234) (not e!611175))))

(declare-datatypes ((array!68513 0))(
  ( (array!68514 (arr!32953 (Array (_ BitVec 32) (_ BitVec 64))) (size!33489 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68513)

(declare-datatypes ((List!22996 0))(
  ( (Nil!22993) (Cons!22992 (h!24201 (_ BitVec 64)) (t!32327 List!22996)) )
))
(declare-fun arrayNoDuplicates!0 (array!68513 (_ BitVec 32) List!22996) Bool)

(assert (=> b!1070613 (= res!714234 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22993))))

(declare-fun res!714235 () Bool)

(assert (=> start!94690 (=> (not res!714235) (not e!611175))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94690 (= res!714235 (validMask!0 mask!1515))))

(assert (=> start!94690 e!611175))

(assert (=> start!94690 true))

(declare-fun tp_is_empty!25769 () Bool)

(assert (=> start!94690 tp_is_empty!25769))

(declare-datatypes ((V!39493 0))(
  ( (V!39494 (val!12935 Int)) )
))
(declare-datatypes ((ValueCell!12181 0))(
  ( (ValueCellFull!12181 (v!15551 V!39493)) (EmptyCell!12181) )
))
(declare-datatypes ((array!68515 0))(
  ( (array!68516 (arr!32954 (Array (_ BitVec 32) ValueCell!12181)) (size!33490 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68515)

(declare-fun e!611176 () Bool)

(declare-fun array_inv!25488 (array!68515) Bool)

(assert (=> start!94690 (and (array_inv!25488 _values!955) e!611176)))

(assert (=> start!94690 tp!77332))

(declare-fun array_inv!25489 (array!68513) Bool)

(assert (=> start!94690 (array_inv!25489 _keys!1163)))

(declare-fun b!1070614 () Bool)

(declare-fun e!611179 () Bool)

(assert (=> b!1070614 (= e!611179 true)))

(declare-fun zeroValueBefore!47 () V!39493)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39493)

(declare-datatypes ((tuple2!16452 0))(
  ( (tuple2!16453 (_1!8237 (_ BitVec 64)) (_2!8237 V!39493)) )
))
(declare-datatypes ((List!22997 0))(
  ( (Nil!22994) (Cons!22993 (h!24202 tuple2!16452) (t!32328 List!22997)) )
))
(declare-datatypes ((ListLongMap!14421 0))(
  ( (ListLongMap!14422 (toList!7226 List!22997)) )
))
(declare-fun lt!473161 () ListLongMap!14421)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!4129 (array!68513 array!68515 (_ BitVec 32) (_ BitVec 32) V!39493 V!39493 (_ BitVec 32) Int) ListLongMap!14421)

(assert (=> b!1070614 (= lt!473161 (getCurrentListMap!4129 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40357 () Bool)

(declare-fun mapRes!40357 () Bool)

(assert (=> mapIsEmpty!40357 mapRes!40357))

(declare-fun b!1070615 () Bool)

(declare-fun res!714233 () Bool)

(assert (=> b!1070615 (=> (not res!714233) (not e!611175))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1070615 (= res!714233 (and (= (size!33490 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33489 _keys!1163) (size!33490 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1070616 () Bool)

(declare-fun e!611177 () Bool)

(assert (=> b!1070616 (= e!611177 tp_is_empty!25769)))

(declare-fun b!1070617 () Bool)

(declare-fun res!714236 () Bool)

(assert (=> b!1070617 (=> (not res!714236) (not e!611175))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68513 (_ BitVec 32)) Bool)

(assert (=> b!1070617 (= res!714236 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!40357 () Bool)

(declare-fun tp!77333 () Bool)

(assert (=> mapNonEmpty!40357 (= mapRes!40357 (and tp!77333 e!611177))))

(declare-fun mapKey!40357 () (_ BitVec 32))

(declare-fun mapValue!40357 () ValueCell!12181)

(declare-fun mapRest!40357 () (Array (_ BitVec 32) ValueCell!12181))

(assert (=> mapNonEmpty!40357 (= (arr!32954 _values!955) (store mapRest!40357 mapKey!40357 mapValue!40357))))

(declare-fun b!1070618 () Bool)

(declare-fun e!611174 () Bool)

(assert (=> b!1070618 (= e!611174 tp_is_empty!25769)))

(declare-fun b!1070619 () Bool)

(assert (=> b!1070619 (= e!611176 (and e!611174 mapRes!40357))))

(declare-fun condMapEmpty!40357 () Bool)

(declare-fun mapDefault!40357 () ValueCell!12181)

