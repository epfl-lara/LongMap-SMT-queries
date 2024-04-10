; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42166 () Bool)

(assert start!42166)

(declare-fun b_free!11699 () Bool)

(declare-fun b_next!11699 () Bool)

(assert (=> start!42166 (= b_free!11699 (not b_next!11699))))

(declare-fun tp!41118 () Bool)

(declare-fun b_and!20121 () Bool)

(assert (=> start!42166 (= tp!41118 b_and!20121)))

(declare-fun b!470720 () Bool)

(declare-fun res!281261 () Bool)

(declare-fun e!275796 () Bool)

(assert (=> b!470720 (=> (not res!281261) (not e!275796))))

(declare-datatypes ((array!30021 0))(
  ( (array!30022 (arr!14434 (Array (_ BitVec 32) (_ BitVec 64))) (size!14786 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30021)

(declare-datatypes ((List!8783 0))(
  ( (Nil!8780) (Cons!8779 (h!9635 (_ BitVec 64)) (t!14745 List!8783)) )
))
(declare-fun arrayNoDuplicates!0 (array!30021 (_ BitVec 32) List!8783) Bool)

(assert (=> b!470720 (= res!281261 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8780))))

(declare-fun b!470721 () Bool)

(declare-fun res!281260 () Bool)

(assert (=> b!470721 (=> (not res!281260) (not e!275796))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30021 (_ BitVec 32)) Bool)

(assert (=> b!470721 (= res!281260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!470723 () Bool)

(declare-fun e!275800 () Bool)

(declare-fun tp_is_empty!13127 () Bool)

(assert (=> b!470723 (= e!275800 tp_is_empty!13127)))

(declare-fun b!470724 () Bool)

(declare-fun e!275799 () Bool)

(declare-fun mapRes!21391 () Bool)

(assert (=> b!470724 (= e!275799 (and e!275800 mapRes!21391))))

(declare-fun condMapEmpty!21391 () Bool)

(declare-datatypes ((V!18607 0))(
  ( (V!18608 (val!6608 Int)) )
))
(declare-datatypes ((ValueCell!6220 0))(
  ( (ValueCellFull!6220 (v!8899 V!18607)) (EmptyCell!6220) )
))
(declare-datatypes ((array!30023 0))(
  ( (array!30024 (arr!14435 (Array (_ BitVec 32) ValueCell!6220)) (size!14787 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30023)

(declare-fun mapDefault!21391 () ValueCell!6220)

