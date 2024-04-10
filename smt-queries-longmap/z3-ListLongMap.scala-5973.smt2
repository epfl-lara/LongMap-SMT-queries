; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77666 () Bool)

(assert start!77666)

(declare-fun b_free!16251 () Bool)

(declare-fun b_next!16251 () Bool)

(assert (=> start!77666 (= b_free!16251 (not b_next!16251))))

(declare-fun tp!57014 () Bool)

(declare-fun b_and!26655 () Bool)

(assert (=> start!77666 (= tp!57014 b_and!26655)))

(declare-fun b!905656 () Bool)

(declare-fun res!611155 () Bool)

(declare-fun e!507513 () Bool)

(assert (=> b!905656 (=> (not res!611155) (not e!507513))))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!53380 0))(
  ( (array!53381 (arr!25649 (Array (_ BitVec 32) (_ BitVec 64))) (size!26108 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53380)

(declare-fun k0!1033 () (_ BitVec 64))

(assert (=> b!905656 (= res!611155 (and (= (select (arr!25649 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!905657 () Bool)

(declare-fun res!611150 () Bool)

(declare-fun e!507511 () Bool)

(assert (=> b!905657 (=> (not res!611150) (not e!507511))))

(declare-datatypes ((List!18018 0))(
  ( (Nil!18015) (Cons!18014 (h!19160 (_ BitVec 64)) (t!25441 List!18018)) )
))
(declare-fun arrayNoDuplicates!0 (array!53380 (_ BitVec 32) List!18018) Bool)

(assert (=> b!905657 (= res!611150 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18015))))

(declare-fun mapIsEmpty!29716 () Bool)

(declare-fun mapRes!29716 () Bool)

(assert (=> mapIsEmpty!29716 mapRes!29716))

(declare-fun b!905658 () Bool)

(declare-fun res!611156 () Bool)

(assert (=> b!905658 (=> (not res!611156) (not e!507511))))

(declare-datatypes ((V!29857 0))(
  ( (V!29858 (val!9385 Int)) )
))
(declare-datatypes ((ValueCell!8853 0))(
  ( (ValueCellFull!8853 (v!11890 V!29857)) (EmptyCell!8853) )
))
(declare-datatypes ((array!53382 0))(
  ( (array!53383 (arr!25650 (Array (_ BitVec 32) ValueCell!8853)) (size!26109 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53382)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(assert (=> b!905658 (= res!611156 (and (= (size!26109 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26108 _keys!1386) (size!26109 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!905659 () Bool)

(declare-fun e!507508 () Bool)

(declare-fun e!507507 () Bool)

(assert (=> b!905659 (= e!507508 (and e!507507 mapRes!29716))))

(declare-fun condMapEmpty!29716 () Bool)

(declare-fun mapDefault!29716 () ValueCell!8853)

(assert (=> b!905659 (= condMapEmpty!29716 (= (arr!25650 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8853)) mapDefault!29716)))))

(declare-fun b!905660 () Bool)

(declare-fun res!611157 () Bool)

(assert (=> b!905660 (=> (not res!611157) (not e!507511))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53380 (_ BitVec 32)) Bool)

(assert (=> b!905660 (= res!611157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!905661 () Bool)

(declare-fun res!611159 () Bool)

(declare-fun e!507510 () Bool)

(assert (=> b!905661 (=> res!611159 e!507510)))

(declare-datatypes ((tuple2!12208 0))(
  ( (tuple2!12209 (_1!6115 (_ BitVec 64)) (_2!6115 V!29857)) )
))
(declare-datatypes ((List!18019 0))(
  ( (Nil!18016) (Cons!18015 (h!19161 tuple2!12208) (t!25442 List!18019)) )
))
(declare-datatypes ((ListLongMap!10905 0))(
  ( (ListLongMap!10906 (toList!5468 List!18019)) )
))
(declare-fun lt!408632 () ListLongMap!10905)

(declare-fun lt!408636 () V!29857)

(declare-fun apply!457 (ListLongMap!10905 (_ BitVec 64)) V!29857)

(assert (=> b!905661 (= res!611159 (not (= (apply!457 lt!408632 k0!1033) lt!408636)))))

(declare-fun b!905662 () Bool)

(declare-fun e!507512 () Bool)

(declare-fun tp_is_empty!18669 () Bool)

(assert (=> b!905662 (= e!507512 tp_is_empty!18669)))

(declare-fun b!905663 () Bool)

(declare-fun res!611153 () Bool)

(assert (=> b!905663 (=> (not res!611153) (not e!507513))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!905663 (= res!611153 (inRange!0 i!717 mask!1756))))

(declare-fun b!905664 () Bool)

(declare-fun e!507506 () Bool)

(assert (=> b!905664 (= e!507506 e!507510)))

(declare-fun res!611152 () Bool)

(assert (=> b!905664 (=> res!611152 e!507510)))

(declare-fun contains!4513 (ListLongMap!10905 (_ BitVec 64)) Bool)

(assert (=> b!905664 (= res!611152 (not (contains!4513 lt!408632 k0!1033)))))

(declare-fun zeroValue!1094 () V!29857)

(declare-fun minValue!1094 () V!29857)

(declare-fun defaultEntry!1160 () Int)

(declare-fun getCurrentListMap!2734 (array!53380 array!53382 (_ BitVec 32) (_ BitVec 32) V!29857 V!29857 (_ BitVec 32) Int) ListLongMap!10905)

(assert (=> b!905664 (= lt!408632 (getCurrentListMap!2734 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!905665 () Bool)

(assert (=> b!905665 (= e!507510 true)))

(declare-fun lt!408633 () ListLongMap!10905)

(assert (=> b!905665 (= (apply!457 lt!408633 k0!1033) lt!408636)))

(declare-datatypes ((Unit!30728 0))(
  ( (Unit!30729) )
))
(declare-fun lt!408634 () Unit!30728)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!12 (array!53380 array!53382 (_ BitVec 32) (_ BitVec 32) V!29857 V!29857 (_ BitVec 64) V!29857 (_ BitVec 32) Int) Unit!30728)

(assert (=> b!905665 (= lt!408634 (lemmaListMapApplyFromThenApplyFromZero!12 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!408636 i!717 defaultEntry!1160))))

(declare-fun res!611151 () Bool)

(assert (=> start!77666 (=> (not res!611151) (not e!507511))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77666 (= res!611151 (validMask!0 mask!1756))))

(assert (=> start!77666 e!507511))

(declare-fun array_inv!20094 (array!53382) Bool)

(assert (=> start!77666 (and (array_inv!20094 _values!1152) e!507508)))

(assert (=> start!77666 tp!57014))

(assert (=> start!77666 true))

(assert (=> start!77666 tp_is_empty!18669))

(declare-fun array_inv!20095 (array!53380) Bool)

(assert (=> start!77666 (array_inv!20095 _keys!1386)))

(declare-fun b!905666 () Bool)

(assert (=> b!905666 (= e!507507 tp_is_empty!18669)))

(declare-fun b!905667 () Bool)

(assert (=> b!905667 (= e!507511 e!507513)))

(declare-fun res!611154 () Bool)

(assert (=> b!905667 (=> (not res!611154) (not e!507513))))

(assert (=> b!905667 (= res!611154 (contains!4513 lt!408633 k0!1033))))

(assert (=> b!905667 (= lt!408633 (getCurrentListMap!2734 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!905668 () Bool)

(assert (=> b!905668 (= e!507513 (not e!507506))))

(declare-fun res!611158 () Bool)

(assert (=> b!905668 (=> res!611158 e!507506)))

(assert (=> b!905668 (= res!611158 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26108 _keys!1386))))))

(declare-fun get!13477 (ValueCell!8853 V!29857) V!29857)

(declare-fun dynLambda!1333 (Int (_ BitVec 64)) V!29857)

(assert (=> b!905668 (= lt!408636 (get!13477 (select (arr!25650 _values!1152) i!717) (dynLambda!1333 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53380 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!905668 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!408635 () Unit!30728)

(declare-fun lemmaKeyInListMapIsInArray!205 (array!53380 array!53382 (_ BitVec 32) (_ BitVec 32) V!29857 V!29857 (_ BitVec 64) Int) Unit!30728)

(assert (=> b!905668 (= lt!408635 (lemmaKeyInListMapIsInArray!205 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun mapNonEmpty!29716 () Bool)

(declare-fun tp!57015 () Bool)

(assert (=> mapNonEmpty!29716 (= mapRes!29716 (and tp!57015 e!507512))))

(declare-fun mapValue!29716 () ValueCell!8853)

(declare-fun mapKey!29716 () (_ BitVec 32))

(declare-fun mapRest!29716 () (Array (_ BitVec 32) ValueCell!8853))

(assert (=> mapNonEmpty!29716 (= (arr!25650 _values!1152) (store mapRest!29716 mapKey!29716 mapValue!29716))))

(assert (= (and start!77666 res!611151) b!905658))

(assert (= (and b!905658 res!611156) b!905660))

(assert (= (and b!905660 res!611157) b!905657))

(assert (= (and b!905657 res!611150) b!905667))

(assert (= (and b!905667 res!611154) b!905663))

(assert (= (and b!905663 res!611153) b!905656))

(assert (= (and b!905656 res!611155) b!905668))

(assert (= (and b!905668 (not res!611158)) b!905664))

(assert (= (and b!905664 (not res!611152)) b!905661))

(assert (= (and b!905661 (not res!611159)) b!905665))

(assert (= (and b!905659 condMapEmpty!29716) mapIsEmpty!29716))

(assert (= (and b!905659 (not condMapEmpty!29716)) mapNonEmpty!29716))

(get-info :version)

(assert (= (and mapNonEmpty!29716 ((_ is ValueCellFull!8853) mapValue!29716)) b!905662))

(assert (= (and b!905659 ((_ is ValueCellFull!8853) mapDefault!29716)) b!905666))

(assert (= start!77666 b!905659))

(declare-fun b_lambda!13125 () Bool)

(assert (=> (not b_lambda!13125) (not b!905668)))

(declare-fun t!25440 () Bool)

(declare-fun tb!5273 () Bool)

(assert (=> (and start!77666 (= defaultEntry!1160 defaultEntry!1160) t!25440) tb!5273))

(declare-fun result!10341 () Bool)

(assert (=> tb!5273 (= result!10341 tp_is_empty!18669)))

(assert (=> b!905668 t!25440))

(declare-fun b_and!26657 () Bool)

(assert (= b_and!26655 (and (=> t!25440 result!10341) b_and!26657)))

(declare-fun m!841055 () Bool)

(assert (=> start!77666 m!841055))

(declare-fun m!841057 () Bool)

(assert (=> start!77666 m!841057))

(declare-fun m!841059 () Bool)

(assert (=> start!77666 m!841059))

(declare-fun m!841061 () Bool)

(assert (=> b!905667 m!841061))

(declare-fun m!841063 () Bool)

(assert (=> b!905667 m!841063))

(declare-fun m!841065 () Bool)

(assert (=> b!905660 m!841065))

(declare-fun m!841067 () Bool)

(assert (=> b!905657 m!841067))

(declare-fun m!841069 () Bool)

(assert (=> b!905668 m!841069))

(declare-fun m!841071 () Bool)

(assert (=> b!905668 m!841071))

(declare-fun m!841073 () Bool)

(assert (=> b!905668 m!841073))

(declare-fun m!841075 () Bool)

(assert (=> b!905668 m!841075))

(assert (=> b!905668 m!841069))

(assert (=> b!905668 m!841073))

(declare-fun m!841077 () Bool)

(assert (=> b!905668 m!841077))

(declare-fun m!841079 () Bool)

(assert (=> b!905656 m!841079))

(declare-fun m!841081 () Bool)

(assert (=> b!905665 m!841081))

(declare-fun m!841083 () Bool)

(assert (=> b!905665 m!841083))

(declare-fun m!841085 () Bool)

(assert (=> b!905664 m!841085))

(declare-fun m!841087 () Bool)

(assert (=> b!905664 m!841087))

(declare-fun m!841089 () Bool)

(assert (=> b!905661 m!841089))

(declare-fun m!841091 () Bool)

(assert (=> mapNonEmpty!29716 m!841091))

(declare-fun m!841093 () Bool)

(assert (=> b!905663 m!841093))

(check-sat (not b!905667) (not b!905661) tp_is_empty!18669 (not b!905657) b_and!26657 (not start!77666) (not b!905668) (not b!905660) (not b!905664) (not mapNonEmpty!29716) (not b!905663) (not b!905665) (not b_lambda!13125) (not b_next!16251))
(check-sat b_and!26657 (not b_next!16251))
