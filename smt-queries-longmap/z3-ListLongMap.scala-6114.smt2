; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78960 () Bool)

(assert start!78960)

(declare-fun b_free!17005 () Bool)

(declare-fun b_next!17005 () Bool)

(assert (=> start!78960 (= b_free!17005 (not b_next!17005))))

(declare-fun tp!59457 () Bool)

(declare-fun b_and!27757 () Bool)

(assert (=> start!78960 (= tp!59457 b_and!27757)))

(declare-fun b!920585 () Bool)

(declare-fun res!620489 () Bool)

(declare-fun e!516799 () Bool)

(assert (=> b!920585 (=> (not res!620489) (not e!516799))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((V!30983 0))(
  ( (V!30984 (val!9807 Int)) )
))
(declare-fun v!791 () V!30983)

(declare-datatypes ((tuple2!12726 0))(
  ( (tuple2!12727 (_1!6374 (_ BitVec 64)) (_2!6374 V!30983)) )
))
(declare-datatypes ((List!18543 0))(
  ( (Nil!18540) (Cons!18539 (h!19691 tuple2!12726) (t!26270 List!18543)) )
))
(declare-datatypes ((ListLongMap!11425 0))(
  ( (ListLongMap!11426 (toList!5728 List!18543)) )
))
(declare-fun lt!413192 () ListLongMap!11425)

(declare-fun apply!598 (ListLongMap!11425 (_ BitVec 64)) V!30983)

(assert (=> b!920585 (= res!620489 (= (apply!598 lt!413192 k0!1099) v!791))))

(declare-fun b!920587 () Bool)

(declare-fun res!620487 () Bool)

(assert (=> b!920587 (=> (not res!620487) (not e!516799))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!920587 (= res!620487 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!920588 () Bool)

(declare-fun e!516796 () Bool)

(declare-fun tp_is_empty!19513 () Bool)

(assert (=> b!920588 (= e!516796 tp_is_empty!19513)))

(declare-fun b!920589 () Bool)

(declare-fun e!516795 () Bool)

(declare-fun e!516794 () Bool)

(declare-fun mapRes!31026 () Bool)

(assert (=> b!920589 (= e!516795 (and e!516794 mapRes!31026))))

(declare-fun condMapEmpty!31026 () Bool)

(declare-datatypes ((ValueCell!9275 0))(
  ( (ValueCellFull!9275 (v!12322 V!30983)) (EmptyCell!9275) )
))
(declare-datatypes ((array!55055 0))(
  ( (array!55056 (arr!26468 (Array (_ BitVec 32) ValueCell!9275)) (size!26928 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55055)

(declare-fun mapDefault!31026 () ValueCell!9275)

(assert (=> b!920589 (= condMapEmpty!31026 (= (arr!26468 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9275)) mapDefault!31026)))))

(declare-fun b!920590 () Bool)

(assert (=> b!920590 (= e!516794 tp_is_empty!19513)))

(declare-fun b!920591 () Bool)

(declare-fun e!516793 () Bool)

(assert (=> b!920591 (= e!516793 (not true))))

(declare-datatypes ((array!55057 0))(
  ( (array!55058 (arr!26469 (Array (_ BitVec 32) (_ BitVec 64))) (size!26929 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55057)

(declare-datatypes ((List!18544 0))(
  ( (Nil!18541) (Cons!18540 (h!19692 (_ BitVec 64)) (t!26271 List!18544)) )
))
(declare-fun arrayNoDuplicates!0 (array!55057 (_ BitVec 32) List!18544) Bool)

(assert (=> b!920591 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18541)))

(declare-datatypes ((Unit!31042 0))(
  ( (Unit!31043) )
))
(declare-fun lt!413189 () Unit!31042)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55057 (_ BitVec 32) (_ BitVec 32)) Unit!31042)

(assert (=> b!920591 (= lt!413189 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!413191 () tuple2!12726)

(declare-fun contains!4781 (ListLongMap!11425 (_ BitVec 64)) Bool)

(declare-fun +!2665 (ListLongMap!11425 tuple2!12726) ListLongMap!11425)

(assert (=> b!920591 (contains!4781 (+!2665 lt!413192 lt!413191) k0!1099)))

(declare-fun lt!413195 () V!30983)

(declare-fun lt!413194 () (_ BitVec 64))

(declare-fun lt!413190 () Unit!31042)

(declare-fun addStillContains!374 (ListLongMap!11425 (_ BitVec 64) V!30983 (_ BitVec 64)) Unit!31042)

(assert (=> b!920591 (= lt!413190 (addStillContains!374 lt!413192 lt!413194 lt!413195 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30983)

(declare-fun minValue!1173 () V!30983)

(declare-fun getCurrentListMap!2981 (array!55057 array!55055 (_ BitVec 32) (_ BitVec 32) V!30983 V!30983 (_ BitVec 32) Int) ListLongMap!11425)

(assert (=> b!920591 (= (getCurrentListMap!2981 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2665 (getCurrentListMap!2981 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413191))))

(assert (=> b!920591 (= lt!413191 (tuple2!12727 lt!413194 lt!413195))))

(declare-fun get!13902 (ValueCell!9275 V!30983) V!30983)

(declare-fun dynLambda!1462 (Int (_ BitVec 64)) V!30983)

(assert (=> b!920591 (= lt!413195 (get!13902 (select (arr!26468 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1462 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413193 () Unit!31042)

(declare-fun lemmaListMapRecursiveValidKeyArray!45 (array!55057 array!55055 (_ BitVec 32) (_ BitVec 32) V!30983 V!30983 (_ BitVec 32) Int) Unit!31042)

(assert (=> b!920591 (= lt!413193 (lemmaListMapRecursiveValidKeyArray!45 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapNonEmpty!31026 () Bool)

(declare-fun tp!59456 () Bool)

(assert (=> mapNonEmpty!31026 (= mapRes!31026 (and tp!59456 e!516796))))

(declare-fun mapValue!31026 () ValueCell!9275)

(declare-fun mapRest!31026 () (Array (_ BitVec 32) ValueCell!9275))

(declare-fun mapKey!31026 () (_ BitVec 32))

(assert (=> mapNonEmpty!31026 (= (arr!26468 _values!1231) (store mapRest!31026 mapKey!31026 mapValue!31026))))

(declare-fun b!920592 () Bool)

(declare-fun e!516797 () Bool)

(assert (=> b!920592 (= e!516797 e!516799)))

(declare-fun res!620486 () Bool)

(assert (=> b!920592 (=> (not res!620486) (not e!516799))))

(assert (=> b!920592 (= res!620486 (contains!4781 lt!413192 k0!1099))))

(assert (=> b!920592 (= lt!413192 (getCurrentListMap!2981 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!920593 () Bool)

(declare-fun res!620488 () Bool)

(assert (=> b!920593 (=> (not res!620488) (not e!516799))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!920593 (= res!620488 (validKeyInArray!0 k0!1099))))

(declare-fun b!920594 () Bool)

(declare-fun res!620484 () Bool)

(assert (=> b!920594 (=> (not res!620484) (not e!516797))))

(assert (=> b!920594 (= res!620484 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18541))))

(declare-fun mapIsEmpty!31026 () Bool)

(assert (=> mapIsEmpty!31026 mapRes!31026))

(declare-fun b!920595 () Bool)

(declare-fun res!620492 () Bool)

(assert (=> b!920595 (=> (not res!620492) (not e!516797))))

(assert (=> b!920595 (= res!620492 (and (= (size!26928 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26929 _keys!1487) (size!26928 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun res!620493 () Bool)

(assert (=> start!78960 (=> (not res!620493) (not e!516797))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78960 (= res!620493 (validMask!0 mask!1881))))

(assert (=> start!78960 e!516797))

(assert (=> start!78960 true))

(assert (=> start!78960 tp_is_empty!19513))

(declare-fun array_inv!20720 (array!55055) Bool)

(assert (=> start!78960 (and (array_inv!20720 _values!1231) e!516795)))

(assert (=> start!78960 tp!59457))

(declare-fun array_inv!20721 (array!55057) Bool)

(assert (=> start!78960 (array_inv!20721 _keys!1487)))

(declare-fun b!920586 () Bool)

(declare-fun res!620490 () Bool)

(assert (=> b!920586 (=> (not res!620490) (not e!516797))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55057 (_ BitVec 32)) Bool)

(assert (=> b!920586 (= res!620490 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!920596 () Bool)

(declare-fun res!620491 () Bool)

(assert (=> b!920596 (=> (not res!620491) (not e!516797))))

(assert (=> b!920596 (= res!620491 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26929 _keys!1487))))))

(declare-fun b!920597 () Bool)

(assert (=> b!920597 (= e!516799 e!516793)))

(declare-fun res!620485 () Bool)

(assert (=> b!920597 (=> (not res!620485) (not e!516793))))

(assert (=> b!920597 (= res!620485 (validKeyInArray!0 lt!413194))))

(assert (=> b!920597 (= lt!413194 (select (arr!26469 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (= (and start!78960 res!620493) b!920595))

(assert (= (and b!920595 res!620492) b!920586))

(assert (= (and b!920586 res!620490) b!920594))

(assert (= (and b!920594 res!620484) b!920596))

(assert (= (and b!920596 res!620491) b!920592))

(assert (= (and b!920592 res!620486) b!920585))

(assert (= (and b!920585 res!620489) b!920587))

(assert (= (and b!920587 res!620487) b!920593))

(assert (= (and b!920593 res!620488) b!920597))

(assert (= (and b!920597 res!620485) b!920591))

(assert (= (and b!920589 condMapEmpty!31026) mapIsEmpty!31026))

(assert (= (and b!920589 (not condMapEmpty!31026)) mapNonEmpty!31026))

(get-info :version)

(assert (= (and mapNonEmpty!31026 ((_ is ValueCellFull!9275) mapValue!31026)) b!920588))

(assert (= (and b!920589 ((_ is ValueCellFull!9275) mapDefault!31026)) b!920590))

(assert (= start!78960 b!920589))

(declare-fun b_lambda!13521 () Bool)

(assert (=> (not b_lambda!13521) (not b!920591)))

(declare-fun t!26269 () Bool)

(declare-fun tb!5577 () Bool)

(assert (=> (and start!78960 (= defaultEntry!1235 defaultEntry!1235) t!26269) tb!5577))

(declare-fun result!10985 () Bool)

(assert (=> tb!5577 (= result!10985 tp_is_empty!19513)))

(assert (=> b!920591 t!26269))

(declare-fun b_and!27759 () Bool)

(assert (= b_and!27757 (and (=> t!26269 result!10985) b_and!27759)))

(declare-fun m!854797 () Bool)

(assert (=> b!920594 m!854797))

(declare-fun m!854799 () Bool)

(assert (=> b!920586 m!854799))

(declare-fun m!854801 () Bool)

(assert (=> b!920592 m!854801))

(declare-fun m!854803 () Bool)

(assert (=> b!920592 m!854803))

(declare-fun m!854805 () Bool)

(assert (=> b!920593 m!854805))

(declare-fun m!854807 () Bool)

(assert (=> start!78960 m!854807))

(declare-fun m!854809 () Bool)

(assert (=> start!78960 m!854809))

(declare-fun m!854811 () Bool)

(assert (=> start!78960 m!854811))

(declare-fun m!854813 () Bool)

(assert (=> b!920597 m!854813))

(declare-fun m!854815 () Bool)

(assert (=> b!920597 m!854815))

(declare-fun m!854817 () Bool)

(assert (=> mapNonEmpty!31026 m!854817))

(declare-fun m!854819 () Bool)

(assert (=> b!920585 m!854819))

(declare-fun m!854821 () Bool)

(assert (=> b!920591 m!854821))

(declare-fun m!854823 () Bool)

(assert (=> b!920591 m!854823))

(declare-fun m!854825 () Bool)

(assert (=> b!920591 m!854825))

(declare-fun m!854827 () Bool)

(assert (=> b!920591 m!854827))

(declare-fun m!854829 () Bool)

(assert (=> b!920591 m!854829))

(declare-fun m!854831 () Bool)

(assert (=> b!920591 m!854831))

(assert (=> b!920591 m!854829))

(declare-fun m!854833 () Bool)

(assert (=> b!920591 m!854833))

(declare-fun m!854835 () Bool)

(assert (=> b!920591 m!854835))

(assert (=> b!920591 m!854821))

(declare-fun m!854837 () Bool)

(assert (=> b!920591 m!854837))

(declare-fun m!854839 () Bool)

(assert (=> b!920591 m!854839))

(declare-fun m!854841 () Bool)

(assert (=> b!920591 m!854841))

(assert (=> b!920591 m!854831))

(assert (=> b!920591 m!854825))

(declare-fun m!854843 () Bool)

(assert (=> b!920591 m!854843))

(check-sat b_and!27759 (not b!920593) (not mapNonEmpty!31026) (not b!920586) tp_is_empty!19513 (not b!920591) (not b!920594) (not b!920585) (not b_lambda!13521) (not start!78960) (not b!920597) (not b!920592) (not b_next!17005))
(check-sat b_and!27759 (not b_next!17005))
