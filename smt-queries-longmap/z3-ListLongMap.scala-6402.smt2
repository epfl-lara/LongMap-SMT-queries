; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82190 () Bool)

(assert start!82190)

(declare-fun b_free!18481 () Bool)

(declare-fun b_next!18481 () Bool)

(assert (=> start!82190 (= b_free!18481 (not b_next!18481))))

(declare-fun tp!64405 () Bool)

(declare-fun b_and!29943 () Bool)

(assert (=> start!82190 (= tp!64405 b_and!29943)))

(declare-fun b!957933 () Bool)

(declare-fun res!641259 () Bool)

(declare-fun e!540029 () Bool)

(assert (=> b!957933 (=> (not res!641259) (not e!540029))))

(declare-datatypes ((array!58414 0))(
  ( (array!58415 (arr!28081 (Array (_ BitVec 32) (_ BitVec 64))) (size!28562 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58414)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!957933 (= res!641259 (validKeyInArray!0 (select (arr!28081 _keys!1668) i!793)))))

(declare-fun b!957935 () Bool)

(declare-fun e!540031 () Bool)

(declare-fun tp_is_empty!21187 () Bool)

(assert (=> b!957935 (= e!540031 tp_is_empty!21187)))

(declare-fun mapIsEmpty!33760 () Bool)

(declare-fun mapRes!33760 () Bool)

(assert (=> mapIsEmpty!33760 mapRes!33760))

(declare-fun mapNonEmpty!33760 () Bool)

(declare-fun tp!64404 () Bool)

(assert (=> mapNonEmpty!33760 (= mapRes!33760 (and tp!64404 e!540031))))

(declare-fun mapKey!33760 () (_ BitVec 32))

(declare-datatypes ((V!33233 0))(
  ( (V!33234 (val!10644 Int)) )
))
(declare-datatypes ((ValueCell!10112 0))(
  ( (ValueCellFull!10112 (v!13200 V!33233)) (EmptyCell!10112) )
))
(declare-datatypes ((array!58416 0))(
  ( (array!58417 (arr!28082 (Array (_ BitVec 32) ValueCell!10112)) (size!28563 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58416)

(declare-fun mapValue!33760 () ValueCell!10112)

(declare-fun mapRest!33760 () (Array (_ BitVec 32) ValueCell!10112))

(assert (=> mapNonEmpty!33760 (= (arr!28082 _values!1386) (store mapRest!33760 mapKey!33760 mapValue!33760))))

(declare-fun b!957936 () Bool)

(declare-fun res!641260 () Bool)

(assert (=> b!957936 (=> (not res!641260) (not e!540029))))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!957936 (= res!641260 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28562 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28562 _keys!1668))))))

(declare-fun b!957937 () Bool)

(declare-fun res!641261 () Bool)

(assert (=> b!957937 (=> (not res!641261) (not e!540029))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!957937 (= res!641261 (and (= (size!28563 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28562 _keys!1668) (size!28563 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!957938 () Bool)

(declare-fun res!641258 () Bool)

(assert (=> b!957938 (=> (not res!641258) (not e!540029))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58414 (_ BitVec 32)) Bool)

(assert (=> b!957938 (= res!641258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!957939 () Bool)

(declare-fun e!540028 () Bool)

(declare-fun e!540030 () Bool)

(assert (=> b!957939 (= e!540028 (and e!540030 mapRes!33760))))

(declare-fun condMapEmpty!33760 () Bool)

(declare-fun mapDefault!33760 () ValueCell!10112)

(assert (=> b!957939 (= condMapEmpty!33760 (= (arr!28082 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10112)) mapDefault!33760)))))

(declare-fun b!957934 () Bool)

(assert (=> b!957934 (= e!540029 false)))

(declare-fun lt!430177 () Bool)

(declare-fun minValue!1328 () V!33233)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33233)

(declare-datatypes ((tuple2!13772 0))(
  ( (tuple2!13773 (_1!6897 (_ BitVec 64)) (_2!6897 V!33233)) )
))
(declare-datatypes ((List!19558 0))(
  ( (Nil!19555) (Cons!19554 (h!20716 tuple2!13772) (t!27912 List!19558)) )
))
(declare-datatypes ((ListLongMap!12459 0))(
  ( (ListLongMap!12460 (toList!6245 List!19558)) )
))
(declare-fun contains!5291 (ListLongMap!12459 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3407 (array!58414 array!58416 (_ BitVec 32) (_ BitVec 32) V!33233 V!33233 (_ BitVec 32) Int) ListLongMap!12459)

(assert (=> b!957934 (= lt!430177 (contains!5291 (getCurrentListMap!3407 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28081 _keys!1668) i!793)))))

(declare-fun res!641257 () Bool)

(assert (=> start!82190 (=> (not res!641257) (not e!540029))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82190 (= res!641257 (validMask!0 mask!2088))))

(assert (=> start!82190 e!540029))

(assert (=> start!82190 true))

(assert (=> start!82190 tp_is_empty!21187))

(declare-fun array_inv!21839 (array!58414) Bool)

(assert (=> start!82190 (array_inv!21839 _keys!1668)))

(declare-fun array_inv!21840 (array!58416) Bool)

(assert (=> start!82190 (and (array_inv!21840 _values!1386) e!540028)))

(assert (=> start!82190 tp!64405))

(declare-fun b!957940 () Bool)

(assert (=> b!957940 (= e!540030 tp_is_empty!21187)))

(declare-fun b!957941 () Bool)

(declare-fun res!641262 () Bool)

(assert (=> b!957941 (=> (not res!641262) (not e!540029))))

(declare-datatypes ((List!19559 0))(
  ( (Nil!19556) (Cons!19555 (h!20717 (_ BitVec 64)) (t!27913 List!19559)) )
))
(declare-fun arrayNoDuplicates!0 (array!58414 (_ BitVec 32) List!19559) Bool)

(assert (=> b!957941 (= res!641262 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19556))))

(assert (= (and start!82190 res!641257) b!957937))

(assert (= (and b!957937 res!641261) b!957938))

(assert (= (and b!957938 res!641258) b!957941))

(assert (= (and b!957941 res!641262) b!957936))

(assert (= (and b!957936 res!641260) b!957933))

(assert (= (and b!957933 res!641259) b!957934))

(assert (= (and b!957939 condMapEmpty!33760) mapIsEmpty!33760))

(assert (= (and b!957939 (not condMapEmpty!33760)) mapNonEmpty!33760))

(get-info :version)

(assert (= (and mapNonEmpty!33760 ((_ is ValueCellFull!10112) mapValue!33760)) b!957935))

(assert (= (and b!957939 ((_ is ValueCellFull!10112) mapDefault!33760)) b!957940))

(assert (= start!82190 b!957939))

(declare-fun m!888159 () Bool)

(assert (=> b!957933 m!888159))

(assert (=> b!957933 m!888159))

(declare-fun m!888161 () Bool)

(assert (=> b!957933 m!888161))

(declare-fun m!888163 () Bool)

(assert (=> b!957934 m!888163))

(assert (=> b!957934 m!888159))

(assert (=> b!957934 m!888163))

(assert (=> b!957934 m!888159))

(declare-fun m!888165 () Bool)

(assert (=> b!957934 m!888165))

(declare-fun m!888167 () Bool)

(assert (=> b!957938 m!888167))

(declare-fun m!888169 () Bool)

(assert (=> mapNonEmpty!33760 m!888169))

(declare-fun m!888171 () Bool)

(assert (=> start!82190 m!888171))

(declare-fun m!888173 () Bool)

(assert (=> start!82190 m!888173))

(declare-fun m!888175 () Bool)

(assert (=> start!82190 m!888175))

(declare-fun m!888177 () Bool)

(assert (=> b!957941 m!888177))

(check-sat (not b!957933) tp_is_empty!21187 (not b_next!18481) (not start!82190) (not mapNonEmpty!33760) (not b!957938) b_and!29943 (not b!957934) (not b!957941))
(check-sat b_and!29943 (not b_next!18481))
