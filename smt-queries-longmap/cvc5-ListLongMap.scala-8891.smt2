; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107964 () Bool)

(assert start!107964)

(declare-fun b!1275474 () Bool)

(declare-fun e!728140 () Bool)

(declare-fun tp_is_empty!33259 () Bool)

(assert (=> b!1275474 (= e!728140 tp_is_empty!33259)))

(declare-fun b!1275475 () Bool)

(declare-fun res!847765 () Bool)

(declare-fun e!728136 () Bool)

(assert (=> b!1275475 (=> (not res!847765) (not e!728136))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((array!83626 0))(
  ( (array!83627 (arr!40327 (Array (_ BitVec 32) (_ BitVec 64))) (size!40877 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83626)

(declare-datatypes ((V!49449 0))(
  ( (V!49450 (val!16704 Int)) )
))
(declare-datatypes ((ValueCell!15731 0))(
  ( (ValueCellFull!15731 (v!19300 V!49449)) (EmptyCell!15731) )
))
(declare-datatypes ((array!83628 0))(
  ( (array!83629 (arr!40328 (Array (_ BitVec 32) ValueCell!15731)) (size!40878 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83628)

(assert (=> b!1275475 (= res!847765 (and (= (size!40878 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40877 _keys!1427) (size!40878 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!51410 () Bool)

(declare-fun mapRes!51410 () Bool)

(declare-fun tp!98168 () Bool)

(assert (=> mapNonEmpty!51410 (= mapRes!51410 (and tp!98168 e!728140))))

(declare-fun mapKey!51410 () (_ BitVec 32))

(declare-fun mapRest!51410 () (Array (_ BitVec 32) ValueCell!15731))

(declare-fun mapValue!51410 () ValueCell!15731)

(assert (=> mapNonEmpty!51410 (= (arr!40328 _values!1187) (store mapRest!51410 mapKey!51410 mapValue!51410))))

(declare-fun b!1275476 () Bool)

(declare-fun res!847762 () Bool)

(assert (=> b!1275476 (=> (not res!847762) (not e!728136))))

(assert (=> b!1275476 (= res!847762 (and (bvsle #b00000000000000000000000000000000 (size!40877 _keys!1427)) (bvslt (size!40877 _keys!1427) #b01111111111111111111111111111111)))))

(declare-fun res!847763 () Bool)

(assert (=> start!107964 (=> (not res!847763) (not e!728136))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107964 (= res!847763 (validMask!0 mask!1805))))

(assert (=> start!107964 e!728136))

(assert (=> start!107964 true))

(declare-fun e!728139 () Bool)

(declare-fun array_inv!30655 (array!83628) Bool)

(assert (=> start!107964 (and (array_inv!30655 _values!1187) e!728139)))

(declare-fun array_inv!30656 (array!83626) Bool)

(assert (=> start!107964 (array_inv!30656 _keys!1427)))

(declare-fun b!1275477 () Bool)

(declare-datatypes ((List!28618 0))(
  ( (Nil!28615) (Cons!28614 (h!29823 (_ BitVec 64)) (t!42154 List!28618)) )
))
(declare-fun noDuplicate!2049 (List!28618) Bool)

(assert (=> b!1275477 (= e!728136 (not (noDuplicate!2049 Nil!28615)))))

(declare-fun b!1275478 () Bool)

(declare-fun res!847764 () Bool)

(assert (=> b!1275478 (=> (not res!847764) (not e!728136))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83626 (_ BitVec 32)) Bool)

(assert (=> b!1275478 (= res!847764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1275479 () Bool)

(declare-fun e!728138 () Bool)

(assert (=> b!1275479 (= e!728139 (and e!728138 mapRes!51410))))

(declare-fun condMapEmpty!51410 () Bool)

(declare-fun mapDefault!51410 () ValueCell!15731)

