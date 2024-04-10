; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84628 () Bool)

(assert start!84628)

(declare-fun b_free!20053 () Bool)

(declare-fun b_next!20053 () Bool)

(assert (=> start!84628 (= b_free!20053 (not b_next!20053))))

(declare-fun tp!69950 () Bool)

(declare-fun b_and!32185 () Bool)

(assert (=> start!84628 (= tp!69950 b_and!32185)))

(declare-fun b!989735 () Bool)

(declare-fun res!661839 () Bool)

(declare-fun e!558096 () Bool)

(assert (=> b!989735 (=> (not res!661839) (not e!558096))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!36009 0))(
  ( (V!36010 (val!11685 Int)) )
))
(declare-datatypes ((ValueCell!11153 0))(
  ( (ValueCellFull!11153 (v!14255 V!36009)) (EmptyCell!11153) )
))
(declare-datatypes ((array!62497 0))(
  ( (array!62498 (arr!30101 (Array (_ BitVec 32) ValueCell!11153)) (size!30580 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62497)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!62499 0))(
  ( (array!62500 (arr!30102 (Array (_ BitVec 32) (_ BitVec 64))) (size!30581 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62499)

(assert (=> b!989735 (= res!661839 (and (= (size!30580 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30581 _keys!1544) (size!30580 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!989736 () Bool)

(declare-fun e!558094 () Bool)

(declare-fun tp_is_empty!23269 () Bool)

(assert (=> b!989736 (= e!558094 tp_is_empty!23269)))

(declare-fun b!989737 () Bool)

(declare-fun e!558095 () Bool)

(assert (=> b!989737 (= e!558095 tp_is_empty!23269)))

(declare-fun b!989738 () Bool)

(declare-fun res!661841 () Bool)

(assert (=> b!989738 (=> (not res!661841) (not e!558096))))

(declare-datatypes ((List!20823 0))(
  ( (Nil!20820) (Cons!20819 (h!21981 (_ BitVec 64)) (t!29780 List!20823)) )
))
(declare-fun arrayNoDuplicates!0 (array!62499 (_ BitVec 32) List!20823) Bool)

(assert (=> b!989738 (= res!661841 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20820))))

(declare-fun mapIsEmpty!36949 () Bool)

(declare-fun mapRes!36949 () Bool)

(assert (=> mapIsEmpty!36949 mapRes!36949))

(declare-fun res!661843 () Bool)

(assert (=> start!84628 (=> (not res!661843) (not e!558096))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84628 (= res!661843 (validMask!0 mask!1948))))

(assert (=> start!84628 e!558096))

(assert (=> start!84628 true))

(assert (=> start!84628 tp_is_empty!23269))

(declare-fun e!558092 () Bool)

(declare-fun array_inv!23253 (array!62497) Bool)

(assert (=> start!84628 (and (array_inv!23253 _values!1278) e!558092)))

(assert (=> start!84628 tp!69950))

(declare-fun array_inv!23254 (array!62499) Bool)

(assert (=> start!84628 (array_inv!23254 _keys!1544)))

(declare-fun b!989739 () Bool)

(declare-fun res!661840 () Bool)

(assert (=> b!989739 (=> (not res!661840) (not e!558096))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!989739 (= res!661840 (validKeyInArray!0 (select (arr!30102 _keys!1544) from!1932)))))

(declare-fun b!989740 () Bool)

(assert (=> b!989740 (= e!558096 (bvsge from!1932 (size!30580 _values!1278)))))

(declare-datatypes ((tuple2!14894 0))(
  ( (tuple2!14895 (_1!7458 (_ BitVec 64)) (_2!7458 V!36009)) )
))
(declare-datatypes ((List!20824 0))(
  ( (Nil!20821) (Cons!20820 (h!21982 tuple2!14894) (t!29781 List!20824)) )
))
(declare-datatypes ((ListLongMap!13591 0))(
  ( (ListLongMap!13592 (toList!6811 List!20824)) )
))
(declare-fun lt!439107 () ListLongMap!13591)

(declare-fun minValue!1220 () V!36009)

(declare-fun zeroValue!1220 () V!36009)

(declare-fun defaultEntry!1281 () Int)

(declare-fun getCurrentListMapNoExtraKeys!3501 (array!62499 array!62497 (_ BitVec 32) (_ BitVec 32) V!36009 V!36009 (_ BitVec 32) Int) ListLongMap!13591)

(assert (=> b!989740 (= lt!439107 (getCurrentListMapNoExtraKeys!3501 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!989741 () Bool)

(assert (=> b!989741 (= e!558092 (and e!558094 mapRes!36949))))

(declare-fun condMapEmpty!36949 () Bool)

(declare-fun mapDefault!36949 () ValueCell!11153)

