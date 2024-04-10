; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41446 () Bool)

(assert start!41446)

(declare-fun b_free!11125 () Bool)

(declare-fun b_next!11125 () Bool)

(assert (=> start!41446 (= b_free!11125 (not b_next!11125))))

(declare-fun tp!39370 () Bool)

(declare-fun b_and!19461 () Bool)

(assert (=> start!41446 (= tp!39370 b_and!19461)))

(declare-fun b!463086 () Bool)

(declare-fun res!276915 () Bool)

(declare-fun e!270336 () Bool)

(assert (=> b!463086 (=> (not res!276915) (not e!270336))))

(declare-datatypes ((array!28903 0))(
  ( (array!28904 (arr!13884 (Array (_ BitVec 32) (_ BitVec 64))) (size!14236 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28903)

(declare-datatypes ((List!8373 0))(
  ( (Nil!8370) (Cons!8369 (h!9225 (_ BitVec 64)) (t!14317 List!8373)) )
))
(declare-fun arrayNoDuplicates!0 (array!28903 (_ BitVec 32) List!8373) Bool)

(assert (=> b!463086 (= res!276915 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8370))))

(declare-fun b!463087 () Bool)

(declare-fun res!276916 () Bool)

(assert (=> b!463087 (=> (not res!276916) (not e!270336))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28903 (_ BitVec 32)) Bool)

(assert (=> b!463087 (= res!276916 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!276914 () Bool)

(assert (=> start!41446 (=> (not res!276914) (not e!270336))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41446 (= res!276914 (validMask!0 mask!1365))))

(assert (=> start!41446 e!270336))

(declare-fun tp_is_empty!12553 () Bool)

(assert (=> start!41446 tp_is_empty!12553))

(assert (=> start!41446 tp!39370))

(assert (=> start!41446 true))

(declare-fun array_inv!10036 (array!28903) Bool)

(assert (=> start!41446 (array_inv!10036 _keys!1025)))

(declare-datatypes ((V!17843 0))(
  ( (V!17844 (val!6321 Int)) )
))
(declare-datatypes ((ValueCell!5933 0))(
  ( (ValueCellFull!5933 (v!8608 V!17843)) (EmptyCell!5933) )
))
(declare-datatypes ((array!28905 0))(
  ( (array!28906 (arr!13885 (Array (_ BitVec 32) ValueCell!5933)) (size!14237 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28905)

(declare-fun e!270338 () Bool)

(declare-fun array_inv!10037 (array!28905) Bool)

(assert (=> start!41446 (and (array_inv!10037 _values!833) e!270338)))

(declare-fun b!463088 () Bool)

(declare-fun res!276917 () Bool)

(assert (=> b!463088 (=> (not res!276917) (not e!270336))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!463088 (= res!276917 (and (= (size!14237 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14236 _keys!1025) (size!14237 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!20503 () Bool)

(declare-fun mapRes!20503 () Bool)

(declare-fun tp!39369 () Bool)

(declare-fun e!270339 () Bool)

(assert (=> mapNonEmpty!20503 (= mapRes!20503 (and tp!39369 e!270339))))

(declare-fun mapValue!20503 () ValueCell!5933)

(declare-fun mapRest!20503 () (Array (_ BitVec 32) ValueCell!5933))

(declare-fun mapKey!20503 () (_ BitVec 32))

(assert (=> mapNonEmpty!20503 (= (arr!13885 _values!833) (store mapRest!20503 mapKey!20503 mapValue!20503))))

(declare-fun b!463089 () Bool)

(assert (=> b!463089 (= e!270339 tp_is_empty!12553)))

(declare-fun b!463090 () Bool)

(declare-fun e!270337 () Bool)

(assert (=> b!463090 (= e!270338 (and e!270337 mapRes!20503))))

(declare-fun condMapEmpty!20503 () Bool)

(declare-fun mapDefault!20503 () ValueCell!5933)

