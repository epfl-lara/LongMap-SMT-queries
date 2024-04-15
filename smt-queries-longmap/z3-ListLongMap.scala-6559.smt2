; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83220 () Bool)

(assert start!83220)

(declare-fun b_free!19231 () Bool)

(declare-fun b_next!19231 () Bool)

(assert (=> start!83220 (= b_free!19231 (not b_next!19231))))

(declare-fun tp!66973 () Bool)

(declare-fun b_and!30693 () Bool)

(assert (=> start!83220 (= tp!66973 b_and!30693)))

(declare-fun b!971030 () Bool)

(declare-fun res!649993 () Bool)

(declare-fun e!547384 () Bool)

(assert (=> b!971030 (=> (not res!649993) (not e!547384))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34489 0))(
  ( (V!34490 (val!11115 Int)) )
))
(declare-datatypes ((ValueCell!10583 0))(
  ( (ValueCellFull!10583 (v!13673 V!34489)) (EmptyCell!10583) )
))
(declare-datatypes ((array!60242 0))(
  ( (array!60243 (arr!28985 (Array (_ BitVec 32) ValueCell!10583)) (size!29466 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60242)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60244 0))(
  ( (array!60245 (arr!28986 (Array (_ BitVec 32) (_ BitVec 64))) (size!29467 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60244)

(assert (=> b!971030 (= res!649993 (and (= (size!29466 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29467 _keys!1717) (size!29466 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!35203 () Bool)

(declare-fun mapRes!35203 () Bool)

(declare-fun tp!66972 () Bool)

(declare-fun e!547383 () Bool)

(assert (=> mapNonEmpty!35203 (= mapRes!35203 (and tp!66972 e!547383))))

(declare-fun mapRest!35203 () (Array (_ BitVec 32) ValueCell!10583))

(declare-fun mapValue!35203 () ValueCell!10583)

(declare-fun mapKey!35203 () (_ BitVec 32))

(assert (=> mapNonEmpty!35203 (= (arr!28985 _values!1425) (store mapRest!35203 mapKey!35203 mapValue!35203))))

(declare-fun b!971032 () Bool)

(declare-fun res!649991 () Bool)

(assert (=> b!971032 (=> (not res!649991) (not e!547384))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!971032 (= res!649991 (validKeyInArray!0 (select (arr!28986 _keys!1717) i!822)))))

(declare-fun b!971033 () Bool)

(declare-fun res!649990 () Bool)

(assert (=> b!971033 (=> (not res!649990) (not e!547384))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!971033 (= res!649990 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29467 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29467 _keys!1717))))))

(declare-fun b!971034 () Bool)

(declare-fun e!547382 () Bool)

(declare-fun tp_is_empty!22129 () Bool)

(assert (=> b!971034 (= e!547382 tp_is_empty!22129)))

(declare-fun b!971035 () Bool)

(assert (=> b!971035 (= e!547384 false)))

(declare-fun zeroValue!1367 () V!34489)

(declare-datatypes ((tuple2!14330 0))(
  ( (tuple2!14331 (_1!7176 (_ BitVec 64)) (_2!7176 V!34489)) )
))
(declare-datatypes ((List!20149 0))(
  ( (Nil!20146) (Cons!20145 (h!21307 tuple2!14330) (t!28503 List!20149)) )
))
(declare-datatypes ((ListLongMap!13017 0))(
  ( (ListLongMap!13018 (toList!6524 List!20149)) )
))
(declare-fun lt!431580 () ListLongMap!13017)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34489)

(declare-fun getCurrentListMap!3686 (array!60244 array!60242 (_ BitVec 32) (_ BitVec 32) V!34489 V!34489 (_ BitVec 32) Int) ListLongMap!13017)

(assert (=> b!971035 (= lt!431580 (getCurrentListMap!3686 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun mapIsEmpty!35203 () Bool)

(assert (=> mapIsEmpty!35203 mapRes!35203))

(declare-fun b!971036 () Bool)

(declare-fun res!649989 () Bool)

(assert (=> b!971036 (=> (not res!649989) (not e!547384))))

(declare-datatypes ((List!20150 0))(
  ( (Nil!20147) (Cons!20146 (h!21308 (_ BitVec 64)) (t!28504 List!20150)) )
))
(declare-fun arrayNoDuplicates!0 (array!60244 (_ BitVec 32) List!20150) Bool)

(assert (=> b!971036 (= res!649989 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20147))))

(declare-fun b!971037 () Bool)

(assert (=> b!971037 (= e!547383 tp_is_empty!22129)))

(declare-fun res!649988 () Bool)

(assert (=> start!83220 (=> (not res!649988) (not e!547384))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83220 (= res!649988 (validMask!0 mask!2147))))

(assert (=> start!83220 e!547384))

(assert (=> start!83220 true))

(declare-fun e!547386 () Bool)

(declare-fun array_inv!22497 (array!60242) Bool)

(assert (=> start!83220 (and (array_inv!22497 _values!1425) e!547386)))

(assert (=> start!83220 tp_is_empty!22129))

(assert (=> start!83220 tp!66973))

(declare-fun array_inv!22498 (array!60244) Bool)

(assert (=> start!83220 (array_inv!22498 _keys!1717)))

(declare-fun b!971031 () Bool)

(declare-fun res!649987 () Bool)

(assert (=> b!971031 (=> (not res!649987) (not e!547384))))

(declare-fun contains!5571 (ListLongMap!13017 (_ BitVec 64)) Bool)

(assert (=> b!971031 (= res!649987 (contains!5571 (getCurrentListMap!3686 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28986 _keys!1717) i!822)))))

(declare-fun b!971038 () Bool)

(assert (=> b!971038 (= e!547386 (and e!547382 mapRes!35203))))

(declare-fun condMapEmpty!35203 () Bool)

(declare-fun mapDefault!35203 () ValueCell!10583)

(assert (=> b!971038 (= condMapEmpty!35203 (= (arr!28985 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10583)) mapDefault!35203)))))

(declare-fun b!971039 () Bool)

(declare-fun res!649992 () Bool)

(assert (=> b!971039 (=> (not res!649992) (not e!547384))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60244 (_ BitVec 32)) Bool)

(assert (=> b!971039 (= res!649992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(assert (= (and start!83220 res!649988) b!971030))

(assert (= (and b!971030 res!649993) b!971039))

(assert (= (and b!971039 res!649992) b!971036))

(assert (= (and b!971036 res!649989) b!971033))

(assert (= (and b!971033 res!649990) b!971032))

(assert (= (and b!971032 res!649991) b!971031))

(assert (= (and b!971031 res!649987) b!971035))

(assert (= (and b!971038 condMapEmpty!35203) mapIsEmpty!35203))

(assert (= (and b!971038 (not condMapEmpty!35203)) mapNonEmpty!35203))

(get-info :version)

(assert (= (and mapNonEmpty!35203 ((_ is ValueCellFull!10583) mapValue!35203)) b!971037))

(assert (= (and b!971038 ((_ is ValueCellFull!10583) mapDefault!35203)) b!971034))

(assert (= start!83220 b!971038))

(declare-fun m!898013 () Bool)

(assert (=> b!971032 m!898013))

(assert (=> b!971032 m!898013))

(declare-fun m!898015 () Bool)

(assert (=> b!971032 m!898015))

(declare-fun m!898017 () Bool)

(assert (=> b!971035 m!898017))

(declare-fun m!898019 () Bool)

(assert (=> b!971039 m!898019))

(declare-fun m!898021 () Bool)

(assert (=> start!83220 m!898021))

(declare-fun m!898023 () Bool)

(assert (=> start!83220 m!898023))

(declare-fun m!898025 () Bool)

(assert (=> start!83220 m!898025))

(declare-fun m!898027 () Bool)

(assert (=> b!971036 m!898027))

(declare-fun m!898029 () Bool)

(assert (=> mapNonEmpty!35203 m!898029))

(declare-fun m!898031 () Bool)

(assert (=> b!971031 m!898031))

(assert (=> b!971031 m!898013))

(assert (=> b!971031 m!898031))

(assert (=> b!971031 m!898013))

(declare-fun m!898033 () Bool)

(assert (=> b!971031 m!898033))

(check-sat b_and!30693 (not mapNonEmpty!35203) (not b!971035) (not b!971032) (not b!971039) (not b!971036) (not b!971031) (not b_next!19231) (not start!83220) tp_is_empty!22129)
(check-sat b_and!30693 (not b_next!19231))
