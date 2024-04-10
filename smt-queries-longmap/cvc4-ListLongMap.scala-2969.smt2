; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42074 () Bool)

(assert start!42074)

(declare-fun b_free!11627 () Bool)

(declare-fun b_next!11627 () Bool)

(assert (=> start!42074 (= b_free!11627 (not b_next!11627))))

(declare-fun tp!40900 () Bool)

(declare-fun b_and!20037 () Bool)

(assert (=> start!42074 (= tp!40900 b_and!20037)))

(declare-fun b!469757 () Bool)

(declare-fun res!280723 () Bool)

(declare-fun e!275117 () Bool)

(assert (=> b!469757 (=> (not res!280723) (not e!275117))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29881 0))(
  ( (array!29882 (arr!14365 (Array (_ BitVec 32) (_ BitVec 64))) (size!14717 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29881)

(declare-datatypes ((V!18511 0))(
  ( (V!18512 (val!6572 Int)) )
))
(declare-datatypes ((ValueCell!6184 0))(
  ( (ValueCellFull!6184 (v!8862 V!18511)) (EmptyCell!6184) )
))
(declare-datatypes ((array!29883 0))(
  ( (array!29884 (arr!14366 (Array (_ BitVec 32) ValueCell!6184)) (size!14718 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29883)

(assert (=> b!469757 (= res!280723 (and (= (size!14718 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14717 _keys!1025) (size!14718 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!469758 () Bool)

(declare-fun e!275116 () Bool)

(declare-fun tp_is_empty!13055 () Bool)

(assert (=> b!469758 (= e!275116 tp_is_empty!13055)))

(declare-fun b!469759 () Bool)

(declare-fun e!275121 () Bool)

(declare-fun mapRes!21280 () Bool)

(assert (=> b!469759 (= e!275121 (and e!275116 mapRes!21280))))

(declare-fun condMapEmpty!21280 () Bool)

(declare-fun mapDefault!21280 () ValueCell!6184)

