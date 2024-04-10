; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82802 () Bool)

(assert start!82802)

(declare-fun b_free!18929 () Bool)

(declare-fun b_next!18929 () Bool)

(assert (=> start!82802 (= b_free!18929 (not b_next!18929))))

(declare-fun tp!65916 () Bool)

(declare-fun b_and!30417 () Bool)

(assert (=> start!82802 (= tp!65916 b_and!30417)))

(declare-fun mapIsEmpty!34600 () Bool)

(declare-fun mapRes!34600 () Bool)

(assert (=> mapIsEmpty!34600 mapRes!34600))

(declare-fun b!965858 () Bool)

(declare-fun e!544478 () Bool)

(declare-fun tp_is_empty!21737 () Bool)

(assert (=> b!965858 (= e!544478 tp_is_empty!21737)))

(declare-fun b!965859 () Bool)

(declare-fun res!646518 () Bool)

(declare-fun e!544480 () Bool)

(assert (=> b!965859 (=> (not res!646518) (not e!544480))))

(declare-datatypes ((array!59559 0))(
  ( (array!59560 (arr!28648 (Array (_ BitVec 32) (_ BitVec 64))) (size!29127 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59559)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965859 (= res!646518 (validKeyInArray!0 (select (arr!28648 _keys!1686) i!803)))))

(declare-fun b!965860 () Bool)

(declare-fun res!646519 () Bool)

(assert (=> b!965860 (=> (not res!646519) (not e!544480))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!965860 (= res!646519 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29127 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29127 _keys!1686))))))

(declare-fun res!646516 () Bool)

(assert (=> start!82802 (=> (not res!646516) (not e!544480))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82802 (= res!646516 (validMask!0 mask!2110))))

(assert (=> start!82802 e!544480))

(assert (=> start!82802 true))

(declare-datatypes ((V!33965 0))(
  ( (V!33966 (val!10919 Int)) )
))
(declare-datatypes ((ValueCell!10387 0))(
  ( (ValueCellFull!10387 (v!13477 V!33965)) (EmptyCell!10387) )
))
(declare-datatypes ((array!59561 0))(
  ( (array!59562 (arr!28649 (Array (_ BitVec 32) ValueCell!10387)) (size!29128 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59561)

(declare-fun e!544479 () Bool)

(declare-fun array_inv!22187 (array!59561) Bool)

(assert (=> start!82802 (and (array_inv!22187 _values!1400) e!544479)))

(declare-fun array_inv!22188 (array!59559) Bool)

(assert (=> start!82802 (array_inv!22188 _keys!1686)))

(assert (=> start!82802 tp!65916))

(assert (=> start!82802 tp_is_empty!21737))

(declare-fun b!965861 () Bool)

(declare-fun e!544477 () Bool)

(assert (=> b!965861 (= e!544479 (and e!544477 mapRes!34600))))

(declare-fun condMapEmpty!34600 () Bool)

(declare-fun mapDefault!34600 () ValueCell!10387)

