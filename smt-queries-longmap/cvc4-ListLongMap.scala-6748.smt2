; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84626 () Bool)

(assert start!84626)

(declare-fun b_free!20051 () Bool)

(declare-fun b_next!20051 () Bool)

(assert (=> start!84626 (= b_free!20051 (not b_next!20051))))

(declare-fun tp!69945 () Bool)

(declare-fun b_and!32183 () Bool)

(assert (=> start!84626 (= tp!69945 b_and!32183)))

(declare-fun b!989706 () Bool)

(declare-fun res!661822 () Bool)

(declare-fun e!558080 () Bool)

(assert (=> b!989706 (=> (not res!661822) (not e!558080))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!36005 0))(
  ( (V!36006 (val!11684 Int)) )
))
(declare-datatypes ((ValueCell!11152 0))(
  ( (ValueCellFull!11152 (v!14254 V!36005)) (EmptyCell!11152) )
))
(declare-datatypes ((array!62493 0))(
  ( (array!62494 (arr!30099 (Array (_ BitVec 32) ValueCell!11152)) (size!30578 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62493)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!62495 0))(
  ( (array!62496 (arr!30100 (Array (_ BitVec 32) (_ BitVec 64))) (size!30579 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62495)

(assert (=> b!989706 (= res!661822 (and (= (size!30578 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30579 _keys!1544) (size!30578 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!36946 () Bool)

(declare-fun mapRes!36946 () Bool)

(assert (=> mapIsEmpty!36946 mapRes!36946))

(declare-fun b!989707 () Bool)

(declare-fun res!661823 () Bool)

(assert (=> b!989707 (=> (not res!661823) (not e!558080))))

(declare-datatypes ((List!20821 0))(
  ( (Nil!20818) (Cons!20817 (h!21979 (_ BitVec 64)) (t!29778 List!20821)) )
))
(declare-fun arrayNoDuplicates!0 (array!62495 (_ BitVec 32) List!20821) Bool)

(assert (=> b!989707 (= res!661823 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20818))))

(declare-fun b!989708 () Bool)

(assert (=> b!989708 (= e!558080 false)))

(declare-fun minValue!1220 () V!36005)

(declare-fun zeroValue!1220 () V!36005)

(declare-fun defaultEntry!1281 () Int)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((tuple2!14892 0))(
  ( (tuple2!14893 (_1!7457 (_ BitVec 64)) (_2!7457 V!36005)) )
))
(declare-datatypes ((List!20822 0))(
  ( (Nil!20819) (Cons!20818 (h!21980 tuple2!14892) (t!29779 List!20822)) )
))
(declare-datatypes ((ListLongMap!13589 0))(
  ( (ListLongMap!13590 (toList!6810 List!20822)) )
))
(declare-fun lt!439104 () ListLongMap!13589)

(declare-fun getCurrentListMapNoExtraKeys!3500 (array!62495 array!62493 (_ BitVec 32) (_ BitVec 32) V!36005 V!36005 (_ BitVec 32) Int) ListLongMap!13589)

(assert (=> b!989708 (= lt!439104 (getCurrentListMapNoExtraKeys!3500 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!989705 () Bool)

(declare-fun res!661824 () Bool)

(assert (=> b!989705 (=> (not res!661824) (not e!558080))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!989705 (= res!661824 (validKeyInArray!0 (select (arr!30100 _keys!1544) from!1932)))))

(declare-fun res!661819 () Bool)

(assert (=> start!84626 (=> (not res!661819) (not e!558080))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84626 (= res!661819 (validMask!0 mask!1948))))

(assert (=> start!84626 e!558080))

(assert (=> start!84626 true))

(declare-fun tp_is_empty!23267 () Bool)

(assert (=> start!84626 tp_is_empty!23267))

(declare-fun e!558077 () Bool)

(declare-fun array_inv!23251 (array!62493) Bool)

(assert (=> start!84626 (and (array_inv!23251 _values!1278) e!558077)))

(assert (=> start!84626 tp!69945))

(declare-fun array_inv!23252 (array!62495) Bool)

(assert (=> start!84626 (array_inv!23252 _keys!1544)))

(declare-fun mapNonEmpty!36946 () Bool)

(declare-fun tp!69944 () Bool)

(declare-fun e!558081 () Bool)

(assert (=> mapNonEmpty!36946 (= mapRes!36946 (and tp!69944 e!558081))))

(declare-fun mapValue!36946 () ValueCell!11152)

(declare-fun mapRest!36946 () (Array (_ BitVec 32) ValueCell!11152))

(declare-fun mapKey!36946 () (_ BitVec 32))

(assert (=> mapNonEmpty!36946 (= (arr!30099 _values!1278) (store mapRest!36946 mapKey!36946 mapValue!36946))))

(declare-fun b!989709 () Bool)

(declare-fun e!558079 () Bool)

(assert (=> b!989709 (= e!558077 (and e!558079 mapRes!36946))))

(declare-fun condMapEmpty!36946 () Bool)

(declare-fun mapDefault!36946 () ValueCell!11152)

