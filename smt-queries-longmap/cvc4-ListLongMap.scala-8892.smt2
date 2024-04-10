; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107984 () Bool)

(assert start!107984)

(declare-fun b!1275621 () Bool)

(declare-fun res!847852 () Bool)

(declare-fun e!728241 () Bool)

(assert (=> b!1275621 (=> (not res!847852) (not e!728241))))

(declare-datatypes ((List!28621 0))(
  ( (Nil!28618) (Cons!28617 (h!29826 (_ BitVec 64)) (t!42157 List!28621)) )
))
(declare-fun noDuplicate!2052 (List!28621) Bool)

(assert (=> b!1275621 (= res!847852 (noDuplicate!2052 Nil!28618))))

(declare-fun b!1275622 () Bool)

(declare-fun e!728244 () Bool)

(declare-fun contains!7684 (List!28621 (_ BitVec 64)) Bool)

(assert (=> b!1275622 (= e!728244 (contains!7684 Nil!28618 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!847854 () Bool)

(assert (=> start!107984 (=> (not res!847854) (not e!728241))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107984 (= res!847854 (validMask!0 mask!1805))))

(assert (=> start!107984 e!728241))

(assert (=> start!107984 true))

(declare-datatypes ((V!49461 0))(
  ( (V!49462 (val!16709 Int)) )
))
(declare-datatypes ((ValueCell!15736 0))(
  ( (ValueCellFull!15736 (v!19305 V!49461)) (EmptyCell!15736) )
))
(declare-datatypes ((array!83644 0))(
  ( (array!83645 (arr!40335 (Array (_ BitVec 32) ValueCell!15736)) (size!40885 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83644)

(declare-fun e!728243 () Bool)

(declare-fun array_inv!30661 (array!83644) Bool)

(assert (=> start!107984 (and (array_inv!30661 _values!1187) e!728243)))

(declare-datatypes ((array!83646 0))(
  ( (array!83647 (arr!40336 (Array (_ BitVec 32) (_ BitVec 64))) (size!40886 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83646)

(declare-fun array_inv!30662 (array!83646) Bool)

(assert (=> start!107984 (array_inv!30662 _keys!1427)))

(declare-fun b!1275623 () Bool)

(declare-fun e!728240 () Bool)

(declare-fun mapRes!51428 () Bool)

(assert (=> b!1275623 (= e!728243 (and e!728240 mapRes!51428))))

(declare-fun condMapEmpty!51428 () Bool)

(declare-fun mapDefault!51428 () ValueCell!15736)

