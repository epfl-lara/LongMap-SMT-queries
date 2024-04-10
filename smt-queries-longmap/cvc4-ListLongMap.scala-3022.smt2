; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42490 () Bool)

(assert start!42490)

(declare-fun b_free!11945 () Bool)

(declare-fun b_next!11945 () Bool)

(assert (=> start!42490 (= b_free!11945 (not b_next!11945))))

(declare-fun tp!41871 () Bool)

(declare-fun b_and!20413 () Bool)

(assert (=> start!42490 (= tp!41871 b_and!20413)))

(declare-fun res!283175 () Bool)

(declare-fun e!278219 () Bool)

(assert (=> start!42490 (=> (not res!283175) (not e!278219))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42490 (= res!283175 (validMask!0 mask!1365))))

(assert (=> start!42490 e!278219))

(declare-fun tp_is_empty!13373 () Bool)

(assert (=> start!42490 tp_is_empty!13373))

(assert (=> start!42490 tp!41871))

(assert (=> start!42490 true))

(declare-datatypes ((array!30499 0))(
  ( (array!30500 (arr!14668 (Array (_ BitVec 32) (_ BitVec 64))) (size!15020 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30499)

(declare-fun array_inv!10584 (array!30499) Bool)

(assert (=> start!42490 (array_inv!10584 _keys!1025)))

(declare-datatypes ((V!18935 0))(
  ( (V!18936 (val!6731 Int)) )
))
(declare-datatypes ((ValueCell!6343 0))(
  ( (ValueCellFull!6343 (v!9023 V!18935)) (EmptyCell!6343) )
))
(declare-datatypes ((array!30501 0))(
  ( (array!30502 (arr!14669 (Array (_ BitVec 32) ValueCell!6343)) (size!15021 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30501)

(declare-fun e!278223 () Bool)

(declare-fun array_inv!10585 (array!30501) Bool)

(assert (=> start!42490 (and (array_inv!10585 _values!833) e!278223)))

(declare-fun b!474093 () Bool)

(declare-fun res!283172 () Bool)

(assert (=> b!474093 (=> (not res!283172) (not e!278219))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30499 (_ BitVec 32)) Bool)

(assert (=> b!474093 (= res!283172 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!474094 () Bool)

(declare-fun res!283171 () Bool)

(assert (=> b!474094 (=> (not res!283171) (not e!278219))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!474094 (= res!283171 (and (= (size!15021 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15020 _keys!1025) (size!15021 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!474095 () Bool)

(declare-fun e!278220 () Bool)

(declare-fun mapRes!21775 () Bool)

(assert (=> b!474095 (= e!278223 (and e!278220 mapRes!21775))))

(declare-fun condMapEmpty!21775 () Bool)

(declare-fun mapDefault!21775 () ValueCell!6343)

