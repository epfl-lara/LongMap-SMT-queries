; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83412 () Bool)

(assert start!83412)

(declare-fun b_free!19237 () Bool)

(declare-fun b_next!19237 () Bool)

(assert (=> start!83412 (= b_free!19237 (not b_next!19237))))

(declare-fun tp!66991 () Bool)

(declare-fun b_and!30735 () Bool)

(assert (=> start!83412 (= tp!66991 b_and!30735)))

(declare-fun b!972262 () Bool)

(declare-fun e!548158 () Bool)

(declare-fun tp_is_empty!22135 () Bool)

(assert (=> b!972262 (= e!548158 tp_is_empty!22135)))

(declare-fun b!972263 () Bool)

(declare-fun e!548157 () Bool)

(declare-fun mapRes!35212 () Bool)

(assert (=> b!972263 (= e!548157 (and e!548158 mapRes!35212))))

(declare-fun condMapEmpty!35212 () Bool)

(declare-datatypes ((V!34497 0))(
  ( (V!34498 (val!11118 Int)) )
))
(declare-datatypes ((ValueCell!10586 0))(
  ( (ValueCellFull!10586 (v!13674 V!34497)) (EmptyCell!10586) )
))
(declare-datatypes ((array!60344 0))(
  ( (array!60345 (arr!29031 (Array (_ BitVec 32) ValueCell!10586)) (size!29511 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60344)

(declare-fun mapDefault!35212 () ValueCell!10586)

(assert (=> b!972263 (= condMapEmpty!35212 (= (arr!29031 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10586)) mapDefault!35212)))))

(declare-fun b!972264 () Bool)

(declare-fun res!650506 () Bool)

(declare-fun e!548159 () Bool)

(assert (=> b!972264 (=> (not res!650506) (not e!548159))))

(declare-datatypes ((array!60346 0))(
  ( (array!60347 (arr!29032 (Array (_ BitVec 32) (_ BitVec 64))) (size!29512 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60346)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60346 (_ BitVec 32)) Bool)

(assert (=> b!972264 (= res!650506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!972265 () Bool)

(declare-fun res!650504 () Bool)

(assert (=> b!972265 (=> (not res!650504) (not e!548159))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!972265 (= res!650504 (and (= (size!29511 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29512 _keys!1717) (size!29511 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!972266 () Bool)

(assert (=> b!972266 (= e!548159 false)))

(declare-fun zeroValue!1367 () V!34497)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34497)

(declare-datatypes ((tuple2!14254 0))(
  ( (tuple2!14255 (_1!7138 (_ BitVec 64)) (_2!7138 V!34497)) )
))
(declare-datatypes ((List!20108 0))(
  ( (Nil!20105) (Cons!20104 (h!21272 tuple2!14254) (t!28463 List!20108)) )
))
(declare-datatypes ((ListLongMap!12953 0))(
  ( (ListLongMap!12954 (toList!6492 List!20108)) )
))
(declare-fun lt!432186 () ListLongMap!12953)

(declare-fun getCurrentListMap!3725 (array!60346 array!60344 (_ BitVec 32) (_ BitVec 32) V!34497 V!34497 (_ BitVec 32) Int) ListLongMap!12953)

(assert (=> b!972266 (= lt!432186 (getCurrentListMap!3725 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972267 () Bool)

(declare-fun res!650509 () Bool)

(assert (=> b!972267 (=> (not res!650509) (not e!548159))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!972267 (= res!650509 (validKeyInArray!0 (select (arr!29032 _keys!1717) i!822)))))

(declare-fun mapIsEmpty!35212 () Bool)

(assert (=> mapIsEmpty!35212 mapRes!35212))

(declare-fun b!972268 () Bool)

(declare-fun res!650505 () Bool)

(assert (=> b!972268 (=> (not res!650505) (not e!548159))))

(declare-fun contains!5606 (ListLongMap!12953 (_ BitVec 64)) Bool)

(assert (=> b!972268 (= res!650505 (contains!5606 (getCurrentListMap!3725 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29032 _keys!1717) i!822)))))

(declare-fun res!650510 () Bool)

(assert (=> start!83412 (=> (not res!650510) (not e!548159))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83412 (= res!650510 (validMask!0 mask!2147))))

(assert (=> start!83412 e!548159))

(assert (=> start!83412 true))

(declare-fun array_inv!22513 (array!60344) Bool)

(assert (=> start!83412 (and (array_inv!22513 _values!1425) e!548157)))

(assert (=> start!83412 tp_is_empty!22135))

(assert (=> start!83412 tp!66991))

(declare-fun array_inv!22514 (array!60346) Bool)

(assert (=> start!83412 (array_inv!22514 _keys!1717)))

(declare-fun b!972269 () Bool)

(declare-fun e!548160 () Bool)

(assert (=> b!972269 (= e!548160 tp_is_empty!22135)))

(declare-fun b!972270 () Bool)

(declare-fun res!650508 () Bool)

(assert (=> b!972270 (=> (not res!650508) (not e!548159))))

(assert (=> b!972270 (= res!650508 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29512 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29512 _keys!1717))))))

(declare-fun mapNonEmpty!35212 () Bool)

(declare-fun tp!66990 () Bool)

(assert (=> mapNonEmpty!35212 (= mapRes!35212 (and tp!66990 e!548160))))

(declare-fun mapKey!35212 () (_ BitVec 32))

(declare-fun mapRest!35212 () (Array (_ BitVec 32) ValueCell!10586))

(declare-fun mapValue!35212 () ValueCell!10586)

(assert (=> mapNonEmpty!35212 (= (arr!29031 _values!1425) (store mapRest!35212 mapKey!35212 mapValue!35212))))

(declare-fun b!972271 () Bool)

(declare-fun res!650507 () Bool)

(assert (=> b!972271 (=> (not res!650507) (not e!548159))))

(declare-datatypes ((List!20109 0))(
  ( (Nil!20106) (Cons!20105 (h!21273 (_ BitVec 64)) (t!28464 List!20109)) )
))
(declare-fun arrayNoDuplicates!0 (array!60346 (_ BitVec 32) List!20109) Bool)

(assert (=> b!972271 (= res!650507 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20106))))

(assert (= (and start!83412 res!650510) b!972265))

(assert (= (and b!972265 res!650504) b!972264))

(assert (= (and b!972264 res!650506) b!972271))

(assert (= (and b!972271 res!650507) b!972270))

(assert (= (and b!972270 res!650508) b!972267))

(assert (= (and b!972267 res!650509) b!972268))

(assert (= (and b!972268 res!650505) b!972266))

(assert (= (and b!972263 condMapEmpty!35212) mapIsEmpty!35212))

(assert (= (and b!972263 (not condMapEmpty!35212)) mapNonEmpty!35212))

(get-info :version)

(assert (= (and mapNonEmpty!35212 ((_ is ValueCellFull!10586) mapValue!35212)) b!972269))

(assert (= (and b!972263 ((_ is ValueCellFull!10586) mapDefault!35212)) b!972262))

(assert (= start!83412 b!972263))

(declare-fun m!900131 () Bool)

(assert (=> b!972267 m!900131))

(assert (=> b!972267 m!900131))

(declare-fun m!900133 () Bool)

(assert (=> b!972267 m!900133))

(declare-fun m!900135 () Bool)

(assert (=> b!972268 m!900135))

(assert (=> b!972268 m!900131))

(assert (=> b!972268 m!900135))

(assert (=> b!972268 m!900131))

(declare-fun m!900137 () Bool)

(assert (=> b!972268 m!900137))

(declare-fun m!900139 () Bool)

(assert (=> b!972271 m!900139))

(declare-fun m!900141 () Bool)

(assert (=> mapNonEmpty!35212 m!900141))

(declare-fun m!900143 () Bool)

(assert (=> b!972264 m!900143))

(declare-fun m!900145 () Bool)

(assert (=> start!83412 m!900145))

(declare-fun m!900147 () Bool)

(assert (=> start!83412 m!900147))

(declare-fun m!900149 () Bool)

(assert (=> start!83412 m!900149))

(declare-fun m!900151 () Bool)

(assert (=> b!972266 m!900151))

(check-sat (not b_next!19237) b_and!30735 (not mapNonEmpty!35212) tp_is_empty!22135 (not start!83412) (not b!972267) (not b!972264) (not b!972268) (not b!972271) (not b!972266))
(check-sat b_and!30735 (not b_next!19237))
