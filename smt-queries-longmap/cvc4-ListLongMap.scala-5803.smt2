; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74894 () Bool)

(assert start!74894)

(declare-fun b_free!15413 () Bool)

(declare-fun b_next!15413 () Bool)

(assert (=> start!74894 (= b_free!15413 (not b_next!15413))))

(declare-fun tp!53941 () Bool)

(declare-fun b_and!25525 () Bool)

(assert (=> start!74894 (= tp!53941 b_and!25525)))

(declare-fun mapNonEmpty!28122 () Bool)

(declare-fun mapRes!28122 () Bool)

(declare-fun tp!53942 () Bool)

(declare-fun e!491378 () Bool)

(assert (=> mapNonEmpty!28122 (= mapRes!28122 (and tp!53942 e!491378))))

(declare-fun mapKey!28122 () (_ BitVec 32))

(declare-datatypes ((V!28589 0))(
  ( (V!28590 (val!8876 Int)) )
))
(declare-datatypes ((ValueCell!8389 0))(
  ( (ValueCellFull!8389 (v!11345 V!28589)) (EmptyCell!8389) )
))
(declare-fun mapValue!28122 () ValueCell!8389)

(declare-fun mapRest!28122 () (Array (_ BitVec 32) ValueCell!8389))

(declare-datatypes ((array!51442 0))(
  ( (array!51443 (arr!24740 (Array (_ BitVec 32) ValueCell!8389)) (size!25180 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51442)

(assert (=> mapNonEmpty!28122 (= (arr!24740 _values!688) (store mapRest!28122 mapKey!28122 mapValue!28122))))

(declare-fun b!882886 () Bool)

(declare-fun res!599805 () Bool)

(declare-fun e!491383 () Bool)

(assert (=> b!882886 (=> res!599805 e!491383)))

(declare-datatypes ((List!17565 0))(
  ( (Nil!17562) (Cons!17561 (h!18692 (_ BitVec 64)) (t!24780 List!17565)) )
))
(declare-fun noDuplicate!1324 (List!17565) Bool)

(assert (=> b!882886 (= res!599805 (not (noDuplicate!1324 Nil!17562)))))

(declare-fun b!882887 () Bool)

(declare-fun res!599803 () Bool)

(assert (=> b!882887 (=> res!599803 e!491383)))

(declare-fun contains!4275 (List!17565 (_ BitVec 64)) Bool)

(assert (=> b!882887 (= res!599803 (contains!4275 Nil!17562 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!882889 () Bool)

(declare-fun res!599796 () Bool)

(declare-fun e!491384 () Bool)

(assert (=> b!882889 (=> (not res!599796) (not e!491384))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!882889 (= res!599796 (validMask!0 mask!1196))))

(declare-fun b!882890 () Bool)

(declare-fun e!491379 () Bool)

(declare-fun e!491380 () Bool)

(assert (=> b!882890 (= e!491379 (and e!491380 mapRes!28122))))

(declare-fun condMapEmpty!28122 () Bool)

(declare-fun mapDefault!28122 () ValueCell!8389)

