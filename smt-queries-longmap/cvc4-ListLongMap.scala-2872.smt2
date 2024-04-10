; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41356 () Bool)

(assert start!41356)

(declare-fun b!462275 () Bool)

(declare-fun e!269711 () Bool)

(assert (=> b!462275 (= e!269711 false)))

(declare-fun lt!209183 () Bool)

(declare-datatypes ((array!28749 0))(
  ( (array!28750 (arr!13808 (Array (_ BitVec 32) (_ BitVec 64))) (size!14160 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28749)

(declare-datatypes ((List!8337 0))(
  ( (Nil!8334) (Cons!8333 (h!9189 (_ BitVec 64)) (t!14281 List!8337)) )
))
(declare-fun arrayNoDuplicates!0 (array!28749 (_ BitVec 32) List!8337) Bool)

(assert (=> b!462275 (= lt!209183 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8334))))

(declare-fun b!462276 () Bool)

(declare-fun e!269708 () Bool)

(declare-fun tp_is_empty!12473 () Bool)

(assert (=> b!462276 (= e!269708 tp_is_empty!12473)))

(declare-fun res!276484 () Bool)

(assert (=> start!41356 (=> (not res!276484) (not e!269711))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41356 (= res!276484 (validMask!0 mask!1365))))

(assert (=> start!41356 e!269711))

(assert (=> start!41356 true))

(declare-fun array_inv!9984 (array!28749) Bool)

(assert (=> start!41356 (array_inv!9984 _keys!1025)))

(declare-datatypes ((V!17735 0))(
  ( (V!17736 (val!6281 Int)) )
))
(declare-datatypes ((ValueCell!5893 0))(
  ( (ValueCellFull!5893 (v!8568 V!17735)) (EmptyCell!5893) )
))
(declare-datatypes ((array!28751 0))(
  ( (array!28752 (arr!13809 (Array (_ BitVec 32) ValueCell!5893)) (size!14161 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28751)

(declare-fun e!269712 () Bool)

(declare-fun array_inv!9985 (array!28751) Bool)

(assert (=> start!41356 (and (array_inv!9985 _values!833) e!269712)))

(declare-fun b!462277 () Bool)

(declare-fun res!276485 () Bool)

(assert (=> b!462277 (=> (not res!276485) (not e!269711))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!462277 (= res!276485 (and (= (size!14161 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14160 _keys!1025) (size!14161 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!20380 () Bool)

(declare-fun mapRes!20380 () Bool)

(assert (=> mapIsEmpty!20380 mapRes!20380))

(declare-fun b!462278 () Bool)

(declare-fun e!269710 () Bool)

(assert (=> b!462278 (= e!269710 tp_is_empty!12473)))

(declare-fun mapNonEmpty!20380 () Bool)

(declare-fun tp!39199 () Bool)

(assert (=> mapNonEmpty!20380 (= mapRes!20380 (and tp!39199 e!269708))))

(declare-fun mapKey!20380 () (_ BitVec 32))

(declare-fun mapValue!20380 () ValueCell!5893)

(declare-fun mapRest!20380 () (Array (_ BitVec 32) ValueCell!5893))

(assert (=> mapNonEmpty!20380 (= (arr!13809 _values!833) (store mapRest!20380 mapKey!20380 mapValue!20380))))

(declare-fun b!462279 () Bool)

(assert (=> b!462279 (= e!269712 (and e!269710 mapRes!20380))))

(declare-fun condMapEmpty!20380 () Bool)

(declare-fun mapDefault!20380 () ValueCell!5893)

