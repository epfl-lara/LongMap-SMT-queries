; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94772 () Bool)

(assert start!94772)

(declare-fun b_free!22025 () Bool)

(declare-fun b_next!22025 () Bool)

(assert (=> start!94772 (= b_free!22025 (not b_next!22025))))

(declare-fun tp!77534 () Bool)

(declare-fun b_and!34855 () Bool)

(assert (=> start!94772 (= tp!77534 b_and!34855)))

(declare-fun b!1071642 () Bool)

(declare-fun res!714880 () Bool)

(declare-fun e!611953 () Bool)

(assert (=> b!1071642 (=> (not res!714880) (not e!611953))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39581 0))(
  ( (V!39582 (val!12968 Int)) )
))
(declare-datatypes ((ValueCell!12214 0))(
  ( (ValueCellFull!12214 (v!15584 V!39581)) (EmptyCell!12214) )
))
(declare-datatypes ((array!68641 0))(
  ( (array!68642 (arr!33016 (Array (_ BitVec 32) ValueCell!12214)) (size!33552 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68641)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68643 0))(
  ( (array!68644 (arr!33017 (Array (_ BitVec 32) (_ BitVec 64))) (size!33553 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68643)

(assert (=> b!1071642 (= res!714880 (and (= (size!33552 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33553 _keys!1163) (size!33552 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1071643 () Bool)

(declare-fun e!611956 () Bool)

(declare-fun tp_is_empty!25835 () Bool)

(assert (=> b!1071643 (= e!611956 tp_is_empty!25835)))

(declare-fun mapIsEmpty!40459 () Bool)

(declare-fun mapRes!40459 () Bool)

(assert (=> mapIsEmpty!40459 mapRes!40459))

(declare-fun b!1071644 () Bool)

(declare-fun e!611957 () Bool)

(assert (=> b!1071644 (= e!611953 (not e!611957))))

(declare-fun res!714878 () Bool)

(assert (=> b!1071644 (=> res!714878 e!611957)))

(assert (=> b!1071644 (= res!714878 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16510 0))(
  ( (tuple2!16511 (_1!8266 (_ BitVec 64)) (_2!8266 V!39581)) )
))
(declare-datatypes ((List!23048 0))(
  ( (Nil!23045) (Cons!23044 (h!24253 tuple2!16510) (t!32381 List!23048)) )
))
(declare-datatypes ((ListLongMap!14479 0))(
  ( (ListLongMap!14480 (toList!7255 List!23048)) )
))
(declare-fun lt!474378 () ListLongMap!14479)

(declare-fun lt!474377 () ListLongMap!14479)

(assert (=> b!1071644 (= lt!474378 lt!474377)))

(declare-fun zeroValueBefore!47 () V!39581)

(declare-fun minValue!907 () V!39581)

(declare-datatypes ((Unit!35304 0))(
  ( (Unit!35305) )
))
(declare-fun lt!474382 () Unit!35304)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39581)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!860 (array!68643 array!68641 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39581 V!39581 V!39581 V!39581 (_ BitVec 32) Int) Unit!35304)

(assert (=> b!1071644 (= lt!474382 (lemmaNoChangeToArrayThenSameMapNoExtras!860 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3823 (array!68643 array!68641 (_ BitVec 32) (_ BitVec 32) V!39581 V!39581 (_ BitVec 32) Int) ListLongMap!14479)

(assert (=> b!1071644 (= lt!474377 (getCurrentListMapNoExtraKeys!3823 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071644 (= lt!474378 (getCurrentListMapNoExtraKeys!3823 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!474380 () tuple2!16510)

(declare-fun e!611951 () Bool)

(declare-fun b!1071645 () Bool)

(declare-fun lt!474375 () ListLongMap!14479)

(declare-fun +!3190 (ListLongMap!14479 tuple2!16510) ListLongMap!14479)

(assert (=> b!1071645 (= e!611951 (= lt!474375 (+!3190 lt!474377 lt!474380)))))

(declare-fun b!1071646 () Bool)

(declare-fun e!611954 () Bool)

(assert (=> b!1071646 (= e!611954 tp_is_empty!25835)))

(declare-fun b!1071647 () Bool)

(declare-fun e!611952 () Bool)

(assert (=> b!1071647 (= e!611952 (and e!611954 mapRes!40459))))

(declare-fun condMapEmpty!40459 () Bool)

(declare-fun mapDefault!40459 () ValueCell!12214)

