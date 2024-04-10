; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94828 () Bool)

(assert start!94828)

(declare-fun b_free!22057 () Bool)

(declare-fun b_next!22057 () Bool)

(assert (=> start!94828 (= b_free!22057 (not b_next!22057))))

(declare-fun tp!77633 () Bool)

(declare-fun b_and!34899 () Bool)

(assert (=> start!94828 (= tp!77633 b_and!34899)))

(declare-fun mapNonEmpty!40510 () Bool)

(declare-fun mapRes!40510 () Bool)

(declare-fun tp!77632 () Bool)

(declare-fun e!612416 () Bool)

(assert (=> mapNonEmpty!40510 (= mapRes!40510 (and tp!77632 e!612416))))

(declare-fun mapKey!40510 () (_ BitVec 32))

(declare-datatypes ((V!39625 0))(
  ( (V!39626 (val!12984 Int)) )
))
(declare-datatypes ((ValueCell!12230 0))(
  ( (ValueCellFull!12230 (v!15601 V!39625)) (EmptyCell!12230) )
))
(declare-fun mapValue!40510 () ValueCell!12230)

(declare-fun mapRest!40510 () (Array (_ BitVec 32) ValueCell!12230))

(declare-datatypes ((array!68703 0))(
  ( (array!68704 (arr!33046 (Array (_ BitVec 32) ValueCell!12230)) (size!33582 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68703)

(assert (=> mapNonEmpty!40510 (= (arr!33046 _values!955) (store mapRest!40510 mapKey!40510 mapValue!40510))))

(declare-fun b!1072266 () Bool)

(declare-fun res!715258 () Bool)

(declare-fun e!612414 () Bool)

(assert (=> b!1072266 (=> (not res!715258) (not e!612414))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68705 0))(
  ( (array!68706 (arr!33047 (Array (_ BitVec 32) (_ BitVec 64))) (size!33583 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68705)

(assert (=> b!1072266 (= res!715258 (and (= (size!33582 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33583 _keys!1163) (size!33582 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!40510 () Bool)

(assert (=> mapIsEmpty!40510 mapRes!40510))

(declare-fun b!1072268 () Bool)

(declare-fun e!612410 () Bool)

(declare-fun tp_is_empty!25867 () Bool)

(assert (=> b!1072268 (= e!612410 tp_is_empty!25867)))

(declare-fun b!1072269 () Bool)

(declare-fun res!715257 () Bool)

(assert (=> b!1072269 (=> (not res!715257) (not e!612414))))

(declare-datatypes ((List!23069 0))(
  ( (Nil!23066) (Cons!23065 (h!24274 (_ BitVec 64)) (t!32404 List!23069)) )
))
(declare-fun arrayNoDuplicates!0 (array!68705 (_ BitVec 32) List!23069) Bool)

(assert (=> b!1072269 (= res!715257 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23066))))

(declare-fun b!1072270 () Bool)

(declare-fun res!715253 () Bool)

(assert (=> b!1072270 (=> (not res!715253) (not e!612414))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68705 (_ BitVec 32)) Bool)

(assert (=> b!1072270 (= res!715253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1072271 () Bool)

(declare-fun e!612411 () Bool)

(assert (=> b!1072271 (= e!612414 (not e!612411))))

(declare-fun res!715255 () Bool)

(assert (=> b!1072271 (=> res!715255 e!612411)))

(assert (=> b!1072271 (= res!715255 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16536 0))(
  ( (tuple2!16537 (_1!8279 (_ BitVec 64)) (_2!8279 V!39625)) )
))
(declare-datatypes ((List!23070 0))(
  ( (Nil!23067) (Cons!23066 (h!24275 tuple2!16536) (t!32405 List!23070)) )
))
(declare-datatypes ((ListLongMap!14505 0))(
  ( (ListLongMap!14506 (toList!7268 List!23070)) )
))
(declare-fun lt!475152 () ListLongMap!14505)

(declare-fun lt!475154 () ListLongMap!14505)

(assert (=> b!1072271 (= lt!475152 lt!475154)))

(declare-fun zeroValueBefore!47 () V!39625)

(declare-fun minValue!907 () V!39625)

(declare-datatypes ((Unit!35330 0))(
  ( (Unit!35331) )
))
(declare-fun lt!475163 () Unit!35330)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39625)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!869 (array!68705 array!68703 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39625 V!39625 V!39625 V!39625 (_ BitVec 32) Int) Unit!35330)

(assert (=> b!1072271 (= lt!475163 (lemmaNoChangeToArrayThenSameMapNoExtras!869 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3832 (array!68705 array!68703 (_ BitVec 32) (_ BitVec 32) V!39625 V!39625 (_ BitVec 32) Int) ListLongMap!14505)

(assert (=> b!1072271 (= lt!475154 (getCurrentListMapNoExtraKeys!3832 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072271 (= lt!475152 (getCurrentListMapNoExtraKeys!3832 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun e!612415 () Bool)

(declare-fun lt!475156 () tuple2!16536)

(declare-fun lt!475155 () ListLongMap!14505)

(declare-fun b!1072272 () Bool)

(declare-fun +!3202 (ListLongMap!14505 tuple2!16536) ListLongMap!14505)

(assert (=> b!1072272 (= e!612415 (= lt!475155 (+!3202 lt!475154 lt!475156)))))

(declare-fun res!715256 () Bool)

(assert (=> start!94828 (=> (not res!715256) (not e!612414))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94828 (= res!715256 (validMask!0 mask!1515))))

(assert (=> start!94828 e!612414))

(assert (=> start!94828 true))

(assert (=> start!94828 tp_is_empty!25867))

(declare-fun e!612413 () Bool)

(declare-fun array_inv!25548 (array!68703) Bool)

(assert (=> start!94828 (and (array_inv!25548 _values!955) e!612413)))

(assert (=> start!94828 tp!77633))

(declare-fun array_inv!25549 (array!68705) Bool)

(assert (=> start!94828 (array_inv!25549 _keys!1163)))

(declare-fun b!1072267 () Bool)

(assert (=> b!1072267 (= e!612413 (and e!612410 mapRes!40510))))

(declare-fun condMapEmpty!40510 () Bool)

(declare-fun mapDefault!40510 () ValueCell!12230)

