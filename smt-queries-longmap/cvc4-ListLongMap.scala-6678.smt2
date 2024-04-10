; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84044 () Bool)

(assert start!84044)

(declare-fun b_free!19799 () Bool)

(declare-fun b_next!19799 () Bool)

(assert (=> start!84044 (= b_free!19799 (not b_next!19799))))

(declare-fun tp!68919 () Bool)

(declare-fun b_and!31681 () Bool)

(assert (=> start!84044 (= tp!68919 b_and!31681)))

(declare-fun b!982524 () Bool)

(declare-fun e!553840 () Bool)

(assert (=> b!982524 (= e!553840 (not true))))

(declare-datatypes ((V!35445 0))(
  ( (V!35446 (val!11474 Int)) )
))
(declare-datatypes ((tuple2!14698 0))(
  ( (tuple2!14699 (_1!7360 (_ BitVec 64)) (_2!7360 V!35445)) )
))
(declare-datatypes ((List!20579 0))(
  ( (Nil!20576) (Cons!20575 (h!21737 tuple2!14698) (t!29328 List!20579)) )
))
(declare-datatypes ((ListLongMap!13395 0))(
  ( (ListLongMap!13396 (toList!6713 List!20579)) )
))
(declare-fun lt!436175 () ListLongMap!13395)

(declare-fun lt!436171 () tuple2!14698)

(declare-fun lt!436172 () tuple2!14698)

(declare-fun +!3011 (ListLongMap!13395 tuple2!14698) ListLongMap!13395)

(assert (=> b!982524 (= (+!3011 (+!3011 lt!436175 lt!436171) lt!436172) (+!3011 (+!3011 lt!436175 lt!436172) lt!436171))))

(declare-fun lt!436174 () V!35445)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61685 0))(
  ( (array!61686 (arr!29700 (Array (_ BitVec 32) (_ BitVec 64))) (size!30179 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61685)

(assert (=> b!982524 (= lt!436172 (tuple2!14699 (select (arr!29700 _keys!1544) from!1932) lt!436174))))

(declare-fun zeroValue!1220 () V!35445)

(assert (=> b!982524 (= lt!436171 (tuple2!14699 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32661 0))(
  ( (Unit!32662) )
))
(declare-fun lt!436173 () Unit!32661)

(declare-fun addCommutativeForDiffKeys!639 (ListLongMap!13395 (_ BitVec 64) V!35445 (_ BitVec 64) V!35445) Unit!32661)

(assert (=> b!982524 (= lt!436173 (addCommutativeForDiffKeys!639 lt!436175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29700 _keys!1544) from!1932) lt!436174))))

(declare-fun b!982525 () Bool)

(declare-fun res!657499 () Bool)

(declare-fun e!553842 () Bool)

(assert (=> b!982525 (=> (not res!657499) (not e!553842))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61685 (_ BitVec 32)) Bool)

(assert (=> b!982525 (= res!657499 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!982526 () Bool)

(declare-fun res!657501 () Bool)

(assert (=> b!982526 (=> (not res!657501) (not e!553842))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!982526 (= res!657501 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!982527 () Bool)

(declare-fun e!553837 () Bool)

(declare-fun tp_is_empty!22847 () Bool)

(assert (=> b!982527 (= e!553837 tp_is_empty!22847)))

(declare-fun b!982528 () Bool)

(declare-fun res!657503 () Bool)

(assert (=> b!982528 (=> (not res!657503) (not e!553842))))

(declare-datatypes ((ValueCell!10942 0))(
  ( (ValueCellFull!10942 (v!14036 V!35445)) (EmptyCell!10942) )
))
(declare-datatypes ((array!61687 0))(
  ( (array!61688 (arr!29701 (Array (_ BitVec 32) ValueCell!10942)) (size!30180 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61687)

(assert (=> b!982528 (= res!657503 (and (= (size!30180 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30179 _keys!1544) (size!30180 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!982529 () Bool)

(declare-fun res!657506 () Bool)

(assert (=> b!982529 (=> (not res!657506) (not e!553842))))

(assert (=> b!982529 (= res!657506 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30179 _keys!1544))))))

(declare-fun res!657505 () Bool)

(assert (=> start!84044 (=> (not res!657505) (not e!553842))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84044 (= res!657505 (validMask!0 mask!1948))))

(assert (=> start!84044 e!553842))

(assert (=> start!84044 true))

(assert (=> start!84044 tp_is_empty!22847))

(declare-fun e!553841 () Bool)

(declare-fun array_inv!22967 (array!61687) Bool)

(assert (=> start!84044 (and (array_inv!22967 _values!1278) e!553841)))

(assert (=> start!84044 tp!68919))

(declare-fun array_inv!22968 (array!61685) Bool)

(assert (=> start!84044 (array_inv!22968 _keys!1544)))

(declare-fun mapNonEmpty!36299 () Bool)

(declare-fun mapRes!36299 () Bool)

(declare-fun tp!68920 () Bool)

(declare-fun e!553839 () Bool)

(assert (=> mapNonEmpty!36299 (= mapRes!36299 (and tp!68920 e!553839))))

(declare-fun mapValue!36299 () ValueCell!10942)

(declare-fun mapRest!36299 () (Array (_ BitVec 32) ValueCell!10942))

(declare-fun mapKey!36299 () (_ BitVec 32))

(assert (=> mapNonEmpty!36299 (= (arr!29701 _values!1278) (store mapRest!36299 mapKey!36299 mapValue!36299))))

(declare-fun mapIsEmpty!36299 () Bool)

(assert (=> mapIsEmpty!36299 mapRes!36299))

(declare-fun b!982530 () Bool)

(assert (=> b!982530 (= e!553839 tp_is_empty!22847)))

(declare-fun b!982531 () Bool)

(assert (=> b!982531 (= e!553842 e!553840)))

(declare-fun res!657504 () Bool)

(assert (=> b!982531 (=> (not res!657504) (not e!553840))))

(assert (=> b!982531 (= res!657504 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29700 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15405 (ValueCell!10942 V!35445) V!35445)

(declare-fun dynLambda!1796 (Int (_ BitVec 64)) V!35445)

(assert (=> b!982531 (= lt!436174 (get!15405 (select (arr!29701 _values!1278) from!1932) (dynLambda!1796 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35445)

(declare-fun getCurrentListMapNoExtraKeys!3413 (array!61685 array!61687 (_ BitVec 32) (_ BitVec 32) V!35445 V!35445 (_ BitVec 32) Int) ListLongMap!13395)

(assert (=> b!982531 (= lt!436175 (getCurrentListMapNoExtraKeys!3413 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!982532 () Bool)

(assert (=> b!982532 (= e!553841 (and e!553837 mapRes!36299))))

(declare-fun condMapEmpty!36299 () Bool)

(declare-fun mapDefault!36299 () ValueCell!10942)

