; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42200 () Bool)

(assert start!42200)

(declare-fun b_free!11719 () Bool)

(declare-fun b_next!11719 () Bool)

(assert (=> start!42200 (= b_free!11719 (not b_next!11719))))

(declare-fun tp!41181 () Bool)

(declare-fun b_and!20149 () Bool)

(assert (=> start!42200 (= tp!41181 b_and!20149)))

(declare-fun b!471015 () Bool)

(declare-fun res!281410 () Bool)

(declare-fun e!276001 () Bool)

(assert (=> b!471015 (=> (not res!281410) (not e!276001))))

(declare-datatypes ((array!30061 0))(
  ( (array!30062 (arr!14453 (Array (_ BitVec 32) (_ BitVec 64))) (size!14805 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30061)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30061 (_ BitVec 32)) Bool)

(assert (=> b!471015 (= res!281410 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!471016 () Bool)

(declare-fun res!281412 () Bool)

(assert (=> b!471016 (=> (not res!281412) (not e!276001))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((V!18635 0))(
  ( (V!18636 (val!6618 Int)) )
))
(declare-datatypes ((ValueCell!6230 0))(
  ( (ValueCellFull!6230 (v!8909 V!18635)) (EmptyCell!6230) )
))
(declare-datatypes ((array!30063 0))(
  ( (array!30064 (arr!14454 (Array (_ BitVec 32) ValueCell!6230)) (size!14806 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30063)

(assert (=> b!471016 (= res!281412 (and (= (size!14806 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14805 _keys!1025) (size!14806 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!471017 () Bool)

(declare-fun e!276002 () Bool)

(declare-fun e!276004 () Bool)

(declare-fun mapRes!21424 () Bool)

(assert (=> b!471017 (= e!276002 (and e!276004 mapRes!21424))))

(declare-fun condMapEmpty!21424 () Bool)

(declare-fun mapDefault!21424 () ValueCell!6230)

