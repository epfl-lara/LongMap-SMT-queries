; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84522 () Bool)

(assert start!84522)

(declare-fun b_free!20017 () Bool)

(declare-fun b_next!20017 () Bool)

(assert (=> start!84522 (= b_free!20017 (not b_next!20017))))

(declare-fun tp!69836 () Bool)

(declare-fun b_and!32111 () Bool)

(assert (=> start!84522 (= tp!69836 b_and!32111)))

(declare-fun mapIsEmpty!36888 () Bool)

(declare-fun mapRes!36888 () Bool)

(assert (=> mapIsEmpty!36888 mapRes!36888))

(declare-fun res!661200 () Bool)

(declare-fun e!557446 () Bool)

(assert (=> start!84522 (=> (not res!661200) (not e!557446))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84522 (= res!661200 (validMask!0 mask!1948))))

(assert (=> start!84522 e!557446))

(assert (=> start!84522 true))

(declare-fun tp_is_empty!23233 () Bool)

(assert (=> start!84522 tp_is_empty!23233))

(declare-datatypes ((V!35961 0))(
  ( (V!35962 (val!11667 Int)) )
))
(declare-datatypes ((ValueCell!11135 0))(
  ( (ValueCellFull!11135 (v!14234 V!35961)) (EmptyCell!11135) )
))
(declare-datatypes ((array!62425 0))(
  ( (array!62426 (arr!30067 (Array (_ BitVec 32) ValueCell!11135)) (size!30546 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62425)

(declare-fun e!557449 () Bool)

(declare-fun array_inv!23233 (array!62425) Bool)

(assert (=> start!84522 (and (array_inv!23233 _values!1278) e!557449)))

(assert (=> start!84522 tp!69836))

(declare-datatypes ((array!62427 0))(
  ( (array!62428 (arr!30068 (Array (_ BitVec 32) (_ BitVec 64))) (size!30547 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62427)

(declare-fun array_inv!23234 (array!62427) Bool)

(assert (=> start!84522 (array_inv!23234 _keys!1544)))

(declare-fun b!988582 () Bool)

(declare-fun res!661201 () Bool)

(assert (=> b!988582 (=> (not res!661201) (not e!557446))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!988582 (= res!661201 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!988583 () Bool)

(declare-fun res!661203 () Bool)

(assert (=> b!988583 (=> (not res!661203) (not e!557446))))

(assert (=> b!988583 (= res!661203 (and (= (size!30546 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30547 _keys!1544) (size!30546 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!988584 () Bool)

(declare-fun e!557447 () Bool)

(assert (=> b!988584 (= e!557447 tp_is_empty!23233)))

(declare-fun b!988585 () Bool)

(declare-fun res!661199 () Bool)

(assert (=> b!988585 (=> (not res!661199) (not e!557446))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!988585 (= res!661199 (validKeyInArray!0 (select (arr!30068 _keys!1544) from!1932)))))

(declare-fun b!988586 () Bool)

(assert (=> b!988586 (= e!557446 (bvsge from!1932 (size!30546 _values!1278)))))

(declare-fun zeroValue!1220 () V!35961)

(declare-fun defaultEntry!1281 () Int)

(declare-datatypes ((tuple2!14864 0))(
  ( (tuple2!14865 (_1!7443 (_ BitVec 64)) (_2!7443 V!35961)) )
))
(declare-datatypes ((List!20796 0))(
  ( (Nil!20793) (Cons!20792 (h!21954 tuple2!14864) (t!29733 List!20796)) )
))
(declare-datatypes ((ListLongMap!13561 0))(
  ( (ListLongMap!13562 (toList!6796 List!20796)) )
))
(declare-fun lt!438532 () ListLongMap!13561)

(declare-fun minValue!1220 () V!35961)

(declare-fun getCurrentListMapNoExtraKeys!3487 (array!62427 array!62425 (_ BitVec 32) (_ BitVec 32) V!35961 V!35961 (_ BitVec 32) Int) ListLongMap!13561)

(assert (=> b!988586 (= lt!438532 (getCurrentListMapNoExtraKeys!3487 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun mapNonEmpty!36888 () Bool)

(declare-fun tp!69835 () Bool)

(assert (=> mapNonEmpty!36888 (= mapRes!36888 (and tp!69835 e!557447))))

(declare-fun mapRest!36888 () (Array (_ BitVec 32) ValueCell!11135))

(declare-fun mapValue!36888 () ValueCell!11135)

(declare-fun mapKey!36888 () (_ BitVec 32))

(assert (=> mapNonEmpty!36888 (= (arr!30067 _values!1278) (store mapRest!36888 mapKey!36888 mapValue!36888))))

(declare-fun b!988587 () Bool)

(declare-fun res!661197 () Bool)

(assert (=> b!988587 (=> (not res!661197) (not e!557446))))

(assert (=> b!988587 (= res!661197 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30547 _keys!1544))))))

(declare-fun b!988588 () Bool)

(declare-fun e!557448 () Bool)

(assert (=> b!988588 (= e!557449 (and e!557448 mapRes!36888))))

(declare-fun condMapEmpty!36888 () Bool)

(declare-fun mapDefault!36888 () ValueCell!11135)

