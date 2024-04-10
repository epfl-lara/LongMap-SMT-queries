; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42228 () Bool)

(assert start!42228)

(declare-fun b_free!11747 () Bool)

(declare-fun b_next!11747 () Bool)

(assert (=> start!42228 (= b_free!11747 (not b_next!11747))))

(declare-fun tp!41266 () Bool)

(declare-fun b_and!20177 () Bool)

(assert (=> start!42228 (= tp!41266 b_and!20177)))

(declare-fun b!471309 () Bool)

(declare-fun res!281580 () Bool)

(declare-fun e!276213 () Bool)

(assert (=> b!471309 (=> (not res!281580) (not e!276213))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30113 0))(
  ( (array!30114 (arr!14479 (Array (_ BitVec 32) (_ BitVec 64))) (size!14831 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30113)

(declare-datatypes ((V!18671 0))(
  ( (V!18672 (val!6632 Int)) )
))
(declare-datatypes ((ValueCell!6244 0))(
  ( (ValueCellFull!6244 (v!8923 V!18671)) (EmptyCell!6244) )
))
(declare-datatypes ((array!30115 0))(
  ( (array!30116 (arr!14480 (Array (_ BitVec 32) ValueCell!6244)) (size!14832 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30115)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!471309 (= res!281580 (and (= (size!14832 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14831 _keys!1025) (size!14832 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!471310 () Bool)

(declare-fun e!276212 () Bool)

(declare-fun e!276215 () Bool)

(declare-fun mapRes!21466 () Bool)

(assert (=> b!471310 (= e!276212 (and e!276215 mapRes!21466))))

(declare-fun condMapEmpty!21466 () Bool)

(declare-fun mapDefault!21466 () ValueCell!6244)

