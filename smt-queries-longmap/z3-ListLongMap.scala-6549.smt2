; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83180 () Bool)

(assert start!83180)

(declare-fun b_free!19173 () Bool)

(declare-fun b_next!19173 () Bool)

(assert (=> start!83180 (= b_free!19173 (not b_next!19173))))

(declare-fun tp!66797 () Bool)

(declare-fun b_and!30661 () Bool)

(assert (=> start!83180 (= tp!66797 b_and!30661)))

(declare-fun b!970439 () Bool)

(declare-fun res!649533 () Bool)

(declare-fun e!547095 () Bool)

(assert (=> b!970439 (=> (not res!649533) (not e!547095))))

(declare-datatypes ((array!60197 0))(
  ( (array!60198 (arr!28962 (Array (_ BitVec 32) (_ BitVec 64))) (size!29441 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60197)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60197 (_ BitVec 32)) Bool)

(assert (=> b!970439 (= res!649533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!970440 () Bool)

(declare-fun e!547098 () Bool)

(declare-fun e!547096 () Bool)

(declare-fun mapRes!35116 () Bool)

(assert (=> b!970440 (= e!547098 (and e!547096 mapRes!35116))))

(declare-fun condMapEmpty!35116 () Bool)

(declare-datatypes ((V!34411 0))(
  ( (V!34412 (val!11086 Int)) )
))
(declare-datatypes ((ValueCell!10554 0))(
  ( (ValueCellFull!10554 (v!13645 V!34411)) (EmptyCell!10554) )
))
(declare-datatypes ((array!60199 0))(
  ( (array!60200 (arr!28963 (Array (_ BitVec 32) ValueCell!10554)) (size!29442 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60199)

(declare-fun mapDefault!35116 () ValueCell!10554)

(assert (=> b!970440 (= condMapEmpty!35116 (= (arr!28963 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10554)) mapDefault!35116)))))

(declare-fun b!970441 () Bool)

(declare-fun res!649530 () Bool)

(assert (=> b!970441 (=> (not res!649530) (not e!547095))))

(declare-datatypes ((List!20073 0))(
  ( (Nil!20070) (Cons!20069 (h!21231 (_ BitVec 64)) (t!28436 List!20073)) )
))
(declare-fun arrayNoDuplicates!0 (array!60197 (_ BitVec 32) List!20073) Bool)

(assert (=> b!970441 (= res!649530 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20070))))

(declare-fun b!970442 () Bool)

(declare-fun res!649532 () Bool)

(assert (=> b!970442 (=> (not res!649532) (not e!547095))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!970442 (= res!649532 (validKeyInArray!0 (select (arr!28962 _keys!1717) i!822)))))

(declare-fun res!649528 () Bool)

(assert (=> start!83180 (=> (not res!649528) (not e!547095))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83180 (= res!649528 (validMask!0 mask!2147))))

(assert (=> start!83180 e!547095))

(assert (=> start!83180 true))

(declare-fun array_inv!22419 (array!60199) Bool)

(assert (=> start!83180 (and (array_inv!22419 _values!1425) e!547098)))

(declare-fun tp_is_empty!22071 () Bool)

(assert (=> start!83180 tp_is_empty!22071))

(assert (=> start!83180 tp!66797))

(declare-fun array_inv!22420 (array!60197) Bool)

(assert (=> start!83180 (array_inv!22420 _keys!1717)))

(declare-fun mapIsEmpty!35116 () Bool)

(assert (=> mapIsEmpty!35116 mapRes!35116))

(declare-fun b!970443 () Bool)

(assert (=> b!970443 (= e!547095 false)))

(declare-fun zeroValue!1367 () V!34411)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34411)

(declare-fun lt!431738 () Bool)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14204 0))(
  ( (tuple2!14205 (_1!7113 (_ BitVec 64)) (_2!7113 V!34411)) )
))
(declare-datatypes ((List!20074 0))(
  ( (Nil!20071) (Cons!20070 (h!21232 tuple2!14204) (t!28437 List!20074)) )
))
(declare-datatypes ((ListLongMap!12901 0))(
  ( (ListLongMap!12902 (toList!6466 List!20074)) )
))
(declare-fun contains!5570 (ListLongMap!12901 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3699 (array!60197 array!60199 (_ BitVec 32) (_ BitVec 32) V!34411 V!34411 (_ BitVec 32) Int) ListLongMap!12901)

(assert (=> b!970443 (= lt!431738 (contains!5570 (getCurrentListMap!3699 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28962 _keys!1717) i!822)))))

(declare-fun b!970444 () Bool)

(declare-fun res!649529 () Bool)

(assert (=> b!970444 (=> (not res!649529) (not e!547095))))

(assert (=> b!970444 (= res!649529 (and (= (size!29442 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29441 _keys!1717) (size!29442 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!35116 () Bool)

(declare-fun tp!66798 () Bool)

(declare-fun e!547099 () Bool)

(assert (=> mapNonEmpty!35116 (= mapRes!35116 (and tp!66798 e!547099))))

(declare-fun mapKey!35116 () (_ BitVec 32))

(declare-fun mapRest!35116 () (Array (_ BitVec 32) ValueCell!10554))

(declare-fun mapValue!35116 () ValueCell!10554)

(assert (=> mapNonEmpty!35116 (= (arr!28963 _values!1425) (store mapRest!35116 mapKey!35116 mapValue!35116))))

(declare-fun b!970445 () Bool)

(assert (=> b!970445 (= e!547096 tp_is_empty!22071)))

(declare-fun b!970446 () Bool)

(declare-fun res!649531 () Bool)

(assert (=> b!970446 (=> (not res!649531) (not e!547095))))

(assert (=> b!970446 (= res!649531 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29441 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29441 _keys!1717))))))

(declare-fun b!970447 () Bool)

(assert (=> b!970447 (= e!547099 tp_is_empty!22071)))

(assert (= (and start!83180 res!649528) b!970444))

(assert (= (and b!970444 res!649529) b!970439))

(assert (= (and b!970439 res!649533) b!970441))

(assert (= (and b!970441 res!649530) b!970446))

(assert (= (and b!970446 res!649531) b!970442))

(assert (= (and b!970442 res!649532) b!970443))

(assert (= (and b!970440 condMapEmpty!35116) mapIsEmpty!35116))

(assert (= (and b!970440 (not condMapEmpty!35116)) mapNonEmpty!35116))

(get-info :version)

(assert (= (and mapNonEmpty!35116 ((_ is ValueCellFull!10554) mapValue!35116)) b!970447))

(assert (= (and b!970440 ((_ is ValueCellFull!10554) mapDefault!35116)) b!970445))

(assert (= start!83180 b!970440))

(declare-fun m!898167 () Bool)

(assert (=> b!970443 m!898167))

(declare-fun m!898169 () Bool)

(assert (=> b!970443 m!898169))

(assert (=> b!970443 m!898167))

(assert (=> b!970443 m!898169))

(declare-fun m!898171 () Bool)

(assert (=> b!970443 m!898171))

(assert (=> b!970442 m!898169))

(assert (=> b!970442 m!898169))

(declare-fun m!898173 () Bool)

(assert (=> b!970442 m!898173))

(declare-fun m!898175 () Bool)

(assert (=> start!83180 m!898175))

(declare-fun m!898177 () Bool)

(assert (=> start!83180 m!898177))

(declare-fun m!898179 () Bool)

(assert (=> start!83180 m!898179))

(declare-fun m!898181 () Bool)

(assert (=> b!970441 m!898181))

(declare-fun m!898183 () Bool)

(assert (=> b!970439 m!898183))

(declare-fun m!898185 () Bool)

(assert (=> mapNonEmpty!35116 m!898185))

(check-sat (not b!970443) (not b!970442) (not b!970441) (not start!83180) (not b_next!19173) (not b!970439) tp_is_empty!22071 b_and!30661 (not mapNonEmpty!35116))
(check-sat b_and!30661 (not b_next!19173))
