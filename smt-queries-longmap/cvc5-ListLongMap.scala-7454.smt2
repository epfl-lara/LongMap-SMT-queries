; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94618 () Bool)

(assert start!94618)

(declare-fun b_free!21901 () Bool)

(declare-fun b_next!21901 () Bool)

(assert (=> start!94618 (= b_free!21901 (not b_next!21901))))

(declare-fun tp!77155 () Bool)

(declare-fun b_and!34713 () Bool)

(assert (=> start!94618 (= tp!77155 b_and!34713)))

(declare-fun res!713783 () Bool)

(declare-fun e!610615 () Bool)

(assert (=> start!94618 (=> (not res!713783) (not e!610615))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94618 (= res!713783 (validMask!0 mask!1515))))

(assert (=> start!94618 e!610615))

(assert (=> start!94618 true))

(declare-fun tp_is_empty!25711 () Bool)

(assert (=> start!94618 tp_is_empty!25711))

(declare-datatypes ((V!39417 0))(
  ( (V!39418 (val!12906 Int)) )
))
(declare-datatypes ((ValueCell!12152 0))(
  ( (ValueCellFull!12152 (v!15522 V!39417)) (EmptyCell!12152) )
))
(declare-datatypes ((array!68399 0))(
  ( (array!68400 (arr!32897 (Array (_ BitVec 32) ValueCell!12152)) (size!33433 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68399)

(declare-fun e!610613 () Bool)

(declare-fun array_inv!25452 (array!68399) Bool)

(assert (=> start!94618 (and (array_inv!25452 _values!955) e!610613)))

(assert (=> start!94618 tp!77155))

(declare-datatypes ((array!68401 0))(
  ( (array!68402 (arr!32898 (Array (_ BitVec 32) (_ BitVec 64))) (size!33434 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68401)

(declare-fun array_inv!25453 (array!68401) Bool)

(assert (=> start!94618 (array_inv!25453 _keys!1163)))

(declare-fun b!1069848 () Bool)

(declare-fun res!713784 () Bool)

(assert (=> b!1069848 (=> (not res!713784) (not e!610615))))

(declare-datatypes ((List!22948 0))(
  ( (Nil!22945) (Cons!22944 (h!24153 (_ BitVec 64)) (t!32277 List!22948)) )
))
(declare-fun arrayNoDuplicates!0 (array!68401 (_ BitVec 32) List!22948) Bool)

(assert (=> b!1069848 (= res!713784 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22945))))

(declare-fun mapIsEmpty!40267 () Bool)

(declare-fun mapRes!40267 () Bool)

(assert (=> mapIsEmpty!40267 mapRes!40267))

(declare-fun mapNonEmpty!40267 () Bool)

(declare-fun tp!77156 () Bool)

(declare-fun e!610614 () Bool)

(assert (=> mapNonEmpty!40267 (= mapRes!40267 (and tp!77156 e!610614))))

(declare-fun mapKey!40267 () (_ BitVec 32))

(declare-fun mapValue!40267 () ValueCell!12152)

(declare-fun mapRest!40267 () (Array (_ BitVec 32) ValueCell!12152))

(assert (=> mapNonEmpty!40267 (= (arr!32897 _values!955) (store mapRest!40267 mapKey!40267 mapValue!40267))))

(declare-fun b!1069849 () Bool)

(declare-fun e!610616 () Bool)

(assert (=> b!1069849 (= e!610616 tp_is_empty!25711)))

(declare-fun b!1069850 () Bool)

(declare-fun res!713786 () Bool)

(assert (=> b!1069850 (=> (not res!713786) (not e!610615))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68401 (_ BitVec 32)) Bool)

(assert (=> b!1069850 (= res!713786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1069851 () Bool)

(assert (=> b!1069851 (= e!610615 (not true))))

(declare-datatypes ((tuple2!16404 0))(
  ( (tuple2!16405 (_1!8213 (_ BitVec 64)) (_2!8213 V!39417)) )
))
(declare-datatypes ((List!22949 0))(
  ( (Nil!22946) (Cons!22945 (h!24154 tuple2!16404) (t!32278 List!22949)) )
))
(declare-datatypes ((ListLongMap!14373 0))(
  ( (ListLongMap!14374 (toList!7202 List!22949)) )
))
(declare-fun lt!472786 () ListLongMap!14373)

(declare-fun lt!472788 () ListLongMap!14373)

(assert (=> b!1069851 (= lt!472786 lt!472788)))

(declare-fun zeroValueBefore!47 () V!39417)

(declare-datatypes ((Unit!35203 0))(
  ( (Unit!35204) )
))
(declare-fun lt!472787 () Unit!35203)

(declare-fun minValue!907 () V!39417)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39417)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!815 (array!68401 array!68399 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39417 V!39417 V!39417 V!39417 (_ BitVec 32) Int) Unit!35203)

(assert (=> b!1069851 (= lt!472787 (lemmaNoChangeToArrayThenSameMapNoExtras!815 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3778 (array!68401 array!68399 (_ BitVec 32) (_ BitVec 32) V!39417 V!39417 (_ BitVec 32) Int) ListLongMap!14373)

(assert (=> b!1069851 (= lt!472788 (getCurrentListMapNoExtraKeys!3778 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069851 (= lt!472786 (getCurrentListMapNoExtraKeys!3778 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069852 () Bool)

(assert (=> b!1069852 (= e!610613 (and e!610616 mapRes!40267))))

(declare-fun condMapEmpty!40267 () Bool)

(declare-fun mapDefault!40267 () ValueCell!12152)

