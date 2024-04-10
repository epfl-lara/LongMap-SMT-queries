; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108002 () Bool)

(assert start!108002)

(declare-fun b!1275712 () Bool)

(declare-fun e!728318 () Bool)

(declare-fun tp_is_empty!33275 () Bool)

(assert (=> b!1275712 (= e!728318 tp_is_empty!33275)))

(declare-fun res!847900 () Bool)

(declare-fun e!728317 () Bool)

(assert (=> start!108002 (=> (not res!847900) (not e!728317))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108002 (= res!847900 (validMask!0 mask!1805))))

(assert (=> start!108002 e!728317))

(assert (=> start!108002 true))

(declare-datatypes ((V!49469 0))(
  ( (V!49470 (val!16712 Int)) )
))
(declare-datatypes ((ValueCell!15739 0))(
  ( (ValueCellFull!15739 (v!19309 V!49469)) (EmptyCell!15739) )
))
(declare-datatypes ((array!83656 0))(
  ( (array!83657 (arr!40340 (Array (_ BitVec 32) ValueCell!15739)) (size!40890 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83656)

(declare-fun e!728315 () Bool)

(declare-fun array_inv!30665 (array!83656) Bool)

(assert (=> start!108002 (and (array_inv!30665 _values!1187) e!728315)))

(declare-datatypes ((array!83658 0))(
  ( (array!83659 (arr!40341 (Array (_ BitVec 32) (_ BitVec 64))) (size!40891 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83658)

(declare-fun array_inv!30666 (array!83658) Bool)

(assert (=> start!108002 (array_inv!30666 _keys!1427)))

(declare-fun b!1275713 () Bool)

(assert (=> b!1275713 (= e!728317 false)))

(declare-fun lt!575380 () Bool)

(declare-datatypes ((List!28623 0))(
  ( (Nil!28620) (Cons!28619 (h!29828 (_ BitVec 64)) (t!42159 List!28623)) )
))
(declare-fun arrayNoDuplicates!0 (array!83658 (_ BitVec 32) List!28623) Bool)

(assert (=> b!1275713 (= lt!575380 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28620))))

(declare-fun b!1275714 () Bool)

(declare-fun res!847902 () Bool)

(assert (=> b!1275714 (=> (not res!847902) (not e!728317))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1275714 (= res!847902 (and (= (size!40890 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40891 _keys!1427) (size!40890 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1275715 () Bool)

(declare-fun res!847901 () Bool)

(assert (=> b!1275715 (=> (not res!847901) (not e!728317))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83658 (_ BitVec 32)) Bool)

(assert (=> b!1275715 (= res!847901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun mapIsEmpty!51440 () Bool)

(declare-fun mapRes!51440 () Bool)

(assert (=> mapIsEmpty!51440 mapRes!51440))

(declare-fun b!1275716 () Bool)

(declare-fun e!728316 () Bool)

(assert (=> b!1275716 (= e!728315 (and e!728316 mapRes!51440))))

(declare-fun condMapEmpty!51440 () Bool)

(declare-fun mapDefault!51440 () ValueCell!15739)

