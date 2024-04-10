; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132158 () Bool)

(assert start!132158)

(declare-fun b_free!31871 () Bool)

(declare-fun b_next!31871 () Bool)

(assert (=> start!132158 (= b_free!31871 (not b_next!31871))))

(declare-fun tp!111865 () Bool)

(declare-fun b_and!51293 () Bool)

(assert (=> start!132158 (= tp!111865 b_and!51293)))

(declare-fun bm!70766 () Bool)

(declare-datatypes ((V!59305 0))(
  ( (V!59306 (val!19151 Int)) )
))
(declare-datatypes ((tuple2!24680 0))(
  ( (tuple2!24681 (_1!12351 (_ BitVec 64)) (_2!12351 V!59305)) )
))
(declare-datatypes ((List!36160 0))(
  ( (Nil!36157) (Cons!36156 (h!37601 tuple2!24680) (t!50866 List!36160)) )
))
(declare-datatypes ((ListLongMap!22289 0))(
  ( (ListLongMap!22290 (toList!11160 List!36160)) )
))
(declare-fun call!70769 () ListLongMap!22289)

(declare-fun call!70771 () ListLongMap!22289)

(assert (=> bm!70766 (= call!70769 call!70771)))

(declare-fun bm!70767 () Bool)

(declare-fun call!70772 () ListLongMap!22289)

(declare-fun call!70773 () ListLongMap!22289)

(assert (=> bm!70767 (= call!70772 call!70773)))

(declare-fun b!1550483 () Bool)

(declare-fun e!863084 () ListLongMap!22289)

(assert (=> b!1550483 (= e!863084 call!70772)))

(declare-fun b!1550484 () Bool)

(declare-fun e!863087 () ListLongMap!22289)

(assert (=> b!1550484 (= e!863087 call!70769)))

(declare-fun res!1062010 () Bool)

(declare-fun e!863080 () Bool)

(assert (=> start!132158 (=> (not res!1062010) (not e!863080))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132158 (= res!1062010 (validMask!0 mask!926))))

(assert (=> start!132158 e!863080))

(declare-datatypes ((array!103490 0))(
  ( (array!103491 (arr!49947 (Array (_ BitVec 32) (_ BitVec 64))) (size!50497 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103490)

(declare-fun array_inv!38833 (array!103490) Bool)

(assert (=> start!132158 (array_inv!38833 _keys!618)))

(declare-fun tp_is_empty!38147 () Bool)

(assert (=> start!132158 tp_is_empty!38147))

(assert (=> start!132158 true))

(assert (=> start!132158 tp!111865))

(declare-datatypes ((ValueCell!18163 0))(
  ( (ValueCellFull!18163 (v!21952 V!59305)) (EmptyCell!18163) )
))
(declare-datatypes ((array!103492 0))(
  ( (array!103493 (arr!49948 (Array (_ BitVec 32) ValueCell!18163)) (size!50498 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103492)

(declare-fun e!863083 () Bool)

(declare-fun array_inv!38834 (array!103492) Bool)

(assert (=> start!132158 (and (array_inv!38834 _values!470) e!863083)))

(declare-fun bm!70768 () Bool)

(declare-fun call!70770 () ListLongMap!22289)

(assert (=> bm!70768 (= call!70773 call!70770)))

(declare-fun b!1550485 () Bool)

(declare-fun res!1062006 () Bool)

(assert (=> b!1550485 (=> (not res!1062006) (not e!863080))))

(declare-datatypes ((List!36161 0))(
  ( (Nil!36158) (Cons!36157 (h!37602 (_ BitVec 64)) (t!50867 List!36161)) )
))
(declare-fun arrayNoDuplicates!0 (array!103490 (_ BitVec 32) List!36161) Bool)

(assert (=> b!1550485 (= res!1062006 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36158))))

(declare-fun b!1550486 () Bool)

(declare-fun res!1062007 () Bool)

(assert (=> b!1550486 (=> (not res!1062007) (not e!863080))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1550486 (= res!1062007 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50497 _keys!618))))))

(declare-fun b!1550487 () Bool)

(declare-fun e!863085 () Bool)

(declare-fun mapRes!58924 () Bool)

(assert (=> b!1550487 (= e!863083 (and e!863085 mapRes!58924))))

(declare-fun condMapEmpty!58924 () Bool)

(declare-fun mapDefault!58924 () ValueCell!18163)

