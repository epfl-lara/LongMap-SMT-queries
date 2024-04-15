; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83998 () Bool)

(assert start!83998)

(declare-fun b_free!19771 () Bool)

(declare-fun b_next!19771 () Bool)

(assert (=> start!83998 (= b_free!19771 (not b_next!19771))))

(declare-fun tp!68836 () Bool)

(declare-fun b_and!31599 () Bool)

(assert (=> start!83998 (= tp!68836 b_and!31599)))

(declare-fun b!981795 () Bool)

(declare-fun res!657058 () Bool)

(declare-fun e!553440 () Bool)

(assert (=> b!981795 (=> (not res!657058) (not e!553440))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35409 0))(
  ( (V!35410 (val!11460 Int)) )
))
(declare-datatypes ((ValueCell!10928 0))(
  ( (ValueCellFull!10928 (v!14021 V!35409)) (EmptyCell!10928) )
))
(declare-datatypes ((array!61566 0))(
  ( (array!61567 (arr!29641 (Array (_ BitVec 32) ValueCell!10928)) (size!30122 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61566)

(declare-datatypes ((array!61568 0))(
  ( (array!61569 (arr!29642 (Array (_ BitVec 32) (_ BitVec 64))) (size!30123 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61568)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!981795 (= res!657058 (and (= (size!30122 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30123 _keys!1544) (size!30122 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!981796 () Bool)

(declare-fun res!657056 () Bool)

(assert (=> b!981796 (=> (not res!657056) (not e!553440))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!981796 (= res!657056 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30123 _keys!1544))))))

(declare-fun mapNonEmpty!36257 () Bool)

(declare-fun mapRes!36257 () Bool)

(declare-fun tp!68837 () Bool)

(declare-fun e!553438 () Bool)

(assert (=> mapNonEmpty!36257 (= mapRes!36257 (and tp!68837 e!553438))))

(declare-fun mapKey!36257 () (_ BitVec 32))

(declare-fun mapValue!36257 () ValueCell!10928)

(declare-fun mapRest!36257 () (Array (_ BitVec 32) ValueCell!10928))

(assert (=> mapNonEmpty!36257 (= (arr!29641 _values!1278) (store mapRest!36257 mapKey!36257 mapValue!36257))))

(declare-fun b!981798 () Bool)

(declare-fun e!553442 () Bool)

(assert (=> b!981798 (= e!553440 e!553442)))

(declare-fun res!657057 () Bool)

(assert (=> b!981798 (=> (not res!657057) (not e!553442))))

(assert (=> b!981798 (= res!657057 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29642 _keys!1544) from!1932))))))

(declare-fun lt!435727 () V!35409)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15381 (ValueCell!10928 V!35409) V!35409)

(declare-fun dynLambda!1775 (Int (_ BitVec 64)) V!35409)

(assert (=> b!981798 (= lt!435727 (get!15381 (select (arr!29641 _values!1278) from!1932) (dynLambda!1775 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35409)

(declare-fun zeroValue!1220 () V!35409)

(declare-datatypes ((tuple2!14748 0))(
  ( (tuple2!14749 (_1!7385 (_ BitVec 64)) (_2!7385 V!35409)) )
))
(declare-datatypes ((List!20590 0))(
  ( (Nil!20587) (Cons!20586 (h!21748 tuple2!14748) (t!29302 List!20590)) )
))
(declare-datatypes ((ListLongMap!13435 0))(
  ( (ListLongMap!13436 (toList!6733 List!20590)) )
))
(declare-fun lt!435725 () ListLongMap!13435)

(declare-fun getCurrentListMapNoExtraKeys!3445 (array!61568 array!61566 (_ BitVec 32) (_ BitVec 32) V!35409 V!35409 (_ BitVec 32) Int) ListLongMap!13435)

(assert (=> b!981798 (= lt!435725 (getCurrentListMapNoExtraKeys!3445 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!981799 () Bool)

(declare-fun res!657054 () Bool)

(assert (=> b!981799 (=> (not res!657054) (not e!553440))))

(declare-datatypes ((List!20591 0))(
  ( (Nil!20588) (Cons!20587 (h!21749 (_ BitVec 64)) (t!29303 List!20591)) )
))
(declare-fun arrayNoDuplicates!0 (array!61568 (_ BitVec 32) List!20591) Bool)

(assert (=> b!981799 (= res!657054 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20588))))

(declare-fun b!981800 () Bool)

(declare-fun res!657053 () Bool)

(assert (=> b!981800 (=> (not res!657053) (not e!553440))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!981800 (= res!657053 (validKeyInArray!0 (select (arr!29642 _keys!1544) from!1932)))))

(declare-fun b!981801 () Bool)

(declare-fun res!657060 () Bool)

(assert (=> b!981801 (=> (not res!657060) (not e!553440))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61568 (_ BitVec 32)) Bool)

(assert (=> b!981801 (= res!657060 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!36257 () Bool)

(assert (=> mapIsEmpty!36257 mapRes!36257))

(declare-fun b!981802 () Bool)

(declare-fun res!657059 () Bool)

(assert (=> b!981802 (=> (not res!657059) (not e!553440))))

(assert (=> b!981802 (= res!657059 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!981797 () Bool)

(declare-fun e!553441 () Bool)

(declare-fun tp_is_empty!22819 () Bool)

(assert (=> b!981797 (= e!553441 tp_is_empty!22819)))

(declare-fun res!657055 () Bool)

(assert (=> start!83998 (=> (not res!657055) (not e!553440))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83998 (= res!657055 (validMask!0 mask!1948))))

(assert (=> start!83998 e!553440))

(assert (=> start!83998 true))

(assert (=> start!83998 tp_is_empty!22819))

(declare-fun e!553437 () Bool)

(declare-fun array_inv!22937 (array!61566) Bool)

(assert (=> start!83998 (and (array_inv!22937 _values!1278) e!553437)))

(assert (=> start!83998 tp!68836))

(declare-fun array_inv!22938 (array!61568) Bool)

(assert (=> start!83998 (array_inv!22938 _keys!1544)))

(declare-fun b!981803 () Bool)

(assert (=> b!981803 (= e!553438 tp_is_empty!22819)))

(declare-fun b!981804 () Bool)

(assert (=> b!981804 (= e!553437 (and e!553441 mapRes!36257))))

(declare-fun condMapEmpty!36257 () Bool)

(declare-fun mapDefault!36257 () ValueCell!10928)

(assert (=> b!981804 (= condMapEmpty!36257 (= (arr!29641 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10928)) mapDefault!36257)))))

(declare-fun b!981805 () Bool)

(assert (=> b!981805 (= e!553442 (not true))))

(declare-fun lt!435726 () tuple2!14748)

(declare-fun lt!435729 () tuple2!14748)

(declare-fun +!3029 (ListLongMap!13435 tuple2!14748) ListLongMap!13435)

(assert (=> b!981805 (= (+!3029 (+!3029 lt!435725 lt!435726) lt!435729) (+!3029 (+!3029 lt!435725 lt!435729) lt!435726))))

(assert (=> b!981805 (= lt!435729 (tuple2!14749 (select (arr!29642 _keys!1544) from!1932) lt!435727))))

(assert (=> b!981805 (= lt!435726 (tuple2!14749 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32524 0))(
  ( (Unit!32525) )
))
(declare-fun lt!435728 () Unit!32524)

(declare-fun addCommutativeForDiffKeys!633 (ListLongMap!13435 (_ BitVec 64) V!35409 (_ BitVec 64) V!35409) Unit!32524)

(assert (=> b!981805 (= lt!435728 (addCommutativeForDiffKeys!633 lt!435725 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29642 _keys!1544) from!1932) lt!435727))))

(assert (= (and start!83998 res!657055) b!981795))

(assert (= (and b!981795 res!657058) b!981801))

(assert (= (and b!981801 res!657060) b!981799))

(assert (= (and b!981799 res!657054) b!981796))

(assert (= (and b!981796 res!657056) b!981800))

(assert (= (and b!981800 res!657053) b!981802))

(assert (= (and b!981802 res!657059) b!981798))

(assert (= (and b!981798 res!657057) b!981805))

(assert (= (and b!981804 condMapEmpty!36257) mapIsEmpty!36257))

(assert (= (and b!981804 (not condMapEmpty!36257)) mapNonEmpty!36257))

(get-info :version)

(assert (= (and mapNonEmpty!36257 ((_ is ValueCellFull!10928) mapValue!36257)) b!981803))

(assert (= (and b!981804 ((_ is ValueCellFull!10928) mapDefault!36257)) b!981797))

(assert (= start!83998 b!981804))

(declare-fun b_lambda!14791 () Bool)

(assert (=> (not b_lambda!14791) (not b!981798)))

(declare-fun t!29301 () Bool)

(declare-fun tb!6563 () Bool)

(assert (=> (and start!83998 (= defaultEntry!1281 defaultEntry!1281) t!29301) tb!6563))

(declare-fun result!13123 () Bool)

(assert (=> tb!6563 (= result!13123 tp_is_empty!22819)))

(assert (=> b!981798 t!29301))

(declare-fun b_and!31601 () Bool)

(assert (= b_and!31599 (and (=> t!29301 result!13123) b_and!31601)))

(declare-fun m!908627 () Bool)

(assert (=> b!981798 m!908627))

(declare-fun m!908629 () Bool)

(assert (=> b!981798 m!908629))

(declare-fun m!908631 () Bool)

(assert (=> b!981798 m!908631))

(declare-fun m!908633 () Bool)

(assert (=> b!981798 m!908633))

(assert (=> b!981798 m!908629))

(assert (=> b!981798 m!908633))

(declare-fun m!908635 () Bool)

(assert (=> b!981798 m!908635))

(declare-fun m!908637 () Bool)

(assert (=> mapNonEmpty!36257 m!908637))

(assert (=> b!981800 m!908627))

(assert (=> b!981800 m!908627))

(declare-fun m!908639 () Bool)

(assert (=> b!981800 m!908639))

(declare-fun m!908641 () Bool)

(assert (=> b!981799 m!908641))

(declare-fun m!908643 () Bool)

(assert (=> b!981801 m!908643))

(assert (=> b!981805 m!908627))

(assert (=> b!981805 m!908627))

(declare-fun m!908645 () Bool)

(assert (=> b!981805 m!908645))

(declare-fun m!908647 () Bool)

(assert (=> b!981805 m!908647))

(declare-fun m!908649 () Bool)

(assert (=> b!981805 m!908649))

(declare-fun m!908651 () Bool)

(assert (=> b!981805 m!908651))

(assert (=> b!981805 m!908647))

(declare-fun m!908653 () Bool)

(assert (=> b!981805 m!908653))

(assert (=> b!981805 m!908649))

(declare-fun m!908655 () Bool)

(assert (=> start!83998 m!908655))

(declare-fun m!908657 () Bool)

(assert (=> start!83998 m!908657))

(declare-fun m!908659 () Bool)

(assert (=> start!83998 m!908659))

(check-sat (not mapNonEmpty!36257) (not b_next!19771) tp_is_empty!22819 (not b!981805) (not b!981799) (not b!981798) b_and!31601 (not b_lambda!14791) (not b!981801) (not b!981800) (not start!83998))
(check-sat b_and!31601 (not b_next!19771))
