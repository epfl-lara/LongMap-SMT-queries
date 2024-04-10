; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82672 () Bool)

(assert start!82672)

(declare-fun b_free!18805 () Bool)

(declare-fun b_next!18805 () Bool)

(assert (=> start!82672 (= b_free!18805 (not b_next!18805))))

(declare-fun tp!65535 () Bool)

(declare-fun b_and!30293 () Bool)

(assert (=> start!82672 (= tp!65535 b_and!30293)))

(declare-fun b!963855 () Bool)

(declare-fun res!645096 () Bool)

(declare-fun e!543422 () Bool)

(assert (=> b!963855 (=> (not res!645096) (not e!543422))))

(declare-datatypes ((array!59303 0))(
  ( (array!59304 (arr!28520 (Array (_ BitVec 32) (_ BitVec 64))) (size!28999 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59303)

(declare-datatypes ((List!19793 0))(
  ( (Nil!19790) (Cons!19789 (h!20951 (_ BitVec 64)) (t!28156 List!19793)) )
))
(declare-fun arrayNoDuplicates!0 (array!59303 (_ BitVec 32) List!19793) Bool)

(assert (=> b!963855 (= res!645096 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19790))))

(declare-fun b!963856 () Bool)

(declare-fun res!645102 () Bool)

(assert (=> b!963856 (=> (not res!645102) (not e!543422))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!963856 (= res!645102 (validKeyInArray!0 (select (arr!28520 _keys!1686) i!803)))))

(declare-fun mapIsEmpty!34405 () Bool)

(declare-fun mapRes!34405 () Bool)

(assert (=> mapIsEmpty!34405 mapRes!34405))

(declare-fun b!963857 () Bool)

(declare-fun res!645103 () Bool)

(assert (=> b!963857 (=> (not res!645103) (not e!543422))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!963857 (= res!645103 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28999 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28999 _keys!1686))))))

(declare-fun b!963858 () Bool)

(declare-fun e!543421 () Bool)

(declare-fun e!543425 () Bool)

(assert (=> b!963858 (= e!543421 (and e!543425 mapRes!34405))))

(declare-fun condMapEmpty!34405 () Bool)

(declare-datatypes ((V!33793 0))(
  ( (V!33794 (val!10854 Int)) )
))
(declare-datatypes ((ValueCell!10322 0))(
  ( (ValueCellFull!10322 (v!13412 V!33793)) (EmptyCell!10322) )
))
(declare-datatypes ((array!59305 0))(
  ( (array!59306 (arr!28521 (Array (_ BitVec 32) ValueCell!10322)) (size!29000 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59305)

(declare-fun mapDefault!34405 () ValueCell!10322)

