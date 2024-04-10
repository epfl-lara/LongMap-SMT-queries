; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94530 () Bool)

(assert start!94530)

(declare-fun b_free!21835 () Bool)

(declare-fun b_next!21835 () Bool)

(assert (=> start!94530 (= b_free!21835 (not b_next!21835))))

(declare-fun tp!76955 () Bool)

(declare-fun b_and!34637 () Bool)

(assert (=> start!94530 (= tp!76955 b_and!34637)))

(declare-fun b!1068930 () Bool)

(declare-fun e!609955 () Bool)

(declare-fun tp_is_empty!25645 () Bool)

(assert (=> b!1068930 (= e!609955 tp_is_empty!25645)))

(declare-fun b!1068931 () Bool)

(declare-fun e!609951 () Bool)

(assert (=> b!1068931 (= e!609951 tp_is_empty!25645)))

(declare-fun mapIsEmpty!40165 () Bool)

(declare-fun mapRes!40165 () Bool)

(assert (=> mapIsEmpty!40165 mapRes!40165))

(declare-fun b!1068932 () Bool)

(declare-fun res!713263 () Bool)

(declare-fun e!609950 () Bool)

(assert (=> b!1068932 (=> (not res!713263) (not e!609950))))

(declare-datatypes ((array!68267 0))(
  ( (array!68268 (arr!32832 (Array (_ BitVec 32) (_ BitVec 64))) (size!33368 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68267)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68267 (_ BitVec 32)) Bool)

(assert (=> b!1068932 (= res!713263 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1068933 () Bool)

(declare-fun e!609952 () Bool)

(declare-fun e!609954 () Bool)

(assert (=> b!1068933 (= e!609952 e!609954)))

(declare-fun res!713259 () Bool)

(assert (=> b!1068933 (=> res!713259 e!609954)))

(declare-datatypes ((V!39329 0))(
  ( (V!39330 (val!12873 Int)) )
))
(declare-datatypes ((tuple2!16356 0))(
  ( (tuple2!16357 (_1!8189 (_ BitVec 64)) (_2!8189 V!39329)) )
))
(declare-datatypes ((List!22904 0))(
  ( (Nil!22901) (Cons!22900 (h!24109 tuple2!16356) (t!32231 List!22904)) )
))
(declare-datatypes ((ListLongMap!14325 0))(
  ( (ListLongMap!14326 (toList!7178 List!22904)) )
))
(declare-fun lt!472301 () ListLongMap!14325)

(declare-fun contains!6306 (ListLongMap!14325 (_ BitVec 64)) Bool)

(assert (=> b!1068933 (= res!713259 (contains!6306 lt!472301 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((ValueCell!12119 0))(
  ( (ValueCellFull!12119 (v!15488 V!39329)) (EmptyCell!12119) )
))
(declare-datatypes ((array!68269 0))(
  ( (array!68270 (arr!32833 (Array (_ BitVec 32) ValueCell!12119)) (size!33369 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68269)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39329)

(declare-fun zeroValueBefore!47 () V!39329)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!4102 (array!68267 array!68269 (_ BitVec 32) (_ BitVec 32) V!39329 V!39329 (_ BitVec 32) Int) ListLongMap!14325)

(assert (=> b!1068933 (= lt!472301 (getCurrentListMap!4102 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40165 () Bool)

(declare-fun tp!76954 () Bool)

(assert (=> mapNonEmpty!40165 (= mapRes!40165 (and tp!76954 e!609955))))

(declare-fun mapValue!40165 () ValueCell!12119)

(declare-fun mapKey!40165 () (_ BitVec 32))

(declare-fun mapRest!40165 () (Array (_ BitVec 32) ValueCell!12119))

(assert (=> mapNonEmpty!40165 (= (arr!32833 _values!955) (store mapRest!40165 mapKey!40165 mapValue!40165))))

(declare-fun res!713262 () Bool)

(assert (=> start!94530 (=> (not res!713262) (not e!609950))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94530 (= res!713262 (validMask!0 mask!1515))))

(assert (=> start!94530 e!609950))

(assert (=> start!94530 true))

(assert (=> start!94530 tp_is_empty!25645))

(declare-fun e!609953 () Bool)

(declare-fun array_inv!25412 (array!68269) Bool)

(assert (=> start!94530 (and (array_inv!25412 _values!955) e!609953)))

(assert (=> start!94530 tp!76955))

(declare-fun array_inv!25413 (array!68267) Bool)

(assert (=> start!94530 (array_inv!25413 _keys!1163)))

(declare-fun b!1068934 () Bool)

(assert (=> b!1068934 (= e!609953 (and e!609951 mapRes!40165))))

(declare-fun condMapEmpty!40165 () Bool)

(declare-fun mapDefault!40165 () ValueCell!12119)

