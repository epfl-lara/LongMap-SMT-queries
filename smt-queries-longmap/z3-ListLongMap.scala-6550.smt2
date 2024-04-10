; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83186 () Bool)

(assert start!83186)

(declare-fun b_free!19179 () Bool)

(declare-fun b_next!19179 () Bool)

(assert (=> start!83186 (= b_free!19179 (not b_next!19179))))

(declare-fun tp!66815 () Bool)

(declare-fun b_and!30667 () Bool)

(assert (=> start!83186 (= tp!66815 b_and!30667)))

(declare-fun b!970520 () Bool)

(declare-fun res!649582 () Bool)

(declare-fun e!547144 () Bool)

(assert (=> b!970520 (=> (not res!649582) (not e!547144))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34419 0))(
  ( (V!34420 (val!11089 Int)) )
))
(declare-datatypes ((ValueCell!10557 0))(
  ( (ValueCellFull!10557 (v!13648 V!34419)) (EmptyCell!10557) )
))
(declare-datatypes ((array!60209 0))(
  ( (array!60210 (arr!28968 (Array (_ BitVec 32) ValueCell!10557)) (size!29447 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60209)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60211 0))(
  ( (array!60212 (arr!28969 (Array (_ BitVec 32) (_ BitVec 64))) (size!29448 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60211)

(assert (=> b!970520 (= res!649582 (and (= (size!29447 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29448 _keys!1717) (size!29447 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!970521 () Bool)

(declare-fun res!649586 () Bool)

(assert (=> b!970521 (=> (not res!649586) (not e!547144))))

(declare-datatypes ((List!20077 0))(
  ( (Nil!20074) (Cons!20073 (h!21235 (_ BitVec 64)) (t!28440 List!20077)) )
))
(declare-fun arrayNoDuplicates!0 (array!60211 (_ BitVec 32) List!20077) Bool)

(assert (=> b!970521 (= res!649586 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20074))))

(declare-fun b!970522 () Bool)

(declare-fun res!649584 () Bool)

(assert (=> b!970522 (=> (not res!649584) (not e!547144))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!970522 (= res!649584 (validKeyInArray!0 (select (arr!28969 _keys!1717) i!822)))))

(declare-fun b!970523 () Bool)

(declare-fun res!649585 () Bool)

(assert (=> b!970523 (=> (not res!649585) (not e!547144))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!970523 (= res!649585 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29448 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29448 _keys!1717))))))

(declare-fun b!970524 () Bool)

(assert (=> b!970524 (= e!547144 false)))

(declare-fun lt!431747 () Bool)

(declare-fun zeroValue!1367 () V!34419)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34419)

(declare-datatypes ((tuple2!14208 0))(
  ( (tuple2!14209 (_1!7115 (_ BitVec 64)) (_2!7115 V!34419)) )
))
(declare-datatypes ((List!20078 0))(
  ( (Nil!20075) (Cons!20074 (h!21236 tuple2!14208) (t!28441 List!20078)) )
))
(declare-datatypes ((ListLongMap!12905 0))(
  ( (ListLongMap!12906 (toList!6468 List!20078)) )
))
(declare-fun contains!5572 (ListLongMap!12905 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3701 (array!60211 array!60209 (_ BitVec 32) (_ BitVec 32) V!34419 V!34419 (_ BitVec 32) Int) ListLongMap!12905)

(assert (=> b!970524 (= lt!431747 (contains!5572 (getCurrentListMap!3701 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28969 _keys!1717) i!822)))))

(declare-fun b!970525 () Bool)

(declare-fun e!547143 () Bool)

(declare-fun tp_is_empty!22077 () Bool)

(assert (=> b!970525 (= e!547143 tp_is_empty!22077)))

(declare-fun b!970526 () Bool)

(declare-fun e!547141 () Bool)

(declare-fun e!547140 () Bool)

(declare-fun mapRes!35125 () Bool)

(assert (=> b!970526 (= e!547141 (and e!547140 mapRes!35125))))

(declare-fun condMapEmpty!35125 () Bool)

(declare-fun mapDefault!35125 () ValueCell!10557)

(assert (=> b!970526 (= condMapEmpty!35125 (= (arr!28968 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10557)) mapDefault!35125)))))

(declare-fun b!970527 () Bool)

(declare-fun res!649587 () Bool)

(assert (=> b!970527 (=> (not res!649587) (not e!547144))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60211 (_ BitVec 32)) Bool)

(assert (=> b!970527 (= res!649587 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun res!649583 () Bool)

(assert (=> start!83186 (=> (not res!649583) (not e!547144))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83186 (= res!649583 (validMask!0 mask!2147))))

(assert (=> start!83186 e!547144))

(assert (=> start!83186 true))

(declare-fun array_inv!22421 (array!60209) Bool)

(assert (=> start!83186 (and (array_inv!22421 _values!1425) e!547141)))

(assert (=> start!83186 tp_is_empty!22077))

(assert (=> start!83186 tp!66815))

(declare-fun array_inv!22422 (array!60211) Bool)

(assert (=> start!83186 (array_inv!22422 _keys!1717)))

(declare-fun mapNonEmpty!35125 () Bool)

(declare-fun tp!66816 () Bool)

(assert (=> mapNonEmpty!35125 (= mapRes!35125 (and tp!66816 e!547143))))

(declare-fun mapValue!35125 () ValueCell!10557)

(declare-fun mapKey!35125 () (_ BitVec 32))

(declare-fun mapRest!35125 () (Array (_ BitVec 32) ValueCell!10557))

(assert (=> mapNonEmpty!35125 (= (arr!28968 _values!1425) (store mapRest!35125 mapKey!35125 mapValue!35125))))

(declare-fun b!970528 () Bool)

(assert (=> b!970528 (= e!547140 tp_is_empty!22077)))

(declare-fun mapIsEmpty!35125 () Bool)

(assert (=> mapIsEmpty!35125 mapRes!35125))

(assert (= (and start!83186 res!649583) b!970520))

(assert (= (and b!970520 res!649582) b!970527))

(assert (= (and b!970527 res!649587) b!970521))

(assert (= (and b!970521 res!649586) b!970523))

(assert (= (and b!970523 res!649585) b!970522))

(assert (= (and b!970522 res!649584) b!970524))

(assert (= (and b!970526 condMapEmpty!35125) mapIsEmpty!35125))

(assert (= (and b!970526 (not condMapEmpty!35125)) mapNonEmpty!35125))

(get-info :version)

(assert (= (and mapNonEmpty!35125 ((_ is ValueCellFull!10557) mapValue!35125)) b!970525))

(assert (= (and b!970526 ((_ is ValueCellFull!10557) mapDefault!35125)) b!970528))

(assert (= start!83186 b!970526))

(declare-fun m!898227 () Bool)

(assert (=> b!970524 m!898227))

(declare-fun m!898229 () Bool)

(assert (=> b!970524 m!898229))

(assert (=> b!970524 m!898227))

(assert (=> b!970524 m!898229))

(declare-fun m!898231 () Bool)

(assert (=> b!970524 m!898231))

(declare-fun m!898233 () Bool)

(assert (=> b!970527 m!898233))

(declare-fun m!898235 () Bool)

(assert (=> b!970521 m!898235))

(assert (=> b!970522 m!898229))

(assert (=> b!970522 m!898229))

(declare-fun m!898237 () Bool)

(assert (=> b!970522 m!898237))

(declare-fun m!898239 () Bool)

(assert (=> mapNonEmpty!35125 m!898239))

(declare-fun m!898241 () Bool)

(assert (=> start!83186 m!898241))

(declare-fun m!898243 () Bool)

(assert (=> start!83186 m!898243))

(declare-fun m!898245 () Bool)

(assert (=> start!83186 m!898245))

(check-sat b_and!30667 (not b_next!19179) (not b!970522) (not mapNonEmpty!35125) (not start!83186) (not b!970527) (not b!970521) tp_is_empty!22077 (not b!970524))
(check-sat b_and!30667 (not b_next!19179))
