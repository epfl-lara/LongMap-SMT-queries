; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42162 () Bool)

(assert start!42162)

(declare-fun b_free!11695 () Bool)

(declare-fun b_next!11695 () Bool)

(assert (=> start!42162 (= b_free!11695 (not b_next!11695))))

(declare-fun tp!41107 () Bool)

(declare-fun b_and!20117 () Bool)

(assert (=> start!42162 (= tp!41107 b_and!20117)))

(declare-fun b!470678 () Bool)

(declare-fun res!281236 () Bool)

(declare-fun e!275766 () Bool)

(assert (=> b!470678 (=> (not res!281236) (not e!275766))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30013 0))(
  ( (array!30014 (arr!14430 (Array (_ BitVec 32) (_ BitVec 64))) (size!14782 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30013)

(declare-datatypes ((V!18603 0))(
  ( (V!18604 (val!6606 Int)) )
))
(declare-datatypes ((ValueCell!6218 0))(
  ( (ValueCellFull!6218 (v!8897 V!18603)) (EmptyCell!6218) )
))
(declare-datatypes ((array!30015 0))(
  ( (array!30016 (arr!14431 (Array (_ BitVec 32) ValueCell!6218)) (size!14783 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30015)

(assert (=> b!470678 (= res!281236 (and (= (size!14783 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14782 _keys!1025) (size!14783 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!470679 () Bool)

(declare-fun res!281235 () Bool)

(assert (=> b!470679 (=> (not res!281235) (not e!275766))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30013 (_ BitVec 32)) Bool)

(assert (=> b!470679 (= res!281235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!21385 () Bool)

(declare-fun mapRes!21385 () Bool)

(declare-fun tp!41106 () Bool)

(declare-fun e!275769 () Bool)

(assert (=> mapNonEmpty!21385 (= mapRes!21385 (and tp!41106 e!275769))))

(declare-fun mapRest!21385 () (Array (_ BitVec 32) ValueCell!6218))

(declare-fun mapValue!21385 () ValueCell!6218)

(declare-fun mapKey!21385 () (_ BitVec 32))

(assert (=> mapNonEmpty!21385 (= (arr!14431 _values!833) (store mapRest!21385 mapKey!21385 mapValue!21385))))

(declare-fun b!470680 () Bool)

(declare-fun e!275770 () Bool)

(declare-fun e!275768 () Bool)

(assert (=> b!470680 (= e!275770 (and e!275768 mapRes!21385))))

(declare-fun condMapEmpty!21385 () Bool)

(declare-fun mapDefault!21385 () ValueCell!6218)

