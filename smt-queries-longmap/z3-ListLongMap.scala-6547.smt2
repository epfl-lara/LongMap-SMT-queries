; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83168 () Bool)

(assert start!83168)

(declare-fun b_free!19161 () Bool)

(declare-fun b_next!19161 () Bool)

(assert (=> start!83168 (= b_free!19161 (not b_next!19161))))

(declare-fun tp!66762 () Bool)

(declare-fun b_and!30649 () Bool)

(assert (=> start!83168 (= tp!66762 b_and!30649)))

(declare-fun b!970277 () Bool)

(declare-fun res!649424 () Bool)

(declare-fun e!547005 () Bool)

(assert (=> b!970277 (=> (not res!649424) (not e!547005))))

(declare-datatypes ((array!60177 0))(
  ( (array!60178 (arr!28952 (Array (_ BitVec 32) (_ BitVec 64))) (size!29431 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60177)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60177 (_ BitVec 32)) Bool)

(assert (=> b!970277 (= res!649424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun res!649422 () Bool)

(assert (=> start!83168 (=> (not res!649422) (not e!547005))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83168 (= res!649422 (validMask!0 mask!2147))))

(assert (=> start!83168 e!547005))

(assert (=> start!83168 true))

(declare-datatypes ((V!34395 0))(
  ( (V!34396 (val!11080 Int)) )
))
(declare-datatypes ((ValueCell!10548 0))(
  ( (ValueCellFull!10548 (v!13639 V!34395)) (EmptyCell!10548) )
))
(declare-datatypes ((array!60179 0))(
  ( (array!60180 (arr!28953 (Array (_ BitVec 32) ValueCell!10548)) (size!29432 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60179)

(declare-fun e!547009 () Bool)

(declare-fun array_inv!22413 (array!60179) Bool)

(assert (=> start!83168 (and (array_inv!22413 _values!1425) e!547009)))

(declare-fun tp_is_empty!22059 () Bool)

(assert (=> start!83168 tp_is_empty!22059))

(assert (=> start!83168 tp!66762))

(declare-fun array_inv!22414 (array!60177) Bool)

(assert (=> start!83168 (array_inv!22414 _keys!1717)))

(declare-fun b!970278 () Bool)

(assert (=> b!970278 (= e!547005 false)))

(declare-fun zeroValue!1367 () V!34395)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34395)

(declare-fun lt!431720 () Bool)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14198 0))(
  ( (tuple2!14199 (_1!7110 (_ BitVec 64)) (_2!7110 V!34395)) )
))
(declare-datatypes ((List!20068 0))(
  ( (Nil!20065) (Cons!20064 (h!21226 tuple2!14198) (t!28431 List!20068)) )
))
(declare-datatypes ((ListLongMap!12895 0))(
  ( (ListLongMap!12896 (toList!6463 List!20068)) )
))
(declare-fun contains!5567 (ListLongMap!12895 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3696 (array!60177 array!60179 (_ BitVec 32) (_ BitVec 32) V!34395 V!34395 (_ BitVec 32) Int) ListLongMap!12895)

(assert (=> b!970278 (= lt!431720 (contains!5567 (getCurrentListMap!3696 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28952 _keys!1717) i!822)))))

(declare-fun b!970279 () Bool)

(declare-fun res!649423 () Bool)

(assert (=> b!970279 (=> (not res!649423) (not e!547005))))

(declare-datatypes ((List!20069 0))(
  ( (Nil!20066) (Cons!20065 (h!21227 (_ BitVec 64)) (t!28432 List!20069)) )
))
(declare-fun arrayNoDuplicates!0 (array!60177 (_ BitVec 32) List!20069) Bool)

(assert (=> b!970279 (= res!649423 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20066))))

(declare-fun b!970280 () Bool)

(declare-fun res!649420 () Bool)

(assert (=> b!970280 (=> (not res!649420) (not e!547005))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!970280 (= res!649420 (validKeyInArray!0 (select (arr!28952 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35098 () Bool)

(declare-fun mapRes!35098 () Bool)

(declare-fun tp!66761 () Bool)

(declare-fun e!547008 () Bool)

(assert (=> mapNonEmpty!35098 (= mapRes!35098 (and tp!66761 e!547008))))

(declare-fun mapKey!35098 () (_ BitVec 32))

(declare-fun mapRest!35098 () (Array (_ BitVec 32) ValueCell!10548))

(declare-fun mapValue!35098 () ValueCell!10548)

(assert (=> mapNonEmpty!35098 (= (arr!28953 _values!1425) (store mapRest!35098 mapKey!35098 mapValue!35098))))

(declare-fun b!970281 () Bool)

(declare-fun e!547006 () Bool)

(assert (=> b!970281 (= e!547009 (and e!547006 mapRes!35098))))

(declare-fun condMapEmpty!35098 () Bool)

(declare-fun mapDefault!35098 () ValueCell!10548)

(assert (=> b!970281 (= condMapEmpty!35098 (= (arr!28953 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10548)) mapDefault!35098)))))

(declare-fun b!970282 () Bool)

(declare-fun res!649425 () Bool)

(assert (=> b!970282 (=> (not res!649425) (not e!547005))))

(assert (=> b!970282 (= res!649425 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29431 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29431 _keys!1717))))))

(declare-fun b!970283 () Bool)

(declare-fun res!649421 () Bool)

(assert (=> b!970283 (=> (not res!649421) (not e!547005))))

(assert (=> b!970283 (= res!649421 (and (= (size!29432 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29431 _keys!1717) (size!29432 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!35098 () Bool)

(assert (=> mapIsEmpty!35098 mapRes!35098))

(declare-fun b!970284 () Bool)

(assert (=> b!970284 (= e!547006 tp_is_empty!22059)))

(declare-fun b!970285 () Bool)

(assert (=> b!970285 (= e!547008 tp_is_empty!22059)))

(assert (= (and start!83168 res!649422) b!970283))

(assert (= (and b!970283 res!649421) b!970277))

(assert (= (and b!970277 res!649424) b!970279))

(assert (= (and b!970279 res!649423) b!970282))

(assert (= (and b!970282 res!649425) b!970280))

(assert (= (and b!970280 res!649420) b!970278))

(assert (= (and b!970281 condMapEmpty!35098) mapIsEmpty!35098))

(assert (= (and b!970281 (not condMapEmpty!35098)) mapNonEmpty!35098))

(get-info :version)

(assert (= (and mapNonEmpty!35098 ((_ is ValueCellFull!10548) mapValue!35098)) b!970285))

(assert (= (and b!970281 ((_ is ValueCellFull!10548) mapDefault!35098)) b!970284))

(assert (= start!83168 b!970281))

(declare-fun m!898047 () Bool)

(assert (=> start!83168 m!898047))

(declare-fun m!898049 () Bool)

(assert (=> start!83168 m!898049))

(declare-fun m!898051 () Bool)

(assert (=> start!83168 m!898051))

(declare-fun m!898053 () Bool)

(assert (=> mapNonEmpty!35098 m!898053))

(declare-fun m!898055 () Bool)

(assert (=> b!970280 m!898055))

(assert (=> b!970280 m!898055))

(declare-fun m!898057 () Bool)

(assert (=> b!970280 m!898057))

(declare-fun m!898059 () Bool)

(assert (=> b!970277 m!898059))

(declare-fun m!898061 () Bool)

(assert (=> b!970279 m!898061))

(declare-fun m!898063 () Bool)

(assert (=> b!970278 m!898063))

(assert (=> b!970278 m!898055))

(assert (=> b!970278 m!898063))

(assert (=> b!970278 m!898055))

(declare-fun m!898065 () Bool)

(assert (=> b!970278 m!898065))

(check-sat tp_is_empty!22059 (not b!970277) b_and!30649 (not mapNonEmpty!35098) (not b!970280) (not b!970278) (not b!970279) (not start!83168) (not b_next!19161))
(check-sat b_and!30649 (not b_next!19161))
