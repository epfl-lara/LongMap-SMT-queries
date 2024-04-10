; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83986 () Bool)

(assert start!83986)

(declare-fun b_free!19741 () Bool)

(declare-fun b_next!19741 () Bool)

(assert (=> start!83986 (= b_free!19741 (not b_next!19741))))

(declare-fun tp!68746 () Bool)

(declare-fun b_and!31565 () Bool)

(assert (=> start!83986 (= tp!68746 b_and!31565)))

(declare-fun b!981509 () Bool)

(declare-fun res!656803 () Bool)

(declare-fun e!553317 () Bool)

(assert (=> b!981509 (=> (not res!656803) (not e!553317))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35369 0))(
  ( (V!35370 (val!11445 Int)) )
))
(declare-datatypes ((ValueCell!10913 0))(
  ( (ValueCellFull!10913 (v!14007 V!35369)) (EmptyCell!10913) )
))
(declare-datatypes ((array!61573 0))(
  ( (array!61574 (arr!29644 (Array (_ BitVec 32) ValueCell!10913)) (size!30123 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61573)

(declare-datatypes ((array!61575 0))(
  ( (array!61576 (arr!29645 (Array (_ BitVec 32) (_ BitVec 64))) (size!30124 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61575)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!981509 (= res!656803 (and (= (size!30123 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30124 _keys!1544) (size!30123 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!36212 () Bool)

(declare-fun mapRes!36212 () Bool)

(declare-fun tp!68745 () Bool)

(declare-fun e!553319 () Bool)

(assert (=> mapNonEmpty!36212 (= mapRes!36212 (and tp!68745 e!553319))))

(declare-fun mapKey!36212 () (_ BitVec 32))

(declare-fun mapRest!36212 () (Array (_ BitVec 32) ValueCell!10913))

(declare-fun mapValue!36212 () ValueCell!10913)

(assert (=> mapNonEmpty!36212 (= (arr!29644 _values!1278) (store mapRest!36212 mapKey!36212 mapValue!36212))))

(declare-fun b!981510 () Bool)

(declare-fun res!656810 () Bool)

(assert (=> b!981510 (=> (not res!656810) (not e!553317))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61575 (_ BitVec 32)) Bool)

(assert (=> b!981510 (= res!656810 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!981511 () Bool)

(declare-fun res!656808 () Bool)

(assert (=> b!981511 (=> (not res!656808) (not e!553317))))

(assert (=> b!981511 (= res!656808 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!981512 () Bool)

(declare-fun res!656805 () Bool)

(assert (=> b!981512 (=> (not res!656805) (not e!553317))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!981512 (= res!656805 (validKeyInArray!0 (select (arr!29645 _keys!1544) from!1932)))))

(declare-fun res!656804 () Bool)

(assert (=> start!83986 (=> (not res!656804) (not e!553317))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83986 (= res!656804 (validMask!0 mask!1948))))

(assert (=> start!83986 e!553317))

(assert (=> start!83986 true))

(declare-fun tp_is_empty!22789 () Bool)

(assert (=> start!83986 tp_is_empty!22789))

(declare-fun e!553318 () Bool)

(declare-fun array_inv!22919 (array!61573) Bool)

(assert (=> start!83986 (and (array_inv!22919 _values!1278) e!553318)))

(assert (=> start!83986 tp!68746))

(declare-fun array_inv!22920 (array!61575) Bool)

(assert (=> start!83986 (array_inv!22920 _keys!1544)))

(declare-fun b!981513 () Bool)

(declare-fun e!553316 () Bool)

(assert (=> b!981513 (= e!553318 (and e!553316 mapRes!36212))))

(declare-fun condMapEmpty!36212 () Bool)

(declare-fun mapDefault!36212 () ValueCell!10913)

