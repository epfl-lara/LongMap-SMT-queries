; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93662 () Bool)

(assert start!93662)

(declare-fun b!1059627 () Bool)

(declare-fun res!707816 () Bool)

(declare-fun e!603137 () Bool)

(assert (=> b!1059627 (=> (not res!707816) (not e!603137))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38425 0))(
  ( (V!38426 (val!12534 Int)) )
))
(declare-datatypes ((ValueCell!11780 0))(
  ( (ValueCellFull!11780 (v!15144 V!38425)) (EmptyCell!11780) )
))
(declare-datatypes ((array!66961 0))(
  ( (array!66962 (arr!32190 (Array (_ BitVec 32) ValueCell!11780)) (size!32726 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66961)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!66963 0))(
  ( (array!66964 (arr!32191 (Array (_ BitVec 32) (_ BitVec 64))) (size!32727 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66963)

(assert (=> b!1059627 (= res!707816 (and (= (size!32726 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32727 _keys!1163) (size!32726 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1059628 () Bool)

(declare-fun e!603138 () Bool)

(declare-fun e!603135 () Bool)

(declare-fun mapRes!39115 () Bool)

(assert (=> b!1059628 (= e!603138 (and e!603135 mapRes!39115))))

(declare-fun condMapEmpty!39115 () Bool)

(declare-fun mapDefault!39115 () ValueCell!11780)

