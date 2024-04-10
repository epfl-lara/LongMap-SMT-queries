; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94940 () Bool)

(assert start!94940)

(declare-fun b_free!22145 () Bool)

(declare-fun b_next!22145 () Bool)

(assert (=> start!94940 (= b_free!22145 (not b_next!22145))))

(declare-fun tp!77899 () Bool)

(declare-fun b_and!34999 () Bool)

(assert (=> start!94940 (= tp!77899 b_and!34999)))

(declare-fun mapIsEmpty!40645 () Bool)

(declare-fun mapRes!40645 () Bool)

(assert (=> mapIsEmpty!40645 mapRes!40645))

(declare-fun b!1073468 () Bool)

(declare-fun e!613281 () Bool)

(assert (=> b!1073468 (= e!613281 false)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39741 0))(
  ( (V!39742 (val!13028 Int)) )
))
(declare-datatypes ((ValueCell!12274 0))(
  ( (ValueCellFull!12274 (v!15646 V!39741)) (EmptyCell!12274) )
))
(declare-datatypes ((array!68871 0))(
  ( (array!68872 (arr!33129 (Array (_ BitVec 32) ValueCell!12274)) (size!33665 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68871)

(declare-fun minValue!907 () V!39741)

(declare-datatypes ((array!68873 0))(
  ( (array!68874 (arr!33130 (Array (_ BitVec 32) (_ BitVec 64))) (size!33666 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68873)

(declare-datatypes ((tuple2!16588 0))(
  ( (tuple2!16589 (_1!8305 (_ BitVec 64)) (_2!8305 V!39741)) )
))
(declare-datatypes ((List!23127 0))(
  ( (Nil!23124) (Cons!23123 (h!24332 tuple2!16588) (t!32464 List!23127)) )
))
(declare-datatypes ((ListLongMap!14557 0))(
  ( (ListLongMap!14558 (toList!7294 List!23127)) )
))
(declare-fun lt!476055 () ListLongMap!14557)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39741)

(declare-fun getCurrentListMapNoExtraKeys!3858 (array!68873 array!68871 (_ BitVec 32) (_ BitVec 32) V!39741 V!39741 (_ BitVec 32) Int) ListLongMap!14557)

(assert (=> b!1073468 (= lt!476055 (getCurrentListMapNoExtraKeys!3858 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!39741)

(declare-fun lt!476056 () ListLongMap!14557)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1073468 (= lt!476056 (getCurrentListMapNoExtraKeys!3858 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1073469 () Bool)

(declare-fun e!613279 () Bool)

(declare-fun e!613283 () Bool)

(assert (=> b!1073469 (= e!613279 (and e!613283 mapRes!40645))))

(declare-fun condMapEmpty!40645 () Bool)

(declare-fun mapDefault!40645 () ValueCell!12274)

