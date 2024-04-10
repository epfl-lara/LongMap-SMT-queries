; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84054 () Bool)

(assert start!84054)

(declare-fun b_free!19809 () Bool)

(declare-fun b_next!19809 () Bool)

(assert (=> start!84054 (= b_free!19809 (not b_next!19809))))

(declare-fun tp!68949 () Bool)

(declare-fun b_and!31701 () Bool)

(assert (=> start!84054 (= tp!68949 b_and!31701)))

(declare-fun b!982699 () Bool)

(declare-fun res!657626 () Bool)

(declare-fun e!553927 () Bool)

(assert (=> b!982699 (=> (not res!657626) (not e!553927))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!982699 (= res!657626 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!982700 () Bool)

(declare-fun e!553931 () Bool)

(declare-fun tp_is_empty!22857 () Bool)

(assert (=> b!982700 (= e!553931 tp_is_empty!22857)))

(declare-fun b!982701 () Bool)

(declare-fun res!657621 () Bool)

(assert (=> b!982701 (=> (not res!657621) (not e!553927))))

(declare-datatypes ((array!61703 0))(
  ( (array!61704 (arr!29709 (Array (_ BitVec 32) (_ BitVec 64))) (size!30188 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61703)

(declare-datatypes ((List!20585 0))(
  ( (Nil!20582) (Cons!20581 (h!21743 (_ BitVec 64)) (t!29344 List!20585)) )
))
(declare-fun arrayNoDuplicates!0 (array!61703 (_ BitVec 32) List!20585) Bool)

(assert (=> b!982701 (= res!657621 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20582))))

(declare-fun mapIsEmpty!36314 () Bool)

(declare-fun mapRes!36314 () Bool)

(assert (=> mapIsEmpty!36314 mapRes!36314))

(declare-fun res!657619 () Bool)

(assert (=> start!84054 (=> (not res!657619) (not e!553927))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84054 (= res!657619 (validMask!0 mask!1948))))

(assert (=> start!84054 e!553927))

(assert (=> start!84054 true))

(assert (=> start!84054 tp_is_empty!22857))

(declare-datatypes ((V!35459 0))(
  ( (V!35460 (val!11479 Int)) )
))
(declare-datatypes ((ValueCell!10947 0))(
  ( (ValueCellFull!10947 (v!14041 V!35459)) (EmptyCell!10947) )
))
(declare-datatypes ((array!61705 0))(
  ( (array!61706 (arr!29710 (Array (_ BitVec 32) ValueCell!10947)) (size!30189 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61705)

(declare-fun e!553928 () Bool)

(declare-fun array_inv!22975 (array!61705) Bool)

(assert (=> start!84054 (and (array_inv!22975 _values!1278) e!553928)))

(assert (=> start!84054 tp!68949))

(declare-fun array_inv!22976 (array!61703) Bool)

(assert (=> start!84054 (array_inv!22976 _keys!1544)))

(declare-fun b!982702 () Bool)

(declare-fun e!553930 () Bool)

(assert (=> b!982702 (= e!553930 (not true))))

(declare-datatypes ((tuple2!14706 0))(
  ( (tuple2!14707 (_1!7364 (_ BitVec 64)) (_2!7364 V!35459)) )
))
(declare-datatypes ((List!20586 0))(
  ( (Nil!20583) (Cons!20582 (h!21744 tuple2!14706) (t!29345 List!20586)) )
))
(declare-datatypes ((ListLongMap!13403 0))(
  ( (ListLongMap!13404 (toList!6717 List!20586)) )
))
(declare-fun lt!436247 () ListLongMap!13403)

(declare-fun lt!436250 () tuple2!14706)

(declare-fun lt!436249 () tuple2!14706)

(declare-fun +!3014 (ListLongMap!13403 tuple2!14706) ListLongMap!13403)

(assert (=> b!982702 (= (+!3014 (+!3014 lt!436247 lt!436250) lt!436249) (+!3014 (+!3014 lt!436247 lt!436249) lt!436250))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun lt!436246 () V!35459)

(assert (=> b!982702 (= lt!436249 (tuple2!14707 (select (arr!29709 _keys!1544) from!1932) lt!436246))))

(declare-fun zeroValue!1220 () V!35459)

(assert (=> b!982702 (= lt!436250 (tuple2!14707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32667 0))(
  ( (Unit!32668) )
))
(declare-fun lt!436248 () Unit!32667)

(declare-fun addCommutativeForDiffKeys!642 (ListLongMap!13403 (_ BitVec 64) V!35459 (_ BitVec 64) V!35459) Unit!32667)

(assert (=> b!982702 (= lt!436248 (addCommutativeForDiffKeys!642 lt!436247 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29709 _keys!1544) from!1932) lt!436246))))

(declare-fun b!982703 () Bool)

(declare-fun res!657625 () Bool)

(assert (=> b!982703 (=> (not res!657625) (not e!553927))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!982703 (= res!657625 (validKeyInArray!0 (select (arr!29709 _keys!1544) from!1932)))))

(declare-fun b!982704 () Bool)

(declare-fun res!657622 () Bool)

(assert (=> b!982704 (=> (not res!657622) (not e!553927))))

(assert (=> b!982704 (= res!657622 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30188 _keys!1544))))))

(declare-fun b!982705 () Bool)

(declare-fun e!553932 () Bool)

(assert (=> b!982705 (= e!553932 tp_is_empty!22857)))

(declare-fun b!982706 () Bool)

(declare-fun res!657620 () Bool)

(assert (=> b!982706 (=> (not res!657620) (not e!553927))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61703 (_ BitVec 32)) Bool)

(assert (=> b!982706 (= res!657620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!36314 () Bool)

(declare-fun tp!68950 () Bool)

(assert (=> mapNonEmpty!36314 (= mapRes!36314 (and tp!68950 e!553931))))

(declare-fun mapRest!36314 () (Array (_ BitVec 32) ValueCell!10947))

(declare-fun mapValue!36314 () ValueCell!10947)

(declare-fun mapKey!36314 () (_ BitVec 32))

(assert (=> mapNonEmpty!36314 (= (arr!29710 _values!1278) (store mapRest!36314 mapKey!36314 mapValue!36314))))

(declare-fun b!982707 () Bool)

(declare-fun res!657623 () Bool)

(assert (=> b!982707 (=> (not res!657623) (not e!553927))))

(assert (=> b!982707 (= res!657623 (and (= (size!30189 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30188 _keys!1544) (size!30189 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!982708 () Bool)

(assert (=> b!982708 (= e!553927 e!553930)))

(declare-fun res!657624 () Bool)

(assert (=> b!982708 (=> (not res!657624) (not e!553930))))

(assert (=> b!982708 (= res!657624 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29709 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15412 (ValueCell!10947 V!35459) V!35459)

(declare-fun dynLambda!1799 (Int (_ BitVec 64)) V!35459)

(assert (=> b!982708 (= lt!436246 (get!15412 (select (arr!29710 _values!1278) from!1932) (dynLambda!1799 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35459)

(declare-fun getCurrentListMapNoExtraKeys!3416 (array!61703 array!61705 (_ BitVec 32) (_ BitVec 32) V!35459 V!35459 (_ BitVec 32) Int) ListLongMap!13403)

(assert (=> b!982708 (= lt!436247 (getCurrentListMapNoExtraKeys!3416 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!982709 () Bool)

(assert (=> b!982709 (= e!553928 (and e!553932 mapRes!36314))))

(declare-fun condMapEmpty!36314 () Bool)

(declare-fun mapDefault!36314 () ValueCell!10947)

(assert (=> b!982709 (= condMapEmpty!36314 (= (arr!29710 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10947)) mapDefault!36314)))))

(assert (= (and start!84054 res!657619) b!982707))

(assert (= (and b!982707 res!657623) b!982706))

(assert (= (and b!982706 res!657620) b!982701))

(assert (= (and b!982701 res!657621) b!982704))

(assert (= (and b!982704 res!657622) b!982703))

(assert (= (and b!982703 res!657625) b!982699))

(assert (= (and b!982699 res!657626) b!982708))

(assert (= (and b!982708 res!657624) b!982702))

(assert (= (and b!982709 condMapEmpty!36314) mapIsEmpty!36314))

(assert (= (and b!982709 (not condMapEmpty!36314)) mapNonEmpty!36314))

(get-info :version)

(assert (= (and mapNonEmpty!36314 ((_ is ValueCellFull!10947) mapValue!36314)) b!982700))

(assert (= (and b!982709 ((_ is ValueCellFull!10947) mapDefault!36314)) b!982705))

(assert (= start!84054 b!982709))

(declare-fun b_lambda!14847 () Bool)

(assert (=> (not b_lambda!14847) (not b!982708)))

(declare-fun t!29343 () Bool)

(declare-fun tb!6609 () Bool)

(assert (=> (and start!84054 (= defaultEntry!1281 defaultEntry!1281) t!29343) tb!6609))

(declare-fun result!13207 () Bool)

(assert (=> tb!6609 (= result!13207 tp_is_empty!22857)))

(assert (=> b!982708 t!29343))

(declare-fun b_and!31703 () Bool)

(assert (= b_and!31701 (and (=> t!29343 result!13207) b_and!31703)))

(declare-fun m!910031 () Bool)

(assert (=> start!84054 m!910031))

(declare-fun m!910033 () Bool)

(assert (=> start!84054 m!910033))

(declare-fun m!910035 () Bool)

(assert (=> start!84054 m!910035))

(declare-fun m!910037 () Bool)

(assert (=> b!982701 m!910037))

(declare-fun m!910039 () Bool)

(assert (=> b!982703 m!910039))

(assert (=> b!982703 m!910039))

(declare-fun m!910041 () Bool)

(assert (=> b!982703 m!910041))

(declare-fun m!910043 () Bool)

(assert (=> b!982702 m!910043))

(declare-fun m!910045 () Bool)

(assert (=> b!982702 m!910045))

(assert (=> b!982702 m!910039))

(assert (=> b!982702 m!910043))

(assert (=> b!982702 m!910039))

(declare-fun m!910047 () Bool)

(assert (=> b!982702 m!910047))

(declare-fun m!910049 () Bool)

(assert (=> b!982702 m!910049))

(declare-fun m!910051 () Bool)

(assert (=> b!982702 m!910051))

(assert (=> b!982702 m!910049))

(declare-fun m!910053 () Bool)

(assert (=> b!982706 m!910053))

(assert (=> b!982708 m!910039))

(declare-fun m!910055 () Bool)

(assert (=> b!982708 m!910055))

(declare-fun m!910057 () Bool)

(assert (=> b!982708 m!910057))

(declare-fun m!910059 () Bool)

(assert (=> b!982708 m!910059))

(assert (=> b!982708 m!910055))

(assert (=> b!982708 m!910059))

(declare-fun m!910061 () Bool)

(assert (=> b!982708 m!910061))

(declare-fun m!910063 () Bool)

(assert (=> mapNonEmpty!36314 m!910063))

(check-sat (not b!982702) tp_is_empty!22857 b_and!31703 (not b!982708) (not b!982706) (not b!982701) (not b!982703) (not start!84054) (not b_next!19809) (not mapNonEmpty!36314) (not b_lambda!14847))
(check-sat b_and!31703 (not b_next!19809))
