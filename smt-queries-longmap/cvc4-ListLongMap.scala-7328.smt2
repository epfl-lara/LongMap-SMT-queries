; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93654 () Bool)

(assert start!93654)

(declare-fun mapIsEmpty!39103 () Bool)

(declare-fun mapRes!39103 () Bool)

(assert (=> mapIsEmpty!39103 mapRes!39103))

(declare-fun b!1059555 () Bool)

(declare-fun res!707780 () Bool)

(declare-fun e!603078 () Bool)

(assert (=> b!1059555 (=> (not res!707780) (not e!603078))))

(declare-datatypes ((array!66947 0))(
  ( (array!66948 (arr!32183 (Array (_ BitVec 32) (_ BitVec 64))) (size!32719 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66947)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66947 (_ BitVec 32)) Bool)

(assert (=> b!1059555 (= res!707780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!707781 () Bool)

(assert (=> start!93654 (=> (not res!707781) (not e!603078))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93654 (= res!707781 (validMask!0 mask!1515))))

(assert (=> start!93654 e!603078))

(assert (=> start!93654 true))

(declare-datatypes ((V!38413 0))(
  ( (V!38414 (val!12530 Int)) )
))
(declare-datatypes ((ValueCell!11776 0))(
  ( (ValueCellFull!11776 (v!15140 V!38413)) (EmptyCell!11776) )
))
(declare-datatypes ((array!66949 0))(
  ( (array!66950 (arr!32184 (Array (_ BitVec 32) ValueCell!11776)) (size!32720 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66949)

(declare-fun e!603077 () Bool)

(declare-fun array_inv!24950 (array!66949) Bool)

(assert (=> start!93654 (and (array_inv!24950 _values!955) e!603077)))

(declare-fun array_inv!24951 (array!66947) Bool)

(assert (=> start!93654 (array_inv!24951 _keys!1163)))

(declare-fun b!1059556 () Bool)

(declare-fun res!707782 () Bool)

(assert (=> b!1059556 (=> (not res!707782) (not e!603078))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1059556 (= res!707782 (and (= (size!32720 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32719 _keys!1163) (size!32720 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1059557 () Bool)

(declare-fun e!603076 () Bool)

(declare-fun tp_is_empty!24959 () Bool)

(assert (=> b!1059557 (= e!603076 tp_is_empty!24959)))

(declare-fun b!1059558 () Bool)

(declare-fun e!603075 () Bool)

(assert (=> b!1059558 (= e!603077 (and e!603075 mapRes!39103))))

(declare-fun condMapEmpty!39103 () Bool)

(declare-fun mapDefault!39103 () ValueCell!11776)

