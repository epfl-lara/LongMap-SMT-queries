; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70362 () Bool)

(assert start!70362)

(declare-fun b_free!12719 () Bool)

(declare-fun b_next!12719 () Bool)

(assert (=> start!70362 (= b_free!12719 (not b_next!12719))))

(declare-fun tp!44884 () Bool)

(declare-fun b_and!21531 () Bool)

(assert (=> start!70362 (= tp!44884 b_and!21531)))

(declare-fun b!817404 () Bool)

(declare-fun res!557960 () Bool)

(declare-fun e!453569 () Bool)

(assert (=> b!817404 (=> (not res!557960) (not e!453569))))

(declare-datatypes ((array!45058 0))(
  ( (array!45059 (arr!21585 (Array (_ BitVec 32) (_ BitVec 64))) (size!22006 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45058)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45058 (_ BitVec 32)) Bool)

(assert (=> b!817404 (= res!557960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!817405 () Bool)

(declare-fun res!557961 () Bool)

(assert (=> b!817405 (=> (not res!557961) (not e!453569))))

(declare-datatypes ((List!15373 0))(
  ( (Nil!15370) (Cons!15369 (h!16498 (_ BitVec 64)) (t!21698 List!15373)) )
))
(declare-fun arrayNoDuplicates!0 (array!45058 (_ BitVec 32) List!15373) Bool)

(assert (=> b!817405 (= res!557961 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15370))))

(declare-fun b!817406 () Bool)

(declare-fun e!453567 () Bool)

(declare-fun e!453566 () Bool)

(declare-fun mapRes!23236 () Bool)

(assert (=> b!817406 (= e!453567 (and e!453566 mapRes!23236))))

(declare-fun condMapEmpty!23236 () Bool)

(declare-datatypes ((V!24239 0))(
  ( (V!24240 (val!7262 Int)) )
))
(declare-datatypes ((ValueCell!6799 0))(
  ( (ValueCellFull!6799 (v!9691 V!24239)) (EmptyCell!6799) )
))
(declare-datatypes ((array!45060 0))(
  ( (array!45061 (arr!21586 (Array (_ BitVec 32) ValueCell!6799)) (size!22007 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45060)

(declare-fun mapDefault!23236 () ValueCell!6799)

