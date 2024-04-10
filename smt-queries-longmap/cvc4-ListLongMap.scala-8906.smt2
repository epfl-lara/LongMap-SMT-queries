; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108090 () Bool)

(assert start!108090)

(declare-fun b_free!27803 () Bool)

(declare-fun b_next!27803 () Bool)

(assert (=> start!108090 (= b_free!27803 (not b_next!27803))))

(declare-fun tp!98362 () Bool)

(declare-fun b_and!45859 () Bool)

(assert (=> start!108090 (= tp!98362 b_and!45859)))

(declare-fun b!1276502 () Bool)

(declare-fun e!728927 () Bool)

(declare-fun tp_is_empty!33353 () Bool)

(assert (=> b!1276502 (= e!728927 tp_is_empty!33353)))

(declare-fun b!1276503 () Bool)

(declare-fun res!848322 () Bool)

(declare-fun e!728930 () Bool)

(assert (=> b!1276503 (=> (not res!848322) (not e!728930))))

(declare-datatypes ((array!83800 0))(
  ( (array!83801 (arr!40411 (Array (_ BitVec 32) (_ BitVec 64))) (size!40961 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83800)

(declare-datatypes ((List!28660 0))(
  ( (Nil!28657) (Cons!28656 (h!29865 (_ BitVec 64)) (t!42196 List!28660)) )
))
(declare-fun arrayNoDuplicates!0 (array!83800 (_ BitVec 32) List!28660) Bool)

(assert (=> b!1276503 (= res!848322 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28657))))

(declare-fun res!848319 () Bool)

(assert (=> start!108090 (=> (not res!848319) (not e!728930))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108090 (= res!848319 (validMask!0 mask!1805))))

(assert (=> start!108090 e!728930))

(assert (=> start!108090 true))

(assert (=> start!108090 tp!98362))

(assert (=> start!108090 tp_is_empty!33353))

(declare-datatypes ((V!49573 0))(
  ( (V!49574 (val!16751 Int)) )
))
(declare-datatypes ((ValueCell!15778 0))(
  ( (ValueCellFull!15778 (v!19348 V!49573)) (EmptyCell!15778) )
))
(declare-datatypes ((array!83802 0))(
  ( (array!83803 (arr!40412 (Array (_ BitVec 32) ValueCell!15778)) (size!40962 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83802)

(declare-fun e!728928 () Bool)

(declare-fun array_inv!30713 (array!83802) Bool)

(assert (=> start!108090 (and (array_inv!30713 _values!1187) e!728928)))

(declare-fun array_inv!30714 (array!83800) Bool)

(assert (=> start!108090 (array_inv!30714 _keys!1427)))

(declare-fun b!1276504 () Bool)

(declare-fun res!848320 () Bool)

(assert (=> b!1276504 (=> (not res!848320) (not e!728930))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1276504 (= res!848320 (and (= (size!40962 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40961 _keys!1427) (size!40962 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!51560 () Bool)

(declare-fun mapRes!51560 () Bool)

(assert (=> mapIsEmpty!51560 mapRes!51560))

(declare-fun b!1276505 () Bool)

(declare-fun res!848321 () Bool)

(assert (=> b!1276505 (=> (not res!848321) (not e!728930))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83800 (_ BitVec 32)) Bool)

(assert (=> b!1276505 (= res!848321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1276506 () Bool)

(assert (=> b!1276506 (= e!728930 false)))

(declare-fun defaultEntry!1195 () Int)

(declare-fun lt!575497 () Bool)

(declare-fun minValue!1129 () V!49573)

(declare-fun k!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49573)

(declare-datatypes ((tuple2!21486 0))(
  ( (tuple2!21487 (_1!10754 (_ BitVec 64)) (_2!10754 V!49573)) )
))
(declare-datatypes ((List!28661 0))(
  ( (Nil!28658) (Cons!28657 (h!29866 tuple2!21486) (t!42197 List!28661)) )
))
(declare-datatypes ((ListLongMap!19143 0))(
  ( (ListLongMap!19144 (toList!9587 List!28661)) )
))
(declare-fun contains!7696 (ListLongMap!19143 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4671 (array!83800 array!83802 (_ BitVec 32) (_ BitVec 32) V!49573 V!49573 (_ BitVec 32) Int) ListLongMap!19143)

(assert (=> b!1276506 (= lt!575497 (contains!7696 (getCurrentListMap!4671 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k!1053))))

(declare-fun b!1276507 () Bool)

(assert (=> b!1276507 (= e!728928 (and e!728927 mapRes!51560))))

(declare-fun condMapEmpty!51560 () Bool)

(declare-fun mapDefault!51560 () ValueCell!15778)

