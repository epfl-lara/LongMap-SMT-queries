; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93650 () Bool)

(assert start!93650)

(declare-fun res!707764 () Bool)

(declare-fun e!603046 () Bool)

(assert (=> start!93650 (=> (not res!707764) (not e!603046))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93650 (= res!707764 (validMask!0 mask!1515))))

(assert (=> start!93650 e!603046))

(assert (=> start!93650 true))

(declare-datatypes ((V!38409 0))(
  ( (V!38410 (val!12528 Int)) )
))
(declare-datatypes ((ValueCell!11774 0))(
  ( (ValueCellFull!11774 (v!15138 V!38409)) (EmptyCell!11774) )
))
(declare-datatypes ((array!66939 0))(
  ( (array!66940 (arr!32179 (Array (_ BitVec 32) ValueCell!11774)) (size!32715 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66939)

(declare-fun e!603048 () Bool)

(declare-fun array_inv!24946 (array!66939) Bool)

(assert (=> start!93650 (and (array_inv!24946 _values!955) e!603048)))

(declare-datatypes ((array!66941 0))(
  ( (array!66942 (arr!32180 (Array (_ BitVec 32) (_ BitVec 64))) (size!32716 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66941)

(declare-fun array_inv!24947 (array!66941) Bool)

(assert (=> start!93650 (array_inv!24947 _keys!1163)))

(declare-fun mapIsEmpty!39097 () Bool)

(declare-fun mapRes!39097 () Bool)

(assert (=> mapIsEmpty!39097 mapRes!39097))

(declare-fun mapNonEmpty!39097 () Bool)

(declare-fun tp!74903 () Bool)

(declare-fun e!603047 () Bool)

(assert (=> mapNonEmpty!39097 (= mapRes!39097 (and tp!74903 e!603047))))

(declare-fun mapValue!39097 () ValueCell!11774)

(declare-fun mapKey!39097 () (_ BitVec 32))

(declare-fun mapRest!39097 () (Array (_ BitVec 32) ValueCell!11774))

(assert (=> mapNonEmpty!39097 (= (arr!32179 _values!955) (store mapRest!39097 mapKey!39097 mapValue!39097))))

(declare-fun b!1059519 () Bool)

(declare-fun tp_is_empty!24955 () Bool)

(assert (=> b!1059519 (= e!603047 tp_is_empty!24955)))

(declare-fun b!1059520 () Bool)

(declare-fun res!707762 () Bool)

(assert (=> b!1059520 (=> (not res!707762) (not e!603046))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1059520 (= res!707762 (and (= (size!32715 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32716 _keys!1163) (size!32715 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1059521 () Bool)

(declare-fun res!707763 () Bool)

(assert (=> b!1059521 (=> (not res!707763) (not e!603046))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66941 (_ BitVec 32)) Bool)

(assert (=> b!1059521 (= res!707763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1059522 () Bool)

(assert (=> b!1059522 (= e!603046 false)))

(declare-fun lt!467137 () Bool)

(declare-datatypes ((List!22433 0))(
  ( (Nil!22430) (Cons!22429 (h!23638 (_ BitVec 64)) (t!31740 List!22433)) )
))
(declare-fun arrayNoDuplicates!0 (array!66941 (_ BitVec 32) List!22433) Bool)

(assert (=> b!1059522 (= lt!467137 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22430))))

(declare-fun b!1059523 () Bool)

(declare-fun e!603044 () Bool)

(assert (=> b!1059523 (= e!603048 (and e!603044 mapRes!39097))))

(declare-fun condMapEmpty!39097 () Bool)

(declare-fun mapDefault!39097 () ValueCell!11774)

