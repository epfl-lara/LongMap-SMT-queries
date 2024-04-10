; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93588 () Bool)

(assert start!93588)

(declare-fun b!1059115 () Bool)

(declare-fun e!602733 () Bool)

(declare-fun tp_is_empty!24923 () Bool)

(assert (=> b!1059115 (= e!602733 tp_is_empty!24923)))

(declare-fun mapIsEmpty!39040 () Bool)

(declare-fun mapRes!39040 () Bool)

(assert (=> mapIsEmpty!39040 mapRes!39040))

(declare-fun b!1059116 () Bool)

(declare-fun e!602731 () Bool)

(assert (=> b!1059116 (= e!602731 tp_is_empty!24923)))

(declare-fun b!1059117 () Bool)

(declare-fun res!707545 () Bool)

(declare-fun e!602732 () Bool)

(assert (=> b!1059117 (=> (not res!707545) (not e!602732))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38365 0))(
  ( (V!38366 (val!12512 Int)) )
))
(declare-datatypes ((ValueCell!11758 0))(
  ( (ValueCellFull!11758 (v!15121 V!38365)) (EmptyCell!11758) )
))
(declare-datatypes ((array!66871 0))(
  ( (array!66872 (arr!32148 (Array (_ BitVec 32) ValueCell!11758)) (size!32684 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66871)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!66873 0))(
  ( (array!66874 (arr!32149 (Array (_ BitVec 32) (_ BitVec 64))) (size!32685 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66873)

(assert (=> b!1059117 (= res!707545 (and (= (size!32684 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32685 _keys!1163) (size!32684 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!707546 () Bool)

(assert (=> start!93588 (=> (not res!707546) (not e!602732))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93588 (= res!707546 (validMask!0 mask!1515))))

(assert (=> start!93588 e!602732))

(assert (=> start!93588 true))

(declare-fun e!602734 () Bool)

(declare-fun array_inv!24926 (array!66871) Bool)

(assert (=> start!93588 (and (array_inv!24926 _values!955) e!602734)))

(declare-fun array_inv!24927 (array!66873) Bool)

(assert (=> start!93588 (array_inv!24927 _keys!1163)))

(declare-fun b!1059118 () Bool)

(assert (=> b!1059118 (= e!602732 (and (bvsle #b00000000000000000000000000000000 (size!32685 _keys!1163)) (bvsge (size!32685 _keys!1163) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!39040 () Bool)

(declare-fun tp!74846 () Bool)

(assert (=> mapNonEmpty!39040 (= mapRes!39040 (and tp!74846 e!602733))))

(declare-fun mapValue!39040 () ValueCell!11758)

(declare-fun mapRest!39040 () (Array (_ BitVec 32) ValueCell!11758))

(declare-fun mapKey!39040 () (_ BitVec 32))

(assert (=> mapNonEmpty!39040 (= (arr!32148 _values!955) (store mapRest!39040 mapKey!39040 mapValue!39040))))

(declare-fun b!1059119 () Bool)

(assert (=> b!1059119 (= e!602734 (and e!602731 mapRes!39040))))

(declare-fun condMapEmpty!39040 () Bool)

(declare-fun mapDefault!39040 () ValueCell!11758)

