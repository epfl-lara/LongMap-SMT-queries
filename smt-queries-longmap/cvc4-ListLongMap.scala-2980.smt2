; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42160 () Bool)

(assert start!42160)

(declare-fun b_free!11693 () Bool)

(declare-fun b_next!11693 () Bool)

(assert (=> start!42160 (= b_free!11693 (not b_next!11693))))

(declare-fun tp!41101 () Bool)

(declare-fun b_and!20115 () Bool)

(assert (=> start!42160 (= tp!41101 b_and!20115)))

(declare-fun res!281223 () Bool)

(declare-fun e!275751 () Bool)

(assert (=> start!42160 (=> (not res!281223) (not e!275751))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42160 (= res!281223 (validMask!0 mask!1365))))

(assert (=> start!42160 e!275751))

(declare-fun tp_is_empty!13121 () Bool)

(assert (=> start!42160 tp_is_empty!13121))

(assert (=> start!42160 tp!41101))

(assert (=> start!42160 true))

(declare-datatypes ((array!30009 0))(
  ( (array!30010 (arr!14428 (Array (_ BitVec 32) (_ BitVec 64))) (size!14780 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30009)

(declare-fun array_inv!10410 (array!30009) Bool)

(assert (=> start!42160 (array_inv!10410 _keys!1025)))

(declare-datatypes ((V!18599 0))(
  ( (V!18600 (val!6605 Int)) )
))
(declare-datatypes ((ValueCell!6217 0))(
  ( (ValueCellFull!6217 (v!8896 V!18599)) (EmptyCell!6217) )
))
(declare-datatypes ((array!30011 0))(
  ( (array!30012 (arr!14429 (Array (_ BitVec 32) ValueCell!6217)) (size!14781 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30011)

(declare-fun e!275752 () Bool)

(declare-fun array_inv!10411 (array!30011) Bool)

(assert (=> start!42160 (and (array_inv!10411 _values!833) e!275752)))

(declare-fun mapIsEmpty!21382 () Bool)

(declare-fun mapRes!21382 () Bool)

(assert (=> mapIsEmpty!21382 mapRes!21382))

(declare-fun b!470657 () Bool)

(declare-fun res!281226 () Bool)

(assert (=> b!470657 (=> (not res!281226) (not e!275751))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30009 (_ BitVec 32)) Bool)

(assert (=> b!470657 (= res!281226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!470658 () Bool)

(declare-fun res!281224 () Bool)

(assert (=> b!470658 (=> (not res!281224) (not e!275751))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!470658 (= res!281224 (and (= (size!14781 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14780 _keys!1025) (size!14781 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!470659 () Bool)

(declare-fun e!275753 () Bool)

(assert (=> b!470659 (= e!275753 tp_is_empty!13121)))

(declare-fun b!470660 () Bool)

(declare-fun e!275754 () Bool)

(assert (=> b!470660 (= e!275752 (and e!275754 mapRes!21382))))

(declare-fun condMapEmpty!21382 () Bool)

(declare-fun mapDefault!21382 () ValueCell!6217)

