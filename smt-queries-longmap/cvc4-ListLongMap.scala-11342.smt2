; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131960 () Bool)

(assert start!131960)

(declare-fun b_free!31673 () Bool)

(declare-fun b_next!31673 () Bool)

(assert (=> start!131960 (= b_free!31673 (not b_next!31673))))

(declare-fun tp!111271 () Bool)

(declare-fun b_and!51083 () Bool)

(assert (=> start!131960 (= tp!111271 b_and!51083)))

(declare-fun b!1545593 () Bool)

(declare-datatypes ((V!59041 0))(
  ( (V!59042 (val!19052 Int)) )
))
(declare-datatypes ((tuple2!24486 0))(
  ( (tuple2!24487 (_1!12254 (_ BitVec 64)) (_2!12254 V!59041)) )
))
(declare-datatypes ((List!35996 0))(
  ( (Nil!35993) (Cons!35992 (h!37437 tuple2!24486) (t!50690 List!35996)) )
))
(declare-datatypes ((ListLongMap!22095 0))(
  ( (ListLongMap!22096 (toList!11063 List!35996)) )
))
(declare-fun e!860312 () ListLongMap!22095)

(declare-fun call!69276 () ListLongMap!22095)

(declare-fun minValue!436 () V!59041)

(declare-fun +!4899 (ListLongMap!22095 tuple2!24486) ListLongMap!22095)

(assert (=> b!1545593 (= e!860312 (+!4899 call!69276 (tuple2!24487 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun bm!69272 () Bool)

(declare-fun call!69278 () ListLongMap!22095)

(declare-fun call!69277 () ListLongMap!22095)

(assert (=> bm!69272 (= call!69278 call!69277)))

(declare-fun b!1545594 () Bool)

(declare-fun e!860314 () Bool)

(declare-fun tp_is_empty!37949 () Bool)

(assert (=> b!1545594 (= e!860314 tp_is_empty!37949)))

(declare-fun mapIsEmpty!58627 () Bool)

(declare-fun mapRes!58627 () Bool)

(assert (=> mapIsEmpty!58627 mapRes!58627))

(declare-fun b!1545595 () Bool)

(declare-fun res!1059873 () Bool)

(declare-fun e!860309 () Bool)

(assert (=> b!1545595 (=> (not res!1059873) (not e!860309))))

(declare-datatypes ((array!103104 0))(
  ( (array!103105 (arr!49754 (Array (_ BitVec 32) (_ BitVec 64))) (size!50304 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103104)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18064 0))(
  ( (ValueCellFull!18064 (v!21853 V!59041)) (EmptyCell!18064) )
))
(declare-datatypes ((array!103106 0))(
  ( (array!103107 (arr!49755 (Array (_ BitVec 32) ValueCell!18064)) (size!50305 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103106)

(assert (=> b!1545595 (= res!1059873 (and (= (size!50305 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50304 _keys!618) (size!50305 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1545596 () Bool)

(declare-fun e!860316 () ListLongMap!22095)

(declare-fun call!69279 () ListLongMap!22095)

(assert (=> b!1545596 (= e!860316 call!69279)))

(declare-fun mapNonEmpty!58627 () Bool)

(declare-fun tp!111270 () Bool)

(declare-fun e!860311 () Bool)

(assert (=> mapNonEmpty!58627 (= mapRes!58627 (and tp!111270 e!860311))))

(declare-fun mapValue!58627 () ValueCell!18064)

(declare-fun mapKey!58627 () (_ BitVec 32))

(declare-fun mapRest!58627 () (Array (_ BitVec 32) ValueCell!18064))

(assert (=> mapNonEmpty!58627 (= (arr!49755 _values!470) (store mapRest!58627 mapKey!58627 mapValue!58627))))

(declare-fun b!1545597 () Bool)

(declare-fun res!1059877 () Bool)

(assert (=> b!1545597 (=> (not res!1059877) (not e!860309))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103104 (_ BitVec 32)) Bool)

(assert (=> b!1545597 (= res!1059877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1545598 () Bool)

(declare-fun e!860310 () Bool)

(assert (=> b!1545598 (= e!860310 (and e!860314 mapRes!58627))))

(declare-fun condMapEmpty!58627 () Bool)

(declare-fun mapDefault!58627 () ValueCell!18064)

