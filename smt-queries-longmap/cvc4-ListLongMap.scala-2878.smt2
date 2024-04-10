; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41392 () Bool)

(assert start!41392)

(declare-fun b!462599 () Bool)

(declare-fun e!269978 () Bool)

(assert (=> b!462599 (= e!269978 false)))

(declare-fun lt!209237 () Bool)

(declare-datatypes ((array!28817 0))(
  ( (array!28818 (arr!13842 (Array (_ BitVec 32) (_ BitVec 64))) (size!14194 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28817)

(declare-datatypes ((List!8348 0))(
  ( (Nil!8345) (Cons!8344 (h!9200 (_ BitVec 64)) (t!14292 List!8348)) )
))
(declare-fun arrayNoDuplicates!0 (array!28817 (_ BitVec 32) List!8348) Bool)

(assert (=> b!462599 (= lt!209237 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8345))))

(declare-fun b!462600 () Bool)

(declare-fun e!269980 () Bool)

(declare-fun tp_is_empty!12509 () Bool)

(assert (=> b!462600 (= e!269980 tp_is_empty!12509)))

(declare-fun mapIsEmpty!20434 () Bool)

(declare-fun mapRes!20434 () Bool)

(assert (=> mapIsEmpty!20434 mapRes!20434))

(declare-fun b!462601 () Bool)

(declare-fun res!276645 () Bool)

(assert (=> b!462601 (=> (not res!276645) (not e!269978))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((V!17783 0))(
  ( (V!17784 (val!6299 Int)) )
))
(declare-datatypes ((ValueCell!5911 0))(
  ( (ValueCellFull!5911 (v!8586 V!17783)) (EmptyCell!5911) )
))
(declare-datatypes ((array!28819 0))(
  ( (array!28820 (arr!13843 (Array (_ BitVec 32) ValueCell!5911)) (size!14195 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28819)

(assert (=> b!462601 (= res!276645 (and (= (size!14195 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14194 _keys!1025) (size!14195 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!462602 () Bool)

(declare-fun res!276646 () Bool)

(assert (=> b!462602 (=> (not res!276646) (not e!269978))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28817 (_ BitVec 32)) Bool)

(assert (=> b!462602 (= res!276646 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!462603 () Bool)

(declare-fun e!269982 () Bool)

(assert (=> b!462603 (= e!269982 tp_is_empty!12509)))

(declare-fun res!276647 () Bool)

(assert (=> start!41392 (=> (not res!276647) (not e!269978))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41392 (= res!276647 (validMask!0 mask!1365))))

(assert (=> start!41392 e!269978))

(assert (=> start!41392 true))

(declare-fun array_inv!10008 (array!28817) Bool)

(assert (=> start!41392 (array_inv!10008 _keys!1025)))

(declare-fun e!269979 () Bool)

(declare-fun array_inv!10009 (array!28819) Bool)

(assert (=> start!41392 (and (array_inv!10009 _values!833) e!269979)))

(declare-fun mapNonEmpty!20434 () Bool)

(declare-fun tp!39253 () Bool)

(assert (=> mapNonEmpty!20434 (= mapRes!20434 (and tp!39253 e!269982))))

(declare-fun mapKey!20434 () (_ BitVec 32))

(declare-fun mapValue!20434 () ValueCell!5911)

(declare-fun mapRest!20434 () (Array (_ BitVec 32) ValueCell!5911))

(assert (=> mapNonEmpty!20434 (= (arr!13843 _values!833) (store mapRest!20434 mapKey!20434 mapValue!20434))))

(declare-fun b!462604 () Bool)

(assert (=> b!462604 (= e!269979 (and e!269980 mapRes!20434))))

(declare-fun condMapEmpty!20434 () Bool)

(declare-fun mapDefault!20434 () ValueCell!5911)

