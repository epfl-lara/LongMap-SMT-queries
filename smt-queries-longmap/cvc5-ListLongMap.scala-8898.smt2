; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108028 () Bool)

(assert start!108028)

(declare-fun b!1275946 () Bool)

(declare-fun e!728513 () Bool)

(declare-fun e!728512 () Bool)

(declare-fun mapRes!51479 () Bool)

(assert (=> b!1275946 (= e!728513 (and e!728512 mapRes!51479))))

(declare-fun condMapEmpty!51479 () Bool)

(declare-datatypes ((V!49505 0))(
  ( (V!49506 (val!16725 Int)) )
))
(declare-datatypes ((ValueCell!15752 0))(
  ( (ValueCellFull!15752 (v!19322 V!49505)) (EmptyCell!15752) )
))
(declare-datatypes ((array!83698 0))(
  ( (array!83699 (arr!40361 (Array (_ BitVec 32) ValueCell!15752)) (size!40911 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83698)

(declare-fun mapDefault!51479 () ValueCell!15752)

