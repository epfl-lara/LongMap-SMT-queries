; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82924 () Bool)

(assert start!82924)

(declare-fun b_free!19051 () Bool)

(declare-fun b_next!19051 () Bool)

(assert (=> start!82924 (= b_free!19051 (not b_next!19051))))

(declare-fun tp!66282 () Bool)

(declare-fun b_and!30539 () Bool)

(assert (=> start!82924 (= tp!66282 b_and!30539)))

(declare-fun b!967680 () Bool)

(declare-fun res!647790 () Bool)

(declare-fun e!545393 () Bool)

(assert (=> b!967680 (=> (not res!647790) (not e!545393))))

(declare-datatypes ((array!59791 0))(
  ( (array!59792 (arr!28764 (Array (_ BitVec 32) (_ BitVec 64))) (size!29243 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59791)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!967680 (= res!647790 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29243 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29243 _keys!1686))))))

(declare-fun b!967681 () Bool)

(declare-fun res!647789 () Bool)

(assert (=> b!967681 (=> (not res!647789) (not e!545393))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!967681 (= res!647789 (validKeyInArray!0 (select (arr!28764 _keys!1686) i!803)))))

(declare-fun b!967682 () Bool)

(declare-fun e!545394 () Bool)

(declare-fun e!545395 () Bool)

(declare-fun mapRes!34783 () Bool)

(assert (=> b!967682 (= e!545394 (and e!545395 mapRes!34783))))

(declare-fun condMapEmpty!34783 () Bool)

(declare-datatypes ((V!34129 0))(
  ( (V!34130 (val!10980 Int)) )
))
(declare-datatypes ((ValueCell!10448 0))(
  ( (ValueCellFull!10448 (v!13538 V!34129)) (EmptyCell!10448) )
))
(declare-datatypes ((array!59793 0))(
  ( (array!59794 (arr!28765 (Array (_ BitVec 32) ValueCell!10448)) (size!29244 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59793)

(declare-fun mapDefault!34783 () ValueCell!10448)

