; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35302 () Bool)

(assert start!35302)

(declare-fun b!353663 () Bool)

(declare-fun res!196066 () Bool)

(declare-fun e!216626 () Bool)

(assert (=> b!353663 (=> (not res!196066) (not e!216626))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19169 0))(
  ( (array!19170 (arr!9081 (Array (_ BitVec 32) (_ BitVec 64))) (size!9433 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19169)

(declare-datatypes ((V!11363 0))(
  ( (V!11364 (val!3939 Int)) )
))
(declare-datatypes ((ValueCell!3551 0))(
  ( (ValueCellFull!3551 (v!6132 V!11363)) (EmptyCell!3551) )
))
(declare-datatypes ((array!19171 0))(
  ( (array!19172 (arr!9082 (Array (_ BitVec 32) ValueCell!3551)) (size!9434 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19171)

(assert (=> b!353663 (= res!196066 (and (= (size!9434 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9433 _keys!1456) (size!9434 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!353664 () Bool)

(declare-fun res!196067 () Bool)

(assert (=> b!353664 (=> (not res!196067) (not e!216626))))

(assert (=> b!353664 (= res!196067 (and (bvsle #b00000000000000000000000000000000 (size!9433 _keys!1456)) (bvslt (size!9433 _keys!1456) #b01111111111111111111111111111111)))))

(declare-fun res!196065 () Bool)

(assert (=> start!35302 (=> (not res!196065) (not e!216626))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35302 (= res!196065 (validMask!0 mask!1842))))

(assert (=> start!35302 e!216626))

(assert (=> start!35302 true))

(declare-fun e!216630 () Bool)

(declare-fun array_inv!6690 (array!19171) Bool)

(assert (=> start!35302 (and (array_inv!6690 _values!1208) e!216630)))

(declare-fun array_inv!6691 (array!19169) Bool)

(assert (=> start!35302 (array_inv!6691 _keys!1456)))

(declare-fun b!353665 () Bool)

(declare-fun res!196064 () Bool)

(assert (=> b!353665 (=> (not res!196064) (not e!216626))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19169 (_ BitVec 32)) Bool)

(assert (=> b!353665 (= res!196064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!353666 () Bool)

(declare-fun e!216628 () Bool)

(declare-fun mapRes!13182 () Bool)

(assert (=> b!353666 (= e!216630 (and e!216628 mapRes!13182))))

(declare-fun condMapEmpty!13182 () Bool)

(declare-fun mapDefault!13182 () ValueCell!3551)

