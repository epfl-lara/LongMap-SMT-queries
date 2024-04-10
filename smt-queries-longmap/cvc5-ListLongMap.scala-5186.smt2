; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70102 () Bool)

(assert start!70102)

(declare-fun b_free!12523 () Bool)

(declare-fun b_next!12523 () Bool)

(assert (=> start!70102 (= b_free!12523 (not b_next!12523))))

(declare-fun tp!44283 () Bool)

(declare-fun b_and!21295 () Bool)

(assert (=> start!70102 (= tp!44283 b_and!21295)))

(declare-fun b!814646 () Bool)

(declare-fun res!556395 () Bool)

(declare-fun e!451606 () Bool)

(assert (=> b!814646 (=> (not res!556395) (not e!451606))))

(declare-datatypes ((array!44668 0))(
  ( (array!44669 (arr!21394 (Array (_ BitVec 32) (_ BitVec 64))) (size!21815 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44668)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44668 (_ BitVec 32)) Bool)

(assert (=> b!814646 (= res!556395 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!814647 () Bool)

(declare-fun res!556397 () Bool)

(assert (=> b!814647 (=> (not res!556397) (not e!451606))))

(declare-datatypes ((List!15221 0))(
  ( (Nil!15218) (Cons!15217 (h!16346 (_ BitVec 64)) (t!21538 List!15221)) )
))
(declare-fun arrayNoDuplicates!0 (array!44668 (_ BitVec 32) List!15221) Bool)

(assert (=> b!814647 (= res!556397 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15218))))

(declare-fun b!814648 () Bool)

(declare-fun e!451605 () Bool)

(declare-fun e!451607 () Bool)

(declare-fun mapRes!22930 () Bool)

(assert (=> b!814648 (= e!451605 (and e!451607 mapRes!22930))))

(declare-fun condMapEmpty!22930 () Bool)

(declare-datatypes ((V!23979 0))(
  ( (V!23980 (val!7164 Int)) )
))
(declare-datatypes ((ValueCell!6701 0))(
  ( (ValueCellFull!6701 (v!9591 V!23979)) (EmptyCell!6701) )
))
(declare-datatypes ((array!44670 0))(
  ( (array!44671 (arr!21395 (Array (_ BitVec 32) ValueCell!6701)) (size!21816 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44670)

(declare-fun mapDefault!22930 () ValueCell!6701)

