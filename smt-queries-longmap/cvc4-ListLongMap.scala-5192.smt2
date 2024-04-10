; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70156 () Bool)

(assert start!70156)

(declare-fun b_free!12563 () Bool)

(declare-fun b_next!12563 () Bool)

(assert (=> start!70156 (= b_free!12563 (not b_next!12563))))

(declare-fun tp!44407 () Bool)

(declare-fun b_and!21343 () Bool)

(assert (=> start!70156 (= tp!44407 b_and!21343)))

(declare-fun b!815151 () Bool)

(declare-fun res!556669 () Bool)

(declare-fun e!451960 () Bool)

(assert (=> b!815151 (=> (not res!556669) (not e!451960))))

(declare-datatypes ((array!44750 0))(
  ( (array!44751 (arr!21434 (Array (_ BitVec 32) (_ BitVec 64))) (size!21855 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44750)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44750 (_ BitVec 32)) Bool)

(assert (=> b!815151 (= res!556669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!815152 () Bool)

(declare-fun e!451962 () Bool)

(declare-fun e!451959 () Bool)

(declare-fun mapRes!22993 () Bool)

(assert (=> b!815152 (= e!451962 (and e!451959 mapRes!22993))))

(declare-fun condMapEmpty!22993 () Bool)

(declare-datatypes ((V!24031 0))(
  ( (V!24032 (val!7184 Int)) )
))
(declare-datatypes ((ValueCell!6721 0))(
  ( (ValueCellFull!6721 (v!9611 V!24031)) (EmptyCell!6721) )
))
(declare-datatypes ((array!44752 0))(
  ( (array!44753 (arr!21435 (Array (_ BitVec 32) ValueCell!6721)) (size!21856 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44752)

(declare-fun mapDefault!22993 () ValueCell!6721)

