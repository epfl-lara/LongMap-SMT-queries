; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93672 () Bool)

(assert start!93672)

(declare-fun b!1059717 () Bool)

(declare-fun e!603213 () Bool)

(declare-fun tp_is_empty!24977 () Bool)

(assert (=> b!1059717 (= e!603213 tp_is_empty!24977)))

(declare-fun b!1059718 () Bool)

(declare-fun e!603211 () Bool)

(assert (=> b!1059718 (= e!603211 tp_is_empty!24977)))

(declare-fun b!1059719 () Bool)

(declare-fun e!603212 () Bool)

(assert (=> b!1059719 (= e!603212 false)))

(declare-fun lt!467170 () Bool)

(declare-datatypes ((array!66979 0))(
  ( (array!66980 (arr!32199 (Array (_ BitVec 32) (_ BitVec 64))) (size!32735 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66979)

(declare-datatypes ((List!22440 0))(
  ( (Nil!22437) (Cons!22436 (h!23645 (_ BitVec 64)) (t!31747 List!22440)) )
))
(declare-fun arrayNoDuplicates!0 (array!66979 (_ BitVec 32) List!22440) Bool)

(assert (=> b!1059719 (= lt!467170 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22437))))

(declare-fun res!707861 () Bool)

(assert (=> start!93672 (=> (not res!707861) (not e!603212))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93672 (= res!707861 (validMask!0 mask!1515))))

(assert (=> start!93672 e!603212))

(assert (=> start!93672 true))

(declare-datatypes ((V!38437 0))(
  ( (V!38438 (val!12539 Int)) )
))
(declare-datatypes ((ValueCell!11785 0))(
  ( (ValueCellFull!11785 (v!15149 V!38437)) (EmptyCell!11785) )
))
(declare-datatypes ((array!66981 0))(
  ( (array!66982 (arr!32200 (Array (_ BitVec 32) ValueCell!11785)) (size!32736 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66981)

(declare-fun e!603210 () Bool)

(declare-fun array_inv!24960 (array!66981) Bool)

(assert (=> start!93672 (and (array_inv!24960 _values!955) e!603210)))

(declare-fun array_inv!24961 (array!66979) Bool)

(assert (=> start!93672 (array_inv!24961 _keys!1163)))

(declare-fun b!1059720 () Bool)

(declare-fun res!707863 () Bool)

(assert (=> b!1059720 (=> (not res!707863) (not e!603212))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1059720 (= res!707863 (and (= (size!32736 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32735 _keys!1163) (size!32736 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!39130 () Bool)

(declare-fun mapRes!39130 () Bool)

(assert (=> mapIsEmpty!39130 mapRes!39130))

(declare-fun b!1059721 () Bool)

(assert (=> b!1059721 (= e!603210 (and e!603213 mapRes!39130))))

(declare-fun condMapEmpty!39130 () Bool)

(declare-fun mapDefault!39130 () ValueCell!11785)

