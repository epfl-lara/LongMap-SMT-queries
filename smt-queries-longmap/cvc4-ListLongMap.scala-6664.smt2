; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83960 () Bool)

(assert start!83960)

(declare-fun b!981151 () Bool)

(declare-fun e!553112 () Bool)

(declare-fun tp_is_empty!22763 () Bool)

(assert (=> b!981151 (= e!553112 tp_is_empty!22763)))

(declare-fun b!981152 () Bool)

(declare-fun e!553110 () Bool)

(assert (=> b!981152 (= e!553110 tp_is_empty!22763)))

(declare-fun b!981153 () Bool)

(declare-fun res!656569 () Bool)

(declare-fun e!553109 () Bool)

(assert (=> b!981153 (=> (not res!656569) (not e!553109))))

(declare-datatypes ((array!61523 0))(
  ( (array!61524 (arr!29619 (Array (_ BitVec 32) (_ BitVec 64))) (size!30098 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61523)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61523 (_ BitVec 32)) Bool)

(assert (=> b!981153 (= res!656569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!981154 () Bool)

(assert (=> b!981154 (= e!553109 false)))

(declare-fun lt!435662 () Bool)

(declare-datatypes ((List!20517 0))(
  ( (Nil!20514) (Cons!20513 (h!21675 (_ BitVec 64)) (t!29200 List!20517)) )
))
(declare-fun arrayNoDuplicates!0 (array!61523 (_ BitVec 32) List!20517) Bool)

(assert (=> b!981154 (= lt!435662 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20514))))

(declare-fun mapNonEmpty!36173 () Bool)

(declare-fun mapRes!36173 () Bool)

(declare-fun tp!68686 () Bool)

(assert (=> mapNonEmpty!36173 (= mapRes!36173 (and tp!68686 e!553110))))

(declare-datatypes ((V!35333 0))(
  ( (V!35334 (val!11432 Int)) )
))
(declare-datatypes ((ValueCell!10900 0))(
  ( (ValueCellFull!10900 (v!13994 V!35333)) (EmptyCell!10900) )
))
(declare-datatypes ((array!61525 0))(
  ( (array!61526 (arr!29620 (Array (_ BitVec 32) ValueCell!10900)) (size!30099 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61525)

(declare-fun mapValue!36173 () ValueCell!10900)

(declare-fun mapKey!36173 () (_ BitVec 32))

(declare-fun mapRest!36173 () (Array (_ BitVec 32) ValueCell!10900))

(assert (=> mapNonEmpty!36173 (= (arr!29620 _values!1278) (store mapRest!36173 mapKey!36173 mapValue!36173))))

(declare-fun mapIsEmpty!36173 () Bool)

(assert (=> mapIsEmpty!36173 mapRes!36173))

(declare-fun res!656570 () Bool)

(assert (=> start!83960 (=> (not res!656570) (not e!553109))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83960 (= res!656570 (validMask!0 mask!1948))))

(assert (=> start!83960 e!553109))

(assert (=> start!83960 true))

(declare-fun e!553111 () Bool)

(declare-fun array_inv!22899 (array!61525) Bool)

(assert (=> start!83960 (and (array_inv!22899 _values!1278) e!553111)))

(declare-fun array_inv!22900 (array!61523) Bool)

(assert (=> start!83960 (array_inv!22900 _keys!1544)))

(declare-fun b!981155 () Bool)

(declare-fun res!656568 () Bool)

(assert (=> b!981155 (=> (not res!656568) (not e!553109))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!981155 (= res!656568 (and (= (size!30099 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30098 _keys!1544) (size!30099 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!981156 () Bool)

(assert (=> b!981156 (= e!553111 (and e!553112 mapRes!36173))))

(declare-fun condMapEmpty!36173 () Bool)

(declare-fun mapDefault!36173 () ValueCell!10900)

