; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109166 () Bool)

(assert start!109166)

(declare-fun b_free!28655 () Bool)

(declare-fun b_next!28655 () Bool)

(assert (=> start!109166 (= b_free!28655 (not b_next!28655))))

(declare-fun tp!101084 () Bool)

(declare-fun b_and!46745 () Bool)

(assert (=> start!109166 (= tp!101084 b_and!46745)))

(declare-fun mapNonEmpty!53003 () Bool)

(declare-fun mapRes!53003 () Bool)

(declare-fun tp!101083 () Bool)

(declare-fun e!737036 () Bool)

(assert (=> mapNonEmpty!53003 (= mapRes!53003 (and tp!101083 e!737036))))

(declare-datatypes ((V!50829 0))(
  ( (V!50830 (val!17222 Int)) )
))
(declare-datatypes ((ValueCell!16249 0))(
  ( (ValueCellFull!16249 (v!19825 V!50829)) (EmptyCell!16249) )
))
(declare-fun mapValue!53003 () ValueCell!16249)

(declare-datatypes ((array!85626 0))(
  ( (array!85627 (arr!41314 (Array (_ BitVec 32) ValueCell!16249)) (size!41864 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85626)

(declare-fun mapKey!53003 () (_ BitVec 32))

(declare-fun mapRest!53003 () (Array (_ BitVec 32) ValueCell!16249))

(assert (=> mapNonEmpty!53003 (= (arr!41314 _values!1445) (store mapRest!53003 mapKey!53003 mapValue!53003))))

(declare-fun mapIsEmpty!53003 () Bool)

(assert (=> mapIsEmpty!53003 mapRes!53003))

(declare-fun b!1291073 () Bool)

(declare-fun res!857749 () Bool)

(declare-fun e!737033 () Bool)

(assert (=> b!1291073 (=> (not res!857749) (not e!737033))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((array!85628 0))(
  ( (array!85629 (arr!41315 (Array (_ BitVec 32) (_ BitVec 64))) (size!41865 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85628)

(assert (=> b!1291073 (= res!857749 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41865 _keys!1741))))))

(declare-fun b!1291074 () Bool)

(declare-fun res!857747 () Bool)

(assert (=> b!1291074 (=> (not res!857747) (not e!737033))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1291074 (= res!857747 (not (validKeyInArray!0 (select (arr!41315 _keys!1741) from!2144))))))

(declare-fun b!1291075 () Bool)

(declare-fun res!857750 () Bool)

(assert (=> b!1291075 (=> (not res!857750) (not e!737033))))

(declare-datatypes ((List!29299 0))(
  ( (Nil!29296) (Cons!29295 (h!30504 (_ BitVec 64)) (t!42863 List!29299)) )
))
(declare-fun arrayNoDuplicates!0 (array!85628 (_ BitVec 32) List!29299) Bool)

(assert (=> b!1291075 (= res!857750 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29296))))

(declare-fun b!1291076 () Bool)

(declare-fun e!737032 () Bool)

(declare-fun e!737035 () Bool)

(assert (=> b!1291076 (= e!737032 (and e!737035 mapRes!53003))))

(declare-fun condMapEmpty!53003 () Bool)

(declare-fun mapDefault!53003 () ValueCell!16249)

