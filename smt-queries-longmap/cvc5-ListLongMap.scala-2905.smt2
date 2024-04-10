; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41572 () Bool)

(assert start!41572)

(declare-fun b_free!11239 () Bool)

(declare-fun b_next!11239 () Bool)

(assert (=> start!41572 (= b_free!11239 (not b_next!11239))))

(declare-fun tp!39715 () Bool)

(declare-fun b_and!19579 () Bool)

(assert (=> start!41572 (= tp!39715 b_and!19579)))

(declare-fun mapNonEmpty!20677 () Bool)

(declare-fun mapRes!20677 () Bool)

(declare-fun tp!39714 () Bool)

(declare-fun e!271240 () Bool)

(assert (=> mapNonEmpty!20677 (= mapRes!20677 (and tp!39714 e!271240))))

(declare-datatypes ((V!17995 0))(
  ( (V!17996 (val!6378 Int)) )
))
(declare-datatypes ((ValueCell!5990 0))(
  ( (ValueCellFull!5990 (v!8665 V!17995)) (EmptyCell!5990) )
))
(declare-datatypes ((array!29121 0))(
  ( (array!29122 (arr!13992 (Array (_ BitVec 32) ValueCell!5990)) (size!14344 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29121)

(declare-fun mapValue!20677 () ValueCell!5990)

(declare-fun mapRest!20677 () (Array (_ BitVec 32) ValueCell!5990))

(declare-fun mapKey!20677 () (_ BitVec 32))

(assert (=> mapNonEmpty!20677 (= (arr!13992 _values!833) (store mapRest!20677 mapKey!20677 mapValue!20677))))

(declare-fun b!464356 () Bool)

(declare-fun e!271242 () Bool)

(declare-fun tp_is_empty!12667 () Bool)

(assert (=> b!464356 (= e!271242 tp_is_empty!12667)))

(declare-fun b!464357 () Bool)

(declare-fun res!277626 () Bool)

(declare-fun e!271241 () Bool)

(assert (=> b!464357 (=> (not res!277626) (not e!271241))))

(declare-datatypes ((array!29123 0))(
  ( (array!29124 (arr!13993 (Array (_ BitVec 32) (_ BitVec 64))) (size!14345 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29123)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29123 (_ BitVec 32)) Bool)

(assert (=> b!464357 (= res!277626 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!464358 () Bool)

(declare-fun res!277628 () Bool)

(assert (=> b!464358 (=> (not res!277628) (not e!271241))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!464358 (= res!277628 (and (= (size!14344 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14345 _keys!1025) (size!14344 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!277625 () Bool)

(assert (=> start!41572 (=> (not res!277625) (not e!271241))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41572 (= res!277625 (validMask!0 mask!1365))))

(assert (=> start!41572 e!271241))

(assert (=> start!41572 tp_is_empty!12667))

(assert (=> start!41572 tp!39715))

(assert (=> start!41572 true))

(declare-fun array_inv!10108 (array!29123) Bool)

(assert (=> start!41572 (array_inv!10108 _keys!1025)))

(declare-fun e!271239 () Bool)

(declare-fun array_inv!10109 (array!29121) Bool)

(assert (=> start!41572 (and (array_inv!10109 _values!833) e!271239)))

(declare-fun b!464359 () Bool)

(assert (=> b!464359 (= e!271239 (and e!271242 mapRes!20677))))

(declare-fun condMapEmpty!20677 () Bool)

(declare-fun mapDefault!20677 () ValueCell!5990)

