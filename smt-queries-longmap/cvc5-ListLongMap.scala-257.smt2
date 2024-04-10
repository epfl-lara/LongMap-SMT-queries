; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4244 () Bool)

(assert start!4244)

(declare-fun b_free!1129 () Bool)

(declare-fun b_next!1129 () Bool)

(assert (=> start!4244 (= b_free!1129 (not b_next!1129))))

(declare-fun tp!4810 () Bool)

(declare-fun b_and!1941 () Bool)

(assert (=> start!4244 (= tp!4810 b_and!1941)))

(declare-fun b!32430 () Bool)

(declare-fun e!20613 () Bool)

(declare-datatypes ((array!2177 0))(
  ( (array!2178 (arr!1041 (Array (_ BitVec 32) (_ BitVec 64))) (size!1142 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2177)

(declare-fun lt!11744 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!32430 (= e!20613 (not (validKeyInArray!0 (select (arr!1041 _keys!1833) lt!11744))))))

(declare-fun b!32431 () Bool)

(declare-fun e!20614 () Bool)

(assert (=> b!32431 (= e!20614 e!20613)))

(declare-fun res!19702 () Bool)

(assert (=> b!32431 (=> (not res!19702) (not e!20613))))

(assert (=> b!32431 (= res!19702 (and (bvsge lt!11744 #b00000000000000000000000000000000) (bvslt lt!11744 (size!1142 _keys!1833))))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!2177 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!32431 (= lt!11744 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!32432 () Bool)

(declare-fun res!19698 () Bool)

(assert (=> b!32432 (=> (not res!19698) (not e!20614))))

(declare-datatypes ((V!1803 0))(
  ( (V!1804 (val!768 Int)) )
))
(declare-datatypes ((ValueCell!542 0))(
  ( (ValueCellFull!542 (v!1858 V!1803)) (EmptyCell!542) )
))
(declare-datatypes ((array!2179 0))(
  ( (array!2180 (arr!1042 (Array (_ BitVec 32) ValueCell!542)) (size!1143 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2179)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!32432 (= res!19698 (and (= (size!1143 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1142 _keys!1833) (size!1143 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!32433 () Bool)

(declare-fun res!19704 () Bool)

(assert (=> b!32433 (=> (not res!19704) (not e!20614))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2177 (_ BitVec 32)) Bool)

(assert (=> b!32433 (= res!19704 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!1756 () Bool)

(declare-fun mapRes!1756 () Bool)

(declare-fun tp!4809 () Bool)

(declare-fun e!20617 () Bool)

(assert (=> mapNonEmpty!1756 (= mapRes!1756 (and tp!4809 e!20617))))

(declare-fun mapValue!1756 () ValueCell!542)

(declare-fun mapKey!1756 () (_ BitVec 32))

(declare-fun mapRest!1756 () (Array (_ BitVec 32) ValueCell!542))

(assert (=> mapNonEmpty!1756 (= (arr!1042 _values!1501) (store mapRest!1756 mapKey!1756 mapValue!1756))))

(declare-fun b!32434 () Bool)

(declare-fun res!19703 () Bool)

(assert (=> b!32434 (=> (not res!19703) (not e!20614))))

(declare-fun arrayContainsKey!0 (array!2177 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!32434 (= res!19703 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun res!19697 () Bool)

(assert (=> start!4244 (=> (not res!19697) (not e!20614))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4244 (= res!19697 (validMask!0 mask!2294))))

(assert (=> start!4244 e!20614))

(assert (=> start!4244 true))

(assert (=> start!4244 tp!4810))

(declare-fun e!20618 () Bool)

(declare-fun array_inv!727 (array!2179) Bool)

(assert (=> start!4244 (and (array_inv!727 _values!1501) e!20618)))

(declare-fun array_inv!728 (array!2177) Bool)

(assert (=> start!4244 (array_inv!728 _keys!1833)))

(declare-fun tp_is_empty!1483 () Bool)

(assert (=> start!4244 tp_is_empty!1483))

(declare-fun b!32435 () Bool)

(declare-fun res!19701 () Bool)

(assert (=> b!32435 (=> (not res!19701) (not e!20614))))

(assert (=> b!32435 (= res!19701 (validKeyInArray!0 k!1304))))

(declare-fun mapIsEmpty!1756 () Bool)

(assert (=> mapIsEmpty!1756 mapRes!1756))

(declare-fun b!32436 () Bool)

(assert (=> b!32436 (= e!20617 tp_is_empty!1483)))

(declare-fun b!32437 () Bool)

(declare-fun e!20616 () Bool)

(assert (=> b!32437 (= e!20616 tp_is_empty!1483)))

(declare-fun b!32438 () Bool)

(declare-fun res!19699 () Bool)

(assert (=> b!32438 (=> (not res!19699) (not e!20614))))

(declare-datatypes ((List!841 0))(
  ( (Nil!838) (Cons!837 (h!1404 (_ BitVec 64)) (t!3536 List!841)) )
))
(declare-fun arrayNoDuplicates!0 (array!2177 (_ BitVec 32) List!841) Bool)

(assert (=> b!32438 (= res!19699 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!838))))

(declare-fun b!32439 () Bool)

(assert (=> b!32439 (= e!20618 (and e!20616 mapRes!1756))))

(declare-fun condMapEmpty!1756 () Bool)

(declare-fun mapDefault!1756 () ValueCell!542)

