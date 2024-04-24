; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110754 () Bool)

(assert start!110754)

(declare-fun b_free!29365 () Bool)

(declare-fun b_next!29365 () Bool)

(assert (=> start!110754 (= b_free!29365 (not b_next!29365))))

(declare-fun tp!103416 () Bool)

(declare-fun b_and!47575 () Bool)

(assert (=> start!110754 (= tp!103416 b_and!47575)))

(declare-fun b!1308818 () Bool)

(declare-fun e!746944 () Bool)

(declare-fun tp_is_empty!35095 () Bool)

(assert (=> b!1308818 (= e!746944 tp_is_empty!35095)))

(declare-fun mapNonEmpty!54271 () Bool)

(declare-fun mapRes!54271 () Bool)

(declare-fun tp!103417 () Bool)

(assert (=> mapNonEmpty!54271 (= mapRes!54271 (and tp!103417 e!746944))))

(declare-datatypes ((V!51897 0))(
  ( (V!51898 (val!17622 Int)) )
))
(declare-datatypes ((ValueCell!16649 0))(
  ( (ValueCellFull!16649 (v!20244 V!51897)) (EmptyCell!16649) )
))
(declare-fun mapValue!54271 () ValueCell!16649)

(declare-fun mapKey!54271 () (_ BitVec 32))

(declare-datatypes ((array!87249 0))(
  ( (array!87250 (arr!42100 (Array (_ BitVec 32) ValueCell!16649)) (size!42651 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87249)

(declare-fun mapRest!54271 () (Array (_ BitVec 32) ValueCell!16649))

(assert (=> mapNonEmpty!54271 (= (arr!42100 _values!1354) (store mapRest!54271 mapKey!54271 mapValue!54271))))

(declare-fun b!1308819 () Bool)

(declare-fun res!868441 () Bool)

(declare-fun e!746943 () Bool)

(assert (=> b!1308819 (=> (not res!868441) (not e!746943))))

(declare-datatypes ((array!87251 0))(
  ( (array!87252 (arr!42101 (Array (_ BitVec 32) (_ BitVec 64))) (size!42652 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87251)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1308819 (= res!868441 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42652 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1308820 () Bool)

(declare-fun res!868442 () Bool)

(assert (=> b!1308820 (=> (not res!868442) (not e!746943))))

(declare-datatypes ((List!29879 0))(
  ( (Nil!29876) (Cons!29875 (h!31093 (_ BitVec 64)) (t!43477 List!29879)) )
))
(declare-fun arrayNoDuplicates!0 (array!87251 (_ BitVec 32) List!29879) Bool)

(assert (=> b!1308820 (= res!868442 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29876))))

(declare-fun b!1308821 () Bool)

(assert (=> b!1308821 (= e!746943 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585542 () Bool)

(declare-fun minValue!1296 () V!51897)

(declare-fun zeroValue!1296 () V!51897)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((tuple2!22712 0))(
  ( (tuple2!22713 (_1!11367 (_ BitVec 64)) (_2!11367 V!51897)) )
))
(declare-datatypes ((List!29880 0))(
  ( (Nil!29877) (Cons!29876 (h!31094 tuple2!22712) (t!43478 List!29880)) )
))
(declare-datatypes ((ListLongMap!20377 0))(
  ( (ListLongMap!20378 (toList!10204 List!29880)) )
))
(declare-fun contains!8366 (ListLongMap!20377 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5208 (array!87251 array!87249 (_ BitVec 32) (_ BitVec 32) V!51897 V!51897 (_ BitVec 32) Int) ListLongMap!20377)

(assert (=> b!1308821 (= lt!585542 (contains!8366 (getCurrentListMap!5208 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1308822 () Bool)

(declare-fun e!746945 () Bool)

(assert (=> b!1308822 (= e!746945 tp_is_empty!35095)))

(declare-fun mapIsEmpty!54271 () Bool)

(assert (=> mapIsEmpty!54271 mapRes!54271))

(declare-fun res!868440 () Bool)

(assert (=> start!110754 (=> (not res!868440) (not e!746943))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110754 (= res!868440 (validMask!0 mask!2040))))

(assert (=> start!110754 e!746943))

(assert (=> start!110754 tp!103416))

(declare-fun array_inv!32077 (array!87251) Bool)

(assert (=> start!110754 (array_inv!32077 _keys!1628)))

(assert (=> start!110754 true))

(assert (=> start!110754 tp_is_empty!35095))

(declare-fun e!746942 () Bool)

(declare-fun array_inv!32078 (array!87249) Bool)

(assert (=> start!110754 (and (array_inv!32078 _values!1354) e!746942)))

(declare-fun b!1308823 () Bool)

(declare-fun res!868438 () Bool)

(assert (=> b!1308823 (=> (not res!868438) (not e!746943))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87251 (_ BitVec 32)) Bool)

(assert (=> b!1308823 (= res!868438 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1308824 () Bool)

(declare-fun res!868439 () Bool)

(assert (=> b!1308824 (=> (not res!868439) (not e!746943))))

(assert (=> b!1308824 (= res!868439 (and (= (size!42651 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42652 _keys!1628) (size!42651 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1308825 () Bool)

(assert (=> b!1308825 (= e!746942 (and e!746945 mapRes!54271))))

(declare-fun condMapEmpty!54271 () Bool)

(declare-fun mapDefault!54271 () ValueCell!16649)

(assert (=> b!1308825 (= condMapEmpty!54271 (= (arr!42100 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16649)) mapDefault!54271)))))

(assert (= (and start!110754 res!868440) b!1308824))

(assert (= (and b!1308824 res!868439) b!1308823))

(assert (= (and b!1308823 res!868438) b!1308820))

(assert (= (and b!1308820 res!868442) b!1308819))

(assert (= (and b!1308819 res!868441) b!1308821))

(assert (= (and b!1308825 condMapEmpty!54271) mapIsEmpty!54271))

(assert (= (and b!1308825 (not condMapEmpty!54271)) mapNonEmpty!54271))

(get-info :version)

(assert (= (and mapNonEmpty!54271 ((_ is ValueCellFull!16649) mapValue!54271)) b!1308818))

(assert (= (and b!1308825 ((_ is ValueCellFull!16649) mapDefault!54271)) b!1308822))

(assert (= start!110754 b!1308825))

(declare-fun m!1199783 () Bool)

(assert (=> mapNonEmpty!54271 m!1199783))

(declare-fun m!1199785 () Bool)

(assert (=> b!1308820 m!1199785))

(declare-fun m!1199787 () Bool)

(assert (=> b!1308823 m!1199787))

(declare-fun m!1199789 () Bool)

(assert (=> start!110754 m!1199789))

(declare-fun m!1199791 () Bool)

(assert (=> start!110754 m!1199791))

(declare-fun m!1199793 () Bool)

(assert (=> start!110754 m!1199793))

(declare-fun m!1199795 () Bool)

(assert (=> b!1308821 m!1199795))

(assert (=> b!1308821 m!1199795))

(declare-fun m!1199797 () Bool)

(assert (=> b!1308821 m!1199797))

(check-sat (not b!1308820) tp_is_empty!35095 (not b!1308821) (not b_next!29365) (not b!1308823) (not start!110754) (not mapNonEmpty!54271) b_and!47575)
(check-sat b_and!47575 (not b_next!29365))
