; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94360 () Bool)

(assert start!94360)

(declare-fun b_free!21701 () Bool)

(declare-fun b_next!21701 () Bool)

(assert (=> start!94360 (= b_free!21701 (not b_next!21701))))

(declare-fun tp!76547 () Bool)

(declare-fun b_and!34485 () Bool)

(assert (=> start!94360 (= tp!76547 b_and!34485)))

(declare-fun mapNonEmpty!39958 () Bool)

(declare-fun mapRes!39958 () Bool)

(declare-fun tp!76546 () Bool)

(declare-fun e!608525 () Bool)

(assert (=> mapNonEmpty!39958 (= mapRes!39958 (and tp!76546 e!608525))))

(declare-datatypes ((V!39149 0))(
  ( (V!39150 (val!12806 Int)) )
))
(declare-datatypes ((ValueCell!12052 0))(
  ( (ValueCellFull!12052 (v!15420 V!39149)) (EmptyCell!12052) )
))
(declare-fun mapValue!39958 () ValueCell!12052)

(declare-fun mapKey!39958 () (_ BitVec 32))

(declare-datatypes ((array!68007 0))(
  ( (array!68008 (arr!32704 (Array (_ BitVec 32) ValueCell!12052)) (size!33240 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68007)

(declare-fun mapRest!39958 () (Array (_ BitVec 32) ValueCell!12052))

(assert (=> mapNonEmpty!39958 (= (arr!32704 _values!955) (store mapRest!39958 mapKey!39958 mapValue!39958))))

(declare-fun b!1067016 () Bool)

(declare-fun e!608528 () Bool)

(declare-fun tp_is_empty!25511 () Bool)

(assert (=> b!1067016 (= e!608528 tp_is_empty!25511)))

(declare-fun b!1067017 () Bool)

(declare-fun e!608526 () Bool)

(assert (=> b!1067017 (= e!608526 (not true))))

(declare-datatypes ((tuple2!16248 0))(
  ( (tuple2!16249 (_1!8135 (_ BitVec 64)) (_2!8135 V!39149)) )
))
(declare-datatypes ((List!22808 0))(
  ( (Nil!22805) (Cons!22804 (h!24013 tuple2!16248) (t!32131 List!22808)) )
))
(declare-datatypes ((ListLongMap!14217 0))(
  ( (ListLongMap!14218 (toList!7124 List!22808)) )
))
(declare-fun lt!471267 () ListLongMap!14217)

(declare-fun lt!471265 () ListLongMap!14217)

(assert (=> b!1067017 (= lt!471267 lt!471265)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun minValue!907 () V!39149)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-datatypes ((Unit!35045 0))(
  ( (Unit!35046) )
))
(declare-fun lt!471266 () Unit!35045)

(declare-fun zeroValueBefore!47 () V!39149)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39149)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68009 0))(
  ( (array!68010 (arr!32705 (Array (_ BitVec 32) (_ BitVec 64))) (size!33241 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68009)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!745 (array!68009 array!68007 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39149 V!39149 V!39149 V!39149 (_ BitVec 32) Int) Unit!35045)

(assert (=> b!1067017 (= lt!471266 (lemmaNoChangeToArrayThenSameMapNoExtras!745 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3708 (array!68009 array!68007 (_ BitVec 32) (_ BitVec 32) V!39149 V!39149 (_ BitVec 32) Int) ListLongMap!14217)

(assert (=> b!1067017 (= lt!471265 (getCurrentListMapNoExtraKeys!3708 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067017 (= lt!471267 (getCurrentListMapNoExtraKeys!3708 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!712099 () Bool)

(assert (=> start!94360 (=> (not res!712099) (not e!608526))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94360 (= res!712099 (validMask!0 mask!1515))))

(assert (=> start!94360 e!608526))

(assert (=> start!94360 true))

(assert (=> start!94360 tp_is_empty!25511))

(declare-fun e!608529 () Bool)

(declare-fun array_inv!25320 (array!68007) Bool)

(assert (=> start!94360 (and (array_inv!25320 _values!955) e!608529)))

(assert (=> start!94360 tp!76547))

(declare-fun array_inv!25321 (array!68009) Bool)

(assert (=> start!94360 (array_inv!25321 _keys!1163)))

(declare-fun b!1067018 () Bool)

(declare-fun res!712098 () Bool)

(assert (=> b!1067018 (=> (not res!712098) (not e!608526))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68009 (_ BitVec 32)) Bool)

(assert (=> b!1067018 (= res!712098 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1067019 () Bool)

(assert (=> b!1067019 (= e!608529 (and e!608528 mapRes!39958))))

(declare-fun condMapEmpty!39958 () Bool)

(declare-fun mapDefault!39958 () ValueCell!12052)

