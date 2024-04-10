; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93880 () Bool)

(assert start!93880)

(declare-fun b_free!21353 () Bool)

(declare-fun b_next!21353 () Bool)

(assert (=> start!93880 (= b_free!21353 (not b_next!21353))))

(declare-fun tp!75481 () Bool)

(declare-fun b_and!34067 () Bool)

(assert (=> start!93880 (= tp!75481 b_and!34067)))

(declare-fun res!709011 () Bool)

(declare-fun e!604682 () Bool)

(assert (=> start!93880 (=> (not res!709011) (not e!604682))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93880 (= res!709011 (validMask!0 mask!1515))))

(assert (=> start!93880 e!604682))

(assert (=> start!93880 true))

(declare-fun tp_is_empty!25163 () Bool)

(assert (=> start!93880 tp_is_empty!25163))

(declare-datatypes ((V!38685 0))(
  ( (V!38686 (val!12632 Int)) )
))
(declare-datatypes ((ValueCell!11878 0))(
  ( (ValueCellFull!11878 (v!15242 V!38685)) (EmptyCell!11878) )
))
(declare-datatypes ((array!67329 0))(
  ( (array!67330 (arr!32372 (Array (_ BitVec 32) ValueCell!11878)) (size!32908 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67329)

(declare-fun e!604679 () Bool)

(declare-fun array_inv!25082 (array!67329) Bool)

(assert (=> start!93880 (and (array_inv!25082 _values!955) e!604679)))

(assert (=> start!93880 tp!75481))

(declare-datatypes ((array!67331 0))(
  ( (array!67332 (arr!32373 (Array (_ BitVec 32) (_ BitVec 64))) (size!32909 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67331)

(declare-fun array_inv!25083 (array!67331) Bool)

(assert (=> start!93880 (array_inv!25083 _keys!1163)))

(declare-fun b!1061768 () Bool)

(declare-fun res!709012 () Bool)

(assert (=> b!1061768 (=> (not res!709012) (not e!604682))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1061768 (= res!709012 (and (= (size!32908 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32909 _keys!1163) (size!32908 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1061769 () Bool)

(declare-fun res!709009 () Bool)

(assert (=> b!1061769 (=> (not res!709009) (not e!604682))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67331 (_ BitVec 32)) Bool)

(assert (=> b!1061769 (= res!709009 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1061770 () Bool)

(declare-fun e!604680 () Bool)

(assert (=> b!1061770 (= e!604680 tp_is_empty!25163)))

(declare-fun mapNonEmpty!39415 () Bool)

(declare-fun mapRes!39415 () Bool)

(declare-fun tp!75482 () Bool)

(assert (=> mapNonEmpty!39415 (= mapRes!39415 (and tp!75482 e!604680))))

(declare-fun mapValue!39415 () ValueCell!11878)

(declare-fun mapKey!39415 () (_ BitVec 32))

(declare-fun mapRest!39415 () (Array (_ BitVec 32) ValueCell!11878))

(assert (=> mapNonEmpty!39415 (= (arr!32372 _values!955) (store mapRest!39415 mapKey!39415 mapValue!39415))))

(declare-fun mapIsEmpty!39415 () Bool)

(assert (=> mapIsEmpty!39415 mapRes!39415))

(declare-fun b!1061771 () Bool)

(declare-fun e!604681 () Bool)

(assert (=> b!1061771 (= e!604679 (and e!604681 mapRes!39415))))

(declare-fun condMapEmpty!39415 () Bool)

(declare-fun mapDefault!39415 () ValueCell!11878)

