; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37772 () Bool)

(assert start!37772)

(declare-fun b_free!8875 () Bool)

(declare-fun b_next!8875 () Bool)

(assert (=> start!37772 (= b_free!8875 (not b_next!8875))))

(declare-fun tp!31377 () Bool)

(declare-fun b_and!16117 () Bool)

(assert (=> start!37772 (= tp!31377 b_and!16117)))

(declare-fun b!387767 () Bool)

(declare-fun res!221634 () Bool)

(declare-fun e!235043 () Bool)

(assert (=> b!387767 (=> (not res!221634) (not e!235043))))

(declare-datatypes ((array!22985 0))(
  ( (array!22986 (arr!10961 (Array (_ BitVec 32) (_ BitVec 64))) (size!11313 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22985)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22985 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!387767 (= res!221634 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!387768 () Bool)

(declare-fun res!221628 () Bool)

(assert (=> b!387768 (=> (not res!221628) (not e!235043))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!387768 (= res!221628 (validKeyInArray!0 k!778))))

(declare-fun b!387769 () Bool)

(declare-fun res!221632 () Bool)

(assert (=> b!387769 (=> (not res!221632) (not e!235043))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22985 (_ BitVec 32)) Bool)

(assert (=> b!387769 (= res!221632 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!387770 () Bool)

(declare-fun e!235045 () Bool)

(assert (=> b!387770 (= e!235043 e!235045)))

(declare-fun res!221631 () Bool)

(assert (=> b!387770 (=> (not res!221631) (not e!235045))))

(declare-fun lt!182113 () array!22985)

(assert (=> b!387770 (= res!221631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182113 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!387770 (= lt!182113 (array!22986 (store (arr!10961 _keys!658) i!548 k!778) (size!11313 _keys!658)))))

(declare-fun b!387771 () Bool)

(declare-fun res!221633 () Bool)

(assert (=> b!387771 (=> (not res!221633) (not e!235043))))

(declare-datatypes ((List!6327 0))(
  ( (Nil!6324) (Cons!6323 (h!7179 (_ BitVec 64)) (t!11477 List!6327)) )
))
(declare-fun arrayNoDuplicates!0 (array!22985 (_ BitVec 32) List!6327) Bool)

(assert (=> b!387771 (= res!221633 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6324))))

(declare-fun b!387772 () Bool)

(declare-fun res!221627 () Bool)

(assert (=> b!387772 (=> (not res!221627) (not e!235045))))

(assert (=> b!387772 (= res!221627 (arrayNoDuplicates!0 lt!182113 #b00000000000000000000000000000000 Nil!6324))))

(declare-fun b!387773 () Bool)

(declare-fun res!221635 () Bool)

(assert (=> b!387773 (=> (not res!221635) (not e!235043))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13835 0))(
  ( (V!13836 (val!4818 Int)) )
))
(declare-datatypes ((ValueCell!4430 0))(
  ( (ValueCellFull!4430 (v!7015 V!13835)) (EmptyCell!4430) )
))
(declare-datatypes ((array!22987 0))(
  ( (array!22988 (arr!10962 (Array (_ BitVec 32) ValueCell!4430)) (size!11314 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22987)

(assert (=> b!387773 (= res!221635 (and (= (size!11314 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11313 _keys!658) (size!11314 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!15885 () Bool)

(declare-fun mapRes!15885 () Bool)

(declare-fun tp!31376 () Bool)

(declare-fun e!235046 () Bool)

(assert (=> mapNonEmpty!15885 (= mapRes!15885 (and tp!31376 e!235046))))

(declare-fun mapValue!15885 () ValueCell!4430)

(declare-fun mapRest!15885 () (Array (_ BitVec 32) ValueCell!4430))

(declare-fun mapKey!15885 () (_ BitVec 32))

(assert (=> mapNonEmpty!15885 (= (arr!10962 _values!506) (store mapRest!15885 mapKey!15885 mapValue!15885))))

(declare-fun b!387774 () Bool)

(declare-fun e!235042 () Bool)

(declare-fun e!235041 () Bool)

(assert (=> b!387774 (= e!235042 (and e!235041 mapRes!15885))))

(declare-fun condMapEmpty!15885 () Bool)

(declare-fun mapDefault!15885 () ValueCell!4430)

