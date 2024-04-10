; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108640 () Bool)

(assert start!108640)

(declare-fun b_free!28153 () Bool)

(declare-fun b_next!28153 () Bool)

(assert (=> start!108640 (= b_free!28153 (not b_next!28153))))

(declare-fun tp!99575 () Bool)

(declare-fun b_and!46219 () Bool)

(assert (=> start!108640 (= tp!99575 b_and!46219)))

(declare-fun mapIsEmpty!52247 () Bool)

(declare-fun mapRes!52247 () Bool)

(assert (=> mapIsEmpty!52247 mapRes!52247))

(declare-fun b!1282373 () Bool)

(declare-fun res!851796 () Bool)

(declare-fun e!732710 () Bool)

(assert (=> b!1282373 (=> (not res!851796) (not e!732710))))

(declare-datatypes ((array!84656 0))(
  ( (array!84657 (arr!40830 (Array (_ BitVec 32) (_ BitVec 64))) (size!41380 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84656)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84656 (_ BitVec 32)) Bool)

(assert (=> b!1282373 (= res!851796 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1282375 () Bool)

(declare-fun res!851794 () Bool)

(assert (=> b!1282375 (=> (not res!851794) (not e!732710))))

(declare-datatypes ((List!28928 0))(
  ( (Nil!28925) (Cons!28924 (h!30133 (_ BitVec 64)) (t!42472 List!28928)) )
))
(declare-fun arrayNoDuplicates!0 (array!84656 (_ BitVec 32) List!28928) Bool)

(assert (=> b!1282375 (= res!851794 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28925))))

(declare-fun b!1282376 () Bool)

(declare-fun e!732708 () Bool)

(declare-fun e!732709 () Bool)

(assert (=> b!1282376 (= e!732708 (and e!732709 mapRes!52247))))

(declare-fun condMapEmpty!52247 () Bool)

(declare-datatypes ((V!50161 0))(
  ( (V!50162 (val!16971 Int)) )
))
(declare-datatypes ((ValueCell!15998 0))(
  ( (ValueCellFull!15998 (v!19573 V!50161)) (EmptyCell!15998) )
))
(declare-datatypes ((array!84658 0))(
  ( (array!84659 (arr!40831 (Array (_ BitVec 32) ValueCell!15998)) (size!41381 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84658)

(declare-fun mapDefault!52247 () ValueCell!15998)

