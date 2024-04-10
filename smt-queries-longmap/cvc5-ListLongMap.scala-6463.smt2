; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82618 () Bool)

(assert start!82618)

(declare-fun b_free!18751 () Bool)

(declare-fun b_next!18751 () Bool)

(assert (=> start!82618 (= b_free!18751 (not b_next!18751))))

(declare-fun tp!65373 () Bool)

(declare-fun b_and!30239 () Bool)

(assert (=> start!82618 (= tp!65373 b_and!30239)))

(declare-fun b!962964 () Bool)

(declare-fun res!644451 () Bool)

(declare-fun e!543019 () Bool)

(assert (=> b!962964 (=> (not res!644451) (not e!543019))))

(declare-datatypes ((array!59201 0))(
  ( (array!59202 (arr!28469 (Array (_ BitVec 32) (_ BitVec 64))) (size!28948 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59201)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59201 (_ BitVec 32)) Bool)

(assert (=> b!962964 (= res!644451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!962965 () Bool)

(declare-fun res!644454 () Bool)

(assert (=> b!962965 (=> (not res!644454) (not e!543019))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!962965 (= res!644454 (bvsgt from!2084 newFrom!159))))

(declare-fun b!962966 () Bool)

(declare-fun res!644453 () Bool)

(assert (=> b!962966 (=> (not res!644453) (not e!543019))))

(declare-datatypes ((List!19759 0))(
  ( (Nil!19756) (Cons!19755 (h!20917 (_ BitVec 64)) (t!28122 List!19759)) )
))
(declare-fun arrayNoDuplicates!0 (array!59201 (_ BitVec 32) List!19759) Bool)

(assert (=> b!962966 (= res!644453 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19756))))

(declare-fun mapIsEmpty!34324 () Bool)

(declare-fun mapRes!34324 () Bool)

(assert (=> mapIsEmpty!34324 mapRes!34324))

(declare-fun b!962968 () Bool)

(declare-fun e!543018 () Bool)

(declare-fun e!543020 () Bool)

(assert (=> b!962968 (= e!543018 (and e!543020 mapRes!34324))))

(declare-fun condMapEmpty!34324 () Bool)

(declare-datatypes ((V!33721 0))(
  ( (V!33722 (val!10827 Int)) )
))
(declare-datatypes ((ValueCell!10295 0))(
  ( (ValueCellFull!10295 (v!13385 V!33721)) (EmptyCell!10295) )
))
(declare-datatypes ((array!59203 0))(
  ( (array!59204 (arr!28470 (Array (_ BitVec 32) ValueCell!10295)) (size!28949 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59203)

(declare-fun mapDefault!34324 () ValueCell!10295)

