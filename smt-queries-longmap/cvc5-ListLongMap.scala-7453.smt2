; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94612 () Bool)

(assert start!94612)

(declare-fun b_free!21895 () Bool)

(declare-fun b_next!21895 () Bool)

(assert (=> start!94612 (= b_free!21895 (not b_next!21895))))

(declare-fun tp!77137 () Bool)

(declare-fun b_and!34707 () Bool)

(assert (=> start!94612 (= tp!77137 b_and!34707)))

(declare-fun b!1069785 () Bool)

(declare-fun e!610569 () Bool)

(declare-fun tp_is_empty!25705 () Bool)

(assert (=> b!1069785 (= e!610569 tp_is_empty!25705)))

(declare-fun b!1069786 () Bool)

(declare-fun e!610571 () Bool)

(assert (=> b!1069786 (= e!610571 (not true))))

(declare-datatypes ((V!39409 0))(
  ( (V!39410 (val!12903 Int)) )
))
(declare-datatypes ((tuple2!16400 0))(
  ( (tuple2!16401 (_1!8211 (_ BitVec 64)) (_2!8211 V!39409)) )
))
(declare-datatypes ((List!22944 0))(
  ( (Nil!22941) (Cons!22940 (h!24149 tuple2!16400) (t!32273 List!22944)) )
))
(declare-datatypes ((ListLongMap!14369 0))(
  ( (ListLongMap!14370 (toList!7200 List!22944)) )
))
(declare-fun lt!472761 () ListLongMap!14369)

(declare-fun lt!472759 () ListLongMap!14369)

(assert (=> b!1069786 (= lt!472761 lt!472759)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39409)

(declare-datatypes ((ValueCell!12149 0))(
  ( (ValueCellFull!12149 (v!15519 V!39409)) (EmptyCell!12149) )
))
(declare-datatypes ((array!68387 0))(
  ( (array!68388 (arr!32891 (Array (_ BitVec 32) ValueCell!12149)) (size!33427 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68387)

(declare-datatypes ((Unit!35199 0))(
  ( (Unit!35200) )
))
(declare-fun lt!472760 () Unit!35199)

(declare-fun minValue!907 () V!39409)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39409)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68389 0))(
  ( (array!68390 (arr!32892 (Array (_ BitVec 32) (_ BitVec 64))) (size!33428 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68389)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!813 (array!68389 array!68387 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39409 V!39409 V!39409 V!39409 (_ BitVec 32) Int) Unit!35199)

(assert (=> b!1069786 (= lt!472760 (lemmaNoChangeToArrayThenSameMapNoExtras!813 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3776 (array!68389 array!68387 (_ BitVec 32) (_ BitVec 32) V!39409 V!39409 (_ BitVec 32) Int) ListLongMap!14369)

(assert (=> b!1069786 (= lt!472759 (getCurrentListMapNoExtraKeys!3776 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069786 (= lt!472761 (getCurrentListMapNoExtraKeys!3776 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069787 () Bool)

(declare-fun res!713748 () Bool)

(assert (=> b!1069787 (=> (not res!713748) (not e!610571))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68389 (_ BitVec 32)) Bool)

(assert (=> b!1069787 (= res!713748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1069788 () Bool)

(declare-fun res!713750 () Bool)

(assert (=> b!1069788 (=> (not res!713750) (not e!610571))))

(declare-datatypes ((List!22945 0))(
  ( (Nil!22942) (Cons!22941 (h!24150 (_ BitVec 64)) (t!32274 List!22945)) )
))
(declare-fun arrayNoDuplicates!0 (array!68389 (_ BitVec 32) List!22945) Bool)

(assert (=> b!1069788 (= res!713750 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22942))))

(declare-fun b!1069789 () Bool)

(declare-fun e!610570 () Bool)

(declare-fun mapRes!40258 () Bool)

(assert (=> b!1069789 (= e!610570 (and e!610569 mapRes!40258))))

(declare-fun condMapEmpty!40258 () Bool)

(declare-fun mapDefault!40258 () ValueCell!12149)

