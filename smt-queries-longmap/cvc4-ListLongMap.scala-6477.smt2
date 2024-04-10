; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82706 () Bool)

(assert start!82706)

(declare-fun b_free!18839 () Bool)

(declare-fun b_next!18839 () Bool)

(assert (=> start!82706 (= b_free!18839 (not b_next!18839))))

(declare-fun tp!65637 () Bool)

(declare-fun b_and!30327 () Bool)

(assert (=> start!82706 (= tp!65637 b_and!30327)))

(declare-fun b!964460 () Bool)

(declare-fun res!645553 () Bool)

(declare-fun e!543725 () Bool)

(assert (=> b!964460 (=> (not res!645553) (not e!543725))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!964460 (= res!645553 (bvsgt from!2084 newFrom!159))))

(declare-fun b!964461 () Bool)

(declare-fun res!645548 () Bool)

(assert (=> b!964461 (=> (not res!645548) (not e!543725))))

(declare-datatypes ((array!59369 0))(
  ( (array!59370 (arr!28553 (Array (_ BitVec 32) (_ BitVec 64))) (size!29032 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59369)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!964461 (= res!645548 (validKeyInArray!0 (select (arr!28553 _keys!1686) i!803)))))

(declare-fun b!964462 () Bool)

(declare-fun e!543722 () Bool)

(declare-fun tp_is_empty!21641 () Bool)

(assert (=> b!964462 (= e!543722 tp_is_empty!21641)))

(declare-fun b!964463 () Bool)

(declare-fun res!645556 () Bool)

(assert (=> b!964463 (=> (not res!645556) (not e!543725))))

(assert (=> b!964463 (= res!645556 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29032 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29032 _keys!1686))))))

(declare-fun b!964464 () Bool)

(declare-fun e!543720 () Bool)

(declare-fun e!543721 () Bool)

(declare-fun mapRes!34456 () Bool)

(assert (=> b!964464 (= e!543720 (and e!543721 mapRes!34456))))

(declare-fun condMapEmpty!34456 () Bool)

(declare-datatypes ((V!33837 0))(
  ( (V!33838 (val!10871 Int)) )
))
(declare-datatypes ((ValueCell!10339 0))(
  ( (ValueCellFull!10339 (v!13429 V!33837)) (EmptyCell!10339) )
))
(declare-datatypes ((array!59371 0))(
  ( (array!59372 (arr!28554 (Array (_ BitVec 32) ValueCell!10339)) (size!29033 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59371)

(declare-fun mapDefault!34456 () ValueCell!10339)

