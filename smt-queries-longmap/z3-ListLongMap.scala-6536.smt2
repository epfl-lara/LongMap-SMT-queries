; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83268 () Bool)

(assert start!83268)

(declare-fun mapNonEmpty!34996 () Bool)

(declare-fun mapRes!34996 () Bool)

(declare-fun tp!66565 () Bool)

(declare-fun e!547078 () Bool)

(assert (=> mapNonEmpty!34996 (= mapRes!34996 (and tp!66565 e!547078))))

(declare-datatypes ((V!34305 0))(
  ( (V!34306 (val!11046 Int)) )
))
(declare-datatypes ((ValueCell!10514 0))(
  ( (ValueCellFull!10514 (v!13602 V!34305)) (EmptyCell!10514) )
))
(declare-datatypes ((array!60062 0))(
  ( (array!60063 (arr!28890 (Array (_ BitVec 32) ValueCell!10514)) (size!29370 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60062)

(declare-fun mapRest!34996 () (Array (_ BitVec 32) ValueCell!10514))

(declare-fun mapKey!34996 () (_ BitVec 32))

(declare-fun mapValue!34996 () ValueCell!10514)

(assert (=> mapNonEmpty!34996 (= (arr!28890 _values!1425) (store mapRest!34996 mapKey!34996 mapValue!34996))))

(declare-fun b!970253 () Bool)

(declare-fun res!649144 () Bool)

(declare-fun e!547077 () Bool)

(assert (=> b!970253 (=> (not res!649144) (not e!547077))))

(declare-datatypes ((array!60064 0))(
  ( (array!60065 (arr!28891 (Array (_ BitVec 32) (_ BitVec 64))) (size!29371 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60064)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!970253 (= res!649144 (validKeyInArray!0 (select (arr!28891 _keys!1717) i!822)))))

(declare-fun b!970254 () Bool)

(declare-fun tp_is_empty!21991 () Bool)

(assert (=> b!970254 (= e!547078 tp_is_empty!21991)))

(declare-fun mapIsEmpty!34996 () Bool)

(assert (=> mapIsEmpty!34996 mapRes!34996))

(declare-fun b!970255 () Bool)

(declare-fun res!649148 () Bool)

(assert (=> b!970255 (=> (not res!649148) (not e!547077))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60064 (_ BitVec 32)) Bool)

(assert (=> b!970255 (= res!649148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!970256 () Bool)

(declare-fun e!547081 () Bool)

(assert (=> b!970256 (= e!547081 tp_is_empty!21991)))

(declare-fun res!649146 () Bool)

(assert (=> start!83268 (=> (not res!649146) (not e!547077))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83268 (= res!649146 (validMask!0 mask!2147))))

(assert (=> start!83268 e!547077))

(assert (=> start!83268 true))

(declare-fun e!547079 () Bool)

(declare-fun array_inv!22419 (array!60062) Bool)

(assert (=> start!83268 (and (array_inv!22419 _values!1425) e!547079)))

(declare-fun array_inv!22420 (array!60064) Bool)

(assert (=> start!83268 (array_inv!22420 _keys!1717)))

(declare-fun b!970257 () Bool)

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!970257 (= e!547077 (or (bvslt from!2118 #b00000000000000000000000000000000) (bvsgt from!2118 (size!29371 _keys!1717))))))

(declare-fun b!970258 () Bool)

(declare-fun res!649145 () Bool)

(assert (=> b!970258 (=> (not res!649145) (not e!547077))))

(assert (=> b!970258 (= res!649145 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29371 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29371 _keys!1717))))))

(declare-fun b!970259 () Bool)

(assert (=> b!970259 (= e!547079 (and e!547081 mapRes!34996))))

(declare-fun condMapEmpty!34996 () Bool)

(declare-fun mapDefault!34996 () ValueCell!10514)

(assert (=> b!970259 (= condMapEmpty!34996 (= (arr!28890 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10514)) mapDefault!34996)))))

(declare-fun b!970260 () Bool)

(declare-fun res!649143 () Bool)

(assert (=> b!970260 (=> (not res!649143) (not e!547077))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!970260 (= res!649143 (and (= (size!29370 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29371 _keys!1717) (size!29370 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!970261 () Bool)

(declare-fun res!649147 () Bool)

(assert (=> b!970261 (=> (not res!649147) (not e!547077))))

(declare-datatypes ((List!20015 0))(
  ( (Nil!20012) (Cons!20011 (h!21179 (_ BitVec 64)) (t!28370 List!20015)) )
))
(declare-fun arrayNoDuplicates!0 (array!60064 (_ BitVec 32) List!20015) Bool)

(assert (=> b!970261 (= res!649147 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20012))))

(assert (= (and start!83268 res!649146) b!970260))

(assert (= (and b!970260 res!649143) b!970255))

(assert (= (and b!970255 res!649148) b!970261))

(assert (= (and b!970261 res!649147) b!970258))

(assert (= (and b!970258 res!649145) b!970253))

(assert (= (and b!970253 res!649144) b!970257))

(assert (= (and b!970259 condMapEmpty!34996) mapIsEmpty!34996))

(assert (= (and b!970259 (not condMapEmpty!34996)) mapNonEmpty!34996))

(get-info :version)

(assert (= (and mapNonEmpty!34996 ((_ is ValueCellFull!10514) mapValue!34996)) b!970254))

(assert (= (and b!970259 ((_ is ValueCellFull!10514) mapDefault!34996)) b!970256))

(assert (= start!83268 b!970259))

(declare-fun m!898673 () Bool)

(assert (=> mapNonEmpty!34996 m!898673))

(declare-fun m!898675 () Bool)

(assert (=> b!970255 m!898675))

(declare-fun m!898677 () Bool)

(assert (=> start!83268 m!898677))

(declare-fun m!898679 () Bool)

(assert (=> start!83268 m!898679))

(declare-fun m!898681 () Bool)

(assert (=> start!83268 m!898681))

(declare-fun m!898683 () Bool)

(assert (=> b!970261 m!898683))

(declare-fun m!898685 () Bool)

(assert (=> b!970253 m!898685))

(assert (=> b!970253 m!898685))

(declare-fun m!898687 () Bool)

(assert (=> b!970253 m!898687))

(check-sat tp_is_empty!21991 (not b!970255) (not b!970253) (not b!970261) (not start!83268) (not mapNonEmpty!34996))
(check-sat)
