; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94070 () Bool)

(assert start!94070)

(declare-fun b_free!21485 () Bool)

(declare-fun b_next!21485 () Bool)

(assert (=> start!94070 (= b_free!21485 (not b_next!21485))))

(declare-fun tp!75887 () Bool)

(declare-fun b_and!34227 () Bool)

(assert (=> start!94070 (= tp!75887 b_and!34227)))

(declare-fun b!1063886 () Bool)

(declare-fun e!606257 () Bool)

(declare-fun tp_is_empty!25295 () Bool)

(assert (=> b!1063886 (= e!606257 tp_is_empty!25295)))

(declare-fun b!1063887 () Bool)

(declare-fun res!710289 () Bool)

(declare-fun e!606261 () Bool)

(assert (=> b!1063887 (=> (not res!710289) (not e!606261))))

(declare-datatypes ((array!67589 0))(
  ( (array!67590 (arr!32499 (Array (_ BitVec 32) (_ BitVec 64))) (size!33035 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67589)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67589 (_ BitVec 32)) Bool)

(assert (=> b!1063887 (= res!710289 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1063888 () Bool)

(declare-fun res!710287 () Bool)

(assert (=> b!1063888 (=> (not res!710287) (not e!606261))))

(declare-datatypes ((List!22655 0))(
  ( (Nil!22652) (Cons!22651 (h!23860 (_ BitVec 64)) (t!31970 List!22655)) )
))
(declare-fun arrayNoDuplicates!0 (array!67589 (_ BitVec 32) List!22655) Bool)

(assert (=> b!1063888 (= res!710287 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22652))))

(declare-fun b!1063889 () Bool)

(assert (=> b!1063889 (= e!606261 (not true))))

(declare-datatypes ((V!38861 0))(
  ( (V!38862 (val!12698 Int)) )
))
(declare-datatypes ((tuple2!16078 0))(
  ( (tuple2!16079 (_1!8050 (_ BitVec 64)) (_2!8050 V!38861)) )
))
(declare-datatypes ((List!22656 0))(
  ( (Nil!22653) (Cons!22652 (h!23861 tuple2!16078) (t!31971 List!22656)) )
))
(declare-datatypes ((ListLongMap!14047 0))(
  ( (ListLongMap!14048 (toList!7039 List!22656)) )
))
(declare-fun lt!468955 () ListLongMap!14047)

(declare-fun lt!468954 () ListLongMap!14047)

(assert (=> b!1063889 (= lt!468955 lt!468954)))

(declare-fun zeroValueBefore!47 () V!38861)

(declare-datatypes ((Unit!34878 0))(
  ( (Unit!34879) )
))
(declare-fun lt!468953 () Unit!34878)

(declare-datatypes ((ValueCell!11944 0))(
  ( (ValueCellFull!11944 (v!15310 V!38861)) (EmptyCell!11944) )
))
(declare-datatypes ((array!67591 0))(
  ( (array!67592 (arr!32500 (Array (_ BitVec 32) ValueCell!11944)) (size!33036 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67591)

(declare-fun minValue!907 () V!38861)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38861)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!668 (array!67589 array!67591 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38861 V!38861 V!38861 V!38861 (_ BitVec 32) Int) Unit!34878)

(assert (=> b!1063889 (= lt!468953 (lemmaNoChangeToArrayThenSameMapNoExtras!668 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3631 (array!67589 array!67591 (_ BitVec 32) (_ BitVec 32) V!38861 V!38861 (_ BitVec 32) Int) ListLongMap!14047)

(assert (=> b!1063889 (= lt!468954 (getCurrentListMapNoExtraKeys!3631 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063889 (= lt!468955 (getCurrentListMapNoExtraKeys!3631 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39622 () Bool)

(declare-fun mapRes!39622 () Bool)

(assert (=> mapIsEmpty!39622 mapRes!39622))

(declare-fun b!1063890 () Bool)

(declare-fun e!606260 () Bool)

(assert (=> b!1063890 (= e!606260 tp_is_empty!25295)))

(declare-fun b!1063891 () Bool)

(declare-fun res!710290 () Bool)

(assert (=> b!1063891 (=> (not res!710290) (not e!606261))))

(assert (=> b!1063891 (= res!710290 (and (= (size!33036 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33035 _keys!1163) (size!33036 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1063892 () Bool)

(declare-fun e!606258 () Bool)

(assert (=> b!1063892 (= e!606258 (and e!606260 mapRes!39622))))

(declare-fun condMapEmpty!39622 () Bool)

(declare-fun mapDefault!39622 () ValueCell!11944)

