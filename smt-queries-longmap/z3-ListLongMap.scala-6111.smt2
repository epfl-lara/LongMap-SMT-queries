; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78776 () Bool)

(assert start!78776)

(declare-fun b_free!16989 () Bool)

(declare-fun b_next!16989 () Bool)

(assert (=> start!78776 (= b_free!16989 (not b_next!16989))))

(declare-fun tp!59407 () Bool)

(declare-fun b_and!27715 () Bool)

(assert (=> start!78776 (= tp!59407 b_and!27715)))

(declare-fun b!919354 () Bool)

(declare-fun res!619905 () Bool)

(declare-fun e!516044 () Bool)

(assert (=> b!919354 (=> (not res!619905) (not e!516044))))

(declare-datatypes ((array!54978 0))(
  ( (array!54979 (arr!26434 (Array (_ BitVec 32) (_ BitVec 64))) (size!26893 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54978)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54978 (_ BitVec 32)) Bool)

(assert (=> b!919354 (= res!619905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!919355 () Bool)

(declare-fun res!619901 () Bool)

(declare-fun e!516043 () Bool)

(assert (=> b!919355 (=> (not res!619901) (not e!516043))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((V!30961 0))(
  ( (V!30962 (val!9799 Int)) )
))
(declare-fun v!791 () V!30961)

(declare-datatypes ((tuple2!12736 0))(
  ( (tuple2!12737 (_1!6379 (_ BitVec 64)) (_2!6379 V!30961)) )
))
(declare-datatypes ((List!18540 0))(
  ( (Nil!18537) (Cons!18536 (h!19682 tuple2!12736) (t!26259 List!18540)) )
))
(declare-datatypes ((ListLongMap!11433 0))(
  ( (ListLongMap!11434 (toList!5732 List!18540)) )
))
(declare-fun lt!412664 () ListLongMap!11433)

(declare-fun apply!577 (ListLongMap!11433 (_ BitVec 64)) V!30961)

(assert (=> b!919355 (= res!619901 (= (apply!577 lt!412664 k0!1099) v!791))))

(declare-fun b!919356 () Bool)

(declare-fun res!619906 () Bool)

(assert (=> b!919356 (=> (not res!619906) (not e!516044))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!919356 (= res!619906 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26893 _keys!1487))))))

(declare-fun b!919357 () Bool)

(declare-fun e!516048 () Bool)

(assert (=> b!919357 (= e!516048 (not true))))

(declare-datatypes ((List!18541 0))(
  ( (Nil!18538) (Cons!18537 (h!19683 (_ BitVec 64)) (t!26260 List!18541)) )
))
(declare-fun arrayNoDuplicates!0 (array!54978 (_ BitVec 32) List!18541) Bool)

(assert (=> b!919357 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18538)))

(declare-datatypes ((Unit!31034 0))(
  ( (Unit!31035) )
))
(declare-fun lt!412663 () Unit!31034)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!54978 (_ BitVec 32) (_ BitVec 32)) Unit!31034)

