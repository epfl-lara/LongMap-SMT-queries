; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93736 () Bool)

(assert start!93736)

(declare-fun b_free!21221 () Bool)

(declare-fun b_next!21221 () Bool)

(assert (=> start!93736 (= b_free!21221 (not b_next!21221))))

(declare-fun tp!75082 () Bool)

(declare-fun b_and!33931 () Bool)

(assert (=> start!93736 (= tp!75082 b_and!33931)))

(declare-fun b!1060309 () Bool)

(declare-fun res!708190 () Bool)

(declare-fun e!603641 () Bool)

(assert (=> b!1060309 (=> (not res!708190) (not e!603641))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38509 0))(
  ( (V!38510 (val!12566 Int)) )
))
(declare-datatypes ((ValueCell!11812 0))(
  ( (ValueCellFull!11812 (v!15176 V!38509)) (EmptyCell!11812) )
))
(declare-datatypes ((array!67081 0))(
  ( (array!67082 (arr!32249 (Array (_ BitVec 32) ValueCell!11812)) (size!32785 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67081)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67083 0))(
  ( (array!67084 (arr!32250 (Array (_ BitVec 32) (_ BitVec 64))) (size!32786 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67083)

(assert (=> b!1060309 (= res!708190 (and (= (size!32785 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32786 _keys!1163) (size!32785 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1060310 () Bool)

(declare-fun res!708193 () Bool)

(assert (=> b!1060310 (=> (not res!708193) (not e!603641))))

(declare-datatypes ((List!22468 0))(
  ( (Nil!22465) (Cons!22464 (h!23673 (_ BitVec 64)) (t!31775 List!22468)) )
))
(declare-fun arrayNoDuplicates!0 (array!67083 (_ BitVec 32) List!22468) Bool)

(assert (=> b!1060310 (= res!708193 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22465))))

(declare-fun b!1060311 () Bool)

(declare-fun e!603644 () Bool)

(declare-fun e!603643 () Bool)

(declare-fun mapRes!39214 () Bool)

(assert (=> b!1060311 (= e!603644 (and e!603643 mapRes!39214))))

(declare-fun condMapEmpty!39214 () Bool)

(declare-fun mapDefault!39214 () ValueCell!11812)

