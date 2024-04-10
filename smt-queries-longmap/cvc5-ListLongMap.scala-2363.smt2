; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37640 () Bool)

(assert start!37640)

(declare-fun res!219840 () Bool)

(declare-fun e!233888 () Bool)

(assert (=> start!37640 (=> (not res!219840) (not e!233888))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37640 (= res!219840 (validMask!0 mask!970))))

(assert (=> start!37640 e!233888))

(assert (=> start!37640 true))

(declare-datatypes ((V!13659 0))(
  ( (V!13660 (val!4752 Int)) )
))
(declare-datatypes ((ValueCell!4364 0))(
  ( (ValueCellFull!4364 (v!6949 V!13659)) (EmptyCell!4364) )
))
(declare-datatypes ((array!22731 0))(
  ( (array!22732 (arr!10834 (Array (_ BitVec 32) ValueCell!4364)) (size!11186 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22731)

(declare-fun e!233890 () Bool)

(declare-fun array_inv!7974 (array!22731) Bool)

(assert (=> start!37640 (and (array_inv!7974 _values!506) e!233890)))

(declare-datatypes ((array!22733 0))(
  ( (array!22734 (arr!10835 (Array (_ BitVec 32) (_ BitVec 64))) (size!11187 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22733)

(declare-fun array_inv!7975 (array!22733) Bool)

(assert (=> start!37640 (array_inv!7975 _keys!658)))

(declare-fun b!385386 () Bool)

(assert (=> b!385386 (= e!233888 false)))

(declare-fun lt!181605 () Bool)

(declare-datatypes ((List!6239 0))(
  ( (Nil!6236) (Cons!6235 (h!7091 (_ BitVec 64)) (t!11389 List!6239)) )
))
(declare-fun arrayNoDuplicates!0 (array!22733 (_ BitVec 32) List!6239) Bool)

(assert (=> b!385386 (= lt!181605 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6236))))

(declare-fun b!385387 () Bool)

(declare-fun e!233887 () Bool)

(declare-fun tp_is_empty!9415 () Bool)

(assert (=> b!385387 (= e!233887 tp_is_empty!9415)))

(declare-fun b!385388 () Bool)

(declare-fun res!219842 () Bool)

(assert (=> b!385388 (=> (not res!219842) (not e!233888))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22733 (_ BitVec 32)) Bool)

(assert (=> b!385388 (= res!219842 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!385389 () Bool)

(declare-fun e!233891 () Bool)

(assert (=> b!385389 (= e!233891 tp_is_empty!9415)))

(declare-fun b!385390 () Bool)

(declare-fun mapRes!15687 () Bool)

(assert (=> b!385390 (= e!233890 (and e!233887 mapRes!15687))))

(declare-fun condMapEmpty!15687 () Bool)

(declare-fun mapDefault!15687 () ValueCell!4364)

