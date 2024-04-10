; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93924 () Bool)

(assert start!93924)

(declare-fun b_free!21383 () Bool)

(declare-fun b_next!21383 () Bool)

(assert (=> start!93924 (= b_free!21383 (not b_next!21383))))

(declare-fun tp!75574 () Bool)

(declare-fun b_and!34105 () Bool)

(assert (=> start!93924 (= tp!75574 b_and!34105)))

(declare-fun b!1062247 () Bool)

(declare-fun e!605042 () Bool)

(declare-fun e!605043 () Bool)

(assert (=> b!1062247 (= e!605042 (not e!605043))))

(declare-fun res!709299 () Bool)

(assert (=> b!1062247 (=> res!709299 e!605043)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1062247 (= res!709299 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!38725 0))(
  ( (V!38726 (val!12647 Int)) )
))
(declare-datatypes ((tuple2!15994 0))(
  ( (tuple2!15995 (_1!8008 (_ BitVec 64)) (_2!8008 V!38725)) )
))
(declare-datatypes ((List!22577 0))(
  ( (Nil!22574) (Cons!22573 (h!23782 tuple2!15994) (t!31888 List!22577)) )
))
(declare-datatypes ((ListLongMap!13963 0))(
  ( (ListLongMap!13964 (toList!6997 List!22577)) )
))
(declare-fun lt!467992 () ListLongMap!13963)

(declare-fun lt!467996 () ListLongMap!13963)

(assert (=> b!1062247 (= lt!467992 lt!467996)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38725)

(declare-datatypes ((ValueCell!11893 0))(
  ( (ValueCellFull!11893 (v!15257 V!38725)) (EmptyCell!11893) )
))
(declare-datatypes ((array!67389 0))(
  ( (array!67390 (arr!32401 (Array (_ BitVec 32) ValueCell!11893)) (size!32937 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67389)

(declare-fun minValue!907 () V!38725)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-datatypes ((Unit!34794 0))(
  ( (Unit!34795) )
))
(declare-fun lt!467993 () Unit!34794)

(declare-fun zeroValueAfter!47 () V!38725)

(declare-datatypes ((array!67391 0))(
  ( (array!67392 (arr!32402 (Array (_ BitVec 32) (_ BitVec 64))) (size!32938 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67391)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!633 (array!67391 array!67389 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38725 V!38725 V!38725 V!38725 (_ BitVec 32) Int) Unit!34794)

(assert (=> b!1062247 (= lt!467993 (lemmaNoChangeToArrayThenSameMapNoExtras!633 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3596 (array!67391 array!67389 (_ BitVec 32) (_ BitVec 32) V!38725 V!38725 (_ BitVec 32) Int) ListLongMap!13963)

(assert (=> b!1062247 (= lt!467996 (getCurrentListMapNoExtraKeys!3596 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1062247 (= lt!467992 (getCurrentListMapNoExtraKeys!3596 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!709303 () Bool)

(assert (=> start!93924 (=> (not res!709303) (not e!605042))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93924 (= res!709303 (validMask!0 mask!1515))))

(assert (=> start!93924 e!605042))

(assert (=> start!93924 true))

(declare-fun tp_is_empty!25193 () Bool)

(assert (=> start!93924 tp_is_empty!25193))

(declare-fun e!605044 () Bool)

(declare-fun array_inv!25102 (array!67389) Bool)

(assert (=> start!93924 (and (array_inv!25102 _values!955) e!605044)))

(assert (=> start!93924 tp!75574))

(declare-fun array_inv!25103 (array!67391) Bool)

(assert (=> start!93924 (array_inv!25103 _keys!1163)))

(declare-fun mapNonEmpty!39463 () Bool)

(declare-fun mapRes!39463 () Bool)

(declare-fun tp!75575 () Bool)

(declare-fun e!605041 () Bool)

(assert (=> mapNonEmpty!39463 (= mapRes!39463 (and tp!75575 e!605041))))

(declare-fun mapKey!39463 () (_ BitVec 32))

(declare-fun mapRest!39463 () (Array (_ BitVec 32) ValueCell!11893))

(declare-fun mapValue!39463 () ValueCell!11893)

(assert (=> mapNonEmpty!39463 (= (arr!32401 _values!955) (store mapRest!39463 mapKey!39463 mapValue!39463))))

(declare-fun mapIsEmpty!39463 () Bool)

(assert (=> mapIsEmpty!39463 mapRes!39463))

(declare-fun b!1062248 () Bool)

(declare-fun res!709301 () Bool)

(assert (=> b!1062248 (=> (not res!709301) (not e!605042))))

(assert (=> b!1062248 (= res!709301 (and (= (size!32937 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32938 _keys!1163) (size!32937 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1062249 () Bool)

(declare-fun e!605038 () Bool)

(assert (=> b!1062249 (= e!605038 true)))

(declare-fun lt!467994 () ListLongMap!13963)

(declare-fun -!562 (ListLongMap!13963 (_ BitVec 64)) ListLongMap!13963)

(assert (=> b!1062249 (= (-!562 lt!467994 #b0000000000000000000000000000000000000000000000000000000000000000) lt!467994)))

(declare-fun lt!467995 () Unit!34794)

(declare-fun removeNotPresentStillSame!9 (ListLongMap!13963 (_ BitVec 64)) Unit!34794)

(assert (=> b!1062249 (= lt!467995 (removeNotPresentStillSame!9 lt!467994 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1062250 () Bool)

(assert (=> b!1062250 (= e!605041 tp_is_empty!25193)))

(declare-fun b!1062251 () Bool)

(assert (=> b!1062251 (= e!605043 e!605038)))

(declare-fun res!709302 () Bool)

(assert (=> b!1062251 (=> res!709302 e!605038)))

(declare-fun contains!6230 (ListLongMap!13963 (_ BitVec 64)) Bool)

(assert (=> b!1062251 (= res!709302 (contains!6230 lt!467994 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!3983 (array!67391 array!67389 (_ BitVec 32) (_ BitVec 32) V!38725 V!38725 (_ BitVec 32) Int) ListLongMap!13963)

(assert (=> b!1062251 (= lt!467994 (getCurrentListMap!3983 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062252 () Bool)

(declare-fun res!709304 () Bool)

(assert (=> b!1062252 (=> (not res!709304) (not e!605042))))

(declare-datatypes ((List!22578 0))(
  ( (Nil!22575) (Cons!22574 (h!23783 (_ BitVec 64)) (t!31889 List!22578)) )
))
(declare-fun arrayNoDuplicates!0 (array!67391 (_ BitVec 32) List!22578) Bool)

(assert (=> b!1062252 (= res!709304 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22575))))

(declare-fun b!1062253 () Bool)

(declare-fun e!605040 () Bool)

(assert (=> b!1062253 (= e!605040 tp_is_empty!25193)))

(declare-fun b!1062254 () Bool)

(declare-fun res!709300 () Bool)

(assert (=> b!1062254 (=> (not res!709300) (not e!605042))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67391 (_ BitVec 32)) Bool)

(assert (=> b!1062254 (= res!709300 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1062255 () Bool)

(assert (=> b!1062255 (= e!605044 (and e!605040 mapRes!39463))))

(declare-fun condMapEmpty!39463 () Bool)

(declare-fun mapDefault!39463 () ValueCell!11893)

