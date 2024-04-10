; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70918 () Bool)

(assert start!70918)

(declare-fun b_free!13135 () Bool)

(declare-fun b_next!13135 () Bool)

(assert (=> start!70918 (= b_free!13135 (not b_next!13135))))

(declare-fun tp!46155 () Bool)

(declare-fun b_and!22031 () Bool)

(assert (=> start!70918 (= tp!46155 b_and!22031)))

(declare-fun b!823654 () Bool)

(declare-fun res!561642 () Bool)

(declare-fun e!458126 () Bool)

(assert (=> b!823654 (=> (not res!561642) (not e!458126))))

(declare-datatypes ((array!45882 0))(
  ( (array!45883 (arr!21989 (Array (_ BitVec 32) (_ BitVec 64))) (size!22410 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45882)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45882 (_ BitVec 32)) Bool)

(assert (=> b!823654 (= res!561642 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!823655 () Bool)

(declare-fun e!458125 () Bool)

(declare-fun e!458127 () Bool)

(declare-fun mapRes!23884 () Bool)

(assert (=> b!823655 (= e!458125 (and e!458127 mapRes!23884))))

(declare-fun condMapEmpty!23884 () Bool)

(declare-datatypes ((V!24795 0))(
  ( (V!24796 (val!7470 Int)) )
))
(declare-datatypes ((ValueCell!7007 0))(
  ( (ValueCellFull!7007 (v!9903 V!24795)) (EmptyCell!7007) )
))
(declare-datatypes ((array!45884 0))(
  ( (array!45885 (arr!21990 (Array (_ BitVec 32) ValueCell!7007)) (size!22411 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45884)

(declare-fun mapDefault!23884 () ValueCell!7007)

