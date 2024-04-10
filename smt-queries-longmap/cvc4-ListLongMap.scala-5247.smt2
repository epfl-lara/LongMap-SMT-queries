; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70586 () Bool)

(assert start!70586)

(declare-fun b_free!12893 () Bool)

(declare-fun b_next!12893 () Bool)

(assert (=> start!70586 (= b_free!12893 (not b_next!12893))))

(declare-fun tp!45415 () Bool)

(declare-fun b_and!21735 () Bool)

(assert (=> start!70586 (= tp!45415 b_and!21735)))

(declare-fun res!559535 () Bool)

(declare-fun e!455495 () Bool)

(assert (=> start!70586 (=> (not res!559535) (not e!455495))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70586 (= res!559535 (validMask!0 mask!1312))))

(assert (=> start!70586 e!455495))

(declare-fun tp_is_empty!14603 () Bool)

(assert (=> start!70586 tp_is_empty!14603))

(declare-datatypes ((array!45402 0))(
  ( (array!45403 (arr!21754 (Array (_ BitVec 32) (_ BitVec 64))) (size!22175 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45402)

(declare-fun array_inv!17389 (array!45402) Bool)

(assert (=> start!70586 (array_inv!17389 _keys!976)))

(assert (=> start!70586 true))

(declare-datatypes ((V!24471 0))(
  ( (V!24472 (val!7349 Int)) )
))
(declare-datatypes ((ValueCell!6886 0))(
  ( (ValueCellFull!6886 (v!9779 V!24471)) (EmptyCell!6886) )
))
(declare-datatypes ((array!45404 0))(
  ( (array!45405 (arr!21755 (Array (_ BitVec 32) ValueCell!6886)) (size!22176 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45404)

(declare-fun e!455494 () Bool)

(declare-fun array_inv!17390 (array!45404) Bool)

(assert (=> start!70586 (and (array_inv!17390 _values!788) e!455494)))

(assert (=> start!70586 tp!45415))

(declare-fun b!820007 () Bool)

(declare-fun res!559537 () Bool)

(assert (=> b!820007 (=> (not res!559537) (not e!455495))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45402 (_ BitVec 32)) Bool)

(assert (=> b!820007 (= res!559537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!820008 () Bool)

(declare-fun e!455493 () Bool)

(assert (=> b!820008 (= e!455493 tp_is_empty!14603)))

(declare-fun mapNonEmpty!23506 () Bool)

(declare-fun mapRes!23506 () Bool)

(declare-fun tp!45414 () Bool)

(assert (=> mapNonEmpty!23506 (= mapRes!23506 (and tp!45414 e!455493))))

(declare-fun mapRest!23506 () (Array (_ BitVec 32) ValueCell!6886))

(declare-fun mapValue!23506 () ValueCell!6886)

(declare-fun mapKey!23506 () (_ BitVec 32))

(assert (=> mapNonEmpty!23506 (= (arr!21755 _values!788) (store mapRest!23506 mapKey!23506 mapValue!23506))))

(declare-fun b!820009 () Bool)

(declare-fun e!455498 () Bool)

(assert (=> b!820009 (= e!455498 true)))

(declare-datatypes ((tuple2!9678 0))(
  ( (tuple2!9679 (_1!4850 (_ BitVec 64)) (_2!4850 V!24471)) )
))
(declare-datatypes ((List!15501 0))(
  ( (Nil!15498) (Cons!15497 (h!16626 tuple2!9678) (t!21832 List!15501)) )
))
(declare-datatypes ((ListLongMap!8501 0))(
  ( (ListLongMap!8502 (toList!4266 List!15501)) )
))
(declare-fun lt!368341 () ListLongMap!8501)

(declare-fun lt!368344 () tuple2!9678)

(declare-fun lt!368339 () tuple2!9678)

(declare-fun lt!368342 () ListLongMap!8501)

(declare-fun +!1861 (ListLongMap!8501 tuple2!9678) ListLongMap!8501)

(assert (=> b!820009 (= lt!368342 (+!1861 (+!1861 lt!368341 lt!368344) lt!368339))))

(declare-fun lt!368346 () ListLongMap!8501)

(declare-fun lt!368337 () ListLongMap!8501)

(assert (=> b!820009 (= (+!1861 lt!368346 lt!368339) (+!1861 lt!368337 lt!368339))))

(declare-fun zeroValueBefore!34 () V!24471)

(declare-fun zeroValueAfter!34 () V!24471)

(declare-datatypes ((Unit!28011 0))(
  ( (Unit!28012) )
))
(declare-fun lt!368345 () Unit!28011)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!198 (ListLongMap!8501 (_ BitVec 64) V!24471 V!24471) Unit!28011)

(assert (=> b!820009 (= lt!368345 (addSameAsAddTwiceSameKeyDiffValues!198 lt!368346 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!820009 (= lt!368339 (tuple2!9679 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!455496 () Bool)

(assert (=> b!820009 e!455496))

(declare-fun res!559536 () Bool)

(assert (=> b!820009 (=> (not res!559536) (not e!455496))))

(declare-fun lt!368338 () ListLongMap!8501)

(assert (=> b!820009 (= res!559536 (= lt!368338 lt!368337))))

(assert (=> b!820009 (= lt!368337 (+!1861 lt!368346 lt!368344))))

(assert (=> b!820009 (= lt!368344 (tuple2!9679 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun minValue!754 () V!24471)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun lt!368340 () ListLongMap!8501)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2464 (array!45402 array!45404 (_ BitVec 32) (_ BitVec 32) V!24471 V!24471 (_ BitVec 32) Int) ListLongMap!8501)

(assert (=> b!820009 (= lt!368340 (getCurrentListMap!2464 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!820009 (= lt!368338 (getCurrentListMap!2464 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!820010 () Bool)

(declare-fun res!559538 () Bool)

(assert (=> b!820010 (=> (not res!559538) (not e!455495))))

(assert (=> b!820010 (= res!559538 (and (= (size!22176 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22175 _keys!976) (size!22176 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!820011 () Bool)

(declare-fun res!559534 () Bool)

(assert (=> b!820011 (=> (not res!559534) (not e!455495))))

(declare-datatypes ((List!15502 0))(
  ( (Nil!15499) (Cons!15498 (h!16627 (_ BitVec 64)) (t!21833 List!15502)) )
))
(declare-fun arrayNoDuplicates!0 (array!45402 (_ BitVec 32) List!15502) Bool)

(assert (=> b!820011 (= res!559534 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15499))))

(declare-fun b!820012 () Bool)

(declare-fun e!455497 () Bool)

(assert (=> b!820012 (= e!455494 (and e!455497 mapRes!23506))))

(declare-fun condMapEmpty!23506 () Bool)

(declare-fun mapDefault!23506 () ValueCell!6886)

