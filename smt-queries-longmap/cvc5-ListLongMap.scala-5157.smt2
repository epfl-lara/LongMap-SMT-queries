; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69906 () Bool)

(assert start!69906)

(declare-fun mapIsEmpty!22663 () Bool)

(declare-fun mapRes!22663 () Bool)

(assert (=> mapIsEmpty!22663 mapRes!22663))

(declare-fun b!812718 () Bool)

(declare-fun res!555316 () Bool)

(declare-fun e!450226 () Bool)

(assert (=> b!812718 (=> (not res!555316) (not e!450226))))

(declare-datatypes ((array!44336 0))(
  ( (array!44337 (arr!21230 (Array (_ BitVec 32) (_ BitVec 64))) (size!21651 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44336)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!23747 0))(
  ( (V!23748 (val!7077 Int)) )
))
(declare-datatypes ((ValueCell!6614 0))(
  ( (ValueCellFull!6614 (v!9504 V!23747)) (EmptyCell!6614) )
))
(declare-datatypes ((array!44338 0))(
  ( (array!44339 (arr!21231 (Array (_ BitVec 32) ValueCell!6614)) (size!21652 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44338)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!812718 (= res!555316 (and (= (size!21652 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21651 _keys!976) (size!21652 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!812719 () Bool)

(assert (=> b!812719 (= e!450226 false)))

(declare-fun lt!364185 () Bool)

(declare-datatypes ((List!15105 0))(
  ( (Nil!15102) (Cons!15101 (h!16230 (_ BitVec 64)) (t!21420 List!15105)) )
))
(declare-fun arrayNoDuplicates!0 (array!44336 (_ BitVec 32) List!15105) Bool)

(assert (=> b!812719 (= lt!364185 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15102))))

(declare-fun b!812720 () Bool)

(declare-fun e!450227 () Bool)

(declare-fun e!450228 () Bool)

(assert (=> b!812720 (= e!450227 (and e!450228 mapRes!22663))))

(declare-fun condMapEmpty!22663 () Bool)

(declare-fun mapDefault!22663 () ValueCell!6614)

