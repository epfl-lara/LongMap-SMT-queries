; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94990 () Bool)

(assert start!94990)

(declare-fun b_free!22165 () Bool)

(declare-fun b_next!22165 () Bool)

(assert (=> start!94990 (= b_free!22165 (not b_next!22165))))

(declare-fun tp!77966 () Bool)

(declare-fun b_and!35037 () Bool)

(assert (=> start!94990 (= tp!77966 b_and!35037)))

(declare-fun res!716186 () Bool)

(declare-fun e!613598 () Bool)

(assert (=> start!94990 (=> (not res!716186) (not e!613598))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94990 (= res!716186 (validMask!0 mask!1515))))

(assert (=> start!94990 e!613598))

(assert (=> start!94990 true))

(declare-fun tp_is_empty!25975 () Bool)

(assert (=> start!94990 tp_is_empty!25975))

(declare-datatypes ((V!39769 0))(
  ( (V!39770 (val!13038 Int)) )
))
(declare-datatypes ((ValueCell!12284 0))(
  ( (ValueCellFull!12284 (v!15657 V!39769)) (EmptyCell!12284) )
))
(declare-datatypes ((array!68913 0))(
  ( (array!68914 (arr!33148 (Array (_ BitVec 32) ValueCell!12284)) (size!33684 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68913)

(declare-fun e!613597 () Bool)

(declare-fun array_inv!25618 (array!68913) Bool)

(assert (=> start!94990 (and (array_inv!25618 _values!955) e!613597)))

(assert (=> start!94990 tp!77966))

(declare-datatypes ((array!68915 0))(
  ( (array!68916 (arr!33149 (Array (_ BitVec 32) (_ BitVec 64))) (size!33685 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68915)

(declare-fun array_inv!25619 (array!68915) Bool)

(assert (=> start!94990 (array_inv!25619 _keys!1163)))

(declare-fun b!1073933 () Bool)

(declare-fun e!613599 () Bool)

(declare-fun e!613600 () Bool)

(assert (=> b!1073933 (= e!613599 e!613600)))

(declare-fun res!716185 () Bool)

(assert (=> b!1073933 (=> res!716185 e!613600)))

(declare-datatypes ((tuple2!16604 0))(
  ( (tuple2!16605 (_1!8313 (_ BitVec 64)) (_2!8313 V!39769)) )
))
(declare-datatypes ((List!23141 0))(
  ( (Nil!23138) (Cons!23137 (h!24346 tuple2!16604) (t!32482 List!23141)) )
))
(declare-datatypes ((ListLongMap!14573 0))(
  ( (ListLongMap!14574 (toList!7302 List!23141)) )
))
(declare-fun lt!476292 () ListLongMap!14573)

(declare-fun contains!6332 (ListLongMap!14573 (_ BitVec 64)) Bool)

(assert (=> b!1073933 (= res!716185 (contains!6332 lt!476292 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39769)

(declare-fun zeroValueBefore!47 () V!39769)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!4173 (array!68915 array!68913 (_ BitVec 32) (_ BitVec 32) V!39769 V!39769 (_ BitVec 32) Int) ListLongMap!14573)

(assert (=> b!1073933 (= lt!476292 (getCurrentListMap!4173 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1073934 () Bool)

(declare-fun e!613603 () Bool)

(assert (=> b!1073934 (= e!613603 tp_is_empty!25975)))

(declare-fun b!1073935 () Bool)

(declare-fun res!716182 () Bool)

(assert (=> b!1073935 (=> (not res!716182) (not e!613598))))

(declare-datatypes ((List!23142 0))(
  ( (Nil!23139) (Cons!23138 (h!24347 (_ BitVec 64)) (t!32483 List!23142)) )
))
(declare-fun arrayNoDuplicates!0 (array!68915 (_ BitVec 32) List!23142) Bool)

(assert (=> b!1073935 (= res!716182 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23139))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun lt!476290 () ListLongMap!14573)

(declare-fun b!1073936 () Bool)

(declare-fun zeroValueAfter!47 () V!39769)

(assert (=> b!1073936 (= e!613600 (= lt!476290 (getCurrentListMap!4173 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963)))))

(assert (=> b!1073936 (= lt!476290 lt!476292)))

(declare-fun -!706 (ListLongMap!14573 (_ BitVec 64)) ListLongMap!14573)

(assert (=> b!1073936 (= lt!476290 (-!706 lt!476292 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!35362 0))(
  ( (Unit!35363) )
))
(declare-fun lt!476288 () Unit!35362)

(declare-fun removeNotPresentStillSame!78 (ListLongMap!14573 (_ BitVec 64)) Unit!35362)

(assert (=> b!1073936 (= lt!476288 (removeNotPresentStillSame!78 lt!476292 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1073937 () Bool)

(declare-fun mapRes!40681 () Bool)

(assert (=> b!1073937 (= e!613597 (and e!613603 mapRes!40681))))

(declare-fun condMapEmpty!40681 () Bool)

(declare-fun mapDefault!40681 () ValueCell!12284)

