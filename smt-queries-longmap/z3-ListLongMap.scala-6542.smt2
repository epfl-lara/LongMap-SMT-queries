; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83118 () Bool)

(assert start!83118)

(declare-fun b_free!19129 () Bool)

(declare-fun b_next!19129 () Bool)

(assert (=> start!83118 (= b_free!19129 (not b_next!19129))))

(declare-fun tp!66667 () Bool)

(declare-fun b_and!30591 () Bool)

(assert (=> start!83118 (= tp!66667 b_and!30591)))

(declare-fun b!969597 () Bool)

(declare-fun res!649015 () Bool)

(declare-fun e!546619 () Bool)

(assert (=> b!969597 (=> (not res!649015) (not e!546619))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34353 0))(
  ( (V!34354 (val!11064 Int)) )
))
(declare-datatypes ((ValueCell!10532 0))(
  ( (ValueCellFull!10532 (v!13622 V!34353)) (EmptyCell!10532) )
))
(declare-datatypes ((array!60050 0))(
  ( (array!60051 (arr!28889 (Array (_ BitVec 32) ValueCell!10532)) (size!29370 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60050)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60052 0))(
  ( (array!60053 (arr!28890 (Array (_ BitVec 32) (_ BitVec 64))) (size!29371 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60052)

(assert (=> b!969597 (= res!649015 (and (= (size!29370 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29371 _keys!1717) (size!29370 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!969598 () Bool)

(declare-fun res!649017 () Bool)

(assert (=> b!969598 (=> (not res!649017) (not e!546619))))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!969598 (= res!649017 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29371 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29371 _keys!1717))))))

(declare-fun b!969599 () Bool)

(declare-fun e!546621 () Bool)

(declare-fun e!546620 () Bool)

(declare-fun mapRes!35050 () Bool)

(assert (=> b!969599 (= e!546621 (and e!546620 mapRes!35050))))

(declare-fun condMapEmpty!35050 () Bool)

(declare-fun mapDefault!35050 () ValueCell!10532)

(assert (=> b!969599 (= condMapEmpty!35050 (= (arr!28889 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10532)) mapDefault!35050)))))

(declare-fun b!969600 () Bool)

(assert (=> b!969600 (= e!546619 false)))

(declare-fun zeroValue!1367 () V!34353)

(declare-fun defaultEntry!1428 () Int)

(declare-fun lt!431445 () Bool)

(declare-fun minValue!1367 () V!34353)

(declare-datatypes ((tuple2!14258 0))(
  ( (tuple2!14259 (_1!7140 (_ BitVec 64)) (_2!7140 V!34353)) )
))
(declare-datatypes ((List!20079 0))(
  ( (Nil!20076) (Cons!20075 (h!21237 tuple2!14258) (t!28433 List!20079)) )
))
(declare-datatypes ((ListLongMap!12945 0))(
  ( (ListLongMap!12946 (toList!6488 List!20079)) )
))
(declare-fun contains!5536 (ListLongMap!12945 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3650 (array!60052 array!60050 (_ BitVec 32) (_ BitVec 32) V!34353 V!34353 (_ BitVec 32) Int) ListLongMap!12945)

(assert (=> b!969600 (= lt!431445 (contains!5536 (getCurrentListMap!3650 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28890 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35050 () Bool)

(declare-fun tp!66666 () Bool)

(declare-fun e!546617 () Bool)

(assert (=> mapNonEmpty!35050 (= mapRes!35050 (and tp!66666 e!546617))))

(declare-fun mapRest!35050 () (Array (_ BitVec 32) ValueCell!10532))

(declare-fun mapKey!35050 () (_ BitVec 32))

(declare-fun mapValue!35050 () ValueCell!10532)

(assert (=> mapNonEmpty!35050 (= (arr!28889 _values!1425) (store mapRest!35050 mapKey!35050 mapValue!35050))))

(declare-fun b!969601 () Bool)

(declare-fun res!649014 () Bool)

(assert (=> b!969601 (=> (not res!649014) (not e!546619))))

(declare-datatypes ((List!20080 0))(
  ( (Nil!20077) (Cons!20076 (h!21238 (_ BitVec 64)) (t!28434 List!20080)) )
))
(declare-fun arrayNoDuplicates!0 (array!60052 (_ BitVec 32) List!20080) Bool)

(assert (=> b!969601 (= res!649014 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20077))))

(declare-fun b!969602 () Bool)

(declare-fun tp_is_empty!22027 () Bool)

(assert (=> b!969602 (= e!546617 tp_is_empty!22027)))

(declare-fun b!969603 () Bool)

(declare-fun res!649016 () Bool)

(assert (=> b!969603 (=> (not res!649016) (not e!546619))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60052 (_ BitVec 32)) Bool)

(assert (=> b!969603 (= res!649016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun res!649018 () Bool)

(assert (=> start!83118 (=> (not res!649018) (not e!546619))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83118 (= res!649018 (validMask!0 mask!2147))))

(assert (=> start!83118 e!546619))

(assert (=> start!83118 true))

(declare-fun array_inv!22425 (array!60050) Bool)

(assert (=> start!83118 (and (array_inv!22425 _values!1425) e!546621)))

(assert (=> start!83118 tp_is_empty!22027))

(assert (=> start!83118 tp!66667))

(declare-fun array_inv!22426 (array!60052) Bool)

(assert (=> start!83118 (array_inv!22426 _keys!1717)))

(declare-fun b!969604 () Bool)

(assert (=> b!969604 (= e!546620 tp_is_empty!22027)))

(declare-fun mapIsEmpty!35050 () Bool)

(assert (=> mapIsEmpty!35050 mapRes!35050))

(declare-fun b!969605 () Bool)

(declare-fun res!649013 () Bool)

(assert (=> b!969605 (=> (not res!649013) (not e!546619))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!969605 (= res!649013 (validKeyInArray!0 (select (arr!28890 _keys!1717) i!822)))))

(assert (= (and start!83118 res!649018) b!969597))

(assert (= (and b!969597 res!649015) b!969603))

(assert (= (and b!969603 res!649016) b!969601))

(assert (= (and b!969601 res!649014) b!969598))

(assert (= (and b!969598 res!649017) b!969605))

(assert (= (and b!969605 res!649013) b!969600))

(assert (= (and b!969599 condMapEmpty!35050) mapIsEmpty!35050))

(assert (= (and b!969599 (not condMapEmpty!35050)) mapNonEmpty!35050))

(get-info :version)

(assert (= (and mapNonEmpty!35050 ((_ is ValueCellFull!10532) mapValue!35050)) b!969602))

(assert (= (and b!969599 ((_ is ValueCellFull!10532) mapDefault!35050)) b!969604))

(assert (= start!83118 b!969599))

(declare-fun m!896969 () Bool)

(assert (=> b!969603 m!896969))

(declare-fun m!896971 () Bool)

(assert (=> b!969605 m!896971))

(assert (=> b!969605 m!896971))

(declare-fun m!896973 () Bool)

(assert (=> b!969605 m!896973))

(declare-fun m!896975 () Bool)

(assert (=> start!83118 m!896975))

(declare-fun m!896977 () Bool)

(assert (=> start!83118 m!896977))

(declare-fun m!896979 () Bool)

(assert (=> start!83118 m!896979))

(declare-fun m!896981 () Bool)

(assert (=> b!969600 m!896981))

(assert (=> b!969600 m!896971))

(assert (=> b!969600 m!896981))

(assert (=> b!969600 m!896971))

(declare-fun m!896983 () Bool)

(assert (=> b!969600 m!896983))

(declare-fun m!896985 () Bool)

(assert (=> mapNonEmpty!35050 m!896985))

(declare-fun m!896987 () Bool)

(assert (=> b!969601 m!896987))

(check-sat (not b!969601) (not b!969600) (not b!969605) (not start!83118) (not b!969603) b_and!30591 (not b_next!19129) (not mapNonEmpty!35050) tp_is_empty!22027)
(check-sat b_and!30591 (not b_next!19129))
