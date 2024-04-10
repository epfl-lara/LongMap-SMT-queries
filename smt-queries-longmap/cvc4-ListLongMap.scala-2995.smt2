; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42278 () Bool)

(assert start!42278)

(declare-fun b_free!11783 () Bool)

(declare-fun b_next!11783 () Bool)

(assert (=> start!42278 (= b_free!11783 (not b_next!11783))))

(declare-fun tp!41377 () Bool)

(declare-fun b_and!20221 () Bool)

(assert (=> start!42278 (= tp!41377 b_and!20221)))

(declare-fun b!471772 () Bool)

(declare-fun res!281827 () Bool)

(declare-fun e!276540 () Bool)

(assert (=> b!471772 (=> (not res!281827) (not e!276540))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30183 0))(
  ( (array!30184 (arr!14513 (Array (_ BitVec 32) (_ BitVec 64))) (size!14865 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30183)

(declare-datatypes ((V!18719 0))(
  ( (V!18720 (val!6650 Int)) )
))
(declare-datatypes ((ValueCell!6262 0))(
  ( (ValueCellFull!6262 (v!8941 V!18719)) (EmptyCell!6262) )
))
(declare-datatypes ((array!30185 0))(
  ( (array!30186 (arr!14514 (Array (_ BitVec 32) ValueCell!6262)) (size!14866 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30185)

(assert (=> b!471772 (= res!281827 (and (= (size!14866 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14865 _keys!1025) (size!14866 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!471773 () Bool)

(declare-fun e!276536 () Bool)

(declare-fun tp_is_empty!13211 () Bool)

(assert (=> b!471773 (= e!276536 tp_is_empty!13211)))

(declare-fun b!471774 () Bool)

(declare-fun e!276537 () Bool)

(assert (=> b!471774 (= e!276537 tp_is_empty!13211)))

(declare-fun b!471775 () Bool)

(declare-fun res!281825 () Bool)

(assert (=> b!471775 (=> (not res!281825) (not e!276540))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30183 (_ BitVec 32)) Bool)

(assert (=> b!471775 (= res!281825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!21523 () Bool)

(declare-fun mapRes!21523 () Bool)

(assert (=> mapIsEmpty!21523 mapRes!21523))

(declare-fun b!471776 () Bool)

(declare-fun e!276538 () Bool)

(assert (=> b!471776 (= e!276538 (and e!276537 mapRes!21523))))

(declare-fun condMapEmpty!21523 () Bool)

(declare-fun mapDefault!21523 () ValueCell!6262)

