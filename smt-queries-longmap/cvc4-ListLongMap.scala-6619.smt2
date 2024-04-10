; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83678 () Bool)

(assert start!83678)

(declare-fun b!977283 () Bool)

(declare-fun e!550892 () Bool)

(declare-fun e!550895 () Bool)

(assert (=> b!977283 (= e!550892 e!550895)))

(declare-fun res!654099 () Bool)

(assert (=> b!977283 (=> res!654099 e!550895)))

(declare-datatypes ((List!20372 0))(
  ( (Nil!20369) (Cons!20368 (h!21530 (_ BitVec 64)) (t!28887 List!20372)) )
))
(declare-fun contains!5706 (List!20372 (_ BitVec 64)) Bool)

(assert (=> b!977283 (= res!654099 (contains!5706 Nil!20369 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!35765 () Bool)

(declare-fun mapRes!35765 () Bool)

(assert (=> mapIsEmpty!35765 mapRes!35765))

(declare-fun b!977284 () Bool)

(declare-fun res!654101 () Bool)

(assert (=> b!977284 (=> (not res!654101) (not e!550892))))

(declare-datatypes ((array!61019 0))(
  ( (array!61020 (arr!29368 (Array (_ BitVec 32) (_ BitVec 64))) (size!29847 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61019)

(assert (=> b!977284 (= res!654101 (and (bvsle #b00000000000000000000000000000000 (size!29847 _keys!1544)) (bvslt (size!29847 _keys!1544) #b01111111111111111111111111111111)))))

(declare-fun b!977285 () Bool)

(assert (=> b!977285 (= e!550895 (contains!5706 Nil!20369 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!977286 () Bool)

(declare-fun e!550897 () Bool)

(declare-fun tp_is_empty!22493 () Bool)

(assert (=> b!977286 (= e!550897 tp_is_empty!22493)))

(declare-fun b!977287 () Bool)

(declare-fun res!654102 () Bool)

(assert (=> b!977287 (=> (not res!654102) (not e!550892))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61019 (_ BitVec 32)) Bool)

(assert (=> b!977287 (= res!654102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!977288 () Bool)

(declare-fun res!654097 () Bool)

(assert (=> b!977288 (=> (not res!654097) (not e!550892))))

(declare-fun noDuplicate!1378 (List!20372) Bool)

(assert (=> b!977288 (= res!654097 (noDuplicate!1378 Nil!20369))))

(declare-fun b!977289 () Bool)

(declare-fun res!654100 () Bool)

(assert (=> b!977289 (=> (not res!654100) (not e!550892))))

(declare-datatypes ((V!34973 0))(
  ( (V!34974 (val!11297 Int)) )
))
(declare-datatypes ((ValueCell!10765 0))(
  ( (ValueCellFull!10765 (v!13858 V!34973)) (EmptyCell!10765) )
))
(declare-datatypes ((array!61021 0))(
  ( (array!61022 (arr!29369 (Array (_ BitVec 32) ValueCell!10765)) (size!29848 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61021)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!977289 (= res!654100 (and (= (size!29848 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29847 _keys!1544) (size!29848 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!977290 () Bool)

(declare-fun e!550894 () Bool)

(assert (=> b!977290 (= e!550894 tp_is_empty!22493)))

(declare-fun res!654098 () Bool)

(assert (=> start!83678 (=> (not res!654098) (not e!550892))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83678 (= res!654098 (validMask!0 mask!1948))))

(assert (=> start!83678 e!550892))

(assert (=> start!83678 true))

(declare-fun e!550893 () Bool)

(declare-fun array_inv!22703 (array!61021) Bool)

(assert (=> start!83678 (and (array_inv!22703 _values!1278) e!550893)))

(declare-fun array_inv!22704 (array!61019) Bool)

(assert (=> start!83678 (array_inv!22704 _keys!1544)))

(declare-fun mapNonEmpty!35765 () Bool)

(declare-fun tp!68017 () Bool)

(assert (=> mapNonEmpty!35765 (= mapRes!35765 (and tp!68017 e!550897))))

(declare-fun mapValue!35765 () ValueCell!10765)

(declare-fun mapKey!35765 () (_ BitVec 32))

(declare-fun mapRest!35765 () (Array (_ BitVec 32) ValueCell!10765))

(assert (=> mapNonEmpty!35765 (= (arr!29369 _values!1278) (store mapRest!35765 mapKey!35765 mapValue!35765))))

(declare-fun b!977291 () Bool)

(assert (=> b!977291 (= e!550893 (and e!550894 mapRes!35765))))

(declare-fun condMapEmpty!35765 () Bool)

(declare-fun mapDefault!35765 () ValueCell!10765)

