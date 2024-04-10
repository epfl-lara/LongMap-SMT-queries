; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93558 () Bool)

(assert start!93558)

(declare-fun res!707480 () Bool)

(declare-fun e!602590 () Bool)

(assert (=> start!93558 (=> (not res!707480) (not e!602590))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93558 (= res!707480 (validMask!0 mask!1515))))

(assert (=> start!93558 e!602590))

(assert (=> start!93558 true))

(declare-datatypes ((V!38345 0))(
  ( (V!38346 (val!12504 Int)) )
))
(declare-datatypes ((ValueCell!11750 0))(
  ( (ValueCellFull!11750 (v!15113 V!38345)) (EmptyCell!11750) )
))
(declare-datatypes ((array!66839 0))(
  ( (array!66840 (arr!32134 (Array (_ BitVec 32) ValueCell!11750)) (size!32670 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66839)

(declare-fun e!602589 () Bool)

(declare-fun array_inv!24914 (array!66839) Bool)

(assert (=> start!93558 (and (array_inv!24914 _values!955) e!602589)))

(declare-datatypes ((array!66841 0))(
  ( (array!66842 (arr!32135 (Array (_ BitVec 32) (_ BitVec 64))) (size!32671 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66841)

(declare-fun array_inv!24915 (array!66841) Bool)

(assert (=> start!93558 (array_inv!24915 _keys!1163)))

(declare-fun b!1058957 () Bool)

(declare-fun e!602591 () Bool)

(declare-fun tp_is_empty!24907 () Bool)

(assert (=> b!1058957 (= e!602591 tp_is_empty!24907)))

(declare-fun b!1058958 () Bool)

(declare-fun e!602593 () Bool)

(assert (=> b!1058958 (= e!602593 tp_is_empty!24907)))

(declare-fun b!1058959 () Bool)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1058959 (= e!602590 (and (= (size!32670 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32671 _keys!1163) (size!32670 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (size!32671 _keys!1163) (bvadd #b00000000000000000000000000000001 mask!1515)) (bvsgt #b00000000000000000000000000000000 (size!32671 _keys!1163))))))

(declare-fun mapIsEmpty!39010 () Bool)

(declare-fun mapRes!39010 () Bool)

(assert (=> mapIsEmpty!39010 mapRes!39010))

(declare-fun mapNonEmpty!39010 () Bool)

(declare-fun tp!74816 () Bool)

(assert (=> mapNonEmpty!39010 (= mapRes!39010 (and tp!74816 e!602591))))

(declare-fun mapValue!39010 () ValueCell!11750)

(declare-fun mapKey!39010 () (_ BitVec 32))

(declare-fun mapRest!39010 () (Array (_ BitVec 32) ValueCell!11750))

(assert (=> mapNonEmpty!39010 (= (arr!32134 _values!955) (store mapRest!39010 mapKey!39010 mapValue!39010))))

(declare-fun b!1058960 () Bool)

(assert (=> b!1058960 (= e!602589 (and e!602593 mapRes!39010))))

(declare-fun condMapEmpty!39010 () Bool)

(declare-fun mapDefault!39010 () ValueCell!11750)

