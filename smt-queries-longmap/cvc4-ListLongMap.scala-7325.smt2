; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93636 () Bool)

(assert start!93636)

(declare-fun b!1059393 () Bool)

(declare-fun res!707699 () Bool)

(declare-fun e!602943 () Bool)

(assert (=> b!1059393 (=> (not res!707699) (not e!602943))))

(declare-datatypes ((array!66913 0))(
  ( (array!66914 (arr!32166 (Array (_ BitVec 32) (_ BitVec 64))) (size!32702 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66913)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66913 (_ BitVec 32)) Bool)

(assert (=> b!1059393 (= res!707699 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1059394 () Bool)

(declare-fun e!602941 () Bool)

(declare-fun tp_is_empty!24941 () Bool)

(assert (=> b!1059394 (= e!602941 tp_is_empty!24941)))

(declare-fun b!1059395 () Bool)

(declare-fun res!707701 () Bool)

(assert (=> b!1059395 (=> (not res!707701) (not e!602943))))

(declare-datatypes ((V!38389 0))(
  ( (V!38390 (val!12521 Int)) )
))
(declare-datatypes ((ValueCell!11767 0))(
  ( (ValueCellFull!11767 (v!15131 V!38389)) (EmptyCell!11767) )
))
(declare-datatypes ((array!66915 0))(
  ( (array!66916 (arr!32167 (Array (_ BitVec 32) ValueCell!11767)) (size!32703 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66915)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1059395 (= res!707701 (and (= (size!32703 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32702 _keys!1163) (size!32703 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!707700 () Bool)

(assert (=> start!93636 (=> (not res!707700) (not e!602943))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93636 (= res!707700 (validMask!0 mask!1515))))

(assert (=> start!93636 e!602943))

(assert (=> start!93636 true))

(declare-fun e!602940 () Bool)

(declare-fun array_inv!24936 (array!66915) Bool)

(assert (=> start!93636 (and (array_inv!24936 _values!955) e!602940)))

(declare-fun array_inv!24937 (array!66913) Bool)

(assert (=> start!93636 (array_inv!24937 _keys!1163)))

(declare-fun b!1059396 () Bool)

(declare-fun e!602939 () Bool)

(assert (=> b!1059396 (= e!602939 tp_is_empty!24941)))

(declare-fun mapIsEmpty!39076 () Bool)

(declare-fun mapRes!39076 () Bool)

(assert (=> mapIsEmpty!39076 mapRes!39076))

(declare-fun mapNonEmpty!39076 () Bool)

(declare-fun tp!74882 () Bool)

(assert (=> mapNonEmpty!39076 (= mapRes!39076 (and tp!74882 e!602941))))

(declare-fun mapRest!39076 () (Array (_ BitVec 32) ValueCell!11767))

(declare-fun mapValue!39076 () ValueCell!11767)

(declare-fun mapKey!39076 () (_ BitVec 32))

(assert (=> mapNonEmpty!39076 (= (arr!32167 _values!955) (store mapRest!39076 mapKey!39076 mapValue!39076))))

(declare-fun b!1059397 () Bool)

(assert (=> b!1059397 (= e!602943 false)))

(declare-fun lt!467116 () Bool)

(declare-datatypes ((List!22427 0))(
  ( (Nil!22424) (Cons!22423 (h!23632 (_ BitVec 64)) (t!31734 List!22427)) )
))
(declare-fun arrayNoDuplicates!0 (array!66913 (_ BitVec 32) List!22427) Bool)

(assert (=> b!1059397 (= lt!467116 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22424))))

(declare-fun b!1059398 () Bool)

(assert (=> b!1059398 (= e!602940 (and e!602939 mapRes!39076))))

(declare-fun condMapEmpty!39076 () Bool)

(declare-fun mapDefault!39076 () ValueCell!11767)

