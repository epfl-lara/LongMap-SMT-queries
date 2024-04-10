; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107936 () Bool)

(assert start!107936)

(declare-fun b!1275324 () Bool)

(declare-fun e!728020 () Bool)

(declare-fun tp_is_empty!33247 () Bool)

(assert (=> b!1275324 (= e!728020 tp_is_empty!33247)))

(declare-fun mapNonEmpty!51386 () Bool)

(declare-fun mapRes!51386 () Bool)

(declare-fun tp!98144 () Bool)

(declare-fun e!728019 () Bool)

(assert (=> mapNonEmpty!51386 (= mapRes!51386 (and tp!98144 e!728019))))

(declare-datatypes ((V!49433 0))(
  ( (V!49434 (val!16698 Int)) )
))
(declare-datatypes ((ValueCell!15725 0))(
  ( (ValueCellFull!15725 (v!19294 V!49433)) (EmptyCell!15725) )
))
(declare-fun mapValue!51386 () ValueCell!15725)

(declare-fun mapRest!51386 () (Array (_ BitVec 32) ValueCell!15725))

(declare-fun mapKey!51386 () (_ BitVec 32))

(declare-datatypes ((array!83602 0))(
  ( (array!83603 (arr!40317 (Array (_ BitVec 32) ValueCell!15725)) (size!40867 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83602)

(assert (=> mapNonEmpty!51386 (= (arr!40317 _values!1187) (store mapRest!51386 mapKey!51386 mapValue!51386))))

(declare-fun b!1275325 () Bool)

(declare-fun e!728016 () Bool)

(declare-datatypes ((array!83604 0))(
  ( (array!83605 (arr!40318 (Array (_ BitVec 32) (_ BitVec 64))) (size!40868 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83604)

(assert (=> b!1275325 (= e!728016 (bvsgt #b00000000000000000000000000000000 (size!40868 _keys!1427)))))

(declare-fun b!1275326 () Bool)

(assert (=> b!1275326 (= e!728019 tp_is_empty!33247)))

(declare-fun b!1275327 () Bool)

(declare-fun res!847695 () Bool)

(assert (=> b!1275327 (=> (not res!847695) (not e!728016))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83604 (_ BitVec 32)) Bool)

(assert (=> b!1275327 (= res!847695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1275328 () Bool)

(declare-fun e!728017 () Bool)

(assert (=> b!1275328 (= e!728017 (and e!728020 mapRes!51386))))

(declare-fun condMapEmpty!51386 () Bool)

(declare-fun mapDefault!51386 () ValueCell!15725)

