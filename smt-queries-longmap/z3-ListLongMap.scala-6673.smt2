; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83992 () Bool)

(assert start!83992)

(declare-fun b_free!19765 () Bool)

(declare-fun b_next!19765 () Bool)

(assert (=> start!83992 (= b_free!19765 (not b_next!19765))))

(declare-fun tp!68819 () Bool)

(declare-fun b_and!31587 () Bool)

(assert (=> start!83992 (= tp!68819 b_and!31587)))

(declare-fun b!981690 () Bool)

(declare-fun res!656987 () Bool)

(declare-fun e!553388 () Bool)

(assert (=> b!981690 (=> (not res!656987) (not e!553388))))

(declare-datatypes ((array!61554 0))(
  ( (array!61555 (arr!29635 (Array (_ BitVec 32) (_ BitVec 64))) (size!30116 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61554)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!981690 (= res!656987 (validKeyInArray!0 (select (arr!29635 _keys!1544) from!1932)))))

(declare-fun b!981691 () Bool)

(declare-fun e!553384 () Bool)

(declare-fun tp_is_empty!22813 () Bool)

(assert (=> b!981691 (= e!553384 tp_is_empty!22813)))

(declare-fun b!981692 () Bool)

(declare-fun e!553386 () Bool)

(assert (=> b!981692 (= e!553386 (not true))))

(declare-datatypes ((V!35401 0))(
  ( (V!35402 (val!11457 Int)) )
))
(declare-datatypes ((tuple2!14744 0))(
  ( (tuple2!14745 (_1!7383 (_ BitVec 64)) (_2!7383 V!35401)) )
))
(declare-datatypes ((List!20585 0))(
  ( (Nil!20582) (Cons!20581 (h!21743 tuple2!14744) (t!29291 List!20585)) )
))
(declare-datatypes ((ListLongMap!13431 0))(
  ( (ListLongMap!13432 (toList!6731 List!20585)) )
))
(declare-fun lt!435683 () ListLongMap!13431)

(declare-fun lt!435682 () tuple2!14744)

(declare-fun lt!435681 () tuple2!14744)

(declare-fun +!3027 (ListLongMap!13431 tuple2!14744) ListLongMap!13431)

(assert (=> b!981692 (= (+!3027 (+!3027 lt!435683 lt!435682) lt!435681) (+!3027 (+!3027 lt!435683 lt!435681) lt!435682))))

(declare-fun lt!435684 () V!35401)

(assert (=> b!981692 (= lt!435681 (tuple2!14745 (select (arr!29635 _keys!1544) from!1932) lt!435684))))

(declare-fun zeroValue!1220 () V!35401)

(assert (=> b!981692 (= lt!435682 (tuple2!14745 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32520 0))(
  ( (Unit!32521) )
))
(declare-fun lt!435680 () Unit!32520)

(declare-fun addCommutativeForDiffKeys!631 (ListLongMap!13431 (_ BitVec 64) V!35401 (_ BitVec 64) V!35401) Unit!32520)

(assert (=> b!981692 (= lt!435680 (addCommutativeForDiffKeys!631 lt!435683 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29635 _keys!1544) from!1932) lt!435684))))

(declare-fun b!981693 () Bool)

(declare-fun e!553385 () Bool)

(declare-fun e!553387 () Bool)

(declare-fun mapRes!36248 () Bool)

(assert (=> b!981693 (= e!553385 (and e!553387 mapRes!36248))))

(declare-fun condMapEmpty!36248 () Bool)

(declare-datatypes ((ValueCell!10925 0))(
  ( (ValueCellFull!10925 (v!14018 V!35401)) (EmptyCell!10925) )
))
(declare-datatypes ((array!61556 0))(
  ( (array!61557 (arr!29636 (Array (_ BitVec 32) ValueCell!10925)) (size!30117 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61556)

(declare-fun mapDefault!36248 () ValueCell!10925)

(assert (=> b!981693 (= condMapEmpty!36248 (= (arr!29636 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10925)) mapDefault!36248)))))

(declare-fun b!981694 () Bool)

(assert (=> b!981694 (= e!553388 e!553386)))

(declare-fun res!656988 () Bool)

(assert (=> b!981694 (=> (not res!656988) (not e!553386))))

(assert (=> b!981694 (= res!656988 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29635 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15377 (ValueCell!10925 V!35401) V!35401)

(declare-fun dynLambda!1773 (Int (_ BitVec 64)) V!35401)

(assert (=> b!981694 (= lt!435684 (get!15377 (select (arr!29636 _values!1278) from!1932) (dynLambda!1773 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35401)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3443 (array!61554 array!61556 (_ BitVec 32) (_ BitVec 32) V!35401 V!35401 (_ BitVec 32) Int) ListLongMap!13431)

(assert (=> b!981694 (= lt!435683 (getCurrentListMapNoExtraKeys!3443 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!981695 () Bool)

(declare-fun res!656981 () Bool)

(assert (=> b!981695 (=> (not res!656981) (not e!553388))))

(declare-datatypes ((List!20586 0))(
  ( (Nil!20583) (Cons!20582 (h!21744 (_ BitVec 64)) (t!29292 List!20586)) )
))
(declare-fun arrayNoDuplicates!0 (array!61554 (_ BitVec 32) List!20586) Bool)

(assert (=> b!981695 (= res!656981 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20583))))

(declare-fun b!981696 () Bool)

(declare-fun res!656986 () Bool)

(assert (=> b!981696 (=> (not res!656986) (not e!553388))))

(assert (=> b!981696 (= res!656986 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30116 _keys!1544))))))

(declare-fun b!981697 () Bool)

(declare-fun res!656983 () Bool)

(assert (=> b!981697 (=> (not res!656983) (not e!553388))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61554 (_ BitVec 32)) Bool)

(assert (=> b!981697 (= res!656983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!36248 () Bool)

(assert (=> mapIsEmpty!36248 mapRes!36248))

(declare-fun b!981699 () Bool)

(assert (=> b!981699 (= e!553387 tp_is_empty!22813)))

(declare-fun b!981698 () Bool)

(declare-fun res!656982 () Bool)

(assert (=> b!981698 (=> (not res!656982) (not e!553388))))

(assert (=> b!981698 (= res!656982 (and (= (size!30117 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30116 _keys!1544) (size!30117 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun res!656984 () Bool)

(assert (=> start!83992 (=> (not res!656984) (not e!553388))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83992 (= res!656984 (validMask!0 mask!1948))))

(assert (=> start!83992 e!553388))

(assert (=> start!83992 true))

(assert (=> start!83992 tp_is_empty!22813))

(declare-fun array_inv!22935 (array!61556) Bool)

(assert (=> start!83992 (and (array_inv!22935 _values!1278) e!553385)))

(assert (=> start!83992 tp!68819))

(declare-fun array_inv!22936 (array!61554) Bool)

(assert (=> start!83992 (array_inv!22936 _keys!1544)))

(declare-fun b!981700 () Bool)

(declare-fun res!656985 () Bool)

(assert (=> b!981700 (=> (not res!656985) (not e!553388))))

(assert (=> b!981700 (= res!656985 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!36248 () Bool)

(declare-fun tp!68818 () Bool)

(assert (=> mapNonEmpty!36248 (= mapRes!36248 (and tp!68818 e!553384))))

(declare-fun mapKey!36248 () (_ BitVec 32))

(declare-fun mapValue!36248 () ValueCell!10925)

(declare-fun mapRest!36248 () (Array (_ BitVec 32) ValueCell!10925))

(assert (=> mapNonEmpty!36248 (= (arr!29636 _values!1278) (store mapRest!36248 mapKey!36248 mapValue!36248))))

(assert (= (and start!83992 res!656984) b!981698))

(assert (= (and b!981698 res!656982) b!981697))

(assert (= (and b!981697 res!656983) b!981695))

(assert (= (and b!981695 res!656981) b!981696))

(assert (= (and b!981696 res!656986) b!981690))

(assert (= (and b!981690 res!656987) b!981700))

(assert (= (and b!981700 res!656985) b!981694))

(assert (= (and b!981694 res!656988) b!981692))

(assert (= (and b!981693 condMapEmpty!36248) mapIsEmpty!36248))

(assert (= (and b!981693 (not condMapEmpty!36248)) mapNonEmpty!36248))

(get-info :version)

(assert (= (and mapNonEmpty!36248 ((_ is ValueCellFull!10925) mapValue!36248)) b!981691))

(assert (= (and b!981693 ((_ is ValueCellFull!10925) mapDefault!36248)) b!981699))

(assert (= start!83992 b!981693))

(declare-fun b_lambda!14785 () Bool)

(assert (=> (not b_lambda!14785) (not b!981694)))

(declare-fun t!29290 () Bool)

(declare-fun tb!6557 () Bool)

(assert (=> (and start!83992 (= defaultEntry!1281 defaultEntry!1281) t!29290) tb!6557))

(declare-fun result!13111 () Bool)

(assert (=> tb!6557 (= result!13111 tp_is_empty!22813)))

(assert (=> b!981694 t!29290))

(declare-fun b_and!31589 () Bool)

(assert (= b_and!31587 (and (=> t!29290 result!13111) b_and!31589)))

(declare-fun m!908525 () Bool)

(assert (=> b!981697 m!908525))

(declare-fun m!908527 () Bool)

(assert (=> b!981690 m!908527))

(assert (=> b!981690 m!908527))

(declare-fun m!908529 () Bool)

(assert (=> b!981690 m!908529))

(declare-fun m!908531 () Bool)

(assert (=> mapNonEmpty!36248 m!908531))

(assert (=> b!981692 m!908527))

(declare-fun m!908533 () Bool)

(assert (=> b!981692 m!908533))

(assert (=> b!981692 m!908533))

(declare-fun m!908535 () Bool)

(assert (=> b!981692 m!908535))

(declare-fun m!908537 () Bool)

(assert (=> b!981692 m!908537))

(declare-fun m!908539 () Bool)

(assert (=> b!981692 m!908539))

(assert (=> b!981692 m!908527))

(declare-fun m!908541 () Bool)

(assert (=> b!981692 m!908541))

(assert (=> b!981692 m!908537))

(assert (=> b!981694 m!908527))

(declare-fun m!908543 () Bool)

(assert (=> b!981694 m!908543))

(declare-fun m!908545 () Bool)

(assert (=> b!981694 m!908545))

(declare-fun m!908547 () Bool)

(assert (=> b!981694 m!908547))

(assert (=> b!981694 m!908543))

(assert (=> b!981694 m!908547))

(declare-fun m!908549 () Bool)

(assert (=> b!981694 m!908549))

(declare-fun m!908551 () Bool)

(assert (=> start!83992 m!908551))

(declare-fun m!908553 () Bool)

(assert (=> start!83992 m!908553))

(declare-fun m!908555 () Bool)

(assert (=> start!83992 m!908555))

(declare-fun m!908557 () Bool)

(assert (=> b!981695 m!908557))

(check-sat (not b!981697) (not b!981695) (not mapNonEmpty!36248) b_and!31589 (not b!981692) (not start!83992) (not b_next!19765) (not b_lambda!14785) tp_is_empty!22813 (not b!981690) (not b!981694))
(check-sat b_and!31589 (not b_next!19765))