(assert (=> b!919357 (= lt!412663 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!412661 () tuple2!12736)

(declare-fun contains!4778 (ListLongMap!11433 (_ BitVec 64)) Bool)

(declare-fun +!2643 (ListLongMap!11433 tuple2!12736) ListLongMap!11433)

(assert (=> b!919357 (contains!4778 (+!2643 lt!412664 lt!412661) k0!1099)))

(declare-fun lt!412666 () Unit!31034)

(declare-fun lt!412665 () (_ BitVec 64))

(declare-fun lt!412662 () V!30961)

(declare-fun addStillContains!367 (ListLongMap!11433 (_ BitVec 64) V!30961 (_ BitVec 64)) Unit!31034)

(assert (=> b!919357 (= lt!412666 (addStillContains!367 lt!412664 lt!412665 lt!412662 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9267 0))(
  ( (ValueCellFull!9267 (v!12317 V!30961)) (EmptyCell!9267) )
))
(declare-datatypes ((array!54980 0))(
  ( (array!54981 (arr!26435 (Array (_ BitVec 32) ValueCell!9267)) (size!26894 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54980)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30961)

(declare-fun minValue!1173 () V!30961)

(declare-fun getCurrentListMap!2988 (array!54978 array!54980 (_ BitVec 32) (_ BitVec 32) V!30961 V!30961 (_ BitVec 32) Int) ListLongMap!11433)

(assert (=> b!919357 (= (getCurrentListMap!2988 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2643 (getCurrentListMap!2988 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412661))))

(assert (=> b!919357 (= lt!412661 (tuple2!12737 lt!412665 lt!412662))))

(declare-fun get!13862 (ValueCell!9267 V!30961) V!30961)

(declare-fun dynLambda!1432 (Int (_ BitVec 64)) V!30961)

(assert (=> b!919357 (= lt!412662 (get!13862 (select (arr!26435 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1432 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412660 () Unit!31034)

(declare-fun lemmaListMapRecursiveValidKeyArray!33 (array!54978 array!54980 (_ BitVec 32) (_ BitVec 32) V!30961 V!30961 (_ BitVec 32) Int) Unit!31034)

(assert (=> b!919357 (= lt!412660 (lemmaListMapRecursiveValidKeyArray!33 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun res!619903 () Bool)

(assert (=> start!78776 (=> (not res!619903) (not e!516044))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78776 (= res!619903 (validMask!0 mask!1881))))

(assert (=> start!78776 e!516044))

(assert (=> start!78776 true))

(declare-fun tp_is_empty!19497 () Bool)

(assert (=> start!78776 tp_is_empty!19497))

(declare-fun e!516049 () Bool)

(declare-fun array_inv!20602 (array!54980) Bool)

(assert (=> start!78776 (and (array_inv!20602 _values!1231) e!516049)))

(assert (=> start!78776 tp!59407))

(declare-fun array_inv!20603 (array!54978) Bool)

(assert (=> start!78776 (array_inv!20603 _keys!1487)))

(declare-fun b!919358 () Bool)

(declare-fun res!619902 () Bool)

(assert (=> b!919358 (=> (not res!619902) (not e!516043))))

(assert (=> b!919358 (= res!619902 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!919359 () Bool)

(declare-fun e!516047 () Bool)

(assert (=> b!919359 (= e!516047 tp_is_empty!19497)))

(declare-fun b!919360 () Bool)

(assert (=> b!919360 (= e!516044 e!516043)))

(declare-fun res!619900 () Bool)

(assert (=> b!919360 (=> (not res!619900) (not e!516043))))

(assert (=> b!919360 (= res!619900 (contains!4778 lt!412664 k0!1099))))

(assert (=> b!919360 (= lt!412664 (getCurrentListMap!2988 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!919361 () Bool)

(assert (=> b!919361 (= e!516043 e!516048)))

(declare-fun res!619909 () Bool)

(assert (=> b!919361 (=> (not res!619909) (not e!516048))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!919361 (= res!619909 (validKeyInArray!0 lt!412665))))

(assert (=> b!919361 (= lt!412665 (select (arr!26434 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!919362 () Bool)

(declare-fun res!619907 () Bool)

(assert (=> b!919362 (=> (not res!619907) (not e!516044))))

(assert (=> b!919362 (= res!619907 (and (= (size!26894 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26893 _keys!1487) (size!26894 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!31002 () Bool)

(declare-fun mapRes!31002 () Bool)

(assert (=> mapIsEmpty!31002 mapRes!31002))

(declare-fun b!919363 () Bool)

(declare-fun res!619908 () Bool)

(assert (=> b!919363 (=> (not res!619908) (not e!516044))))

(assert (=> b!919363 (= res!619908 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18538))))

(declare-fun mapNonEmpty!31002 () Bool)

(declare-fun tp!59408 () Bool)

(declare-fun e!516046 () Bool)

(assert (=> mapNonEmpty!31002 (= mapRes!31002 (and tp!59408 e!516046))))

(declare-fun mapKey!31002 () (_ BitVec 32))

(declare-fun mapRest!31002 () (Array (_ BitVec 32) ValueCell!9267))

(declare-fun mapValue!31002 () ValueCell!9267)

(assert (=> mapNonEmpty!31002 (= (arr!26435 _values!1231) (store mapRest!31002 mapKey!31002 mapValue!31002))))

(declare-fun b!919364 () Bool)

(assert (=> b!919364 (= e!516046 tp_is_empty!19497)))

(declare-fun b!919365 () Bool)

(assert (=> b!919365 (= e!516049 (and e!516047 mapRes!31002))))

(declare-fun condMapEmpty!31002 () Bool)

(declare-fun mapDefault!31002 () ValueCell!9267)

(assert (=> b!919365 (= condMapEmpty!31002 (= (arr!26435 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9267)) mapDefault!31002)))))

(declare-fun b!919366 () Bool)

(declare-fun res!619904 () Bool)

(assert (=> b!919366 (=> (not res!619904) (not e!516043))))

(assert (=> b!919366 (= res!619904 (validKeyInArray!0 k0!1099))))

(assert (= (and start!78776 res!619903) b!919362))

(assert (= (and b!919362 res!619907) b!919354))

(assert (= (and b!919354 res!619905) b!919363))

(assert (= (and b!919363 res!619908) b!919356))

(assert (= (and b!919356 res!619906) b!919360))

(assert (= (and b!919360 res!619900) b!919355))

(assert (= (and b!919355 res!619901) b!919358))

(assert (= (and b!919358 res!619902) b!919366))

(assert (= (and b!919366 res!619904) b!919361))

(assert (= (and b!919361 res!619909) b!919357))

(assert (= (and b!919365 condMapEmpty!31002) mapIsEmpty!31002))

(assert (= (and b!919365 (not condMapEmpty!31002)) mapNonEmpty!31002))

(get-info :version)

(assert (= (and mapNonEmpty!31002 ((_ is ValueCellFull!9267) mapValue!31002)) b!919364))

(assert (= (and b!919365 ((_ is ValueCellFull!9267) mapDefault!31002)) b!919359))

(assert (= start!78776 b!919365))

(declare-fun b_lambda!13491 () Bool)

(assert (=> (not b_lambda!13491) (not b!919357)))

(declare-fun t!26258 () Bool)

(declare-fun tb!5569 () Bool)

(assert (=> (and start!78776 (= defaultEntry!1235 defaultEntry!1235) t!26258) tb!5569))

(declare-fun result!10961 () Bool)

(assert (=> tb!5569 (= result!10961 tp_is_empty!19497)))

(assert (=> b!919357 t!26258))

(declare-fun b_and!27717 () Bool)

(assert (= b_and!27715 (and (=> t!26258 result!10961) b_and!27717)))

(declare-fun m!853119 () Bool)

(assert (=> b!919360 m!853119))

(declare-fun m!853121 () Bool)

(assert (=> b!919360 m!853121))

(declare-fun m!853123 () Bool)

(assert (=> b!919361 m!853123))

(declare-fun m!853125 () Bool)

(assert (=> b!919361 m!853125))

(declare-fun m!853127 () Bool)

(assert (=> b!919355 m!853127))

(declare-fun m!853129 () Bool)

(assert (=> start!78776 m!853129))

(declare-fun m!853131 () Bool)

(assert (=> start!78776 m!853131))

(declare-fun m!853133 () Bool)

(assert (=> start!78776 m!853133))

(declare-fun m!853135 () Bool)

(assert (=> b!919366 m!853135))

(declare-fun m!853137 () Bool)

(assert (=> b!919357 m!853137))

(declare-fun m!853139 () Bool)

(assert (=> b!919357 m!853139))

(declare-fun m!853141 () Bool)

(assert (=> b!919357 m!853141))

(declare-fun m!853143 () Bool)

(assert (=> b!919357 m!853143))

(assert (=> b!919357 m!853139))

(assert (=> b!919357 m!853141))

(declare-fun m!853145 () Bool)

(assert (=> b!919357 m!853145))

(declare-fun m!853147 () Bool)

(assert (=> b!919357 m!853147))

(assert (=> b!919357 m!853137))

(declare-fun m!853149 () Bool)

(assert (=> b!919357 m!853149))

(declare-fun m!853151 () Bool)

(assert (=> b!919357 m!853151))

(declare-fun m!853153 () Bool)

(assert (=> b!919357 m!853153))

(declare-fun m!853155 () Bool)

(assert (=> b!919357 m!853155))

(declare-fun m!853157 () Bool)

(assert (=> b!919357 m!853157))

(assert (=> b!919357 m!853151))

(declare-fun m!853159 () Bool)

(assert (=> b!919357 m!853159))

(declare-fun m!853161 () Bool)

(assert (=> b!919363 m!853161))

(declare-fun m!853163 () Bool)

(assert (=> b!919354 m!853163))

(declare-fun m!853165 () Bool)

(assert (=> mapNonEmpty!31002 m!853165))

(check-sat (not b!919360) b_and!27717 tp_is_empty!19497 (not b_next!16989) (not b!919366) (not mapNonEmpty!31002) (not b!919363) (not b!919354) (not b!919355) (not b!919357) (not b_lambda!13491) (not start!78776) (not b!919361))
(check-sat b_and!27717 (not b_next!16989))
