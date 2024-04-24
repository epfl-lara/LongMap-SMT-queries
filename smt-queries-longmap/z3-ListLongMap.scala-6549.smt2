; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83346 () Bool)

(assert start!83346)

(declare-fun b_free!19171 () Bool)

(declare-fun b_next!19171 () Bool)

(assert (=> start!83346 (= b_free!19171 (not b_next!19171))))

(declare-fun tp!66792 () Bool)

(declare-fun b_and!30669 () Bool)

(assert (=> start!83346 (= tp!66792 b_and!30669)))

(declare-fun b!971315 () Bool)

(declare-fun e!547663 () Bool)

(assert (=> b!971315 (= e!547663 false)))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun lt!432096 () Bool)

(declare-datatypes ((V!34409 0))(
  ( (V!34410 (val!11085 Int)) )
))
(declare-datatypes ((ValueCell!10553 0))(
  ( (ValueCellFull!10553 (v!13641 V!34409)) (EmptyCell!10553) )
))
(declare-datatypes ((array!60216 0))(
  ( (array!60217 (arr!28967 (Array (_ BitVec 32) ValueCell!10553)) (size!29447 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60216)

(declare-fun zeroValue!1367 () V!34409)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34409)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60218 0))(
  ( (array!60219 (arr!28968 (Array (_ BitVec 32) (_ BitVec 64))) (size!29448 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60218)

(declare-datatypes ((tuple2!14206 0))(
  ( (tuple2!14207 (_1!7114 (_ BitVec 64)) (_2!7114 V!34409)) )
))
(declare-datatypes ((List!20062 0))(
  ( (Nil!20059) (Cons!20058 (h!21226 tuple2!14206) (t!28417 List!20062)) )
))
(declare-datatypes ((ListLongMap!12905 0))(
  ( (ListLongMap!12906 (toList!6468 List!20062)) )
))
(declare-fun contains!5583 (ListLongMap!12905 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3701 (array!60218 array!60216 (_ BitVec 32) (_ BitVec 32) V!34409 V!34409 (_ BitVec 32) Int) ListLongMap!12905)

(assert (=> b!971315 (= lt!432096 (contains!5583 (getCurrentListMap!3701 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28968 _keys!1717) i!822)))))

(declare-fun res!649855 () Bool)

(assert (=> start!83346 (=> (not res!649855) (not e!547663))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83346 (= res!649855 (validMask!0 mask!2147))))

(assert (=> start!83346 e!547663))

(assert (=> start!83346 true))

(declare-fun e!547666 () Bool)

(declare-fun array_inv!22473 (array!60216) Bool)

(assert (=> start!83346 (and (array_inv!22473 _values!1425) e!547666)))

(declare-fun tp_is_empty!22069 () Bool)

(assert (=> start!83346 tp_is_empty!22069))

(assert (=> start!83346 tp!66792))

(declare-fun array_inv!22474 (array!60218) Bool)

(assert (=> start!83346 (array_inv!22474 _keys!1717)))

(declare-fun b!971316 () Bool)

(declare-fun e!547662 () Bool)

(declare-fun mapRes!35113 () Bool)

(assert (=> b!971316 (= e!547666 (and e!547662 mapRes!35113))))

(declare-fun condMapEmpty!35113 () Bool)

(declare-fun mapDefault!35113 () ValueCell!10553)

(assert (=> b!971316 (= condMapEmpty!35113 (= (arr!28967 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10553)) mapDefault!35113)))))

(declare-fun b!971317 () Bool)

(declare-fun res!649856 () Bool)

(assert (=> b!971317 (=> (not res!649856) (not e!547663))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60218 (_ BitVec 32)) Bool)

(assert (=> b!971317 (= res!649856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!971318 () Bool)

(declare-fun e!547665 () Bool)

(assert (=> b!971318 (= e!547665 tp_is_empty!22069)))

(declare-fun b!971319 () Bool)

(declare-fun res!649858 () Bool)

(assert (=> b!971319 (=> (not res!649858) (not e!547663))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!971319 (= res!649858 (validKeyInArray!0 (select (arr!28968 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35113 () Bool)

(declare-fun tp!66793 () Bool)

(assert (=> mapNonEmpty!35113 (= mapRes!35113 (and tp!66793 e!547665))))

(declare-fun mapRest!35113 () (Array (_ BitVec 32) ValueCell!10553))

(declare-fun mapValue!35113 () ValueCell!10553)

(declare-fun mapKey!35113 () (_ BitVec 32))

(assert (=> mapNonEmpty!35113 (= (arr!28967 _values!1425) (store mapRest!35113 mapKey!35113 mapValue!35113))))

(declare-fun b!971320 () Bool)

(declare-fun res!649859 () Bool)

(assert (=> b!971320 (=> (not res!649859) (not e!547663))))

(declare-datatypes ((List!20063 0))(
  ( (Nil!20060) (Cons!20059 (h!21227 (_ BitVec 64)) (t!28418 List!20063)) )
))
(declare-fun arrayNoDuplicates!0 (array!60218 (_ BitVec 32) List!20063) Bool)

(assert (=> b!971320 (= res!649859 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20060))))

(declare-fun b!971321 () Bool)

(assert (=> b!971321 (= e!547662 tp_is_empty!22069)))

(declare-fun mapIsEmpty!35113 () Bool)

(assert (=> mapIsEmpty!35113 mapRes!35113))

(declare-fun b!971322 () Bool)

(declare-fun res!649854 () Bool)

(assert (=> b!971322 (=> (not res!649854) (not e!547663))))

(assert (=> b!971322 (= res!649854 (and (= (size!29447 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29448 _keys!1717) (size!29447 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!971323 () Bool)

(declare-fun res!649857 () Bool)

(assert (=> b!971323 (=> (not res!649857) (not e!547663))))

(assert (=> b!971323 (= res!649857 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29448 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29448 _keys!1717))))))

(assert (= (and start!83346 res!649855) b!971322))

(assert (= (and b!971322 res!649854) b!971317))

(assert (= (and b!971317 res!649856) b!971320))

(assert (= (and b!971320 res!649859) b!971323))

(assert (= (and b!971323 res!649857) b!971319))

(assert (= (and b!971319 res!649858) b!971315))

(assert (= (and b!971316 condMapEmpty!35113) mapIsEmpty!35113))

(assert (= (and b!971316 (not condMapEmpty!35113)) mapNonEmpty!35113))

(get-info :version)

(assert (= (and mapNonEmpty!35113 ((_ is ValueCellFull!10553) mapValue!35113)) b!971318))

(assert (= (and b!971316 ((_ is ValueCellFull!10553) mapDefault!35113)) b!971321))

(assert (= start!83346 b!971316))

(declare-fun m!899441 () Bool)

(assert (=> b!971320 m!899441))

(declare-fun m!899443 () Bool)

(assert (=> b!971319 m!899443))

(assert (=> b!971319 m!899443))

(declare-fun m!899445 () Bool)

(assert (=> b!971319 m!899445))

(declare-fun m!899447 () Bool)

(assert (=> start!83346 m!899447))

(declare-fun m!899449 () Bool)

(assert (=> start!83346 m!899449))

(declare-fun m!899451 () Bool)

(assert (=> start!83346 m!899451))

(declare-fun m!899453 () Bool)

(assert (=> mapNonEmpty!35113 m!899453))

(declare-fun m!899455 () Bool)

(assert (=> b!971317 m!899455))

(declare-fun m!899457 () Bool)

(assert (=> b!971315 m!899457))

(assert (=> b!971315 m!899443))

(assert (=> b!971315 m!899457))

(assert (=> b!971315 m!899443))

(declare-fun m!899459 () Bool)

(assert (=> b!971315 m!899459))

(check-sat (not b!971319) tp_is_empty!22069 (not b!971317) (not b_next!19171) (not b!971320) (not mapNonEmpty!35113) (not b!971315) b_and!30669 (not start!83346))
(check-sat b_and!30669 (not b_next!19171))
