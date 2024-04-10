; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33606 () Bool)

(assert start!33606)

(declare-fun b_free!6841 () Bool)

(declare-fun b_next!6841 () Bool)

(assert (=> start!33606 (= b_free!6841 (not b_next!6841))))

(declare-fun tp!24026 () Bool)

(declare-fun b_and!14021 () Bool)

(assert (=> start!33606 (= tp!24026 b_and!14021)))

(declare-fun b!333449 () Bool)

(declare-fun e!204752 () Bool)

(declare-fun tp_is_empty!6793 () Bool)

(assert (=> b!333449 (= e!204752 tp_is_empty!6793)))

(declare-fun b!333450 () Bool)

(declare-fun e!204753 () Bool)

(assert (=> b!333450 (= e!204753 false)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((array!17183 0))(
  ( (array!17184 (arr!8122 (Array (_ BitVec 32) (_ BitVec 64))) (size!8474 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17183)

(declare-datatypes ((SeekEntryResult!3137 0))(
  ( (MissingZero!3137 (index!14727 (_ BitVec 32))) (Found!3137 (index!14728 (_ BitVec 32))) (Intermediate!3137 (undefined!3949 Bool) (index!14729 (_ BitVec 32)) (x!33215 (_ BitVec 32))) (Undefined!3137) (MissingVacant!3137 (index!14730 (_ BitVec 32))) )
))
(declare-fun lt!159364 () SeekEntryResult!3137)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17183 (_ BitVec 32)) SeekEntryResult!3137)

(assert (=> b!333450 (= lt!159364 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!333451 () Bool)

(declare-fun e!204754 () Bool)

(declare-fun e!204756 () Bool)

(declare-fun mapRes!11586 () Bool)

(assert (=> b!333451 (= e!204754 (and e!204756 mapRes!11586))))

(declare-fun condMapEmpty!11586 () Bool)

(declare-datatypes ((V!10035 0))(
  ( (V!10036 (val!3441 Int)) )
))
(declare-datatypes ((ValueCell!3053 0))(
  ( (ValueCellFull!3053 (v!5603 V!10035)) (EmptyCell!3053) )
))
(declare-datatypes ((array!17185 0))(
  ( (array!17186 (arr!8123 (Array (_ BitVec 32) ValueCell!3053)) (size!8475 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17185)

(declare-fun mapDefault!11586 () ValueCell!3053)

