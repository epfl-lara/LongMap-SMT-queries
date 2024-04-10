; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93680 () Bool)

(assert start!93680)

(declare-fun b!1059791 () Bool)

(declare-fun res!707899 () Bool)

(declare-fun e!603273 () Bool)

(assert (=> b!1059791 (=> (not res!707899) (not e!603273))))

(declare-datatypes ((array!66993 0))(
  ( (array!66994 (arr!32206 (Array (_ BitVec 32) (_ BitVec 64))) (size!32742 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66993)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66993 (_ BitVec 32)) Bool)

(assert (=> b!1059791 (= res!707899 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1059792 () Bool)

(declare-fun res!707902 () Bool)

(assert (=> b!1059792 (=> (not res!707902) (not e!603273))))

(declare-datatypes ((List!22443 0))(
  ( (Nil!22440) (Cons!22439 (h!23648 (_ BitVec 64)) (t!31750 List!22443)) )
))
(declare-fun arrayNoDuplicates!0 (array!66993 (_ BitVec 32) List!22443) Bool)

(assert (=> b!1059792 (= res!707902 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22440))))

(declare-fun b!1059793 () Bool)

(declare-fun res!707901 () Bool)

(assert (=> b!1059793 (=> (not res!707901) (not e!603273))))

(declare-datatypes ((V!38449 0))(
  ( (V!38450 (val!12543 Int)) )
))
(declare-datatypes ((ValueCell!11789 0))(
  ( (ValueCellFull!11789 (v!15153 V!38449)) (EmptyCell!11789) )
))
(declare-datatypes ((array!66995 0))(
  ( (array!66996 (arr!32207 (Array (_ BitVec 32) ValueCell!11789)) (size!32743 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66995)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1059793 (= res!707901 (and (= (size!32743 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32742 _keys!1163) (size!32743 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1059794 () Bool)

(declare-fun e!603271 () Bool)

(declare-fun e!603270 () Bool)

(declare-fun mapRes!39142 () Bool)

(assert (=> b!1059794 (= e!603271 (and e!603270 mapRes!39142))))

(declare-fun condMapEmpty!39142 () Bool)

(declare-fun mapDefault!39142 () ValueCell!11789)

