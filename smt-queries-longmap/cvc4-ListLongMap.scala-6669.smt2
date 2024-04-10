; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83990 () Bool)

(assert start!83990)

(declare-fun b_free!19745 () Bool)

(declare-fun b_next!19745 () Bool)

(assert (=> start!83990 (= b_free!19745 (not b_next!19745))))

(declare-fun tp!68758 () Bool)

(declare-fun b_and!31573 () Bool)

(assert (=> start!83990 (= tp!68758 b_and!31573)))

(declare-fun b!981579 () Bool)

(declare-fun res!656855 () Bool)

(declare-fun e!553354 () Bool)

(assert (=> b!981579 (=> (not res!656855) (not e!553354))))

(declare-datatypes ((array!61581 0))(
  ( (array!61582 (arr!29648 (Array (_ BitVec 32) (_ BitVec 64))) (size!30127 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61581)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!981579 (= res!656855 (validKeyInArray!0 (select (arr!29648 _keys!1544) from!1932)))))

(declare-fun b!981580 () Bool)

(declare-fun e!553356 () Bool)

(declare-fun tp_is_empty!22793 () Bool)

(assert (=> b!981580 (= e!553356 tp_is_empty!22793)))

(declare-fun b!981581 () Bool)

(declare-fun e!553353 () Bool)

(assert (=> b!981581 (= e!553354 e!553353)))

(declare-fun res!656856 () Bool)

(assert (=> b!981581 (=> (not res!656856) (not e!553353))))

(assert (=> b!981581 (= res!656856 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29648 _keys!1544) from!1932))))))

(declare-datatypes ((V!35373 0))(
  ( (V!35374 (val!11447 Int)) )
))
(declare-datatypes ((ValueCell!10915 0))(
  ( (ValueCellFull!10915 (v!14009 V!35373)) (EmptyCell!10915) )
))
(declare-datatypes ((array!61583 0))(
  ( (array!61584 (arr!29649 (Array (_ BitVec 32) ValueCell!10915)) (size!30128 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61583)

(declare-fun lt!435769 () V!35373)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15365 (ValueCell!10915 V!35373) V!35373)

(declare-fun dynLambda!1774 (Int (_ BitVec 64)) V!35373)

(assert (=> b!981581 (= lt!435769 (get!15365 (select (arr!29649 _values!1278) from!1932) (dynLambda!1774 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35373)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((tuple2!14650 0))(
  ( (tuple2!14651 (_1!7336 (_ BitVec 64)) (_2!7336 V!35373)) )
))
(declare-datatypes ((List!20534 0))(
  ( (Nil!20531) (Cons!20530 (h!21692 tuple2!14650) (t!29229 List!20534)) )
))
(declare-datatypes ((ListLongMap!13347 0))(
  ( (ListLongMap!13348 (toList!6689 List!20534)) )
))
(declare-fun lt!435768 () ListLongMap!13347)

(declare-fun zeroValue!1220 () V!35373)

(declare-fun getCurrentListMapNoExtraKeys!3391 (array!61581 array!61583 (_ BitVec 32) (_ BitVec 32) V!35373 V!35373 (_ BitVec 32) Int) ListLongMap!13347)

(assert (=> b!981581 (= lt!435768 (getCurrentListMapNoExtraKeys!3391 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!981582 () Bool)

(declare-fun res!656857 () Bool)

(assert (=> b!981582 (=> (not res!656857) (not e!553354))))

(assert (=> b!981582 (= res!656857 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30127 _keys!1544))))))

(declare-fun b!981583 () Bool)

(declare-fun res!656852 () Bool)

(assert (=> b!981583 (=> (not res!656852) (not e!553354))))

(assert (=> b!981583 (= res!656852 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!981584 () Bool)

(declare-fun res!656851 () Bool)

(assert (=> b!981584 (=> (not res!656851) (not e!553354))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61581 (_ BitVec 32)) Bool)

(assert (=> b!981584 (= res!656851 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!981585 () Bool)

(declare-fun res!656853 () Bool)

(assert (=> b!981585 (=> (not res!656853) (not e!553354))))

(assert (=> b!981585 (= res!656853 (and (= (size!30128 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30127 _keys!1544) (size!30128 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!981586 () Bool)

(declare-fun e!553355 () Bool)

(assert (=> b!981586 (= e!553355 tp_is_empty!22793)))

(declare-fun b!981587 () Bool)

(assert (=> b!981587 (= e!553353 (not true))))

(declare-fun lt!435767 () tuple2!14650)

(declare-fun lt!435766 () tuple2!14650)

(declare-fun +!2990 (ListLongMap!13347 tuple2!14650) ListLongMap!13347)

(assert (=> b!981587 (= (+!2990 (+!2990 lt!435768 lt!435767) lt!435766) (+!2990 (+!2990 lt!435768 lt!435766) lt!435767))))

(assert (=> b!981587 (= lt!435766 (tuple2!14651 (select (arr!29648 _keys!1544) from!1932) lt!435769))))

(assert (=> b!981587 (= lt!435767 (tuple2!14651 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32619 0))(
  ( (Unit!32620) )
))
(declare-fun lt!435770 () Unit!32619)

(declare-fun addCommutativeForDiffKeys!618 (ListLongMap!13347 (_ BitVec 64) V!35373 (_ BitVec 64) V!35373) Unit!32619)

(assert (=> b!981587 (= lt!435770 (addCommutativeForDiffKeys!618 lt!435768 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29648 _keys!1544) from!1932) lt!435769))))

(declare-fun b!981588 () Bool)

(declare-fun res!656858 () Bool)

(assert (=> b!981588 (=> (not res!656858) (not e!553354))))

(declare-datatypes ((List!20535 0))(
  ( (Nil!20532) (Cons!20531 (h!21693 (_ BitVec 64)) (t!29230 List!20535)) )
))
(declare-fun arrayNoDuplicates!0 (array!61581 (_ BitVec 32) List!20535) Bool)

(assert (=> b!981588 (= res!656858 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20532))))

(declare-fun mapIsEmpty!36218 () Bool)

(declare-fun mapRes!36218 () Bool)

(assert (=> mapIsEmpty!36218 mapRes!36218))

(declare-fun res!656854 () Bool)

(assert (=> start!83990 (=> (not res!656854) (not e!553354))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83990 (= res!656854 (validMask!0 mask!1948))))

(assert (=> start!83990 e!553354))

(assert (=> start!83990 true))

(assert (=> start!83990 tp_is_empty!22793))

(declare-fun e!553351 () Bool)

(declare-fun array_inv!22923 (array!61583) Bool)

(assert (=> start!83990 (and (array_inv!22923 _values!1278) e!553351)))

(assert (=> start!83990 tp!68758))

(declare-fun array_inv!22924 (array!61581) Bool)

(assert (=> start!83990 (array_inv!22924 _keys!1544)))

(declare-fun b!981589 () Bool)

(assert (=> b!981589 (= e!553351 (and e!553356 mapRes!36218))))

(declare-fun condMapEmpty!36218 () Bool)

(declare-fun mapDefault!36218 () ValueCell!10915)

