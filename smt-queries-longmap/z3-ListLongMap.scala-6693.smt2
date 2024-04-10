; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84132 () Bool)

(assert start!84132)

(declare-fun b!983680 () Bool)

(declare-fun e!554563 () Bool)

(assert (=> b!983680 (= e!554563 false)))

(declare-fun lt!436559 () Bool)

(declare-datatypes ((array!61853 0))(
  ( (array!61854 (arr!29784 (Array (_ BitVec 32) (_ BitVec 64))) (size!30263 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61853)

(declare-datatypes ((List!20621 0))(
  ( (Nil!20618) (Cons!20617 (h!21779 (_ BitVec 64)) (t!29412 List!20621)) )
))
(declare-fun arrayNoDuplicates!0 (array!61853 (_ BitVec 32) List!20621) Bool)

(assert (=> b!983680 (= lt!436559 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20618))))

(declare-fun b!983681 () Bool)

(declare-fun e!554562 () Bool)

(declare-fun tp_is_empty!22935 () Bool)

(assert (=> b!983681 (= e!554562 tp_is_empty!22935)))

(declare-fun b!983682 () Bool)

(declare-fun e!554561 () Bool)

(assert (=> b!983682 (= e!554561 tp_is_empty!22935)))

(declare-fun b!983683 () Bool)

(declare-fun res!658216 () Bool)

(assert (=> b!983683 (=> (not res!658216) (not e!554563))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61853 (_ BitVec 32)) Bool)

(assert (=> b!983683 (= res!658216 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!36431 () Bool)

(declare-fun mapRes!36431 () Bool)

(assert (=> mapIsEmpty!36431 mapRes!36431))

(declare-fun b!983684 () Bool)

(declare-fun res!658215 () Bool)

(assert (=> b!983684 (=> (not res!658215) (not e!554563))))

(declare-datatypes ((V!35563 0))(
  ( (V!35564 (val!11518 Int)) )
))
(declare-datatypes ((ValueCell!10986 0))(
  ( (ValueCellFull!10986 (v!14080 V!35563)) (EmptyCell!10986) )
))
(declare-datatypes ((array!61855 0))(
  ( (array!61856 (arr!29785 (Array (_ BitVec 32) ValueCell!10986)) (size!30264 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61855)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!983684 (= res!658215 (and (= (size!30264 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30263 _keys!1544) (size!30264 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!983685 () Bool)

(declare-fun e!554565 () Bool)

(assert (=> b!983685 (= e!554565 (and e!554562 mapRes!36431))))

(declare-fun condMapEmpty!36431 () Bool)

(declare-fun mapDefault!36431 () ValueCell!10986)

(assert (=> b!983685 (= condMapEmpty!36431 (= (arr!29785 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10986)) mapDefault!36431)))))

(declare-fun mapNonEmpty!36431 () Bool)

(declare-fun tp!69115 () Bool)

(assert (=> mapNonEmpty!36431 (= mapRes!36431 (and tp!69115 e!554561))))

(declare-fun mapValue!36431 () ValueCell!10986)

(declare-fun mapKey!36431 () (_ BitVec 32))

(declare-fun mapRest!36431 () (Array (_ BitVec 32) ValueCell!10986))

(assert (=> mapNonEmpty!36431 (= (arr!29785 _values!1278) (store mapRest!36431 mapKey!36431 mapValue!36431))))

(declare-fun res!658217 () Bool)

(assert (=> start!84132 (=> (not res!658217) (not e!554563))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84132 (= res!658217 (validMask!0 mask!1948))))

(assert (=> start!84132 e!554563))

(assert (=> start!84132 true))

(declare-fun array_inv!23029 (array!61855) Bool)

(assert (=> start!84132 (and (array_inv!23029 _values!1278) e!554565)))

(declare-fun array_inv!23030 (array!61853) Bool)

(assert (=> start!84132 (array_inv!23030 _keys!1544)))

(assert (= (and start!84132 res!658217) b!983684))

(assert (= (and b!983684 res!658215) b!983683))

(assert (= (and b!983683 res!658216) b!983680))

(assert (= (and b!983685 condMapEmpty!36431) mapIsEmpty!36431))

(assert (= (and b!983685 (not condMapEmpty!36431)) mapNonEmpty!36431))

(get-info :version)

(assert (= (and mapNonEmpty!36431 ((_ is ValueCellFull!10986) mapValue!36431)) b!983682))

(assert (= (and b!983685 ((_ is ValueCellFull!10986) mapDefault!36431)) b!983681))

(assert (= start!84132 b!983685))

(declare-fun m!910873 () Bool)

(assert (=> b!983680 m!910873))

(declare-fun m!910875 () Bool)

(assert (=> b!983683 m!910875))

(declare-fun m!910877 () Bool)

(assert (=> mapNonEmpty!36431 m!910877))

(declare-fun m!910879 () Bool)

(assert (=> start!84132 m!910879))

(declare-fun m!910881 () Bool)

(assert (=> start!84132 m!910881))

(declare-fun m!910883 () Bool)

(assert (=> start!84132 m!910883))

(check-sat (not mapNonEmpty!36431) (not start!84132) (not b!983680) tp_is_empty!22935 (not b!983683))
(check-sat)
