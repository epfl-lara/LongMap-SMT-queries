; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42296 () Bool)

(assert start!42296)

(declare-fun b_free!11801 () Bool)

(declare-fun b_next!11801 () Bool)

(assert (=> start!42296 (= b_free!11801 (not b_next!11801))))

(declare-fun tp!41430 () Bool)

(declare-fun b_and!20239 () Bool)

(assert (=> start!42296 (= tp!41430 b_and!20239)))

(declare-fun b!471962 () Bool)

(declare-fun res!281933 () Bool)

(declare-fun e!276675 () Bool)

(assert (=> b!471962 (=> (not res!281933) (not e!276675))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30215 0))(
  ( (array!30216 (arr!14529 (Array (_ BitVec 32) (_ BitVec 64))) (size!14881 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30215)

(declare-datatypes ((V!18743 0))(
  ( (V!18744 (val!6659 Int)) )
))
(declare-datatypes ((ValueCell!6271 0))(
  ( (ValueCellFull!6271 (v!8950 V!18743)) (EmptyCell!6271) )
))
(declare-datatypes ((array!30217 0))(
  ( (array!30218 (arr!14530 (Array (_ BitVec 32) ValueCell!6271)) (size!14882 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30217)

(assert (=> b!471962 (= res!281933 (and (= (size!14882 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14881 _keys!1025) (size!14882 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!471963 () Bool)

(declare-fun res!281934 () Bool)

(assert (=> b!471963 (=> (not res!281934) (not e!276675))))

(declare-datatypes ((List!8848 0))(
  ( (Nil!8845) (Cons!8844 (h!9700 (_ BitVec 64)) (t!14814 List!8848)) )
))
(declare-fun arrayNoDuplicates!0 (array!30215 (_ BitVec 32) List!8848) Bool)

(assert (=> b!471963 (= res!281934 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8845))))

(declare-fun mapNonEmpty!21550 () Bool)

(declare-fun mapRes!21550 () Bool)

(declare-fun tp!41431 () Bool)

(declare-fun e!276671 () Bool)

(assert (=> mapNonEmpty!21550 (= mapRes!21550 (and tp!41431 e!276671))))

(declare-fun mapKey!21550 () (_ BitVec 32))

(declare-fun mapValue!21550 () ValueCell!6271)

(declare-fun mapRest!21550 () (Array (_ BitVec 32) ValueCell!6271))

(assert (=> mapNonEmpty!21550 (= (arr!14530 _values!833) (store mapRest!21550 mapKey!21550 mapValue!21550))))

(declare-fun b!471964 () Bool)

(declare-fun e!276673 () Bool)

(declare-fun e!276674 () Bool)

(assert (=> b!471964 (= e!276673 (and e!276674 mapRes!21550))))

(declare-fun condMapEmpty!21550 () Bool)

(declare-fun mapDefault!21550 () ValueCell!6271)

