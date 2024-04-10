; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82624 () Bool)

(assert start!82624)

(declare-fun b_free!18757 () Bool)

(declare-fun b_next!18757 () Bool)

(assert (=> start!82624 (= b_free!18757 (not b_next!18757))))

(declare-fun tp!65391 () Bool)

(declare-fun b_and!30245 () Bool)

(assert (=> start!82624 (= tp!65391 b_and!30245)))

(declare-fun b!963063 () Bool)

(declare-fun res!644526 () Bool)

(declare-fun e!543063 () Bool)

(assert (=> b!963063 (=> (not res!644526) (not e!543063))))

(declare-datatypes ((array!59213 0))(
  ( (array!59214 (arr!28475 (Array (_ BitVec 32) (_ BitVec 64))) (size!28954 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59213)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!963063 (= res!644526 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28954 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28954 _keys!1686))))))

(declare-fun b!963064 () Bool)

(declare-fun e!543065 () Bool)

(declare-fun tp_is_empty!21559 () Bool)

(assert (=> b!963064 (= e!543065 tp_is_empty!21559)))

(declare-fun b!963065 () Bool)

(declare-fun e!543061 () Bool)

(declare-fun e!543064 () Bool)

(declare-fun mapRes!34333 () Bool)

(assert (=> b!963065 (= e!543061 (and e!543064 mapRes!34333))))

(declare-fun condMapEmpty!34333 () Bool)

(declare-datatypes ((V!33729 0))(
  ( (V!33730 (val!10830 Int)) )
))
(declare-datatypes ((ValueCell!10298 0))(
  ( (ValueCellFull!10298 (v!13388 V!33729)) (EmptyCell!10298) )
))
(declare-datatypes ((array!59215 0))(
  ( (array!59216 (arr!28476 (Array (_ BitVec 32) ValueCell!10298)) (size!28955 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59215)

(declare-fun mapDefault!34333 () ValueCell!10298)

