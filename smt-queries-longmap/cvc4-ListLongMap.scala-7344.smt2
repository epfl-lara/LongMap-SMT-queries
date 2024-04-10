; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93772 () Bool)

(assert start!93772)

(declare-fun b_free!21245 () Bool)

(declare-fun b_next!21245 () Bool)

(assert (=> start!93772 (= b_free!21245 (not b_next!21245))))

(declare-fun tp!75158 () Bool)

(declare-fun b_and!33959 () Bool)

(assert (=> start!93772 (= tp!75158 b_and!33959)))

(declare-fun b!1060634 () Bool)

(declare-fun res!708361 () Bool)

(declare-fun e!603872 () Bool)

(assert (=> b!1060634 (=> (not res!708361) (not e!603872))))

(declare-datatypes ((array!67127 0))(
  ( (array!67128 (arr!32271 (Array (_ BitVec 32) (_ BitVec 64))) (size!32807 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67127)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67127 (_ BitVec 32)) Bool)

(assert (=> b!1060634 (= res!708361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!708363 () Bool)

(assert (=> start!93772 (=> (not res!708363) (not e!603872))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93772 (= res!708363 (validMask!0 mask!1515))))

(assert (=> start!93772 e!603872))

(assert (=> start!93772 true))

(declare-fun tp_is_empty!25055 () Bool)

(assert (=> start!93772 tp_is_empty!25055))

(declare-datatypes ((V!38541 0))(
  ( (V!38542 (val!12578 Int)) )
))
(declare-datatypes ((ValueCell!11824 0))(
  ( (ValueCellFull!11824 (v!15188 V!38541)) (EmptyCell!11824) )
))
(declare-datatypes ((array!67129 0))(
  ( (array!67130 (arr!32272 (Array (_ BitVec 32) ValueCell!11824)) (size!32808 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67129)

(declare-fun e!603869 () Bool)

(declare-fun array_inv!25006 (array!67129) Bool)

(assert (=> start!93772 (and (array_inv!25006 _values!955) e!603869)))

(assert (=> start!93772 tp!75158))

(declare-fun array_inv!25007 (array!67127) Bool)

(assert (=> start!93772 (array_inv!25007 _keys!1163)))

(declare-fun b!1060635 () Bool)

(assert (=> b!1060635 (= e!603872 false)))

(declare-datatypes ((tuple2!15896 0))(
  ( (tuple2!15897 (_1!7959 (_ BitVec 64)) (_2!7959 V!38541)) )
))
(declare-datatypes ((List!22483 0))(
  ( (Nil!22480) (Cons!22479 (h!23688 tuple2!15896) (t!31792 List!22483)) )
))
(declare-datatypes ((ListLongMap!13865 0))(
  ( (ListLongMap!13866 (toList!6948 List!22483)) )
))
(declare-fun lt!467334 () ListLongMap!13865)

(declare-fun minValue!907 () V!38541)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38541)

(declare-fun getCurrentListMapNoExtraKeys!3550 (array!67127 array!67129 (_ BitVec 32) (_ BitVec 32) V!38541 V!38541 (_ BitVec 32) Int) ListLongMap!13865)

(assert (=> b!1060635 (= lt!467334 (getCurrentListMapNoExtraKeys!3550 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!38541)

(declare-fun lt!467335 () ListLongMap!13865)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1060635 (= lt!467335 (getCurrentListMapNoExtraKeys!3550 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1060636 () Bool)

(declare-fun e!603870 () Bool)

(declare-fun mapRes!39253 () Bool)

(assert (=> b!1060636 (= e!603869 (and e!603870 mapRes!39253))))

(declare-fun condMapEmpty!39253 () Bool)

(declare-fun mapDefault!39253 () ValueCell!11824)

