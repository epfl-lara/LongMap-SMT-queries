; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42254 () Bool)

(assert start!42254)

(declare-fun b_free!11759 () Bool)

(declare-fun b_next!11759 () Bool)

(assert (=> start!42254 (= b_free!11759 (not b_next!11759))))

(declare-fun tp!41304 () Bool)

(declare-fun b_and!20197 () Bool)

(assert (=> start!42254 (= tp!41304 b_and!20197)))

(declare-fun b!471520 () Bool)

(declare-fun res!281681 () Bool)

(declare-fun e!276357 () Bool)

(assert (=> b!471520 (=> (not res!281681) (not e!276357))))

(declare-datatypes ((array!30137 0))(
  ( (array!30138 (arr!14490 (Array (_ BitVec 32) (_ BitVec 64))) (size!14842 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30137)

(declare-datatypes ((List!8821 0))(
  ( (Nil!8818) (Cons!8817 (h!9673 (_ BitVec 64)) (t!14787 List!8821)) )
))
(declare-fun arrayNoDuplicates!0 (array!30137 (_ BitVec 32) List!8821) Bool)

(assert (=> b!471520 (= res!281681 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8818))))

(declare-fun b!471521 () Bool)

(declare-fun res!281682 () Bool)

(assert (=> b!471521 (=> (not res!281682) (not e!276357))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((V!18687 0))(
  ( (V!18688 (val!6638 Int)) )
))
(declare-datatypes ((ValueCell!6250 0))(
  ( (ValueCellFull!6250 (v!8929 V!18687)) (EmptyCell!6250) )
))
(declare-datatypes ((array!30139 0))(
  ( (array!30140 (arr!14491 (Array (_ BitVec 32) ValueCell!6250)) (size!14843 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30139)

(assert (=> b!471521 (= res!281682 (and (= (size!14843 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14842 _keys!1025) (size!14843 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!21487 () Bool)

(declare-fun mapRes!21487 () Bool)

(declare-fun tp!41305 () Bool)

(declare-fun e!276360 () Bool)

(assert (=> mapNonEmpty!21487 (= mapRes!21487 (and tp!41305 e!276360))))

(declare-fun mapRest!21487 () (Array (_ BitVec 32) ValueCell!6250))

(declare-fun mapKey!21487 () (_ BitVec 32))

(declare-fun mapValue!21487 () ValueCell!6250)

(assert (=> mapNonEmpty!21487 (= (arr!14491 _values!833) (store mapRest!21487 mapKey!21487 mapValue!21487))))

(declare-fun b!471522 () Bool)

(declare-fun res!281683 () Bool)

(assert (=> b!471522 (=> (not res!281683) (not e!276357))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30137 (_ BitVec 32)) Bool)

(assert (=> b!471522 (= res!281683 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!471523 () Bool)

(declare-fun e!276359 () Bool)

(declare-fun e!276356 () Bool)

(assert (=> b!471523 (= e!276359 (and e!276356 mapRes!21487))))

(declare-fun condMapEmpty!21487 () Bool)

(declare-fun mapDefault!21487 () ValueCell!6250)

