; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93602 () Bool)

(assert start!93602)

(declare-fun b!1059197 () Bool)

(declare-fun res!707587 () Bool)

(declare-fun e!602790 () Bool)

(assert (=> b!1059197 (=> (not res!707587) (not e!602790))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38373 0))(
  ( (V!38374 (val!12515 Int)) )
))
(declare-datatypes ((ValueCell!11761 0))(
  ( (ValueCellFull!11761 (v!15124 V!38373)) (EmptyCell!11761) )
))
(declare-datatypes ((array!66885 0))(
  ( (array!66886 (arr!32154 (Array (_ BitVec 32) ValueCell!11761)) (size!32690 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66885)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!66887 0))(
  ( (array!66888 (arr!32155 (Array (_ BitVec 32) (_ BitVec 64))) (size!32691 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66887)

(assert (=> b!1059197 (= res!707587 (and (= (size!32690 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32691 _keys!1163) (size!32690 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1059198 () Bool)

(declare-fun res!707585 () Bool)

(assert (=> b!1059198 (=> (not res!707585) (not e!602790))))

(assert (=> b!1059198 (= res!707585 (and (bvsle #b00000000000000000000000000000000 (size!32691 _keys!1163)) (bvslt (size!32691 _keys!1163) #b01111111111111111111111111111111)))))

(declare-fun b!1059199 () Bool)

(declare-fun e!602792 () Bool)

(declare-fun e!602794 () Bool)

(declare-fun mapRes!39052 () Bool)

(assert (=> b!1059199 (= e!602792 (and e!602794 mapRes!39052))))

(declare-fun condMapEmpty!39052 () Bool)

(declare-fun mapDefault!39052 () ValueCell!11761)

