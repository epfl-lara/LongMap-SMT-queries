; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83102 () Bool)

(assert start!83102)

(declare-fun b!969377 () Bool)

(declare-fun e!546514 () Bool)

(declare-fun tp_is_empty!21993 () Bool)

(assert (=> b!969377 (= e!546514 tp_is_empty!21993)))

(declare-fun b!969378 () Bool)

(declare-fun e!546513 () Bool)

(declare-fun e!546511 () Bool)

(declare-fun mapRes!34999 () Bool)

(assert (=> b!969378 (= e!546513 (and e!546511 mapRes!34999))))

(declare-fun condMapEmpty!34999 () Bool)

(declare-datatypes ((V!34307 0))(
  ( (V!34308 (val!11047 Int)) )
))
(declare-datatypes ((ValueCell!10515 0))(
  ( (ValueCellFull!10515 (v!13606 V!34307)) (EmptyCell!10515) )
))
(declare-datatypes ((array!60051 0))(
  ( (array!60052 (arr!28889 (Array (_ BitVec 32) ValueCell!10515)) (size!29368 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60051)

(declare-fun mapDefault!34999 () ValueCell!10515)

(assert (=> b!969378 (= condMapEmpty!34999 (= (arr!28889 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10515)) mapDefault!34999)))))

(declare-fun mapNonEmpty!34999 () Bool)

(declare-fun tp!66567 () Bool)

(assert (=> mapNonEmpty!34999 (= mapRes!34999 (and tp!66567 e!546514))))

(declare-fun mapKey!34999 () (_ BitVec 32))

(declare-fun mapValue!34999 () ValueCell!10515)

(declare-fun mapRest!34999 () (Array (_ BitVec 32) ValueCell!10515))

(assert (=> mapNonEmpty!34999 (= (arr!28889 _values!1425) (store mapRest!34999 mapKey!34999 mapValue!34999))))

(declare-fun b!969379 () Bool)

(declare-fun res!648821 () Bool)

(declare-fun e!546510 () Bool)

(assert (=> b!969379 (=> (not res!648821) (not e!546510))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60053 0))(
  ( (array!60054 (arr!28890 (Array (_ BitVec 32) (_ BitVec 64))) (size!29369 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60053)

(assert (=> b!969379 (= res!648821 (and (= (size!29368 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29369 _keys!1717) (size!29368 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!969380 () Bool)

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!969380 (= e!546510 (or (bvslt from!2118 #b00000000000000000000000000000000) (bvsgt from!2118 (size!29369 _keys!1717))))))

(declare-fun b!969381 () Bool)

(declare-fun res!648817 () Bool)

(assert (=> b!969381 (=> (not res!648817) (not e!546510))))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!969381 (= res!648817 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29369 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29369 _keys!1717))))))

(declare-fun b!969382 () Bool)

(assert (=> b!969382 (= e!546511 tp_is_empty!21993)))

(declare-fun b!969383 () Bool)

(declare-fun res!648820 () Bool)

(assert (=> b!969383 (=> (not res!648820) (not e!546510))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60053 (_ BitVec 32)) Bool)

(assert (=> b!969383 (= res!648820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapIsEmpty!34999 () Bool)

(assert (=> mapIsEmpty!34999 mapRes!34999))

(declare-fun res!648818 () Bool)

(assert (=> start!83102 (=> (not res!648818) (not e!546510))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83102 (= res!648818 (validMask!0 mask!2147))))

(assert (=> start!83102 e!546510))

(assert (=> start!83102 true))

(declare-fun array_inv!22365 (array!60051) Bool)

(assert (=> start!83102 (and (array_inv!22365 _values!1425) e!546513)))

(declare-fun array_inv!22366 (array!60053) Bool)

(assert (=> start!83102 (array_inv!22366 _keys!1717)))

(declare-fun b!969384 () Bool)

(declare-fun res!648822 () Bool)

(assert (=> b!969384 (=> (not res!648822) (not e!546510))))

(declare-datatypes ((List!20025 0))(
  ( (Nil!20022) (Cons!20021 (h!21183 (_ BitVec 64)) (t!28388 List!20025)) )
))
(declare-fun arrayNoDuplicates!0 (array!60053 (_ BitVec 32) List!20025) Bool)

(assert (=> b!969384 (= res!648822 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20022))))

(declare-fun b!969385 () Bool)

(declare-fun res!648819 () Bool)

(assert (=> b!969385 (=> (not res!648819) (not e!546510))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!969385 (= res!648819 (validKeyInArray!0 (select (arr!28890 _keys!1717) i!822)))))

(assert (= (and start!83102 res!648818) b!969379))

(assert (= (and b!969379 res!648821) b!969383))

(assert (= (and b!969383 res!648820) b!969384))

(assert (= (and b!969384 res!648822) b!969381))

(assert (= (and b!969381 res!648817) b!969385))

(assert (= (and b!969385 res!648819) b!969380))

(assert (= (and b!969378 condMapEmpty!34999) mapIsEmpty!34999))

(assert (= (and b!969378 (not condMapEmpty!34999)) mapNonEmpty!34999))

(get-info :version)

(assert (= (and mapNonEmpty!34999 ((_ is ValueCellFull!10515) mapValue!34999)) b!969377))

(assert (= (and b!969378 ((_ is ValueCellFull!10515) mapDefault!34999)) b!969382))

(assert (= start!83102 b!969378))

(declare-fun m!897395 () Bool)

(assert (=> b!969383 m!897395))

(declare-fun m!897397 () Bool)

(assert (=> b!969384 m!897397))

(declare-fun m!897399 () Bool)

(assert (=> mapNonEmpty!34999 m!897399))

(declare-fun m!897401 () Bool)

(assert (=> start!83102 m!897401))

(declare-fun m!897403 () Bool)

(assert (=> start!83102 m!897403))

(declare-fun m!897405 () Bool)

(assert (=> start!83102 m!897405))

(declare-fun m!897407 () Bool)

(assert (=> b!969385 m!897407))

(assert (=> b!969385 m!897407))

(declare-fun m!897409 () Bool)

(assert (=> b!969385 m!897409))

(check-sat (not b!969384) (not b!969383) (not mapNonEmpty!34999) (not start!83102) (not b!969385) tp_is_empty!21993)
(check-sat)
