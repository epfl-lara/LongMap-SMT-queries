; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82568 () Bool)

(assert start!82568)

(declare-fun b_free!18701 () Bool)

(declare-fun b_next!18701 () Bool)

(assert (=> start!82568 (= b_free!18701 (not b_next!18701))))

(declare-fun tp!65222 () Bool)

(declare-fun b_and!30189 () Bool)

(assert (=> start!82568 (= tp!65222 b_and!30189)))

(declare-fun b!962249 () Bool)

(declare-fun res!643961 () Bool)

(declare-fun e!542642 () Bool)

(assert (=> b!962249 (=> (not res!643961) (not e!542642))))

(declare-datatypes ((array!59103 0))(
  ( (array!59104 (arr!28420 (Array (_ BitVec 32) (_ BitVec 64))) (size!28899 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59103)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!962249 (= res!643961 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28899 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28899 _keys!1686))))))

(declare-fun b!962250 () Bool)

(declare-fun res!643959 () Bool)

(assert (=> b!962250 (=> (not res!643959) (not e!542642))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962250 (= res!643959 (validKeyInArray!0 (select (arr!28420 _keys!1686) i!803)))))

(declare-fun b!962251 () Bool)

(declare-fun res!643958 () Bool)

(assert (=> b!962251 (=> (not res!643958) (not e!542642))))

(declare-datatypes ((List!19724 0))(
  ( (Nil!19721) (Cons!19720 (h!20882 (_ BitVec 64)) (t!28087 List!19724)) )
))
(declare-fun arrayNoDuplicates!0 (array!59103 (_ BitVec 32) List!19724) Bool)

(assert (=> b!962251 (= res!643958 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19721))))

(declare-fun b!962252 () Bool)

(declare-fun e!542643 () Bool)

(declare-fun e!542645 () Bool)

(declare-fun mapRes!34249 () Bool)

(assert (=> b!962252 (= e!542643 (and e!542645 mapRes!34249))))

(declare-fun condMapEmpty!34249 () Bool)

(declare-datatypes ((V!33653 0))(
  ( (V!33654 (val!10802 Int)) )
))
(declare-datatypes ((ValueCell!10270 0))(
  ( (ValueCellFull!10270 (v!13360 V!33653)) (EmptyCell!10270) )
))
(declare-datatypes ((array!59105 0))(
  ( (array!59106 (arr!28421 (Array (_ BitVec 32) ValueCell!10270)) (size!28900 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59105)

(declare-fun mapDefault!34249 () ValueCell!10270)

